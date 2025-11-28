Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7018732E728
	for <linux-staging@lists.linux.dev>; Fri, 28 Nov 2025 16:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764345977; cv=none; b=k+qPDvG7HedPrS4LAfb+WMopNYpv4xYnn1KNGXBuCupjX3cpgwinm59cpihnU3hSzM5f3CQraX27+RpaCmogHi6KDA7/4BQirZDJ9ctlpyn9td0/e1tmj+FtG9Hv03jmvFsfF37gXeKZLyetpUKca1Iy6AyfSzQdT7o4Wf36chw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764345977; c=relaxed/simple;
	bh=HhT6z2DVcZ8yTv/m6DHxcDKqHPAmK3H4JJhD4dhIVH0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dASrakCUWTIRUlMC3mHmZJjY1jpKkge0Tj+M5gR/kUObfy+QmihdX3wheTj9maKoakFRAUubzCgpa7QEdW1dbUrybkJ9ONN3SGtPf1lC5oZObjRgM+zg5XHE1qecdfTlFECCApYbyBlTLpCikcaE/+fS12ka9jG7SWH3u5+U2W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MRab7+7L; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MRab7+7L"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7acd9a03ba9so2319853b3a.1
        for <linux-staging@lists.linux.dev>; Fri, 28 Nov 2025 08:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764345975; x=1764950775; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Ivwth3bvYn00MIlpqUjU3pfVj9NAWsfF7rOKTWPDVU=;
        b=MRab7+7LH4XmBLPIisofA5mWlFSG2pLWknoPRagLt6QIIoVzCY32Zkcudl3DcFo+7w
         wp6sgsQmzhxWhNQl5JfTifPYoyUQYpUgbmXM/irwBXkZipr+zNbqdF3ALyw86IcOA0YM
         qIZuT4k/Ukk2vJnyZiDnp1hBpEvmD7cM+a3HfPcH0aggIgHO4owcXNb9UJvIYE7D4si2
         zbGdHhgtjJ4Yvvz6hsqlaoW8P7Aio8C9+uNaKVNrNOa2AFEeHpxrFnvZ07N6HkPehBRX
         kTDRHwxQNJL65Y3N5+72TSlhgWzKM/mxGx2U00czbe+BP6i5w1W8Kfbem0Ut1vSogGFd
         7zAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764345975; x=1764950775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Ivwth3bvYn00MIlpqUjU3pfVj9NAWsfF7rOKTWPDVU=;
        b=WIvqOITZkgOxqo3TfSRunElcMqHfgxedSGvKPOwuUX2b+qfT4QZZruNQhkaOL7MxXP
         yK2U58xrAkILp6dx+nnI7GTGRWgrMawssd3iPQqzJ/cORcaZ7XUkCQsoMN4kuqESAEY/
         +2YkR5SBuD7vQzc7e5EAUxQI9MH8WLJwOCp7AOvScDB2hC8ZRxJFVNUJcT77iPxDS7ug
         /lQ9nd5GyPyIIVE9nobUwnfNL2/8hQlHC23lKM0dD55W+tx07j8Gb2WYvmlWiStlc/+Y
         vLdBn1rHfNtIv63nofHmINFSzQ9g/xgK8basAhcCYcMTTDWPfsUTt1rMM5C7KHN6DSeR
         fGRw==
X-Forwarded-Encrypted: i=1; AJvYcCW27yXTODrW9ruMdIYRG+zWGb9arTyS9I35XfoQhYbZDFwvwHMRtEUmWsGvxa/RIf6YmTNMJx5w8KmKFWtN@lists.linux.dev
X-Gm-Message-State: AOJu0YztnjOp97FDGWY9i+MIIVS9282d9Zk5IB4v1aU7Td70c39/MMKA
	OdlBDMQwxM9Rcoj4keHkjS3j2D31WYhFUYIvPOKq/eOFCR+Etno2QrnM
X-Gm-Gg: ASbGncv2+wonimyQOzP83YAcVtaSoMiXr2ML1anTAQX4xNFX3VUykAi3oZwbhB/9DMq
	1ookkGTtiToO4Ij/df+IbAUKSbCPTqDZgZhxAImPTURkcz0EdBhvtRSlvZUmWVV+v5hmJD7cZ3e
	OUP7J8JTXeuegik0iZT28C9BQ57Col26X63BDlDDTsMb0A2fSf/pT8sCAzSC3wMQjTT6scAtU1Q
	0g0I39qmN8c7uCSwuz5SQdx+0IZDQeA1qFeexLRPYOvHxRKYsBvQ6xGAnj+vgRlo+OhB9GT1rI8
	AmWvNYrUTlXGOfb6PO5E/KiC4cvvQDFGyyt5TfvsnsCvClpO53nEcR+DjBBGojKbQ2X+H803QBi
	1LDWxvrvHYZyJQnq3WkDVfzldyF2TuYV8v9bB4kvZIKOTXd6amKG3Bc/Kp2g+/TaYpihK0qI3Tw
	i7oUMLqEah9212EpOlfchcl1Zf5ORWNIRPAAlc/Q==
X-Google-Smtp-Source: AGHT+IFt9S/vPqjUM0mz+GQlgswc6/I0j11kLNLh5CdF1ZTntqzS++PULCgN0F0Q/MhhEDQPVXOPYQ==
X-Received: by 2002:a05:6a00:3e29:b0:783:c2c4:9aa5 with SMTP id d2e1a72fcca58-7c58effc088mr29961873b3a.32.1764345974342;
        Fri, 28 Nov 2025 08:06:14 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15f26f11fsm5408499b3a.50.2025.11.28.08.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 08:06:13 -0800 (PST)
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
Subject: [PATCH 5.15.y 05/14] timers: Get rid of del_singleshot_timer_sync()
Date: Sat, 29 Nov 2025 01:05:30 +0900
Message-Id: <20251128160539.358938-6-aha310510@gmail.com>
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
