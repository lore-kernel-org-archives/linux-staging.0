Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A1032694F
	for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 18:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779993955; cv=none; b=UH3D9DdA0LZ+4MRTvebNkEWPJIKp7ceBQgmkfkhYUNebtq14mAopI7WZehlEV6Ai9RHSTGzjnbwvSLh/qfdi3AVl02Ax2EeJmx8PwC7zlRj+ZlwThUogiGHPd+k3QpRyhKprQv8DRy7NGovi2KXLDwReGy2iZrOLW9RTv84X7Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779993955; c=relaxed/simple;
	bh=arvKR0v4QyhXvVt/KKq1IftXhjHiNsE8HfU26R+H5ak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XqIg24dAVIjiRk379XuALfUJXGsbO8HjUkxEMFtMENQ4Rr5tMiHazJMFHim9O486yjIm0bbD5gBUWynlLaF3lRA6azqfiqmEFEYwU4JDQm6qwWmSK01/eHRZNiOh86622Q42kbtsp3ZTKOITQ70O7KpJbW86zlPO3/vnxqOeus8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X531X/UT; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X531X/UT"
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-687d82dd690so8224634a12.2
        for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 11:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779993952; x=1780598752; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iCW+lnC0o11kzmUOHOKm8f5jkyEOjRNT7d2bsVeNRmE=;
        b=X531X/UTmvA89KWTy3ucx6RL7xXvZtJwyfSWgitkMHutiukeIyH9ijeR7xBlB2QpjE
         HU8zESFbcmw5YRj/PIJ96upWPWO2nOBrSIew0kcNwgL3rZg52Sx7pUMID1NQEkAxryaj
         nFsMHXQ/PjSltwfRMQSjXkJIod8Kz91PMI20WZKKZxYc4TPDcb5G+10k7YeR7/QfBhBe
         KQs9eEyYjBWsdF2iB4e0OjWRh0Xy5ud7TYIAmm5ABSsK+V0YhqcjK+YpmLMlpdze+hhP
         1BxSc0TlPKdyEjoVmRBMw/wYVKp3aYEm/AxytlxCZCCgvVxikTiLkhA9Wi3QvrRxM5c6
         vcbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779993952; x=1780598752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCW+lnC0o11kzmUOHOKm8f5jkyEOjRNT7d2bsVeNRmE=;
        b=MlL5+T2PcHJ+skH3KzSYD5wu9G/Lj0Q/kIHKdSeL1Tgn8EbDkHITm36IpcOhKl0Lp8
         lnbRQKD9OEzBaiiWCPYlgCMjbZicGJgzXAKg2Z8Rqv9PKvgNt5NO87j4vLIezyVUYIig
         vtdVbyQL1NVNjmIqGW18jUIQI1OB8vJ+FXGlfXl1d7saigh7LM9/B0mXi39CoUVtyKWc
         46YA2DBTc4wa1gKwVZ6negevUTxG8ynWfj8DJ7TzAyeNfbagdFBCQwQGJNFGseD72Zlr
         ll3ZsnfdAmMAs2K3eHdRgbMQ5wf66Jawj7s4Tt+MjqggHmiS+yXhkpJIQS+DZtkwOWeN
         hDEQ==
X-Gm-Message-State: AOJu0Ywz12hEKw5ngEb433rU0kNjH5HiRc92PGyQ5KS5ql1FxfQF9aqu
	HwObpMZuBMlBJiQK7OL7XVC0jVzwTPk3YwmG0jLgK6k2Yw4eXu+b7DM=
X-Gm-Gg: Acq92OFe8CF+SN4YO2iXzOyXxM5HRC6DaFDBgrNvOKA+17D0OGBk0bM9BTPrb1cqXO2
	hukG1gtzIO9vGLkZyQSi1RhJKRzMZ90FWBvtaD7bIVuqdai9jfxhds32SHnM4v0bxjFjrlfjzHR
	q2rl/RGD7kPG0IUQoPpsy24a5do/5dC1J/5R4XchCQmx6Pk6lLWJP8iUpdKv8v13wd/ksladgIY
	NaI5ujRNAKthasWoIRpxW+CQtfAwf9i2PDhHQFTLijOkw2uzWRfvy+5GioUQw9yi13avDxKdJc0
	CCjAnB3K8DDRVLOX5WogWTU5vKf7tlayQKu8Wi0tZnYRrXjI3u85af7jo6ezFtZXiYezy4SsQCw
	/hAChGzyTmCqdRkGV5/8t/NpqsUFfyrynoSkNIDVK6gIc6ygfGAPzOOIbwo6kMciUX84JchOd0y
	mrvRPk/3bobKu4UeNDWGqkzdyOuFxW4BfwazXoaUl1vxsuAdKhfKfnZ8a0LHo=
X-Received: by 2002:a05:6402:159a:b0:687:5157:1d4f with SMTP id 4fb4d7f45d1cf-6889cc7d497mr16289299a12.26.1779993951702;
        Thu, 28 May 2026 11:45:51 -0700 (PDT)
Received: from archlinux.itotolink.net ([217.196.163.117])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68a6fac077csm2141318a12.9.2026.05.28.11.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 11:45:51 -0700 (PDT)
From: Vitaliy Slivinskiy <phant0m.mail2023@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vitaliy Slivinskiy <phant0m.mail2023@gmail.com>
Subject: [PATCH] staging: rtl8723bs: clean up coding style in sdio_intf.c
Date: Thu, 28 May 2026 21:44:15 +0300
Message-ID: <20260528184415.63810-1-phant0m.mail2023@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warnings: remove unnecessary braces for single statement blocks, fix spacing around conditional operators, and remove multiple blank lines.

Signed-off-by: Vitaliy Slivinskiy <phant0m.mail2023@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d0feb28b7..17829b982 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -19,7 +19,7 @@ static const struct sdio_device_id sdio_ids[] = {
 	{ SDIO_DEVICE(0x024c, 0x0626), },
 	{ SDIO_DEVICE(0x024c, 0x0627), },
 	{ SDIO_DEVICE(0x024c, 0xb723), },
-	{ /* end: all zeroes */				},
+	{ /* end: all zeroes */		   },
 };
 MODULE_DEVICE_TABLE(sdio, sdio_ids);
 
@@ -47,7 +47,6 @@ static void sd_sync_int_hdl(struct sdio_func *func)
 {
 	struct dvobj_priv *psdpriv;
 
-
 	psdpriv = sdio_get_drvdata(func);
 
 	if (!psdpriv->if1)
@@ -77,7 +76,7 @@ static int sdio_alloc_irq(struct dvobj_priv *dvobj)
 
 	sdio_release_host(func);
 
-	return err?_FAIL:_SUCCESS;
+	return err ? _FAIL : _SUCCESS;
 }
 
 static void sdio_free_irq(struct dvobj_priv *dvobj)
@@ -144,13 +143,13 @@ static void sdio_deinit(struct dvobj_priv *dvobj)
 		sdio_claim_host(func);
 		sdio_disable_func(func);
 
-		if (dvobj->irq_alloc) {
+		if (dvobj->irq_alloc)
 			sdio_release_irq(func);
-		}
 
 		sdio_release_host(func);
 	}
 }
+
 static struct dvobj_priv *sdio_dvobj_init(struct sdio_func *func)
 {
 	struct dvobj_priv *dvobj = NULL;
@@ -216,8 +215,7 @@ static void sd_intf_stop(struct adapter *padapter)
 	rtw_hal_disable_interrupt(padapter);
 }
 
-
-static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct sdio_device_id  *pdid)
+static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct sdio_device_id *pdid)
 {
 	int status = _FAIL;
 	struct net_device *pnetdev;
@@ -250,11 +248,9 @@ static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct
 	/* 4 3.1 set hardware operation functions */
 	rtw_set_hal_ops(padapter);
 
-
 	/* 3 5. initialize Chip version */
 	padapter->intf_start = &sd_intf_start;
 	padapter->intf_stop = &sd_intf_stop;
-
 	padapter->intf_init = &sdio_init;
 	padapter->intf_deinit = &sdio_deinit;
 	padapter->intf_alloc_irq = &sdio_alloc_irq;
@@ -336,9 +332,7 @@ static void rtw_sdio_if1_deinit(struct adapter *if1)
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

