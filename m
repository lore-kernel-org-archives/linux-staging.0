Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC3415AAC1
	for <linux-staging@lists.linux.dev>; Sat,  5 Oct 2024 20:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728160492; cv=none; b=scl337VqTdjxxis2N0qGJWQm5yUsYENW7Ba5wJgygMwX5lVc/7qDVZP/3rniTAFleH/X3PSXZWVINmXuXbDqVDHckdQHF0HzCHRF5iOWnI2h8aVV8p1moXUFIT8RMgmsA1M27dZwJVdtiCHiorMwosKGFjYyGVYfuA4eQvng+qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728160492; c=relaxed/simple;
	bh=q5jkccRulWr/FM9cDWZHBbIPLgsceK1p3SYDkLvSpgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kgqqfvNn+5pqRjEVJoxjpR8AA62vkCSK0+d2FinbXqBsHpsbNRgs0K5LJCb+1rxjExubxr5KJywvdsDA5KG/e/4wvNPGp5CYdmz9ez1V92QhAOhrQ6zFP6m61befYHikiIV9RuVqro2Ui4+PATW2q8yk09iVSHdIHzQzNt1nCHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDFPQ1Cl; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDFPQ1Cl"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42cb7a2e4d6so32112955e9.0
        for <linux-staging@lists.linux.dev>; Sat, 05 Oct 2024 13:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728160489; x=1728765289; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGS5wmBGdEuYs+XoDSYSCpWyPDlISJFCe+zrt7w9w7w=;
        b=DDFPQ1ClkM4tNNMlQiurhL3aMtSI6ghzxIdC189fkb3l7sWtL67xiWP9235Ka+/+F6
         UEFOVbalhNIvDAJGoHu7l6iyZ042fDS6bvEaZuqmddq9dvCBFdyk21i5HYb2fgkCoO5I
         /Z6C2ywnG99RQuuK/iLF0zPZI3nl0UvMpAhe5GHF/zO1UCT+109MjBm1Lnp1nJPQpGGE
         jj+XNFc3CR2NBY253iVYc3ZXhBInxquh1vrUUQUcNoVUuukwf/V1Jv9MxJ6lHN4yLJjh
         S6WFpExQV0f5Yvlkv9tGvtaKSopoS3hHoH5YacbgMmNJXRO5b/WG2t3IQWN0fCkzFPfe
         OueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728160489; x=1728765289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EGS5wmBGdEuYs+XoDSYSCpWyPDlISJFCe+zrt7w9w7w=;
        b=KF7ngHoZqVBI7eS1A0zcAywK/h/czdh3ozgCa2gY0h1UgDQ1D4q/oUTuwFNnT9t1H1
         NLxDiKGeJesM6351DsUtwjTwBu0ZzVj8GlIT0linxlyOGh/KZCvqX2a1ViXryHRvdbSg
         h4GDIMOmP18aSAr0dyL4c9wEEc6xLAJUPwM5ACZYGpNiXKelbe62hFSNmevw8TgPiC+L
         HfR6283ixiOVeyljiB6DVDD66M8ukcLB9mNdNBFpK6s4WqeOhx3eaY3r0+qXfRToKHeP
         zGkpv0Dmbjtwb7Bdgb+nINJG4Ujh0enShUb+sL7pD2T75W0eNnLLIZVJJYm+DF68gykO
         o5sw==
X-Forwarded-Encrypted: i=1; AJvYcCUvfsr9QHh7fF6EGZ1IUo2ISGvf7oSS52o+x6auC+Ei2vKeBjsT1kYb5fvNWWmtt1/HeEJacyyq9pjd15gF@lists.linux.dev
X-Gm-Message-State: AOJu0YxrlLcXybJh9p0yItiPfQlVxQQKTp4c7kufdB/xAEdH5brvErY6
	sKRLt1L1Xkg1Bt+0GKvVqzzG3BIVlehlyNTCOxQJGyQyM2ZMHem9YdeV9eM2
X-Google-Smtp-Source: AGHT+IGitESMSPkFKM4+mm5oFRXBO9avimVzsrnOI1EzNSkPcMlWtmDxXldk+gy5mKpCNwM13iWSKw==
X-Received: by 2002:a05:600c:1da7:b0:42f:8d36:855e with SMTP id 5b1f17b1804b1-42f8d368710mr15580855e9.5.1728160488394;
        Sat, 05 Oct 2024 13:34:48 -0700 (PDT)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f85995932sm41824805e9.0.2024.10.05.13.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:34:48 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 02/15] staging: rtl8723bs: Remove function pointer hal_deinit
Date: Sat,  5 Oct 2024 22:33:45 +0200
Message-ID: <b0acbbdc372e01baabd1d98f824bc2a3c6c4c600.1727966761.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1727966761.git.philipp.g.hortmann@gmail.com>
References: <cover.1727966761.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function pointer hal_deinit and use rtl8723bs_hal_deinit directly
to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c          | 2 +-
 drivers/staging/rtl8723bs/hal/sdio_halinit.c      | 4 +---
 drivers/staging/rtl8723bs/include/hal_intf.h      | 2 --
 drivers/staging/rtl8723bs/include/rtl8723b_xmit.h | 1 +
 4 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 684d31360f4b..d9121e13fe69 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -107,7 +107,7 @@ uint rtw_hal_deinit(struct adapter *padapter)
 	uint status = _SUCCESS;
 	struct dvobj_priv *dvobj = adapter_to_dvobj(padapter);
 
-	status = padapter->HalFunc.hal_deinit(padapter);
+	status = rtl8723bs_hal_deinit(padapter);
 
 	if (status == _SUCCESS) {
 		padapter = dvobj->padapters;
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index b4819ff2928f..d7941fdf42e1 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -884,7 +884,7 @@ static void CardDisableRTL8723BSdio(struct adapter *padapter)
 	HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_card_disable_flow);
 }
 
-static u32 rtl8723bs_hal_deinit(struct adapter *padapter)
+u32 rtl8723bs_hal_deinit(struct adapter *padapter)
 {
 	struct dvobj_priv *psdpriv = padapter->dvobj;
 	struct debug_priv *pdbgpriv = &psdpriv->drv_dbg;
@@ -1259,8 +1259,6 @@ void rtl8723bs_set_hal_ops(struct adapter *padapter)
 
 	rtl8723b_set_hal_ops(pHalFunc);
 
-	pHalFunc->hal_deinit = &rtl8723bs_hal_deinit;
-
 	pHalFunc->init_xmit_priv = &rtl8723bs_init_xmit_priv;
 	pHalFunc->free_xmit_priv = &rtl8723bs_free_xmit_priv;
 
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index fc3a94e40721..40383d3cdcef 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -162,8 +162,6 @@ enum hal_intf_ps_func {
 typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 
 struct hal_ops {
-	u32 (*hal_deinit)(struct adapter *padapter);
-
 	void (*free_hal_data)(struct adapter *padapter);
 
 	s32	(*init_xmit_priv)(struct adapter *padapter);
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h b/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
index 5e3483cb22db..ac4ca7e05b9b 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
@@ -406,6 +406,7 @@ void rtl8723b_update_txdesc(struct xmit_frame *pxmitframe, u8 *pmem);
 void rtl8723b_fill_fake_txdesc(struct adapter *padapter, u8 *pDesc, u32 BufferLen, u8 IsPsPoll, u8 IsBTQosNull, u8 bDataFrame);
 
 u32 rtl8723bs_hal_init(struct adapter *padapter);
+u32 rtl8723bs_hal_deinit(struct adapter *padapter);
 s32 rtl8723bs_init_xmit_priv(struct adapter *padapter);
 void rtl8723bs_free_xmit_priv(struct adapter *padapter);
 s32 rtl8723bs_hal_xmit(struct adapter *padapter, struct xmit_frame *pxmitframe);
-- 
2.43.0

