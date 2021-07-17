Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADE172
	for <linux-staging@lists.linux.dev>; Sat, 17 Jul 2021 14:57:00 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id f17so15531739wrt.6
        for <linux-staging@lists.linux.dev>; Sat, 17 Jul 2021 07:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NRZ7g2XupwJPq+x4HLucSDiltZoeOFMk7jUDnIg2pRU=;
        b=MNjWiC0A30y9Vpj9ZekYZ/22+NtGO22u5VfsDjmtAtgTqxNxBTLvtA0GCGzCqj0kJT
         dG1SBUNqdxAw0gqidh5lJF+lmyEnBBQCXy18rPpWiD4xvgWTGvxvMHiAbJm6A/xVP5hu
         9eHv77UJlYRymdwtOcD2V4FTDoveEsYu9OA7DTPJKtO61VfSzgN73yYHhHLGkO1HNeMf
         tcyo94rbRNbSjwNGcEJU4YOM2kjuUF5v6nGQ3MWYmdmZgT1LaXXchc16cxiLXpqv/AuO
         aZNW/JUvGWN37M/2t3mIgOKTHBy47HZLxmSGM9pEr34quwQBrLo8gHfTzygLWVtLR0lQ
         1Z0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NRZ7g2XupwJPq+x4HLucSDiltZoeOFMk7jUDnIg2pRU=;
        b=PSDwNig2wJz7XCCQMVVI0xoQAwkLO8Z/UtPA3CTjY8DSwJsXYUF243ahLmQu4j9GBZ
         S+Ryx2eS6ozhf82inWd1w4/If+frcn8F3759stOCbusaHdPue3/6C1kM3QoxJJyJCepM
         zFTYe853UCKQsBV14qjtjLKWMTXwMI0OpL0IThHuM3TlTX47sFdikdaWFg3AGbyi0id+
         UZXXCzv5WuMa5qN4QWeuGmJwT6sswTOfkvAl9QwIDULEhZ6INFH7PpWy+0pa5NC7SyZi
         uHeK7kG8RCXShhmc4u8qYPd1EaEyDnolqk3YJVKdttGEa85/8HIbENUzXyfSKxCtL8D7
         j4MQ==
X-Gm-Message-State: AOAM531FZ+bhJpDVMxaVgmjB260KaX+N7RkLFyXghdYopajfiOgt+MuM
	y+7jGlHl/YTGmKDIYhnpSLU=
X-Google-Smtp-Source: ABdhPJyXYL2OzAteDl1mDzZrKNsBqj1p9Xw8qn7f4+HhMfomNns74ibiSNlSpdWzDkYbCbofS6QYhQ==
X-Received: by 2002:a5d:568a:: with SMTP id f10mr174796wrv.293.1626533819161;
        Sat, 17 Jul 2021 07:56:59 -0700 (PDT)
Received: from agape ([5.171.72.101])
        by smtp.gmail.com with ESMTPSA id p2sm10939508wmg.6.2021.07.17.07.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 07:56:59 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/10] staging: rtl8723bs: fix camel case name in macro IsLegacyOnly()
Date: Sat, 17 Jul 2021 16:56:45 +0200
Message-Id: <52656190cefed1b0f9a2dd6dcb080adf2ca0a89b.1626533647.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1626533647.git.fabioaiuto83@gmail.com>
References: <cover.1626533647.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix camel case name in macro IsLegacyOnly()

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    | 2 +-
 drivers/staging/rtl8723bs/include/ieee80211.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index 3b0573885dce..8ec8f283893b 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -401,7 +401,7 @@ static u8 halbtcoutsrc_Get(void *pBtcContext, u8 getType, void *pOutBuf)
 		break;
 
 	case BTC_GET_U4_WIFI_BW:
-		if (IsLegacyOnly(mlmeext->cur_wireless_mode))
+		if (is_legacy_only(mlmeext->cur_wireless_mode))
 			*pU4Tmp = BTC_WIFI_BW_LEGACY;
 		else if (pHalData->CurrentChannelBW == CHANNEL_WIDTH_20)
 			*pU4Tmp = BTC_WIFI_BW_HT20;
diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index b2c1a7dafcee..ea1800de3ef8 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -154,7 +154,7 @@ enum network_type {
 
 #define SUPPORTED_24G_NETTYPE_MSK (WIRELESS_11B | WIRELESS_11G | WIRELESS_11_24N)
 
-#define IsLegacyOnly(NetType)  ((NetType) == ((NetType) & (WIRELESS_11BG)))
+#define is_legacy_only(NetType)  ((NetType) == ((NetType) & (WIRELESS_11BG)))
 
 #define IsSupported24G(NetType) ((NetType) & SUPPORTED_24G_NETTYPE_MSK ? true : false)
 
-- 
2.20.1

