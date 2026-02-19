Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D5234DB48
	for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 17:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771521220; cv=none; b=FADn0ccCqiOymZbG3u9DfaUdFwuEBnuKiP8wnWVUUQUa5Wcas0MH6LL7Tci0Rc2DF5gtzgaSpxh1ZMc5os6Y4vS3TadLHIcZgS9BJC8Ib7nMUaf7CLTT41RpGhzjPMN/kXm7BY/QfVN07h7fn/4ustxi5BMB2oXQnMrdEbCHf5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771521220; c=relaxed/simple;
	bh=HhT6z2DVcZ8yTv/m6DHxcDKqHPAmK3H4JJhD4dhIVH0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P04zohxbq8dD2wVhSZN4YTh2jrE5UHj/FuOpLpfEiv7eDWmJO05o5fKTYvIEkee+jOr1EBHMuJrAAlOELoknnS9Ck6ei+Q++uYdk8fvCV6sPhl68ENg9yAMD+IJkKSBisc4KaWkWkzYv3cqdz8wQdUz6z/emj80E3GMDPKiFShQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lWtwHhPP; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lWtwHhPP"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8230f8f27cfso614584b3a.0
        for <linux-staging@lists.linux.dev>; Thu, 19 Feb 2026 09:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771521216; x=1772126016; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Ivwth3bvYn00MIlpqUjU3pfVj9NAWsfF7rOKTWPDVU=;
        b=lWtwHhPPUOXCm9dYhiLfMzAyMGt0FAhZZZBn4lR4GBP0S+pBoaruwW1YgkJE69WcjK
         1xWrEXoqT8Xmx2g5LTWLViT0V07YCWjrRisD/DjA0RxcsdTVR21vBPq+z/OC/yyBo1EJ
         2r20xXhpz27o8TBRc6vhTGpUX9m0GPeRc69xSNOrF0oqsV+EsoD6KLlwX8wbIrdPV6FX
         PLGETM8Hx7tAb2nHFZlZvCEt5R3/hM5WePGLvefxfeKtI8Ht51DgRP0zB4JbNEDqpDky
         OdVQt6Iw05uBCGmosUEZn3JfD/5QFRIXU/VEU43eHfoGqOfqxtmZKZ6L3jATieeGaLw9
         nRRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771521216; x=1772126016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Ivwth3bvYn00MIlpqUjU3pfVj9NAWsfF7rOKTWPDVU=;
        b=F8eYQI1FSx8HASwAh19gYznVPlnWERg16f1IKeGNMIwFO8tt2gJLElOT0q3RrTi5vM
         F5RuH/8zWz5Y0ZJ51G0gNcPMn9dEMpggyXC6HmASASKf9fMuOEICH/aJzSUXVkkNIl8h
         ecYaDJ7Ambi/35VRH1kpH8mj98fQZwSyvtAGIeaX39rwcS7DAMPl0NouSjSEf6ynNxf4
         62IodKjF+uxM3bfn79xaLHGF5lIyPQ77PA8Y4/ZXzlwQseS0GesHSj9ELan3XS4WLdd1
         TRSreJbUGElNVRuAQ9zl9JtHyL9bnfyhXwqVmMC19WpMziZpU441HZ2g48/k+sWqJdUZ
         +3Aw==
X-Forwarded-Encrypted: i=1; AJvYcCX20kxopAX8id1aqhCTzdTwhTCaZz5OwA0y3uBd64ahsBT2g4JQWNoxeJR0IMT9sD44a7O/Xb6bnElE7MW4@lists.linux.dev
X-Gm-Message-State: AOJu0YxjgN8eMklgtSNXT1Hr3CaEV1+32VA3iZr5WAmySj2ue9rkyfWj
	pbLYS3Rvb1ZKwapZEHhpnWhZueX9Ccn5pbJQ9Zxj9JKKJLgzGEHgVqxH
X-Gm-Gg: AZuq6aIZK8J3MN1ZPPjeWRGQjmpbwQFSaUlEiDiM4tDgGP07C4IbGHwy5bt9ZYf7FBM
	fdlMN1uD+2hr1lN4b5aYa8rFk5Q4Ol1sppMF6bGEqVdN6rIsmS4VT2Pz8YLoNcRWG4upxOpxobM
	uNR/WfJqcvyl7l3t/k5HV16DbzJlFKlqAa+lGVlC9B5HpRjaRF00nZWS+89fidwapnYrZG9aXjj
	btrr70jExDCdqwpmIwoBBGwBq0QYLzdDEH+HcUKIEluKy6e0TELr/JzQV6mMAYacpHsNSQ43cFF
	Hn5CSA79aAE16oEi2sSl+8N/V9A7RXTlMbkU/KrY4mKYM5aFMA4qQeBcCgSSHrF7zeLAk3vXTm+
	N8QWyc/m5WOmf/hdHvEeI9KpY3rEn1qzaAVsARuEZBvp5RRqAJ6f+NgNif2ZGtbsr6TMlb1qVo4
	VY1xf3c+dpBsM0rGEqEqtgIoZY2hvXm93KvwzeG2m5I9oHmZaiwufagYZ6w0AW
X-Received: by 2002:a05:6a21:6b05:b0:34f:b660:770d with SMTP id adf61e73a8af0-3946c95590dmr18861831637.55.1771521216447;
        Thu, 19 Feb 2026 09:13:36 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.236.165])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e532fa2e5sm15895002a12.26.2026.02.19.09.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 09:13:35 -0800 (PST)
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
	zouyipeng@huawei.com,
	aha310510@gmail.com,
	linux-staging@lists.linux.dev,
	Jacob Keller <jacob.e.keller@intel.com>
Subject: [PATCH 5.10.y 05/15] timers: Get rid of del_singleshot_timer_sync()
Date: Fri, 20 Feb 2026 02:13:00 +0900
Message-Id: <20260219171310.118170-6-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260219171310.118170-1-aha310510@gmail.com>
References: <20260219171310.118170-1-aha310510@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thomas Gleixner <tglx@linutronix.de>

[ Upstream commit 9a5a305686971f4be10c6d7251c8348d74b3e014 ]

del_singleshot_timer_sync() used to be an optimization for deleting timers
which are not rearmed from the timer callback function.

This optimization turned out to be broken and got mapped to
del_timer_sync() about 17 years ago.

Get rid of the undocumented indirection and use del_timer_sync() directly.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Reviewed-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Link: https://lore.kernel.org/r/20221123201624.706987932@linutronix.de
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 drivers/char/tpm/tpm-dev-common.c     | 4 ++--
 drivers/staging/wlan-ng/hfa384x_usb.c | 4 ++--
 drivers/staging/wlan-ng/prism2usb.c   | 6 +++---
 include/linux/timer.h                 | 2 --
 kernel/time/timer.c                   | 2 +-
 net/sunrpc/xprt.c                     | 2 +-
 6 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/char/tpm/tpm-dev-common.c b/drivers/char/tpm/tpm-dev-common.c
index 56e56a09cc90..c3fbbf4d3db7 100644
--- a/drivers/char/tpm/tpm-dev-common.c
+++ b/drivers/char/tpm/tpm-dev-common.c
@@ -157,7 +157,7 @@ ssize_t tpm_common_read(struct file *file, char __user *buf,
 out:
 	if (!priv->response_length) {
 		*off = 0;
-		del_singleshot_timer_sync(&priv->user_read_timer);
+		del_timer_sync(&priv->user_read_timer);
 		flush_work(&priv->timeout_work);
 	}
 	mutex_unlock(&priv->buffer_mutex);
@@ -264,7 +264,7 @@ __poll_t tpm_common_poll(struct file *file, poll_table *wait)
 void tpm_common_release(struct file *file, struct file_priv *priv)
 {
 	flush_work(&priv->async_work);
-	del_singleshot_timer_sync(&priv->user_read_timer);
+	del_timer_sync(&priv->user_read_timer);
 	flush_work(&priv->timeout_work);
 	file->private_data = NULL;
 	priv->response_length = 0;
diff --git a/drivers/staging/wlan-ng/hfa384x_usb.c b/drivers/staging/wlan-ng/hfa384x_usb.c
index 0d869b5e309c..8687e0bf3315 100644
--- a/drivers/staging/wlan-ng/hfa384x_usb.c
+++ b/drivers/staging/wlan-ng/hfa384x_usb.c
@@ -1116,8 +1116,8 @@ static int hfa384x_usbctlx_complete_sync(struct hfa384x *hw,
 		if (ctlx == get_active_ctlx(hw)) {
 			spin_unlock_irqrestore(&hw->ctlxq.lock, flags);
 
-			del_singleshot_timer_sync(&hw->reqtimer);
-			del_singleshot_timer_sync(&hw->resptimer);
+			del_timer_sync(&hw->reqtimer);
+			del_timer_sync(&hw->resptimer);
 			hw->req_timer_done = 1;
 			hw->resp_timer_done = 1;
 			usb_kill_urb(&hw->ctlx_urb);
diff --git a/drivers/staging/wlan-ng/prism2usb.c b/drivers/staging/wlan-ng/prism2usb.c
index 4b08dc1da4f9..83fcb937a58e 100644
--- a/drivers/staging/wlan-ng/prism2usb.c
+++ b/drivers/staging/wlan-ng/prism2usb.c
@@ -171,9 +171,9 @@ static void prism2sta_disconnect_usb(struct usb_interface *interface)
 		 */
 		prism2sta_ifstate(wlandev, P80211ENUM_ifstate_disable);
 
-		del_singleshot_timer_sync(&hw->throttle);
-		del_singleshot_timer_sync(&hw->reqtimer);
-		del_singleshot_timer_sync(&hw->resptimer);
+		del_timer_sync(&hw->throttle);
+		del_timer_sync(&hw->reqtimer);
+		del_timer_sync(&hw->resptimer);
 
 		/* Unlink all the URBs. This "removes the wheels"
 		 * from the entire CTLX handling mechanism.
diff --git a/include/linux/timer.h b/include/linux/timer.h
index e78521bce565..3c166b4f704d 100644
--- a/include/linux/timer.h
+++ b/include/linux/timer.h
@@ -198,8 +198,6 @@ static inline int del_timer_sync(struct timer_list *timer)
 	return timer_delete_sync(timer);
 }
 
-#define del_singleshot_timer_sync(t) del_timer_sync(t)
-
 extern void init_timers(void);
 struct hrtimer;
 extern enum hrtimer_restart it_real_fn(struct hrtimer *);
diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index d4ce3ebe2c8c..6cd908cfbad4 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -1912,7 +1912,7 @@ signed long __sched schedule_timeout(signed long timeout)
 	timer_setup_on_stack(&timer.timer, process_timeout, 0);
 	__mod_timer(&timer.timer, expire, MOD_TIMER_NOTPENDING);
 	schedule();
-	del_singleshot_timer_sync(&timer.timer);
+	del_timer_sync(&timer.timer);
 
 	/* Remove the timer from the object tracker */
 	destroy_timer_on_stack(&timer.timer);
diff --git a/net/sunrpc/xprt.c b/net/sunrpc/xprt.c
index 2db834318d14..2bccb5a90934 100644
--- a/net/sunrpc/xprt.c
+++ b/net/sunrpc/xprt.c
@@ -1160,7 +1160,7 @@ xprt_request_enqueue_receive(struct rpc_task *task)
 	spin_unlock(&xprt->queue_lock);
 
 	/* Turn off autodisconnect */
-	del_singleshot_timer_sync(&xprt->timer);
+	del_timer_sync(&xprt->timer);
 }
 
 /**
--
