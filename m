Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E176933120D;
	Sat,  7 Feb 2026 15:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770479017; cv=none; b=kvPo2VS4gMF0rz9KH+s4/Tls2EBEYuGr9dzIrXgYS8UewmfvTFV0BLFtmhx2xp0iSgT5xUbvVpU7j70PQUPVGDORo44n9VieN4JZPyToSJUB0sw/lGZb5s3lqtIcmsSkT85mbE7OAcTMzEzfGZoKSJVBaUoXViUXjFYiqCLGmkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770479017; c=relaxed/simple;
	bh=FbFXdZFpQ55VVmXe/86vLUKwsSMMkFZUAYzN5Lfs208=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=LWXK1nvWeljBztYNGF1r/6HSsazF5RuitWiXdnLQ9fZ8hdKzJpeHXFzdRXWwQYiMKY3WgcQ2+ia21f4ylmrLdEpyDXFkLd4VLzkq3edPYCJT45y76GgTNIRabv8aaBThdRsZNQOUN8nQ/m2JQ5GN2dzZvolO5G2HvpjuG3pSX5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TE4Y4ASR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TE4Y4ASR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 385A0C116D0;
	Sat,  7 Feb 2026 15:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770479016;
	bh=FbFXdZFpQ55VVmXe/86vLUKwsSMMkFZUAYzN5Lfs208=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=TE4Y4ASRMTEE6x0xToVqbKo0FNmYWonLMdGqJGFqyQg9DLzh2GWxwqiBo9TCKD8Cc
	 qxPX81PHl0iPFV2FWBrsnAOKUqSYlrygD8eBi4RlDX9sxl56AzuvJ4h9HxiVPX+Flw
	 Pu92H7rKYPE24LkXnwxVHLaHShMaE07a1MM/XwNA=
Subject: Patch "timers: Get rid of del_singleshot_timer_sync()" has been added to the 5.15-stable tree
To: Julia.Lawall@inria.fr,aha310510@gmail.com,akpm@linux-foundation.org,anna-maria@linutronix.de,arnd@arndb.de,gregkh@linuxfoundation.org,jacob.e.keller@intel.com,linux-staging@lists.linux.dev,linux@roeck-us.net,luiz.dentz@gmail.com,marcel@holtmann.org,maz@kernel.org,peterz@infradead.org,rostedt@goodmis.org,sboyd@kernel.org,tglx@linutronix.de,viresh.kumar@linaro.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sat, 07 Feb 2026 16:43:03 +0100
In-Reply-To: <20251128160539.358938-6-aha310510@gmail.com>
Message-ID: <2026020703-scrimmage-richly-68cb@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    timers: Get rid of del_singleshot_timer_sync()

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     timers-get-rid-of-del_singleshot_timer_sync.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-197607-greg=kroah.com@vger.kernel.org Fri Nov 28 17:07:53 2025
From: Jeongjun Park <aha310510@gmail.com>
Date: Sat, 29 Nov 2025 01:05:30 +0900
Subject: timers: Get rid of del_singleshot_timer_sync()
To: stable@vger.kernel.org
Cc: gregkh@linuxfoundation.org, tglx@linutronix.de, Julia.Lawall@inria.fr, akpm@linux-foundation.org, anna-maria@linutronix.de, arnd@arndb.de, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, linux@roeck-us.net, luiz.dentz@gmail.com, marcel@holtmann.org, maz@kernel.org, peterz@infradead.org, rostedt@goodmis.org, sboyd@kernel.org, viresh.kumar@linaro.org, aha310510@gmail.com, linux-staging@lists.linux.dev, Jacob Keller <jacob.e.keller@intel.com>
Message-ID: <20251128160539.358938-6-aha310510@gmail.com>

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
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/char/tpm/tpm-dev-common.c     |    4 ++--
 drivers/staging/wlan-ng/hfa384x_usb.c |    4 ++--
 drivers/staging/wlan-ng/prism2usb.c   |    6 +++---
 include/linux/timer.h                 |    2 --
 kernel/time/timer.c                   |    2 +-
 net/sunrpc/xprt.c                     |    2 +-
 6 files changed, 9 insertions(+), 11 deletions(-)

--- a/drivers/char/tpm/tpm-dev-common.c
+++ b/drivers/char/tpm/tpm-dev-common.c
@@ -157,7 +157,7 @@ ssize_t tpm_common_read(struct file *fil
 out:
 	if (!priv->response_length) {
 		*off = 0;
-		del_singleshot_timer_sync(&priv->user_read_timer);
+		del_timer_sync(&priv->user_read_timer);
 		flush_work(&priv->timeout_work);
 	}
 	mutex_unlock(&priv->buffer_mutex);
@@ -264,7 +264,7 @@ __poll_t tpm_common_poll(struct file *fi
 void tpm_common_release(struct file *file, struct file_priv *priv)
 {
 	flush_work(&priv->async_work);
-	del_singleshot_timer_sync(&priv->user_read_timer);
+	del_timer_sync(&priv->user_read_timer);
 	flush_work(&priv->timeout_work);
 	file->private_data = NULL;
 	priv->response_length = 0;
--- a/drivers/staging/wlan-ng/hfa384x_usb.c
+++ b/drivers/staging/wlan-ng/hfa384x_usb.c
@@ -1116,8 +1116,8 @@ cleanup:
 		if (ctlx == get_active_ctlx(hw)) {
 			spin_unlock_irqrestore(&hw->ctlxq.lock, flags);
 
-			del_singleshot_timer_sync(&hw->reqtimer);
-			del_singleshot_timer_sync(&hw->resptimer);
+			del_timer_sync(&hw->reqtimer);
+			del_timer_sync(&hw->resptimer);
 			hw->req_timer_done = 1;
 			hw->resp_timer_done = 1;
 			usb_kill_urb(&hw->ctlx_urb);
--- a/drivers/staging/wlan-ng/prism2usb.c
+++ b/drivers/staging/wlan-ng/prism2usb.c
@@ -171,9 +171,9 @@ static void prism2sta_disconnect_usb(str
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
--- a/include/linux/timer.h
+++ b/include/linux/timer.h
@@ -198,8 +198,6 @@ static inline int del_timer_sync(struct
 	return timer_delete_sync(timer);
 }
 
-#define del_singleshot_timer_sync(t) del_timer_sync(t)
-
 extern void init_timers(void);
 struct hrtimer;
 extern enum hrtimer_restart it_real_fn(struct hrtimer *);
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -1912,7 +1912,7 @@ signed long __sched schedule_timeout(sig
 	timer_setup_on_stack(&timer.timer, process_timeout, 0);
 	__mod_timer(&timer.timer, expire, MOD_TIMER_NOTPENDING);
 	schedule();
-	del_singleshot_timer_sync(&timer.timer);
+	del_timer_sync(&timer.timer);
 
 	/* Remove the timer from the object tracker */
 	destroy_timer_on_stack(&timer.timer);
--- a/net/sunrpc/xprt.c
+++ b/net/sunrpc/xprt.c
@@ -1160,7 +1160,7 @@ xprt_request_enqueue_receive(struct rpc_
 	spin_unlock(&xprt->queue_lock);
 
 	/* Turn off autodisconnect */
-	del_singleshot_timer_sync(&xprt->timer);
+	del_timer_sync(&xprt->timer);
 }
 
 /**


Patches currently in stable-queue which might be from aha310510@gmail.com are

queue-5.15/timers-update-the-documentation-to-reflect-on-the-new-timer_shutdown-api.patch
queue-5.15/clocksource-drivers-arm_arch_timer-do-not-use-timer-namespace-for-timer_shutdown-function.patch
queue-5.15/timers-split-del_timer-to-prepare-for-shutdown-mode.patch
queue-5.15/arm-spear-do-not-use-timer-namespace-for-timer_shutdown-function.patch
queue-5.15/timers-add-shutdown-mechanism-to-the-internal-functions.patch
queue-5.15/timers-provide-timer_shutdown.patch
queue-5.15/timers-rename-del_timer-to-timer_delete.patch
queue-5.15/timers-replace-bug_on-s.patch
queue-5.15/bluetooth-hci_qca-fix-the-teardown-problem-for-real.patch
queue-5.15/documentation-replace-del_timer-del_timer_sync.patch
queue-5.15/documentation-remove-bogus-claim-about-del_timer_sync.patch
queue-5.15/timers-silently-ignore-timers-with-a-null-function.patch
queue-5.15/timers-get-rid-of-del_singleshot_timer_sync.patch
queue-5.15/clocksource-drivers-sp804-do-not-use-timer-namespace-for-timer_shutdown-function.patch
