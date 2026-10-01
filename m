Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B444FE2EB
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 12:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858592; cv=none; b=YfCQu2ZGLMqiuTwqFvnTmeWym3WMljoQIH68P3+QnMYkcINZBdvoawZIsUrl5VB2wmgAATX9WldgklGjkJ4mqnfC0ksFTfSMiaOKM3Lh+zw+u6oAeZNurLUmCWLEANCmyOgiADrMssvORSD5yIdprSvGVVW9Q/TNSor3U3+4yNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858592; c=relaxed/simple;
	bh=rt6ZcRAoG0leWw0cNBVbjahgnsaNWPYY+3SkGYS+apg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JxEV0DyAdcZrEiBJLOJIJHAvvOjOkIFkL6BTpRf5gjnRmnbJvKF4GxHJ+NhflnqWUfTXMgo75DhN7mF6dzuVf6kroHFuhICOLQ6LEBfOXvF7TRLqRLXzZDnX9VV3HWUAJuspzrvYCPkVwQcGDxM2Mw7Q59htPY3a1e5LheA+9pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/hE4Pc7; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/hE4Pc7"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34c4a0870d2so1830363eec.2
        for <linux-staging@lists.linux.dev>; Thu, 01 Oct 2026 05:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790858589; x=1791463389; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5dwzlKPpjQST3hzuqqsiWTFX3s8Rj/ZNthU50nSHSvo=;
        b=W/hE4Pc7Xm9lJIXh27cDRI45S2EKLuryCqg011XfOT8uuXXNdWMxoFTji5m+eocO4C
         x9Cb7SwGXmnDTHwtpCKqonIk8Nt80oX+4LYlQk84MX/FZnl3BL0phf7zqHsQxmuiXjhe
         cy+MfEfGoRuPE/smEN1QQrc/FiwJH8UBGVfhJ+8ffAdsiSxcU4s8u9Aa9Ijg9bNjRwP3
         BrgPtN4x8ydyErNurEFjyev6qRjwWARUdfmwFqnQu816Ixx1vo3Mkl03lOnhyJpMaO2o
         rjV4F2oHbPzlhjqSRQemFlEvgiKWqirkPZ58WzyDD245YWdQs7TVVUvBc1ACy6NH3pa+
         c5MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858589; x=1791463389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5dwzlKPpjQST3hzuqqsiWTFX3s8Rj/ZNthU50nSHSvo=;
        b=psMmESDjbZymww+qjnM6nqlC0oVK9DuYiURMPZLWuNQ5jCfPpRp7s07eIiwc8HCMJN
         iYAZKMQLA/ePe3u1RE+XYOHXQlVfse/QTumffA4jBzutfF8/8sXtHzKWJ7YdLP8P0Qd6
         1adp/izl9mIKmU1qonZWLj/TwcyHjX7wKnjEs2rjTyBP8ay27iNLR177I7lIHT2vjj03
         iULM87BJ7M2opMQ7660orKm1Bj0guMn4KLqGy9iyoARutSzEumrHT37Ret1dGcSxb6nh
         g+ZZQagmmSK7gujQDAVuJ0msTZTWybwtfMwtoQhB4oWA2PU67ujCHXNm50CclxETEZg9
         WPZg==
X-Forwarded-Encrypted: i=1; AKwUvByIyLKPj+sjH3kcEjKCI+R6MkjQ2EaMOR5HU0I887eIbpMepdmI4yQEFlgbyYONdZqkybVCwlC3fswLfjyQ@lists.linux.dev
X-Gm-Message-State: AFq9FYKNtcFSL3hYWuH22EEaywL6CMRWssLkCv21uCtt2cdjV4BsCQ8A
	nmobpaV52qQC/+5U4LxcTHa9PeD3lrnhk7cKKxXPQhUkolEeuZ4WQ3+K
X-Gm-Gg: AYBFou2Bg6WlyOj1XtxunnPv3XcI5n+WHbgGS8zeAQsP3JFLmPiLPyirTbZPn5+bN4P
	O9B5T6FIql9V08l+xro76O/ybvMWHrfFE1MuIXe/oxJIXzqNYz4bU7ZdLn4lXbGvEj3HaiXfW/n
	hiDIg/QtpatD6NAGknSw77RF4ZQIh7zNKyTDNqpi4zSFi7G5226+e9Cf5TCFY703FDKj9Mp8wRr
	ZuENiO0zrKVRVK7HPGu85jJUtOVKJ2RAbA5NQpHBI95jux4rRcppmoW/DjuPhY4vfqMERiF14Lk
	gr5BGMCxv/5RtJ9S6laa5xJ2FhL73QhSzI2Pi3+BLdhnXZkevwO9iE0P02t5WOldWnCD6fGOpDV
	KwwKAdivHUnOxkv1wK9bQVSraBGfvkvF/Ui90Mbb3EV//Q20YsToYblGfQwxWdRZwckkfxqLvbM
	gaV+DP51ryvKx89aiIFy7qsN0TvEV/xQEOFuhdLAX1e5bhvteYAapio2EFdfC72YNHNcWXf2Hgk
	n5msDfxOFjWRNWvxWBw9xBUD1g=
X-Received: by 2002:a05:7301:4290:b0:34c:c5e8:6dc5 with SMTP id 5a478bee46e88-34cdbfd838cmr4745293eec.12.1790858588684;
        Thu, 01 Oct 2026 05:43:08 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db3e33b73sm7324176eec.18.2026.10.01.05.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:43:08 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: use errno in rtw_register_tx_alive()
Date: Thu,  1 Oct 2026 12:42:52 +0000
Message-ID: <20261001124252.7563-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the driver-specific _SUCCESS and _FAIL return values with
0 when TX can proceed and -EAGAIN when the firmware is not ready yet.

Handle -EAGAIN explicitly in rtl8723bs_xmit_buf_handler(). The buffers
remain queued and XMIT_ALIVE remains set so cpwm_int_hdl() can wake
the TX thread for another attempt. Return _SUCCESS in this case to
keep rtw_xmit_thread() running and waiting on xmit_comp; propagating
-EAGAIN would terminate the thread.

No functional change.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v3:
- Handle -EAGAIN explicitly in rtl8723bs_xmit_buf_handler(), as
  suggested by Greg.
- Explain why the deferred TX case returns _SUCCESS to keep the
  transmit thread running for a later retry.

Changes in v2:
- Use the standard 0/-errno return convention instead of bool, as
  suggested by Greg.
- Return -EAGAIN when the transmit path cannot proceed yet.

 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c    | 13 ++++++-------
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c  |  9 ++++++++-
 drivers/staging/rtl8723bs/include/rtw_pwrctrl.h |  2 +-
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 448611ad8237..00d64b2ff89e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -771,13 +771,12 @@ void rtw_unregister_task_alive(struct adapter *padapter, u32 task)
  * _SUCCESS	rtw_xmit_thread can write fifo/txcmd afterwards.
  * _FAIL		rtw_xmit_thread can not do anything.
  */
-s32 rtw_register_tx_alive(struct adapter *padapter)
+int rtw_register_tx_alive(struct adapter *padapter)
 {
-	s32 res;
+	int ret = 0;
 	struct pwrctrl_priv *pwrctrl;
 	u8 pslv;
 
-	res = _SUCCESS;
 	pwrctrl = adapter_to_pwrctl(padapter);
 	pslv = PS_STATE_S2;
 
@@ -788,7 +787,7 @@ s32 rtw_register_tx_alive(struct adapter *padapter)
 	if (pwrctrl->fw_current_in_ps_mode) {
 		if (pwrctrl->cpwm < pslv) {
 			if (pwrctrl->cpwm < PS_STATE_S2)
-				res = _FAIL;
+				ret = -EAGAIN;
 			if (pwrctrl->rpwm < pslv)
 				rtw_set_rpwm(padapter, pslv);
 		}
@@ -796,11 +795,11 @@ s32 rtw_register_tx_alive(struct adapter *padapter)
 
 	mutex_unlock(&pwrctrl->lock);
 
-	if (res == _FAIL)
+	if (ret)
 		if (pwrctrl->cpwm >= PS_STATE_S2)
-			res = _SUCCESS;
+			ret = 0;
 
-	return res;
+	return ret;
 }
 
 /*
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 0441e84ea87d..47f71e3ec633 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -140,9 +140,16 @@ s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
 		return _SUCCESS;
 
 	ret = rtw_register_tx_alive(padapter);
-	if (ret != _SUCCESS) {
+	if (ret == -EAGAIN) {
+		/*
+		 * Leave the buffers queued and XMIT_ALIVE registered so
+		 * cpwm_int_hdl() can wake this thread for another attempt.
+		 * Return success to keep the TX thread running.
+		 */
 		return _SUCCESS;
 	}
+	if (ret)
+		return _FAIL;
 
 	do {
 		queue_empty = rtl8723_dequeue_writeport(padapter);
diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index 49f19b6ee329..a14da6c18201 100644
--- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
@@ -217,7 +217,7 @@ void rtw_free_pwrctrl_priv(struct adapter *adapter);
 
 s32 rtw_register_task_alive(struct adapter *adapter, u32 task);
 void rtw_unregister_task_alive(struct adapter *adapter, u32 task);
-s32 rtw_register_tx_alive(struct adapter *padapter);
+int rtw_register_tx_alive(struct adapter *padapter);
 void rtw_unregister_tx_alive(struct adapter *padapter);
 s32 rtw_register_cmd_alive(struct adapter *padapter);
 void rtw_unregister_cmd_alive(struct adapter *padapter);
-- 
2.43.0

