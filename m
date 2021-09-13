Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74983FD6
	for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 09:08:46 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id n7-20020a05600c3b8700b002f8ca941d89so6054685wms.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 02:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dWddowtjyk1Uc61FZ0bRYGwwJtt/XvaceqzwrrdgUVg=;
        b=CdhNdUbgUrBIuq3DT6QPOH6y1AheJ9VkEwSdG8aeZ+nlN6Ya5Yz1Mc9SYezxg8QskH
         vTtpkJcyQdDFu6qRBzLFmw5tsoE8re6Nia6r/zb4dj4Fz7cuj6eGWJ8iwdY2LHoRsphE
         ujrAvUaD8RSfxZBhh5rq66hHOUVNR0rKs9Ob7fnFFctQx2CSnqwrcKc1aSpcID8WlcuX
         8hMH74sdt5uWNgiava6i3PUtMLqZ1mvyIA78QXkFzMzLtJcCEw46xCXZ9rXznBO0FYag
         kHPnS8LvDcLGxNl+5LzaVr50AGmHZUC9JFql9Cq0wXeRVAKrEDsPZNBrIZIlku3cYUe6
         B4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dWddowtjyk1Uc61FZ0bRYGwwJtt/XvaceqzwrrdgUVg=;
        b=ClB0F4uJxRdLoW74cjny7/WhzqU6N/oc6KdWX7GOFl3YR4eFo1zmIK1peRgZLjJW+g
         kklL116b9Mt8aOUwIPoTcaWWY1ND4uHO1eWhKyEyj4TwUpscMS8Gym8wD2kU0n0pEG2L
         QZ11y01DJiKHvmQsM4+n3K+4wMpyqvK3G4a7pbzB26YCzRmJGD9oFSkcMdDssAR7eXBx
         I4/axspXjXiPwzarOhjqXsZr916S4+DFyj1XZazqFri+q4yv7LmzY30KjD8RiIIhSDkt
         5MyWUhwkqQ9qKEPzMEre2DiWve6hGzP9z9YDsXRwAnbULdy07sRbM/cwk4AD1WDFWsKC
         +LtQ==
X-Gm-Message-State: AOAM531owxN5NLPx0Piz2uBQZvv/LcQcLEExQciTpYA49GLdXa+NW8PL
	DLlCm8dowTCYbluyUGyQXmg=
X-Google-Smtp-Source: ABdhPJw4uxV3nVhdrStC5JYU+gJVmQaGvl6Qr6c3wreUQntw2kkHB8w8pNG551Vd1rYYCdDGbt0VbQ==
X-Received: by 2002:a1c:7d4d:: with SMTP id y74mr10050763wmc.181.1631524125187;
        Mon, 13 Sep 2021 02:08:45 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::1db2])
        by smtp.gmail.com with ESMTPSA id j19sm6702276wra.92.2021.09.13.02.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 02:08:44 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/2] staging: r8188eu: remove unused register definitions from odm_reg.h
Date: Mon, 13 Sep 2021 11:08:30 +0200
Message-Id: <20210913090831.13803-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused register definitions from odm_reg.h.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/odm_reg.h | 74 -----------------------
 1 file changed, 74 deletions(-)

diff --git a/drivers/staging/r8188eu/include/odm_reg.h b/drivers/staging/r8188eu/include/odm_reg.h
index 78d7e904947c..914326865a64 100644
--- a/drivers/staging/r8188eu/include/odm_reg.h
+++ b/drivers/staging/r8188eu/include/odm_reg.h
@@ -6,84 +6,10 @@
 
 /*  Register Definition */
 
-/* MAC REG */
-#define	ODM_BB_RESET					0x002
-#define	ODM_DUMMY						0x4fe
-#define	ODM_EDCA_VO_PARAM			0x500
-#define	ODM_EDCA_VI_PARAM			0x504
-#define	ODM_EDCA_BE_PARAM			0x508
-#define	ODM_EDCA_BK_PARAM			0x50C
-#define	ODM_TXPAUSE					0x522
-
-/* BB REG */
-#define	ODM_FPGA_PHY0_PAGE8			0x800
-#define	ODM_PSD_SETTING				0x808
-#define	ODM_AFE_SETTING				0x818
-#define	ODM_TXAGC_B_6_18				0x830
-#define	ODM_TXAGC_B_24_54			0x834
-#define	ODM_TXAGC_B_MCS32_5			0x838
-#define	ODM_TXAGC_B_MCS0_MCS3		0x83c
-#define	ODM_TXAGC_B_MCS4_MCS7		0x848
-#define	ODM_TXAGC_B_MCS8_MCS11		0x84c
-#define	ODM_ANALOG_REGISTER			0x85c
-#define	ODM_RF_INTERFACE_OUTPUT		0x860
-#define	ODM_TXAGC_B_MCS12_MCS15	0x868
-#define	ODM_TXAGC_B_11_A_2_11		0x86c
-#define	ODM_AD_DA_LSB_MASK			0x874
-#define	ODM_ENABLE_3_WIRE			0x88c
-#define	ODM_PSD_REPORT				0x8b4
-#define	ODM_R_ANT_SELECT				0x90c
-#define	ODM_CCK_ANT_SELECT			0xa07
-#define	ODM_CCK_PD_THRESH			0xa0a
-#define	ODM_CCK_RF_REG1				0xa11
-#define	ODM_CCK_MATCH_FILTER			0xa20
-#define	ODM_CCK_RAKE_MAC				0xa2e
-#define	ODM_CCK_CNT_RESET			0xa2d
-#define	ODM_CCK_TX_DIVERSITY			0xa2f
-#define	ODM_CCK_FA_CNT_MSB			0xa5b
-#define	ODM_CCK_FA_CNT_LSB			0xa5c
-#define	ODM_CCK_NEW_FUNCTION		0xa75
-#define	ODM_OFDM_PHY0_PAGE_C		0xc00
-#define	ODM_OFDM_RX_ANT				0xc04
-#define	ODM_R_A_RXIQI					0xc14
-#define	ODM_R_A_AGC_CORE1			0xc50
-#define	ODM_R_A_AGC_CORE2			0xc54
-#define	ODM_R_B_AGC_CORE1			0xc58
-#define	ODM_R_AGC_PAR					0xc70
-#define	ODM_R_HTSTF_AGC_PAR			0xc7c
-#define	ODM_TX_PWR_TRAINING_A		0xc90
-#define	ODM_TX_PWR_TRAINING_B		0xc98
-#define	ODM_OFDM_FA_CNT1				0xcf0
-#define	ODM_OFDM_PHY0_PAGE_D		0xd00
-#define	ODM_OFDM_FA_CNT2				0xda0
-#define	ODM_OFDM_FA_CNT3				0xda4
-#define	ODM_OFDM_FA_CNT4				0xda8
-#define	ODM_TXAGC_A_6_18				0xe00
-#define	ODM_TXAGC_A_24_54			0xe04
-#define	ODM_TXAGC_A_1_MCS32			0xe08
-#define	ODM_TXAGC_A_MCS0_MCS3		0xe10
-#define	ODM_TXAGC_A_MCS4_MCS7		0xe14
-#define	ODM_TXAGC_A_MCS8_MCS11		0xe18
-#define	ODM_TXAGC_A_MCS12_MCS15		0xe1c
-
 /* RF REG */
-#define	ODM_GAIN_SETTING				0x00
 #define	ODM_CHANNEL					0x18
 
 /* Ant Detect Reg */
 #define	ODM_DPDT						0x300
 
-/* PSD Init */
-#define	ODM_PSDREG					0x808
-
-/* 92D Path Div */
-#define	PATHDIV_REG					0xB30
-#define	PATHDIV_TRI					0xBA0
-
-/*  */
-/*  Bitmap Definition */
-/*  */
-
-#define	BIT_FA_RESET					BIT(0)
-
 #endif
-- 
2.33.0

