Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847522596
	for <linux-staging@lists.linux.dev>; Thu,  7 Apr 2022 19:28:28 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id x20so7568916edi.12
        for <linux-staging@lists.linux.dev>; Thu, 07 Apr 2022 12:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+0bJLwilh7WH2dJze8SpTafU8NcKHXjFenPKKfg6dz0=;
        b=dnl4yaFuJmzRJC1dsaooha0LilBinNwtGkCoaNEJhxbia6EkFOwbDMQLmz053BoCZM
         8mk/PkRWyc25WSQYa/2LGIPgHq+ANdc3PNw9ywtwNp3puDiAle5l9Ti19+NSHNS6h+9s
         I2OXARH9wZrMHvzQFCSKKd2YnJByv9LE7wafacsQQXZMHfgCCj6LNEJ4sOkfuVXE73q/
         DsLE5Ose7jz0ClePmdd1EJyycSgby8ALw6GCRRwfqGTMlIc7P1XCqSssNBrn4W6s9u5W
         BomzNtPs/LKVp0NUCNExJRe10BAf4Mfu7QUAX2X5/oy/VE282vfMLF+NGRBD3mhEYZkd
         Kg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+0bJLwilh7WH2dJze8SpTafU8NcKHXjFenPKKfg6dz0=;
        b=KiQ2vwj9Syg785dHgDRFTTcxnQT2baR3U1DrBQxd0hhDEdLEEqpI6J1T7zrqkLR4cN
         dWAu5TELFXaF5WAEhKoeE64n234LTZFVLR6mn+H6ecYUsCKpFBdMEU3Xl77q4jWBxCX8
         geOmlvn94hR1oAP8zNrJYQSqoXSoyF5vgRyX+Eh30ERYjtccyxjccDDfZB87I1P0nuPN
         40HM+snbxV5bDek2d6LlFA/fc8shQgYT1zkzVUk7QjW67X1yw8dhtlte37GrjMx6UIwW
         9jya4hv4FMg3jHFDwHyXCmG+IeUYYtwXWGb9AZ++DKdrWXSHELKVmbsDUtN49Wh7ezRu
         uv3Q==
X-Gm-Message-State: AOAM533vuTASn6U1k340vLr+KtrYezj2fNe+5V8Mr7P2D6lCRBTr9F8o
	jlLXAR9phewT9g6224Mvm9M=
X-Google-Smtp-Source: ABdhPJyyQYuQXxG644w9SUnoQFO/aKp53IZJZzJXHr158yoRDweK+HSZIsQB7ggegFWEDrPbpl1BBw==
X-Received: by 2002:a05:6402:d0a:b0:418:ec3b:2242 with SMTP id eb10-20020a0564020d0a00b00418ec3b2242mr16149692edb.229.1649359706885;
        Thu, 07 Apr 2022 12:28:26 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id k14-20020a50e18e000000b0041b6f23f7f6sm9652798edl.22.2022.04.07.12.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 12:28:26 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 5/8] staging: r8188eu: remove unused enums from odm.h
Date: Thu,  7 Apr 2022 21:28:16 +0200
Message-Id: <20220407192819.10661-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407192819.10661-1-straube.linux@gmail.com>
References: <20220407192819.10661-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused enums from odm.h.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/odm.h | 29 ---------------------------
 1 file changed, 29 deletions(-)

diff --git a/drivers/staging/r8188eu/include/odm.h b/drivers/staging/r8188eu/include/odm.h
index 1902aa48a255..f131e17167bf 100644
--- a/drivers/staging/r8188eu/include/odm.h
+++ b/drivers/staging/r8188eu/include/odm.h
@@ -98,22 +98,6 @@ struct odm_per_pkt_info {
 	bool	bPacketBeacon;
 };
 
-enum odm_ability {
-	/*  BB Team */
-	ODM_DIG			= 0x00000001,
-	ODM_HIGH_POWER		= 0x00000002,
-	ODM_CCK_CCA_TH		= 0x00000004,
-	ODM_FA_STATISTICS	= 0x00000008,
-	ODM_RAMASK		= 0x00000010,
-	ODM_RSSI_MONITOR	= 0x00000020,
-	ODM_SW_ANTDIV		= 0x00000040,
-	ODM_HW_ANTDIV		= 0x00000080,
-	ODM_BB_PWRSV		= 0x00000100,
-	ODM_2TPATHDIV		= 0x00000200,
-	ODM_1TPATHDIV		= 0x00000400,
-	ODM_PSD2AFH		= 0x00000800
-};
-
 /*  2011/10/20 MH Define Common info enum for all team. */
 
 enum odm_common_info_def {
@@ -137,19 +121,6 @@ enum odm_ability_def {
 
 # define ODM_ITRF_USB 0x2
 
-/*  ODM_CMNINFO_OP_MODE */
-enum odm_operation_mode {
-	ODM_NO_LINK		= BIT(0),
-	ODM_LINK		= BIT(1),
-	ODM_SCAN		= BIT(2),
-	ODM_POWERSAVE		= BIT(3),
-	ODM_AP_MODE		= BIT(4),
-	ODM_CLIENT_MODE		= BIT(5),
-	ODM_AD_HOC		= BIT(6),
-	ODM_WIFI_DIRECT		= BIT(7),
-	ODM_WIFI_DISPLAY	= BIT(8),
-};
-
 /*  ODM_CMNINFO_WM_MODE */
 enum odm_wireless_mode {
 	ODM_WM_UNKNOW	= 0x0,
-- 
2.35.1

