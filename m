Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A103FDC
	for <linux-staging@lists.linux.dev>; Tue,  1 Feb 2022 08:43:14 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id k25so51424809ejp.5
        for <linux-staging@lists.linux.dev>; Tue, 01 Feb 2022 00:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vPQCFVUGDeDMouS1odhJlOYowD2BZ8XAZv0e1KiFcMo=;
        b=nJcTaD/F0+VZC2ybxywaJf7H0PwTo7aCzxgk9dVSrGKWlo20fo5rvndS+5shAyM7gq
         LreNSVdToXdQx4fcD84XRMJrjYloOdma44WtUODA9YqsIaEZAuwZ3vQ8dj42CkFEjmui
         bBrOqQKTM6Qqs/eQTxL0qWbrTj8XK/ZRLFRcJMgstRWD76y71PJF2XYmjOGJ8EWaC29P
         3GH5M9gplz37Iarer4/JB4eYQ8CstWfcYfcrdGpJMHMbuiJyo4iNAr0cDmLODUeQkvB6
         0iqYoHmh2J7AZ2TkyUxYWgLbgMzKhlTrGjjyElfwUAhl5TsU/Ad6fyXJtlFtu1ml9wuY
         4Slw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vPQCFVUGDeDMouS1odhJlOYowD2BZ8XAZv0e1KiFcMo=;
        b=p5CryO4xZBhK8Xw2UB5lrc9OGyF9MAMZH4rO4pPy66hwVE5BYCXKPaIc0bAwIKvpyC
         RrwyqKP6j7pYh1MeCaHvuHleOZjFH2IwfNbMtbsJwWOZbkGVljwXLdEQjVzcBwMTNR69
         P2oDFw2o9wT9XCiucP7+zai6PXiBVOYTTb2LJYJmWnNMJZfu4xb+BxyxJFZTs9/39Fs0
         oYHHaCySLKaaR44Gw/I7X63ahofiHOCmc7f+9P64SZo3zIvpbHk2MtXDpY5cwPvPcc8M
         HPDRGx/huGRf7Zi8dFnBE8AACR6frP7dzg7iUBVN47nFiWdw5epoAjaPO8w1YuLhGzI+
         pt5w==
X-Gm-Message-State: AOAM530HtKN13glI64sxBtb0xlukPExU4xvM266gzAvHUPZeB9Myc2pc
	eksxwC6ODs3F7JEspBmyCf4=
X-Google-Smtp-Source: ABdhPJzLIKmai4++TF1kULNC15dnHMhxMezgP2z433alncp1QshFpkCsfuz6oLyJFtCEK/+j41WmpQ==
X-Received: by 2002:a17:907:6290:: with SMTP id nd16mr19760537ejc.33.1643704992960;
        Tue, 01 Feb 2022 00:43:12 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb5a.dynamic.kabel-deutschland.de. [95.90.187.90])
        by smtp.gmail.com with ESMTPSA id c14sm19123431edy.66.2022.02.01.00.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 00:43:12 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/9] staging: r8188eu: remove ReceiveConfig from struct hal_data_8188e
Date: Tue,  1 Feb 2022 09:42:53 +0100
Message-Id: <20220201084259.7497-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220201084259.7497-1-straube.linux@gmail.com>
References: <20220201084259.7497-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ReceiveConfig variable in struct hal_data_8188e is only used
to store a local value. Use a local variable instead and remove
ReceiveConfig from struct hal_data_8188e.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_halinit.c      | 12 +++++-------
 drivers/staging/r8188eu/include/rtl8188e_hal.h |  1 -
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 91b854c7b9a1..2252e8a1d55b 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -324,15 +324,13 @@ static void _InitDriverInfoSize(struct adapter *Adapter, u8 drvInfoSize)
 
 static void _InitWMACSetting(struct adapter *Adapter)
 {
-	struct hal_data_8188e *haldata = &Adapter->haldata;
-
-	haldata->ReceiveConfig = RCR_AAP | RCR_APM | RCR_AM | RCR_AB |
-				  RCR_CBSSID_DATA | RCR_CBSSID_BCN |
-				  RCR_APP_ICV | RCR_AMF | RCR_HTC_LOC_CTRL |
-				  RCR_APP_MIC | RCR_APP_PHYSTS;
+	u32 receive_config = RCR_AAP | RCR_APM | RCR_AM | RCR_AB |
+			     RCR_CBSSID_DATA | RCR_CBSSID_BCN |
+			     RCR_APP_ICV | RCR_AMF | RCR_HTC_LOC_CTRL |
+			     RCR_APP_MIC | RCR_APP_PHYSTS;
 
 	/*  some REG_RCR will be modified later by phy_ConfigMACWithHeaderFile() */
-	rtw_write32(Adapter, REG_RCR, haldata->ReceiveConfig);
+	rtw_write32(Adapter, REG_RCR, receive_config);
 
 	/*  Accept all multicast address */
 	rtw_write32(Adapter, REG_MAR, 0xFFFFFFFF);
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 661c447a0453..88246ef65f8a 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -151,7 +151,6 @@ struct txpowerinfo24g {
 struct hal_data_8188e {
 	struct HAL_VERSION	VersionID;
 	/* current WIFI_PHY values */
-	u32	ReceiveConfig;
 	enum ht_channel_width CurrentChannelBW;
 	u8	CurrentChannel;
 	u8	nCur40MhzPrimeSC;/*  Control channel sub-carrier */
-- 
2.34.1

