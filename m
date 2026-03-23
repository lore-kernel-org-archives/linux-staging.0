Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A52E3112BC
	for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 23:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774308337; cv=none; b=FpdlE1kFXr1T9VmpUKeEN1dKJlRscq8PjrNlsf+qTtuMKDE9veEN3PBnUlzBV1OkB82cwt4amogBUAmnrnJZZJbhI96HDSv2tourDZ79qIF4a9JM5gm4GIqVFlo1tM8OqzcBqmr1mA8giP79YE4YkiYkEpATKKLWqbZdFzxYtIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774308337; c=relaxed/simple;
	bh=eITXHaozo6vADCkc8O2OVwzYvtVluDBEmszcR4mumsA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rkoRvxH7wsJzcsWjQjgCvW8pnW5RHBEAGAiGALAO3UVVn3ilX2D4iN07VyxigbHaw2BQ4Pszfuk5BdTyQcbJzTcoC5x95O4xqKDo4Tw8xtaqb0wN0TuQn770T+GaR/HU3ypcOaM+9quBruAaEi3joPaFPXUYbgRNJNd2DsXvxKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iIYoloxv; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iIYoloxv"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43b7481f9d3so1037538f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 16:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774308333; x=1774913133; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=so2pmTc1fzbBN2ER2ICEfia2r85CFvfiwopJL0bNT2M=;
        b=iIYoloxvmTNi9mu03tH4gCj0NmG8yDm4e4yB5t2iLpg0TP2kt08xPe+q2L0+ud5XHi
         +YNKq3BWpQZe8ZJc39Cof0beqXiRdlYyfuaV95NpsMjkQ+niHdMk939TF/+EJhIMnwxn
         jXKXkHdEEOmmZHglJqmyip61l07IwEkbgvzefFWcrX9T4FFWxMiYeR+OALi5JsxFvvIT
         z/CqTvuhqDGUyS7VW9KPpVCd/JqiPR+BQVSvOXs2eUUsd+XvN2Yb6r1QN0bof5IaPdAb
         DWjR3Juokfvn/ZsMgRWuzKPrw8iUxwzyDA4PPv22PQ1RKG2m8mgcd88b9+p3ZrfcysS/
         u6fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774308333; x=1774913133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=so2pmTc1fzbBN2ER2ICEfia2r85CFvfiwopJL0bNT2M=;
        b=KOw/mnKQnxn8zP40TcBy//ZkBPSHmDJA9TV73oZ1wbmrxZPvMkIDfpg5ajAY5+gFV8
         KhVvcrDvo2owEtN/qLPshoqU0A2lOwhGqjx/1O4H0605EziVuZXuShguCG/grTaYsrW2
         WrsTsNhyaUCXCf6ORX5rFDWuh2nFk1IBGdtHGnx3utYZfQwxHHBXCrI8kIZFA5FxRXe/
         RTjmb26G7dYAH8aUifRFOhHlXajBwhFC78A/t6Ddi8pWQ/QVqD0btVp5rHOyIoAAYCmA
         5raE8SVSmjwne1+T2wo+QEQTelmGzEKmWrw5s6QCZRsXjjrzJsc2jcyyJ+0dy06db1wZ
         c4sw==
X-Gm-Message-State: AOJu0Yy2OPaGM5rxy51OjkDHOT2DgeRv91bAKlhpvFNkm3zlpNpUcdlH
	/a/FtwSJhl0L0AEDPpDUk/AMG+8f3cC++J/hd7u0QM5EZqjucVzCWPDy
X-Gm-Gg: ATEYQzySC4EFshQglEaxYpEmXAZ4Ie2Flhhiv17Jw25tQLa6e07UOORKYAg4lYTzoLp
	bwxfPjpIird4TTuLr516wgYEcOl3ujkrHq+MQcqxNArl8HNLHmucrTXcUtC6AOpQzYeK1ZWGxTG
	8XyisCxh6pJxd/kv7nH9rA1GpudyflngPL+R0tbxaoJ8fFWbTQ6FqjiPGFq5wdys2wtrpuNwpvN
	JGnzpjgj3Olf75l3MmLRvlDDZy+2TXd0DsCqYArbRaemqAzLQXybKgl+N8IS1Vwz1GAwKbUzQ2N
	/FouTVDmE1nsjPP1+YxnEBu/cIitnnYxtoCOGBJmn/dOvxIjfgcQlHTy2ZEMhClrwLGKM9UkEop
	VUOeCx0EVkYtAAmRTJgGtCF0DVSMgENw2g4R6YNDHpL7SIL+bpIpONX/G3R+VN0m6FVRBTkgy5D
	6hwyPl0PwJUXmgj98jIAEthuw=
X-Received: by 2002:a05:6000:4203:b0:439:af25:e4ea with SMTP id ffacd0b85a97d-43b64277131mr20611736f8f.25.1774308332464;
        Mon, 23 Mar 2026 16:25:32 -0700 (PDT)
Received: from potato ([31.176.182.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470b1f7sm32890664f8f.25.2026.03.23.16.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 16:25:31 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix error handling in sdio_dvobj_init and it's callees
Date: Tue, 24 Mar 2026 00:25:26 +0100
Message-ID: <20260323232526.25288-1-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Return proper errno values instead of vendor-defined non-descriptive
_SUCCESS/_FAIL macros
Callers only check for non-zero return values, so this does not change
behaviour while improving correctness.

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c  |  7 ++++---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 19 +++++++++++--------
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 7ba689f2dfc8..80ff3154f6e7 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -1136,9 +1136,10 @@ static int rtw_resume_process_normal(struct adapter *padapter)
 	pmlmepriv = &padapter->mlmepriv;
 	/*  interface init */
 	/* if (sdio_init(adapter_to_dvobj(padapter)) != _SUCCESS) */
-	if ((padapter->intf_init) && (padapter->intf_init(adapter_to_dvobj(padapter)) != _SUCCESS)) {
-		ret = -1;
-		goto exit;
+	if (padapter->intf_init) {
+		ret = padapter->intf_init(adapter_to_dvobj(padapter));
+		if (ret)
+			goto exit;
 	}
 	rtw_hal_disable_interrupt(padapter);
 	/* if (sdio_alloc_irq(adapter_to_dvobj(padapter)) != _SUCCESS) */
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d664e254912c..0d6475bfbaba 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -131,9 +131,7 @@ static u32 sdio_init(struct dvobj_priv *dvobj)
 release:
 	sdio_release_host(func);
 
-	if (err)
-		return _FAIL;
-	return _SUCCESS;
+	return err;
 }
 
 static void sdio_deinit(struct dvobj_priv *dvobj)
@@ -159,16 +157,19 @@ static struct dvobj_priv *sdio_dvobj_init(struct sdio_func *func)
 	struct dvobj_priv *dvobj = NULL;
 	struct sdio_data *psdio;
 
-	dvobj = devobj_init();
-	if (!dvobj)
+	dvobj = devobj_init();
+	if (!dvobj) {
+		dvobj = ERR_PTR(-ENOMEM);
 		goto exit;
+	}
 
 	sdio_set_drvdata(func, dvobj);
 
 	psdio = &dvobj->intf_data;
 	psdio->func = func;
 
-	if (sdio_init(dvobj) != _SUCCESS)
+	status = sdio_init(dvobj);
+	if (status)
 		goto free_dvobj;
 
 	rtw_reset_continual_io_error(dvobj);
@@ -180,7 +181,7 @@ static struct dvobj_priv *sdio_dvobj_init(struct sdio_func *func)
 
 		devobj_deinit(dvobj);
 
-		dvobj = NULL;
+		dvobj = ERR_PTR(status);
 	}
 exit:
 	return dvobj;
@@ -350,8 +351,10 @@ static int rtw_drv_init(
 	struct dvobj_priv *dvobj;
 
 	dvobj = sdio_dvobj_init(func);
-	if (!dvobj)
+	if (IS_ERR(dvobj)) {
+		status = PTR_ERR(dvobj);
 		goto exit;
+	}
 
 	if1 = rtw_sdio_if1_init(dvobj, id);
 	if (!if1)
-- 
2.51.0

