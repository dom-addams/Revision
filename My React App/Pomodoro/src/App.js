import React, { useState, useRef } from 'react';
import './App.css';
// App uses YARN -- Container/Pipeline will require YARN not NPM
// Get ready with yarn install
// Run with yarn start
// Available at MyIP:3000

function padTime(time){
  return time.toString().padStart(2, '0');
}

export default function App() {
  const [title, setTitle] = useState('Pomodoro App');
  const [timeLeft, setTimeLeft] = useState(10); //(25 * 60)
  const [isRunning, setIsRunning] = useState(false);  
  const intervalRef = useRef(null); // Interval for stopping

  function startTimer(){
    if (intervalRef.current !== null) return; // prevent accidental restart of timer

    setTitle("Focus Timer Strarted");        // Title    
    setIsRunning(true);                      // isRunning state
    intervalRef.current = setInterval(() => {
      setTimeLeft(timeLeft => {
        if (timeLeft >= 1 ) return timeLeft - 1;
        resetTimer();
        return 0;
      });
    }, 1000)
  }

  function stopTimer(){
    if (intervalRef.current === null) return;

    clearInterval(intervalRef.current);
    intervalRef.current = null;
    setTitle("Focus Time Paused");
    setIsRunning(false);
  }

  function resetTimer(){
    clearInterval(intervalRef.current);
    setTitle("Timer Reset");
    setTimeLeft(25 * 60);
    setIsRunning(false);
  }

  // Calculate minutes
  const minutes = padTime(Math.floor(timeLeft / 60));
  
  // Calculate seconds
  const seconds = padTime(timeLeft - minutes * 60);

  return (
    <div className="app">
      <h2>{title}</h2>

      <div className="timer">
        <span>{minutes}</span>
        <span>:</span>
        <span>{seconds}</span>
      </div>

      <div className="buttons">
        {!isRunning && <button onClick={startTimer}>Start</button>}
        {isRunning && <button onClick={stopTimer}>Stop</button>}
        <button onClick={resetTimer}>Reset</button>
      </div>
    </div>
  );
}
