Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBFC480959
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119842; cv=none; b=tcncTzDAhosGD9JBbKx2Y9hNaBmXcNd45o/J6R6g5q4NdP26ZrZnyiN82fG+lrgZE30v3Mqh1LGsarxR2nreEbRuAYqFO66yUW1L9i1Zabp16z0PJVmWaFfY8TjhO5+zMG29ogv40WO3CTm6Vr4I9Trg3VP5zuu04msF57SBHRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119842; c=relaxed/simple;
	bh=tRipzmLpOCevwuknURNOpBvPuJZmD+gFPvi10SppIGA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tv9SiZfi4xtqLD7TLYYUsICwcnXBIcNMfxI+4o1I4mNbOkASdTKV+92sHnWMAeyMStazkV1mLcjuHKzFICGITXxbKYsgo5h0/+0biAHCVJnfruL9M7UdAv6jf7qGTDD+iALp/YP8lPQcLAQOiN8OW+Gt/i3m+gQhQupV81FO4Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gO1KVRdQ; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gO1KVRdQ"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39d560a1dd4so4259241fa.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119835; x=1784724635; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IfjYa8DESgLZHi2LJ4dhLFuZRUwHsIA52JsmeA7NWRU=;
        b=gO1KVRdQHLfdc42tSw2dka9z87C2tygEOfsyyhPM8CGmkdzfobQMkBK1ZUbjWjAkDK
         sGRE2rTMiDh6PfAR7vAR3CRS+/bHTVfQh+c2CQyUR1piaxT4J8g+xgfOwU0Zu1beOVKC
         6tNy/93+LluEqSVlqIwwbVeQS+PVoQi9dgxKH+NRtF2ClLk4o+HGrhKiPju00bCQB1el
         f7RvK9QnBjvThEcSHFVR3lkQjhbt/HZVNNM67GTLeumhPGtBUfWCtln15KL8kE/yr1gw
         /lYDS7FRwrl1r7scJ6Nvj5foyqD0rbAdOikswadJMi/p2tXjQ5acCU8QatfcPrstOXzZ
         /Xhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119835; x=1784724635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IfjYa8DESgLZHi2LJ4dhLFuZRUwHsIA52JsmeA7NWRU=;
        b=RHFX5orpYsUn+9dy6XfyVU9Nfcw7seMBTHDSD8vp7oVedYlFKeYZ0Dm5Npii3Xn2Ft
         szySmA/SUso+kztsoa6n8S26ZvdNc/gOw9JSWjkJEyAvYg6J174jn2ZGpqAGu3Fs7whl
         bYRCSlhUZgTTW6B5UpwG/EuVSYg44hLl8Gl1sKmXejGwHFLN37ydzuZq8KDKX0txdnTM
         ZqNdI8JboMo19koN9enskgWlv3jmsU5+4M9XB1BO/ZH75pgUCBUhUw7AHhx5i1C0fvQi
         1LtiXmcmgushfQ8jEYoUfgrLAncxNuPCrkBebEwb5NNqL/uC1uKWrCnrzfezPIntk562
         ZdyQ==
X-Gm-Message-State: AOJu0YxUMaARqygROAKWvXaEMJR6U8FvhQxseVmOQuPpaS3No+5xukei
	/R8LGilK/ziKUT21F3CJJlI87h9VzhVpM41k/i2CM5fjAIF8J02iyIHN
X-Gm-Gg: AfdE7clB8SNS3tSgDhHMQemZfbmXx9wKPPUYTu4HMaQkdMBgxZnet6v+yzn9yTS/HN5
	xY9yRI70yZgVhdnUfNvELhImvqIDNXiG42dktRbydnlexr8NkRl7O/ZIy49Vx3UgwtmkD7wK+8F
	jW/k9rEmS7IIR4W4i5BVQmgO460OYNpNdTYbEiL0P7mbYFNsE6xWd8sPL/81b6dfkGOHWOpqUrS
	w/GH8YbmMC9BuSz2gnK23RQknyl1Jm+VcpQNLeVHcT62TbUkYVE4UFkZKWC7VsvfJZKcJ+Ccwl9
	6Ti6Q0YKltkzNXrtsWQdrX/KMiP3b3205ZWRCdZBwdlzMnc4n7HlKIbLuMDlXR0+tD5dV+FkpnP
	JRqLWh+9lD126ZPQ9qfiy93je+3qgWVL4XTk+gFBNYx7v3YdS77t07MKyy1iWwQLqhD7dJw9WPP
	1ca/BMctAvDG2NtsE1AJwMG9+D2ygsbhCMoWSy6efHEUHMB4bf6Cp/8Zb0b1foEx1jVpRjtgB5I
	YVsmwYmWStX0w==
X-Received: by 2002:a05:6512:66da:b0:5aa:6f0e:8404 with SMTP id 2adb3069b0e04-5b15d782523mr462324e87.21.1784119835167;
        Wed, 15 Jul 2026 05:50:35 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:34 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 25/61] staging: rtl8723bs: remove unregister_task_alive inline helper
Date: Wed, 15 Jul 2026 19:47:53 +0700
Message-ID: <20260715124829.90290-26-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the redundant static inline helper unregister_task_alive()
from the power control management code.

The function provides no additional logic, validation, or locking,
acting merely as a wrapper around a standard bitwise AND-NOT operation
on the pwrctrl->alives bitmap. Replacing it with a direct expression
simplifies the driver's power interface.

Clean up the inline definition and update all its call sites across
the codebase to manipulate pwrctrl->alives directly.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index c52988cfc..a15f3ee9b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -667,11 +667,6 @@ static void pwr_rpwm_timeout_handler(struct timer_list *t)
 	_set_workitem(&pwrpriv->rpwmtimeoutwi);
 }
 
-static inline void unregister_task_alive(struct pwrctrl_priv *pwrctrl, u32 tag)
-{
-	pwrctrl->alives &= ~tag;
-}
-
 /*
  * Description:
  *Check if the fw_pwrstate is okay for I/O.
@@ -747,7 +742,7 @@ void rtw_unregister_task_alive(struct adapter *padapter, u32 task)
 
 	mutex_lock(&pwrctrl->lock);
 
-	unregister_task_alive(pwrctrl, task);
+	pwrctrl->alives &= task;
 
 	if ((pwrctrl->pwr_mode != PS_MODE_ACTIVE) && pwrctrl->fw_current_in_ps_mode) {
 		if (pwrctrl->cpwm > pslv) {
@@ -874,7 +869,7 @@ void rtw_unregister_tx_alive(struct adapter *padapter)
 
 	mutex_lock(&pwrctrl->lock);
 
-	unregister_task_alive(pwrctrl, XMIT_ALIVE);
+	pwrctrl->alives &= XMIT_ALIVE;
 
 	if ((pwrctrl->pwr_mode != PS_MODE_ACTIVE) && pwrctrl->fw_current_in_ps_mode) {
 		if (pwrctrl->cpwm > pslv)
@@ -910,7 +905,7 @@ void rtw_unregister_cmd_alive(struct adapter *padapter)
 
 	mutex_lock(&pwrctrl->lock);
 
-	unregister_task_alive(pwrctrl, CMD_ALIVE);
+	pwrctrl->alives &= CMD_ALIVE;
 
 	if ((pwrctrl->pwr_mode != PS_MODE_ACTIVE) && pwrctrl->fw_current_in_ps_mode) {
 		if (pwrctrl->cpwm > pslv) {
-- 
2.55.0

