Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4514C3321A9
	for <linux-staging@lists.linux.dev>; Fri, 28 Nov 2025 16:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764346024; cv=none; b=GZAcLp2Vydl24VM31ghWzeQBIqEQiUYaZvwcQDP36BR+SmDIm1sQjSvLs71Xe3o/t+kCEZhcLDeAOdzweYDge9Zl6jZLrK3xvAaayX9znFp+DQdMJmV29YgnpaxbNhUBRX8VMRm8PWlWQMEnkpOUWPM+jBoI+YOlRAxR7p1vn/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764346024; c=relaxed/simple;
	bh=wtM3KGXEQuicJ8O+1w9NeLqs1Q3c/AYVobYXG6O4xkU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BuRskWgVo/wLeuUeOU6zXl/Vw++A92754hH8GiDI7EckyN/UN9hLTH5eY3V4tBtAwy+6mdjBSFf+D/+n5iz/lWsV6DxewApWUfh51EdlX5irgVrEl95jNYQDChm5SXkBMYJmK7vbT2viX4TvQYnVfnnumt/7RIxmU0ylM73Iw9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUvFA1eB; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUvFA1eB"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so1949591b3a.1
        for <linux-staging@lists.linux.dev>; Fri, 28 Nov 2025 08:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764346022; x=1764950822; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=avVd2rCSlmy3mzSueRF3eaj+JsVil8OR/Q+bsjGDE3A=;
        b=QUvFA1eBfPhdzYcKygiiHgNZ5RCYrAPtjvE3S1QgLMTxHswdPEL1KDzARjMDnuiHPI
         Le0ew0uo5hBGaysucuBP2zpMCxpwlojUYLg5VPQYybYkiOKrgytDEoSAXaZBqg19GlJi
         pa3/iKZeSDmzAShvDk/j6Z410+e1dpNivEddHrD14OlNyr8Hs13LmQ99lu4mIJln+wnV
         h/7p4iqkkPXcOKqD0YnJLBexbCbo8nxALbtPBrlY+r4Wh2UpzOiuUHemqI5HzsVZRuNt
         STvmql/roDKpQWvT85seJuKL19HMUxTa4OGmNHcV6igImZm7LjC0WHF5/2h8/oTsz5qF
         NU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764346022; x=1764950822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=avVd2rCSlmy3mzSueRF3eaj+JsVil8OR/Q+bsjGDE3A=;
        b=tUdtMnNebDtQVDo3jAHpxLFtmnHncIJAE+T1riAgaaFLNXVqPQnIpfYyBraTcKOhw6
         9Tpk7olMJ9mg9UoKx5xzV8qs+KZeD1qQ/ETGN5g4V4BEzj8B8ey/Z56aiSI07DKujmzf
         mmubPlBjrEkqd5oGuvT40YSU6IPzh/MtMF8sQUk8V06s+LGOlfHsX0bfZBjx04VcyY+u
         ENYpjLUeaPIMDETDLwYhCT7HWqb2isOkdfLHEW4F2q9E2zhXZG9Zw3j0Xvd4UTVF6lTK
         Y+DyOOfznGuEGwPDXz2mQ/slbX8ZEffV1XyGcBwfHK4o0JC56B6vqqdv/vIFgdKEvKA4
         v1bg==
X-Forwarded-Encrypted: i=1; AJvYcCWh7wAIKXdT2InlRTNgVNKiWQ6n7kcmGjoEGoDZiGzDjaLjq9KPqul/FkmWJlrPyC/ME2CakbBH5L/SZkMo@lists.linux.dev
X-Gm-Message-State: AOJu0YzPcxxhvHAu1fVCCAEavBlIqMuiGri1y1T0w7XbzrILpQSxVv12
	bN0nIfQHavcoQ3SbcAldLXhyxoODmdXlIgHBZX8HmIF5fr3i7d8tB9mh
X-Gm-Gg: ASbGncutcTIxBw8GoaBSUXlV2iRklbhGa0NXZxZKhMtvZb2pWnwZlCX95TzEGgd2yyg
	PD9Nx+jTqCu5gvHXk0cj8NKEmlTOmOHmqPA/eqhb0mu8K1/eeTu83nGFeQSA7WNbdJU+DBpjb3T
	QLIhlkQpFvl8q4HtP2x6DGnLlJ74H7AQOg3598VLgAwqNwq1L6DMJFO2G6RANTGlCCXqtujOVGq
	o9YHmZQeLwaUUY7C3cC4vissx9hi7HOhsOe/npnPWYeKLacsJ96uAh1oG7FpyPLsw6ACfNQ2Y1c
	0dXJAa3+zQMDG0hQMNjbO4INlAdn8M8zY8T/YNk5G4a2U1yv9XD3IBA1/UToadWLqDvt5NQrSI0
	EnoINXa4qU7VGFbQD92/e5u01uK9fZ7ZKq4+EszFJ1ix7YU9/t2cfTAKRAJ9f1uwmYsKRqBPV1b
	Iyoyut8lPmCLHMaRU5yHMhNdJopkOCbJ1vMsHT/A==
X-Google-Smtp-Source: AGHT+IFbb5wRaCswqOfBZvptqiaZuYa9cCWiPzI9C94VNg3d8rKHwc6PhwU1RUpFCGSPXAzo6Ott0w==
X-Received: by 2002:a05:6a00:22cb:b0:7aa:2cc6:8c38 with SMTP id d2e1a72fcca58-7c58c2abb3dmr27067471b3a.2.1764346022026;
        Fri, 28 Nov 2025 08:07:02 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f26f11fsm5408499b3a.50.2025.11.28.08.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 08:07:00 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: stable@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	Julia.Lawall@inria.fr,
	akpm@linux-foundation.org,
	anna-maria@linutronix.de,
	arnd@arndb.de,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	luiz.dentz@gmail.com,
	marcel@holtmann.org,
	maz@kernel.org,
	peterz@infradead.org,
	rostedt@goodmis.org,
	sboyd@kernel.org,
	viresh.kumar@linaro.org,
	aha310510@gmail.com,
	linux-staging@lists.linux.dev,
	Jacob Keller <jacob.e.keller@intel.com>
Subject: [PATCH 5.15.y 14/14] Bluetooth: hci_qca: Fix the teardown problem for real
Date: Sat, 29 Nov 2025 01:05:39 +0900
Message-Id: <20251128160539.358938-15-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251128160539.358938-1-aha310510@gmail.com>
References: <20251128160539.358938-1-aha310510@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thomas Gleixner <tglx@linutronix.de>

[ Upstream commit e0d3da982c96aeddc1bbf1cf9469dbb9ebdca657 ]

While discussing solutions for the teardown problem which results from
circular dependencies between timers and workqueues, where timers schedule
work from their timer callback and workqueues arm the timers from work
items, it was discovered that the recent fix to the QCA code is incorrect.

That commit fixes the obvious problem of using del_timer() instead of
del_timer_sync() and reorders the teardown calls to

   destroy_workqueue(wq);
   del_timer_sync(t);

This makes it less likely to explode, but it's still broken:

   destroy_workqueue(wq);
   /* After this point @wq cannot be touched anymore */

   ---> timer expires
         queue_work(wq) <---- Results in a NULL pointer dereference
			      deep in the work queue core code.
   del_timer_sync(t);

Use the new timer_shutdown_sync() function to ensure that the timers are
disarmed, no timer callbacks are running and the timers cannot be armed
again. This restores the original teardown sequence:

   timer_shutdown_sync(t);
   destroy_workqueue(wq);

which is now correct because the timer core silently ignores potential
rearming attempts which can happen when destroy_workqueue() drains pending
work before mopping up the workqueue.

Fixes: 72ef98445aca ("Bluetooth: hci_qca: Use del_timer_sync() before freeing")
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Acked-by: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Link: https://lore.kernel.org/all/87iljhsftt.ffs@tglx
Link: https://lore.kernel.org/r/20221123201625.435907114@linutronix.de
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 drivers/bluetooth/hci_qca.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 66f416f59a8d..204ba1de624d 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -710,9 +710,15 @@ static int qca_close(struct hci_uart *hu)
 	skb_queue_purge(&qca->tx_wait_q);
 	skb_queue_purge(&qca->txq);
 	skb_queue_purge(&qca->rx_memdump_q);
+	/*
+	 * Shut the timers down so they can't be rearmed when
+	 * destroy_workqueue() drains pending work which in turn might try
+	 * to arm a timer.  After shutdown rearm attempts are silently
+	 * ignored by the timer core code.
+	 */
+	timer_shutdown_sync(&qca->tx_idle_timer);
+	timer_shutdown_sync(&qca->wake_retrans_timer);
 	destroy_workqueue(qca->workqueue);
-	del_timer_sync(&qca->tx_idle_timer);
-	del_timer_sync(&qca->wake_retrans_timer);
 	qca->hu = NULL;
 
 	kfree_skb(qca->rx_skb);
--
