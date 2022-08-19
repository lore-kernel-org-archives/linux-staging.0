Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0993217
	for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 13:50:37 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id a7so8961054ejp.2
        for <linux-staging@lists.linux.dev>; Fri, 19 Aug 2022 06:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=jThNKOG1gbtfk0tZNZ5jZtMKT0ivZg17/ZD4Mra2nmw=;
        b=hkMg4woO4O4YPQl9Qc9nv8LnpMM2SEtRMG0+8LtvnRQrjx5pPa1y0jTXY8RdUen1zd
         JPU3cqjT/62bZIXVBqfpkCu6/7KtXjSFmTrrovR036j+XzG1ZvGHJthbjDZlOLwN5jrk
         Rb3jTEm3nfK9+SGFTk//YoMfz6DyHUacfRb8lDmhmcMqY/V9p3jnm53l/2i21nKRx6i9
         5uZ5L3VeAKR5Ap+heJs4BzekxDH7WI8Z4I2wsoXWESPX6DUb5YKndGa5bc0WzQMavjN3
         l85YXUb6a5cU/e9QT8QLIlY/3gddrq1jAvbnrl/SeElFWWdGGeU+e/3/6okRHAlj+KBa
         owPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=jThNKOG1gbtfk0tZNZ5jZtMKT0ivZg17/ZD4Mra2nmw=;
        b=fm3dTcPikmoeGdEh8bT5ZrKHWmWmcUuqBg+aPm+JZHjK3PEs3Jpikgg5lD2Yb/PyC1
         WPTtXDJrK9wg69Zekv7NuCi52CGuSUsYIFSDEbToxrLnqp542a9EVDyHFpp4bC2EOQOg
         43/Xw2HWaDujzUliB0vNM6xC8C5D55ksLNbmc/u297P/dUw7TW+BV+piqVePCBoy5G+0
         +0gMH+HWmSQ/aGVauuhD+drbSGeYlwNGO9EyzPpsjPVw12SdL/v2LlRy3k3jOOVGlQDT
         yT7o31LErSJFjxsoRYsa1Pff+VbeY7I36osxX8tgfxSEQJKGEeAvfQa11o45/j8e2j71
         Kwnw==
X-Gm-Message-State: ACgBeo26W5BhvMice2vWcSSeFCLu/ela4hS60r4GiJ3kSpz6GKkvt2+Y
	nAixc/mbN94z3nSq9yK6akThxUDJ8Du1dg==
X-Google-Smtp-Source: AA6agR7yptWZX9XA4DNKhtOYFQvkiQUVYk5xXU8+PeMmc0AEDWDM3I968igdDsXnPSQwmWZDyQXJhg==
X-Received: by 2002:a17:907:843:b0:73a:5b0e:8352 with SMTP id ww3-20020a170907084300b0073a5b0e8352mr4911753ejb.438.1660917035485;
        Fri, 19 Aug 2022 06:50:35 -0700 (PDT)
Received: from nam-dell.ucebne.fiit.stuba.sk ([147.175.148.17])
        by smtp.gmail.com with ESMTPSA id i8-20020a17090671c800b0073087140945sm2313821ejk.123.2022.08.19.06.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 06:50:35 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: lkp@intel.com
Cc: Larry.Finger@lwfinger.net,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	namcaov@gmail.com
Subject: [PATCH v2 8/8] staging: rtl8723bs: remove static const variable odm_comp_str
Date: Fri, 19 Aug 2022 15:49:42 +0200
Message-Id: <678b03dad7217e70e61074d11975319cb1c1828c.1660916523.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660916523.git.namcaov@gmail.com>
References: <cover.1660916523.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

because it is not used.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/linux-staging/202208192018.BfgiZyOY-lkp@intel.com/
Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_odm.c | 35 ------------------------
 1 file changed, 35 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_odm.c b/drivers/staging/rtl8723bs/core/rtw_odm.c
index 58b6299ed9d7..47fd2ee9bb9f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_odm.c
+++ b/drivers/staging/rtl8723bs/core/rtw_odm.c
@@ -10,41 +10,6 @@
 #include <rtw_odm.h>
 #include <hal_data.h>
 
-static const char * const odm_comp_str[] = {
-	/* BIT0 */"ODM_COMP_DIG",
-	/* BIT1 */"ODM_COMP_RA_MASK",
-	/* BIT2 */"ODM_COMP_DYNAMIC_TXPWR",
-	/* BIT3 */"ODM_COMP_FA_CNT",
-	/* BIT4 */"ODM_COMP_RSSI_MONITOR",
-	/* BIT5 */"ODM_COMP_CCK_PD",
-	/* BIT6 */"ODM_COMP_ANT_DIV",
-	/* BIT7 */"ODM_COMP_PWR_SAVE",
-	/* BIT8 */"ODM_COMP_PWR_TRAIN",
-	/* BIT9 */"ODM_COMP_RATE_ADAPTIVE",
-	/* BIT10 */"ODM_COMP_PATH_DIV",
-	/* BIT11 */"ODM_COMP_PSD",
-	/* BIT12 */"ODM_COMP_DYNAMIC_PRICCA",
-	/* BIT13 */"ODM_COMP_RXHP",
-	/* BIT14 */"ODM_COMP_MP",
-	/* BIT15 */"ODM_COMP_DYNAMIC_ATC",
-	/* BIT16 */"ODM_COMP_EDCA_TURBO",
-	/* BIT17 */"ODM_COMP_EARLY_MODE",
-	/* BIT18 */NULL,
-	/* BIT19 */NULL,
-	/* BIT20 */NULL,
-	/* BIT21 */NULL,
-	/* BIT22 */NULL,
-	/* BIT23 */NULL,
-	/* BIT24 */"ODM_COMP_TX_PWR_TRACK",
-	/* BIT25 */"ODM_COMP_RX_GAIN_TRACK",
-	/* BIT26 */"ODM_COMP_CALIBRATION",
-	/* BIT27 */NULL,
-	/* BIT28 */NULL,
-	/* BIT29 */NULL,
-	/* BIT30 */"ODM_COMP_COMMON",
-	/* BIT31 */"ODM_COMP_INIT",
-};
-
 #define RTW_ODM_COMP_MAX 32
 
 static const char * const odm_ability_str[] = {
-- 
2.25.1

