every 1.day, at: '00:00' do
    runner "ReportAnalyticWorker.perform_async"
end
