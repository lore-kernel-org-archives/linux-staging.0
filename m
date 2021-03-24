Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2218770
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:45:05 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id o16so24326189wrn.0
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 05:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fDAWHI11TFBSvQcSquWRPs9RneTeKUGlagYlBmaWGmE=;
        b=JTg/hIzAabK+0cSsKovuVkZZxFipCrWkgMpWK64tUVC0D5yGoy7eS1n5aezXi2nT02
         kOYMhML42TkTtkDGOQ9GrCuSjPjsLR/jXWqSTrQfyeUvDFCimNTz+vz/z05YAlzsgyWu
         vC1XY1QqV/8sBHoYJN1ZSlZPY5gtXykKbOBr9qBRqjpbYhmsrkPKYhzuGHCEbU4NYXT/
         67ZCWjkDndS4w4MF4qpV2uWO18vCh90l7xWk+Kna0vsvX3+HyL59IK0SSNL7MJLds8oi
         c1b9S9oFAFhsE69B6MeiPjYrYZ0glbHFNsX7N9nidPt4RYIL1IMpScpIyjfH1zsnifzX
         lcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fDAWHI11TFBSvQcSquWRPs9RneTeKUGlagYlBmaWGmE=;
        b=AnVRO1jMg+OvUhvH3UC3uVT/Q9FjvNpsJUny6lxycCa+yLdMOb+GajdRwQZL32KgDc
         DsU6ScpGkdlNAvREEh8YpBrVNKHXadTlZUlM4SkH2auGfF+XlHiVAp2CDFsgGhrj5mXH
         vCHmJvT/xESi+WhL1CeVljuWcNjoIVFRamCzxU8dv6QxsxfZ0Ll+ygjEQFGtZtjJCd1U
         6YdejpqL6UmZWRWXQGgwKqqh1SZm2tky3x79BHCqC5oKaWmwyZjymZtrMS4rRfv8URqR
         InssRAFmweSKQW+uielPV4u4UmJIt+YZBl26xaulJbrhPAi3HIPUld1AlXQsTQVGZWX+
         WomA==
X-Gm-Message-State: AOAM530w4OjMGadLhFTD1Fhogq5ILkf2omDJixBFgTrn5ZjMA1JouTdr
	EvjW+1ELwCkuUUaP5j2wQCk=
X-Google-Smtp-Source: ABdhPJyrvDwBeztB31XSTIypCOznoZBcXHYJZoyC6e5cyMm4Ftd5iHj9u/jnuBxFV3athXM6gR+8wA==
X-Received: by 2002:adf:e60a:: with SMTP id p10mr3303503wrm.291.1616589903651;
        Wed, 24 Mar 2021 05:45:03 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id s20sm2324005wmj.36.2021.03.24.05.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:45:03 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 18/33] Staging: rtl8723bs: remove named enums in hal_phy.h
Date: Wed, 24 Mar 2021 13:44:41 +0100
Message-Id: <20210324124456.25221-19-marcocesati@gmail.com>
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
include/hal_phy.h:

	enum rf_type			[name]
	enum antenna_path		[definition]
	enum rf_content			[definition]
	enum BaseBand_Config_Type	[definition]
	enum hw_block			[definition]

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_phy.h | 44 +--------------------
 1 file changed, 1 insertion(+), 43 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_phy.h b/drivers/staging/rtl8723bs/include/hal_phy.h
index 90bb5d784674..bf17a85b5959 100644
--- a/drivers/staging/rtl8723bs/include/hal_phy.h
+++ b/drivers/staging/rtl8723bs/include/hal_phy.h
@@ -49,7 +49,7 @@ enum band_type {
 	BANDMAX
 };
 
-enum rf_type {
+enum {
 	RF_TYPE_MIN = 0,	/*  0 */
 	RF_8225 = 1,		/*  1 11b/g RF for verification only */
 	RF_8256 = 2,		/*  2 11b/g/n */
@@ -74,48 +74,6 @@ enum rf_path {
 #define	RF_PATH_MAX_92C_88E		2
 #define	RF_PATH_MAX_90_8812		4	/* Max RF number 90 support */
 
-enum antenna_path {
-       ANTENNA_NONE	= 0,
-	ANTENNA_D	= 1,
-	ANTENNA_C	= 2,
-	ANTENNA_CD	= 3,
-	ANTENNA_B	= 4,
-	ANTENNA_BD	= 5,
-	ANTENNA_BC	= 6,
-	ANTENNA_BCD	= 7,
-	ANTENNA_A	= 8,
-	ANTENNA_AD	= 9,
-	ANTENNA_AC	= 10,
-	ANTENNA_ACD	= 11,
-	ANTENNA_AB	= 12,
-	ANTENNA_ABD	= 13,
-	ANTENNA_ABC	= 14,
-	ANTENNA_ABCD	= 15
-};
-
-enum rf_content {
-	radioa_txt = 0x1000,
-	radiob_txt = 0x1001,
-	radioc_txt = 0x1002,
-	radiod_txt = 0x1003
-};
-
-enum BaseBand_Config_Type {
-	BaseBand_Config_PHY_REG = 0,			/* Radio Path A */
-	BaseBand_Config_AGC_TAB = 1,			/* Radio Path B */
-	BaseBand_Config_AGC_TAB_2G = 2,
-	BaseBand_Config_AGC_TAB_5G = 3,
-	BaseBand_Config_PHY_REG_PG
-};
-
-enum hw_block {
-	HW_BLOCK_MAC = 0,
-	HW_BLOCK_PHY0 = 1,
-	HW_BLOCK_PHY1 = 2,
-	HW_BLOCK_RF = 3,
-	HW_BLOCK_MAXIMUM = 4, /*  Never use this */
-};
-
 enum wireless_mode {
 	WIRELESS_MODE_UNKNOWN = 0x00,
 	WIRELESS_MODE_A = 0x01,
-- 
2.30.2

