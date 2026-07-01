Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C72E3FD15E
	for <linux-staging@lists.linux.dev>; Wed,  1 Jul 2026 15:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782919717; cv=none; b=cgZslLgt1SHUFQsFJiJSmyb9MnawPyVVgR8uQnxf1oRLPeIzZsoOSeYgXsHJEYyzIhs46mYU99HsQtaZJ8cbxQ4wvydZWdJElI3PF9sONWzaOKG9yKXMNAgIJor78KZHadfeahdqyF4Q9IXlwYS1V0EEoCAdbEP4tpa9gi4mQ0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782919717; c=relaxed/simple;
	bh=UXBMYcGeosKkxH8X02lyHwVyGVuhSJsp93kM9tdlbjM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fk4A/6mqSrLGAZgR4VTGlV78la/E06DcCULWgP0EHOPWdRJLggkmocemkhB3EI1zJdOTqor20pZSvra7ia8NLDwMGqBWdkuXCnE2swtFpIfh6HTfOb9D3AWyIsISL5xM5dBV2QezLaQO3N2/qFYaCOeX4xJKW0KCAEtRiLw3xDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pl3LbAmZ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pl3LbAmZ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493a97fad2fso6950235e9.0
        for <linux-staging@lists.linux.dev>; Wed, 01 Jul 2026 08:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782919705; x=1783524505; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eouzAmDqayZ9dlmGdCa+StotJ8oNQWN12drC6+IBY5Y=;
        b=pl3LbAmZ5/+LM1M09fAxsyL3/JluRsMVPjZ8Oot6bEgZqyZppA/dHi200MgGqp34Io
         32E3WqMdeU8YrTEf7CnNDmOd50KFMGDFp81qHn8Z7xxmqQ/WJsWXzytUFhzxjvSQ1He9
         LWKCT2XwWMiX+iG4jrqN7ScoKbfcnbpngepb+fGZYQ+Ml5DLHSirB30WXpANxBrraaZ3
         k9seSnMSvp3ZWhum4PR7OJghzGOBf8zyg+385IebGv0E8KoW/IY1f8Y28Hg13TrWGMdQ
         84dgexlunFDpyhcbZlpuNDYjmEVsNIYMzMdn28bBzrBEWF5D23RH0lIERlY9p0DY5Neq
         Xpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782919705; x=1783524505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eouzAmDqayZ9dlmGdCa+StotJ8oNQWN12drC6+IBY5Y=;
        b=lN28VYA7KdalzIS9/SZ/pOlSPcbkxB67wLt4hlzGZ/xZHWqFy7e3ReohBidT5j9Xca
         9XlGR3smScEOueid44rH9hOWyUotA9EtMTjThaZ8/lxKKUfXvBS5101QU3DsobwvbgBd
         wD+4PPU4sHu5AYFOCT8F0lEy9Y5NlE/QMFECCgxx7GaSkJPTxrXHyageNh3vXNbXPuaX
         8KTpCoVDYSKGYdUFwfvohjX16YLDWEbXwfjqjcTMxIw+VNOarIjkwhwFKGGpEQ9Qf899
         7ifb8dqLw2VfGGjbwzAyccrSjakBYWVABgVfj3+fn+PCsvG32ZtrcVwAz5Y7ygH6ckh+
         PO1Q==
X-Gm-Message-State: AOJu0YweFeHRDliKBo7v1Nt3OKU5nLVUyER0N1wmOGRl7A8gMtIr887Y
	vF2hvSMfn+57qnJ20vw0yhaBEbBKB+IEkykgJLG7CGQBsl+KJKIwxM9TBWs26LkUn+Bv7g==
X-Gm-Gg: AfdE7ck+L5ZaZa1kPSkiZQlSW5zr9whMNVCUN2zlGWnMmGTF1aDzlz8cJz/iupMZYwx
	ed/1hQ1INTj8i7JyCbsK/2X7XR2OMf2AYaLqoN0mCJcLLafCBba7G+0yrAu15Bk0DOGXAxluLyD
	SYXVRogWQuVVAsmCY9dRtkCE9TxXp4MBJy0F2AET8+tbNVCD13V1w5Lds73yUcGMWj7Zl/w/o/4
	LAPUUorGoPEjmrph16hW4ngbyewIzm1sPXz9y9xWw6/wy7+CRlAGVW8HsFaK/EoLwhZTid8RcpA
	FrMk+BviBCGyR11FISnSdkQjtlHp2G7guStKGh0/kIDUVmKuignnZ3myqwkzKUmk2BHz8PfRidW
	Elr5fKUF1rMlFlsNwxvggQEvdHyNP0aY9+9dyiOxTkuRn/1gwdJhWblyV/QT4ROEGYolrI1PrVd
	jDxaDfu1/ZoxUggCjImH0k+K7g
X-Received: by 2002:a7b:c34e:0:b0:493:ad8a:e7fd with SMTP id 5b1f17b1804b1-493c3cd9d76mr12588485e9.14.1782919703624;
        Wed, 01 Jul 2026 08:28:23 -0700 (PDT)
Received: from pastramanslaptop ([2a06:c701:4bdf:c500:53c7:29d1:6fea:87e0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4da1c1sm85307085e9.8.2026.07.01.08.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 08:28:22 -0700 (PDT)
From: pastraman <pastraman1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	pastraman <pastraman1@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rename bLinkInfoDump to snake_case
Date: Wed,  1 Jul 2026 18:28:17 +0300
Message-ID: <20260701152817.11273-1-pastraman1@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename bLinkInfoDump to link_info_dump to follow the kernel coding
style, which discourages CamelCase and Hungarian notation. Issue
reported by checkpatch.pl.

Signed-off-by: pastraman <pastraman1@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2337 ++++++++++-------
 drivers/staging/rtl8723bs/include/drv_types.h |  185 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  149 +-
 3 files changed, 1623 insertions(+), 1048 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index a86d6f97cf02..a27533b7fb17 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -12,155 +12,164 @@
 #include <linux/unaligned.h>
 
 static struct mlme_handler mlme_sta_tbl[] = {
-	{WIFI_ASSOCREQ,		"OnAssocReq",	&OnAssocReq},
-	{WIFI_ASSOCRSP,		"OnAssocRsp",	&OnAssocRsp},
-	{WIFI_REASSOCREQ,	"OnReAssocReq",	&OnAssocReq},
-	{WIFI_REASSOCRSP,	"OnReAssocRsp",	&OnAssocRsp},
-	{WIFI_PROBEREQ,		"OnProbeReq",	&OnProbeReq},
-	{WIFI_PROBERSP,		"OnProbeRsp",		&OnProbeRsp},
+	{ WIFI_ASSOCREQ, "OnAssocReq", &OnAssocReq },
+	{ WIFI_ASSOCRSP, "OnAssocRsp", &OnAssocRsp },
+	{ WIFI_REASSOCREQ, "OnReAssocReq", &OnAssocReq },
+	{ WIFI_REASSOCRSP, "OnReAssocRsp", &OnAssocRsp },
+	{ WIFI_PROBEREQ, "OnProbeReq", &OnProbeReq },
+	{ WIFI_PROBERSP, "OnProbeRsp", &OnProbeRsp },
 
 	/* below 2 are reserved */
-	{0,					"DoReserved",		&DoReserved},
-	{0,					"DoReserved",		&DoReserved},
-	{WIFI_BEACON,		"OnBeacon",		&OnBeacon},
-	{WIFI_ATIM,			"OnATIM",		&OnAtim},
-	{WIFI_DISASSOC,		"OnDisassoc",		&OnDisassoc},
-	{WIFI_AUTH,			"OnAuth",		&OnAuthClient},
-	{WIFI_DEAUTH,		"OnDeAuth",		&OnDeAuth},
-	{WIFI_ACTION,		"OnAction",		&OnAction},
-	{WIFI_ACTION_NOACK, "OnActionNoAck",	&OnAction},
+	{ 0, "DoReserved", &DoReserved },
+	{ 0, "DoReserved", &DoReserved },
+	{ WIFI_BEACON, "OnBeacon", &OnBeacon },
+	{ WIFI_ATIM, "OnATIM", &OnAtim },
+	{ WIFI_DISASSOC, "OnDisassoc", &OnDisassoc },
+	{ WIFI_AUTH, "OnAuth", &OnAuthClient },
+	{ WIFI_DEAUTH, "OnDeAuth", &OnDeAuth },
+	{ WIFI_ACTION, "OnAction", &OnAction },
+	{ WIFI_ACTION_NOACK, "OnActionNoAck", &OnAction },
 };
 
 static struct action_handler OnAction_tbl[] = {
-	{RTW_WLAN_CATEGORY_SPECTRUM_MGMT,	 "ACTION_SPECTRUM_MGMT", on_action_spct},
-	{RTW_WLAN_CATEGORY_QOS, "ACTION_QOS", &DoReserved},
-	{RTW_WLAN_CATEGORY_DLS, "ACTION_DLS", &DoReserved},
-	{RTW_WLAN_CATEGORY_BACK, "ACTION_BACK", &OnAction_back},
-	{RTW_WLAN_CATEGORY_PUBLIC, "ACTION_PUBLIC", on_action_public},
-	{RTW_WLAN_CATEGORY_RADIO_MEASUREMENT, "ACTION_RADIO_MEASUREMENT", &DoReserved},
-	{RTW_WLAN_CATEGORY_FT, "ACTION_FT",	&DoReserved},
-	{RTW_WLAN_CATEGORY_HT,	"ACTION_HT",	&OnAction_ht},
-	{RTW_WLAN_CATEGORY_SA_QUERY, "ACTION_SA_QUERY", &OnAction_sa_query},
-	{RTW_WLAN_CATEGORY_UNPROTECTED_WNM, "ACTION_UNPROTECTED_WNM", &DoReserved},
-	{RTW_WLAN_CATEGORY_SELF_PROTECTED, "ACTION_SELF_PROTECTED", &DoReserved},
-	{RTW_WLAN_CATEGORY_WMM, "ACTION_WMM", &DoReserved},
-	{RTW_WLAN_CATEGORY_P2P, "ACTION_P2P", &DoReserved},
+	{ RTW_WLAN_CATEGORY_SPECTRUM_MGMT, "ACTION_SPECTRUM_MGMT",
+	  on_action_spct },
+	{ RTW_WLAN_CATEGORY_QOS, "ACTION_QOS", &DoReserved },
+	{ RTW_WLAN_CATEGORY_DLS, "ACTION_DLS", &DoReserved },
+	{ RTW_WLAN_CATEGORY_BACK, "ACTION_BACK", &OnAction_back },
+	{ RTW_WLAN_CATEGORY_PUBLIC, "ACTION_PUBLIC", on_action_public },
+	{ RTW_WLAN_CATEGORY_RADIO_MEASUREMENT, "ACTION_RADIO_MEASUREMENT",
+	  &DoReserved },
+	{ RTW_WLAN_CATEGORY_FT, "ACTION_FT", &DoReserved },
+	{ RTW_WLAN_CATEGORY_HT, "ACTION_HT", &OnAction_ht },
+	{ RTW_WLAN_CATEGORY_SA_QUERY, "ACTION_SA_QUERY", &OnAction_sa_query },
+	{ RTW_WLAN_CATEGORY_UNPROTECTED_WNM, "ACTION_UNPROTECTED_WNM",
+	  &DoReserved },
+	{ RTW_WLAN_CATEGORY_SELF_PROTECTED, "ACTION_SELF_PROTECTED",
+	  &DoReserved },
+	{ RTW_WLAN_CATEGORY_WMM, "ACTION_WMM", &DoReserved },
+	{ RTW_WLAN_CATEGORY_P2P, "ACTION_P2P", &DoReserved },
 };
 
-static u8 null_addr[ETH_ALEN] = {0, 0, 0, 0, 0, 0};
+static u8 null_addr[ETH_ALEN] = { 0, 0, 0, 0, 0, 0 };
 
 /* OUI definitions for the vendor specific IE */
-unsigned char RTW_WPA_OUI[] = {0x00, 0x50, 0xf2, 0x01};
-unsigned char WMM_OUI[] = {0x00, 0x50, 0xf2, 0x02};
-unsigned char WPS_OUI[] = {0x00, 0x50, 0xf2, 0x04};
-unsigned char P2P_OUI[] = {0x50, 0x6F, 0x9A, 0x09};
-unsigned char WFD_OUI[] = {0x50, 0x6F, 0x9A, 0x0A};
+unsigned char RTW_WPA_OUI[] = { 0x00, 0x50, 0xf2, 0x01 };
+unsigned char WMM_OUI[] = { 0x00, 0x50, 0xf2, 0x02 };
+unsigned char WPS_OUI[] = { 0x00, 0x50, 0xf2, 0x04 };
+unsigned char P2P_OUI[] = { 0x50, 0x6F, 0x9A, 0x09 };
+unsigned char WFD_OUI[] = { 0x50, 0x6F, 0x9A, 0x0A };
 
-unsigned char WMM_INFO_OUI[] = {0x00, 0x50, 0xf2, 0x02, 0x00, 0x01};
-unsigned char WMM_PARA_OUI[] = {0x00, 0x50, 0xf2, 0x02, 0x01, 0x01};
+unsigned char WMM_INFO_OUI[] = { 0x00, 0x50, 0xf2, 0x02, 0x00, 0x01 };
+unsigned char WMM_PARA_OUI[] = { 0x00, 0x50, 0xf2, 0x02, 0x01, 0x01 };
 
-static unsigned char REALTEK_96B_IE[] = {0x00, 0xe0, 0x4c, 0x02, 0x01, 0x20};
+static unsigned char REALTEK_96B_IE[] = { 0x00, 0xe0, 0x4c, 0x02, 0x01, 0x20 };
 
 /* ChannelPlan definitions */
-static struct rt_channel_plan_2g	RTW_ChannelPlan2G[RT_CHANNEL_DOMAIN_2G_MAX] = {
-	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}, 13},		/*  0x00, RT_CHANNEL_DOMAIN_2G_WORLD , Passive scan CH 12, 13 */
-	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}, 13},		/*  0x01, RT_CHANNEL_DOMAIN_2G_ETSI1 */
-	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11}, 11},			/*  0x02, RT_CHANNEL_DOMAIN_2G_FCC1 */
-	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, 14},	/*  0x03, RT_CHANNEL_DOMAIN_2G_MIKK1 */
-	{{10, 11, 12, 13}, 4},						/*  0x04, RT_CHANNEL_DOMAIN_2G_ETSI2 */
-	{{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14}, 14},	/*  0x05, RT_CHANNEL_DOMAIN_2G_GLOBAL , Passive scan CH 12, 13, 14 */
-	{{}, 0},								/*  0x06, RT_CHANNEL_DOMAIN_2G_NULL */
+static struct rt_channel_plan_2g RTW_ChannelPlan2G[RT_CHANNEL_DOMAIN_2G_MAX] = {
+	{ { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13 },
+	  13 }, /*  0x00, RT_CHANNEL_DOMAIN_2G_WORLD , Passive scan CH 12, 13 */
+	{ { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13 },
+	  13 }, /*  0x01, RT_CHANNEL_DOMAIN_2G_ETSI1 */
+	{ { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11 },
+	  11 }, /*  0x02, RT_CHANNEL_DOMAIN_2G_FCC1 */
+	{ { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 },
+	  14 }, /*  0x03, RT_CHANNEL_DOMAIN_2G_MIKK1 */
+	{ { 10, 11, 12, 13 }, 4 }, /*  0x04, RT_CHANNEL_DOMAIN_2G_ETSI2 */
+	{ { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 },
+	  14 }, /*  0x05, RT_CHANNEL_DOMAIN_2G_GLOBAL , Passive scan CH 12, 13, 14 */
+	{ {}, 0 }, /*  0x06, RT_CHANNEL_DOMAIN_2G_NULL */
 };
 
-static struct rt_channel_plan_map	RTW_ChannelPlanMap[RT_CHANNEL_DOMAIN_MAX] = {
+static struct rt_channel_plan_map RTW_ChannelPlanMap[RT_CHANNEL_DOMAIN_MAX] = {
 	/*  0x00 ~ 0x1F , Old Define ===== */
-	{0x02},	/* 0x00, RT_CHANNEL_DOMAIN_FCC */
-	{0x02},	/* 0x01, RT_CHANNEL_DOMAIN_IC */
-	{0x01},	/* 0x02, RT_CHANNEL_DOMAIN_ETSI */
-	{0x01},	/* 0x03, RT_CHANNEL_DOMAIN_SPAIN */
-	{0x01},	/* 0x04, RT_CHANNEL_DOMAIN_FRANCE */
-	{0x03},	/* 0x05, RT_CHANNEL_DOMAIN_MKK */
-	{0x03},	/* 0x06, RT_CHANNEL_DOMAIN_MKK1 */
-	{0x01},	/* 0x07, RT_CHANNEL_DOMAIN_ISRAEL */
-	{0x03},	/* 0x08, RT_CHANNEL_DOMAIN_TELEC */
-	{0x03},	/* 0x09, RT_CHANNEL_DOMAIN_GLOBAL_DOAMIN */
-	{0x00},	/* 0x0A, RT_CHANNEL_DOMAIN_WORLD_WIDE_13 */
-	{0x02},	/* 0x0B, RT_CHANNEL_DOMAIN_TAIWAN */
-	{0x01},	/* 0x0C, RT_CHANNEL_DOMAIN_CHINA */
-	{0x02},	/* 0x0D, RT_CHANNEL_DOMAIN_SINGAPORE_INDIA_MEXICO */
-	{0x02},	/* 0x0E, RT_CHANNEL_DOMAIN_KOREA */
-	{0x02},	/* 0x0F, RT_CHANNEL_DOMAIN_TURKEY */
-	{0x01},	/* 0x10, RT_CHANNEL_DOMAIN_JAPAN */
-	{0x02},	/* 0x11, RT_CHANNEL_DOMAIN_FCC_NO_DFS */
-	{0x01},	/* 0x12, RT_CHANNEL_DOMAIN_JAPAN_NO_DFS */
-	{0x00},	/* 0x13, RT_CHANNEL_DOMAIN_WORLD_WIDE_5G */
-	{0x02},	/* 0x14, RT_CHANNEL_DOMAIN_TAIWAN_NO_DFS */
-	{0x00},	/* 0x15, RT_CHANNEL_DOMAIN_ETSI_NO_DFS */
-	{0x00},	/* 0x16, RT_CHANNEL_DOMAIN_KOREA_NO_DFS */
-	{0x03},	/* 0x17, RT_CHANNEL_DOMAIN_JAPAN_NO_DFS */
-	{0x06},	/* 0x18, RT_CHANNEL_DOMAIN_PAKISTAN_NO_DFS */
-	{0x02},	/* 0x19, RT_CHANNEL_DOMAIN_TAIWAN2_NO_DFS */
-	{0x00},	/* 0x1A, */
-	{0x00},	/* 0x1B, */
-	{0x00},	/* 0x1C, */
-	{0x00},	/* 0x1D, */
-	{0x00},	/* 0x1E, */
-	{0x06},	/* 0x1F, RT_CHANNEL_DOMAIN_WORLD_WIDE_ONLY_5G */
+	{ 0x02 }, /* 0x00, RT_CHANNEL_DOMAIN_FCC */
+	{ 0x02 }, /* 0x01, RT_CHANNEL_DOMAIN_IC */
+	{ 0x01 }, /* 0x02, RT_CHANNEL_DOMAIN_ETSI */
+	{ 0x01 }, /* 0x03, RT_CHANNEL_DOMAIN_SPAIN */
+	{ 0x01 }, /* 0x04, RT_CHANNEL_DOMAIN_FRANCE */
+	{ 0x03 }, /* 0x05, RT_CHANNEL_DOMAIN_MKK */
+	{ 0x03 }, /* 0x06, RT_CHANNEL_DOMAIN_MKK1 */
+	{ 0x01 }, /* 0x07, RT_CHANNEL_DOMAIN_ISRAEL */
+	{ 0x03 }, /* 0x08, RT_CHANNEL_DOMAIN_TELEC */
+	{ 0x03 }, /* 0x09, RT_CHANNEL_DOMAIN_GLOBAL_DOAMIN */
+	{ 0x00 }, /* 0x0A, RT_CHANNEL_DOMAIN_WORLD_WIDE_13 */
+	{ 0x02 }, /* 0x0B, RT_CHANNEL_DOMAIN_TAIWAN */
+	{ 0x01 }, /* 0x0C, RT_CHANNEL_DOMAIN_CHINA */
+	{ 0x02 }, /* 0x0D, RT_CHANNEL_DOMAIN_SINGAPORE_INDIA_MEXICO */
+	{ 0x02 }, /* 0x0E, RT_CHANNEL_DOMAIN_KOREA */
+	{ 0x02 }, /* 0x0F, RT_CHANNEL_DOMAIN_TURKEY */
+	{ 0x01 }, /* 0x10, RT_CHANNEL_DOMAIN_JAPAN */
+	{ 0x02 }, /* 0x11, RT_CHANNEL_DOMAIN_FCC_NO_DFS */
+	{ 0x01 }, /* 0x12, RT_CHANNEL_DOMAIN_JAPAN_NO_DFS */
+	{ 0x00 }, /* 0x13, RT_CHANNEL_DOMAIN_WORLD_WIDE_5G */
+	{ 0x02 }, /* 0x14, RT_CHANNEL_DOMAIN_TAIWAN_NO_DFS */
+	{ 0x00 }, /* 0x15, RT_CHANNEL_DOMAIN_ETSI_NO_DFS */
+	{ 0x00 }, /* 0x16, RT_CHANNEL_DOMAIN_KOREA_NO_DFS */
+	{ 0x03 }, /* 0x17, RT_CHANNEL_DOMAIN_JAPAN_NO_DFS */
+	{ 0x06 }, /* 0x18, RT_CHANNEL_DOMAIN_PAKISTAN_NO_DFS */
+	{ 0x02 }, /* 0x19, RT_CHANNEL_DOMAIN_TAIWAN2_NO_DFS */
+	{ 0x00 }, /* 0x1A, */
+	{ 0x00 }, /* 0x1B, */
+	{ 0x00 }, /* 0x1C, */
+	{ 0x00 }, /* 0x1D, */
+	{ 0x00 }, /* 0x1E, */
+	{ 0x06 }, /* 0x1F, RT_CHANNEL_DOMAIN_WORLD_WIDE_ONLY_5G */
 	/*  0x20 ~ 0x7F , New Define ===== */
-	{0x00},	/* 0x20, RT_CHANNEL_DOMAIN_WORLD_NULL */
-	{0x01},	/* 0x21, RT_CHANNEL_DOMAIN_ETSI1_NULL */
-	{0x02},	/* 0x22, RT_CHANNEL_DOMAIN_FCC1_NULL */
-	{0x03},	/* 0x23, RT_CHANNEL_DOMAIN_MKK1_NULL */
-	{0x04},	/* 0x24, RT_CHANNEL_DOMAIN_ETSI2_NULL */
-	{0x02},	/* 0x25, RT_CHANNEL_DOMAIN_FCC1_FCC1 */
-	{0x00},	/* 0x26, RT_CHANNEL_DOMAIN_WORLD_ETSI1 */
-	{0x03},	/* 0x27, RT_CHANNEL_DOMAIN_MKK1_MKK1 */
-	{0x00},	/* 0x28, RT_CHANNEL_DOMAIN_WORLD_KCC1 */
-	{0x00},	/* 0x29, RT_CHANNEL_DOMAIN_WORLD_FCC2 */
-	{0x00},	/* 0x2A, */
-	{0x00},	/* 0x2B, */
-	{0x00},	/* 0x2C, */
-	{0x00},	/* 0x2D, */
-	{0x00},	/* 0x2E, */
-	{0x00},	/* 0x2F, */
-	{0x00},	/* 0x30, RT_CHANNEL_DOMAIN_WORLD_FCC3 */
-	{0x00},	/* 0x31, RT_CHANNEL_DOMAIN_WORLD_FCC4 */
-	{0x00},	/* 0x32, RT_CHANNEL_DOMAIN_WORLD_FCC5 */
-	{0x00},	/* 0x33, RT_CHANNEL_DOMAIN_WORLD_FCC6 */
-	{0x02},	/* 0x34, RT_CHANNEL_DOMAIN_FCC1_FCC7 */
-	{0x00},	/* 0x35, RT_CHANNEL_DOMAIN_WORLD_ETSI2 */
-	{0x00},	/* 0x36, RT_CHANNEL_DOMAIN_WORLD_ETSI3 */
-	{0x03},	/* 0x37, RT_CHANNEL_DOMAIN_MKK1_MKK2 */
-	{0x03},	/* 0x38, RT_CHANNEL_DOMAIN_MKK1_MKK3 */
-	{0x02},	/* 0x39, RT_CHANNEL_DOMAIN_FCC1_NCC1 */
-	{0x00},	/* 0x3A, */
-	{0x00},	/* 0x3B, */
-	{0x00},	/* 0x3C, */
-	{0x00},	/* 0x3D, */
-	{0x00},	/* 0x3E, */
-	{0x00},	/* 0x3F, */
-	{0x02},	/* 0x40, RT_CHANNEL_DOMAIN_FCC1_NCC2 */
-	{0x05},	/* 0x41, RT_CHANNEL_DOMAIN_GLOBAL_NULL */
-	{0x01},	/* 0x42, RT_CHANNEL_DOMAIN_ETSI1_ETSI4 */
-	{0x02},	/* 0x43, RT_CHANNEL_DOMAIN_FCC1_FCC2 */
-	{0x02},	/* 0x44, RT_CHANNEL_DOMAIN_FCC1_NCC3 */
-	{0x00},	/* 0x45, RT_CHANNEL_DOMAIN_WORLD_ETSI5 */
-	{0x02},	/* 0x46, RT_CHANNEL_DOMAIN_FCC1_FCC8 */
-	{0x00},	/* 0x47, RT_CHANNEL_DOMAIN_WORLD_ETSI6 */
-	{0x00},	/* 0x48, RT_CHANNEL_DOMAIN_WORLD_ETSI7 */
-	{0x00},	/* 0x49, RT_CHANNEL_DOMAIN_WORLD_ETSI8 */
-	{0x00},	/* 0x50, RT_CHANNEL_DOMAIN_WORLD_ETSI9 */
-	{0x00},	/* 0x51, RT_CHANNEL_DOMAIN_WORLD_ETSI10 */
-	{0x00},	/* 0x52, RT_CHANNEL_DOMAIN_WORLD_ETSI11 */
-	{0x02},	/* 0x53, RT_CHANNEL_DOMAIN_FCC1_NCC4 */
-	{0x00},	/* 0x54, RT_CHANNEL_DOMAIN_WORLD_ETSI12 */
-	{0x02},	/* 0x55, RT_CHANNEL_DOMAIN_FCC1_FCC9 */
-	{0x00},	/* 0x56, RT_CHANNEL_DOMAIN_WORLD_ETSI13 */
-	{0x02},	/* 0x57, RT_CHANNEL_DOMAIN_FCC1_FCC10 */
+	{ 0x00 }, /* 0x20, RT_CHANNEL_DOMAIN_WORLD_NULL */
+	{ 0x01 }, /* 0x21, RT_CHANNEL_DOMAIN_ETSI1_NULL */
+	{ 0x02 }, /* 0x22, RT_CHANNEL_DOMAIN_FCC1_NULL */
+	{ 0x03 }, /* 0x23, RT_CHANNEL_DOMAIN_MKK1_NULL */
+	{ 0x04 }, /* 0x24, RT_CHANNEL_DOMAIN_ETSI2_NULL */
+	{ 0x02 }, /* 0x25, RT_CHANNEL_DOMAIN_FCC1_FCC1 */
+	{ 0x00 }, /* 0x26, RT_CHANNEL_DOMAIN_WORLD_ETSI1 */
+	{ 0x03 }, /* 0x27, RT_CHANNEL_DOMAIN_MKK1_MKK1 */
+	{ 0x00 }, /* 0x28, RT_CHANNEL_DOMAIN_WORLD_KCC1 */
+	{ 0x00 }, /* 0x29, RT_CHANNEL_DOMAIN_WORLD_FCC2 */
+	{ 0x00 }, /* 0x2A, */
+	{ 0x00 }, /* 0x2B, */
+	{ 0x00 }, /* 0x2C, */
+	{ 0x00 }, /* 0x2D, */
+	{ 0x00 }, /* 0x2E, */
+	{ 0x00 }, /* 0x2F, */
+	{ 0x00 }, /* 0x30, RT_CHANNEL_DOMAIN_WORLD_FCC3 */
+	{ 0x00 }, /* 0x31, RT_CHANNEL_DOMAIN_WORLD_FCC4 */
+	{ 0x00 }, /* 0x32, RT_CHANNEL_DOMAIN_WORLD_FCC5 */
+	{ 0x00 }, /* 0x33, RT_CHANNEL_DOMAIN_WORLD_FCC6 */
+	{ 0x02 }, /* 0x34, RT_CHANNEL_DOMAIN_FCC1_FCC7 */
+	{ 0x00 }, /* 0x35, RT_CHANNEL_DOMAIN_WORLD_ETSI2 */
+	{ 0x00 }, /* 0x36, RT_CHANNEL_DOMAIN_WORLD_ETSI3 */
+	{ 0x03 }, /* 0x37, RT_CHANNEL_DOMAIN_MKK1_MKK2 */
+	{ 0x03 }, /* 0x38, RT_CHANNEL_DOMAIN_MKK1_MKK3 */
+	{ 0x02 }, /* 0x39, RT_CHANNEL_DOMAIN_FCC1_NCC1 */
+	{ 0x00 }, /* 0x3A, */
+	{ 0x00 }, /* 0x3B, */
+	{ 0x00 }, /* 0x3C, */
+	{ 0x00 }, /* 0x3D, */
+	{ 0x00 }, /* 0x3E, */
+	{ 0x00 }, /* 0x3F, */
+	{ 0x02 }, /* 0x40, RT_CHANNEL_DOMAIN_FCC1_NCC2 */
+	{ 0x05 }, /* 0x41, RT_CHANNEL_DOMAIN_GLOBAL_NULL */
+	{ 0x01 }, /* 0x42, RT_CHANNEL_DOMAIN_ETSI1_ETSI4 */
+	{ 0x02 }, /* 0x43, RT_CHANNEL_DOMAIN_FCC1_FCC2 */
+	{ 0x02 }, /* 0x44, RT_CHANNEL_DOMAIN_FCC1_NCC3 */
+	{ 0x00 }, /* 0x45, RT_CHANNEL_DOMAIN_WORLD_ETSI5 */
+	{ 0x02 }, /* 0x46, RT_CHANNEL_DOMAIN_FCC1_FCC8 */
+	{ 0x00 }, /* 0x47, RT_CHANNEL_DOMAIN_WORLD_ETSI6 */
+	{ 0x00 }, /* 0x48, RT_CHANNEL_DOMAIN_WORLD_ETSI7 */
+	{ 0x00 }, /* 0x49, RT_CHANNEL_DOMAIN_WORLD_ETSI8 */
+	{ 0x00 }, /* 0x50, RT_CHANNEL_DOMAIN_WORLD_ETSI9 */
+	{ 0x00 }, /* 0x51, RT_CHANNEL_DOMAIN_WORLD_ETSI10 */
+	{ 0x00 }, /* 0x52, RT_CHANNEL_DOMAIN_WORLD_ETSI11 */
+	{ 0x02 }, /* 0x53, RT_CHANNEL_DOMAIN_FCC1_NCC4 */
+	{ 0x00 }, /* 0x54, RT_CHANNEL_DOMAIN_WORLD_ETSI12 */
+	{ 0x02 }, /* 0x55, RT_CHANNEL_DOMAIN_FCC1_FCC9 */
+	{ 0x00 }, /* 0x56, RT_CHANNEL_DOMAIN_WORLD_ETSI13 */
+	{ 0x02 }, /* 0x57, RT_CHANNEL_DOMAIN_FCC1_FCC10 */
 };
 
- /* use the combination for max channel numbers */
-static struct rt_channel_plan_map RTW_CHANNEL_PLAN_MAP_REALTEK_DEFINE = {0x03};
+/* use the combination for max channel numbers */
+static struct rt_channel_plan_map RTW_CHANNEL_PLAN_MAP_REALTEK_DEFINE = { 0x03 };
 
 /* Search the @param ch in given @param ch_set
  * @ch_set: the given channel set
@@ -196,14 +205,25 @@ void init_mlme_default_rate_set(struct adapter *padapter)
 {
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 
-	unsigned char mixed_datarate[NumRates] = {_1M_RATE_, _2M_RATE_, _5M_RATE_, _11M_RATE_, _6M_RATE_, _9M_RATE_, _12M_RATE_, _18M_RATE_, _24M_RATE_, _36M_RATE_, _48M_RATE_, _54M_RATE_, 0xff};
-	unsigned char mixed_basicrate[NumRates] = {_1M_RATE_, _2M_RATE_, _5M_RATE_, _11M_RATE_, _6M_RATE_, _12M_RATE_, _24M_RATE_, 0xff,};
-	unsigned char supported_mcs_set[16] = {0xff, 0xff, 0x00, 0x00, 0x01, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0};
+	unsigned char mixed_datarate[NumRates] = {
+		_1M_RATE_,  _2M_RATE_,	_5M_RATE_,  _11M_RATE_, _6M_RATE_,
+		_9M_RATE_,  _12M_RATE_, _18M_RATE_, _24M_RATE_, _36M_RATE_,
+		_48M_RATE_, _54M_RATE_, 0xff
+	};
+	unsigned char mixed_basicrate[NumRates] = {
+		_1M_RATE_, _2M_RATE_,  _5M_RATE_,  _11M_RATE_,
+		_6M_RATE_, _12M_RATE_, _24M_RATE_, 0xff,
+	};
+	unsigned char supported_mcs_set[16] = { 0xff, 0xff, 0x00, 0x00,
+						0x01, 0x0,  0x0,  0x0,
+						0x0,  0x0,  0x0,  0x0,
+						0x0,  0x0,  0x0,  0x0 };
 
 	memcpy(pmlmeext->datarate, mixed_datarate, NumRates);
 	memcpy(pmlmeext->basicrate, mixed_basicrate, NumRates);
 
-	memcpy(pmlmeext->default_supported_mcs_set, supported_mcs_set, sizeof(pmlmeext->default_supported_mcs_set));
+	memcpy(pmlmeext->default_supported_mcs_set, supported_mcs_set,
+	       sizeof(pmlmeext->default_supported_mcs_set));
 }
 
 static void init_mlme_ext_priv_value(struct adapter *padapter)
@@ -212,7 +232,8 @@ static void init_mlme_ext_priv_value(struct adapter *padapter)
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	atomic_set(&pmlmeext->event_seq, 0);
-	pmlmeext->mgnt_seq = 0;/* reset to zero when disconnect at client mode */
+	pmlmeext->mgnt_seq =
+		0; /* reset to zero when disconnect at client mode */
 	pmlmeext->sa_query_seq = 0;
 	pmlmeext->mgnt_80211w_IPN = 0;
 	pmlmeext->mgnt_80211w_IPN_rx = 0;
@@ -255,9 +276,8 @@ static void init_mlme_ext_priv_value(struct adapter *padapter)
 	pmlmeext->action_public_dialog_token = 0xff;
 }
 
-static int has_channel(struct rt_channel_info *channel_set,
-					   u8 chanset_size,
-					   u8 chan)
+static int has_channel(struct rt_channel_info *channel_set, u8 chanset_size,
+		       u8 chan)
 {
 	int i;
 
@@ -268,20 +288,21 @@ static int has_channel(struct rt_channel_info *channel_set,
 	return 0;
 }
 
-static void init_channel_list(struct adapter *padapter, struct rt_channel_info *channel_set,
-							  u8 chanset_size,
-							  struct p2p_channels *channel_list)
+static void init_channel_list(struct adapter *padapter,
+			      struct rt_channel_info *channel_set,
+			      u8 chanset_size,
+			      struct p2p_channels *channel_list)
 {
 	static const struct p2p_oper_class_map op_class[] = {
-		{ IEEE80211G,  81,   1,  13,  1, BW20 },
-		{ IEEE80211G,  82,  14,  14,  1, BW20 },
-		{ IEEE80211A, 115,  36,  48,  4, BW20 },
-		{ IEEE80211A, 116,  36,  44,  8, BW40PLUS },
-		{ IEEE80211A, 117,  40,  48,  8, BW40MINUS },
-		{ IEEE80211A, 124, 149, 161,  4, BW20 },
-		{ IEEE80211A, 125, 149, 169,  4, BW20 },
-		{ IEEE80211A, 126, 149, 157,  8, BW40PLUS },
-		{ IEEE80211A, 127, 153, 161,  8, BW40MINUS },
+		{ IEEE80211G, 81, 1, 13, 1, BW20 },
+		{ IEEE80211G, 82, 14, 14, 1, BW20 },
+		{ IEEE80211A, 115, 36, 48, 4, BW20 },
+		{ IEEE80211A, 116, 36, 44, 8, BW40PLUS },
+		{ IEEE80211A, 117, 40, 48, 8, BW40MINUS },
+		{ IEEE80211A, 124, 149, 161, 4, BW20 },
+		{ IEEE80211A, 125, 149, 169, 4, BW20 },
+		{ IEEE80211A, 126, 149, 157, 8, BW40PLUS },
+		{ IEEE80211A, 127, 153, 161, 8, BW40MINUS },
 		{ -1, 0, 0, 0, 0, BW20 }
 	};
 
@@ -298,11 +319,12 @@ static void init_channel_list(struct adapter *padapter, struct rt_channel_info *
 			if (!has_channel(channel_set, chanset_size, ch))
 				continue;
 
-			if ((padapter->registrypriv.ht_enable == 0) && (o->inc == 8))
+			if ((padapter->registrypriv.ht_enable == 0) &&
+			    (o->inc == 8))
 				continue;
 
 			if ((0 < (padapter->registrypriv.bw_mode & 0xf0)) &&
-				((o->bw == BW40MINUS) || (o->bw == BW40PLUS)))
+			    ((o->bw == BW40MINUS) || (o->bw == BW40PLUS)))
 				continue;
 
 			if (!reg) {
@@ -318,15 +340,18 @@ static void init_channel_list(struct adapter *padapter, struct rt_channel_info *
 	channel_list->reg_classes = cla;
 }
 
-static u8 init_channel_set(struct adapter *padapter, u8 ChannelPlan, struct rt_channel_info *channel_set)
+static u8 init_channel_set(struct adapter *padapter, u8 ChannelPlan,
+			   struct rt_channel_info *channel_set)
 {
 	u8 index, chanset_size = 0;
 	u8 b2_4GBand = false;
 	u8 Index2G = 0;
 
-	memset(channel_set, 0, sizeof(struct rt_channel_info)*MAX_CHANNEL_NUM);
+	memset(channel_set, 0,
+	       sizeof(struct rt_channel_info) * MAX_CHANNEL_NUM);
 
-	if (ChannelPlan >= RT_CHANNEL_DOMAIN_MAX && ChannelPlan != RT_CHANNEL_DOMAIN_REALTEK_DEFINE)
+	if (ChannelPlan >= RT_CHANNEL_DOMAIN_MAX &&
+	    ChannelPlan != RT_CHANNEL_DOMAIN_REALTEK_DEFINE)
 		return chanset_size;
 
 	if (is_supported_24g(padapter->registrypriv.wireless_mode)) {
@@ -338,23 +363,37 @@ static u8 init_channel_set(struct adapter *padapter, u8 ChannelPlan, struct rt_c
 	}
 
 	if (b2_4GBand) {
-		for (index = 0; index < RTW_ChannelPlan2G[Index2G].Len; index++) {
-			channel_set[chanset_size].ChannelNum = RTW_ChannelPlan2G[Index2G].Channel[index];
-
-			if ((ChannelPlan == RT_CHANNEL_DOMAIN_GLOBAL_DOAMIN) ||/* Channel 1~11 is active, and 12~14 is passive */
-				(ChannelPlan == RT_CHANNEL_DOMAIN_GLOBAL_NULL)) {
-				if (channel_set[chanset_size].ChannelNum >= 1 && channel_set[chanset_size].ChannelNum <= 11)
-					channel_set[chanset_size].ScanType = SCAN_ACTIVE;
-				else if ((channel_set[chanset_size].ChannelNum  >= 12 && channel_set[chanset_size].ChannelNum  <= 14))
-					channel_set[chanset_size].ScanType  = SCAN_PASSIVE;
-			} else if (ChannelPlan == RT_CHANNEL_DOMAIN_WORLD_WIDE_13 ||
-				 Index2G == RT_CHANNEL_DOMAIN_2G_WORLD) { /*  channel 12~13, passive scan */
+		for (index = 0; index < RTW_ChannelPlan2G[Index2G].Len;
+		     index++) {
+			channel_set[chanset_size].ChannelNum =
+				RTW_ChannelPlan2G[Index2G].Channel[index];
+
+			if ((ChannelPlan ==
+			     RT_CHANNEL_DOMAIN_GLOBAL_DOAMIN) || /* Channel 1~11 is active, and 12~14 is passive */
+			    (ChannelPlan == RT_CHANNEL_DOMAIN_GLOBAL_NULL)) {
+				if (channel_set[chanset_size].ChannelNum >= 1 &&
+				    channel_set[chanset_size].ChannelNum <= 11)
+					channel_set[chanset_size].ScanType =
+						SCAN_ACTIVE;
+				else if ((channel_set[chanset_size].ChannelNum >=
+						  12 &&
+					  channel_set[chanset_size].ChannelNum <=
+						  14))
+					channel_set[chanset_size].ScanType =
+						SCAN_PASSIVE;
+			} else if (ChannelPlan ==
+					   RT_CHANNEL_DOMAIN_WORLD_WIDE_13 ||
+				   Index2G ==
+					   RT_CHANNEL_DOMAIN_2G_WORLD) { /*  channel 12~13, passive scan */
 				if (channel_set[chanset_size].ChannelNum <= 11)
-					channel_set[chanset_size].ScanType = SCAN_ACTIVE;
+					channel_set[chanset_size].ScanType =
+						SCAN_ACTIVE;
 				else
-					channel_set[chanset_size].ScanType = SCAN_PASSIVE;
+					channel_set[chanset_size].ScanType =
+						SCAN_PASSIVE;
 			} else
-				channel_set[chanset_size].ScanType = SCAN_ACTIVE;
+				channel_set[chanset_size].ScanType =
+					SCAN_ACTIVE;
 
 			chanset_size++;
 		}
@@ -365,7 +404,7 @@ static u8 init_channel_set(struct adapter *padapter, u8 ChannelPlan, struct rt_c
 
 static void init_mlme_ext_timer(struct adapter *padapter)
 {
-	struct	mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 
 	timer_setup(&pmlmeext->survey_timer, survey_timer_hdl, 0);
 	timer_setup(&pmlmeext->link_timer, link_timer_hdl, 0);
@@ -390,8 +429,10 @@ void init_mlme_ext_priv(struct adapter *padapter)
 
 	init_mlme_ap_info(padapter);
 
-	pmlmeext->max_chan_nums = init_channel_set(padapter, pmlmepriv->ChannelPlan, pmlmeext->channel_set);
-	init_channel_list(padapter, pmlmeext->channel_set, pmlmeext->max_chan_nums, &pmlmeext->channel_list);
+	pmlmeext->max_chan_nums = init_channel_set(
+		padapter, pmlmepriv->ChannelPlan, pmlmeext->channel_set);
+	init_channel_list(padapter, pmlmeext->channel_set,
+			  pmlmeext->max_chan_nums, &pmlmeext->channel_list);
 	pmlmeext->last_scan_time = 0;
 	pmlmeext->chan_scan_time = SURVEY_TO;
 	pmlmeext->mlmeext_init = true;
@@ -412,13 +453,16 @@ void free_mlme_ext_priv(struct mlme_ext_priv *pmlmeext)
 	}
 }
 
-static void _mgt_dispatcher(struct adapter *padapter, struct mlme_handler *ptable, union recv_frame *precv_frame)
+static void _mgt_dispatcher(struct adapter *padapter,
+			    struct mlme_handler *ptable,
+			    union recv_frame *precv_frame)
 {
 	u8 *pframe = precv_frame->u.hdr.rx_data;
 
 	if (ptable->func) {
 		/* receive the frames that ra(a1) is my address or ra(a1) is bc address. */
-		if (memcmp(GetAddr1Ptr(pframe), myid(&padapter->eeprompriv), ETH_ALEN) &&
+		if (memcmp(GetAddr1Ptr(pframe), myid(&padapter->eeprompriv),
+			   ETH_ALEN) &&
 		    !is_broadcast_ether_addr(GetAddr1Ptr(pframe)))
 			return;
 
@@ -432,13 +476,15 @@ void mgt_dispatcher(struct adapter *padapter, union recv_frame *precv_frame)
 	struct mlme_handler *ptable;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
-	struct sta_info *psta = rtw_get_stainfo(&padapter->stapriv, GetAddr2Ptr(pframe));
+	struct sta_info *psta =
+		rtw_get_stainfo(&padapter->stapriv, GetAddr2Ptr(pframe));
 
 	if (GetFrameType(pframe) != WIFI_MGT_TYPE)
 		return;
 
 	/* receive the frames that ra(a1) is my address or ra(a1) is bc address. */
-	if (memcmp(GetAddr1Ptr(pframe), myid(&padapter->eeprompriv), ETH_ALEN) &&
+	if (memcmp(GetAddr1Ptr(pframe), myid(&padapter->eeprompriv),
+		   ETH_ALEN) &&
 	    !is_broadcast_ether_addr(GetAddr1Ptr(pframe))) {
 		return;
 	}
@@ -454,7 +500,8 @@ void mgt_dispatcher(struct adapter *padapter, union recv_frame *precv_frame)
 
 	if (psta) {
 		if (GetRetry(pframe)) {
-			if (precv_frame->u.hdr.attrib.seq_num == psta->RxMgmtFrameSeqNum) {
+			if (precv_frame->u.hdr.attrib.seq_num ==
+			    psta->RxMgmtFrameSeqNum) {
 				/* drop the duplicate management frame */
 				return;
 			}
@@ -493,12 +540,12 @@ void mgt_dispatcher(struct adapter *padapter, union recv_frame *precv_frame)
 
 unsigned int OnProbeReq(struct adapter *padapter, union recv_frame *precv_frame)
 {
-	unsigned int	ielen;
+	unsigned int ielen;
 	unsigned char *p;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
-	struct wlan_bssid_ex	*cur = &pmlmeinfo->network;
+	struct wlan_bssid_ex *cur = &pmlmeinfo->network;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
 	uint len = precv_frame->u.hdr.len;
 	u8 is_valid_p2p_probereq = false;
@@ -507,28 +554,31 @@ unsigned int OnProbeReq(struct adapter *padapter, union recv_frame *precv_frame)
 		return _SUCCESS;
 
 	if (!check_fwstate(pmlmepriv, _FW_LINKED) &&
-	    !check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE | WIFI_AP_STATE)) {
+	    !check_fwstate(pmlmepriv,
+			   WIFI_ADHOC_MASTER_STATE | WIFI_AP_STATE)) {
 		return _SUCCESS;
 	}
 
-	p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + _PROBEREQ_IE_OFFSET_, WLAN_EID_SSID, (int *)&ielen,
-			len - WLAN_HDR_A3_LEN - _PROBEREQ_IE_OFFSET_);
+	p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + _PROBEREQ_IE_OFFSET_,
+		       WLAN_EID_SSID, (int *)&ielen,
+		       len - WLAN_HDR_A3_LEN - _PROBEREQ_IE_OFFSET_);
 
 	/* check (wildcard) SSID */
 	if (p) {
 		if (is_valid_p2p_probereq)
 			goto _issue_probersp;
 
-		if ((ielen != 0 && false == !memcmp((p+2), cur->ssid.ssid, cur->ssid.ssid_length))
-			|| (ielen == 0 && pmlmeinfo->hidden_ssid_mode)
-		)
+		if ((ielen != 0 && false == !memcmp((p + 2), cur->ssid.ssid,
+						    cur->ssid.ssid_length)) ||
+		    (ielen == 0 && pmlmeinfo->hidden_ssid_mode))
 			return _SUCCESS;
 
 _issue_probersp:
 		if ((check_fwstate(pmlmepriv, _FW_LINKED) &&
 		     pmlmepriv->cur_network.join_res) ||
 		    check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))
-			issue_probersp(padapter, get_sa(pframe), is_valid_p2p_probereq);
+			issue_probersp(padapter, get_sa(pframe),
+				       is_valid_p2p_probereq);
 	}
 
 	return _SUCCESS;
@@ -561,10 +611,16 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 	u8 *p = NULL;
 	u32 ielen = 0;
 
-	p = rtw_get_ie(pframe + sizeof(struct ieee80211_hdr_3addr) + _BEACON_IE_OFFSET_, WLAN_EID_EXT_SUPP_RATES, &ielen, precv_frame->u.hdr.len - sizeof(struct ieee80211_hdr_3addr) - _BEACON_IE_OFFSET_);
+	p = rtw_get_ie(pframe + sizeof(struct ieee80211_hdr_3addr) +
+			       _BEACON_IE_OFFSET_,
+		       WLAN_EID_EXT_SUPP_RATES, &ielen,
+		       precv_frame->u.hdr.len -
+			       sizeof(struct ieee80211_hdr_3addr) -
+			       _BEACON_IE_OFFSET_);
 	if (p && ielen > 0) {
 		if (p + 2 + ielen < pframe + len) {
-			if ((*(p + 1 + ielen) == 0x2D) && (*(p + 2 + ielen) != 0x2D))
+			if ((*(p + 1 + ielen) == 0x2D) &&
+			    (*(p + 2 + ielen) != 0x2D))
 				/* Invalid value 0x2D is detected in Extended Supported Rates (ESR) IE. Try to fix the IE length to avoid failed Beacon parsing. */
 				*(p + 1) = ielen - 1;
 		}
@@ -575,20 +631,27 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 		return _SUCCESS;
 	}
 
-	if (!memcmp(GetAddr3Ptr(pframe), get_my_bssid(&pmlmeinfo->network), ETH_ALEN)) {
+	if (!memcmp(GetAddr3Ptr(pframe), get_my_bssid(&pmlmeinfo->network),
+		    ETH_ALEN)) {
 		if (pmlmeinfo->state & WIFI_FW_AUTH_NULL) {
 			/* we should update current network before auth, or some IE is wrong */
 			pbss = kmalloc_obj(*pbss, GFP_ATOMIC);
 			if (pbss) {
-				if (collect_bss_info(padapter, precv_frame, pbss) == _SUCCESS) {
-					update_network(&(pmlmepriv->cur_network.network), pbss, padapter, true);
-					rtw_get_bcn_info(&(pmlmepriv->cur_network));
+				if (collect_bss_info(padapter, precv_frame,
+						     pbss) == _SUCCESS) {
+					update_network(&(pmlmepriv->cur_network
+								 .network),
+						       pbss, padapter, true);
+					rtw_get_bcn_info(
+						&(pmlmepriv->cur_network));
 				}
 				kfree(pbss);
 			}
 
 			/* check the vendor of the assoc AP */
-			pmlmeinfo->assoc_AP_vendor = check_assoc_AP(pframe+sizeof(struct ieee80211_hdr_3addr), len-sizeof(struct ieee80211_hdr_3addr));
+			pmlmeinfo->assoc_AP_vendor = check_assoc_AP(
+				pframe + sizeof(struct ieee80211_hdr_3addr),
+				len - sizeof(struct ieee80211_hdr_3addr));
 
 			/* update TSF Value */
 			update_TSF(pmlmeext, pframe, len);
@@ -598,8 +661,10 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 			pmlmeext->DrvBcnEarly = 0xff;
 			pmlmeext->DrvBcnTimeOut = 0xff;
 			pmlmeext->bcn_cnt = 0;
-			memset(pmlmeext->bcn_delay_cnt, 0, sizeof(pmlmeext->bcn_delay_cnt));
-			memset(pmlmeext->bcn_delay_ratio, 0, sizeof(pmlmeext->bcn_delay_ratio));
+			memset(pmlmeext->bcn_delay_cnt, 0,
+			       sizeof(pmlmeext->bcn_delay_cnt));
+			memset(pmlmeext->bcn_delay_ratio, 0,
+			       sizeof(pmlmeext->bcn_delay_ratio));
 
 			/* start auth */
 			start_clnt_auth(padapter);
@@ -607,31 +672,37 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 			return _SUCCESS;
 		}
 
-		if (((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE) && (pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS)) {
+		if (((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE) &&
+		    (pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS)) {
 			psta = rtw_get_stainfo(pstapriv, GetAddr2Ptr(pframe));
 			if (psta) {
 				ret = rtw_check_bcn_info(padapter, pframe, len);
 				if (!ret) {
-					netdev_dbg(padapter->pnetdev,
-						   "ap has changed, disconnect now\n");
-					receive_disconnect(padapter,
-							   pmlmeinfo->network.mac_address, 0);
+					netdev_dbg(
+						padapter->pnetdev,
+						"ap has changed, disconnect now\n");
+					receive_disconnect(
+						padapter,
+						pmlmeinfo->network.mac_address,
+						0);
 					return _SUCCESS;
 				}
 				/* update WMM, ERP in the beacon */
 				/* todo: the timer is used instead of the number of the beacon received */
 				if ((sta_rx_pkts(psta) & 0xf) == 0)
-					update_beacon_info(padapter, pframe, len, psta);
+					update_beacon_info(padapter, pframe,
+							   len, psta);
 
 				adaptive_early_32k(pmlmeext, pframe, len);
 			}
-		} else if ((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE) {
+		} else if ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE) {
 			psta = rtw_get_stainfo(pstapriv, GetAddr2Ptr(pframe));
 			if (psta) {
 				/* update WMM, ERP in the beacon */
 				/* todo: the timer is used instead of the number of the beacon received */
 				if ((sta_rx_pkts(psta) & 0xf) == 0)
-					update_beacon_info(padapter, pframe, len, psta);
+					update_beacon_info(padapter, pframe,
+							   len, psta);
 			} else {
 				/* allocate a new CAM entry for IBSS station */
 				cam_idx = allocate_fw_sta_entry(padapter);
@@ -639,8 +710,15 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 					goto _END_ONBEACON_;
 
 				/* get supported rate */
-				if (update_sta_support_rate(padapter, (pframe + WLAN_HDR_A3_LEN + _BEACON_IE_OFFSET_), (len - WLAN_HDR_A3_LEN - _BEACON_IE_OFFSET_), cam_idx) == _FAIL) {
-					pmlmeinfo->FW_sta_info[cam_idx].status = 0;
+				if (update_sta_support_rate(
+					    padapter,
+					    (pframe + WLAN_HDR_A3_LEN +
+					     _BEACON_IE_OFFSET_),
+					    (len - WLAN_HDR_A3_LEN -
+					     _BEACON_IE_OFFSET_),
+					    cam_idx) == _FAIL) {
+					pmlmeinfo->FW_sta_info[cam_idx].status =
+						0;
 					goto _END_ONBEACON_;
 				}
 
@@ -648,7 +726,8 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 				update_TSF(pmlmeext, pframe, len);
 
 				/* report sta add event */
-				report_add_sta_event(padapter, GetAddr2Ptr(pframe), cam_idx);
+				report_add_sta_event(
+					padapter, GetAddr2Ptr(pframe), cam_idx);
 			}
 		}
 	}
@@ -660,13 +739,13 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 
 unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 {
-	unsigned int	auth_mode, seq, ie_len;
+	unsigned int auth_mode, seq, ie_len;
 	unsigned char *sa, *p;
 	u16 algorithm;
-	int	status;
+	int status;
 	static struct sta_info stat;
-	struct	sta_info *pstat = NULL;
-	struct	sta_priv *pstapriv = &padapter->stapriv;
+	struct sta_info *pstat = NULL;
+	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
@@ -674,7 +753,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	uint len = precv_frame->u.hdr.len;
 	u8 offset = 0;
 
-	if ((pmlmeinfo->state&0x03) != WIFI_FW_AP_STATE)
+	if ((pmlmeinfo->state & 0x03) != WIFI_FW_AP_STATE)
 		return _FAIL;
 
 	sa = GetAddr2Ptr(pframe);
@@ -683,13 +762,13 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 
 	if (GetPrivacy(pframe)) {
 		u8 *iv;
-		struct rx_pkt_attrib	 *prxattrib = &(precv_frame->u.hdr.attrib);
+		struct rx_pkt_attrib *prxattrib = &(precv_frame->u.hdr.attrib);
 
 		prxattrib->hdrlen = WLAN_HDR_A3_LEN;
 		prxattrib->encrypt = _WEP40_;
 
-		iv = pframe+prxattrib->hdrlen;
-		prxattrib->key_index = ((iv[3]>>6)&0x3);
+		iv = pframe + prxattrib->hdrlen;
+		prxattrib->key_index = ((iv[3] >> 6) & 0x3);
 
 		prxattrib->iv_len = 4;
 		prxattrib->icv_len = 4;
@@ -699,16 +778,21 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 		offset = 4;
 	}
 
-	algorithm = le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset));
-	seq	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 2));
+	algorithm = le16_to_cpu(
+		*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset));
+	seq = le16_to_cpu(
+		*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 2));
 
-	if (auth_mode == 2 &&
-			psecuritypriv->dot11PrivacyAlgrthm != _WEP40_ &&
-			psecuritypriv->dot11PrivacyAlgrthm != _WEP104_)
+	if (auth_mode == 2 && psecuritypriv->dot11PrivacyAlgrthm != _WEP40_ &&
+	    psecuritypriv->dot11PrivacyAlgrthm != _WEP104_)
 		auth_mode = 0;
 
-	if ((algorithm > 0 && auth_mode == 0) ||	/*  rx a shared-key auth but shared not enabled */
-		(algorithm == 0 && auth_mode == 1)) {	/*  rx a open-system auth but shared-key is enabled */
+	if ((algorithm > 0 &&
+	     auth_mode ==
+		     0) || /*  rx a shared-key auth but shared not enabled */
+	    (algorithm == 0 &&
+	     auth_mode ==
+		     1)) { /*  rx a open-system auth but shared-key is enabled */
 
 		status = WLAN_STATUS_NOT_SUPPORTED_AUTH_ALG;
 
@@ -765,7 +849,8 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 		goto auth_fail;
 	}
 
-	if (algorithm == 0 && (auth_mode == 0 || auth_mode == 2 || auth_mode == 3)) {
+	if (algorithm == 0 &&
+	    (auth_mode == 0 || auth_mode == 2 || auth_mode == 3)) {
 		if (seq == 1) {
 			pstat->state &= ~WIFI_FW_AUTH_NULL;
 			pstat->state |= WIFI_FW_AUTH_SUCCESS;
@@ -784,8 +869,10 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 			pstat->state |= WIFI_FW_AUTH_STATE;
 			pstat->authalg = algorithm;
 		} else if (seq == 3) {
-			p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + 4 + _AUTH_IE_OFFSET_, WLAN_EID_CHALLENGE, (int *)&ie_len,
-					len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_ - 4);
+			p = rtw_get_ie(
+				pframe + WLAN_HDR_A3_LEN + 4 + _AUTH_IE_OFFSET_,
+				WLAN_EID_CHALLENGE, (int *)&ie_len,
+				len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_ - 4);
 
 			if (!p || ie_len <= 0) {
 				status = WLAN_STATUS_CHALLENGE_FAIL;
@@ -796,7 +883,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 				pstat->state &= (~WIFI_FW_AUTH_STATE);
 				pstat->state |= WIFI_FW_AUTH_SUCCESS;
 				/*  challenging txt is correct... */
-				pstat->expire_to =  pstapriv->assoc_to;
+				pstat->expire_to = pstapriv->assoc_to;
 			} else {
 				status = WLAN_STATUS_CHALLENGE_FAIL;
 				goto auth_fail;
@@ -832,11 +919,12 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	return _FAIL;
 }
 
-unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_frame)
+unsigned int OnAuthClient(struct adapter *padapter,
+			  union recv_frame *precv_frame)
 {
-	unsigned int	seq, len, status, offset;
+	unsigned int seq, len, status, offset;
 	unsigned char *p;
-	unsigned int	go2asoc = 0;
+	unsigned int go2asoc = 0;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
@@ -851,11 +939,14 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 
 	offset = (GetPrivacy(pframe)) ? 4 : 0;
 
-	seq	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 2));
-	status	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 4));
+	seq = le16_to_cpu(
+		*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 2));
+	status = le16_to_cpu(
+		*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 4));
 
 	if (status != 0) {
-		if (status == 13) { /*  pmlmeinfo->auth_algo == dot11AuthAlgrthm_Auto) */
+		if (status ==
+		    13) { /*  pmlmeinfo->auth_algo == dot11AuthAlgrthm_Auto) */
 			if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared)
 				pmlmeinfo->auth_algo = dot11AuthAlgrthm_Open;
 			else
@@ -869,8 +960,10 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 
 	if (seq == 2) {
 		if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared) {
-			 /*  legendary shared system */
-			p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + _AUTH_IE_OFFSET_, WLAN_EID_CHALLENGE, (int *)&len,
+			/*  legendary shared system */
+			p = rtw_get_ie(
+				pframe + WLAN_HDR_A3_LEN + _AUTH_IE_OFFSET_,
+				WLAN_EID_CHALLENGE, (int *)&len,
 				pkt_len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_);
 
 			if (!p)
@@ -914,23 +1007,23 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	struct rtw_ieee802_11_elems elems;
 	struct sta_info *pstat;
 	unsigned char *p, *pos, *wpa_ie;
-	unsigned char WMM_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x00, 0x01};
-	int		i, ie_len, left;
+	unsigned char WMM_IE[] = { 0x00, 0x50, 0xf2, 0x02, 0x00, 0x01 };
+	int i, ie_len, left;
 	u8 wpa_ie_len;
 	unsigned char supportRate[16];
-	int					support_rate_num;
-	unsigned short		status = WLAN_STATUS_SUCCESS;
-	unsigned short		frame_type, ie_offset = 0;
+	int support_rate_num;
+	unsigned short status = WLAN_STATUS_SUCCESS;
+	unsigned short frame_type, ie_offset = 0;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
-	struct wlan_bssid_ex	*cur = &(pmlmeinfo->network);
+	struct wlan_bssid_ex *cur = &(pmlmeinfo->network);
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
 	uint pkt_len = precv_frame->u.hdr.len;
 
-	if ((pmlmeinfo->state&0x03) != WIFI_FW_AP_STATE)
+	if ((pmlmeinfo->state & 0x03) != WIFI_FW_AP_STATE)
 		return _FAIL;
 
 	frame_type = GetFrameSubType(pframe);
@@ -979,8 +1072,8 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 
 	/*  now we should check all the fields... */
 	/*  checking SSID */
-	p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + ie_offset, WLAN_EID_SSID, &ie_len,
-		pkt_len - WLAN_HDR_A3_LEN - ie_offset);
+	p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + ie_offset, WLAN_EID_SSID,
+		       &ie_len, pkt_len - WLAN_HDR_A3_LEN - ie_offset);
 
 	if (!p || ie_len == 0) {
 		/*  broadcast ssid, however it is not allowed in assocreq */
@@ -988,7 +1081,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		goto OnAssocReqFail;
 	} else {
 		/*  check if ssid match */
-		if (memcmp(p+2, cur->ssid.ssid, cur->ssid.ssid_length))
+		if (memcmp(p + 2, cur->ssid.ssid, cur->ssid.ssid_length))
 			status = WLAN_STATUS_CHALLENGE_FAIL;
 
 		if (ie_len != cur->ssid.ssid_length)
@@ -999,7 +1092,9 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		goto OnAssocReqFail;
 
 	/*  check if the supported rate is ok */
-	p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + ie_offset, WLAN_EID_SUPP_RATES, &ie_len, pkt_len - WLAN_HDR_A3_LEN - ie_offset);
+	p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + ie_offset,
+		       WLAN_EID_SUPP_RATES, &ie_len,
+		       pkt_len - WLAN_HDR_A3_LEN - ie_offset);
 	if (!p) {
 		/*  use our own rate set as statoin used */
 		/* memcpy(supportRate, AP_BSSRATE, AP_BSSRATE_LEN); */
@@ -1011,14 +1106,16 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		if (ie_len > sizeof(supportRate))
 			ie_len = sizeof(supportRate);
 
-		memcpy(supportRate, p+2, ie_len);
+		memcpy(supportRate, p + 2, ie_len);
 		support_rate_num = ie_len;
 
-		p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + ie_offset, WLAN_EID_EXT_SUPP_RATES, &ie_len,
-				pkt_len - WLAN_HDR_A3_LEN - ie_offset);
+		p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + ie_offset,
+			       WLAN_EID_EXT_SUPP_RATES, &ie_len,
+			       pkt_len - WLAN_HDR_A3_LEN - ie_offset);
 		if (p) {
 			if (support_rate_num + ie_len <= sizeof(supportRate)) {
-				memcpy(supportRate + support_rate_num, p + 2, ie_len);
+				memcpy(supportRate + support_rate_num, p + 2,
+				       ie_len);
 				support_rate_num += ie_len;
 			}
 		}
@@ -1046,12 +1143,16 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		wpa_ie = elems.rsn_ie;
 		wpa_ie_len = elems.rsn_ie_len;
 
-		if (rtw_parse_wpa2_ie(wpa_ie-2, wpa_ie_len+2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
-			pstat->dot8021xalg = 1;/* psk,  todo:802.1x */
+		if (rtw_parse_wpa2_ie(wpa_ie - 2, wpa_ie_len + 2, &group_cipher,
+				      &pairwise_cipher, NULL) == _SUCCESS) {
+			pstat->dot8021xalg = 1; /* psk,  todo:802.1x */
 			pstat->wpa_psk |= BIT(1);
 
-			pstat->wpa2_group_cipher = group_cipher&psecuritypriv->wpa2_group_cipher;
-			pstat->wpa2_pairwise_cipher = pairwise_cipher&psecuritypriv->wpa2_pairwise_cipher;
+			pstat->wpa2_group_cipher =
+				group_cipher & psecuritypriv->wpa2_group_cipher;
+			pstat->wpa2_pairwise_cipher =
+				pairwise_cipher &
+				psecuritypriv->wpa2_pairwise_cipher;
 
 			if (!pstat->wpa2_group_cipher)
 				status = WLAN_STATUS_INVALID_GROUP_CIPHER;
@@ -1068,12 +1169,16 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		wpa_ie = elems.wpa_ie;
 		wpa_ie_len = elems.wpa_ie_len;
 
-		if (rtw_parse_wpa_ie(wpa_ie-2, wpa_ie_len+2, &group_cipher, &pairwise_cipher, NULL) == _SUCCESS) {
-			pstat->dot8021xalg = 1;/* psk,  todo:802.1x */
+		if (rtw_parse_wpa_ie(wpa_ie - 2, wpa_ie_len + 2, &group_cipher,
+				     &pairwise_cipher, NULL) == _SUCCESS) {
+			pstat->dot8021xalg = 1; /* psk,  todo:802.1x */
 			pstat->wpa_psk |= BIT(0);
 
-			pstat->wpa_group_cipher = group_cipher&psecuritypriv->wpa_group_cipher;
-			pstat->wpa_pairwise_cipher = pairwise_cipher&psecuritypriv->wpa_pairwise_cipher;
+			pstat->wpa_group_cipher =
+				group_cipher & psecuritypriv->wpa_group_cipher;
+			pstat->wpa_pairwise_cipher =
+				pairwise_cipher &
+				psecuritypriv->wpa_pairwise_cipher;
 
 			if (!pstat->wpa_group_cipher)
 				status = WLAN_STATUS_INVALID_GROUP_CIPHER;
@@ -1102,15 +1207,20 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 
 		/*  AP support WPA/RSN, and sta is going to do WPS, but AP is not ready */
 		/*  that the selected registrar of AP is _FLASE */
-		if ((psecuritypriv->wpa_psk > 0)
-			&& (pstat->flags & (WLAN_STA_WPS|WLAN_STA_MAYBE_WPS))) {
+		if ((psecuritypriv->wpa_psk > 0) &&
+		    (pstat->flags & (WLAN_STA_WPS | WLAN_STA_MAYBE_WPS))) {
 			if (pmlmepriv->wps_beacon_ie) {
 				u8 selected_registrar = 0;
 
-				rtw_get_wps_attr_content(pmlmepriv->wps_beacon_ie, pmlmepriv->wps_beacon_ie_len, WPS_ATTR_SELECTED_REGISTRAR, &selected_registrar, NULL);
+				rtw_get_wps_attr_content(
+					pmlmepriv->wps_beacon_ie,
+					pmlmepriv->wps_beacon_ie_len,
+					WPS_ATTR_SELECTED_REGISTRAR,
+					&selected_registrar, NULL);
 
 				if (!selected_registrar) {
-					status = WLAN_STATUS_AP_UNABLE_TO_HANDLE_NEW_STA;
+					status =
+						WLAN_STATUS_AP_UNABLE_TO_HANDLE_NEW_STA;
 
 					goto OnAssocReqFail;
 				}
@@ -1134,7 +1244,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		}
 
 		if (copy_len > 0)
-			memcpy(pstat->wpa_ie, wpa_ie-2, copy_len);
+			memcpy(pstat->wpa_ie, wpa_ie - 2, copy_len);
 	}
 
 	/*  check if there is WMM IE & support WWM-PS */
@@ -1147,13 +1257,15 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	pstat->uapsd_be = 0;
 	pstat->uapsd_bk = 0;
 	if (pmlmepriv->qospriv.qos_option) {
-		p = pframe + WLAN_HDR_A3_LEN + ie_offset; ie_len = 0;
+		p = pframe + WLAN_HDR_A3_LEN + ie_offset;
+		ie_len = 0;
 		for (;;) {
-			p = rtw_get_ie(p, WLAN_EID_VENDOR_SPECIFIC, &ie_len, pkt_len - WLAN_HDR_A3_LEN - ie_offset);
+			p = rtw_get_ie(p, WLAN_EID_VENDOR_SPECIFIC, &ie_len,
+				       pkt_len - WLAN_HDR_A3_LEN - ie_offset);
 			if (!p)
 				break;
 
-			if (memcmp(p+2, WMM_IE, 6)) {
+			if (memcmp(p + 2, WMM_IE, 6)) {
 				p = p + ie_len + 2;
 				continue;
 			}
@@ -1161,33 +1273,33 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 			pstat->flags |= WLAN_STA_WME;
 
 			pstat->qos_option = 1;
-			pstat->qos_info = *(p+8);
+			pstat->qos_info = *(p + 8);
 
-			pstat->max_sp_len = (pstat->qos_info>>5)&0x3;
+			pstat->max_sp_len = (pstat->qos_info >> 5) & 0x3;
 
-			if ((pstat->qos_info&0xf) != 0xf)
+			if ((pstat->qos_info & 0xf) != 0xf)
 				pstat->has_legacy_ac = true;
 			else
 				pstat->has_legacy_ac = false;
 
-			if (pstat->qos_info&0xf) {
-				if (pstat->qos_info&BIT(0))
-					pstat->uapsd_vo = BIT(0)|BIT(1);
+			if (pstat->qos_info & 0xf) {
+				if (pstat->qos_info & BIT(0))
+					pstat->uapsd_vo = BIT(0) | BIT(1);
 				else
 					pstat->uapsd_vo = 0;
 
-				if (pstat->qos_info&BIT(1))
-					pstat->uapsd_vi = BIT(0)|BIT(1);
+				if (pstat->qos_info & BIT(1))
+					pstat->uapsd_vi = BIT(0) | BIT(1);
 				else
 					pstat->uapsd_vi = 0;
 
-				if (pstat->qos_info&BIT(2))
-					pstat->uapsd_bk = BIT(0)|BIT(1);
+				if (pstat->qos_info & BIT(2))
+					pstat->uapsd_bk = BIT(0) | BIT(1);
 				else
 					pstat->uapsd_bk = 0;
 
-				if (pstat->qos_info&BIT(3))
-					pstat->uapsd_be = BIT(0)|BIT(1);
+				if (pstat->qos_info & BIT(3))
+					pstat->uapsd_be = BIT(0) | BIT(1);
 				else
 					pstat->uapsd_be = 0;
 			}
@@ -1198,24 +1310,26 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 
 	/* save HT capabilities in the sta object */
 	memset(&pstat->htpriv.ht_cap, 0, sizeof(struct ieee80211_ht_cap));
-	if (elems.ht_capabilities && elems.ht_capabilities_len >= sizeof(struct ieee80211_ht_cap)) {
+	if (elems.ht_capabilities &&
+	    elems.ht_capabilities_len >= sizeof(struct ieee80211_ht_cap)) {
 		pstat->flags |= WLAN_STA_HT;
 
 		pstat->flags |= WLAN_STA_WME;
 
-		memcpy(&pstat->htpriv.ht_cap, elems.ht_capabilities, sizeof(struct ieee80211_ht_cap));
+		memcpy(&pstat->htpriv.ht_cap, elems.ht_capabilities,
+		       sizeof(struct ieee80211_ht_cap));
 
 	} else
 		pstat->flags &= ~WLAN_STA_HT;
 
-	if (!pmlmepriv->htpriv.ht_option && (pstat->flags&WLAN_STA_HT)) {
+	if (!pmlmepriv->htpriv.ht_option && (pstat->flags & WLAN_STA_HT)) {
 		status = WLAN_STATUS_CHALLENGE_FAIL;
 		goto OnAssocReqFail;
 	}
 
 	if ((pstat->flags & WLAN_STA_HT) &&
-		    ((pstat->wpa2_pairwise_cipher&WPA_CIPHER_TKIP) ||
-		      (pstat->wpa_pairwise_cipher&WPA_CIPHER_TKIP))) {
+	    ((pstat->wpa2_pairwise_cipher & WPA_CIPHER_TKIP) ||
+	     (pstat->wpa_pairwise_cipher & WPA_CIPHER_TKIP))) {
 		/* status = WLAN_STATUS_CIPHER_SUITE_REJECTED; */
 		/* goto OnAssocReqFail; */
 	}
@@ -1276,7 +1390,8 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	spin_unlock_bh(&pstapriv->asoc_list_lock);
 
 	/*  now the station is qualified to join our BSS... */
-	if (pstat && (pstat->state & WIFI_FW_ASSOC_SUCCESS) && (status == WLAN_STATUS_SUCCESS)) {
+	if (pstat && (pstat->state & WIFI_FW_ASSOC_SUCCESS) &&
+	    (status == WLAN_STATUS_SUCCESS)) {
 		/* 1 bss_cap_update & sta_info_update */
 		bss_cap_update_on_sta_join(padapter, pstat);
 		sta_info_update(padapter, pstat);
@@ -1323,7 +1438,7 @@ unsigned int OnAssocRsp(struct adapter *padapter, union recv_frame *precv_frame)
 {
 	uint i;
 	int res;
-	unsigned short	status;
+	unsigned short status;
 	struct ndis_80211_var_ie *pIE;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
@@ -1353,13 +1468,16 @@ unsigned int OnAssocRsp(struct adapter *padapter, union recv_frame *precv_frame)
 	}
 
 	/* get capabilities */
-	pmlmeinfo->capability = le16_to_cpu(*(__le16 *)(pframe + WLAN_HDR_A3_LEN));
+	pmlmeinfo->capability =
+		le16_to_cpu(*(__le16 *)(pframe + WLAN_HDR_A3_LEN));
 
 	/* set slot time */
 	pmlmeinfo->slotTime = (pmlmeinfo->capability & BIT(10)) ? 9 : 20;
 
 	/* AID */
-	res = pmlmeinfo->aid = (int)(le16_to_cpu(*(__le16 *)(pframe + WLAN_HDR_A3_LEN + 4))&0x3fff);
+	res = pmlmeinfo->aid =
+		(int)(le16_to_cpu(*(__le16 *)(pframe + WLAN_HDR_A3_LEN + 4)) &
+		      0x3fff);
 
 	/* following are moved to join event callback function */
 	/* to handle HT, WMM, rate adaptive, update MAC reg */
@@ -1369,15 +1487,15 @@ unsigned int OnAssocRsp(struct adapter *padapter, union recv_frame *precv_frame)
 
 		switch (pIE->element_id) {
 		case WLAN_EID_VENDOR_SPECIFIC:
-			if (!memcmp(pIE->data, WMM_PARA_OUI, 6))	/* WMM */
+			if (!memcmp(pIE->data, WMM_PARA_OUI, 6)) /* WMM */
 				WMM_param_handler(padapter, pIE);
 			break;
 
-		case WLAN_EID_HT_CAPABILITY:	/* HT caps */
+		case WLAN_EID_HT_CAPABILITY: /* HT caps */
 			HT_caps_handler(padapter, pIE);
 			break;
 
-		case WLAN_EID_HT_OPERATION:	/* HT info */
+		case WLAN_EID_HT_OPERATION: /* HT info */
 			HT_info_handler(padapter, pIE);
 			break;
 
@@ -1400,7 +1518,8 @@ unsigned int OnAssocRsp(struct adapter *padapter, union recv_frame *precv_frame)
 
 report_assoc_result:
 	if (res > 0)
-		rtw_buf_update(&pmlmepriv->assoc_rsp, &pmlmepriv->assoc_rsp_len, pframe, pkt_len);
+		rtw_buf_update(&pmlmepriv->assoc_rsp, &pmlmepriv->assoc_rsp_len,
+			       pframe, pkt_len);
 	else
 		rtw_buf_free(&pmlmepriv->assoc_rsp, &pmlmepriv->assoc_rsp_len);
 
@@ -1411,7 +1530,7 @@ unsigned int OnAssocRsp(struct adapter *padapter, union recv_frame *precv_frame)
 
 unsigned int OnDeAuth(struct adapter *padapter, union recv_frame *precv_frame)
 {
-	unsigned short	reason;
+	unsigned short reason;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
@@ -1419,7 +1538,8 @@ unsigned int OnDeAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	int ignore_received_deauth = 0;
 
 	/* check A3 */
-	if (memcmp(GetAddr3Ptr(pframe), get_my_bssid(&pmlmeinfo->network), ETH_ALEN))
+	if (memcmp(GetAddr3Ptr(pframe), get_my_bssid(&pmlmeinfo->network),
+		   ETH_ALEN))
 		return _SUCCESS;
 
 	reason = le16_to_cpu(*(__le16 *)(pframe + WLAN_HDR_A3_LEN));
@@ -1442,7 +1562,8 @@ unsigned int OnDeAuth(struct adapter *padapter, union recv_frame *precv_frame)
 			if (!list_empty(&psta->asoc_list)) {
 				list_del_init(&psta->asoc_list);
 				pstapriv->asoc_list_cnt--;
-				updated = ap_free_sta(padapter, psta, false, reason);
+				updated = ap_free_sta(padapter, psta, false,
+						      reason);
 			}
 			spin_unlock_bh(&pstapriv->asoc_list_lock);
 
@@ -1470,8 +1591,7 @@ unsigned int OnDeAuth(struct adapter *padapter, union recv_frame *precv_frame)
 
 	netdev_dbg(padapter->pnetdev,
 		   "sta recv deauth reason code(%d) sta:%pM, ignore = %d\n",
-		   reason, GetAddr3Ptr(pframe),
-		   ignore_received_deauth);
+		   reason, GetAddr3Ptr(pframe), ignore_received_deauth);
 
 	if (ignore_received_deauth == 0)
 		receive_disconnect(padapter, GetAddr3Ptr(pframe), reason);
@@ -1482,14 +1602,15 @@ unsigned int OnDeAuth(struct adapter *padapter, union recv_frame *precv_frame)
 
 unsigned int OnDisassoc(struct adapter *padapter, union recv_frame *precv_frame)
 {
-	unsigned short	reason;
+	unsigned short reason;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
 
 	/* check A3 */
-	if (memcmp(GetAddr3Ptr(pframe), get_my_bssid(&pmlmeinfo->network), ETH_ALEN))
+	if (memcmp(GetAddr3Ptr(pframe), get_my_bssid(&pmlmeinfo->network),
+		   ETH_ALEN))
 		return _SUCCESS;
 
 	reason = le16_to_cpu(*(__le16 *)(pframe + WLAN_HDR_A3_LEN));
@@ -1501,8 +1622,8 @@ unsigned int OnDisassoc(struct adapter *padapter, union recv_frame *precv_frame)
 		/* rtw_free_stainfo(padapter, psta); */
 
 		netdev_dbg(padapter->pnetdev,
-			   "ap recv disassoc reason code(%d) sta:%pM\n",
-			   reason, GetAddr2Ptr(pframe));
+			   "ap recv disassoc reason code(%d) sta:%pM\n", reason,
+			   GetAddr2Ptr(pframe));
 
 		psta = rtw_get_stainfo(pstapriv, GetAddr2Ptr(pframe));
 		if (psta) {
@@ -1512,7 +1633,8 @@ unsigned int OnDisassoc(struct adapter *padapter, union recv_frame *precv_frame)
 			if (!list_empty(&psta->asoc_list)) {
 				list_del_init(&psta->asoc_list);
 				pstapriv->asoc_list_cnt--;
-				updated = ap_free_sta(padapter, psta, false, reason);
+				updated = ap_free_sta(padapter, psta, false,
+						      reason);
 			}
 			spin_unlock_bh(&pstapriv->asoc_list_lock);
 
@@ -1522,8 +1644,8 @@ unsigned int OnDisassoc(struct adapter *padapter, union recv_frame *precv_frame)
 		return _SUCCESS;
 	}
 	netdev_dbg(padapter->pnetdev,
-		   "sta recv disassoc reason code(%d) sta:%pM\n",
-		   reason, GetAddr3Ptr(pframe));
+		   "sta recv disassoc reason code(%d) sta:%pM\n", reason,
+		   GetAddr3Ptr(pframe));
 
 	receive_disconnect(padapter, GetAddr3Ptr(pframe), reason);
 
@@ -1536,7 +1658,8 @@ unsigned int OnAtim(struct adapter *padapter, union recv_frame *precv_frame)
 	return _SUCCESS;
 }
 
-unsigned int on_action_spct(struct adapter *padapter, union recv_frame *precv_frame)
+unsigned int on_action_spct(struct adapter *padapter,
+			    union recv_frame *precv_frame)
 {
 	struct sta_info *psta = NULL;
 	struct sta_priv *pstapriv = &padapter->stapriv;
@@ -1570,24 +1693,26 @@ unsigned int on_action_spct(struct adapter *padapter, union recv_frame *precv_fr
 	return _FAIL;
 }
 
-unsigned int OnAction_back(struct adapter *padapter, union recv_frame *precv_frame)
+unsigned int OnAction_back(struct adapter *padapter,
+			   union recv_frame *precv_frame)
 {
 	u8 *addr;
 	struct sta_info *psta = NULL;
 	struct recv_reorder_ctrl *preorder_ctrl;
 	unsigned char *frame_body;
 	unsigned char category, action;
-	unsigned short	tid, status;
+	unsigned short tid, status;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 
 	/* check RA matches or not */
-	if (memcmp(myid(&(padapter->eeprompriv)), GetAddr1Ptr(pframe), ETH_ALEN))/* for if1, sta/ap mode */
+	if (memcmp(myid(&(padapter->eeprompriv)), GetAddr1Ptr(pframe),
+		   ETH_ALEN)) /* for if1, sta/ap mode */
 		return _SUCCESS;
 
-	if ((pmlmeinfo->state&0x03) != WIFI_FW_AP_STATE)
+	if ((pmlmeinfo->state & 0x03) != WIFI_FW_AP_STATE)
 		if (!(pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS))
 			return _SUCCESS;
 
@@ -1597,10 +1722,11 @@ unsigned int OnAction_back(struct adapter *padapter, union recv_frame *precv_fra
 	if (!psta)
 		return _SUCCESS;
 
-	frame_body = (unsigned char *)(pframe + sizeof(struct ieee80211_hdr_3addr));
+	frame_body =
+		(unsigned char *)(pframe + sizeof(struct ieee80211_hdr_3addr));
 
 	category = frame_body[0];
-	if (category == RTW_WLAN_CATEGORY_BACK) {/*  representing Block Ack */
+	if (category == RTW_WLAN_CATEGORY_BACK) { /*  representing Block Ack */
 		if (!pmlmeinfo->HT_enable)
 			return _SUCCESS;
 
@@ -1608,14 +1734,19 @@ unsigned int OnAction_back(struct adapter *padapter, union recv_frame *precv_fra
 		switch (action) {
 		case WLAN_ACTION_ADDBA_REQ: /* ADDBA request */
 
-			memcpy(&(pmlmeinfo->ADDBA_req), &(frame_body[2]), sizeof(struct ADDBA_request));
+			memcpy(&(pmlmeinfo->ADDBA_req), &(frame_body[2]),
+			       sizeof(struct ADDBA_request));
 			/* process_addba_req(padapter, (u8 *)&(pmlmeinfo->ADDBA_req), GetAddr3Ptr(pframe)); */
-			process_addba_req(padapter, (u8 *)&(pmlmeinfo->ADDBA_req), addr);
+			process_addba_req(padapter,
+					  (u8 *)&(pmlmeinfo->ADDBA_req), addr);
 
 			if (pmlmeinfo->accept_addba_req)
-				issue_action_BA(padapter, addr, WLAN_ACTION_ADDBA_RESP, 0);
+				issue_action_BA(padapter, addr,
+						WLAN_ACTION_ADDBA_RESP, 0);
 			else
-				issue_action_BA(padapter, addr, WLAN_ACTION_ADDBA_RESP, 37);/* reject ADDBA Req */
+				issue_action_BA(padapter, addr,
+						WLAN_ACTION_ADDBA_RESP,
+						37); /* reject ADDBA Req */
 
 			break;
 
@@ -1648,7 +1779,7 @@ unsigned int OnAction_back(struct adapter *padapter, union recv_frame *precv_fra
 			} else if ((frame_body[3] & BIT(3)) == BIT(3)) {
 				tid = (frame_body[3] >> 4) & 0x0F;
 
-				preorder_ctrl =  &psta->recvreorder_ctrl[tid];
+				preorder_ctrl = &psta->recvreorder_ctrl[tid];
 				preorder_ctrl->enable = false;
 				preorder_ctrl->indicate_seq = 0xffff;
 			}
@@ -1667,13 +1798,13 @@ static s32 rtw_action_public_decache(union recv_frame *recv_frame, s32 token)
 	struct adapter *adapter = recv_frame->u.hdr.adapter;
 	struct mlme_ext_priv *mlmeext = &(adapter->mlmeextpriv);
 	u8 *frame = recv_frame->u.hdr.rx_data;
-	u16 seq_ctrl = ((recv_frame->u.hdr.attrib.seq_num&0xffff) << 4) |
-		(recv_frame->u.hdr.attrib.frag_num & 0xf);
+	u16 seq_ctrl = ((recv_frame->u.hdr.attrib.seq_num & 0xffff) << 4) |
+		       (recv_frame->u.hdr.attrib.frag_num & 0xf);
 
 	if (GetRetry(frame)) {
 		if (token >= 0) {
-			if ((seq_ctrl == mlmeext->action_public_rxseq)
-				&& (token == mlmeext->action_public_dialog_token))
+			if ((seq_ctrl == mlmeext->action_public_rxseq) &&
+			    (token == mlmeext->action_public_dialog_token))
 				return _FAIL;
 		} else {
 			if (seq_ctrl == mlmeext->action_public_rxseq)
@@ -1695,7 +1826,8 @@ static unsigned int on_action_public_p2p(union recv_frame *precv_frame)
 	u8 *frame_body;
 	u8 dialogToken = 0;
 
-	frame_body = (unsigned char *)(pframe + sizeof(struct ieee80211_hdr_3addr));
+	frame_body =
+		(unsigned char *)(pframe + sizeof(struct ieee80211_hdr_3addr));
 
 	dialogToken = frame_body[7];
 
@@ -1717,7 +1849,8 @@ static unsigned int on_action_public_vendor(union recv_frame *precv_frame)
 	return ret;
 }
 
-static unsigned int on_action_public_default(union recv_frame *precv_frame, u8 action)
+static unsigned int on_action_public_default(union recv_frame *precv_frame,
+					     u8 action)
 {
 	unsigned int ret = _FAIL;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
@@ -1732,7 +1865,8 @@ static unsigned int on_action_public_default(union recv_frame *precv_frame, u8 a
 	if (rtw_action_public_decache(precv_frame, token) == _FAIL)
 		goto exit;
 
-	scnprintf(msg, sizeof(msg), "%s(token:%u)", action_public_str(action), token);
+	scnprintf(msg, sizeof(msg), "%s(token:%u)", action_public_str(action),
+		  token);
 	rtw_cfg80211_rx_action(adapter, pframe, frame_len, msg);
 
 	ret = _SUCCESS;
@@ -1741,7 +1875,8 @@ static unsigned int on_action_public_default(union recv_frame *precv_frame, u8 a
 	return ret;
 }
 
-unsigned int on_action_public(struct adapter *padapter, union recv_frame *precv_frame)
+unsigned int on_action_public(struct adapter *padapter,
+			      union recv_frame *precv_frame)
 {
 	unsigned int ret = _FAIL;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
@@ -1749,7 +1884,8 @@ unsigned int on_action_public(struct adapter *padapter, union recv_frame *precv_
 	u8 category, action;
 
 	/* check RA matches or not */
-	if (memcmp(myid(&(padapter->eeprompriv)), GetAddr1Ptr(pframe), ETH_ALEN))
+	if (memcmp(myid(&(padapter->eeprompriv)), GetAddr1Ptr(pframe),
+		   ETH_ALEN))
 		goto exit;
 
 	category = frame_body[0];
@@ -1770,14 +1906,16 @@ unsigned int on_action_public(struct adapter *padapter, union recv_frame *precv_
 	return ret;
 }
 
-unsigned int OnAction_ht(struct adapter *padapter, union recv_frame *precv_frame)
+unsigned int OnAction_ht(struct adapter *padapter,
+			 union recv_frame *precv_frame)
 {
 	u8 *pframe = precv_frame->u.hdr.rx_data;
 	u8 *frame_body = pframe + sizeof(struct ieee80211_hdr_3addr);
 	u8 category, action;
 
 	/* check RA matches or not */
-	if (memcmp(myid(&(padapter->eeprompriv)), GetAddr1Ptr(pframe), ETH_ALEN))
+	if (memcmp(myid(&(padapter->eeprompriv)), GetAddr1Ptr(pframe),
+		   ETH_ALEN))
 		goto exit;
 
 	category = frame_body[0];
@@ -1797,15 +1935,17 @@ unsigned int OnAction_ht(struct adapter *padapter, union recv_frame *precv_frame
 	return _SUCCESS;
 }
 
-unsigned int OnAction_sa_query(struct adapter *padapter, union recv_frame *precv_frame)
+unsigned int OnAction_sa_query(struct adapter *padapter,
+			       union recv_frame *precv_frame)
 {
 	u8 *pframe = precv_frame->u.hdr.rx_data;
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	unsigned short tid;
 
-	switch (pframe[WLAN_HDR_A3_LEN+1]) {
+	switch (pframe[WLAN_HDR_A3_LEN + 1]) {
 	case 0: /* SA Query req */
-		memcpy(&tid, &pframe[WLAN_HDR_A3_LEN+2], sizeof(unsigned short));
+		memcpy(&tid, &pframe[WLAN_HDR_A3_LEN + 2],
+		       sizeof(unsigned short));
 		issue_action_SA_Query(padapter, GetAddr2Ptr(pframe), 1, tid);
 		break;
 
@@ -1827,7 +1967,8 @@ unsigned int OnAction(struct adapter *padapter, union recv_frame *precv_frame)
 	unsigned char *frame_body;
 	u8 *pframe = precv_frame->u.hdr.rx_data;
 
-	frame_body = (unsigned char *)(pframe + sizeof(struct ieee80211_hdr_3addr));
+	frame_body =
+		(unsigned char *)(pframe + sizeof(struct ieee80211_hdr_3addr));
 
 	category = frame_body[0];
 
@@ -1846,7 +1987,8 @@ unsigned int DoReserved(struct adapter *padapter, union recv_frame *precv_frame)
 	return _SUCCESS;
 }
 
-static struct xmit_frame *_alloc_mgtxmitframe(struct xmit_priv *pxmitpriv, bool once)
+static struct xmit_frame *_alloc_mgtxmitframe(struct xmit_priv *pxmitpriv,
+					      bool once)
 {
 	struct xmit_frame *pmgntframe;
 	struct xmit_buf *pxmitbuf;
@@ -1889,7 +2031,8 @@ void update_mgnt_tx_rate(struct adapter *padapter, u8 rate)
 	pmlmeext->tx_rate = rate;
 }
 
-void update_mgntframe_attrib(struct adapter *padapter, struct pkt_attrib *pattrib)
+void update_mgntframe_attrib(struct adapter *padapter,
+			     struct pkt_attrib *pattrib)
 {
 	u8 wireless_mode;
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
@@ -1908,7 +2051,7 @@ void update_mgntframe_attrib(struct adapter *padapter, struct pkt_attrib *pattri
 		wireless_mode = WIRELESS_11B;
 	else
 		wireless_mode = WIRELESS_11G;
-	pattrib->raid =  rtw_get_mgntframe_raid(padapter, wireless_mode);
+	pattrib->raid = rtw_get_mgntframe_raid(padapter, wireless_mode);
 	pattrib->rate = pmlmeext->tx_rate;
 
 	pattrib->encrypt = _NO_PRIVACY_;
@@ -1927,10 +2070,11 @@ void update_mgntframe_attrib(struct adapter *padapter, struct pkt_attrib *pattri
 	pattrib->mbssid = 0;
 }
 
-void update_mgntframe_attrib_addr(struct adapter *padapter, struct xmit_frame *pmgntframe)
+void update_mgntframe_attrib_addr(struct adapter *padapter,
+				  struct xmit_frame *pmgntframe)
 {
 	u8 *pframe;
-	struct pkt_attrib	*pattrib = &pmgntframe->attrib;
+	struct pkt_attrib *pattrib = &pmgntframe->attrib;
 
 	pframe = (u8 *)(pmgntframe->buf_addr) + TXDESC_OFFSET;
 
@@ -1940,8 +2084,7 @@ void update_mgntframe_attrib_addr(struct adapter *padapter, struct xmit_frame *p
 
 void dump_mgntframe(struct adapter *padapter, struct xmit_frame *pmgntframe)
 {
-	if (padapter->bSurpriseRemoved ||
-		padapter->bDriverStopped) {
+	if (padapter->bSurpriseRemoved || padapter->bDriverStopped) {
 		rtw_free_xmitbuf(&padapter->xmitpriv, pmgntframe->pxmitbuf);
 		rtw_free_xmitframe(&padapter->xmitpriv, pmgntframe);
 		return;
@@ -1950,7 +2093,8 @@ void dump_mgntframe(struct adapter *padapter, struct xmit_frame *pmgntframe)
 	rtw_hal_mgnt_xmit(padapter, pmgntframe);
 }
 
-s32 dump_mgntframe_and_wait(struct adapter *padapter, struct xmit_frame *pmgntframe, int timeout_ms)
+s32 dump_mgntframe_and_wait(struct adapter *padapter,
+			    struct xmit_frame *pmgntframe, int timeout_ms)
 {
 	s32 ret = _FAIL;
 	unsigned long irqL;
@@ -1958,8 +2102,7 @@ s32 dump_mgntframe_and_wait(struct adapter *padapter, struct xmit_frame *pmgntfr
 	struct xmit_buf *pxmitbuf = pmgntframe->pxmitbuf;
 	struct submit_ctx sctx;
 
-	if (padapter->bSurpriseRemoved ||
-		padapter->bDriverStopped) {
+	if (padapter->bSurpriseRemoved || padapter->bDriverStopped) {
 		rtw_free_xmitbuf(&padapter->xmitpriv, pmgntframe->pxmitbuf);
 		rtw_free_xmitframe(&padapter->xmitpriv, pmgntframe);
 		return ret;
@@ -1980,15 +2123,15 @@ s32 dump_mgntframe_and_wait(struct adapter *padapter, struct xmit_frame *pmgntfr
 	return ret;
 }
 
-s32 dump_mgntframe_and_wait_ack(struct adapter *padapter, struct xmit_frame *pmgntframe)
+s32 dump_mgntframe_and_wait_ack(struct adapter *padapter,
+				struct xmit_frame *pmgntframe)
 {
 	static u8 seq_no;
 	s32 ret = _FAIL;
-	u32 timeout_ms = 500;/*   500ms */
+	u32 timeout_ms = 500; /*   500ms */
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 
-	if (padapter->bSurpriseRemoved ||
-		padapter->bDriverStopped) {
+	if (padapter->bSurpriseRemoved || padapter->bDriverStopped) {
 		rtw_free_xmitbuf(&padapter->xmitpriv, pmgntframe->pxmitbuf);
 		rtw_free_xmitframe(&padapter->xmitpriv, pmgntframe);
 		return -1;
@@ -2014,19 +2157,18 @@ static int update_hidden_ssid(u8 *ies, u32 ies_len, u8 hidden_ssid_mode)
 	signed int ssid_len_ori;
 	int len_diff = 0;
 
-	ssid_ie = rtw_get_ie(ies,  WLAN_EID_SSID, &ssid_len_ori, ies_len);
+	ssid_ie = rtw_get_ie(ies, WLAN_EID_SSID, &ssid_len_ori, ies_len);
 
 	if (ssid_ie && ssid_len_ori > 0) {
 		switch (hidden_ssid_mode) {
-		case 1:
-		{
+		case 1: {
 			u8 *next_ie = ssid_ie + 2 + ssid_len_ori;
 			u32 remain_len = 0;
 
-			remain_len = ies_len - (next_ie-ies);
+			remain_len = ies_len - (next_ie - ies);
 
 			ssid_ie[1] = 0;
-			memcpy(ssid_ie+2, next_ie, remain_len);
+			memcpy(ssid_ie + 2, next_ie, remain_len);
 			len_diff -= ssid_len_ori;
 
 			break;
@@ -2036,7 +2178,7 @@ static int update_hidden_ssid(u8 *ies, u32 ies_len, u8 hidden_ssid_mode)
 			break;
 		default:
 			break;
-	}
+		}
 	}
 
 	return len_diff;
@@ -2044,17 +2186,17 @@ static int update_hidden_ssid(u8 *ies, u32 ies_len, u8 hidden_ssid_mode)
 
 void issue_beacon(struct adapter *padapter, int timeout_ms)
 {
-	struct xmit_frame	*pmgntframe;
-	struct pkt_attrib	*pattrib;
+	struct xmit_frame *pmgntframe;
+	struct pkt_attrib *pattrib;
 	unsigned char *pframe;
 	struct ieee80211_hdr *pwlanhdr;
 	__le16 *fctrl;
-	unsigned int	rate_len;
+	unsigned int rate_len;
 	struct xmit_priv *pxmitpriv = &(padapter->xmitpriv);
 	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
-	struct wlan_bssid_ex		*cur_network = &(pmlmeinfo->network);
+	struct wlan_bssid_ex *cur_network = &(pmlmeinfo->network);
 
 	pmgntframe = alloc_mgtxmitframe(pxmitpriv);
 	if (!pmgntframe)
@@ -2079,23 +2221,25 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 	memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
 	memcpy(pwlanhdr->addr3, get_my_bssid(cur_network), ETH_ALEN);
 
-	SetSeqNum(pwlanhdr, 0/*pmlmeext->mgnt_seq*/);
+	SetSeqNum(pwlanhdr, 0 /*pmlmeext->mgnt_seq*/);
 	/* pmlmeext->mgnt_seq++; */
 	SetFrameSubType(pframe, WIFI_BEACON);
 
 	pframe += sizeof(struct ieee80211_hdr_3addr);
 	pattrib->pktlen = sizeof(struct ieee80211_hdr_3addr);
 
-	if ((pmlmeinfo->state&0x03) == WIFI_FW_AP_STATE) {
+	if ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE) {
 		{
 			int len_diff;
 
-			memcpy(pframe, cur_network->ies, cur_network->ie_length);
-			len_diff = update_hidden_ssid(pframe+_BEACON_IE_OFFSET_,
-						      cur_network->ie_length-_BEACON_IE_OFFSET_,
-						      pmlmeinfo->hidden_ssid_mode);
-			pframe += (cur_network->ie_length+len_diff);
-			pattrib->pktlen += (cur_network->ie_length+len_diff);
+			memcpy(pframe, cur_network->ies,
+			       cur_network->ie_length);
+			len_diff = update_hidden_ssid(
+				pframe + _BEACON_IE_OFFSET_,
+				cur_network->ie_length - _BEACON_IE_OFFSET_,
+				pmlmeinfo->hidden_ssid_mode);
+			pframe += (cur_network->ie_length + len_diff);
+			pattrib->pktlen += (cur_network->ie_length + len_diff);
 		}
 
 		{
@@ -2103,10 +2247,19 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 			uint wps_ielen;
 			u8 sr = 0;
 
-			wps_ie = rtw_get_wps_ie(pmgntframe->buf_addr+TXDESC_OFFSET+sizeof(struct ieee80211_hdr_3addr)+_BEACON_IE_OFFSET_,
-				pattrib->pktlen-sizeof(struct ieee80211_hdr_3addr)-_BEACON_IE_OFFSET_, NULL, &wps_ielen);
+			wps_ie = rtw_get_wps_ie(
+				pmgntframe->buf_addr + TXDESC_OFFSET +
+					sizeof(struct ieee80211_hdr_3addr) +
+					_BEACON_IE_OFFSET_,
+				pattrib->pktlen -
+					sizeof(struct ieee80211_hdr_3addr) -
+					_BEACON_IE_OFFSET_,
+				NULL, &wps_ielen);
 			if (wps_ie && wps_ielen > 0)
-				rtw_get_wps_attr_content(wps_ie,  wps_ielen, WPS_ATTR_SELECTED_REGISTRAR, (u8 *)(&sr), NULL);
+				rtw_get_wps_attr_content(
+					wps_ie, wps_ielen,
+					WPS_ATTR_SELECTED_REGISTRAR,
+					(u8 *)(&sr), NULL);
 			if (sr != 0)
 				set_fwstate(pmlmepriv, WIFI_UNDER_WPS);
 			else
@@ -2124,27 +2277,39 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 
 	/*  beacon interval: 2 bytes */
 
-	memcpy(pframe, (unsigned char *)(rtw_get_beacon_interval_from_ie(cur_network->ies)), 2);
+	memcpy(pframe,
+	       (unsigned char *)(rtw_get_beacon_interval_from_ie(
+		       cur_network->ies)),
+	       2);
 
 	pframe += 2;
 	pattrib->pktlen += 2;
 
 	/*  capability info: 2 bytes */
 
-	memcpy(pframe, (unsigned char *)(rtw_get_capability_from_ie(cur_network->ies)), 2);
+	memcpy(pframe,
+	       (unsigned char *)(rtw_get_capability_from_ie(cur_network->ies)),
+	       2);
 
 	pframe += 2;
 	pattrib->pktlen += 2;
 
 	/*  SSID */
-	pframe = rtw_set_ie(pframe, WLAN_EID_SSID, cur_network->ssid.ssid_length, cur_network->ssid.ssid, &pattrib->pktlen);
+	pframe = rtw_set_ie(pframe, WLAN_EID_SSID,
+			    cur_network->ssid.ssid_length,
+			    cur_network->ssid.ssid, &pattrib->pktlen);
 
 	/*  supported rates... */
 	rate_len = rtw_get_rateset_len(cur_network->supported_rates);
-	pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, ((rate_len > 8) ? 8 : rate_len), cur_network->supported_rates, &pattrib->pktlen);
+	pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES,
+			    ((rate_len > 8) ? 8 : rate_len),
+			    cur_network->supported_rates, &pattrib->pktlen);
 
 	/*  DS parameter set */
-	pframe = rtw_set_ie(pframe, WLAN_EID_DS_PARAMS, 1, (unsigned char *)&(cur_network->configuration.ds_config), &pattrib->pktlen);
+	pframe = rtw_set_ie(
+		pframe, WLAN_EID_DS_PARAMS, 1,
+		(unsigned char *)&(cur_network->configuration.ds_config),
+		&pattrib->pktlen);
 
 	/* if ((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE) */
 	{
@@ -2153,15 +2318,21 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 		/*  IBSS Parameter Set... */
 		/* ATIMWindow = cur->configuration.ATIMWindow; */
 		ATIMWindow = 0;
-		pframe = rtw_set_ie(pframe, WLAN_EID_IBSS_PARAMS, 2, (unsigned char *)(&ATIMWindow), &pattrib->pktlen);
+		pframe = rtw_set_ie(pframe, WLAN_EID_IBSS_PARAMS, 2,
+				    (unsigned char *)(&ATIMWindow),
+				    &pattrib->pktlen);
 
 		/* ERP IE */
-		pframe = rtw_set_ie(pframe, WLAN_EID_ERP_INFO, 1, &erpinfo, &pattrib->pktlen);
+		pframe = rtw_set_ie(pframe, WLAN_EID_ERP_INFO, 1, &erpinfo,
+				    &pattrib->pktlen);
 	}
 
 	/*  EXTERNDED SUPPORTED RATE */
 	if (rate_len > 8)
-		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (rate_len - 8), (cur_network->supported_rates + 8), &pattrib->pktlen);
+		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES,
+				    (rate_len - 8),
+				    (cur_network->supported_rates + 8),
+				    &pattrib->pktlen);
 
 	/* todo:HT for adhoc */
 
@@ -2182,12 +2353,13 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 		dump_mgntframe(padapter, pmgntframe);
 }
 
-void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p_probereq)
+void issue_probersp(struct adapter *padapter, unsigned char *da,
+		    u8 is_valid_p2p_probereq)
 {
-	struct xmit_frame			*pmgntframe;
-	struct pkt_attrib			*pattrib;
+	struct xmit_frame *pmgntframe;
+	struct pkt_attrib *pattrib;
 	unsigned char *pframe;
-	struct ieee80211_hdr	*pwlanhdr;
+	struct ieee80211_hdr *pwlanhdr;
 	__le16 *fctrl;
 	unsigned char *mac, *bssid;
 	struct xmit_priv *pxmitpriv = &(padapter->xmitpriv);
@@ -2197,8 +2369,8 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
-	struct wlan_bssid_ex		*cur_network = &(pmlmeinfo->network);
-	unsigned int	rate_len;
+	struct wlan_bssid_ex *cur_network = &(pmlmeinfo->network);
+	unsigned int rate_len;
 
 	if (!da)
 		return;
@@ -2236,8 +2408,11 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 	if (cur_network->ie_length > MAX_IE_SZ)
 		return;
 
-	if ((pmlmeinfo->state&0x03) == WIFI_FW_AP_STATE) {
-		pwps_ie = rtw_get_wps_ie(cur_network->ies+_FIXED_IE_LENGTH_, cur_network->ie_length-_FIXED_IE_LENGTH_, NULL, &wps_ielen);
+	if ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE) {
+		pwps_ie = rtw_get_wps_ie(cur_network->ies + _FIXED_IE_LENGTH_,
+					 cur_network->ie_length -
+						 _FIXED_IE_LENGTH_,
+					 NULL, &wps_ielen);
 
 		/* inerset & update wps_probe_resp_ie */
 		if (pmlmepriv->wps_probe_resp_ie && pwps_ie && wps_ielen > 0) {
@@ -2248,26 +2423,31 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 
 			premainder_ie = pwps_ie + wps_ielen;
 
-			remainder_ielen = cur_network->ie_length - wps_offset - wps_ielen;
+			remainder_ielen =
+				cur_network->ie_length - wps_offset - wps_ielen;
 
 			memcpy(pframe, cur_network->ies, wps_offset);
 			pframe += wps_offset;
 			pattrib->pktlen += wps_offset;
 
-			wps_ielen = (uint)pmlmepriv->wps_probe_resp_ie[1];/* to get ie data len */
-			if ((wps_offset+wps_ielen+2) <= MAX_IE_SZ) {
-				memcpy(pframe, pmlmepriv->wps_probe_resp_ie, wps_ielen+2);
-				pframe += wps_ielen+2;
-				pattrib->pktlen += wps_ielen+2;
+			wps_ielen = (uint)pmlmepriv->wps_probe_resp_ie
+					    [1]; /* to get ie data len */
+			if ((wps_offset + wps_ielen + 2) <= MAX_IE_SZ) {
+				memcpy(pframe, pmlmepriv->wps_probe_resp_ie,
+				       wps_ielen + 2);
+				pframe += wps_ielen + 2;
+				pattrib->pktlen += wps_ielen + 2;
 			}
 
-			if ((wps_offset+wps_ielen+2+remainder_ielen) <= MAX_IE_SZ) {
+			if ((wps_offset + wps_ielen + 2 + remainder_ielen) <=
+			    MAX_IE_SZ) {
 				memcpy(pframe, premainder_ie, remainder_ielen);
 				pframe += remainder_ielen;
 				pattrib->pktlen += remainder_ielen;
 			}
 		} else {
-			memcpy(pframe, cur_network->ies, cur_network->ie_length);
+			memcpy(pframe, cur_network->ies,
+			       cur_network->ie_length);
 			pframe += cur_network->ie_length;
 			pattrib->pktlen += cur_network->ie_length;
 		}
@@ -2278,35 +2458,43 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 			signed int ssid_ielen;
 			signed int ssid_ielen_diff;
 			u8 *buf;
-			u8 *ies = pmgntframe->buf_addr+TXDESC_OFFSET+sizeof(struct ieee80211_hdr_3addr);
+			u8 *ies = pmgntframe->buf_addr + TXDESC_OFFSET +
+				  sizeof(struct ieee80211_hdr_3addr);
 
 			buf = kzalloc(MAX_IE_SZ, GFP_ATOMIC);
 			if (!buf)
 				return;
 
-			ssid_ie = rtw_get_ie(ies+_FIXED_IE_LENGTH_, WLAN_EID_SSID, &ssid_ielen,
-				(pframe-ies)-_FIXED_IE_LENGTH_);
+			ssid_ie =
+				rtw_get_ie(ies + _FIXED_IE_LENGTH_,
+					   WLAN_EID_SSID, &ssid_ielen,
+					   (pframe - ies) - _FIXED_IE_LENGTH_);
 
-			ssid_ielen_diff = cur_network->ssid.ssid_length - ssid_ielen;
+			ssid_ielen_diff =
+				cur_network->ssid.ssid_length - ssid_ielen;
 
-			if (ssid_ie &&  cur_network->ssid.ssid_length) {
+			if (ssid_ie && cur_network->ssid.ssid_length) {
 				uint remainder_ielen;
 				u8 *remainder_ie;
 
-				remainder_ie = ssid_ie+2;
-				remainder_ielen = (pframe-remainder_ie);
+				remainder_ie = ssid_ie + 2;
+				remainder_ielen = (pframe - remainder_ie);
 
 				if (remainder_ielen > MAX_IE_SZ) {
-					netdev_warn(padapter->pnetdev,
-						    FUNC_ADPT_FMT " remainder_ielen > MAX_IE_SZ\n",
-						    FUNC_ADPT_ARG(padapter));
+					netdev_warn(
+						padapter->pnetdev,
+						FUNC_ADPT_FMT
+						" remainder_ielen > MAX_IE_SZ\n",
+						FUNC_ADPT_ARG(padapter));
 					remainder_ielen = MAX_IE_SZ;
 				}
 
 				memcpy(buf, remainder_ie, remainder_ielen);
-				memcpy(remainder_ie+ssid_ielen_diff, buf, remainder_ielen);
-				*(ssid_ie+1) = cur_network->ssid.ssid_length;
-				memcpy(ssid_ie+2, cur_network->ssid.ssid, cur_network->ssid.ssid_length);
+				memcpy(remainder_ie + ssid_ielen_diff, buf,
+				       remainder_ielen);
+				*(ssid_ie + 1) = cur_network->ssid.ssid_length;
+				memcpy(ssid_ie + 2, cur_network->ssid.ssid,
+				       cur_network->ssid.ssid_length);
 
 				pframe += ssid_ielen_diff;
 				pattrib->pktlen += ssid_ielen_diff;
@@ -2320,14 +2508,20 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 
 		/*  beacon interval: 2 bytes */
 
-		memcpy(pframe, (unsigned char *)(rtw_get_beacon_interval_from_ie(cur_network->ies)), 2);
+		memcpy(pframe,
+		       (unsigned char *)(rtw_get_beacon_interval_from_ie(
+			       cur_network->ies)),
+		       2);
 
 		pframe += 2;
 		pattrib->pktlen += 2;
 
 		/*  capability info: 2 bytes */
 
-		memcpy(pframe, (unsigned char *)(rtw_get_capability_from_ie(cur_network->ies)), 2);
+		memcpy(pframe,
+		       (unsigned char *)(rtw_get_capability_from_ie(
+			       cur_network->ies)),
+		       2);
 
 		pframe += 2;
 		pattrib->pktlen += 2;
@@ -2335,30 +2529,45 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 		/* below for ad-hoc mode */
 
 		/*  SSID */
-		pframe = rtw_set_ie(pframe, WLAN_EID_SSID, cur_network->ssid.ssid_length, cur_network->ssid.ssid, &pattrib->pktlen);
+		pframe = rtw_set_ie(pframe, WLAN_EID_SSID,
+				    cur_network->ssid.ssid_length,
+				    cur_network->ssid.ssid, &pattrib->pktlen);
 
 		/*  supported rates... */
 		rate_len = rtw_get_rateset_len(cur_network->supported_rates);
-		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, ((rate_len > 8) ? 8 : rate_len), cur_network->supported_rates, &pattrib->pktlen);
+		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES,
+				    ((rate_len > 8) ? 8 : rate_len),
+				    cur_network->supported_rates,
+				    &pattrib->pktlen);
 
 		/*  DS parameter set */
-		pframe = rtw_set_ie(pframe, WLAN_EID_DS_PARAMS, 1, (unsigned char *)&(cur_network->configuration.ds_config), &pattrib->pktlen);
+		pframe = rtw_set_ie(
+			pframe, WLAN_EID_DS_PARAMS, 1,
+			(unsigned char *)&(
+				cur_network->configuration.ds_config),
+			&pattrib->pktlen);
 
-		if ((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE) {
+		if ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE) {
 			u8 erpinfo = 0;
 			u32 ATIMWindow;
 			/*  IBSS Parameter Set... */
 			/* ATIMWindow = cur->configuration.ATIMWindow; */
 			ATIMWindow = 0;
-			pframe = rtw_set_ie(pframe, WLAN_EID_IBSS_PARAMS, 2, (unsigned char *)(&ATIMWindow), &pattrib->pktlen);
+			pframe = rtw_set_ie(pframe, WLAN_EID_IBSS_PARAMS, 2,
+					    (unsigned char *)(&ATIMWindow),
+					    &pattrib->pktlen);
 
 			/* ERP IE */
-			pframe = rtw_set_ie(pframe, WLAN_EID_ERP_INFO, 1, &erpinfo, &pattrib->pktlen);
+			pframe = rtw_set_ie(pframe, WLAN_EID_ERP_INFO, 1,
+					    &erpinfo, &pattrib->pktlen);
 		}
 
 		/*  EXTERNDED SUPPORTED RATE */
 		if (rate_len > 8)
-			pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (rate_len - 8), (cur_network->supported_rates + 8), &pattrib->pktlen);
+			pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES,
+					    (rate_len - 8),
+					    (cur_network->supported_rates + 8),
+					    &pattrib->pktlen);
 
 		/* todo:HT for adhoc */
 	}
@@ -2369,21 +2578,21 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 }
 
 static int _issue_probereq(struct adapter *padapter,
-			   struct ndis_802_11_ssid *pssid,
-			   u8 *da, u8 ch, bool append_wps, bool wait_ack)
+			   struct ndis_802_11_ssid *pssid, u8 *da, u8 ch,
+			   bool append_wps, bool wait_ack)
 {
 	int ret = _FAIL;
-	struct xmit_frame		*pmgntframe;
-	struct pkt_attrib		*pattrib;
+	struct xmit_frame *pmgntframe;
+	struct pkt_attrib *pattrib;
 	unsigned char *pframe;
-	struct ieee80211_hdr	*pwlanhdr;
+	struct ieee80211_hdr *pwlanhdr;
 	__le16 *fctrl;
 	unsigned char *mac;
 	unsigned char bssrate[NumRates];
 	struct xmit_priv *pxmitpriv = &(padapter->xmitpriv);
 	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
-	int	bssrate_len = 0;
+	int bssrate_len = 0;
 
 	pmgntframe = alloc_mgtxmitframe(pxmitpriv);
 	if (!pmgntframe)
@@ -2423,26 +2632,35 @@ static int _issue_probereq(struct adapter *padapter,
 	pattrib->pktlen = sizeof(struct ieee80211_hdr_3addr);
 
 	if (pssid)
-		pframe = rtw_set_ie(pframe, WLAN_EID_SSID, pssid->ssid_length, pssid->ssid, &(pattrib->pktlen));
+		pframe = rtw_set_ie(pframe, WLAN_EID_SSID, pssid->ssid_length,
+				    pssid->ssid, &(pattrib->pktlen));
 	else
-		pframe = rtw_set_ie(pframe, WLAN_EID_SSID, 0, NULL, &(pattrib->pktlen));
+		pframe = rtw_set_ie(pframe, WLAN_EID_SSID, 0, NULL,
+				    &(pattrib->pktlen));
 
 	get_rate_set(padapter, bssrate, &bssrate_len);
 
 	if (bssrate_len > 8) {
-		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, 8, bssrate, &(pattrib->pktlen));
-		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (bssrate_len - 8), (bssrate + 8), &(pattrib->pktlen));
+		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, 8, bssrate,
+				    &(pattrib->pktlen));
+		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES,
+				    (bssrate_len - 8), (bssrate + 8),
+				    &(pattrib->pktlen));
 	} else {
-		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, bssrate_len, bssrate, &(pattrib->pktlen));
+		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, bssrate_len,
+				    bssrate, &(pattrib->pktlen));
 	}
 
 	if (ch)
-		pframe = rtw_set_ie(pframe, WLAN_EID_DS_PARAMS, 1, &ch, &pattrib->pktlen);
+		pframe = rtw_set_ie(pframe, WLAN_EID_DS_PARAMS, 1, &ch,
+				    &pattrib->pktlen);
 
 	if (append_wps) {
 		/* add wps_ie for wps2.0 */
-		if (pmlmepriv->wps_probe_req_ie_len > 0 && pmlmepriv->wps_probe_req_ie) {
-			memcpy(pframe, pmlmepriv->wps_probe_req_ie, pmlmepriv->wps_probe_req_ie_len);
+		if (pmlmepriv->wps_probe_req_ie_len > 0 &&
+		    pmlmepriv->wps_probe_req_ie) {
+			memcpy(pframe, pmlmepriv->wps_probe_req_ie,
+			       pmlmepriv->wps_probe_req_ie_len);
 			pframe += pmlmepriv->wps_probe_req_ie_len;
 			pattrib->pktlen += pmlmepriv->wps_probe_req_ie_len;
 		}
@@ -2461,13 +2679,14 @@ static int _issue_probereq(struct adapter *padapter,
 	return ret;
 }
 
-inline void issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da)
+inline void issue_probereq(struct adapter *padapter,
+			   struct ndis_802_11_ssid *pssid, u8 *da)
 {
 	_issue_probereq(padapter, pssid, da, 0, 1, false);
 }
 
-int issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da, u8 ch, bool append_wps,
-	int try_cnt, int wait_ms)
+int issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid,
+		      u8 *da, u8 ch, bool append_wps, int try_cnt, int wait_ms)
 {
 	int ret;
 	int i = 0;
@@ -2488,9 +2707,9 @@ int issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid,
 
 	if (ret != _FAIL) {
 		ret = _SUCCESS;
-		#ifndef DBG_XMIT_ACK
+#ifndef DBG_XMIT_ACK
 		goto exit;
-		#endif
+#endif
 	}
 
 exit:
@@ -2498,15 +2717,16 @@ int issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid,
 }
 
 /*  if psta == NULL, indicate we are station(client) now... */
-void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short status)
+void issue_auth(struct adapter *padapter, struct sta_info *psta,
+		unsigned short status)
 {
-	struct xmit_frame			*pmgntframe;
-	struct pkt_attrib			*pattrib;
+	struct xmit_frame *pmgntframe;
+	struct pkt_attrib *pattrib;
 	unsigned char *pframe;
-	struct ieee80211_hdr	*pwlanhdr;
+	struct ieee80211_hdr *pwlanhdr;
 	__le16 *fctrl;
-	unsigned int					val32;
-	unsigned short				val16;
+	unsigned int val32;
+	unsigned short val16;
 	int use_shared_key = 0;
 	struct xmit_priv *pxmitpriv = &(padapter->xmitpriv);
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
@@ -2538,8 +2758,10 @@ void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short
 
 	if (psta) { /*  for AP mode */
 		memcpy(pwlanhdr->addr1, psta->hwaddr, ETH_ALEN);
-		memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
-		memcpy(pwlanhdr->addr3, myid(&(padapter->eeprompriv)), ETH_ALEN);
+		memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)),
+		       ETH_ALEN);
+		memcpy(pwlanhdr->addr3, myid(&(padapter->eeprompriv)),
+		       ETH_ALEN);
 
 		/*  setting auth algo number */
 		val16 = (u16)psta->authalg;
@@ -2552,57 +2774,84 @@ void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short
 
 		le_tmp = cpu_to_le16(val16);
 
-		pframe = rtw_set_fixed_ie(pframe, _AUTH_ALGM_NUM_, (unsigned char *)&le_tmp, &(pattrib->pktlen));
+		pframe = rtw_set_fixed_ie(pframe, _AUTH_ALGM_NUM_,
+					  (unsigned char *)&le_tmp,
+					  &(pattrib->pktlen));
 
 		/*  setting auth seq number */
 		val16 = (u16)psta->auth_seq;
 		le_tmp = cpu_to_le16(val16);
-		pframe = rtw_set_fixed_ie(pframe, _AUTH_SEQ_NUM_, (unsigned char *)&le_tmp, &(pattrib->pktlen));
+		pframe = rtw_set_fixed_ie(pframe, _AUTH_SEQ_NUM_,
+					  (unsigned char *)&le_tmp,
+					  &(pattrib->pktlen));
 
 		/*  setting status code... */
 		val16 = status;
 		le_tmp = cpu_to_le16(val16);
-		pframe = rtw_set_fixed_ie(pframe, _STATUS_CODE_, (unsigned char *)&le_tmp, &(pattrib->pktlen));
+		pframe = rtw_set_fixed_ie(pframe, _STATUS_CODE_,
+					  (unsigned char *)&le_tmp,
+					  &(pattrib->pktlen));
 
 		/*  added challenging text... */
-		if ((psta->auth_seq == 2) && (psta->state & WIFI_FW_AUTH_STATE) && (use_shared_key == 1))
-			pframe = rtw_set_ie(pframe, WLAN_EID_CHALLENGE, 128, psta->chg_txt, &(pattrib->pktlen));
+		if ((psta->auth_seq == 2) &&
+		    (psta->state & WIFI_FW_AUTH_STATE) && (use_shared_key == 1))
+			pframe = rtw_set_ie(pframe, WLAN_EID_CHALLENGE, 128,
+					    psta->chg_txt, &(pattrib->pktlen));
 
 	} else {
-		memcpy(pwlanhdr->addr1, get_my_bssid(&pmlmeinfo->network), ETH_ALEN);
+		memcpy(pwlanhdr->addr1, get_my_bssid(&pmlmeinfo->network),
+		       ETH_ALEN);
 		memcpy(pwlanhdr->addr2, myid(&padapter->eeprompriv), ETH_ALEN);
-		memcpy(pwlanhdr->addr3, get_my_bssid(&pmlmeinfo->network), ETH_ALEN);
+		memcpy(pwlanhdr->addr3, get_my_bssid(&pmlmeinfo->network),
+		       ETH_ALEN);
 
 		/*  setting auth algo number */
-		val16 = (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared) ? 1 : 0;/*  0:OPEN System, 1:Shared key */
+		val16 = (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared) ?
+				1 :
+				0; /*  0:OPEN System, 1:Shared key */
 		if (val16)
 			use_shared_key = 1;
 		le_tmp = cpu_to_le16(val16);
 
 		/* setting IV for auth seq #3 */
-		if ((pmlmeinfo->auth_seq == 3) && (pmlmeinfo->state & WIFI_FW_AUTH_STATE) && (use_shared_key == 1)) {
+		if ((pmlmeinfo->auth_seq == 3) &&
+		    (pmlmeinfo->state & WIFI_FW_AUTH_STATE) &&
+		    (use_shared_key == 1)) {
 			__le32 le_tmp32;
 
-			val32 = ((pmlmeinfo->iv++) | (pmlmeinfo->key_index << 30));
+			val32 = ((pmlmeinfo->iv++) |
+				 (pmlmeinfo->key_index << 30));
 			le_tmp32 = cpu_to_le32(val32);
-			pframe = rtw_set_fixed_ie(pframe, 4, (unsigned char *)&le_tmp32, &(pattrib->pktlen));
+			pframe = rtw_set_fixed_ie(pframe, 4,
+						  (unsigned char *)&le_tmp32,
+						  &(pattrib->pktlen));
 
 			pattrib->iv_len = 4;
 		}
 
-		pframe = rtw_set_fixed_ie(pframe, _AUTH_ALGM_NUM_, (unsigned char *)&le_tmp, &(pattrib->pktlen));
+		pframe = rtw_set_fixed_ie(pframe, _AUTH_ALGM_NUM_,
+					  (unsigned char *)&le_tmp,
+					  &(pattrib->pktlen));
 
 		/*  setting auth seq number */
 		le_tmp = cpu_to_le16(pmlmeinfo->auth_seq);
-		pframe = rtw_set_fixed_ie(pframe, _AUTH_SEQ_NUM_, (unsigned char *)&le_tmp, &(pattrib->pktlen));
+		pframe = rtw_set_fixed_ie(pframe, _AUTH_SEQ_NUM_,
+					  (unsigned char *)&le_tmp,
+					  &(pattrib->pktlen));
 
 		/*  setting status code... */
 		le_tmp = cpu_to_le16(status);
-		pframe = rtw_set_fixed_ie(pframe, _STATUS_CODE_, (unsigned char *)&le_tmp, &(pattrib->pktlen));
+		pframe = rtw_set_fixed_ie(pframe, _STATUS_CODE_,
+					  (unsigned char *)&le_tmp,
+					  &(pattrib->pktlen));
 
 		/*  then checking to see if sending challenging text... */
-		if ((pmlmeinfo->auth_seq == 3) && (pmlmeinfo->state & WIFI_FW_AUTH_STATE) && (use_shared_key == 1)) {
-			pframe = rtw_set_ie(pframe, WLAN_EID_CHALLENGE, 128, pmlmeinfo->chg_txt, &(pattrib->pktlen));
+		if ((pmlmeinfo->auth_seq == 3) &&
+		    (pmlmeinfo->state & WIFI_FW_AUTH_STATE) &&
+		    (use_shared_key == 1)) {
+			pframe = rtw_set_ie(pframe, WLAN_EID_CHALLENGE, 128,
+					    pmlmeinfo->chg_txt,
+					    &(pattrib->pktlen));
 
 			SetPrivacy(fctrl);
 
@@ -2622,10 +2871,11 @@ void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short
 	dump_mgntframe(padapter, pmgntframe);
 }
 
-void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_info *pstat, int pkt_type)
+void issue_asocrsp(struct adapter *padapter, unsigned short status,
+		   struct sta_info *pstat, int pkt_type)
 {
-	struct xmit_frame	*pmgntframe;
-	struct ieee80211_hdr	*pwlanhdr;
+	struct xmit_frame *pmgntframe;
+	struct ieee80211_hdr *pwlanhdr;
 	struct pkt_attrib *pattrib;
 	unsigned char *pbuf, *pframe;
 	unsigned short val;
@@ -2656,7 +2906,8 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 
 	memcpy(GetAddr1Ptr(pwlanhdr), pstat->hwaddr, ETH_ALEN);
 	memcpy(GetAddr2Ptr(pwlanhdr), myid(&(padapter->eeprompriv)), ETH_ALEN);
-	memcpy(GetAddr3Ptr(pwlanhdr), get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
+	memcpy(GetAddr3Ptr(pwlanhdr), get_my_bssid(&(pmlmeinfo->network)),
+	       ETH_ALEN);
 
 	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
 	pmlmeext->mgnt_seq++;
@@ -2672,19 +2923,28 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 	/* capability */
 	val = *(unsigned short *)rtw_get_capability_from_ie(ie);
 
-	pframe = rtw_set_fixed_ie(pframe, _CAPABILITY_, (unsigned char *)&val, &(pattrib->pktlen));
+	pframe = rtw_set_fixed_ie(pframe, _CAPABILITY_, (unsigned char *)&val,
+				  &(pattrib->pktlen));
 
 	lestatus = cpu_to_le16(status);
-	pframe = rtw_set_fixed_ie(pframe, _STATUS_CODE_, (unsigned char *)&lestatus, &(pattrib->pktlen));
+	pframe = rtw_set_fixed_ie(pframe, _STATUS_CODE_,
+				  (unsigned char *)&lestatus,
+				  &(pattrib->pktlen));
 
 	le_tmp = cpu_to_le16(pstat->aid | BIT(14) | BIT(15));
-	pframe = rtw_set_fixed_ie(pframe, _ASOC_ID_, (unsigned char *)&le_tmp, &(pattrib->pktlen));
+	pframe = rtw_set_fixed_ie(pframe, _ASOC_ID_, (unsigned char *)&le_tmp,
+				  &(pattrib->pktlen));
 
 	if (pstat->bssratelen <= 8) {
-		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, pstat->bssratelen, pstat->bssrateset, &(pattrib->pktlen));
+		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES,
+				    pstat->bssratelen, pstat->bssrateset,
+				    &(pattrib->pktlen));
 	} else {
-		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, 8, pstat->bssrateset, &(pattrib->pktlen));
-		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (pstat->bssratelen-8), pstat->bssrateset+8, &(pattrib->pktlen));
+		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, 8,
+				    pstat->bssrateset, &(pattrib->pktlen));
+		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES,
+				    (pstat->bssratelen - 8),
+				    pstat->bssrateset + 8, &(pattrib->pktlen));
 	}
 
 	if ((pstat->flags & WLAN_STA_HT) && (pmlmepriv->htpriv.ht_option)) {
@@ -2692,34 +2952,42 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 
 		/* FILL HT CAP INFO IE */
 		/* p = hostapd_eid_ht_capabilities_info(hapd, p); */
-		pbuf = rtw_get_ie(ie + _BEACON_IE_OFFSET_, WLAN_EID_HT_CAPABILITY, &ie_len, (pnetwork->ie_length - _BEACON_IE_OFFSET_));
+		pbuf = rtw_get_ie(ie + _BEACON_IE_OFFSET_,
+				  WLAN_EID_HT_CAPABILITY, &ie_len,
+				  (pnetwork->ie_length - _BEACON_IE_OFFSET_));
 		if (pbuf && ie_len > 0) {
-			memcpy(pframe, pbuf, ie_len+2);
-			pframe += (ie_len+2);
-			pattrib->pktlen += (ie_len+2);
+			memcpy(pframe, pbuf, ie_len + 2);
+			pframe += (ie_len + 2);
+			pattrib->pktlen += (ie_len + 2);
 		}
 
 		/* FILL HT ADD INFO IE */
 		/* p = hostapd_eid_ht_operation(hapd, p); */
-		pbuf = rtw_get_ie(ie + _BEACON_IE_OFFSET_, WLAN_EID_HT_OPERATION, &ie_len, (pnetwork->ie_length - _BEACON_IE_OFFSET_));
+		pbuf = rtw_get_ie(ie + _BEACON_IE_OFFSET_,
+				  WLAN_EID_HT_OPERATION, &ie_len,
+				  (pnetwork->ie_length - _BEACON_IE_OFFSET_));
 		if (pbuf && ie_len > 0) {
-			memcpy(pframe, pbuf, ie_len+2);
-			pframe += (ie_len+2);
-			pattrib->pktlen += (ie_len+2);
+			memcpy(pframe, pbuf, ie_len + 2);
+			pframe += (ie_len + 2);
+			pattrib->pktlen += (ie_len + 2);
 		}
 	}
 
 	/* FILL WMM IE */
 	if ((pstat->flags & WLAN_STA_WME) && (pmlmepriv->qospriv.qos_option)) {
 		uint ie_len = 0;
-		unsigned char WMM_PARA_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x01, 0x01};
-
-		for (pbuf = ie + _BEACON_IE_OFFSET_; ; pbuf += (ie_len + 2)) {
-			pbuf = rtw_get_ie(pbuf, WLAN_EID_VENDOR_SPECIFIC, &ie_len, (pnetwork->ie_length - _BEACON_IE_OFFSET_ - (ie_len + 2)));
-			if (pbuf && !memcmp(pbuf+2, WMM_PARA_IE, 6)) {
-				memcpy(pframe, pbuf, ie_len+2);
-				pframe += (ie_len+2);
-				pattrib->pktlen += (ie_len+2);
+		unsigned char WMM_PARA_IE[] = { 0x00, 0x50, 0xf2,
+						0x02, 0x01, 0x01 };
+
+		for (pbuf = ie + _BEACON_IE_OFFSET_;; pbuf += (ie_len + 2)) {
+			pbuf = rtw_get_ie(pbuf, WLAN_EID_VENDOR_SPECIFIC,
+					  &ie_len,
+					  (pnetwork->ie_length -
+					   _BEACON_IE_OFFSET_ - (ie_len + 2)));
+			if (pbuf && !memcmp(pbuf + 2, WMM_PARA_IE, 6)) {
+				memcpy(pframe, pbuf, ie_len + 2);
+				pframe += (ie_len + 2);
+				pattrib->pktlen += (ie_len + 2);
 
 				break;
 			}
@@ -2730,11 +2998,14 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 	}
 
 	if (pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_REALTEK)
-		pframe = rtw_set_ie(pframe, WLAN_EID_VENDOR_SPECIFIC, 6, REALTEK_96B_IE, &(pattrib->pktlen));
+		pframe = rtw_set_ie(pframe, WLAN_EID_VENDOR_SPECIFIC, 6,
+				    REALTEK_96B_IE, &(pattrib->pktlen));
 
 	/* add WPS IE ie for wps 2.0 */
-	if (pmlmepriv->wps_assoc_resp_ie && pmlmepriv->wps_assoc_resp_ie_len > 0) {
-		memcpy(pframe, pmlmepriv->wps_assoc_resp_ie, pmlmepriv->wps_assoc_resp_ie_len);
+	if (pmlmepriv->wps_assoc_resp_ie &&
+	    pmlmepriv->wps_assoc_resp_ie_len > 0) {
+		memcpy(pframe, pmlmepriv->wps_assoc_resp_ie,
+		       pmlmepriv->wps_assoc_resp_ie_len);
 
 		pframe += pmlmepriv->wps_assoc_resp_ie_len;
 		pattrib->pktlen += pmlmepriv->wps_assoc_resp_ie_len;
@@ -2748,20 +3019,20 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 void issue_assocreq(struct adapter *padapter)
 {
 	int ret = _FAIL;
-	struct xmit_frame				*pmgntframe;
-	struct pkt_attrib				*pattrib;
+	struct xmit_frame *pmgntframe;
+	struct pkt_attrib *pattrib;
 	unsigned char *pframe;
-	struct ieee80211_hdr			*pwlanhdr;
+	struct ieee80211_hdr *pwlanhdr;
 	__le16 *fctrl;
 	__le16 val16;
-	unsigned int					i, j, index = 0;
+	unsigned int i, j, index = 0;
 	unsigned char bssrate[NumRates], sta_bssrate[NumRates];
 	struct ndis_80211_var_ie *pIE;
 	struct xmit_priv *pxmitpriv = &(padapter->xmitpriv);
 	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
-	int	bssrate_len = 0, sta_bssrate_len = 0;
+	int bssrate_len = 0, sta_bssrate_len = 0;
 	u8 vs_ie_length = 0;
 
 	pmgntframe = alloc_mgtxmitframe(pxmitpriv);
@@ -2804,14 +3075,17 @@ void issue_assocreq(struct adapter *padapter)
 	pattrib->pktlen += 2;
 
 	/* SSID */
-	pframe = rtw_set_ie(pframe, WLAN_EID_SSID,  pmlmeinfo->network.ssid.ssid_length, pmlmeinfo->network.ssid.ssid, &(pattrib->pktlen));
+	pframe = rtw_set_ie(pframe, WLAN_EID_SSID,
+			    pmlmeinfo->network.ssid.ssid_length,
+			    pmlmeinfo->network.ssid.ssid, &(pattrib->pktlen));
 
 	/* supported rate & extended supported rate */
 
 	/*  Check if the AP's supported rates are also supported by STA. */
 	get_rate_set(padapter, sta_bssrate, &sta_bssrate_len);
 
-	if (pmlmeext->cur_channel == 14) /*  for JAPAN, channel 14 can only uses B Mode(CCK) */
+	if (pmlmeext->cur_channel ==
+	    14) /*  for JAPAN, channel 14 can only uses B Mode(CCK) */
 		sta_bssrate_len = 4;
 
 	/* for (i = 0; i < sta_bssrate_len; i++) { */
@@ -2828,15 +3102,17 @@ void issue_assocreq(struct adapter *padapter)
 
 		/*  Check if the AP's supported rates are also supported by STA. */
 		for (j = 0; j < sta_bssrate_len; j++) {
-			 /*  Avoid the proprietary data rate (22Mbps) of Handlink WSG-4000 AP */
-			if ((pmlmeinfo->network.supported_rates[i] | IEEE80211_BASIC_RATE_MASK)
-					== (sta_bssrate[j] | IEEE80211_BASIC_RATE_MASK))
+			/*  Avoid the proprietary data rate (22Mbps) of Handlink WSG-4000 AP */
+			if ((pmlmeinfo->network.supported_rates[i] |
+			     IEEE80211_BASIC_RATE_MASK) ==
+			    (sta_bssrate[j] | IEEE80211_BASIC_RATE_MASK))
 				break;
 		}
 
 		if (j != sta_bssrate_len)
 			/*  the rate is supported by STA */
-			bssrate[index++] = pmlmeinfo->network.supported_rates[i];
+			bssrate[index++] =
+				pmlmeinfo->network.supported_rates[i];
 	}
 
 	bssrate_len = index;
@@ -2848,22 +3124,28 @@ void issue_assocreq(struct adapter *padapter)
 	}
 
 	if (bssrate_len > 8) {
-		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, 8, bssrate, &(pattrib->pktlen));
-		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (bssrate_len - 8), (bssrate + 8), &(pattrib->pktlen));
+		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, 8, bssrate,
+				    &(pattrib->pktlen));
+		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES,
+				    (bssrate_len - 8), (bssrate + 8),
+				    &(pattrib->pktlen));
 	} else
-		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, bssrate_len, bssrate, &(pattrib->pktlen));
+		pframe = rtw_set_ie(pframe, WLAN_EID_SUPP_RATES, bssrate_len,
+				    bssrate, &(pattrib->pktlen));
 
 	/* vendor specific IE, such as WPA, WMM, WPS */
-	for (i = sizeof(struct ndis_802_11_fix_ie); i < pmlmeinfo->network.ie_length;) {
+	for (i = sizeof(struct ndis_802_11_fix_ie);
+	     i < pmlmeinfo->network.ie_length;) {
 		pIE = (struct ndis_80211_var_ie *)(pmlmeinfo->network.ies + i);
 
 		switch (pIE->element_id) {
 		case WLAN_EID_VENDOR_SPECIFIC:
 			if ((!memcmp(pIE->data, RTW_WPA_OUI, 4)) ||
-					(!memcmp(pIE->data, WMM_OUI, 4)) ||
-					(!memcmp(pIE->data, WPS_OUI, 4))) {
+			    (!memcmp(pIE->data, WMM_OUI, 4)) ||
+			    (!memcmp(pIE->data, WPS_OUI, 4))) {
 				vs_ie_length = pIE->length;
-				if ((!padapter->registrypriv.wifi_spec) && (!memcmp(pIE->data, WPS_OUI, 4))) {
+				if ((!padapter->registrypriv.wifi_spec) &&
+				    (!memcmp(pIE->data, WPS_OUI, 4))) {
 					/* Commented by Kurt 20110629
 					 * In some older APs, WPS handshake
 					 * would be fail if we append vendor
@@ -2873,25 +3155,37 @@ void issue_assocreq(struct adapter *padapter)
 					vs_ie_length = 14;
 				}
 
-				pframe = rtw_set_ie(pframe, WLAN_EID_VENDOR_SPECIFIC, vs_ie_length, pIE->data, &(pattrib->pktlen));
+				pframe = rtw_set_ie(pframe,
+						    WLAN_EID_VENDOR_SPECIFIC,
+						    vs_ie_length, pIE->data,
+						    &(pattrib->pktlen));
 			}
 			break;
 
 		case WLAN_EID_RSN:
-			pframe = rtw_set_ie(pframe, WLAN_EID_RSN, pIE->length, pIE->data, &(pattrib->pktlen));
+			pframe = rtw_set_ie(pframe, WLAN_EID_RSN, pIE->length,
+					    pIE->data, &(pattrib->pktlen));
 			break;
 		case WLAN_EID_HT_CAPABILITY:
 			if (padapter->mlmepriv.htpriv.ht_option) {
 				if (!(is_ap_in_tkip(padapter))) {
-					memcpy(&(pmlmeinfo->HT_caps), pIE->data, sizeof(struct HT_caps_element));
-					pframe = rtw_set_ie(pframe, WLAN_EID_HT_CAPABILITY, pIE->length, (u8 *)(&(pmlmeinfo->HT_caps)), &(pattrib->pktlen));
+					memcpy(&(pmlmeinfo->HT_caps), pIE->data,
+					       sizeof(struct HT_caps_element));
+					pframe = rtw_set_ie(
+						pframe, WLAN_EID_HT_CAPABILITY,
+						pIE->length,
+						(u8 *)(&(pmlmeinfo->HT_caps)),
+						&(pattrib->pktlen));
 				}
 			}
 			break;
 
 		case WLAN_EID_EXT_CAPABILITY:
 			if (padapter->mlmepriv.htpriv.ht_option)
-				pframe = rtw_set_ie(pframe, WLAN_EID_EXT_CAPABILITY, pIE->length, pIE->data, &(pattrib->pktlen));
+				pframe = rtw_set_ie(pframe,
+						    WLAN_EID_EXT_CAPABILITY,
+						    pIE->length, pIE->data,
+						    &(pattrib->pktlen));
 			break;
 		default:
 			break;
@@ -2901,7 +3195,8 @@ void issue_assocreq(struct adapter *padapter)
 	}
 
 	if (pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_REALTEK)
-		pframe = rtw_set_ie(pframe, WLAN_EID_VENDOR_SPECIFIC, 6, REALTEK_96B_IE, &(pattrib->pktlen));
+		pframe = rtw_set_ie(pframe, WLAN_EID_VENDOR_SPECIFIC, 6,
+				    REALTEK_96B_IE, &(pattrib->pktlen));
 
 	pattrib->last_txcmdsz = pattrib->pktlen;
 	dump_mgntframe(padapter, pmgntframe);
@@ -2910,7 +3205,8 @@ void issue_assocreq(struct adapter *padapter)
 
 exit:
 	if (ret == _SUCCESS)
-		rtw_buf_update(&pmlmepriv->assoc_req, &pmlmepriv->assoc_req_len, (u8 *)pwlanhdr, pattrib->pktlen);
+		rtw_buf_update(&pmlmepriv->assoc_req, &pmlmepriv->assoc_req_len,
+			       (u8 *)pwlanhdr, pattrib->pktlen);
 	else
 		rtw_buf_free(&pmlmepriv->assoc_req, &pmlmepriv->assoc_req_len);
 }
@@ -2920,10 +3216,10 @@ static int _issue_nulldata(struct adapter *padapter, unsigned char *da,
 			   unsigned int power_mode, bool wait_ack)
 {
 	int ret = _FAIL;
-	struct xmit_frame			*pmgntframe;
-	struct pkt_attrib			*pattrib;
+	struct xmit_frame *pmgntframe;
+	struct pkt_attrib *pattrib;
 	unsigned char *pframe;
-	struct ieee80211_hdr	*pwlanhdr;
+	struct ieee80211_hdr *pwlanhdr;
 	__le16 *fctrl;
 	struct xmit_priv *pxmitpriv;
 	struct mlme_ext_priv *pmlmeext;
@@ -2953,9 +3249,9 @@ static int _issue_nulldata(struct adapter *padapter, unsigned char *da,
 	fctrl = &(pwlanhdr->frame_control);
 	*(fctrl) = 0;
 
-	if ((pmlmeinfo->state&0x03) == WIFI_FW_AP_STATE)
+	if ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)
 		SetFrDs(fctrl);
-	else if ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE)
+	else if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE)
 		SetToDs(fctrl);
 
 	if (power_mode)
@@ -2991,7 +3287,8 @@ static int _issue_nulldata(struct adapter *padapter, unsigned char *da,
  * When wait_ms > 0, this function should be called at process context
  * da == NULL for station mode
  */
-int issue_nulldata(struct adapter *padapter, unsigned char *da, unsigned int power_mode, int try_cnt, int wait_ms)
+int issue_nulldata(struct adapter *padapter, unsigned char *da,
+		   unsigned int power_mode, int try_cnt, int wait_ms)
 {
 	int ret;
 	int i = 0;
@@ -3028,9 +3325,9 @@ int issue_nulldata(struct adapter *padapter, unsigned char *da, unsigned int pow
 
 	if (ret != _FAIL) {
 		ret = _SUCCESS;
-		#ifndef DBG_XMIT_ACK
+#ifndef DBG_XMIT_ACK
 		goto exit;
-		#endif
+#endif
 	}
 
 exit:
@@ -3063,10 +3360,10 @@ static int _issue_qos_nulldata(struct adapter *padapter, unsigned char *da,
 			       u16 tid, bool wait_ack)
 {
 	int ret = _FAIL;
-	struct xmit_frame			*pmgntframe;
-	struct pkt_attrib			*pattrib;
+	struct xmit_frame *pmgntframe;
+	struct pkt_attrib *pattrib;
 	unsigned char *pframe;
-	struct ieee80211_hdr	*pwlanhdr;
+	struct ieee80211_hdr *pwlanhdr;
 	__le16 *fctrl;
 	u16 *qc;
 	struct xmit_priv *pxmitpriv = &(padapter->xmitpriv);
@@ -3095,9 +3392,9 @@ static int _issue_qos_nulldata(struct adapter *padapter, unsigned char *da,
 	fctrl = &(pwlanhdr->frame_control);
 	*(fctrl) = 0;
 
-	if ((pmlmeinfo->state&0x03) == WIFI_FW_AP_STATE)
+	if ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)
 		SetFrDs(fctrl);
-	else if ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE)
+	else if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE)
 		SetToDs(fctrl);
 
 	qc = (unsigned short *)(pframe + pattrib->hdrlen - 2);
@@ -3134,7 +3431,8 @@ static int _issue_qos_nulldata(struct adapter *padapter, unsigned char *da,
 
 /* when wait_ms >0 , this function should be called at process context */
 /* da == NULL for station mode */
-int issue_qos_nulldata(struct adapter *padapter, unsigned char *da, u16 tid, int try_cnt, int wait_ms)
+int issue_qos_nulldata(struct adapter *padapter, unsigned char *da, u16 tid,
+		       int try_cnt, int wait_ms)
 {
 	int ret;
 	int i = 0;
@@ -3160,9 +3458,9 @@ int issue_qos_nulldata(struct adapter *padapter, unsigned char *da, u16 tid, int
 
 	if (ret != _FAIL) {
 		ret = _SUCCESS;
-		#ifndef DBG_XMIT_ACK
+#ifndef DBG_XMIT_ACK
 		goto exit;
-		#endif
+#endif
 	}
 
 exit:
@@ -3172,10 +3470,10 @@ int issue_qos_nulldata(struct adapter *padapter, unsigned char *da, u16 tid, int
 static int _issue_deauth(struct adapter *padapter, unsigned char *da,
 			 unsigned short reason, bool wait_ack)
 {
-	struct xmit_frame			*pmgntframe;
-	struct pkt_attrib			*pattrib;
+	struct xmit_frame *pmgntframe;
+	struct pkt_attrib *pattrib;
 	unsigned char *pframe;
-	struct ieee80211_hdr	*pwlanhdr;
+	struct ieee80211_hdr *pwlanhdr;
 	__le16 *fctrl;
 	struct xmit_priv *pxmitpriv = &(padapter->xmitpriv);
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
@@ -3212,7 +3510,8 @@ static int _issue_deauth(struct adapter *padapter, unsigned char *da,
 	pattrib->pktlen = sizeof(struct ieee80211_hdr_3addr);
 
 	le_tmp = cpu_to_le16(reason);
-	pframe = rtw_set_fixed_ie(pframe, _RSON_CODE_, (unsigned char *)&le_tmp, &(pattrib->pktlen));
+	pframe = rtw_set_fixed_ie(pframe, _RSON_CODE_, (unsigned char *)&le_tmp,
+				  &(pattrib->pktlen));
 
 	pattrib->last_txcmdsz = pattrib->pktlen;
 
@@ -3227,13 +3526,14 @@ static int _issue_deauth(struct adapter *padapter, unsigned char *da,
 	return ret;
 }
 
-int issue_deauth(struct adapter *padapter, unsigned char *da, unsigned short reason)
+int issue_deauth(struct adapter *padapter, unsigned char *da,
+		 unsigned short reason)
 {
 	return _issue_deauth(padapter, da, reason, false);
 }
 
-int issue_deauth_ex(struct adapter *padapter, u8 *da, unsigned short reason, int try_cnt,
-	int wait_ms)
+int issue_deauth_ex(struct adapter *padapter, u8 *da, unsigned short reason,
+		    int try_cnt, int wait_ms)
 {
 	int ret;
 	int i = 0;
@@ -3253,22 +3553,23 @@ int issue_deauth_ex(struct adapter *padapter, u8 *da, unsigned short reason, int
 
 	if (ret != _FAIL) {
 		ret = _SUCCESS;
-		#ifndef DBG_XMIT_ACK
+#ifndef DBG_XMIT_ACK
 		goto exit;
-		#endif
+#endif
 	}
 
 exit:
 	return ret;
 }
 
-void issue_action_SA_Query(struct adapter *padapter, unsigned char *raddr, unsigned char action, unsigned short tid)
+void issue_action_SA_Query(struct adapter *padapter, unsigned char *raddr,
+			   unsigned char action, unsigned short tid)
 {
 	u8 category = RTW_WLAN_CATEGORY_SA_QUERY;
-	struct xmit_frame		*pmgntframe;
-	struct pkt_attrib		*pattrib;
+	struct xmit_frame *pmgntframe;
+	struct pkt_attrib *pattrib;
 	u8 *pframe;
-	struct ieee80211_hdr	*pwlanhdr;
+	struct ieee80211_hdr *pwlanhdr;
 	__le16 *fctrl;
 	struct xmit_priv *pxmitpriv = &(padapter->xmitpriv);
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
@@ -3294,7 +3595,8 @@ void issue_action_SA_Query(struct adapter *padapter, unsigned char *raddr, unsig
 	if (raddr)
 		memcpy(pwlanhdr->addr1, raddr, ETH_ALEN);
 	else
-		memcpy(pwlanhdr->addr1, get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
+		memcpy(pwlanhdr->addr1, get_my_bssid(&(pmlmeinfo->network)),
+		       ETH_ALEN);
 	memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
 	memcpy(pwlanhdr->addr3, get_my_bssid(&(pmlmeinfo->network)), ETH_ALEN);
 
@@ -3310,7 +3612,9 @@ void issue_action_SA_Query(struct adapter *padapter, unsigned char *raddr, unsig
 
 	switch (action) {
 	case 0: /* SA Query req */
-		pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)&pmlmeext->sa_query_seq, &pattrib->pktlen);
+		pframe = rtw_set_fixed_ie(
+			pframe, 2, (unsigned char *)&pmlmeext->sa_query_seq,
+			&pattrib->pktlen);
 		pmlmeext->sa_query_seq++;
 		/* send sa query request to AP, AP should reply sa query response in 1 second */
 		set_sa_query_timer(pmlmeext, 1000);
@@ -3318,7 +3622,8 @@ void issue_action_SA_Query(struct adapter *padapter, unsigned char *raddr, unsig
 
 	case 1: /* SA Query rsp */
 		le_tmp = cpu_to_le16(tid);
-		pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)&le_tmp, &pattrib->pktlen);
+		pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)&le_tmp,
+					  &pattrib->pktlen);
 		break;
 	default:
 		break;
@@ -3329,7 +3634,8 @@ void issue_action_SA_Query(struct adapter *padapter, unsigned char *raddr, unsig
 	dump_mgntframe(padapter, pmgntframe);
 }
 
-void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned char action, unsigned short status)
+void issue_action_BA(struct adapter *padapter, unsigned char *raddr,
+		     unsigned char action, unsigned short status)
 {
 	u8 category = RTW_WLAN_CATEGORY_BACK;
 	u16 start_seq;
@@ -3338,10 +3644,10 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 	u16 BA_timeout_value;
 	u16 BA_starting_seqctrl = 0;
 	enum ieee80211_max_ampdu_length_exp max_rx_ampdu_factor;
-	struct xmit_frame		*pmgntframe;
-	struct pkt_attrib		*pattrib;
+	struct xmit_frame *pmgntframe;
+	struct pkt_attrib *pattrib;
 	u8 *pframe;
-	struct ieee80211_hdr	*pwlanhdr;
+	struct ieee80211_hdr *pwlanhdr;
 	__le16 *fctrl;
 	struct xmit_priv *pxmitpriv = &(padapter->xmitpriv);
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
@@ -3388,87 +3694,149 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 			do {
 				pmlmeinfo->dialogToken++;
 			} while (pmlmeinfo->dialogToken == 0);
-			pframe = rtw_set_fixed_ie(pframe, 1, &(pmlmeinfo->dialogToken), &(pattrib->pktlen));
+			pframe = rtw_set_fixed_ie(pframe, 1,
+						  &(pmlmeinfo->dialogToken),
+						  &(pattrib->pktlen));
 
 			if (hal_btcoex_IsBTCoexCtrlAMPDUSize(padapter)) {
 				/*  A-MSDU NOT Supported */
 				BA_para_set = 0;
 				/*  immediate Block Ack */
-				BA_para_set |= BIT(1) & IEEE80211_ADDBA_PARAM_POLICY_MASK;
+				BA_para_set |=
+					BIT(1) &
+					IEEE80211_ADDBA_PARAM_POLICY_MASK;
 				/*  TID */
-				BA_para_set |= (status << 2) & IEEE80211_ADDBA_PARAM_TID_MASK;
+				BA_para_set |= (status << 2) &
+					       IEEE80211_ADDBA_PARAM_TID_MASK;
 				/*  max buffer size is 8 MSDU */
-				BA_para_set |= (8 << 6) & IEEE80211_ADDBA_PARAM_BUF_SIZE_MASK;
+				BA_para_set |=
+					(8 << 6) &
+					IEEE80211_ADDBA_PARAM_BUF_SIZE_MASK;
 			} else {
-				BA_para_set = (0x1002 | ((status & 0xf) << 2)); /* immediate ack & 64 buffer size */
+				BA_para_set =
+					(0x1002 |
+					 ((status & 0xf)
+					  << 2)); /* immediate ack & 64 buffer size */
 			}
 			le_tmp = cpu_to_le16(BA_para_set);
-			pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)(&(le_tmp)), &(pattrib->pktlen));
+			pframe = rtw_set_fixed_ie(pframe, 2,
+						  (unsigned char *)(&(le_tmp)),
+						  &(pattrib->pktlen));
 
-			BA_timeout_value = 5000;/*  5ms */
+			BA_timeout_value = 5000; /*  5ms */
 			le_tmp = cpu_to_le16(BA_timeout_value);
-			pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)(&(le_tmp)), &(pattrib->pktlen));
+			pframe = rtw_set_fixed_ie(pframe, 2,
+						  (unsigned char *)(&(le_tmp)),
+						  &(pattrib->pktlen));
 
 			/* if ((psta = rtw_get_stainfo(pstapriv, pmlmeinfo->network.mac_address)) != NULL) */
 			psta = rtw_get_stainfo(pstapriv, raddr);
 			if (psta) {
-				start_seq = (psta->sta_xmitpriv.txseq_tid[status & 0x07] % 4096u) + 1;
+				start_seq = (psta->sta_xmitpriv
+						     .txseq_tid[status & 0x07] %
+					     4096u) +
+					    1;
 
-				psta->BA_starting_seqctrl[status & 0x07] = start_seq;
+				psta->BA_starting_seqctrl[status & 0x07] =
+					start_seq;
 
 				BA_starting_seqctrl = start_seq << 4;
 			}
 
 			le_tmp = cpu_to_le16(BA_starting_seqctrl);
-			pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)(&(le_tmp)), &(pattrib->pktlen));
+			pframe = rtw_set_fixed_ie(pframe, 2,
+						  (unsigned char *)(&(le_tmp)),
+						  &(pattrib->pktlen));
 			break;
 
 		case 1: /* ADDBA rsp */
-			pframe = rtw_set_fixed_ie(pframe, 1, &(pmlmeinfo->ADDBA_req.dialog_token), &(pattrib->pktlen));
-			pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)(&status), &(pattrib->pktlen));
+			pframe = rtw_set_fixed_ie(
+				pframe, 1, &(pmlmeinfo->ADDBA_req.dialog_token),
+				&(pattrib->pktlen));
+			pframe = rtw_set_fixed_ie(pframe, 2,
+						  (unsigned char *)(&status),
+						  &(pattrib->pktlen));
 			if (padapter->driver_rx_ampdu_factor != 0xFF)
 				max_rx_ampdu_factor =
-				  (enum ieee80211_max_ampdu_length_exp)padapter->driver_rx_ampdu_factor;
+					(enum ieee80211_max_ampdu_length_exp)
+						padapter->driver_rx_ampdu_factor;
 			else
 				rtw_hal_get_def_var(padapter,
-						    HW_VAR_MAX_RX_AMPDU_FACTOR, &max_rx_ampdu_factor);
+						    HW_VAR_MAX_RX_AMPDU_FACTOR,
+						    &max_rx_ampdu_factor);
 
 			if (max_rx_ampdu_factor == IEEE80211_HT_MAX_AMPDU_64K)
-				BA_para_set = ((le16_to_cpu(pmlmeinfo->ADDBA_req.BA_para_set) & 0x3f) | 0x1000); /* 64 buffer size */
-			else if (max_rx_ampdu_factor == IEEE80211_HT_MAX_AMPDU_32K)
-				BA_para_set = ((le16_to_cpu(pmlmeinfo->ADDBA_req.BA_para_set) & 0x3f) | 0x0800); /* 32 buffer size */
-			else if (max_rx_ampdu_factor == IEEE80211_HT_MAX_AMPDU_16K)
-				BA_para_set = ((le16_to_cpu(pmlmeinfo->ADDBA_req.BA_para_set) & 0x3f) | 0x0400); /* 16 buffer size */
-			else if (max_rx_ampdu_factor == IEEE80211_HT_MAX_AMPDU_8K)
-				BA_para_set = ((le16_to_cpu(pmlmeinfo->ADDBA_req.BA_para_set) & 0x3f) | 0x0200); /* 8 buffer size */
+				BA_para_set =
+					((le16_to_cpu(pmlmeinfo->ADDBA_req
+							      .BA_para_set) &
+					  0x3f) |
+					 0x1000); /* 64 buffer size */
+			else if (max_rx_ampdu_factor ==
+				 IEEE80211_HT_MAX_AMPDU_32K)
+				BA_para_set =
+					((le16_to_cpu(pmlmeinfo->ADDBA_req
+							      .BA_para_set) &
+					  0x3f) |
+					 0x0800); /* 32 buffer size */
+			else if (max_rx_ampdu_factor ==
+				 IEEE80211_HT_MAX_AMPDU_16K)
+				BA_para_set =
+					((le16_to_cpu(pmlmeinfo->ADDBA_req
+							      .BA_para_set) &
+					  0x3f) |
+					 0x0400); /* 16 buffer size */
+			else if (max_rx_ampdu_factor ==
+				 IEEE80211_HT_MAX_AMPDU_8K)
+				BA_para_set =
+					((le16_to_cpu(pmlmeinfo->ADDBA_req
+							      .BA_para_set) &
+					  0x3f) |
+					 0x0200); /* 8 buffer size */
 			else
-				BA_para_set = ((le16_to_cpu(pmlmeinfo->ADDBA_req.BA_para_set) & 0x3f) | 0x1000); /* 64 buffer size */
+				BA_para_set =
+					((le16_to_cpu(pmlmeinfo->ADDBA_req
+							      .BA_para_set) &
+					  0x3f) |
+					 0x1000); /* 64 buffer size */
 
 			if (hal_btcoex_IsBTCoexCtrlAMPDUSize(padapter) &&
 			    padapter->driver_rx_ampdu_factor == 0xFF) {
 				/*  max buffer size is 8 MSDU */
-				BA_para_set &= ~IEEE80211_ADDBA_PARAM_BUF_SIZE_MASK;
-				BA_para_set |= (8 << 6) & IEEE80211_ADDBA_PARAM_BUF_SIZE_MASK;
+				BA_para_set &=
+					~IEEE80211_ADDBA_PARAM_BUF_SIZE_MASK;
+				BA_para_set |=
+					(8 << 6) &
+					IEEE80211_ADDBA_PARAM_BUF_SIZE_MASK;
 			}
 
-			if (pregpriv->ampdu_amsdu == 0)/* disabled */
+			if (pregpriv->ampdu_amsdu == 0) /* disabled */
 				le_tmp = cpu_to_le16(BA_para_set & ~BIT(0));
-			else if (pregpriv->ampdu_amsdu == 1)/* enabled */
+			else if (pregpriv->ampdu_amsdu == 1) /* enabled */
 				le_tmp = cpu_to_le16(BA_para_set | BIT(0));
 			else /* auto */
 				le_tmp = cpu_to_le16(BA_para_set);
 
-			pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)(&(le_tmp)), &(pattrib->pktlen));
-			pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)(&(pmlmeinfo->ADDBA_req.BA_timeout_value)), &(pattrib->pktlen));
+			pframe = rtw_set_fixed_ie(pframe, 2,
+						  (unsigned char *)(&(le_tmp)),
+						  &(pattrib->pktlen));
+			pframe = rtw_set_fixed_ie(
+				pframe, 2,
+				(unsigned char *)(&(
+					pmlmeinfo->ADDBA_req.BA_timeout_value)),
+				&(pattrib->pktlen));
 			break;
-		case 2:/* DELBA */
+		case 2: /* DELBA */
 			BA_para_set = (status & 0x1F) << 3;
 			le_tmp = cpu_to_le16(BA_para_set);
-			pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)(&(le_tmp)), &(pattrib->pktlen));
+			pframe = rtw_set_fixed_ie(pframe, 2,
+						  (unsigned char *)(&(le_tmp)),
+						  &(pattrib->pktlen));
 
 			reason_code = 37;
 			le_tmp = cpu_to_le16(reason_code);
-			pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)(&(le_tmp)), &(pattrib->pktlen));
+			pframe = rtw_set_fixed_ie(pframe, 2,
+						  (unsigned char *)(&(le_tmp)),
+						  &(pattrib->pktlen));
 			break;
 		default:
 			break;
@@ -3482,23 +3850,24 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 
 static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 {
-	struct list_head		*plist, *phead;
+	struct list_head *plist, *phead;
 	unsigned char category, action;
-	struct xmit_frame			*pmgntframe;
-	struct pkt_attrib			*pattrib;
+	struct xmit_frame *pmgntframe;
+	struct pkt_attrib *pattrib;
 	unsigned char *pframe;
-	struct ieee80211_hdr	*pwlanhdr;
+	struct ieee80211_hdr *pwlanhdr;
 	__le16 *fctrl;
-	struct	wlan_network	*pnetwork = NULL;
+	struct wlan_network *pnetwork = NULL;
 	struct xmit_priv *pxmitpriv = &(padapter->xmitpriv);
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
-	struct __queue		*queue	= &(pmlmepriv->scanned_queue);
-	u8 InfoContent[16] = {0};
+	struct __queue *queue = &(pmlmepriv->scanned_queue);
+	u8 InfoContent[16] = { 0 };
 	u8 ICS[8][15];
 
-	if ((pmlmepriv->num_FortyMHzIntolerant == 0) || (pmlmepriv->num_sta_no_ht == 0))
+	if ((pmlmepriv->num_FortyMHzIntolerant == 0) ||
+	    (pmlmepriv->num_sta_no_ht == 0))
 		return;
 
 	if (true == pmlmeinfo->bwmode_updated)
@@ -3541,9 +3910,10 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 	if (pmlmepriv->num_FortyMHzIntolerant > 0) {
 		u8 iedata = 0;
 
-		iedata |= BIT(2);/* 20 MHz BSS Width Request */
+		iedata |= BIT(2); /* 20 MHz BSS Width Request */
 
-		pframe = rtw_set_ie(pframe, WLAN_EID_BSS_COEX_2040,  1, &iedata, &(pattrib->pktlen));
+		pframe = rtw_set_ie(pframe, WLAN_EID_BSS_COEX_2040, 1, &iedata,
+				    &(pattrib->pktlen));
 	}
 
 	/*  */
@@ -3564,19 +3934,25 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 			if (phead == plist)
 				break;
 
-			pnetwork = container_of(plist, struct wlan_network, list);
+			pnetwork =
+				container_of(plist, struct wlan_network, list);
 
 			plist = get_next(plist);
 
-			pbss_network = (struct wlan_bssid_ex *)&pnetwork->network;
+			pbss_network =
+				(struct wlan_bssid_ex *)&pnetwork->network;
 
-			p = rtw_get_ie(pbss_network->ies + _FIXED_IE_LENGTH_, WLAN_EID_HT_CAPABILITY, &len, pbss_network->ie_length - _FIXED_IE_LENGTH_);
-			if (!p || len == 0) {/* non-HT */
+			p = rtw_get_ie(pbss_network->ies + _FIXED_IE_LENGTH_,
+				       WLAN_EID_HT_CAPABILITY, &len,
+				       pbss_network->ie_length -
+					       _FIXED_IE_LENGTH_);
+			if (!p || len == 0) { /* non-HT */
 
 				if (pbss_network->configuration.ds_config <= 0)
 					continue;
 
-				ICS[0][pbss_network->configuration.ds_config] = 1;
+				ICS[0][pbss_network->configuration.ds_config] =
+					1;
 
 				if (ICS[0][0] == 0)
 					ICS[0][0] = 1;
@@ -3606,7 +3982,9 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 				}
 			}
 
-			pframe = rtw_set_ie(pframe, WLAN_EID_BSS_INTOLERANT_CHL_REPORT, k, InfoContent, &(pattrib->pktlen));
+			pframe = rtw_set_ie(pframe,
+					    WLAN_EID_BSS_INTOLERANT_CHL_REPORT,
+					    k, InfoContent, &(pattrib->pktlen));
 		}
 	}
 
@@ -3624,7 +4002,7 @@ unsigned int send_delba(struct adapter *padapter, u8 initiator, u8 *addr)
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u16 tid;
 
-	if ((pmlmeinfo->state&0x03) != WIFI_FW_AP_STATE)
+	if ((pmlmeinfo->state & 0x03) != WIFI_FW_AP_STATE)
 		if (!(pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS))
 			return _SUCCESS;
 
@@ -3632,18 +4010,23 @@ unsigned int send_delba(struct adapter *padapter, u8 initiator, u8 *addr)
 	if (!psta)
 		return _SUCCESS;
 
-	if (initiator == 0) {/*  recipient */
+	if (initiator == 0) { /*  recipient */
 		for (tid = 0; tid < MAXTID; tid++) {
 			if (psta->recvreorder_ctrl[tid].enable) {
-				issue_action_BA(padapter, addr, WLAN_ACTION_DELBA, (((tid << 1) | initiator)&0x1F));
+				issue_action_BA(
+					padapter, addr, WLAN_ACTION_DELBA,
+					(((tid << 1) | initiator) & 0x1F));
 				psta->recvreorder_ctrl[tid].enable = false;
-				psta->recvreorder_ctrl[tid].indicate_seq = 0xffff;
+				psta->recvreorder_ctrl[tid].indicate_seq =
+					0xffff;
 			}
 		}
-	} else if (initiator == 1) {/*  originator */
+	} else if (initiator == 1) { /*  originator */
 		for (tid = 0; tid < MAXTID; tid++) {
 			if (psta->htpriv.agg_enable_bitmap & BIT(tid)) {
-				issue_action_BA(padapter, addr, WLAN_ACTION_DELBA, (((tid << 1) | initiator)&0x1F));
+				issue_action_BA(
+					padapter, addr, WLAN_ACTION_DELBA,
+					(((tid << 1) | initiator) & 0x1F));
 				psta->htpriv.agg_enable_bitmap &= ~BIT(tid);
 				psta->htpriv.candidate_tid_bitmap &= ~BIT(tid);
 			}
@@ -3656,7 +4039,7 @@ unsigned int send_delba(struct adapter *padapter, u8 initiator, u8 *addr)
 unsigned int send_beacon(struct adapter *padapter)
 {
 	u8 bxmitok = false;
-	int	issue = 0;
+	int issue = 0;
 	int poll = 0;
 
 	rtw_hal_set_hwreg(padapter, HW_VAR_BCN_VALID, NULL);
@@ -3666,11 +4049,15 @@ unsigned int send_beacon(struct adapter *padapter)
 		issue++;
 		do {
 			cond_resched();
-			rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID, (u8 *)(&bxmitok));
+			rtw_hal_get_hwreg(padapter, HW_VAR_BCN_VALID,
+					  (u8 *)(&bxmitok));
 			poll++;
-		} while ((poll%10) != 0 && false == bxmitok && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
+		} while ((poll % 10) != 0 && false == bxmitok &&
+			 !padapter->bSurpriseRemoved &&
+			 !padapter->bDriverStopped);
 
-	} while (false == bxmitok && issue < 100 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
+	} while (false == bxmitok && issue < 100 &&
+		 !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
 
 	if (padapter->bSurpriseRemoved || padapter->bDriverStopped)
 		return _FAIL;
@@ -3686,7 +4073,7 @@ unsigned int send_beacon(struct adapter *padapter)
 void site_survey(struct adapter *padapter)
 {
 	unsigned char survey_channel = 0, val8;
-	enum rt_scan_type	ScanType = SCAN_PASSIVE;
+	enum rt_scan_type ScanType = SCAN_PASSIVE;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u32 initialgain = 0;
@@ -3695,43 +4082,67 @@ void site_survey(struct adapter *padapter)
 	{
 		struct rtw_ieee80211_channel *ch;
 
-		if (pmlmeext->sitesurvey_res.channel_idx < pmlmeext->sitesurvey_res.ch_num) {
-			ch = &pmlmeext->sitesurvey_res.ch[pmlmeext->sitesurvey_res.channel_idx];
+		if (pmlmeext->sitesurvey_res.channel_idx <
+		    pmlmeext->sitesurvey_res.ch_num) {
+			ch = &pmlmeext->sitesurvey_res
+				      .ch[pmlmeext->sitesurvey_res.channel_idx];
 			survey_channel = ch->hw_value;
-			ScanType = (ch->flags & RTW_IEEE80211_CHAN_PASSIVE_SCAN) ? SCAN_PASSIVE : SCAN_ACTIVE;
+			ScanType =
+				(ch->flags & RTW_IEEE80211_CHAN_PASSIVE_SCAN) ?
+					SCAN_PASSIVE :
+					SCAN_ACTIVE;
 		}
 	}
 
 	if (survey_channel != 0) {
 		if (pmlmeext->sitesurvey_res.channel_idx == 0)
 			set_channel_bwmode(padapter, survey_channel,
-					   HAL_PRIME_CHNL_OFFSET_DONT_CARE, CHANNEL_WIDTH_20);
+					   HAL_PRIME_CHNL_OFFSET_DONT_CARE,
+					   CHANNEL_WIDTH_20);
 		else
 			r8723bs_select_channel(padapter, survey_channel);
 
-		if (ScanType == SCAN_ACTIVE) { /* obey the channel plan setting... */
+		if (ScanType ==
+		    SCAN_ACTIVE) { /* obey the channel plan setting... */
 			{
 				int i;
 
 				for (i = 0; i < RTW_SSID_SCAN_AMOUNT; i++) {
-					if (!pmlmeext->sitesurvey_res.ssid[i].ssid_length)
+					if (!pmlmeext->sitesurvey_res.ssid[i]
+						     .ssid_length)
 						continue;
 
 					/* IOT issue, When wifi_spec is not set, send one probe req without WPS IE. */
 					if (padapter->registrypriv.wifi_spec)
-						issue_probereq(padapter, &(pmlmeext->sitesurvey_res.ssid[i]), NULL);
+						issue_probereq(
+							padapter,
+							&(pmlmeext->sitesurvey_res
+								  .ssid[i]),
+							NULL);
 					else
-						issue_probereq_ex(padapter, &(pmlmeext->sitesurvey_res.ssid[i]), NULL, 0, 0, 0, 0);
-
-					issue_probereq(padapter, &(pmlmeext->sitesurvey_res.ssid[i]), NULL);
+						issue_probereq_ex(
+							padapter,
+							&(pmlmeext->sitesurvey_res
+								  .ssid[i]),
+							NULL, 0, 0, 0, 0);
+
+					issue_probereq(
+						padapter,
+						&(pmlmeext->sitesurvey_res
+							  .ssid[i]),
+						NULL);
 				}
 
-				if (pmlmeext->sitesurvey_res.scan_mode == SCAN_ACTIVE) {
+				if (pmlmeext->sitesurvey_res.scan_mode ==
+				    SCAN_ACTIVE) {
 					/* IOT issue, When wifi_spec is not set, send one probe req without WPS IE. */
 					if (padapter->registrypriv.wifi_spec)
-						issue_probereq(padapter, NULL, NULL);
+						issue_probereq(padapter, NULL,
+							       NULL);
 					else
-						issue_probereq_ex(padapter, NULL, NULL, 0, 0, 0, 0);
+						issue_probereq_ex(padapter,
+								  NULL, NULL, 0,
+								  0, 0, 0);
 					issue_probereq(padapter, NULL, NULL);
 				}
 			}
@@ -3749,7 +4160,9 @@ void site_survey(struct adapter *padapter)
 			/* switch back to the original channel */
 			/* SelectChannel(padapter, pmlmeext->cur_channel, pmlmeext->cur_ch_offset); */
 
-			set_channel_bwmode(padapter, pmlmeext->cur_channel, pmlmeext->cur_ch_offset, pmlmeext->cur_bwmode);
+			set_channel_bwmode(padapter, pmlmeext->cur_channel,
+					   pmlmeext->cur_ch_offset,
+					   pmlmeext->cur_bwmode);
 
 			/* flush 4-AC Queue after site_survey */
 			/* val8 = 0; */
@@ -3759,7 +4172,8 @@ void site_survey(struct adapter *padapter)
 			set_msr(padapter, (pmlmeinfo->state & 0x3));
 
 			initialgain = 0xff; /* restore RX GAIN */
-			rtw_hal_set_hwreg(padapter, HW_VAR_INITIAL_GAIN, (u8 *)(&initialgain));
+			rtw_hal_set_hwreg(padapter, HW_VAR_INITIAL_GAIN,
+					  (u8 *)(&initialgain));
 			/* turn on dynamic functions */
 			Restore_DM_Func_Flag(padapter);
 			/* Switch_DM_Func(padapter, DYNAMIC_ALL_FUNC_ENABLE, true); */
@@ -3768,7 +4182,8 @@ void site_survey(struct adapter *padapter)
 				issue_nulldata(padapter, NULL, 0, 3, 500);
 
 			val8 = 0; /* survey done */
-			rtw_hal_set_hwreg(padapter, HW_VAR_MLME_SITESURVEY, (u8 *)(&val8));
+			rtw_hal_set_hwreg(padapter, HW_VAR_MLME_SITESURVEY,
+					  (u8 *)(&val8));
 
 			report_surveydone_event(padapter);
 
@@ -3783,9 +4198,10 @@ void site_survey(struct adapter *padapter)
 }
 
 /* collect bss info from Beacon and Probe request/response frames. */
-u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, struct wlan_bssid_ex *bssid)
+u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame,
+		    struct wlan_bssid_ex *bssid)
 {
-	int	i;
+	int i;
 	u32 len;
 	u8 *p;
 	u16 val16, subtype;
@@ -3827,15 +4243,22 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 
 	/* below is to copy the information element */
 	bssid->ie_length = len;
-	memcpy(bssid->ies, (pframe + sizeof(struct ieee80211_hdr_3addr)), bssid->ie_length);
+	memcpy(bssid->ies, (pframe + sizeof(struct ieee80211_hdr_3addr)),
+	       bssid->ie_length);
 
 	/* get the signal strength */
-	bssid->rssi = precv_frame->u.hdr.attrib.phy_info.RecvSignalPower; /*  in dBM.raw data */
-	bssid->phy_info.signal_quality = precv_frame->u.hdr.attrib.phy_info.SignalQuality;/* in percentage */
-	bssid->phy_info.signal_strength = precv_frame->u.hdr.attrib.phy_info.SignalStrength;/* in percentage */
+	bssid->rssi = precv_frame->u.hdr.attrib.phy_info
+			      .RecvSignalPower; /*  in dBM.raw data */
+	bssid->phy_info.signal_quality =
+		precv_frame->u.hdr.attrib.phy_info
+			.SignalQuality; /* in percentage */
+	bssid->phy_info.signal_strength =
+		precv_frame->u.hdr.attrib.phy_info
+			.SignalStrength; /* in percentage */
 
 	/*  checking SSID */
-	p = rtw_get_ie(bssid->ies + ie_offset, WLAN_EID_SSID, &len, bssid->ie_length - ie_offset);
+	p = rtw_get_ie(bssid->ies + ie_offset, WLAN_EID_SSID, &len,
+		       bssid->ie_length - ie_offset);
 	if (!p)
 		return _FAIL;
 
@@ -3852,7 +4275,8 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 
 	/* checking rate info... */
 	i = 0;
-	p = rtw_get_ie(bssid->ies + ie_offset, WLAN_EID_SUPP_RATES, &len, bssid->ie_length - ie_offset);
+	p = rtw_get_ie(bssid->ies + ie_offset, WLAN_EID_SUPP_RATES, &len,
+		       bssid->ie_length - ie_offset);
 	if (p) {
 		if (len > NDIS_802_11_LENGTH_RATES_EX)
 			return _FAIL;
@@ -3861,9 +4285,10 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 		i = len;
 	}
 
-	p = rtw_get_ie(bssid->ies + ie_offset, WLAN_EID_EXT_SUPP_RATES, &len, bssid->ie_length - ie_offset);
+	p = rtw_get_ie(bssid->ies + ie_offset, WLAN_EID_EXT_SUPP_RATES, &len,
+		       bssid->ie_length - ie_offset);
 	if (p) {
-		if (len > (NDIS_802_11_LENGTH_RATES_EX-i))
+		if (len > (NDIS_802_11_LENGTH_RATES_EX - i))
 			return _FAIL;
 
 		memcpy(bssid->supported_rates + i, (p + 2), len);
@@ -3875,7 +4300,8 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 		return _FAIL;
 
 	/*  Checking for ds_config */
-	p = rtw_get_ie(bssid->ies + ie_offset, WLAN_EID_DS_PARAMS, &len, bssid->ie_length - ie_offset);
+	p = rtw_get_ie(bssid->ies + ie_offset, WLAN_EID_DS_PARAMS, &len,
+		       bssid->ie_length - ie_offset);
 
 	bssid->configuration.ds_config = 0;
 	bssid->configuration.length = 0;
@@ -3885,13 +4311,17 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 	} else {
 		/*  In 5G, some ap do not have DSSET IE */
 		/*  checking HT info for channel */
-		p = rtw_get_ie(bssid->ies + ie_offset, WLAN_EID_HT_OPERATION, &len, bssid->ie_length - ie_offset);
+		p = rtw_get_ie(bssid->ies + ie_offset, WLAN_EID_HT_OPERATION,
+			       &len, bssid->ie_length - ie_offset);
 		if (p) {
-			struct HT_info_element *HT_info = (struct HT_info_element *)(p + 2);
+			struct HT_info_element *HT_info =
+				(struct HT_info_element *)(p + 2);
 
-			bssid->configuration.ds_config = HT_info->primary_channel;
+			bssid->configuration.ds_config =
+				HT_info->primary_channel;
 		} else { /*  use current channel */
-			bssid->configuration.ds_config = rtw_get_oper_ch(padapter);
+			bssid->configuration.ds_config =
+				rtw_get_oper_ch(padapter);
 		}
 	}
 
@@ -3916,16 +4346,20 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 	bssid->configuration.atim_window = 0;
 
 	/* 20/40 BSS Coexistence check */
-	if ((pregistrypriv->wifi_spec == 1) && (false == pmlmeinfo->bwmode_updated)) {
+	if ((pregistrypriv->wifi_spec == 1) &&
+	    (false == pmlmeinfo->bwmode_updated)) {
 		struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
-		p = rtw_get_ie(bssid->ies + ie_offset, WLAN_EID_HT_CAPABILITY, &len, bssid->ie_length - ie_offset);
+		p = rtw_get_ie(bssid->ies + ie_offset, WLAN_EID_HT_CAPABILITY,
+			       &len, bssid->ie_length - ie_offset);
 		if (p && len > 0) {
-			struct HT_caps_element	*pHT_caps;
+			struct HT_caps_element *pHT_caps;
 
-			pHT_caps = (struct HT_caps_element	*)(p + 2);
+			pHT_caps = (struct HT_caps_element *)(p + 2);
 
-			if (le16_to_cpu(pHT_caps->u.HT_cap_element.HT_caps_info) & BIT(14))
+			if (le16_to_cpu(
+				    pHT_caps->u.HT_cap_element.HT_caps_info) &
+			    BIT(14))
 				pmlmepriv->num_FortyMHzIntolerant++;
 		} else
 			pmlmepriv->num_sta_no_ht++;
@@ -3940,12 +4374,13 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
 
 void start_create_ibss(struct adapter *padapter)
 {
-	unsigned short	caps;
+	unsigned short caps;
 	u8 val8;
 	u8 join_type;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
-	struct wlan_bssid_ex		*pnetwork = (struct wlan_bssid_ex *)(&(pmlmeinfo->network));
+	struct wlan_bssid_ex *pnetwork =
+		(struct wlan_bssid_ex *)(&(pmlmeinfo->network));
 
 	pmlmeext->cur_channel = (u8)pnetwork->configuration.ds_config;
 	pmlmeinfo->bcn_interval = get_beacon_interval(pnetwork);
@@ -3956,7 +4391,7 @@ void start_create_ibss(struct adapter *padapter)
 	/* update capability */
 	caps = rtw_get_capability((struct wlan_bssid_ex *)pnetwork);
 	update_capinfo(padapter, caps);
-	if (caps&WLAN_CAPABILITY_IBSS) {/* adhoc master */
+	if (caps & WLAN_CAPABILITY_IBSS) { /* adhoc master */
 		val8 = 0xcf;
 		rtw_hal_set_hwreg(padapter, HW_VAR_SEC_CFG, (u8 *)(&val8));
 
@@ -3964,7 +4399,9 @@ void start_create_ibss(struct adapter *padapter)
 
 		/* switch channel */
 		/* SelectChannel(padapter, pmlmeext->cur_channel, HAL_PRIME_CHNL_OFFSET_DONT_CARE); */
-		set_channel_bwmode(padapter, pmlmeext->cur_channel, HAL_PRIME_CHNL_OFFSET_DONT_CARE, CHANNEL_WIDTH_20);
+		set_channel_bwmode(padapter, pmlmeext->cur_channel,
+				   HAL_PRIME_CHNL_OFFSET_DONT_CARE,
+				   CHANNEL_WIDTH_20);
 
 		beacon_timing_control(padapter);
 
@@ -3977,9 +4414,12 @@ void start_create_ibss(struct adapter *padapter)
 			report_join_res(padapter, -1);
 			pmlmeinfo->state = WIFI_FW_NULL_STATE;
 		} else {
-			rtw_hal_set_hwreg(padapter, HW_VAR_BSSID, padapter->registrypriv.dev_network.mac_address);
+			rtw_hal_set_hwreg(
+				padapter, HW_VAR_BSSID,
+				padapter->registrypriv.dev_network.mac_address);
 			join_type = 0;
-			rtw_hal_set_hwreg(padapter, HW_VAR_MLME_JOIN, (u8 *)(&join_type));
+			rtw_hal_set_hwreg(padapter, HW_VAR_MLME_JOIN,
+					  (u8 *)(&join_type));
 
 			report_join_res(padapter, 1);
 			pmlmeinfo->state |= WIFI_FW_ASSOC_SUCCESS;
@@ -3994,11 +4434,12 @@ void start_create_ibss(struct adapter *padapter)
 
 void start_clnt_join(struct adapter *padapter)
 {
-	unsigned short	caps;
+	unsigned short caps;
 	u8 val8;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
-	struct wlan_bssid_ex		*pnetwork = (struct wlan_bssid_ex *)(&(pmlmeinfo->network));
+	struct wlan_bssid_ex *pnetwork =
+		(struct wlan_bssid_ex *)(&(pmlmeinfo->network));
 	int beacon_timeout;
 
 	/* update wireless mode */
@@ -4007,10 +4448,11 @@ void start_clnt_join(struct adapter *padapter)
 	/* update capability */
 	caps = rtw_get_capability((struct wlan_bssid_ex *)pnetwork);
 	update_capinfo(padapter, caps);
-	if (caps&WLAN_CAPABILITY_ESS) {
+	if (caps & WLAN_CAPABILITY_ESS) {
 		set_msr(padapter, WIFI_FW_STATION_STATE);
 
-		val8 = (pmlmeinfo->auth_algo == dot11AuthAlgrthm_8021X) ? 0xcc : 0xcf;
+		val8 = (pmlmeinfo->auth_algo == dot11AuthAlgrthm_8021X) ? 0xcc :
+									  0xcf;
 
 		rtw_hal_set_hwreg(padapter, HW_VAR_SEC_CFG, (u8 *)(&val8));
 
@@ -4022,19 +4464,23 @@ void start_clnt_join(struct adapter *padapter)
 		 * For the Win8 P2P connection, it will be hard to have a successful connection if this Wi-Fi doesn't connect to it.
 		 */
 		{
-				/* To avoid connecting to AP fail during resume process, change retry count from 5 to 1 */
-				issue_deauth_ex(padapter, pnetwork->mac_address, WLAN_REASON_DEAUTH_LEAVING, 1, 100);
+			/* To avoid connecting to AP fail during resume process, change retry count from 5 to 1 */
+			issue_deauth_ex(padapter, pnetwork->mac_address,
+					WLAN_REASON_DEAUTH_LEAVING, 1, 100);
 		}
 
 		/* here wait for receiving the beacon to start auth */
 		/* and enable a timer */
-		beacon_timeout = decide_wait_for_beacon_timeout(pmlmeinfo->bcn_interval);
+		beacon_timeout =
+			decide_wait_for_beacon_timeout(pmlmeinfo->bcn_interval);
 		set_link_timer(pmlmeext, beacon_timeout);
 		_set_timer(&padapter->mlmepriv.assoc_timer,
-			(REAUTH_TO * REAUTH_LIMIT) + (REASSOC_TO*REASSOC_LIMIT) + beacon_timeout);
+			   (REAUTH_TO * REAUTH_LIMIT) +
+				   (REASSOC_TO * REASSOC_LIMIT) +
+				   beacon_timeout);
 
 		pmlmeinfo->state = WIFI_FW_AUTH_NULL | WIFI_FW_STATION_STATE;
-	} else if (caps&WLAN_CAPABILITY_IBSS) { /* adhoc client */
+	} else if (caps & WLAN_CAPABILITY_IBSS) { /* adhoc client */
 		set_msr(padapter, WIFI_FW_ADHOC_STATE);
 
 		val8 = 0xcf;
@@ -4087,7 +4533,8 @@ void start_clnt_assoc(struct adapter *padapter)
 	set_link_timer(pmlmeext, REASSOC_TO);
 }
 
-unsigned int receive_disconnect(struct adapter *padapter, unsigned char *MacAddr, unsigned short reason)
+unsigned int receive_disconnect(struct adapter *padapter,
+				unsigned char *MacAddr, unsigned short reason)
 {
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
@@ -4096,7 +4543,7 @@ unsigned int receive_disconnect(struct adapter *padapter, unsigned char *MacAddr
 	if (!(!memcmp(MacAddr, get_my_bssid(&pmlmeinfo->network), ETH_ALEN)))
 		return _SUCCESS;
 
-	if ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE) {
+	if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE) {
 		if (pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) {
 			pmlmeinfo->state = WIFI_FW_NULL_STATE;
 			report_del_sta_event(padapter, MacAddr, reason);
@@ -4110,7 +4557,8 @@ unsigned int receive_disconnect(struct adapter *padapter, unsigned char *MacAddr
 	return _SUCCESS;
 }
 
-static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid)
+static void process_80211d(struct adapter *padapter,
+			   struct wlan_bssid_ex *bssid)
 {
 	struct registry_priv *pregistrypriv;
 	struct mlme_ext_priv *pmlmeext;
@@ -4123,7 +4571,7 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 
 	/*  Adjust channel plan by AP Country IE */
 	if (pregistrypriv->enable80211d &&
-		(!pmlmeext->update_channel_plan_by_ap_done)) {
+	    (!pmlmeext->update_channel_plan_by_ap_done)) {
 		u8 *ie, *p;
 		u32 len;
 		struct rt_channel_plan chplan_ap;
@@ -4133,7 +4581,9 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 		u8 noc; /*  number of channel */
 		u8 j, k;
 
-		ie = rtw_get_ie(bssid->ies + _FIXED_IE_LENGTH_, WLAN_EID_COUNTRY, &len, bssid->ie_length - _FIXED_IE_LENGTH_);
+		ie = rtw_get_ie(bssid->ies + _FIXED_IE_LENGTH_,
+				WLAN_EID_COUNTRY, &len,
+				bssid->ie_length - _FIXED_IE_LENGTH_);
 		if (!ie)
 			return;
 		if (len < 6)
@@ -4157,7 +4607,7 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 				if (fcn <= 14)
 					channel = fcn + j; /*  2.4 GHz */
 				else
-					channel = fcn + j*4; /*  5 GHz */
+					channel = fcn + j * 4; /*  5 GHz */
 
 				chplan_ap.Channel[i++] = channel;
 			}
@@ -4173,26 +4623,33 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 		if (pregistrypriv->wireless_mode & WIRELESS_11G) {
 			do {
 				if ((i == MAX_CHANNEL_NUM) ||
-					(chplan_sta[i].ChannelNum == 0) ||
-					(chplan_sta[i].ChannelNum > 14))
+				    (chplan_sta[i].ChannelNum == 0) ||
+				    (chplan_sta[i].ChannelNum > 14))
 					break;
 
-				if ((j == chplan_ap.Len) || (chplan_ap.Channel[j] > 14))
+				if ((j == chplan_ap.Len) ||
+				    (chplan_ap.Channel[j] > 14))
 					break;
 
-				if (chplan_sta[i].ChannelNum == chplan_ap.Channel[j]) {
-					chplan_new[k].ChannelNum = chplan_ap.Channel[j];
+				if (chplan_sta[i].ChannelNum ==
+				    chplan_ap.Channel[j]) {
+					chplan_new[k].ChannelNum =
+						chplan_ap.Channel[j];
 					chplan_new[k].ScanType = SCAN_ACTIVE;
 					i++;
 					j++;
 					k++;
-				} else if (chplan_sta[i].ChannelNum < chplan_ap.Channel[j]) {
-					chplan_new[k].ChannelNum = chplan_sta[i].ChannelNum;
+				} else if (chplan_sta[i].ChannelNum <
+					   chplan_ap.Channel[j]) {
+					chplan_new[k].ChannelNum =
+						chplan_sta[i].ChannelNum;
 					chplan_new[k].ScanType = SCAN_PASSIVE;
 					i++;
 					k++;
-				} else if (chplan_sta[i].ChannelNum > chplan_ap.Channel[j]) {
-					chplan_new[k].ChannelNum = chplan_ap.Channel[j];
+				} else if (chplan_sta[i].ChannelNum >
+					   chplan_ap.Channel[j]) {
+					chplan_new[k].ChannelNum =
+						chplan_ap.Channel[j];
 					chplan_new[k].ScanType = SCAN_ACTIVE;
 					j++;
 					k++;
@@ -4201,16 +4658,18 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 
 			/*  change AP not support channel to Passive scan */
 			while ((i < MAX_CHANNEL_NUM) &&
-				(chplan_sta[i].ChannelNum != 0) &&
-				(chplan_sta[i].ChannelNum <= 14)) {
-				chplan_new[k].ChannelNum = chplan_sta[i].ChannelNum;
+			       (chplan_sta[i].ChannelNum != 0) &&
+			       (chplan_sta[i].ChannelNum <= 14)) {
+				chplan_new[k].ChannelNum =
+					chplan_sta[i].ChannelNum;
 				chplan_new[k].ScanType = SCAN_PASSIVE;
 				i++;
 				k++;
 			}
 
 			/*  add channel AP supported */
-			while ((j < chplan_ap.Len) && (chplan_ap.Channel[j] <= 14)) {
+			while ((j < chplan_ap.Len) &&
+			       (chplan_ap.Channel[j] <= 14)) {
 				chplan_new[k].ChannelNum = chplan_ap.Channel[j];
 				chplan_new[k].ScanType = SCAN_ACTIVE;
 				j++;
@@ -4219,16 +4678,18 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 		} else {
 			/*  keep original STA 2.4G channel plan */
 			while ((i < MAX_CHANNEL_NUM) &&
-				(chplan_sta[i].ChannelNum != 0) &&
-				(chplan_sta[i].ChannelNum <= 14)) {
-				chplan_new[k].ChannelNum = chplan_sta[i].ChannelNum;
+			       (chplan_sta[i].ChannelNum != 0) &&
+			       (chplan_sta[i].ChannelNum <= 14)) {
+				chplan_new[k].ChannelNum =
+					chplan_sta[i].ChannelNum;
 				chplan_new[k].ScanType = chplan_sta[i].ScanType;
 				i++;
 				k++;
 			}
 
 			/*  skip AP 2.4G channel plan */
-			while ((j < chplan_ap.Len) && (chplan_ap.Channel[j] <= 14))
+			while ((j < chplan_ap.Len) &&
+			       (chplan_ap.Channel[j] <= 14))
 				j++;
 		}
 
@@ -4251,12 +4712,13 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 
 /* Following are the functions to report events */
 
-void report_survey_event(struct adapter *padapter, union recv_frame *precv_frame)
+void report_survey_event(struct adapter *padapter,
+			 union recv_frame *precv_frame)
 {
 	struct cmd_obj *pcmd_obj;
 	u8 *pevtcmd;
 	u32 cmdsz;
-	struct survey_event	*psurvey_evt;
+	struct survey_event *psurvey_evt;
 	struct C2HEvent_Header *pc2h_evt_hdr;
 	struct mlme_ext_priv *pmlmeext;
 	struct cmd_priv *pcmdpriv;
@@ -4287,16 +4749,19 @@ void report_survey_event(struct adapter *padapter, union recv_frame *precv_frame
 	pcmd_obj->parmbuf = pevtcmd;
 
 	pcmd_obj->rsp = NULL;
-	pcmd_obj->rspsz  = 0;
+	pcmd_obj->rspsz = 0;
 
 	pc2h_evt_hdr = (struct C2HEvent_Header *)(pevtcmd);
 	pc2h_evt_hdr->len = sizeof(struct survey_event);
 	pc2h_evt_hdr->ID = GEN_EVT_CODE(_Survey);
 	pc2h_evt_hdr->seq = atomic_inc_return(&pmlmeext->event_seq);
 
-	psurvey_evt = (struct survey_event *)(pevtcmd + sizeof(struct C2HEvent_Header));
+	psurvey_evt = (struct survey_event *)(pevtcmd +
+					      sizeof(struct C2HEvent_Header));
 
-	if (collect_bss_info(padapter, precv_frame, (struct wlan_bssid_ex *)&psurvey_evt->bss) == _FAIL) {
+	if (collect_bss_info(padapter, precv_frame,
+			     (struct wlan_bssid_ex *)&psurvey_evt->bss) ==
+	    _FAIL) {
 		kfree(pcmd_obj);
 		kfree(pevtcmd);
 		return;
@@ -4315,7 +4780,7 @@ void report_surveydone_event(struct adapter *padapter)
 	u8 *pevtcmd;
 	u32 cmdsz;
 	struct surveydone_event *psurveydone_evt;
-	struct C2HEvent_Header	*pc2h_evt_hdr;
+	struct C2HEvent_Header *pc2h_evt_hdr;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 
@@ -4323,7 +4788,8 @@ void report_surveydone_event(struct adapter *padapter)
 	if (!pcmd_obj)
 		return;
 
-	cmdsz = (sizeof(struct surveydone_event) + sizeof(struct C2HEvent_Header));
+	cmdsz = (sizeof(struct surveydone_event) +
+		 sizeof(struct C2HEvent_Header));
 	pevtcmd = kzalloc(cmdsz, GFP_ATOMIC);
 	if (!pevtcmd) {
 		kfree(pcmd_obj);
@@ -4337,14 +4803,16 @@ void report_surveydone_event(struct adapter *padapter)
 	pcmd_obj->parmbuf = pevtcmd;
 
 	pcmd_obj->rsp = NULL;
-	pcmd_obj->rspsz  = 0;
+	pcmd_obj->rspsz = 0;
 
 	pc2h_evt_hdr = (struct C2HEvent_Header *)(pevtcmd);
 	pc2h_evt_hdr->len = sizeof(struct surveydone_event);
 	pc2h_evt_hdr->ID = GEN_EVT_CODE(_SurveyDone);
 	pc2h_evt_hdr->seq = atomic_inc_return(&pmlmeext->event_seq);
 
-	psurveydone_evt = (struct surveydone_event *)(pevtcmd + sizeof(struct C2HEvent_Header));
+	psurveydone_evt =
+		(struct surveydone_event *)(pevtcmd +
+					    sizeof(struct C2HEvent_Header));
 	psurveydone_evt->bss_cnt = pmlmeext->sitesurvey_res.bss_cnt;
 
 	rtw_enqueue_cmd(pcmdpriv, pcmd_obj);
@@ -4355,8 +4823,8 @@ void report_join_res(struct adapter *padapter, int res)
 	struct cmd_obj *pcmd_obj;
 	u8 *pevtcmd;
 	u32 cmdsz;
-	struct joinbss_event		*pjoinbss_evt;
-	struct C2HEvent_Header	*pc2h_evt_hdr;
+	struct joinbss_event *pjoinbss_evt;
+	struct C2HEvent_Header *pc2h_evt_hdr;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
@@ -4379,16 +4847,18 @@ void report_join_res(struct adapter *padapter, int res)
 	pcmd_obj->parmbuf = pevtcmd;
 
 	pcmd_obj->rsp = NULL;
-	pcmd_obj->rspsz  = 0;
+	pcmd_obj->rspsz = 0;
 
 	pc2h_evt_hdr = (struct C2HEvent_Header *)(pevtcmd);
 	pc2h_evt_hdr->len = sizeof(struct joinbss_event);
 	pc2h_evt_hdr->ID = GEN_EVT_CODE(_JoinBss);
 	pc2h_evt_hdr->seq = atomic_inc_return(&pmlmeext->event_seq);
 
-	pjoinbss_evt = (struct joinbss_event *)(pevtcmd + sizeof(struct C2HEvent_Header));
-	memcpy((unsigned char *)(&(pjoinbss_evt->network.network)), &(pmlmeinfo->network), sizeof(struct wlan_bssid_ex));
-	pjoinbss_evt->network.join_res	= pjoinbss_evt->network.aid = res;
+	pjoinbss_evt = (struct joinbss_event *)(pevtcmd +
+						sizeof(struct C2HEvent_Header));
+	memcpy((unsigned char *)(&(pjoinbss_evt->network.network)),
+	       &(pmlmeinfo->network), sizeof(struct wlan_bssid_ex));
+	pjoinbss_evt->network.join_res = pjoinbss_evt->network.aid = res;
 
 	rtw_joinbss_event_prehandle(padapter, (u8 *)&pjoinbss_evt->network);
 
@@ -4400,8 +4870,8 @@ void report_wmm_edca_update(struct adapter *padapter)
 	struct cmd_obj *pcmd_obj;
 	u8 *pevtcmd;
 	u32 cmdsz;
-	struct wmm_event		*pwmm_event;
-	struct C2HEvent_Header	*pc2h_evt_hdr;
+	struct wmm_event *pwmm_event;
+	struct C2HEvent_Header *pc2h_evt_hdr;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 
@@ -4423,28 +4893,30 @@ void report_wmm_edca_update(struct adapter *padapter)
 	pcmd_obj->parmbuf = pevtcmd;
 
 	pcmd_obj->rsp = NULL;
-	pcmd_obj->rspsz  = 0;
+	pcmd_obj->rspsz = 0;
 
 	pc2h_evt_hdr = (struct C2HEvent_Header *)(pevtcmd);
 	pc2h_evt_hdr->len = sizeof(struct wmm_event);
 	pc2h_evt_hdr->ID = GEN_EVT_CODE(_WMM);
 	pc2h_evt_hdr->seq = atomic_inc_return(&pmlmeext->event_seq);
 
-	pwmm_event = (struct wmm_event *)(pevtcmd + sizeof(struct C2HEvent_Header));
+	pwmm_event =
+		(struct wmm_event *)(pevtcmd + sizeof(struct C2HEvent_Header));
 	pwmm_event->wmm = 0;
 
 	rtw_enqueue_cmd(pcmdpriv, pcmd_obj);
 }
 
-void report_del_sta_event(struct adapter *padapter, unsigned char *MacAddr, unsigned short reason)
+void report_del_sta_event(struct adapter *padapter, unsigned char *MacAddr,
+			  unsigned short reason)
 {
 	struct cmd_obj *pcmd_obj;
 	u8 *pevtcmd;
 	u32 cmdsz;
 	struct sta_info *psta;
-	int	mac_id;
-	struct stadel_event			*pdel_sta_evt;
-	struct C2HEvent_Header	*pc2h_evt_hdr;
+	int mac_id;
+	struct stadel_event *pdel_sta_evt;
+	struct C2HEvent_Header *pc2h_evt_hdr;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 
@@ -4466,16 +4938,18 @@ void report_del_sta_event(struct adapter *padapter, unsigned char *MacAddr, unsi
 	pcmd_obj->parmbuf = pevtcmd;
 
 	pcmd_obj->rsp = NULL;
-	pcmd_obj->rspsz  = 0;
+	pcmd_obj->rspsz = 0;
 
 	pc2h_evt_hdr = (struct C2HEvent_Header *)(pevtcmd);
 	pc2h_evt_hdr->len = sizeof(struct stadel_event);
 	pc2h_evt_hdr->ID = GEN_EVT_CODE(_DelSTA);
 	pc2h_evt_hdr->seq = atomic_inc_return(&pmlmeext->event_seq);
 
-	pdel_sta_evt = (struct stadel_event *)(pevtcmd + sizeof(struct C2HEvent_Header));
+	pdel_sta_evt = (struct stadel_event *)(pevtcmd +
+					       sizeof(struct C2HEvent_Header));
 	memcpy((unsigned char *)(&(pdel_sta_evt->macaddr)), MacAddr, ETH_ALEN);
-	memcpy((unsigned char *)(pdel_sta_evt->rsvd), (unsigned char *)(&reason), 2);
+	memcpy((unsigned char *)(pdel_sta_evt->rsvd),
+	       (unsigned char *)(&reason), 2);
 
 	psta = rtw_get_stainfo(&padapter->stapriv, MacAddr);
 	if (psta)
@@ -4488,13 +4962,14 @@ void report_del_sta_event(struct adapter *padapter, unsigned char *MacAddr, unsi
 	rtw_enqueue_cmd(pcmdpriv, pcmd_obj);
 }
 
-void report_add_sta_event(struct adapter *padapter, unsigned char *MacAddr, int cam_idx)
+void report_add_sta_event(struct adapter *padapter, unsigned char *MacAddr,
+			  int cam_idx)
 {
 	struct cmd_obj *pcmd_obj;
 	u8 *pevtcmd;
 	u32 cmdsz;
-	struct stassoc_event		*padd_sta_evt;
-	struct C2HEvent_Header	*pc2h_evt_hdr;
+	struct stassoc_event *padd_sta_evt;
+	struct C2HEvent_Header *pc2h_evt_hdr;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 
@@ -4516,14 +4991,15 @@ void report_add_sta_event(struct adapter *padapter, unsigned char *MacAddr, int
 	pcmd_obj->parmbuf = pevtcmd;
 
 	pcmd_obj->rsp = NULL;
-	pcmd_obj->rspsz  = 0;
+	pcmd_obj->rspsz = 0;
 
 	pc2h_evt_hdr = (struct C2HEvent_Header *)(pevtcmd);
 	pc2h_evt_hdr->len = sizeof(struct stassoc_event);
 	pc2h_evt_hdr->ID = GEN_EVT_CODE(_AddSTA);
 	pc2h_evt_hdr->seq = atomic_inc_return(&pmlmeext->event_seq);
 
-	padd_sta_evt = (struct stassoc_event *)(pevtcmd + sizeof(struct C2HEvent_Header));
+	padd_sta_evt = (struct stassoc_event *)(pevtcmd +
+						sizeof(struct C2HEvent_Header));
 	memcpy((unsigned char *)(&(padd_sta_evt->macaddr)), MacAddr, ETH_ALEN);
 	padd_sta_evt->cam_id = cam_idx;
 
@@ -4548,12 +5024,17 @@ void update_sta_info(struct adapter *padapter, struct sta_info *psta)
 
 		psta->htpriv.ampdu_enable = pmlmepriv->htpriv.ampdu_enable;
 
-		psta->htpriv.rx_ampdu_min_spacing = (pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para&IEEE80211_HT_CAP_AMPDU_DENSITY)>>2;
+		psta->htpriv.rx_ampdu_min_spacing =
+			(pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para &
+			 IEEE80211_HT_CAP_AMPDU_DENSITY) >>
+			2;
 
-		if (support_short_GI(padapter, &(pmlmeinfo->HT_caps), CHANNEL_WIDTH_20))
+		if (support_short_GI(padapter, &(pmlmeinfo->HT_caps),
+				     CHANNEL_WIDTH_20))
 			psta->htpriv.sgi_20m = true;
 
-		if (support_short_GI(padapter, &(pmlmeinfo->HT_caps), CHANNEL_WIDTH_40))
+		if (support_short_GI(padapter, &(pmlmeinfo->HT_caps),
+				     CHANNEL_WIDTH_40))
 			psta->htpriv.sgi_40m = true;
 
 		psta->qos_option = true;
@@ -4562,7 +5043,8 @@ void update_sta_info(struct adapter *padapter, struct sta_info *psta)
 		psta->htpriv.stbc_cap = pmlmepriv->htpriv.stbc_cap;
 		psta->htpriv.beamform_cap = pmlmepriv->htpriv.beamform_cap;
 
-		memcpy(&psta->htpriv.ht_cap, &pmlmeinfo->HT_caps, sizeof(struct ieee80211_ht_cap));
+		memcpy(&psta->htpriv.ht_cap, &pmlmeinfo->HT_caps,
+		       sizeof(struct ieee80211_ht_cap));
 	} else {
 		psta->htpriv.ht_option = false;
 
@@ -4575,8 +5057,8 @@ void update_sta_info(struct adapter *padapter, struct sta_info *psta)
 
 	psta->htpriv.ch_offset = pmlmeext->cur_ch_offset;
 
-	psta->htpriv.agg_enable_bitmap = 0x0;/* reset */
-	psta->htpriv.candidate_tid_bitmap = 0x0;/* reset */
+	psta->htpriv.agg_enable_bitmap = 0x0; /* reset */
+	psta->htpriv.candidate_tid_bitmap = 0x0; /* reset */
 
 	psta->bw_mode = pmlmeext->cur_bwmode;
 
@@ -4596,7 +5078,8 @@ static void rtw_mlmeext_disconnect(struct adapter *padapter)
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
-	struct wlan_bssid_ex		*pnetwork = (struct wlan_bssid_ex *)(&(pmlmeinfo->network));
+	struct wlan_bssid_ex *pnetwork =
+		(struct wlan_bssid_ex *)(&(pmlmeinfo->network));
 
 	/* set_opmode_cmd(padapter, infra_client_with_mlme); */
 
@@ -4609,7 +5092,8 @@ static void rtw_mlmeext_disconnect(struct adapter *padapter)
 	{
 		struct sta_info *psta;
 
-		psta = rtw_get_stainfo(&padapter->stapriv, get_my_bssid(pnetwork));
+		psta = rtw_get_stainfo(&padapter->stapriv,
+				       get_my_bssid(pnetwork));
 		if (psta)
 			rtw_hal_macid_wakeup(padapter, psta->mac_id);
 	}
@@ -4626,7 +5110,8 @@ static void rtw_mlmeext_disconnect(struct adapter *padapter)
 	pmlmeext->cur_bwmode = CHANNEL_WIDTH_20;
 	pmlmeext->cur_ch_offset = HAL_PRIME_CHNL_OFFSET_DONT_CARE;
 
-	set_channel_bwmode(padapter, pmlmeext->cur_channel, pmlmeext->cur_ch_offset, pmlmeext->cur_bwmode);
+	set_channel_bwmode(padapter, pmlmeext->cur_channel,
+			   pmlmeext->cur_ch_offset, pmlmeext->cur_bwmode);
 
 	flush_all_cam_entry(padapter);
 
@@ -4640,20 +5125,21 @@ void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
 {
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
-	struct wlan_bssid_ex		*cur_network = &(pmlmeinfo->network);
+	struct wlan_bssid_ex *cur_network = &(pmlmeinfo->network);
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	u8 join_type;
 	struct sta_info *psta;
 
 	if (join_res < 0) {
 		join_type = 1;
-		rtw_hal_set_hwreg(padapter, HW_VAR_MLME_JOIN, (u8 *)(&join_type));
+		rtw_hal_set_hwreg(padapter, HW_VAR_MLME_JOIN,
+				  (u8 *)(&join_type));
 		rtw_hal_set_hwreg(padapter, HW_VAR_BSSID, null_addr);
 
 		return;
 	}
 
-	if ((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE)
+	if ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE)
 		/* update bc/mc sta_info */
 		update_bmc_sta(padapter);
 
@@ -4663,10 +5149,12 @@ void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
 	/*  update IOT-related issue */
 	update_IOT_info(padapter);
 
-	rtw_hal_set_hwreg(padapter, HW_VAR_BASIC_RATE, cur_network->supported_rates);
+	rtw_hal_set_hwreg(padapter, HW_VAR_BASIC_RATE,
+			  cur_network->supported_rates);
 
 	/* BCN interval */
-	rtw_hal_set_hwreg(padapter, HW_VAR_BEACON_INTERVAL, (u8 *)(&pmlmeinfo->bcn_interval));
+	rtw_hal_set_hwreg(padapter, HW_VAR_BEACON_INTERVAL,
+			  (u8 *)(&pmlmeinfo->bcn_interval));
 
 	/* update capability */
 	update_capinfo(padapter, pmlmeinfo->capability);
@@ -4678,7 +5166,8 @@ void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
 	HTOnAssocRsp(padapter);
 
 	/* Set cur_channel&cur_bwmode&cur_ch_offset */
-	set_channel_bwmode(padapter, pmlmeext->cur_channel, pmlmeext->cur_ch_offset, pmlmeext->cur_bwmode);
+	set_channel_bwmode(padapter, pmlmeext->cur_channel,
+			   pmlmeext->cur_ch_offset, pmlmeext->cur_bwmode);
 
 	psta = rtw_get_stainfo(pstapriv, cur_network->mac_address);
 	if (psta) { /* only for infra. mode */
@@ -4702,7 +5191,7 @@ void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
 	join_type = 2;
 	rtw_hal_set_hwreg(padapter, HW_VAR_MLME_JOIN, (u8 *)(&join_type));
 
-	if ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE) {
+	if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE) {
 		/*  correcting TSF */
 		correct_TSF(padapter, pmlmeext);
 
@@ -4713,14 +5202,16 @@ void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
 }
 
 /* currently only adhoc mode will go here */
-void mlmeext_sta_add_event_callback(struct adapter *padapter, struct sta_info *psta)
+void mlmeext_sta_add_event_callback(struct adapter *padapter,
+				    struct sta_info *psta)
 {
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u8 join_type;
 
-	if ((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE) {
-		if (pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) { /* adhoc master or sta_count>1 */
+	if ((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE) {
+		if (pmlmeinfo->state &
+		    WIFI_FW_ASSOC_SUCCESS) { /* adhoc master or sta_count>1 */
 
 			/* nothing to do */
 		} else { /* adhoc client */
@@ -4743,13 +5234,17 @@ void mlmeext_sta_add_event_callback(struct adapter *padapter, struct sta_info *p
 		}
 
 		join_type = 2;
-		rtw_hal_set_hwreg(padapter, HW_VAR_MLME_JOIN, (u8 *)(&join_type));
+		rtw_hal_set_hwreg(padapter, HW_VAR_MLME_JOIN,
+				  (u8 *)(&join_type));
 	}
 
 	pmlmeinfo->FW_sta_info[psta->mac_id].psta = psta;
 
-	psta->bssratelen = rtw_get_rateset_len(pmlmeinfo->FW_sta_info[psta->mac_id].SupportedRates);
-	memcpy(psta->bssrateset, pmlmeinfo->FW_sta_info[psta->mac_id].SupportedRates, psta->bssratelen);
+	psta->bssratelen = rtw_get_rateset_len(
+		pmlmeinfo->FW_sta_info[psta->mac_id].SupportedRates);
+	memcpy(psta->bssrateset,
+	       pmlmeinfo->FW_sta_info[psta->mac_id].SupportedRates,
+	       psta->bssratelen);
 
 	/* update adhoc sta_info */
 	update_sta_info(padapter, psta);
@@ -4757,7 +5252,8 @@ void mlmeext_sta_add_event_callback(struct adapter *padapter, struct sta_info *p
 	rtw_hal_update_sta_rate_mask(padapter, psta);
 
 	/*  ToDo: HT for Ad-hoc */
-	psta->wireless_mode = rtw_check_network_type(psta->bssrateset, pmlmeext->cur_channel);
+	psta->wireless_mode =
+		rtw_check_network_type(psta->bssrateset, pmlmeext->cur_channel);
 	psta->raid = networktype_to_raid_ex(padapter, psta);
 
 	/* rate radaptive */
@@ -4775,13 +5271,13 @@ void mlmeext_sta_del_event_callback(struct adapter *padapter)
 void _linked_info_dump(struct adapter *padapter)
 {
 	int i;
-	struct mlme_ext_priv    *pmlmeext = &padapter->mlmeextpriv;
-	struct mlme_ext_info    *pmlmeinfo = &pmlmeext->mlmext_info;
+	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
+	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	int UndecoratedSmoothedPWDB;
 	struct dvobj_priv *pdvobj = adapter_to_dvobj(padapter);
 
-	if (padapter->bLinkInfoDump) {
-		if ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE)
+	if (padapter->link_info_dump) {
+		if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE)
 			rtw_hal_get_def_var(padapter,
 					    HAL_DEF_UNDERCORATEDSMOOTHEDPWDB,
 					    &UndecoratedSmoothedPWDB);
@@ -4790,7 +5286,9 @@ void _linked_info_dump(struct adapter *padapter)
 			if (pdvobj->macid[i]) {
 				if (i != 1) /* skip bc/mc sta */
 					/*   tx info ============ */
-					rtw_hal_get_def_var(padapter, HW_DEF_RA_INFO_DUMP, &i);
+					rtw_hal_get_def_var(padapter,
+							    HW_DEF_RA_INFO_DUMP,
+							    &i);
 			}
 		}
 	}
@@ -4800,10 +5298,9 @@ static u8 chk_ap_is_alive(struct adapter *padapter, struct sta_info *psta)
 {
 	u8 ret = false;
 
-	if ((sta_rx_data_pkts(psta) == sta_last_rx_data_pkts(psta))
-		&& sta_rx_beacon_pkts(psta) == sta_last_rx_beacon_pkts(psta)
-		&& sta_rx_probersp_pkts(psta) == sta_last_rx_probersp_pkts(psta)
-	) {
+	if ((sta_rx_data_pkts(psta) == sta_last_rx_data_pkts(psta)) &&
+	    sta_rx_beacon_pkts(psta) == sta_last_rx_beacon_pkts(psta) &&
+	    sta_rx_probersp_pkts(psta) == sta_last_rx_probersp_pkts(psta)) {
 		ret = false;
 	} else {
 		ret = true;
@@ -4830,18 +5327,19 @@ void linked_status_chk(struct adapter *padapter)
 		int rx_chk_limit;
 		int link_count_limit;
 
-		#if defined(DBG_ROAMING_TEST)
+#if defined(DBG_ROAMING_TEST)
 		rx_chk_limit = 1;
-		#else
+#else
 		rx_chk_limit = 8;
-		#endif
+#endif
 		link_count_limit = 7; /*  16 sec */
 
 		/*  Marked by Kurt 20130715 */
 		/*  For WiDi 3.5 and latered on, they don't ask WiDi sink to do roaming, */
 		/* so we could not check rx limit that strictly. */
 		/*  todo: To check why we under miracast session, rx_chk would be false */
-		psta = rtw_get_stainfo(pstapriv, pmlmeinfo->network.mac_address);
+		psta = rtw_get_stainfo(pstapriv,
+				       pmlmeinfo->network.mac_address);
 		if (psta) {
 			if (!chk_ap_is_alive(padapter, psta))
 				rx_chk = _FAIL;
@@ -4852,34 +5350,44 @@ void linked_status_chk(struct adapter *padapter)
 			{
 				if (rx_chk != _SUCCESS) {
 					if (pmlmeext->retry == 0) {
-						issue_probereq_ex(padapter,
-								  &pmlmeinfo->network.ssid,
-								  pmlmeinfo->network.mac_address,
-								  0, 0, 0, 0);
-						issue_probereq_ex(padapter,
-								  &pmlmeinfo->network.ssid,
-								  pmlmeinfo->network.mac_address,
-								  0, 0, 0, 0);
-						issue_probereq_ex(padapter,
-								  &pmlmeinfo->network.ssid,
-								  pmlmeinfo->network.mac_address,
-								  0, 0, 0, 0);
+						issue_probereq_ex(
+							padapter,
+							&pmlmeinfo->network.ssid,
+							pmlmeinfo->network
+								.mac_address,
+							0, 0, 0, 0);
+						issue_probereq_ex(
+							padapter,
+							&pmlmeinfo->network.ssid,
+							pmlmeinfo->network
+								.mac_address,
+							0, 0, 0, 0);
+						issue_probereq_ex(
+							padapter,
+							&pmlmeinfo->network.ssid,
+							pmlmeinfo->network
+								.mac_address,
+							0, 0, 0, 0);
 					}
 				}
 
 				if (tx_chk != _SUCCESS &&
 				    pmlmeinfo->link_count++ == link_count_limit)
-					tx_chk = issue_nulldata_in_interrupt(padapter, NULL);
+					tx_chk = issue_nulldata_in_interrupt(
+						padapter, NULL);
 			}
 
 			if (rx_chk == _FAIL) {
 				pmlmeext->retry++;
 				if (pmlmeext->retry > rx_chk_limit) {
 					netdev_dbg(padapter->pnetdev,
-						   FUNC_ADPT_FMT " disconnect or roaming\n",
+						   FUNC_ADPT_FMT
+						   " disconnect or roaming\n",
 						   FUNC_ADPT_ARG(padapter));
-					receive_disconnect(padapter, pmlmeinfo->network.mac_address
-						, WLAN_REASON_EXPIRATION_CHK);
+					receive_disconnect(
+						padapter,
+						pmlmeinfo->network.mac_address,
+						WLAN_REASON_EXPIRATION_CHK);
 					return;
 				}
 			} else {
@@ -4904,19 +5412,26 @@ void linked_status_chk(struct adapter *padapter)
 				if (psta == NULL)
 					continue;
 
-				if (pmlmeinfo->FW_sta_info[i].rx_pkt == sta_rx_pkts(psta)) {
-					if (pmlmeinfo->FW_sta_info[i].retry < 3) {
-						pmlmeinfo->FW_sta_info[i].retry++;
+				if (pmlmeinfo->FW_sta_info[i].rx_pkt ==
+				    sta_rx_pkts(psta)) {
+					if (pmlmeinfo->FW_sta_info[i].retry <
+					    3) {
+						pmlmeinfo->FW_sta_info[i]
+							.retry++;
 					} else {
-						pmlmeinfo->FW_sta_info[i].retry = 0;
-						pmlmeinfo->FW_sta_info[i].status = 0;
-						report_del_sta_event(padapter, psta->hwaddr
-							, 65535/*  indicate disconnect caused by no rx */
+						pmlmeinfo->FW_sta_info[i].retry =
+							0;
+						pmlmeinfo->FW_sta_info[i]
+							.status = 0;
+						report_del_sta_event(
+							padapter, psta->hwaddr,
+							65535 /*  indicate disconnect caused by no rx */
 						);
 					}
 				} else {
 					pmlmeinfo->FW_sta_info[i].retry = 0;
-					pmlmeinfo->FW_sta_info[i].rx_pkt = (u32)sta_rx_pkts(psta);
+					pmlmeinfo->FW_sta_info[i].rx_pkt =
+						(u32)sta_rx_pkts(psta);
 				}
 			}
 		}
@@ -4929,20 +5444,21 @@ void survey_timer_hdl(struct timer_list *t)
 {
 	struct adapter *padapter =
 		timer_container_of(padapter, t, mlmeextpriv.survey_timer);
-	struct cmd_obj	*ph2c;
-	struct sitesurvey_parm	*psurveyPara;
+	struct cmd_obj *ph2c;
+	struct sitesurvey_parm *psurveyPara;
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 
 	/* issue rtw_sitesurvey_cmd */
 	if (pmlmeext->sitesurvey_res.state > SCAN_START) {
-		if (pmlmeext->sitesurvey_res.state ==  SCAN_PROCESS)
+		if (pmlmeext->sitesurvey_res.state == SCAN_PROCESS)
 			pmlmeext->sitesurvey_res.channel_idx++;
 
 		if (pmlmeext->scan_abort) {
-			pmlmeext->sitesurvey_res.channel_idx = pmlmeext->sitesurvey_res.ch_num;
+			pmlmeext->sitesurvey_res.channel_idx =
+				pmlmeext->sitesurvey_res.ch_num;
 
-			pmlmeext->scan_abort = false;/* reset */
+			pmlmeext->scan_abort = false; /* reset */
 		}
 
 		ph2c = kzalloc_obj(*ph2c, GFP_ATOMIC);
@@ -4955,7 +5471,8 @@ void survey_timer_hdl(struct timer_list *t)
 			return;
 		}
 
-		init_h2fwcmd_w_parm_no_rsp(ph2c, psurveyPara, GEN_CMD_CODE(_SiteSurvey));
+		init_h2fwcmd_w_parm_no_rsp(ph2c, psurveyPara,
+					   GEN_CMD_CODE(_SiteSurvey));
 		rtw_enqueue_cmd(pcmdpriv, ph2c);
 	}
 }
@@ -5044,8 +5561,9 @@ u8 setopmode_hdl(struct adapter *padapter, u8 *pbuf)
 		type = _HW_STATE_AP_;
 		/* start_ap_mode(padapter); */
 	} else if (psetop->mode == Ndis802_11Infrastructure) {
-		pmlmeinfo->state &= ~(BIT(0) | BIT(1));/*  clear state */
-		pmlmeinfo->state |= WIFI_FW_STATION_STATE;/* set to	STATION_STATE */
+		pmlmeinfo->state &= ~(BIT(0) | BIT(1)); /*  clear state */
+		pmlmeinfo->state |=
+			WIFI_FW_STATION_STATE; /* set to	STATION_STATE */
 		type = _HW_STATE_STATION_;
 	} else if (psetop->mode == Ndis802_11IBSS) {
 		type = _HW_STATE_ADHOC_;
@@ -5069,7 +5587,8 @@ u8 createbss_hdl(struct adapter *padapter, u8 *pbuf)
 {
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
-	struct wlan_bssid_ex	*pnetwork = (struct wlan_bssid_ex *)(&(pmlmeinfo->network));
+	struct wlan_bssid_ex *pnetwork =
+		(struct wlan_bssid_ex *)(&(pmlmeinfo->network));
 	struct joinbss_parm *pparm = (struct joinbss_parm *)pbuf;
 	/* u32 initialgain; */
 
@@ -5106,13 +5625,15 @@ u8 createbss_hdl(struct adapter *padapter, u8 *pbuf)
 		/* clear CAM */
 		flush_all_cam_entry(padapter);
 
-		memcpy(pnetwork, pbuf, offsetof(struct wlan_bssid_ex, ie_length));
+		memcpy(pnetwork, pbuf,
+		       offsetof(struct wlan_bssid_ex, ie_length));
 		pnetwork->ie_length = ((struct wlan_bssid_ex *)pbuf)->ie_length;
 
-		if (pnetwork->ie_length > MAX_IE_SZ)/* Check pbuf->ie_length */
+		if (pnetwork->ie_length > MAX_IE_SZ) /* Check pbuf->ie_length */
 			return H2C_PARAMETERS_ERROR;
 
-		memcpy(pnetwork->ies, ((struct wlan_bssid_ex *)pbuf)->ies, pnetwork->ie_length);
+		memcpy(pnetwork->ies, ((struct wlan_bssid_ex *)pbuf)->ies,
+		       pnetwork->ie_length);
 
 		start_create_ibss(padapter);
 	}
@@ -5127,7 +5648,8 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 	struct registry_priv *pregpriv = &padapter->registrypriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
-	struct wlan_bssid_ex		*pnetwork = (struct wlan_bssid_ex *)(&(pmlmeinfo->network));
+	struct wlan_bssid_ex *pnetwork =
+		(struct wlan_bssid_ex *)(&(pmlmeinfo->network));
 	u32 i;
 	u8 cbw40_enable = 0;
 	/* u32 initialgain; */
@@ -5137,7 +5659,8 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 	/* check already connecting to AP or not */
 	if (pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) {
 		if (pmlmeinfo->state & WIFI_FW_STATION_STATE)
-			issue_deauth_ex(padapter, pnetwork->mac_address, WLAN_REASON_DEAUTH_LEAVING, 1, 100);
+			issue_deauth_ex(padapter, pnetwork->mac_address,
+					WLAN_REASON_DEAUTH_LEAVING, 1, 100);
 		pmlmeinfo->state = WIFI_FW_NULL_STATE;
 
 		/* clear CAM */
@@ -5170,10 +5693,11 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 	memcpy(pnetwork, pbuf, offsetof(struct wlan_bssid_ex, ie_length));
 	pnetwork->ie_length = ((struct wlan_bssid_ex *)pbuf)->ie_length;
 
-	if (pnetwork->ie_length > MAX_IE_SZ)/* Check pbuf->ie_length */
+	if (pnetwork->ie_length > MAX_IE_SZ) /* Check pbuf->ie_length */
 		return H2C_PARAMETERS_ERROR;
 
-	memcpy(pnetwork->ies, ((struct wlan_bssid_ex *)pbuf)->ies, pnetwork->ie_length);
+	memcpy(pnetwork->ies, ((struct wlan_bssid_ex *)pbuf)->ies,
+	       pnetwork->ie_length);
 
 	pmlmeext->cur_channel = (u8)pnetwork->configuration.ds_config;
 	pmlmeinfo->bcn_interval = get_beacon_interval(pnetwork);
@@ -5186,42 +5710,49 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 		pIE = (struct ndis_80211_var_ie *)(pnetwork->ies + i);
 
 		switch (pIE->element_id) {
-		case WLAN_EID_VENDOR_SPECIFIC:/* Get WMM IE. */
+		case WLAN_EID_VENDOR_SPECIFIC: /* Get WMM IE. */
 			if (!memcmp(pIE->data, WMM_OUI, 4))
 				WMM_param_handler(padapter, pIE);
 			break;
 
-		case WLAN_EID_HT_CAPABILITY:	/* Get HT Cap IE. */
+		case WLAN_EID_HT_CAPABILITY: /* Get HT Cap IE. */
 			pmlmeinfo->HT_caps_enable = 1;
 			break;
 
-		case WLAN_EID_HT_OPERATION:	/* Get HT Info IE. */
+		case WLAN_EID_HT_OPERATION: /* Get HT Info IE. */
 			pmlmeinfo->HT_info_enable = 1;
 
 			/* spec case only for cisco's ap because cisco's ap issue assoc rsp using mcs rate @40MHz or @20MHz */
 			{
-				struct HT_info_element *pht_info = (struct HT_info_element *)(pIE->data);
+				struct HT_info_element *pht_info =
+					(struct HT_info_element *)(pIE->data);
 
 				if (pnetwork->configuration.ds_config <= 14) {
-					if ((pregpriv->bw_mode & 0x0f) > CHANNEL_WIDTH_20)
+					if ((pregpriv->bw_mode & 0x0f) >
+					    CHANNEL_WIDTH_20)
 						cbw40_enable = 1;
 				}
 
-				if ((cbw40_enable) && (pht_info->infos[0] & BIT(2))) {
+				if ((cbw40_enable) &&
+				    (pht_info->infos[0] & BIT(2))) {
 					/* switch to the 40M Hz mode according to the AP */
 					pmlmeext->cur_bwmode = CHANNEL_WIDTH_40;
 					switch (pht_info->infos[0] & 0x3) {
 					case 1:
-						pmlmeext->cur_ch_offset = HAL_PRIME_CHNL_OFFSET_LOWER;
+						pmlmeext->cur_ch_offset =
+							HAL_PRIME_CHNL_OFFSET_LOWER;
 						break;
 
 					case 3:
-						pmlmeext->cur_ch_offset = HAL_PRIME_CHNL_OFFSET_UPPER;
+						pmlmeext->cur_ch_offset =
+							HAL_PRIME_CHNL_OFFSET_UPPER;
 						break;
 
 					default:
-						pmlmeext->cur_ch_offset = HAL_PRIME_CHNL_OFFSET_DONT_CARE;
-						pmlmeext->cur_bwmode = CHANNEL_WIDTH_20;
+						pmlmeext->cur_ch_offset =
+							HAL_PRIME_CHNL_OFFSET_DONT_CARE;
+						pmlmeext->cur_bwmode =
+							CHANNEL_WIDTH_20;
 						break;
 					}
 				}
@@ -5247,7 +5778,8 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 	/* initialgain = 0x1E; */
 	/* rtw_hal_set_hwreg(padapter, HW_VAR_INITIAL_GAIN, (u8 *)(&initialgain)); */
 
-	rtw_hal_set_hwreg(padapter, HW_VAR_BSSID, pmlmeinfo->network.mac_address);
+	rtw_hal_set_hwreg(padapter, HW_VAR_BSSID,
+			  pmlmeinfo->network.mac_address);
 	join_type = 0;
 	rtw_hal_set_hwreg(padapter, HW_VAR_MLME_JOIN, (u8 *)(&join_type));
 	rtw_hal_set_hwreg(padapter, HW_VAR_DO_IQK, NULL);
@@ -5267,13 +5799,17 @@ u8 disconnect_hdl(struct adapter *padapter, unsigned char *pbuf)
 	struct disconnect_parm *param = (struct disconnect_parm *)pbuf;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
-	struct wlan_bssid_ex		*pnetwork = (struct wlan_bssid_ex *)(&(pmlmeinfo->network));
+	struct wlan_bssid_ex *pnetwork =
+		(struct wlan_bssid_ex *)(&(pmlmeinfo->network));
 	u8 val8;
 
 	if (is_client_associated_to_ap(padapter))
-		issue_deauth_ex(padapter, pnetwork->mac_address, WLAN_REASON_DEAUTH_LEAVING, param->deauth_timeout_ms/100, 100);
+		issue_deauth_ex(padapter, pnetwork->mac_address,
+				WLAN_REASON_DEAUTH_LEAVING,
+				param->deauth_timeout_ms / 100, 100);
 
-	if (((pmlmeinfo->state&0x03) == WIFI_FW_ADHOC_STATE) || ((pmlmeinfo->state&0x03) == WIFI_FW_AP_STATE)) {
+	if (((pmlmeinfo->state & 0x03) == WIFI_FW_ADHOC_STATE) ||
+	    ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)) {
 		/* Stop BCN */
 		val8 = 0;
 		rtw_hal_set_hwreg(padapter, HW_VAR_BCN_FUNC, (u8 *)(&val8));
@@ -5283,36 +5819,41 @@ u8 disconnect_hdl(struct adapter *padapter, unsigned char *pbuf)
 
 	rtw_free_uc_swdec_pending_queue(padapter);
 
-	return	H2C_SUCCESS;
+	return H2C_SUCCESS;
 }
 
-static int rtw_scan_ch_decision(struct adapter *padapter, struct rtw_ieee80211_channel *out,
-	u32 out_num, struct rtw_ieee80211_channel *in, u32 in_num)
+static int rtw_scan_ch_decision(struct adapter *padapter,
+				struct rtw_ieee80211_channel *out, u32 out_num,
+				struct rtw_ieee80211_channel *in, u32 in_num)
 {
 	int i, j;
 	int set_idx;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 
 	/* clear first */
-	memset(out, 0, sizeof(struct rtw_ieee80211_channel)*out_num);
+	memset(out, 0, sizeof(struct rtw_ieee80211_channel) * out_num);
 
 	/* acquire channels from in */
 	j = 0;
 	for (i = 0; i < in_num; i++) {
-		set_idx = rtw_ch_set_search_ch(pmlmeext->channel_set, in[i].hw_value);
-		if (in[i].hw_value && !(in[i].flags & RTW_IEEE80211_CHAN_DISABLED)
-			&& set_idx >= 0
-		) {
+		set_idx = rtw_ch_set_search_ch(pmlmeext->channel_set,
+					       in[i].hw_value);
+		if (in[i].hw_value &&
+		    !(in[i].flags & RTW_IEEE80211_CHAN_DISABLED) &&
+		    set_idx >= 0) {
 			if (j >= out_num) {
 				netdev_dbg(padapter->pnetdev,
-					   FUNC_ADPT_FMT " out_num:%u not enough\n",
+					   FUNC_ADPT_FMT
+					   " out_num:%u not enough\n",
 					   FUNC_ADPT_ARG(padapter), out_num);
 				break;
 			}
 
-			memcpy(&out[j], &in[i], sizeof(struct rtw_ieee80211_channel));
+			memcpy(&out[j], &in[i],
+			       sizeof(struct rtw_ieee80211_channel));
 
-			if (pmlmeext->channel_set[set_idx].ScanType == SCAN_PASSIVE)
+			if (pmlmeext->channel_set[set_idx].ScanType ==
+			    SCAN_PASSIVE)
 				out[j].flags |= RTW_IEEE80211_CHAN_PASSIVE_SCAN;
 
 			j++;
@@ -5326,9 +5867,9 @@ static int rtw_scan_ch_decision(struct adapter *padapter, struct rtw_ieee80211_c
 		for (i = 0; i < pmlmeext->max_chan_nums; i++) {
 			if (j >= out_num) {
 				netdev_dbg(padapter->pnetdev,
-					   FUNC_ADPT_FMT " out_num:%u not enough\n",
-					   FUNC_ADPT_ARG(padapter),
-					   out_num);
+					   FUNC_ADPT_FMT
+					   " out_num:%u not enough\n",
+					   FUNC_ADPT_ARG(padapter), out_num);
 				break;
 			}
 
@@ -5347,7 +5888,7 @@ static int rtw_scan_ch_decision(struct adapter *padapter, struct rtw_ieee80211_c
 u8 sitesurvey_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 {
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
-	struct sitesurvey_parm	*pparm = (struct sitesurvey_parm *)pbuf;
+	struct sitesurvey_parm *pparm = (struct sitesurvey_parm *)pbuf;
 	u8 bdelayscan = false;
 	u8 val8;
 	u32 initialgain;
@@ -5361,19 +5902,18 @@ u8 sitesurvey_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 		for (i = 0; i < RTW_SSID_SCAN_AMOUNT; i++) {
 			if (pparm->ssid[i].ssid_length) {
 				memcpy(pmlmeext->sitesurvey_res.ssid[i].ssid,
-				       pparm->ssid[i].ssid,
-				       IW_ESSID_MAX_SIZE);
+				       pparm->ssid[i].ssid, IW_ESSID_MAX_SIZE);
 				pmlmeext->sitesurvey_res.ssid[i].ssid_length =
 					pparm->ssid[i].ssid_length;
 			} else {
-				pmlmeext->sitesurvey_res.ssid[i].ssid_length = 0;
+				pmlmeext->sitesurvey_res.ssid[i].ssid_length =
+					0;
 			}
 		}
 
-		pmlmeext->sitesurvey_res.ch_num = rtw_scan_ch_decision(padapter
-			, pmlmeext->sitesurvey_res.ch, RTW_CHANNEL_SCAN_AMOUNT
-			, pparm->ch, pparm->ch_num
-		);
+		pmlmeext->sitesurvey_res.ch_num = rtw_scan_ch_decision(
+			padapter, pmlmeext->sitesurvey_res.ch,
+			RTW_CHANNEL_SCAN_AMOUNT, pparm->ch, pparm->ch_num);
 
 		pmlmeext->sitesurvey_res.scan_mode = pparm->scan_mode;
 
@@ -5403,13 +5943,15 @@ u8 sitesurvey_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 		 */
 		initialgain = 0x1e;
 
-		rtw_hal_set_hwreg(padapter, HW_VAR_INITIAL_GAIN, (u8 *)(&initialgain));
+		rtw_hal_set_hwreg(padapter, HW_VAR_INITIAL_GAIN,
+				  (u8 *)(&initialgain));
 
 		/* set MSR to no link state */
 		set_msr(padapter, _HW_STATE_NOLINK_);
 
 		val8 = 1; /* under site survey */
-		rtw_hal_set_hwreg(padapter, HW_VAR_MLME_SITESURVEY, (u8 *)(&val8));
+		rtw_hal_set_hwreg(padapter, HW_VAR_MLME_SITESURVEY,
+				  (u8 *)(&val8));
 
 		pmlmeext->sitesurvey_res.state = SCAN_PROCESS;
 	}
@@ -5421,24 +5963,24 @@ u8 sitesurvey_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 
 u8 setauth_hdl(struct adapter *padapter, unsigned char *pbuf)
 {
-	struct setauth_parm		*pparm = (struct setauth_parm *)pbuf;
+	struct setauth_parm *pparm = (struct setauth_parm *)pbuf;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
 	if (pparm->mode < 4)
 		pmlmeinfo->auth_algo = pparm->mode;
 
-	return	H2C_SUCCESS;
+	return H2C_SUCCESS;
 }
 
 u8 setkey_hdl(struct adapter *padapter, u8 *pbuf)
 {
 	u16 ctrl = 0;
 	s16 cam_id = 0;
-	struct setkey_parm		*pparm = (struct setkey_parm *)pbuf;
+	struct setkey_parm *pparm = (struct setkey_parm *)pbuf;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
-	unsigned char null_addr[] = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00};
+	unsigned char null_addr[] = { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
 	u8 *addr;
 
 	/* main tx key for wep. */
@@ -5454,12 +5996,14 @@ u8 setkey_hdl(struct adapter *padapter, u8 *pbuf)
 		else
 			addr = null_addr;
 
-		ctrl = BIT(15) | BIT(6) | ((pparm->algorithm) << 2) | pparm->keyid;
+		ctrl = BIT(15) | BIT(6) | ((pparm->algorithm) << 2) |
+		       pparm->keyid;
 		write_cam(padapter, cam_id, ctrl, addr, pparm->key);
-		netdev_dbg(padapter->pnetdev,
-			   "set group key camid:%d, addr:%pM, kid:%d, type:%s\n",
-			   cam_id, addr, pparm->keyid,
-			   security_type_str(pparm->algorithm));
+		netdev_dbg(
+			padapter->pnetdev,
+			"set group key camid:%d, addr:%pM, kid:%d, type:%s\n",
+			cam_id, addr, pparm->keyid,
+			security_type_str(pparm->algorithm));
 	}
 
 	if (cam_id >= 0 && cam_id <= 3)
@@ -5478,7 +6022,7 @@ u8 set_stakey_hdl(struct adapter *padapter, u8 *pbuf)
 	u8 ret = H2C_SUCCESS;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
-	struct set_stakey_parm	*pparm = (struct set_stakey_parm *)pbuf;
+	struct set_stakey_parm *pparm = (struct set_stakey_parm *)pbuf;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct sta_info *psta;
 
@@ -5500,7 +6044,8 @@ u8 set_stakey_hdl(struct adapter *padapter, u8 *pbuf)
 
 write_to_cam:
 	if (pparm->algorithm == _NO_PRIVACY_) {
-		while ((cam_id = rtw_camid_search(padapter, pparm->addr, -1)) >= 0) {
+		while ((cam_id = rtw_camid_search(padapter, pparm->addr, -1)) >=
+		       0) {
 			netdev_dbg(padapter->pnetdev,
 				   "clear key for addr:%pM, camid:%d\n",
 				   pparm->addr, cam_id);
@@ -5508,10 +6053,11 @@ u8 set_stakey_hdl(struct adapter *padapter, u8 *pbuf)
 			rtw_camid_free(padapter, cam_id);
 		}
 	} else {
-		netdev_dbg(padapter->pnetdev,
-			   "set pairwise key camid:%d, addr:%pM, kid:%d, type:%s\n",
-			   cam_id, pparm->addr, pparm->keyid,
-			   security_type_str(pparm->algorithm));
+		netdev_dbg(
+			padapter->pnetdev,
+			"set pairwise key camid:%d, addr:%pM, kid:%d, type:%s\n",
+			cam_id, pparm->addr, pparm->keyid,
+			security_type_str(pparm->algorithm));
 		ctrl = BIT(15) | ((pparm->algorithm) << 2) | pparm->keyid;
 		write_cam(padapter, cam_id, ctrl, pparm->addr, pparm->key);
 	}
@@ -5523,27 +6069,30 @@ u8 set_stakey_hdl(struct adapter *padapter, u8 *pbuf)
 
 u8 add_ba_hdl(struct adapter *padapter, unsigned char *pbuf)
 {
-	struct addBaReq_parm	*pparm = (struct addBaReq_parm *)pbuf;
+	struct addBaReq_parm *pparm = (struct addBaReq_parm *)pbuf;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
-	struct sta_info *psta = rtw_get_stainfo(&padapter->stapriv, pparm->addr);
+	struct sta_info *psta =
+		rtw_get_stainfo(&padapter->stapriv, pparm->addr);
 
 	if (!psta)
-		return	H2C_SUCCESS;
+		return H2C_SUCCESS;
 
-	if (((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) && (pmlmeinfo->HT_enable)) ||
-		((pmlmeinfo->state&0x03) == WIFI_FW_AP_STATE)) {
+	if (((pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) &&
+	     (pmlmeinfo->HT_enable)) ||
+	    ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE)) {
 		/* pmlmeinfo->ADDBA_retry_count = 0; */
 		/* pmlmeinfo->candidate_tid_bitmap |= (0x1 << pparm->tid); */
 		/* psta->htpriv.candidate_tid_bitmap |= BIT(pparm->tid); */
-		issue_action_BA(padapter, pparm->addr, WLAN_ACTION_ADDBA_REQ, (u16)pparm->tid);
+		issue_action_BA(padapter, pparm->addr, WLAN_ACTION_ADDBA_REQ,
+				(u16)pparm->tid);
 		/* _set_timer(&pmlmeext->ADDBA_timer, ADDBA_TO); */
 		_set_timer(&psta->addba_retry_timer, ADDBA_TO);
 	} else {
 		psta->htpriv.candidate_tid_bitmap &= ~BIT(pparm->tid);
 	}
-	return	H2C_SUCCESS;
+	return H2C_SUCCESS;
 }
 
 u8 chk_bmc_sleepq_cmd(struct adapter *padapter)
@@ -5568,8 +6117,8 @@ u8 chk_bmc_sleepq_cmd(struct adapter *padapter)
 
 u8 set_tx_beacon_cmd(struct adapter *padapter)
 {
-	struct cmd_obj	*ph2c;
-	struct Tx_Beacon_param	*ptxBeacon_parm;
+	struct cmd_obj *ph2c;
+	struct Tx_Beacon_param *ptxBeacon_parm;
 	struct cmd_priv *pcmdpriv = &(padapter->cmdpriv);
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
@@ -5589,14 +6138,17 @@ u8 set_tx_beacon_cmd(struct adapter *padapter)
 		goto exit;
 	}
 
-	memcpy(&(ptxBeacon_parm->network), &(pmlmeinfo->network), sizeof(struct wlan_bssid_ex));
+	memcpy(&(ptxBeacon_parm->network), &(pmlmeinfo->network),
+	       sizeof(struct wlan_bssid_ex));
 
-	len_diff = update_hidden_ssid(ptxBeacon_parm->network.ies + _BEACON_IE_OFFSET_,
-				      ptxBeacon_parm->network.ie_length - _BEACON_IE_OFFSET_,
-				      pmlmeinfo->hidden_ssid_mode);
+	len_diff = update_hidden_ssid(
+		ptxBeacon_parm->network.ies + _BEACON_IE_OFFSET_,
+		ptxBeacon_parm->network.ie_length - _BEACON_IE_OFFSET_,
+		pmlmeinfo->hidden_ssid_mode);
 	ptxBeacon_parm->network.ie_length += len_diff;
 
-	init_h2fwcmd_w_parm_no_rsp(ph2c, ptxBeacon_parm, GEN_CMD_CODE(_TX_Beacon));
+	init_h2fwcmd_w_parm_no_rsp(ph2c, ptxBeacon_parm,
+				   GEN_CMD_CODE(_TX_Beacon));
 
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 
@@ -5605,33 +6157,34 @@ u8 set_tx_beacon_cmd(struct adapter *padapter)
 }
 
 static struct fwevent wlanevents[] = {
-	{0, rtw_dummy_event_callback},	/*0*/
-	{0, NULL},
-	{0, NULL},
-	{0, NULL},
-	{0, NULL},
-	{0, NULL},
-	{0, NULL},
-	{0, NULL},
-	{0, &rtw_survey_event_callback},		/*8*/
-	{sizeof(struct surveydone_event), &rtw_surveydone_event_callback},	/*9*/
-
-	{0, &rtw_joinbss_event_callback},		/*10*/
-	{sizeof(struct stassoc_event), &rtw_stassoc_event_callback},
-	{sizeof(struct stadel_event), &rtw_stadel_event_callback},
-	{0, &rtw_atimdone_event_callback},
-	{0, rtw_dummy_event_callback},
-	{0, NULL},	/*15*/
-	{0, NULL},
-	{0, NULL},
-	{0, NULL},
-	{0, rtw_fwdbg_event_callback},
-	{0, NULL},	 /*20*/
-	{0, NULL},
-	{0, NULL},
-	{0, &rtw_cpwm_event_callback},
-	{0, NULL},
-	{0, &rtw_wmm_event_callback},
+	{ 0, rtw_dummy_event_callback }, /*0*/
+	{ 0, NULL },
+	{ 0, NULL },
+	{ 0, NULL },
+	{ 0, NULL },
+	{ 0, NULL },
+	{ 0, NULL },
+	{ 0, NULL },
+	{ 0, &rtw_survey_event_callback }, /*8*/
+	{ sizeof(struct surveydone_event),
+	  &rtw_surveydone_event_callback }, /*9*/
+
+	{ 0, &rtw_joinbss_event_callback }, /*10*/
+	{ sizeof(struct stassoc_event), &rtw_stassoc_event_callback },
+	{ sizeof(struct stadel_event), &rtw_stadel_event_callback },
+	{ 0, &rtw_atimdone_event_callback },
+	{ 0, rtw_dummy_event_callback },
+	{ 0, NULL }, /*15*/
+	{ 0, NULL },
+	{ 0, NULL },
+	{ 0, NULL },
+	{ 0, rtw_fwdbg_event_callback },
+	{ 0, NULL }, /*20*/
+	{ 0, NULL },
+	{ 0, NULL },
+	{ 0, &rtw_cpwm_event_callback },
+	{ 0, NULL },
+	{ 0, &rtw_wmm_event_callback },
 
 };
 
@@ -5639,7 +6192,7 @@ u8 mlme_evt_hdl(struct adapter *padapter, unsigned char *pbuf)
 {
 	u8 evt_code;
 	u16 evt_sz;
-	uint	*peventbuf;
+	uint *peventbuf;
 	void (*event_callback)(struct adapter *dev, u8 *pbuf);
 	struct evt_priv *pevt_priv = &(padapter->evtpriv);
 
@@ -5688,7 +6241,7 @@ u8 chk_bmc_sleepq_hdl(struct adapter *padapter, unsigned char *pbuf)
 	struct list_head *xmitframe_plist, *xmitframe_phead, *tmp;
 	struct xmit_frame *pxmitframe = NULL;
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
-	struct sta_priv  *pstapriv = &padapter->stapriv;
+	struct sta_priv *pstapriv = &padapter->stapriv;
 
 	/* for BC/MC Frames */
 	psta_bmc = rtw_get_bcmc_stainfo(padapter);
@@ -5696,7 +6249,7 @@ u8 chk_bmc_sleepq_hdl(struct adapter *padapter, unsigned char *pbuf)
 		return H2C_SUCCESS;
 
 	if ((pstapriv->tim_bitmap & BIT(0)) && (psta_bmc->sleepq_len > 0)) {
-		msleep(10);/*  10ms, ATIM(HIQ) Windows */
+		msleep(10); /*  10ms, ATIM(HIQ) Windows */
 
 		/* spin_lock_bh(&psta_bmc->sleep_q.lock); */
 		spin_lock_bh(&pxmitpriv->lock);
@@ -5717,7 +6270,7 @@ u8 chk_bmc_sleepq_hdl(struct adapter *padapter, unsigned char *pbuf)
 			pxmitframe->attrib.triggered = 1;
 
 			if (xmitframe_hiq_filter(pxmitframe))
-				pxmitframe->attrib.qsel = 0x11;/* HIQ */
+				pxmitframe->attrib.qsel = 0x11; /* HIQ */
 
 			rtw_hal_xmitframe_enqueue(padapter, pxmitframe);
 		}
@@ -5743,7 +6296,8 @@ u8 tx_beacon_hdl(struct adapter *padapter, unsigned char *pbuf)
 	return H2C_SUCCESS;
 }
 
-int rtw_chk_start_clnt_join(struct adapter *padapter, u8 *ch, u8 *bw, u8 *offset)
+int rtw_chk_start_clnt_join(struct adapter *padapter, u8 *ch, u8 *bw,
+			    u8 *offset)
 {
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	unsigned char cur_ch = pmlmeext->cur_channel;
@@ -5779,9 +6333,10 @@ u8 set_ch_hdl(struct adapter *padapter, u8 *pbuf)
 	pmlmeext->cur_ch_offset = set_ch_parm->ch_offset;
 	pmlmeext->cur_bwmode = set_ch_parm->bw;
 
-	set_channel_bwmode(padapter, set_ch_parm->ch, set_ch_parm->ch_offset, set_ch_parm->bw);
+	set_channel_bwmode(padapter, set_ch_parm->ch, set_ch_parm->ch_offset,
+			   set_ch_parm->bw);
 
-	return	H2C_SUCCESS;
+	return H2C_SUCCESS;
 }
 
 u8 set_chplan_hdl(struct adapter *padapter, unsigned char *pbuf)
@@ -5794,13 +6349,11 @@ u8 set_chplan_hdl(struct adapter *padapter, unsigned char *pbuf)
 
 	setChannelPlan_param = (struct SetChannelPlan_param *)pbuf;
 
-	pmlmeext->max_chan_nums = init_channel_set(padapter,
-						   setChannelPlan_param->channel_plan,
-						   pmlmeext->channel_set);
-	init_channel_list(padapter,
-			  pmlmeext->channel_set,
-			  pmlmeext->max_chan_nums,
-			  &pmlmeext->channel_list);
+	pmlmeext->max_chan_nums =
+		init_channel_set(padapter, setChannelPlan_param->channel_plan,
+				 pmlmeext->channel_set);
+	init_channel_list(padapter, pmlmeext->channel_set,
+			  pmlmeext->max_chan_nums, &pmlmeext->channel_list);
 
 	if (padapter->rtw_wdev && padapter->rtw_wdev->wiphy) {
 		struct regulatory_request request;
@@ -5809,12 +6362,12 @@ u8 set_chplan_hdl(struct adapter *padapter, unsigned char *pbuf)
 		rtw_reg_notifier(padapter->rtw_wdev->wiphy, &request);
 	}
 
-	return	H2C_SUCCESS;
+	return H2C_SUCCESS;
 }
 
 u8 set_csa_hdl(struct adapter *padapter, unsigned char *pbuf)
 {
-	return	H2C_REJECTED;
+	return H2C_REJECTED;
 }
 
 /*  TDLS_ESTABLISHED	: write RCR DATA BIT */
diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 552d0c5fa47f..04b935fe7764 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -10,7 +10,6 @@
 
 --------------------------------------------------------------------------------*/
 
-
 #ifndef __DRV_TYPES_H__
 #define __DRV_TYPES_H__
 
@@ -66,32 +65,32 @@ struct registry_priv {
 	u8 rfintfs;
 	u8 lbkmode;
 	u8 hci;
-	struct ndis_802_11_ssid	ssid;
-	u8 network_mode;	/* infra, ad-hoc, auto */
-	u8 channel;/* ad-hoc support requirement */
-	u8 wireless_mode;/* A, B, G, auto */
-	u8 scan_mode;/* active, passive */
+	struct ndis_802_11_ssid ssid;
+	u8 network_mode; /* infra, ad-hoc, auto */
+	u8 channel; /* ad-hoc support requirement */
+	u8 wireless_mode; /* A, B, G, auto */
+	u8 scan_mode; /* active, passive */
 	u8 radio_enable;
-	u8 preamble;/* long, short, auto */
-	u8 vrtl_carrier_sense;/* Enable, Disable, Auto */
-	u8 vcs_type;/* RTS/CTS, CTS-to-self */
+	u8 preamble; /* long, short, auto */
+	u8 vrtl_carrier_sense; /* Enable, Disable, Auto */
+	u8 vcs_type; /* RTS/CTS, CTS-to-self */
 	u16 rts_thresh;
-	u16  frag_thresh;
+	u16 frag_thresh;
 	u8 adhoc_tx_pwr;
 	u8 soft_ap;
 	u8 power_mgnt;
 	u8 ips_mode;
 	u8 smart_ps;
-	u8   usb_rxagg_mode;
+	u8 usb_rxagg_mode;
 	u8 long_retry_lmt;
 	u8 short_retry_lmt;
 	u16 busy_thresh;
 	u8 ack_policy;
-	u8  mp_dm;
+	u8 mp_dm;
 	u8 software_encrypt;
 	u8 software_decrypt;
 	u8 acm_method;
-	  /* UAPSD */
+	/* UAPSD */
 	u8 wmm_enable;
 	u8 uapsd_enable;
 	u8 uapsd_max_sp;
@@ -100,7 +99,7 @@ struct registry_priv {
 	u8 uapsd_acvi_en;
 	u8 uapsd_acvo_en;
 
-	struct wlan_bssid_ex    dev_network;
+	struct wlan_bssid_ex dev_network;
 
 	u8 ht_enable;
 	/*
@@ -109,9 +108,9 @@ struct registry_priv {
 	 * 0x01 means enable 2.4G 40MHz
 	 */
 	u8 bw_mode;
-	u8 ampdu_enable;/* for tx */
+	u8 ampdu_enable; /* for tx */
 	u8 rx_stbc;
-	u8 ampdu_amsdu;/* A-MPDU Supports A-MSDU is permitted */
+	u8 ampdu_amsdu; /* A-MPDU Supports A-MSDU is permitted */
 	/*  Short GI support Bit Map */
 	/*  BIT0 - 20MHz, 1: support, 0: non-support */
 	/*  BIT1 - 40MHz, 1: support, 0: non-support */
@@ -129,23 +128,23 @@ struct registry_priv {
 
 	u8 low_power;
 
-	u8 wifi_spec;/*  !turbo_mode */
+	u8 wifi_spec; /*  !turbo_mode */
 
 	u8 channel_plan;
 
-	s8	ant_num;
+	s8 ant_num;
 
 	/* false:Reject AP's Add BA req, true:accept AP's Add BA req */
-	bool	accept_addba_req;
+	bool accept_addba_req;
 
 	u8 antdiv_cfg;
 	u8 antdiv_type;
 
-	u8 usbss_enable;/* 0:disable, 1:enable */
-	u8 hwpdn_mode;/* 0:disable, 1:enable, 2:decide by EFUSE config */
-	u8 hwpwrp_detect;/* 0:disable, 1:enable */
+	u8 usbss_enable; /* 0:disable, 1:enable */
+	u8 hwpdn_mode; /* 0:disable, 1:enable, 2:decide by EFUSE config */
+	u8 hwpwrp_detect; /* 0:disable, 1:enable */
 
-	u8 hw_wps_pbc;/* 0:disable, 1:enable */
+	u8 hw_wps_pbc; /* 0:disable, 1:enable */
 
 	u8 max_roaming_times; /*  the max number driver will try to roaming */
 
@@ -160,7 +159,7 @@ struct registry_priv {
 	u8 reg_enable_tx_power_by_rate;
 	u8 reg_power_base;
 	u8 reg_pwr_tbl_sel;
-	u8  check_fw_ps;
+	u8 check_fw_ps;
 
 	u8 qos_opt_enable;
 
@@ -170,24 +169,26 @@ struct registry_priv {
 #include <drv_types_sdio.h>
 
 #define GET_PRIMARY_ADAPTER(padapter) (((struct adapter *)padapter)->dvobj->if1)
-#define GET_IFACE_NUMS(padapter) (((struct adapter *)padapter)->dvobj->iface_nums)
-#define GET_ADAPTER(padapter, iface_id) (((struct adapter *)padapter)->dvobj->padapters[iface_id])
+#define GET_IFACE_NUMS(padapter) \
+	(((struct adapter *)padapter)->dvobj->iface_nums)
+#define GET_ADAPTER(padapter, iface_id) \
+	(((struct adapter *)padapter)->dvobj->padapters[iface_id])
 
 struct rtw_traffic_statistics {
 	/*  tx statistics */
-	u64	tx_bytes;
-	u64	tx_pkts;
-	u64	tx_drop;
-	u64	cur_tx_bytes;
-	u64	last_tx_bytes;
+	u64 tx_bytes;
+	u64 tx_pkts;
+	u64 tx_drop;
+	u64 cur_tx_bytes;
+	u64 last_tx_bytes;
 	u32 cur_tx_tp; /*  Tx throughput in MBps. */
 
 	/*  rx statistics */
-	u64	rx_bytes;
-	u64	rx_pkts;
-	u64	rx_drop;
-	u64	cur_rx_bytes;
-	u64	last_rx_bytes;
+	u64 rx_bytes;
+	u64 rx_pkts;
+	u64 rx_drop;
+	u64 cur_rx_bytes;
+	u64 last_rx_bytes;
 	u32 cur_rx_tp; /*  Rx throughput in MBps. */
 };
 
@@ -206,11 +207,11 @@ struct dvobj_priv {
 	/*-------- below is common data --------*/
 	struct adapter *if1; /* PRIMARY_ADAPTER */
 
-	s32	processing_dev_remove;
+	s32 processing_dev_remove;
 
 	/* for local/global synchronization */
 	/*  */
-	spinlock_t	lock;
+	spinlock_t lock;
 	int macid[NUM_STA];
 
 	struct mutex hw_init_mutex;
@@ -218,9 +219,10 @@ struct dvobj_priv {
 	struct mutex setch_mutex;
 	struct mutex setbw_mutex;
 
-	unsigned char oper_channel; /* saved channel info when call set_channel_bw */
+	unsigned char
+		oper_channel; /* saved channel info when call set_channel_bw */
 	unsigned char oper_bwmode;
-	unsigned char oper_ch_offset;/* PRIME_CHNL_OFFSET */
+	unsigned char oper_ch_offset; /* PRIME_CHNL_OFFSET */
 	unsigned long on_oper_ch_time;
 
 	struct adapter *padapters;
@@ -229,9 +231,9 @@ struct dvobj_priv {
 	struct cam_entry_cache cam_cache[TOTAL_CAM_ENTRY];
 
 	/* In /Out Pipe information */
-	int	RtInPipe[2];
-	int	RtOutPipe[4];
-	u8 Queue2Pipe[HW_QUEUE_ENTRY];/* for out pipe mapping */
+	int RtInPipe[2];
+	int RtOutPipe[4];
+	u8 Queue2Pipe[HW_QUEUE_ENTRY]; /* for out pipe mapping */
 
 	u8 irq_alloc;
 	atomic_t continual_io_error;
@@ -240,17 +242,17 @@ struct dvobj_priv {
 
 	struct pwrctrl_priv pwrctl_priv;
 
-	struct rtw_traffic_statistics	traffic_stat;
-
-/*-------- below is for SDIO INTERFACE --------*/
+	struct rtw_traffic_statistics traffic_stat;
 
-struct sdio_data intf_data;
+	/*-------- below is for SDIO INTERFACE --------*/
 
+	struct sdio_data intf_data;
 };
 
 #define dvobj_to_pwrctl(dvobj) (&(dvobj->pwrctl_priv))
 
-static inline struct dvobj_priv *pwrctl_to_dvobj(struct pwrctrl_priv *pwrctl_priv)
+static inline struct dvobj_priv *
+pwrctl_to_dvobj(struct pwrctrl_priv *pwrctl_priv)
 {
 	return container_of(pwrctl_priv, struct dvobj_priv, pwrctl_priv);
 }
@@ -268,35 +270,36 @@ enum {
 };
 
 struct adapter {
-	int	DriverState;/*  for disable driver using module, use dongle to replace module. */
-	int	pid[3];/* process id from UI, 0:wps, 1:hostapd, 2:dhcpcd */
-	int	bDongle;/* build-in module or external dongle */
+	int DriverState; /*  for disable driver using module, use dongle to replace module. */
+	int pid[3]; /* process id from UI, 0:wps, 1:hostapd, 2:dhcpcd */
+	int bDongle; /* build-in module or external dongle */
 
 	struct dvobj_priv *dvobj;
-	struct	mlme_priv mlmepriv;
-	struct	mlme_ext_priv mlmeextpriv;
-	struct	cmd_priv cmdpriv;
-	struct	evt_priv evtpriv;
+	struct mlme_priv mlmepriv;
+	struct mlme_ext_priv mlmeextpriv;
+	struct cmd_priv cmdpriv;
+	struct evt_priv evtpriv;
 	/* struct	io_queue	*pio_queue; */
-	struct	io_priv iopriv;
-	struct	xmit_priv xmitpriv;
-	struct	recv_priv recvpriv;
-	struct	sta_priv stapriv;
-	struct	security_priv securitypriv;
-	spinlock_t   security_key_mutex; /*  add for CONFIG_IEEE80211W, none 11w also can use */
-	struct	registry_priv registrypriv;
-	struct	eeprom_priv eeprompriv;
-
-	struct	hostapd_priv *phostapdpriv;
+	struct io_priv iopriv;
+	struct xmit_priv xmitpriv;
+	struct recv_priv recvpriv;
+	struct sta_priv stapriv;
+	struct security_priv securitypriv;
+	spinlock_t
+		security_key_mutex; /*  add for CONFIG_IEEE80211W, none 11w also can use */
+	struct registry_priv registrypriv;
+	struct eeprom_priv eeprompriv;
+
+	struct hostapd_priv *phostapdpriv;
 
 	u32 setband;
 
 	void *HalData;
 	u32 hal_data_sz;
 
-	s32	bDriverStopped;
-	s32	bSurpriseRemoved;
-	s32  bCardDisableWOHSM;
+	s32 bDriverStopped;
+	s32 bSurpriseRemoved;
+	s32 bCardDisableWOHSM;
 
 	u32 IsrContent;
 	u32 ImrContent;
@@ -317,7 +320,6 @@ struct adapter {
 	int (*intf_alloc_irq)(struct dvobj_priv *dvobj);
 	void (*intf_free_irq)(struct dvobj_priv *dvobj);
 
-
 	void (*intf_start)(struct adapter *adapter);
 	void (*intf_stop)(struct adapter *adapter);
 
@@ -344,7 +346,7 @@ struct adapter {
 
 	u8 bFWReady;
 	u8 bBTFWReady;
-	u8 bLinkInfoDump;
+	u8 link_info_dump;
 	u8 bRxRSSIDisplay;
 	/* 	Added by Albert 2012/10/26 */
 	/* 	The driver will show up the desired channel number when this flag is 1. */
@@ -359,18 +361,18 @@ struct adapter {
 	struct adapter *pbuddy_adapter;
 
 	/* extend to support multi interface */
-       /* IFACE_ID0 is equals to PRIMARY_ADAPTER */
-       /* IFACE_ID1 is equals to SECONDARY_ADAPTER */
+	/* IFACE_ID0 is equals to PRIMARY_ADAPTER */
+	/* IFACE_ID1 is equals to SECONDARY_ADAPTER */
 	u8 iface_id;
 
 	/* for debug purpose */
 	u8 fix_rate;
 	u8 driver_vcs_en; /* Enable = 1, Disable = 0 driver control vrtl_carrier_sense for tx */
-	u8 driver_vcs_type;/* force 0:disable VCS, 1:RTS-CTS, 2:CTS-to-self when vcs_en = 1. */
-	u8 driver_ampdu_spacing;/* driver control AMPDU Density for peer sta's rx */
-	u8 driver_rx_ampdu_factor;/* 0xff: disable drv ctrl, 0:8k, 1:16k, 2:32k, 3:64k; */
+	u8 driver_vcs_type; /* force 0:disable VCS, 1:RTS-CTS, 2:CTS-to-self when vcs_en = 1. */
+	u8 driver_ampdu_spacing; /* driver control AMPDU Density for peer sta's rx */
+	u8 driver_rx_ampdu_factor; /* 0xff: disable drv ctrl, 0:8k, 1:16k, 2:32k, 3:64k; */
 
-	unsigned char     in_cta_test;
+	unsigned char in_cta_test;
 };
 
 #define adapter_to_dvobj(adapter) (adapter->dvobj)
@@ -380,34 +382,33 @@ struct adapter {
 /*  */
 /*  Function disabled. */
 /*  */
-#define DF_TX_BIT		BIT(0)
-#define DF_RX_BIT		BIT(1)
-#define DF_IO_BIT		BIT(2)
+#define DF_TX_BIT BIT(0)
+#define DF_RX_BIT BIT(1)
+#define DF_IO_BIT BIT(2)
 
 /* define RTW_ENABLE_FUNC(padapter, func) (atomic_sub(&adapter_to_dvobj(padapter)->disable_func, (func))) */
 
 static inline void RTW_ENABLE_FUNC(struct adapter *padapter, int func_bit)
 {
-	int	df = atomic_read(&adapter_to_dvobj(padapter)->disable_func);
+	int df = atomic_read(&adapter_to_dvobj(padapter)->disable_func);
 	df &= ~(func_bit);
 	atomic_set(&adapter_to_dvobj(padapter)->disable_func, df);
 }
 
-#define RTW_IS_FUNC_DISABLED(padapter, func_bit) (atomic_read(&adapter_to_dvobj(padapter)->disable_func) & (func_bit))
+#define RTW_IS_FUNC_DISABLED(padapter, func_bit) \
+	(atomic_read(&adapter_to_dvobj(padapter)->disable_func) & (func_bit))
 
-#define RTW_CANNOT_IO(padapter) \
-			((padapter)->bSurpriseRemoved || \
-			 RTW_IS_FUNC_DISABLED((padapter), DF_IO_BIT))
+#define RTW_CANNOT_IO(padapter)          \
+	((padapter)->bSurpriseRemoved || \
+	 RTW_IS_FUNC_DISABLED((padapter), DF_IO_BIT))
 
-#define RTW_CANNOT_RX(padapter) \
-			((padapter)->bDriverStopped || \
-			 (padapter)->bSurpriseRemoved || \
-			 RTW_IS_FUNC_DISABLED((padapter), DF_RX_BIT))
+#define RTW_CANNOT_RX(padapter)                                        \
+	((padapter)->bDriverStopped || (padapter)->bSurpriseRemoved || \
+	 RTW_IS_FUNC_DISABLED((padapter), DF_RX_BIT))
 
-#define RTW_CANNOT_TX(padapter) \
-			((padapter)->bDriverStopped || \
-			 (padapter)->bSurpriseRemoved || \
-			 RTW_IS_FUNC_DISABLED((padapter), DF_TX_BIT))
+#define RTW_CANNOT_TX(padapter)                                        \
+	((padapter)->bDriverStopped || (padapter)->bSurpriseRemoved || \
+	 RTW_IS_FUNC_DISABLED((padapter), DF_TX_BIT))
 
 static inline u8 *myid(struct eeprom_priv *peepriv)
 {
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index f31196f54b3e..23fede6ac4c3 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -16,19 +16,19 @@ MODULE_VERSION(DRIVERVERSION);
 /* module param defaults */
 static int rtw_chip_version;
 static int rtw_rfintfs = HWPI;
-static int rtw_lbkmode;/* RTL8712_AIR_TRX; */
+static int rtw_lbkmode; /* RTL8712_AIR_TRX; */
 
-
-static int rtw_network_mode = Ndis802_11IBSS;/* Ndis802_11Infrastructure;infra, ad-hoc, auto */
+static int rtw_network_mode =
+	Ndis802_11IBSS; /* Ndis802_11Infrastructure;infra, ad-hoc, auto */
 /* struct ndis_802_11_ssid	ssid; */
-static int rtw_channel = 1;/* ad-hoc support requirement */
+static int rtw_channel = 1; /* ad-hoc support requirement */
 static int rtw_wireless_mode = WIRELESS_11BG_24N;
 static int rtw_vrtl_carrier_sense = AUTO_VCS;
-static int rtw_vcs_type = RTS_CTS;/*  */
-static int rtw_rts_thresh = 2347;/*  */
-static int rtw_frag_thresh = 2346;/*  */
-static int rtw_preamble = PREAMBLE_LONG;/* long, short, auto */
-static int rtw_scan_mode = 1;/* active, passive */
+static int rtw_vcs_type = RTS_CTS; /*  */
+static int rtw_rts_thresh = 2347; /*  */
+static int rtw_frag_thresh = 2346; /*  */
+static int rtw_preamble = PREAMBLE_LONG; /* long, short, auto */
+static int rtw_scan_mode = 1; /* active, passive */
 static int rtw_adhoc_tx_pwr = 1;
 static int rtw_soft_ap;
 /* int smart_ps = 1; */
@@ -41,7 +41,7 @@ static int rtw_smart_ps = 2;
 
 static int rtw_check_fw_ps = 1;
 
-static int rtw_usb_rxagg_mode = 2;/* USB_RX_AGG_DMA = 1, USB_RX_AGG_USB =2 */
+static int rtw_usb_rxagg_mode = 2; /* USB_RX_AGG_DMA = 1, USB_RX_AGG_USB =2 */
 module_param(rtw_usb_rxagg_mode, int, 0644);
 
 static int rtw_radio_enable = 1;
@@ -54,9 +54,9 @@ static int rtw_ack_policy = NORMAL_ACK;
 static int rtw_software_encrypt;
 static int rtw_software_decrypt;
 
-static int rtw_acm_method;/*  0:By SW 1:By HW. */
+static int rtw_acm_method; /*  0:By SW 1:By HW. */
 
-static int rtw_wmm_enable = 1;/*  default is set to enable the wmm. */
+static int rtw_wmm_enable = 1; /*  default is set to enable the wmm. */
 static int rtw_uapsd_enable;
 static int rtw_uapsd_max_sp = NO_LIMIT;
 static int rtw_uapsd_acbk_en;
@@ -71,9 +71,11 @@ int rtw_ht_enable = 1;
  * 0x01 means enable 2.4G 40MHz
  */
 static int rtw_bw_mode = 0x01;
-static int rtw_ampdu_enable = 1;/* for enable tx_ampdu ,0: disable, 0x1:enable (but wifi_spec should be 0), 0x2: force enable (don't care wifi_spec) */
-static int rtw_rx_stbc = 1;/*  0: disable, 1:enable 2.4g */
-static int rtw_ampdu_amsdu;/*  0: disabled, 1:enabled, 2:auto . There is an IOT issu with DLINK DIR-629 when the flag turn on */
+static int rtw_ampdu_enable =
+	1; /* for enable tx_ampdu ,0: disable, 0x1:enable (but wifi_spec should be 0), 0x2: force enable (don't care wifi_spec) */
+static int rtw_rx_stbc = 1; /*  0: disable, 1:enable 2.4g */
+static int
+	rtw_ampdu_amsdu; /*  0: disabled, 1:enabled, 2:auto . There is an IOT issu with DLINK DIR-629 when the flag turn on */
 /*  Short GI support Bit Map */
 /*  BIT0 - 20MHz, 0: non-support, 1: support */
 /*  BIT1 - 40MHz, 0: non-support, 1: support */
@@ -87,7 +89,8 @@ static int rtw_stbc_cap = 0x13;
 /*  BIT0: Enable VHT Beamformer, BIT1: Enable VHT Beamformee, BIT4: Enable HT Beamformer, BIT5: Enable HT Beamformee */
 static int rtw_beamform_cap = 0x2;
 
-static int rtw_lowrate_two_xmit = 1;/* Use 2 path Tx to transmit MCS0~7 and legacy mode */
+static int rtw_lowrate_two_xmit =
+	1; /* Use 2 path Tx to transmit MCS0~7 and legacy mode */
 
 static int rtw_low_power;
 static int rtw_wifi_spec;
@@ -98,7 +101,8 @@ module_param(rtw_ant_num, int, 0644);
 MODULE_PARM_DESC(rtw_ant_num, "Antenna number setting");
 
 static int rtw_antdiv_cfg = 1; /*  0:OFF , 1:ON, 2:decide by Efuse config */
-static int rtw_antdiv_type; /* 0:decide by efuse  1: for 88EE, 1Tx and 1RxCG are diversity.(2 Ant with SPDT), 2:  for 88EE, 1Tx and 2Rx are diversity.(2 Ant, Tx and RxCG are both on aux port, RxCS is on main port), 3: for 88EE, 1Tx and 1RxCG are fixed.(1Ant, Tx and RxCG are both on aux port) */
+static int
+	rtw_antdiv_type; /* 0:decide by efuse  1: for 88EE, 1Tx and 1RxCG are diversity.(2 Ant with SPDT), 2:  for 88EE, 1Tx and 2Rx are diversity.(2 Ant, Tx and RxCG are both on aux port, RxCS is on main port), 3: for 88EE, 1Tx and 1RxCG are fixed.(1Ant, Tx and RxCG are both on aux port) */
 
 static int rtw_hw_wps_pbc;
 
@@ -106,14 +110,14 @@ int rtw_mc2u_disable;
 
 static int rtw_80211d;
 
-static int rtw_qos_opt_enable;/* 0: disable, 1:enable */
+static int rtw_qos_opt_enable; /* 0: disable, 1:enable */
 module_param(rtw_qos_opt_enable, int, 0644);
 
 static char *ifname = "wlan%d";
 module_param(ifname, charp, 0644);
 MODULE_PARM_DESC(ifname, "The default name to allocate for first interface");
 
-char *rtw_initmac;  /*  temp mac address if users want to use instead of the mac address in Efuse */
+char *rtw_initmac; /*  temp mac address if users want to use instead of the mac address in Efuse */
 
 module_param(rtw_initmac, charp, 0644);
 module_param(rtw_channel_plan, int, 0644);
@@ -143,7 +147,6 @@ module_param(rtw_wifi_spec, int, 0644);
 module_param(rtw_antdiv_cfg, int, 0644);
 module_param(rtw_antdiv_type, int, 0644);
 
-
 module_param(rtw_hw_wps_pbc, int, 0644);
 
 static uint rtw_max_roaming_times = 2;
@@ -157,7 +160,8 @@ MODULE_PARM_DESC(rtw_80211d, "Enable 802.11d mechanism");
 
 static uint rtw_notch_filter;
 module_param(rtw_notch_filter, uint, 0644);
-MODULE_PARM_DESC(rtw_notch_filter, "0:Disable, 1:Enable, 2:Enable only for P2P");
+MODULE_PARM_DESC(rtw_notch_filter,
+		 "0:Disable, 1:Enable, 2:Enable only for P2P");
 
 #define CONFIG_RTW_HIQ_FILTER 1
 
@@ -169,7 +173,8 @@ static int rtw_tx_pwr_lmt_enable;
 static int rtw_tx_pwr_by_rate;
 
 module_param(rtw_tx_pwr_lmt_enable, int, 0644);
-MODULE_PARM_DESC(rtw_tx_pwr_lmt_enable, "0:Disable, 1:Enable, 2: Depend on efuse");
+MODULE_PARM_DESC(rtw_tx_pwr_lmt_enable,
+		 "0:Disable, 1:Enable, 2: Depend on efuse");
 
 module_param(rtw_tx_pwr_by_rate, int, 0644);
 MODULE_PARM_DESC(rtw_tx_pwr_by_rate, "0:Disable, 1:Enable, 2: Depend on efuse");
@@ -178,13 +183,13 @@ static int netdev_close(struct net_device *pnetdev);
 
 static void loadparam(struct adapter *padapter, struct net_device *pnetdev)
 {
-	struct registry_priv  *registry_par = &padapter->registrypriv;
+	struct registry_priv *registry_par = &padapter->registrypriv;
 
 	registry_par->chip_version = (u8)rtw_chip_version;
 	registry_par->rfintfs = (u8)rtw_rfintfs;
 	registry_par->lbkmode = (u8)rtw_lbkmode;
 	/* registry_par->hci = (u8)hci; */
-	registry_par->network_mode  = (u8)rtw_network_mode;
+	registry_par->network_mode = (u8)rtw_network_mode;
 
 	memcpy(registry_par->ssid.ssid, "ANY", 3);
 	registry_par->ssid.ssid_length = 3;
@@ -199,8 +204,8 @@ static void loadparam(struct adapter *padapter, struct net_device *pnetdev)
 	registry_par->preamble = (u8)rtw_preamble;
 	registry_par->scan_mode = (u8)rtw_scan_mode;
 	registry_par->adhoc_tx_pwr = (u8)rtw_adhoc_tx_pwr;
-	registry_par->soft_ap =  (u8)rtw_soft_ap;
-	registry_par->smart_ps =  (u8)rtw_smart_ps;
+	registry_par->soft_ap = (u8)rtw_soft_ap;
+	registry_par->smart_ps = (u8)rtw_smart_ps;
 	registry_par->check_fw_ps = (u8)rtw_check_fw_ps;
 	registry_par->power_mgnt = (u8)rtw_power_mgnt;
 	registry_par->ips_mode = (u8)rtw_ips_mode;
@@ -216,7 +221,7 @@ static void loadparam(struct adapter *padapter, struct net_device *pnetdev)
 	registry_par->acm_method = (u8)rtw_acm_method;
 	registry_par->usb_rxagg_mode = (u8)rtw_usb_rxagg_mode;
 
-	 /* UAPSD */
+	/* UAPSD */
 	registry_par->wmm_enable = (u8)rtw_wmm_enable;
 	registry_par->uapsd_enable = (u8)rtw_uapsd_enable;
 	registry_par->uapsd_max_sp = (u8)rtw_uapsd_max_sp;
@@ -238,7 +243,6 @@ static void loadparam(struct adapter *padapter, struct net_device *pnetdev)
 	registry_par->lowrate_two_xmit = (u8)rtw_lowrate_two_xmit;
 	registry_par->low_power = (u8)rtw_low_power;
 
-
 	registry_par->wifi_spec = (u8)rtw_wifi_spec;
 
 	registry_par->channel_plan = (u8)rtw_channel_plan;
@@ -291,8 +295,10 @@ static struct net_device_stats *rtw_net_get_stats(struct net_device *pnetdev)
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	struct recv_priv *precvpriv = &padapter->recvpriv;
 
-	padapter->stats.tx_packets = pxmitpriv->tx_pkts;/* pxmitpriv->tx_pkts++; */
-	padapter->stats.rx_packets = precvpriv->rx_pkts;/* precvpriv->rx_pkts++; */
+	padapter->stats.tx_packets =
+		pxmitpriv->tx_pkts; /* pxmitpriv->tx_pkts++; */
+	padapter->stats.rx_packets =
+		precvpriv->rx_pkts; /* precvpriv->rx_pkts++; */
 	padapter->stats.tx_dropped = pxmitpriv->tx_drop;
 	padapter->stats.rx_dropped = precvpriv->rx_drop;
 	padapter->stats.tx_bytes = pxmitpriv->tx_bytes;
@@ -335,11 +341,10 @@ static unsigned int rtw_classify8021d(struct sk_buff *skb)
 	return dscp >> 5;
 }
 
-
 static u16 rtw_select_queue(struct net_device *dev, struct sk_buff *skb,
 			    struct net_device *sb_dev)
 {
-	struct adapter	*padapter = rtw_netdev_priv(dev);
+	struct adapter *padapter = rtw_netdev_priv(dev);
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	skb->priority = rtw_classify8021d(skb);
@@ -354,7 +359,7 @@ u16 rtw_recv_select_queue(struct sk_buff *skb)
 {
 	struct iphdr *piphdr;
 	unsigned int dscp;
-	__be16	eth_type;
+	__be16 eth_type;
 	u32 priority;
 	u8 *pdata = skb->data;
 
@@ -400,7 +405,7 @@ static const struct net_device_ops rtw_netdev_ops = {
 	.ndo_open = netdev_open,
 	.ndo_stop = netdev_close,
 	.ndo_start_xmit = rtw_xmit_entry,
-	.ndo_select_queue	= rtw_select_queue,
+	.ndo_select_queue = rtw_select_queue,
 	.ndo_set_mac_address = rtw_net_set_mac_address,
 	.ndo_get_stats = rtw_net_get_stats,
 };
@@ -423,7 +428,8 @@ struct net_device *rtw_init_netdev(struct adapter *old_padapter)
 	struct net_device *pnetdev;
 
 	if (old_padapter)
-		pnetdev = rtw_alloc_etherdev_with_old_priv(sizeof(struct adapter), (void *)old_padapter);
+		pnetdev = rtw_alloc_etherdev_with_old_priv(
+			sizeof(struct adapter), (void *)old_padapter);
 	else
 		pnetdev = rtw_alloc_etherdev(sizeof(struct adapter));
 
@@ -468,18 +474,22 @@ u32 rtw_start_drv_threads(struct adapter *padapter)
 {
 	u32 _status = _SUCCESS;
 
-	padapter->xmitThread = kthread_run(rtw_xmit_thread, padapter, "RTW_XMIT_THREAD");
+	padapter->xmitThread =
+		kthread_run(rtw_xmit_thread, padapter, "RTW_XMIT_THREAD");
 	if (IS_ERR(padapter->xmitThread))
 		_status = _FAIL;
 
-	padapter->cmdThread = kthread_run(rtw_cmd_thread, padapter, "RTW_CMD_THREAD");
+	padapter->cmdThread =
+		kthread_run(rtw_cmd_thread, padapter, "RTW_CMD_THREAD");
 	if (IS_ERR(padapter->cmdThread))
 		_status = _FAIL;
 	else
-		wait_for_completion(&padapter->cmdpriv.terminate_cmdthread_comp); /* wait for cmd_thread to run */
+		wait_for_completion(
+			&padapter->cmdpriv
+				 .terminate_cmdthread_comp); /* wait for cmd_thread to run */
 
-	padapter->xmitpriv.SdioXmitThread = kthread_run(rtl8723bs_xmit_thread,
-							padapter, "RTWHALXT");
+	padapter->xmitpriv.SdioXmitThread =
+		kthread_run(rtl8723bs_xmit_thread, padapter, "RTWHALXT");
 	if (IS_ERR(padapter->xmitpriv.SdioXmitThread)) {
 		padapter->xmitpriv.SdioXmitThread = NULL;
 		_status = _FAIL;
@@ -527,14 +537,15 @@ static void rtw_init_default_value(struct adapter *padapter)
 	/* pmlmepriv->qospriv.qos_option = pregistrypriv->wmm_enable; */
 
 	/* ht_priv */
-	pmlmepriv->htpriv.ampdu_enable = false;/* set to disabled */
+	pmlmepriv->htpriv.ampdu_enable = false; /* set to disabled */
 
 	/* security_priv */
 	psecuritypriv->binstallGrpkey = _FAIL;
 	psecuritypriv->sw_encrypt = pregistrypriv->software_encrypt;
 	psecuritypriv->sw_decrypt = pregistrypriv->software_decrypt;
 
-	psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_Open; /* open system */
+	psecuritypriv->dot11AuthAlgrthm =
+		dot11AuthAlgrthm_Open; /* open system */
 	psecuritypriv->dot11PrivacyAlgrthm = _NO_PRIVACY_;
 
 	psecuritypriv->dot11PrivacyKeyIndex = 0;
@@ -555,13 +566,13 @@ static void rtw_init_default_value(struct adapter *padapter)
 	/* misc. */
 	RTW_ENABLE_FUNC(padapter, DF_RX_BIT);
 	RTW_ENABLE_FUNC(padapter, DF_TX_BIT);
-	padapter->bLinkInfoDump = 0;
+	padapter->link_info_dump = 0;
 	padapter->bNotifyChannelChange = 0;
 
 	/* for debug purpose */
 	padapter->fix_rate = 0xFF;
 	padapter->driver_ampdu_spacing = 0xFF;
-	padapter->driver_rx_ampdu_factor =  0xFF;
+	padapter->driver_rx_ampdu_factor = 0xFF;
 }
 
 struct dvobj_priv *devobj_init(void)
@@ -613,7 +624,7 @@ void rtw_reset_drv_sw(struct adapter *padapter)
 
 	RTW_ENABLE_FUNC(padapter, DF_RX_BIT);
 	RTW_ENABLE_FUNC(padapter, DF_TX_BIT);
-	padapter->bLinkInfoDump = 0;
+	padapter->link_info_dump = 0;
 
 	padapter->xmitpriv.tx_pkts = 0;
 	padapter->recvpriv.rx_pkts = 0;
@@ -633,7 +644,6 @@ void rtw_reset_drv_sw(struct adapter *padapter)
 	rtw_set_signal_stat_timer(&padapter->recvpriv);
 }
 
-
 u8 rtw_init_drv_sw(struct adapter *padapter)
 {
 	int res;
@@ -709,7 +719,8 @@ void rtw_cancel_all_timer(struct adapter *padapter)
 
 	timer_delete_sync(&padapter->mlmepriv.dynamic_chk_timer);
 
-	timer_delete_sync(&(adapter_to_pwrctl(padapter)->pwr_state_check_timer));
+	timer_delete_sync(
+		&(adapter_to_pwrctl(padapter)->pwr_state_check_timer));
 
 	timer_delete_sync(&padapter->mlmepriv.set_scan_deny_timer);
 	rtw_clear_scan_deny(padapter);
@@ -729,7 +740,8 @@ u8 rtw_free_drv_sw(struct adapter *padapter)
 
 	_rtw_free_xmit_priv(&padapter->xmitpriv);
 
-	_rtw_free_sta_priv(&padapter->stapriv); /* will free bcmc_stainfo here */
+	_rtw_free_sta_priv(
+		&padapter->stapriv); /* will free bcmc_stainfo here */
 
 	_rtw_free_recv_priv(&padapter->recvpriv);
 
@@ -855,7 +867,8 @@ int netdev_open(struct net_device *pnetdev)
 	if (pwrctrlpriv->bInSuspend)
 		return 0;
 
-	if (mutex_lock_interruptible(&(adapter_to_dvobj(padapter)->hw_init_mutex)))
+	if (mutex_lock_interruptible(
+		    &(adapter_to_dvobj(padapter)->hw_init_mutex)))
 		return -1;
 
 	ret = _netdev_open(pnetdev);
@@ -864,7 +877,7 @@ int netdev_open(struct net_device *pnetdev)
 	return ret;
 }
 
-static int  ips_netdrv_open(struct adapter *padapter)
+static int ips_netdrv_open(struct adapter *padapter)
 {
 	int status = _SUCCESS;
 	/* struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter); */
@@ -891,7 +904,6 @@ static int  ips_netdrv_open(struct adapter *padapter)
 	return _FAIL;
 }
 
-
 int rtw_ips_pwr_up(struct adapter *padapter)
 {
 	return ips_netdrv_open(padapter);
@@ -919,12 +931,14 @@ static int pm_netdev_open(struct net_device *pnetdev, u8 bnormal)
 	struct adapter *padapter = rtw_netdev_priv(pnetdev);
 
 	if (bnormal) {
-		if (mutex_lock_interruptible(&(adapter_to_dvobj(padapter)->hw_init_mutex)) == 0) {
+		if (mutex_lock_interruptible(&(
+			    adapter_to_dvobj(padapter)->hw_init_mutex)) == 0) {
 			status = _netdev_open(pnetdev);
-			mutex_unlock(&(adapter_to_dvobj(padapter)->hw_init_mutex));
+			mutex_unlock(
+				&(adapter_to_dvobj(padapter)->hw_init_mutex));
 		}
 	} else {
-		status =  (ips_netdrv_open(padapter) == _SUCCESS) ? (0) : (-1);
+		status = (ips_netdrv_open(padapter) == _SUCCESS) ? (0) : (-1);
 	}
 
 	return status;
@@ -980,7 +994,8 @@ void rtw_dev_unload(struct adapter *padapter)
 	if (padapter->bup) {
 		padapter->bDriverStopped = true;
 		if (padapter->xmitpriv.ack_tx)
-			rtw_ack_tx_done(&padapter->xmitpriv, RTW_SCTX_DONE_DRV_STOP);
+			rtw_ack_tx_done(&padapter->xmitpriv,
+					RTW_SCTX_DONE_DRV_STOP);
 
 		if (padapter->intf_stop)
 			padapter->intf_stop(padapter);
@@ -996,14 +1011,15 @@ void rtw_dev_unload(struct adapter *padapter)
 		}
 
 		/* check the status of IPS */
-		if (rtw_hal_check_ips_status(padapter) || pwrctl->rf_pwrstate == rf_off) {
+		if (rtw_hal_check_ips_status(padapter) ||
+		    pwrctl->rf_pwrstate == rf_off) {
 			/* check HW status and SW state */
 			netdev_dbg(padapter->pnetdev,
 				   "%s: driver in IPS-FWLPS\n", __func__);
 			LeaveAllPowerSaveMode(padapter);
 		} else {
-			netdev_dbg(padapter->pnetdev,
-				   "%s: driver not in IPS\n", __func__);
+			netdev_dbg(padapter->pnetdev, "%s: driver not in IPS\n",
+				   __func__);
 		}
 
 		if (!padapter->bSurpriseRemoved) {
@@ -1024,13 +1040,14 @@ static int rtw_suspend_free_assoc_resource(struct adapter *padapter)
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	if (rtw_chk_roam_flags(padapter, RTW_ROAM_ON_RESUME)) {
-		if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)
-			&& check_fwstate(pmlmepriv, _FW_LINKED)) {
+		if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) &&
+		    check_fwstate(pmlmepriv, _FW_LINKED)) {
 			rtw_set_to_roam(padapter, 1);
 		}
 	}
 
-	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) && check_fwstate(pmlmepriv, _FW_LINKED)) {
+	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) &&
+	    check_fwstate(pmlmepriv, _FW_LINKED)) {
 		rtw_disassoc_cmd(padapter, 0, false);
 		/* s2-2.  indicate disconnect to os */
 		rtw_indicate_disconnect(padapter);
@@ -1067,7 +1084,8 @@ static void rtw_suspend_normal(struct adapter *padapter)
 
 	rtw_suspend_free_assoc_resource(padapter);
 
-	if ((rtw_hal_check_ips_status(padapter)) || (adapter_to_pwrctl(padapter)->rf_pwrstate == rf_off))
+	if ((rtw_hal_check_ips_status(padapter)) ||
+	    (adapter_to_pwrctl(padapter)->rf_pwrstate == rf_off))
 		netdev_dbg(padapter->pnetdev,
 			   "%s: ### ERROR #### driver in IPS ####ERROR###!!!\n",
 			   __func__);
@@ -1094,7 +1112,8 @@ void rtw_suspend_common(struct adapter *padapter)
 	while (pwrpriv->bips_processing)
 		msleep(1);
 
-	if ((!padapter->bup) || (padapter->bDriverStopped) || (padapter->bSurpriseRemoved))
+	if ((!padapter->bup) || (padapter->bDriverStopped) ||
+	    (padapter->bSurpriseRemoved))
 		return;
 
 	rtw_ps_deny(padapter, PS_DENY_SUSPEND);
@@ -1143,7 +1162,9 @@ static int rtw_resume_process_normal(struct adapter *padapter)
 	}
 	rtw_sdio_disable_interrupt(padapter);
 	/* if (sdio_alloc_irq(adapter_to_dvobj(padapter)) != _SUCCESS) */
-	if ((padapter->intf_alloc_irq) && (padapter->intf_alloc_irq(adapter_to_dvobj(padapter)) != _SUCCESS)) {
+	if ((padapter->intf_alloc_irq) &&
+	    (padapter->intf_alloc_irq(adapter_to_dvobj(padapter)) !=
+	     _SUCCESS)) {
 		ret = -1;
 		goto exit;
 	}
-- 
2.54.0

