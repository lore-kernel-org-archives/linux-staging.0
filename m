Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC4844682E
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119823; cv=none; b=DFC8kAmduyZ2xNSf0k6YrZzjLg16H9U/pO1RXjazGfLMSmPqOwCljNwfzusb2TJvOBb4vvKoK6y2QTzSupwSW8tKbwpD8KN2FeMPCMU5H8SrDpm4dH5+vuUmr9GnJyRcMh0XPBy/y0pbXl8dlAouDCas8/58wBjS8EXXLawt/04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119823; c=relaxed/simple;
	bh=HienQwcFUNgUwnMwcPw9INFjVyfYyO9GXcFaWoZq2AI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IiZa53IeevOq5R0gBXgn5QIserXRZVtv9vkuepkT9D2T8RMYmnqHjZhxty4yGTvMqt6UFr8r+kWxud75F1YdtIPVlwbUYPFZCdnN+j6oe0zH5bXKq4vP8MIU5vxGfiFLodzTX30fWfkt5xA8XC09XFZOftGAPBHTNGiy3KypkEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OsLA97p5; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OsLA97p5"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b00d083818so560399e87.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119820; x=1784724620; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jGTb5yjtMc1NxXForp3A2BdTMsjuiB1oUDjMTGf3sEA=;
        b=OsLA97p5IrCt/Yq2A/kMOPZezalmgLaOR/+zYX8CLaDTkz8StYiD8ZF3zrfIWmCDfZ
         UIEmqKTnwtJIhwqG1dGzFf4+IPWePsYFVxxc4raZ7E6ClqolhJUW70cILghMFwqh/RV3
         ltUEvaB7y9f/FTU2KVllCBV3B2jU7FaDMLhkSl6p/MPVDgznlD3BCRQVBs8bBsSUGcaF
         bVR9u01V3Ln8+Sp9avB5CioeiHB8Yd08YX1ZSk1iO9zCHuE+gXlW6Lbhw6SzBGJuOUda
         fqT2zbvvKiu1jZVa5t//UFBuOwM6oh5uX/YWqgX6sP3mO92PRn+PRu6JIQ6/tr+LLG7w
         gabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119820; x=1784724620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jGTb5yjtMc1NxXForp3A2BdTMsjuiB1oUDjMTGf3sEA=;
        b=CQ95S5h3Te/fKFMt+RnU/UahNMC3yT1Gx8/DnxNSRZkPqTvPTajLzgaK1iDwQkxuVO
         +QVHzccTUbjyTvgu9lH7gof3sYAQp+kKAf3jtGXWAyz68KpI8i4dfNeJUZzJJ5xIcPSO
         JDewINRRtCDayM28MQ9ZL5qbz+8I6eTPZKgavWLFWTjfhHXYOZVXzvd6WymxTHdOLT+K
         5+Uh/Qwe7rklQQSj3RfCVNNgcSKq8GCPL9FssT6Ttz61aIZKA5dgjVkcuLSSIy3XEbKW
         +GoicGDhkwOiVt+DqD6B02tkObA+BCqAXQh/uyNYO8VK4o17DxVtry5YKP9zwUJdfu1A
         RXQg==
X-Gm-Message-State: AOJu0YyhUUD6tHWkaFmHUHVsDa3QYwP/+ic1BhkCgGMru/xf9064mbiq
	8C4/2vQZX6cFx37Qb4WzLMkN9YtQ4HEEukWJxoZo9pVdnIUChz8tv/xyiprqamsxQ8U/hw==
X-Gm-Gg: AfdE7cl9mAyVTFu3plGC4S0Qy4xhiAmWiES/ZXwdicqIup4bJRjAbvjlGiD6DC2slnd
	FRJVCqdrb6xIVOKyWLOo56WqZpT1jqdy8k/3ekK3OauJ4rMfQDAqaupu9Zoaxk/341JyPCGnRoY
	yTydhPQSZcKJ50Zi9nL6EVDvn6lkG6Q1g+YQlhc4ShiZ8dp8DUQ5clmuTaCTUaRjZDN6BDC/ibd
	sO/VoBvLtH3uMIIkpg13gWmpjjN7LJmQr0RJ2gkPyo2pw9ykVIeavaDQtg18900xqRUmcFyfuVQ
	THQklcWIZ/VBxrY5bLI1PZ0OO1lyCOj5sry6PwUR/tLAJVOUXF2TSy3SF7nGjSreT9iO383D2LA
	bjdSPWbTJXIKrzgmwQLNXKzEGY4ZI3KtAFqTo7Lm9+9p0DFudgq7GRfkDdI3smEFvShNU2u1uG9
	M9eK2Bxq0OmD5XF/uNhP/6SPtR3Mw4m0vcdwdCkVADraJOb7mGReE61HBCwG/cm4h2ROyShAi/V
	MTZtRF2nOQ3lQ==
X-Received: by 2002:a05:6512:668c:10b0:5ae:c542:3416 with SMTP id 2adb3069b0e04-5b023c871d6mr2396695e87.0.1784119819840;
        Wed, 15 Jul 2026 05:50:19 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:19 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 06/61] staging: rtl8723bs: remove DoReserved stub and clean up OnAction_tbl
Date: Wed, 15 Jul 2026 19:47:34 +0700
Message-ID: <20260715124829.90290-7-ulijg308@gmail.com>
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

The DoReserved() function is an empty stub that merely returns _SUCCESS
without performing any actual work. Remove the redundant function
definition and its prototype.

Concurrently, clean up the OnAction_tbl array by physically removing the
now-unused elements that referenced DoReserved or contained NULL. Since
OnAction() iterates through this table sequentially using ARRAY_SIZE(),
removing these entries safely shrinks the array size and eliminates dead
code.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 16 ++--------------
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h |  2 +-
 2 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 774fa9e32..48043dae7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -20,8 +20,8 @@ static struct mlme_handler mlme_sta_tbl[] = {
 	{WIFI_PROBERSP,		"OnProbeRsp",		&OnProbeRsp},
 
 	/* below 2 are reserved */
-	{0,					"DoReserved",		&DoReserved},
-	{0,					"DoReserved",		&DoReserved},
+	{0,					"DoReserved",		NULL},
+	{0,					"DoReserved",		NULL},
 	{WIFI_BEACON,		"OnBeacon",		&OnBeacon},
 	{WIFI_ATIM,			"OnATIM",		NULL},
 	{WIFI_DISASSOC,		"OnDisassoc",		&OnDisassoc},
@@ -33,18 +33,10 @@ static struct mlme_handler mlme_sta_tbl[] = {
 
 static struct action_handler OnAction_tbl[] = {
 	{RTW_WLAN_CATEGORY_SPECTRUM_MGMT,	 "ACTION_SPECTRUM_MGMT", on_action_spct},
-	{RTW_WLAN_CATEGORY_QOS, "ACTION_QOS", &DoReserved},
-	{RTW_WLAN_CATEGORY_DLS, "ACTION_DLS", &DoReserved},
 	{RTW_WLAN_CATEGORY_BACK, "ACTION_BACK", &OnAction_back},
 	{RTW_WLAN_CATEGORY_PUBLIC, "ACTION_PUBLIC", on_action_public},
-	{RTW_WLAN_CATEGORY_RADIO_MEASUREMENT, "ACTION_RADIO_MEASUREMENT", &DoReserved},
-	{RTW_WLAN_CATEGORY_FT, "ACTION_FT",	&DoReserved},
 	{RTW_WLAN_CATEGORY_HT,	"ACTION_HT",	&OnAction_ht},
 	{RTW_WLAN_CATEGORY_SA_QUERY, "ACTION_SA_QUERY", &OnAction_sa_query},
-	{RTW_WLAN_CATEGORY_UNPROTECTED_WNM, "ACTION_UNPROTECTED_WNM", &DoReserved},
-	{RTW_WLAN_CATEGORY_SELF_PROTECTED, "ACTION_SELF_PROTECTED", &DoReserved},
-	{RTW_WLAN_CATEGORY_WMM, "ACTION_WMM", &DoReserved},
-	{RTW_WLAN_CATEGORY_P2P, "ACTION_P2P", &DoReserved},
 };
 
 static u8 null_addr[ETH_ALEN] = {0, 0, 0, 0, 0, 0};
@@ -1836,10 +1828,6 @@ unsigned int OnAction(struct adapter *padapter, union recv_frame *precv_frame)
 	return _SUCCESS;
 }
 
-unsigned int DoReserved(struct adapter *padapter, union recv_frame *precv_frame)
-{
-	return _SUCCESS;
-}
 
 static struct xmit_frame *_alloc_mgtxmitframe(struct xmit_priv *pxmitpriv, bool once)
 {
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 332411ead..9d42b7494 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -562,7 +562,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 unsigned int OnAssocRsp(struct adapter *padapter, union recv_frame *precv_frame);
 unsigned int OnProbeReq(struct adapter *padapter, union recv_frame *precv_frame);
 unsigned int OnProbeRsp(struct adapter *padapter, union recv_frame *precv_frame);
-unsigned int DoReserved(struct adapter *padapter, union recv_frame *precv_frame);
+
 unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame);
 unsigned int OnDisassoc(struct adapter *padapter, union recv_frame *precv_frame);
 unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame);
-- 
2.55.0

