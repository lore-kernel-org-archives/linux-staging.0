Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AA5306B1B
	for <linux-staging@lists.linux.dev>; Sun, 31 May 2026 17:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780246832; cv=none; b=WPL0ZTFKJQHBIOTMXrZIURFGaqNR11F5BQCJf+Iz7AHjYFkB+JzR9oHS0sAIe7jmci+1/z7gxx8oVsMWREg0iVFEL6fqmSbWmD6n7nkh7qwz3FVxf3LT27XAxvv7DJ9vnGUYOJLpaTXSMn5fwh/Mslqv3nzcMXT9zT0iHFx0o0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780246832; c=relaxed/simple;
	bh=7oILcHy2OaYSqC//v30gxSWvYLcti5DYdhxLJK1ND/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sQ4iwE0gCYlXf6ZBOLtpWZPpIAu/1BDNB9MAT/bjRtXg2D50ajSTsD/abiKpCWX8SNui/UCMs4vDOK66ql1wSjRHgQkonmRtaZOyTfefTrJLX7wNdl5lE3BHXFj0c6uYhdHdD0JrAB9BBEOgI7/AGnWNkEHaRL+iyjGO4BP43GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pq3orDN8; arc=none smtp.client-ip=209.85.208.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pq3orDN8"
Received: by mail-ed1-f66.google.com with SMTP id 4fb4d7f45d1cf-68b73f1a8ebso5266220a12.1
        for <linux-staging@lists.linux.dev>; Sun, 31 May 2026 10:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780246830; x=1780851630; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8l2ztJsz5ci2VqRTOG3WO8D5D9WBDRBiP4Iv9K0GHsU=;
        b=Pq3orDN80X/aJhnxJeYj48dNcaLCNvwYeMIWk9d8g70kukUQvKOGio4jcw+/niTyPq
         tBC1dhqtkQOEEXahfIHe9+w40cE92KWFH9NrPQLfVFbGf4cEfKotesA5gV8Bt0l1qtf7
         jgk+jU2idBchY3stYFyykPpAllaXL2N0lFrnBr2OevmqDyirS11B+UPPN/w0B/BxkIqV
         2btaDaC2ByoHAsGlW2ut3VlYnlNaULt+h31Xl/nZrJONiU8mFYucOj+DjFpNiYkYFHZC
         L98Q8RKzYjTrKxZZ2htYTyZ/lX7D7oTNiBwIgwCDcjdjfzvi24bkP424FgwGbTFfiV4k
         C8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780246830; x=1780851630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8l2ztJsz5ci2VqRTOG3WO8D5D9WBDRBiP4Iv9K0GHsU=;
        b=L5ldyOxTrDV52c4isQ6O3WWSQ+z1DTA7b1qNHSuenLSTNsQf09WgakzVHLcppjZzfu
         BByEbSh9s6KEPLVLAZOtdWYtld82jsnK6dh4QmNylQEhw6rWST96+FplIY0UNTkiR+Ec
         8+fkLbWGIkYTfwWyfOxyClFytVEo/6SemboZ5xRApM7bkxjfPohZGY+o69TMipHrZU8D
         0DPhm/iEtiKeAv5PZWDUdJtFKMXbReEgtl8lnWEW4Tfc/Rpjy0WgYr+i4zUaqUgNwI5L
         /XWSqK7c6xEC0jdVgNSPmPvGMsfcJxHLbK2xBIoJyXrKCzCGxUEcSjfEe6gIn/AjMp6F
         VBqw==
X-Gm-Message-State: AOJu0Yzxc0hNFJ5uTm6xdo2H06Ln9LCLtNOj0Cp1rm6wspnfUhlpd0FZ
	QR7hGEKKWtxp5bsRjgAz6t/vqZ6tHVpNEScROkNAeCS7RnX2OrxjeEk=
X-Gm-Gg: Acq92OHXTh6dpa0SB2HJ8hwegI97ItF/IJKOtPpyT1mGZut1D/l/NLa/FW5qT6avrBI
	DYpsTnjFAuVaoRsWstzOpVUA3IblbsfGWyoOvHGlPHi7qB56FaUx5Q8Yp4YeaMQGdyn17dAYw92
	LzYJfATnaqkNmMUJQOZ7mXEqEV/P4vEzp1jD9y2Uv/yHaM4RKS8cyf9HiJKaHFdxe0hoei5PclH
	VrZGRxI6lugPbLalp6ersaHz6TBd9Q1YM+5UEsdh4h2KJ8jNY0nqCf+4ary8w8zOlSzVoz07EEi
	jUtO3MSAyc9ZVaJ/zaOF/QTUsxbSHjj3ZklgskyNy6tfvTzWc3GP/bmULRA1h+QV9klduYm6gkB
	/LUyfOTg76Ga08YxJYZTmwEaS1YEbLIdUL5uQyYqa0S42yT0Ceu+3kzOI54GhhpRxE2I/puYCwX
	qdCPyQEYMJUMgt50sKf3GU1b/tw8uXpiR5h/e2Iym2ARkJ8+aEw0+sRPxTL+w=
X-Received: by 2002:a05:6402:c44:b0:68c:d4e:3a4a with SMTP id 4fb4d7f45d1cf-68c890169cemr3534519a12.7.1780246829837;
        Sun, 31 May 2026 10:00:29 -0700 (PDT)
Received: from archlinux.itotolink.net ([217.196.163.117])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68ceb869dfdsm1184310a12.29.2026.05.31.10.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 10:00:29 -0700 (PDT)
From: Vitaliy Slivinskiy <phant0m.mail2023@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Vitaliy Slivinskiy <phant0m.mail2023@gmail.com>
Subject: [PATCH v3 3/3] staging: rtl8723bs: clean up blank lines and function formatting
Date: Sun, 31 May 2026 19:58:49 +0300
Message-ID: <20260531165849.283264-4-phant0m.mail2023@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260531165849.283264-1-phant0m.mail2023@gmail.com>
References: <20260531165849.283264-1-phant0m.mail2023@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl checks regarding multiple blank lines, missing blank lines after functions, and function declarations ending with an open parenthesis.

Signed-off-by: Vitaliy Slivinskiy <phant0m.mail2023@gmail.com>
---
Changes in v3:
- Split changes into multiple patches.
- Fixed sentinel entry formatting.

 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 9d936b8349f0..06f1b2ff05f4 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -48,7 +48,6 @@ static void sd_sync_int_hdl(struct sdio_func *func)
 {
 	struct dvobj_priv *psdpriv;
 
-
 	psdpriv = sdio_get_drvdata(func);
 
 	if (!psdpriv->if1)
@@ -151,6 +150,7 @@ static void sdio_deinit(struct dvobj_priv *dvobj)
 		sdio_release_host(func);
 	}
 }
+
 static struct dvobj_priv *sdio_dvobj_init(struct sdio_func *func)
 {
 	struct dvobj_priv *dvobj = NULL;
@@ -214,8 +214,7 @@ static void sd_intf_stop(struct adapter *padapter)
 	rtw_sdio_disable_interrupt(padapter);
 }
 
-
-static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct sdio_device_id  *pdid)
+static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct sdio_device_id *pdid)
 {
 	int status = _FAIL;
 	struct net_device *pnetdev;
@@ -248,7 +247,6 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
 	/* 4 3.1 set hardware operation functions */
 	rtw_set_hal_ops(padapter);
 
-
 	/* 3 5. initialize Chip version */
 	padapter->intf_start = &sd_intf_start;
 	padapter->intf_stop = &sd_intf_stop;
@@ -334,9 +332,7 @@ static void rtw_sdio_if1_deinit(struct adapter *if1)
  * notes: drv_init() is called when the bus driver has located a card for us to support.
  *        We accept the new device by returning 0.
  */
-static int rtw_drv_init(
-	struct sdio_func *func,
-	const struct sdio_device_id *id)
+static int rtw_drv_init(struct sdio_func *func, const struct sdio_device_id *id)
 {
 	int status = _FAIL;
 	struct adapter *if1 = NULL;
-- 
2.53.0

