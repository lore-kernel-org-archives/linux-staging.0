Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307FD71
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 12:45:14 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id d8-20020a1c1d080000b029010f15546281so1103037wmd.4
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 05:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xuzQe0Ozh4jxHPC58sqIaZ7FWnUuhCC/Ju6WKG/BFvg=;
        b=DQo2Pl2sTeigPZpsoah1c6+KWRxdyHBSagyCpESdl8E7VdhJrLJWz+7b7ovXyXhPfO
         MekRaph8Tcq5KYXBI42qN9lL7UXFUCKpGtkLPLr9RQ0FZA5mo8GOhPJxCQy6IFsFqSLd
         +SZE6uzgu6BdtafeZbwHSHbrXX9kti7G4TZNEvBaYruMDtq72G4QMpSZFT5PIELEsynd
         CspMWf247iBOjwZEBjM3DI/7H3MpAUYsPoW0r9S92oVpR8B2e1756tBhb6MS197ukwKm
         pQRPiqJGv/msSa0l0CJuPWnHdYpeSaIiUhApa8NMXotLjtiqZCEyZxeWsFrn7nAhogvQ
         ntqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xuzQe0Ozh4jxHPC58sqIaZ7FWnUuhCC/Ju6WKG/BFvg=;
        b=rfODs8C+VLr7YIyi7ok8QkbOJrp9CI9RfbxXv1sA+teSYMFUb3mShprh3OSp7APBG/
         F0gRVjPSO61c48jEClnn7fgKGw4Awk1yE/wrrlnGotH9O5vpBfGr7Jubs6ijudBuEenb
         vEmDstJWdB8rR0Q3l81AWpx/fTBK2KuCW0OdFDqZXL6p0q89v0vR35FwF7HCFvO0ZdW/
         3hdzLaY/6YA5fJ4lM/M+Fysd1oXPdjII4LaLgTFIPbTBU+4vMRbPQzzjxwHA3vtO1sH9
         kHyRKq++hP1qkNiS8ERnH3YGaHsS/HlebwlxyH3WwOFbbi15avA0MS/8yapw0Q2SLpOJ
         X+sA==
X-Gm-Message-State: AOAM530gM8JF7fmambpkQylvk3I6ZRh5S0UAakezCPQcixUsx2BtbYiN
	CJ61qZ5dNrAxa1y+K1Fz5GdrFfn5O/Y=
X-Google-Smtp-Source: ABdhPJzQhSErm2Bx223tdQK8MeKO1FOiy/Orv4JbFfkZMik80HnTzyukAL/gnW5Vy5ix38M/brRd4w==
X-Received: by 2002:a1c:43c6:: with SMTP id q189mr2785191wma.80.1616589912730;
        Wed, 24 Mar 2021 05:45:12 -0700 (PDT)
Received: from gimli.home (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id s20sm2324005wmj.36.2021.03.24.05.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:45:12 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev
Subject: [PATCH 28/33] Staging: rtl8723bs: remove named enums in HalBtc8723b1Ant.h
Date: Wed, 24 Mar 2021 13:44:51 +0100
Message-Id: <20210324124456.25221-29-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324124456.25221-1-marcocesati@gmail.com>
References: <20210324124456.25221-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unnecessary enum names in
hal/HalBtc8723b1Ant.h:

	enum bt_info_src_8723b_1ant
	enum bt_8723b_1ant_bt_status
	enum bt_8723b_1ant_wifi_status
	enum bt_8723b_1ant_coex_algo

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h
index ed569e77e518..59e8c68cdc20 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.h
@@ -21,14 +21,14 @@
 
 #define  BT_8723B_1ANT_WIFI_NOISY_THRESH 30   /* max: 255 */
 
-enum bt_info_src_8723b_1ant {
+enum {
 	BT_INFO_SRC_8723B_1ANT_WIFI_FW			= 0x0,
 	BT_INFO_SRC_8723B_1ANT_BT_RSP				= 0x1,
 	BT_INFO_SRC_8723B_1ANT_BT_ACTIVE_SEND		= 0x2,
 	BT_INFO_SRC_8723B_1ANT_MAX
 };
 
-enum bt_8723b_1ant_bt_status {
+enum {
 	BT_8723B_1ANT_BT_STATUS_NON_CONNECTED_IDLE	= 0x0,
 	BT_8723B_1ANT_BT_STATUS_CONNECTED_IDLE		= 0x1,
 	BT_8723B_1ANT_BT_STATUS_INQ_PAGE				= 0x2,
@@ -38,7 +38,7 @@ enum bt_8723b_1ant_bt_status {
 	BT_8723B_1ANT_BT_STATUS_MAX
 };
 
-enum bt_8723b_1ant_wifi_status {
+enum {
 	BT_8723B_1ANT_WIFI_STATUS_NON_CONNECTED_IDLE           = 0x0,
 	BT_8723B_1ANT_WIFI_STATUS_NON_CONNECTED_ASSO_AUTH_SCAN = 0x1,
 	BT_8723B_1ANT_WIFI_STATUS_CONNECTED_SCAN               = 0x2,
@@ -48,7 +48,7 @@ enum bt_8723b_1ant_wifi_status {
 	BT_8723B_1ANT_WIFI_STATUS_MAX
 };
 
-enum bt_8723b_1ant_coex_algo {
+enum {
 	BT_8723B_1ANT_COEX_ALGO_UNDEFINED		= 0x0,
 	BT_8723B_1ANT_COEX_ALGO_SCO				= 0x1,
 	BT_8723B_1ANT_COEX_ALGO_HID				= 0x2,
-- 
2.30.2

