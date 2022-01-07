Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AE92CA1
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 10:36:40 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id w16so20354370edc.11
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 02:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yv4jc9aXbLqInVQ3V0d0MEK9dE0H07uL4Qmt1lgDr1E=;
        b=O9r5+X59nJO2f8v0jS6ollNA/3EqHLTHEVHBzbhIlpiO0K9zwdWJdVsBHo80yqAJpP
         a4uVGnISo7KTcIt2Lv+FhhkJGbTAJUAWJd9+19jVsCyP/A321A52Ou61iP66uouHkTJU
         fuK8PEYDvuW2e3g3d8Qb3WU3bpP/DKo1e25XWCChqSM1orCcZs6gsyZUDtsmRU57gBPa
         TalOQSSoixjLDhLCnYF607AkFfUdsZxSofVtRnu4QXyMqCZSkd+HiEGTN2ZR7Gd6UC4A
         gNRm40+imeIPBRddZyR6c47K1g7Onrly1/o3aNADGdX/ovIL9yLgKAdDPTjn/zXmuWrX
         9Zhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yv4jc9aXbLqInVQ3V0d0MEK9dE0H07uL4Qmt1lgDr1E=;
        b=wyc3Zwi2dSizeUcckmTT1wEWmYF9c3N/p/ehDgqEkMysoQNvg5xg/1DK8ZZLmvZTPM
         0g8P31zlE/P3MAORyco0oAq+3xVmjcEdyS1icNmssDFJN8hbtOEfsWyXWzZI78Ltiv6g
         JG3Amr+gAYYIku3SQIGZFzDAvFHPeonmox7QPs+5iPUTVR2R/hSTuf3GlCHIpBYmztzK
         e+t+gY096evZzGdUMvbMWEMrWSxffTCx0I2a9+aNdWQ1I7fXdxErxO6iVSF3nM+/3itO
         u7idU1233DbjwgMbAZzMH6Rs5a1H0oR0DsApue7lnAOQThwudGz1fLL6+AR2giHsv64K
         e8PA==
X-Gm-Message-State: AOAM531AsTmZqe7HNSARkxckzNzICdJSPd3jIYwymf7xEfPo1BGxoY+9
	9KPUJDE0p8DpJSuTMst6NFnTBLA8xQ8=
X-Google-Smtp-Source: ABdhPJzMbmeVkGuQKiIWMefbl6HVyOq/Hn4cU2eBl4vpyc3toR80OMPUVZmyfHOh23zSf3wmrPi0/g==
X-Received: by 2002:a05:6402:4301:: with SMTP id m1mr60218617edc.125.1641551798668;
        Fri, 07 Jan 2022 02:36:38 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::51e2])
        by smtp.gmail.com with ESMTPSA id v8sm1869857edt.10.2022.01.07.02.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 02:36:38 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 15/19] staging: r8188eu: rename FWDL_ChkSum_rpt
Date: Fri,  7 Jan 2022 11:36:16 +0100
Message-Id: <20220107103620.15648-16-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107103620.15648-1-straube.linux@gmail.com>
References: <20220107103620.15648-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename FWDL_ChkSum_rpt to avoid camel case.

FWDL_ChkSum_rpt -> FWDL_CHKSUM_RPT

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 4 ++--
 drivers/staging/r8188eu/include/rtl8188e_spec.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 1685386a7015..6c23966ec785 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -475,7 +475,7 @@ static int fw_free_to_go(struct adapter *padapter)
 	/*  polling CheckSum report */
 	do {
 		value32 = rtw_read32(padapter, REG_MCUFWDL);
-		if (value32 & FWDL_ChkSum_rpt)
+		if (value32 & FWDL_CHKSUM_RPT)
 			break;
 	} while (counter++ < POLLING_READY_TIMEOUT_COUNT);
 
@@ -589,7 +589,7 @@ int rtl8188e_firmware_download(struct adapter *padapter)
 	fwdl_start_time = jiffies;
 	while (1) {
 		/* reset the FWDL chksum */
-		rtw_write8(padapter, REG_MCUFWDL, rtw_read8(padapter, REG_MCUFWDL) | FWDL_ChkSum_rpt);
+		rtw_write8(padapter, REG_MCUFWDL, rtw_read8(padapter, REG_MCUFWDL) | FWDL_CHKSUM_RPT);
 
 		ret = write_fw(padapter, pFirmwareBuf, FirmwareLen);
 
diff --git a/drivers/staging/r8188eu/include/rtl8188e_spec.h b/drivers/staging/r8188eu/include/rtl8188e_spec.h
index 009222b4a95d..edae053e350e 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_spec.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_spec.h
@@ -794,7 +794,7 @@ Current IOREG MAP
 /* 2 MCUFWDL */
 #define MCUFWDL_EN			BIT(0)
 #define MCUFWDL_RDY			BIT(1)
-#define FWDL_ChkSum_rpt			BIT(2)
+#define FWDL_CHKSUM_RPT			BIT(2)
 #define MACINI_RDY			BIT(3)
 #define BBINI_RDY			BIT(4)
 #define RFINI_RDY			BIT(5)
-- 
2.34.1

