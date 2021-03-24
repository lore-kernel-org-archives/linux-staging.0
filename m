Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E626F
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:45:07 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id t5-20020a1c77050000b029010e62cea9deso1131125wmi.0
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 05:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Us9j0h64R1xkmeKgSaZKsYNtku5ao1aT8n4cJz9Krao=;
        b=m6t/5SIO73KOWT4887qMP2ciZEdwnJQABJThpBFAY7uBbaNPCPir94VX1bwnrL6DrD
         /btG6Ah11uuPFgK83bNWxXW8WrSHxDKPtLVXhEb8oCaFDX8jJYda8mUsqRSTgudiI3Y2
         0HnvsBB/mqaRk2/HxzqrR4sTBXSiTsvWO5HTt1iXsyQR2m9Bf+bw9bO1XxH3WbcqaJDu
         RTIEROOgc4TwyQicOrVbjpDh+Lw4eAzFebY5VddLZ5EKIuJ0johk967wSJ5hsX47CmS5
         UcPkPUozZk7CZspWHRiV9wK+u6zL8pNFXoTgnGDDh4a5ALsVID6sWxGpfWjQHOmN7M+E
         iCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Us9j0h64R1xkmeKgSaZKsYNtku5ao1aT8n4cJz9Krao=;
        b=pek29KyGt6FhPYT4/ZMJxcDA7zsUAFx/rI8VOCsxDUkmgz7zgLn+jqAKn8PtenL1pp
         yqT5Jdf+yVvs+Ldn6McrHjbF6qYT5OiD8WCYUM/d1QCDSH+qsqjpKQymOtrmaK67wp8G
         1GEQZGNkTIgjX391qfXcTXhesTHQGHXCHTi5ArBJPHesVC7sq101GGHxf1E79hNryWsA
         aL4p0dePZTk0Dmap+Vqb52vzY5NANcY3sw4suu7cvjkdbCVXXa34gH900dVTt5gDqX28
         svrMqWNVrKTCr+iOmG45izrAJ5ZfBvuHtDgvym/NzUr5HDsmMgN3c2Ov0vQJZ3mSNCTC
         R/9A==
X-Gm-Message-State: AOAM530h4hoxMEbc/0IEMvPG16u94Ij/HfW3PRg3aoJgU0UZUenNaNNP
	0LNeT8l8Cbxuq0PkC3MbGKjiINowxqo=
X-Google-Smtp-Source: ABdhPJwGb4VNOYAaNVsdOUmrwzjspVjHuPdumqXNGnX1Puwt7sAQX4MP7HBU8ZzIK9GTHE9JmKDxzw==
X-Received: by 2002:a05:600c:3546:: with SMTP id i6mr2764578wmq.104.1616589906234;
        Wed, 24 Mar 2021 05:45:06 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id s20sm2324005wmj.36.2021.03.24.05.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:45:05 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 21/33] Staging: rtl8723bs: remove named enums in rtw_rf.h
Date: Wed, 24 Mar 2021 13:44:44 +0100
Message-Id: <20210324124456.25221-22-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324124456.25221-1-marcocesati@gmail.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum names or definitions in
include/rtw_rf.h:

	enum capability				[name]
	enum   _reg_preamble_mode		[name]
	enum _rtl8712_rf_mimo_config_		[definition]
	enum rf90_radio_path			[definition]
	enum vht_data_sc			[name]
	enum protection_mode			[definition]
	enum rt_rf_type_definition		[name]

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_rf.h | 32 +++-------------------
 1 file changed, 4 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_rf.h b/drivers/staging/rtl8723bs/include/rtw_rf.h
index a8ddd6fe5f95..cb6beccd3d23 100644
--- a/drivers/staging/rtl8723bs/include/rtw_rf.h
+++ b/drivers/staging/rtl8723bs/include/rtw_rf.h
@@ -49,7 +49,7 @@ struct	regulatory_class {
 	u8 modem;
 };
 
-enum capability {
+enum {
 	cESS			= 0x0001,
 	cIBSS			= 0x0002,
 	cPollable		= 0x0004,
@@ -68,30 +68,12 @@ enum capability {
 	cImmediateBA		= 0x8000,
 };
 
-enum	_reg_preamble_mode {
+enum {
 	PREAMBLE_LONG	= 1,
 	PREAMBLE_AUTO	= 2,
 	PREAMBLE_SHORT	= 3,
 };
 
-enum _rtl8712_rf_mimo_config_ {
-	RTL8712_RFCONFIG_1T = 0x10,
-	RTL8712_RFCONFIG_2T = 0x20,
-	RTL8712_RFCONFIG_1R = 0x01,
-	RTL8712_RFCONFIG_2R = 0x02,
-	RTL8712_RFCONFIG_1T1R = 0x11,
-	RTL8712_RFCONFIG_1T2R = 0x12,
-	RTL8712_RFCONFIG_TURBO = 0x92,
-	RTL8712_RFCONFIG_2T2R = 0x22
-};
-
-enum rf90_radio_path {
-	RF90_PATH_A = 0,		/* Radio Path A */
-	RF90_PATH_B = 1,		/* Radio Path B */
-	RF90_PATH_C = 2,		/* Radio Path C */
-	RF90_PATH_D = 3			/* Radio Path D */
-};
-
 /*  Bandwidth Offset */
 #define HAL_PRIME_CHNL_OFFSET_DONT_CARE	0
 #define HAL_PRIME_CHNL_OFFSET_LOWER	1
@@ -116,7 +98,7 @@ enum extchnl_offset {
 	EXTCHNL_OFFSET_LOWER = 3,
 };
 
-enum vht_data_sc {
+enum {
 	VHT_DATA_SC_DONOT_CARE = 0,
 	VHT_DATA_SC_20_UPPER_OF_80MHZ = 1,
 	VHT_DATA_SC_20_LOWER_OF_80MHZ = 2,
@@ -130,14 +112,8 @@ enum vht_data_sc {
 	VHT_DATA_SC_40_LOWER_OF_80MHZ = 10,
 };
 
-enum protection_mode {
-	PROTECTION_MODE_AUTO = 0,
-	PROTECTION_MODE_FORCE_ENABLE = 1,
-	PROTECTION_MODE_FORCE_DISABLE = 2,
-};
-
 /* 2007/11/15 MH Define different RF type. */
-enum rt_rf_type_definition {
+enum {
 	RF_1T2R = 0,
 	RF_2T4R = 1,
 	RF_2T2R = 2,
-- 
2.30.2

