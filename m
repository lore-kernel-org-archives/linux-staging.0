Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86491386B3
	for <linux-staging@lists.linux.dev>; Sun, 15 Sep 2024 06:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726382471; cv=none; b=uW65iGqwbHFegGoBLKNRJH7tnUcx6+qL+zIjOmKr2ck4r9YZ5hR6gApnf6EdSj40IvDZacHT4RhcGG1Q2fpzzHMwjYFFqF5/GdhoEwxf8LqA8IjI8fBwc+mLPgzrqi7Nn2trwIERz0XDZhqdIzx0VWCHc4G1dSMrulJ9IGOQOUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726382471; c=relaxed/simple;
	bh=bm+in/bZDdZsW5nXDYNaRP5O//JBB6QrnQLOajvKobg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UM8THh15jF6D3hS7I1CiXCkIgmnqf2qJDylonui+DKb+Bu7IYR7ghnUA68rn+6IyUEmj/Rq+sbh0rKdQujbWJlKRRwHRg0UHdwjxlAvemojc7j6tawcu1tFyUNozOdLb5BVFip1iUvshtDuJUWHSZHfRJ4nxRRY/mBzG/q0E9iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R6PMuX6i; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6PMuX6i"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a8a897bd4f1so289701266b.3
        for <linux-staging@lists.linux.dev>; Sat, 14 Sep 2024 23:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726382467; x=1726987267; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cm+krPeLY9fFAcvaYveFPeUshUV7bz2PqQAG4Jxxyls=;
        b=R6PMuX6iQXap4RDlFGJSHStMiBGx1Rw2TyDGMw/PVfKcxfd+k9TgOhjaUGEzZpCvzV
         1s7UXx3p7NK4ce6vfQ0WYtrkKCNAs/PZK6gxMgauM4wJzcCG4peyn5thS4uFFnfnc6KW
         dgcnGvPAai6GAxa+ePhyJpXTSnASK0hFL5KGqQe2d34quxA6S11hZkkDG3apvZBTJZBw
         dlE9liMTzXIOVX10NHN7k8JuS6IQRVNfQJaVq1V9t+Lsp9W5NqrMZfNc6DjTrhx6RHVg
         hPs7uIrcZYWGhNj6/ubcTzf4tGK8XU2hHsgFfUN5Kr+g/4VnlYiWDiNM8vd71itt/GWt
         /x5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726382467; x=1726987267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cm+krPeLY9fFAcvaYveFPeUshUV7bz2PqQAG4Jxxyls=;
        b=w3B7QwfTdGtDQ2RBe/KFNbzY5dnJYKlnyTUxMhf3dzpz+Vz0kgrkGSiITTb6N70emW
         D8sbrRB8kYQytFc+O55IvRnUn8LHiVPoGuOnTP43+7+RGbIRD1Yl5NOkGuQXlQaDQsH9
         WzctrbP0lI6Ha+HgZP53hLwTorj1Hn7AQK7NRUmyIjotMSmy6HV86O4AINewPK/IBPTh
         msisfZ1Hq+ZeUa480NZXvnsYi4RCuleNnxmBUNA+IWLir+C4SnudPK1FT0xJmdP/Zvz/
         4KOHShAx3B6s/NTf3NlZdqtQr/USP1gVmjrwyLe1OSX4ibOMW9Cbod1rzKlUhbpErqVU
         OkBw==
X-Forwarded-Encrypted: i=1; AJvYcCXWnCM/MeThJXiQ2jDoiHKtgXndprr1567V6LU33ELnvqlF6RlBYKrMlb6A1NAuVwfFFuPs73i5m74xEZNc@lists.linux.dev
X-Gm-Message-State: AOJu0YxJnjDqbfw73QFm/+e/ppqg6F9vuJ+HLp9N7G37VNiTG64EDVUj
	IhSoHsK3fWmLSf7YoYRASAkh330EDAeGGSu3OTxRywvCvnjHydjR
X-Google-Smtp-Source: AGHT+IGE5HTMbCYIzpxuBe7fuhRw7NH64mpLb1onb15wZ9MY3bfSQSVV464OieoNFhSmB+8uo2crDA==
X-Received: by 2002:a17:907:97cf:b0:a8a:906d:b485 with SMTP id a640c23a62f3a-a9047cad53cmr717861166b.26.1726382466739;
        Sat, 14 Sep 2024 23:41:06 -0700 (PDT)
Received: from kernel-710.speedport.ip (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610967bbsm160201066b.8.2024.09.14.23.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 23:41:06 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 15/17] staging: rtl8723bs: Remove constant result macro is_primary_adapter
Date: Sun, 15 Sep 2024 08:38:29 +0200
Message-ID: <72673acf8b0ada07530b0cb3705cde4cda5e752b.1726339782.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1726339782.git.philipp.g.hortmann@gmail.com>
References: <cover.1726339782.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove macro is_primary_adapter that returns always true to shorten code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  3 +--
 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  6 ++----
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |  3 ---
 drivers/staging/rtl8723bs/hal/hal_com.c       | 21 ++++++++-----------
 drivers/staging/rtl8723bs/hal/hal_intf.c      | 20 +++++++-----------
 drivers/staging/rtl8723bs/include/drv_types.h |  1 -
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  3 +--
 7 files changed, 21 insertions(+), 36 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 84ce7307d8f3..a04c66a0e25e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1258,8 +1258,7 @@ static void dynamic_chk_wk_hdl(struct adapter *padapter)
 
 
 	/* always call rtw_ps_processor() at last one. */
-	if (is_primary_adapter(padapter))
-		rtw_ps_processor(padapter);
+	rtw_ps_processor(padapter);
 }
 
 void lps_ctrl_wk_hdl(struct adapter *padapter, u8 lps_ctrl_type);
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index cbdb134278d3..5ded183aa08c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -911,8 +911,7 @@ inline void rtw_indicate_scan_done(struct adapter *padapter, bool aborted)
 {
 	rtw_os_indicate_scan_done(padapter, aborted);
 
-	if (is_primary_adapter(padapter) &&
-	    (!adapter_to_pwrctl(padapter)->bInSuspend) &&
+	if ((!adapter_to_pwrctl(padapter)->bInSuspend) &&
 	    (!check_fwstate(&padapter->mlmepriv,
 			    WIFI_ASOC_STATE|WIFI_UNDER_LINKING))) {
 		rtw_set_ips_deny(padapter, 0);
@@ -1589,8 +1588,7 @@ void rtw_dynamic_check_timer_handler(struct adapter *adapter)
 		}
 
 	} else {
-		if (is_primary_adapter(adapter))
-			rtw_dynamic_chk_wk_cmd(adapter);
+		rtw_dynamic_chk_wk_cmd(adapter);
 	}
 
 	/* auto site survey */
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index dbfcbac3d855..6ddd73b9cb29 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -73,9 +73,6 @@ int ips_leave(struct adapter *padapter)
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
 	int ret;
 
-	if (!is_primary_adapter(padapter))
-		return _SUCCESS;
-
 	mutex_lock(&pwrpriv->lock);
 	ret = _ips_leave(padapter);
 	mutex_unlock(&pwrpriv->lock);
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 492889c837d9..54d5225564e4 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -13,23 +13,20 @@
 
 u8 rtw_hal_data_init(struct adapter *padapter)
 {
-	if (is_primary_adapter(padapter)) {	/* if (padapter->isprimary) */
-		padapter->hal_data_sz = sizeof(struct hal_com_data);
-		padapter->HalData = vzalloc(padapter->hal_data_sz);
-		if (!padapter->HalData)
-			return _FAIL;
-	}
+	padapter->hal_data_sz = sizeof(struct hal_com_data);
+	padapter->HalData = vzalloc(padapter->hal_data_sz);
+	if (!padapter->HalData)
+		return _FAIL;
+
 	return _SUCCESS;
 }
 
 void rtw_hal_data_deinit(struct adapter *padapter)
 {
-	if (is_primary_adapter(padapter)) {	/* if (padapter->isprimary) */
-		if (padapter->HalData) {
-			vfree(padapter->HalData);
-			padapter->HalData = NULL;
-			padapter->hal_data_sz = 0;
-		}
+	if (padapter->HalData) {
+		vfree(padapter->HalData);
+		padapter->HalData = NULL;
+		padapter->hal_data_sz = 0;
 	}
 }
 
diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 0a3900548fd2..d675a5eeaddb 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -27,9 +27,8 @@ void rtw_hal_read_chip_version(struct adapter *padapter)
 
 void rtw_hal_def_value_init(struct adapter *padapter)
 {
-	if (is_primary_adapter(padapter))
-		if (padapter->HalFunc.init_default_value)
-			padapter->HalFunc.init_default_value(padapter);
+	if (padapter->HalFunc.init_default_value)
+		padapter->HalFunc.init_default_value(padapter);
 }
 
 void rtw_hal_free_data(struct adapter *padapter)
@@ -37,24 +36,21 @@ void rtw_hal_free_data(struct adapter *padapter)
 	/* free HAL Data */
 	rtw_hal_data_deinit(padapter);
 
-	if (is_primary_adapter(padapter))
-		if (padapter->HalFunc.free_hal_data)
-			padapter->HalFunc.free_hal_data(padapter);
+	if (padapter->HalFunc.free_hal_data)
+		padapter->HalFunc.free_hal_data(padapter);
 }
 
 void rtw_hal_dm_init(struct adapter *padapter)
 {
-	if (is_primary_adapter(padapter))
-		if (padapter->HalFunc.dm_init)
-			padapter->HalFunc.dm_init(padapter);
+	if (padapter->HalFunc.dm_init)
+		padapter->HalFunc.dm_init(padapter);
 }
 
 void rtw_hal_dm_deinit(struct adapter *padapter)
 {
 	/*  cancel dm  timer */
-	if (is_primary_adapter(padapter))
-		if (padapter->HalFunc.dm_deinit)
-			padapter->HalFunc.dm_deinit(padapter);
+	if (padapter->HalFunc.dm_deinit)
+		padapter->HalFunc.dm_deinit(padapter);
 }
 
 static void rtw_hal_init_opmode(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 0094eed6c32d..2b12a2313707 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -182,7 +182,6 @@ struct registry_priv {
 
 #include <drv_types_sdio.h>
 
-#define is_primary_adapter(adapter) (1)
 #define get_iface_type(adapter) (IFACE_PORT0)
 #define GET_PRIMARY_ADAPTER(padapter) (((struct adapter *)padapter)->dvobj->if1)
 #define GET_IFACE_NUMS(padapter) (((struct adapter *)padapter)->dvobj->iface_nums)
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index fc9b9c5efb50..aa608dee4464 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -633,8 +633,7 @@ void rtw_reset_drv_sw(struct adapter *padapter)
 	struct pwrctrl_priv *pwrctrlpriv = adapter_to_pwrctl(padapter);
 
 	/* hal_priv */
-	if (is_primary_adapter(padapter))
-		rtw_hal_def_value_init(padapter);
+	rtw_hal_def_value_init(padapter);
 
 	RTW_ENABLE_FUNC(padapter, DF_RX_BIT);
 	RTW_ENABLE_FUNC(padapter, DF_TX_BIT);
-- 
2.43.0

