Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F53415F0D
	for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 15:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785252413; cv=none; b=GG6Gprja/6L36Jwy2qbFRLvkX1QuX4yfomBe+LSBxC4mAMwJHaV+Wf71UwDw4cyM6JM8NRo7v2z/8GEFph7xg3HnbHFnx2lsymIfWkOj/RUMr4CrVBLbqvvr5Z2cZFGQIRaGNhyS7Yj9zKNksmBUnB11o8AkYVKuAfcIc+9X1o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785252413; c=relaxed/simple;
	bh=kZrrZZWGPdcV7SfWS6ggm+lAzdtHzp0FQD9ABDssBI0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ATuB9kVGMDC3o6ENE2HwN5mkTer9gj6EZjFt9F0v8h+NeCLAnceT9LtHCeUzmXGCV1nhjBno9jMTnROEEyQ6Fk2y/tv5vwygmIR2fa+YDPK4J6U9P97vXJMpwYaYa2tUjFf8DXy3ZwZVD3K7SR3vRSNR6CxrOh6zgmqBOiXjBNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QTYMrQQ9; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QTYMrQQ9"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49558ce01afso30036335e9.1
        for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 08:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785252409; x=1785857209; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dMH/1XOdyJ9P1EUbZssMT6pr1HBRVEjc3EUUDHcjPoY=;
        b=QTYMrQQ9wwFAYpeys7h/bCf82sAfPQa7KFe6tp+vm4mfGvgdaP6M2fiIAWW6HKXNJ2
         ckFYikwqKPGWIaXM7Fl/fDH51kf51PGz+PK295JgHYjbQJ3UUBNApMJSjzoIXLXenWaM
         xeLHfF9OBlabws4mSPkVIahu5s4XS1cCHMb9vNWXI361LhZaXlnDgjdqpt4rr1Vh+VU4
         83H/44UYAdTs161IW7FrpH7qJbUJtAT54hwdcf7C88JHHb/Deq2biBeHJ/KNQi1ECkyZ
         CTZhZvKZwV27ZCYQRDTxKKmesJwICIob2RWBiqopvOsGLCcWbzd2J3rb/EesqzLucmEd
         dc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785252409; x=1785857209;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dMH/1XOdyJ9P1EUbZssMT6pr1HBRVEjc3EUUDHcjPoY=;
        b=SJiYZNXjW871IACyonlevTn0Unrl+rWRPvRezorusdfFybhO1anJ1rRB1Cit44yBo3
         hvLJxBbgxnzJYn3B2de77mjGv+RlrBEvjgbD6eDPOhBIMCa55vt7KB/4p7jV0FAbHnIX
         Ir2uqQRRMbvjwsVdozcvMf1I6Y/cxpP3arzmDErCTmF5Vm4W7hviL5dNIy9KWPJzojBf
         gOI+kfoHHL8lqeDpRL0WuT1GRQDLb3vmL2tIPdi57vw6dNPzTKXSoqJ8pXkOujLvV1b4
         KS2ciefnZpaNkf/z1jLeE+JAnc+kLIhN0LcYxRvaIzwrDYEpUZ6N1S8KT3hAORipIq2y
         cu8w==
X-Gm-Message-State: AOJu0YxPyMEMjGFqWPSknquw1JgPclgjSFr+FH3Q5ImQQfpEOuaUrL8k
	44V7K3AeiD6HRtgo8Y+vIHuECfc8e5ZtBPjyAdQsmMIqWR7j+XLokCcy
X-Gm-Gg: AR+sD12NBVl8q78bZPBM7VQtcbtfSH+RowKUEISQTDuWiHb9hEVf8iaD/UJTYXUnKg+
	51sN5Es4mTpbonKISE64g0ZCUCzX2iRXGpji/R+R8maUR1iM/SQblC6eIPGbC1HMM2ckEIfLcLA
	a9+hjR8NHYd1fAAJj8LUqR6P5Qs1z99bqeYi2Qjt/4EL2fXkmvnhWTUozC3UkKNFjmJagKBFNGG
	5lCTjUh2yex3Zz00UkcIEm/YB3ojUmDpDHRXP0QPawhjBJluOJrhWfO+bmjWdZqYriNGgPD4rUJ
	8plXl4uKZ89vdRfd4tQ683/wblCpTZ6djnCWpI6hjBOosNFmyJwsJPkRw25euCJ5CDC8CiXyvga
	2G2e8Jvs03kKvM0Z12DXb3fh9K2NMZUFAmTJJa1DraG2WbTubYItILeLKLiqN+AHe+aOl2jFU7v
	Uu
X-Received: by 2002:a05:600c:154b:b0:495:4859:8f9b with SMTP id 5b1f17b1804b1-496c6420e39mr31886115e9.9.1785252408380;
        Tue, 28 Jul 2026 08:26:48 -0700 (PDT)
Received: from fedora ([41.204.187.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957b5f35a1sm283742365e9.0.2026.07.28.08.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:26:47 -0700 (PDT)
Date: Tue, 28 Jul 2026 18:26:43 +0300
From: Bramwel Barack <bramwelbarack89@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: fix line length warnings in os_intfs.c
Message-ID: <amjKM_tz7ul0vj40@fedora>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The current formatting standards in the file rtl8723bs violates the
kernel coding standards of 100 lines.
Targeted most comments of code while avoiding key functions and comments
included due to indents.

From 08a6ba8dd59504c030c0e6c9f9459a53436d32eb Mon Sep 17 00:00:00 2001
From: Bramwel Barack <bramwelbarack89@gmail.com>
Date: Tue, 28 Jul 2026 17:50:30 +0300
Subject: [PATCH] staging: rtl8723bs: fix line length warnings in os_intfs.c

Signed-off-by: Bramwel Barack <bramwelbarack89@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 37 ++++++++++++++++-----
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index c15056ee207c..c916f6f52253 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -71,20 +71,36 @@ int rtw_ht_enable = 1;
  * 0x01 means enable 2.4G 40MHz
  */
 static int rtw_bw_mode = 0x01;
-static int rtw_ampdu_enable = 1;/* for enable tx_ampdu ,0: disable, 0x1:enable (but wifi_spec should be 0), 0x2: force enable (don't care wifi_spec) */
+static int rtw_ampdu_enable = 1;
+/*  for enable tx_ampdu ,0: disable */
+/*  0x1:enable (but wifi_spec should be 0) */
+/*  0x2: force enable (don't care wifi_spec) */
 static int rtw_rx_stbc = 1;/*  0: disable, 1:enable 2.4g */
-static int rtw_ampdu_amsdu;/*  0: disabled, 1:enabled, 2:auto . There is an IOT issu with DLINK DIR-629 when the flag turn on */
+static int rtw_ampdu_amsdu;
+/*  0: disabled */
+/*  1:enabled */
+/*  2:auto */
+/*  There is an IOT issu with DLINK DIR-629 when the flag turn on */
 /*  Short GI support Bit Map */
 /*  BIT0 - 20MHz, 0: non-support, 1: support */
 /*  BIT1 - 40MHz, 0: non-support, 1: support */
 /*  BIT2 - 80MHz, 0: non-support, 1: support */
 /*  BIT3 - 160MHz, 0: non-support, 1: support */
 static int rtw_short_gi = 0xf;
-/*  BIT0: Enable VHT LDPC Rx, BIT1: Enable VHT LDPC Tx, BIT4: Enable HT LDPC Rx, BIT5: Enable HT LDPC Tx */
+/*  BIT0: Enable VHT LDPC Rx */
+/*  BIT1: Enable VHT LDPC Tx */
+/*  BIT4: Enable HT LDPC Rx */
+/*  BIT5: Enable HT LDPC Tx */
 static int rtw_ldpc_cap = 0x33;
-/*  BIT0: Enable VHT STBC Rx, BIT1: Enable VHT STBC Tx, BIT4: Enable HT STBC Rx, BIT5: Enable HT STBC Tx */
+/*  BIT0: Enable VHT STBC Rx */
+/*  BIT1: Enable VHT STBC Tx */
+/*  BIT4: Enable HT STBC Rx */
+/*  BIT5: Enable HT STBC Tx */
 static int rtw_stbc_cap = 0x13;
-/*  BIT0: Enable VHT Beamformer, BIT1: Enable VHT Beamformee, BIT4: Enable HT Beamformer, BIT5: Enable HT Beamformee */
+/*  BIT0: Enable VHT Beamformer */
+/*  BIT1: Enable VHT Beamformee */
+/*  BIT4: Enable HT Beamformer */
+/*  BIT5: Enable HT Beamformee */
 static int rtw_beamform_cap = 0x2;
 
 static int rtw_lowrate_two_xmit = 1;/* Use 2 path Tx to transmit MCS0~7 and legacy mode */
@@ -98,7 +114,11 @@ module_param(rtw_ant_num, int, 0644);
 MODULE_PARM_DESC(rtw_ant_num, "Antenna number setting");
 
 static int rtw_antdiv_cfg = 1; /*  0:OFF , 1:ON, 2:decide by Efuse config */
-static int rtw_antdiv_type; /* 0:decide by efuse  1: for 88EE, 1Tx and 1RxCG are diversity.(2 Ant with SPDT), 2:  for 88EE, 1Tx and 2Rx are diversity.(2 Ant, Tx and RxCG are both on aux port, RxCS is on main port), 3: for 88EE, 1Tx and 1RxCG are fixed.(1Ant, Tx and RxCG are both on aux port) */
+static int rtw_antdiv_type;
+/* 0:decide by efuse  1: for 88EE, 1Tx and 1RxCG are diversity */
+/* (2 Ant with SPDT), 2:  for 88EE, 1Tx and 2Rx are diversity. */
+/* (2 Ant, Tx and RxCG are both on aux port, RxCS is on main port) */
+/*3: for 88EE, 1Tx and 1RxCG are fixed.(1Ant, Tx and RxCG are both on aux port) */
 
 static int rtw_hw_wps_pbc;
 
@@ -473,7 +493,8 @@ u32 rtw_start_drv_threads(struct adapter *padapter)
 	if (IS_ERR(padapter->cmdThread))
 		_status = _FAIL;
 	else
-		wait_for_completion(&padapter->cmdpriv.terminate_cmdthread_comp); /* wait for cmd_thread to run */
+		wait_for_completion(&padapter->cmdpriv.terminate_cmdthread_comp);
+	/* wait for cmd_thread to run */
 
 	padapter->xmitpriv.SdioXmitThread = kthread_run(rtl8723bs_xmit_thread,
 							padapter, "RTWHALXT");
@@ -659,7 +680,7 @@ u8 rtw_init_drv_sw(struct adapter *padapter)
 		goto free_xmit_priv;
 	spin_lock_init(&padapter->security_key_mutex);
 
-	/*  We don't need to memset padapter->XXX to zero, because adapter is allocated by vzalloc(). */
+	/* We don't need to memset padapter->XXX to zero, because adapter is allocated by vzalloc(). */
 	/* memset((unsigned char *)&padapter->securitypriv, 0, sizeof (struct security_priv)); */
 
 	if (_rtw_init_sta_priv(&padapter->stapriv) == _FAIL)
-- 
2.55.0

