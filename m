Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239592CA2
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 10:36:31 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id j21so20393441edt.9
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 02:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+KyaGcYQCGy+zGWfTRRg9yE4VY1DITSD1bPnCSSfYE0=;
        b=YJ+0wv6/OosGWWDsgC39YmY3+4xcS3ku4R4b7kWKcLFiW0d9//t9kvGutYTxo9GEsR
         E61PhgV3hgRiwyDGrUn2FscUxsxbFIz88L+l+s1ZVcPDVZBAoj5AbUCaszZbCi3tqSk7
         KxNvza7zKPzZyD3wxxCeIaJ0eC5rcLDh44s8UJ6UPOgZtwSFEjETDorlYDpSEuPybFmX
         80KjNKKaVz24IHprIUEhCjbVG9eaKCrQKsjifX9IqbWUDW0Zh0ea8J0585Bh68NuBqDl
         Fw4GdzJHVT3Vady+Ha9BdlLJ4TfOyB/UI+NUxOai+ir1s5x6lrn5bmZUhJiTdJwBrTPN
         8ISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+KyaGcYQCGy+zGWfTRRg9yE4VY1DITSD1bPnCSSfYE0=;
        b=j30cwiFd4iWpVRGRdvEQkt1VvP7vsB8yULwKXCrh0k2kPPQcJewEoN9pGNM7L1VzmX
         gdBzyEY9nYc3RSysgPaY+5OVgc8AAqLmR4YvblFJWvHUpbfxZjLBnSOd+fkBgVsAlF3v
         H4aBeHJo6q0XTekSRCJSzDjgB+5bYtjuVmb+mKtC9F1yTtPfPrrSG3mKgGP9shymtTaG
         ZQvMjo3XBElAE3jeWm1KCxcvNcDaappYqv9ZRGTfeAZ7jn0eyjXIVgOjj2H+t5vasxau
         4N5YdmtkVmEbX7TSxtLBOpAE2zM3b5ktTybl+x1ELtOZVTUophhtyJwQ5kI4nCKvgKaQ
         7eng==
X-Gm-Message-State: AOAM5316JohV0e/+Vbb71HZ71UdF4a86maRiojet0FQZbtnb0FtxdQal
	evsh/hIi9pq9vSoXGhm/NiA=
X-Google-Smtp-Source: ABdhPJxEf+Nbi70jGluBgjYTXIhZblu4DwD/CycFVSEa6h92xjo4HuOeKLbv/EDEuNc0Y1Vpxg3NcQ==
X-Received: by 2002:a17:906:2b8a:: with SMTP id m10mr2327421ejg.479.1641551789593;
        Fri, 07 Jan 2022 02:36:29 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::51e2])
        by smtp.gmail.com with ESMTPSA id v8sm1869857edt.10.2022.01.07.02.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 02:36:29 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 02/19] staging: r8188eu: remove rtl8188e_InitializeFirmwareVars()
Date: Fri,  7 Jan 2022 11:36:03 +0100
Message-Id: <20220107103620.15648-3-straube.linux@gmail.com>
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

Merge rtl8188e_InitializeFirmwareVars() into rtl8188eu_hal_init()
and remove rtl8188e_InitializeFirmwareVars().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 11 -----------
 drivers/staging/r8188eu/hal/usb_halinit.c       |  4 +++-
 drivers/staging/r8188eu/include/rtl8188e_hal.h  |  1 -
 3 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 20e4a12801cf..dc41682fd8d6 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -623,17 +623,6 @@ s32 rtl8188e_FirmwareDownload(struct adapter *padapter)
 	return rtStatus;
 }
 
-void rtl8188e_InitializeFirmwareVars(struct adapter *padapter)
-{
-	struct hal_data_8188e *pHalData = &padapter->haldata;
-
-	/*  Init Fw LPS related. */
-	padapter->pwrctrlpriv.bFwCurrentInPSMode = false;
-
-	/*  Init H2C counter. by tynli. 2009.12.09. */
-	pHalData->LastHMEBoxNum = 0;
-}
-
 /*  */
 /*			Efuse related code */
 /*  */
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 96db9a8e7667..696beb29536f 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -636,7 +636,9 @@ u32 rtl8188eu_hal_init(struct adapter *Adapter)
 		Adapter->bFWReady = true;
 		haldata->fw_ractrl = false;
 	}
-	rtl8188e_InitializeFirmwareVars(Adapter);
+	/* Initialize firmware vars */
+	Adapter->pwrctrlpriv.bFwCurrentInPSMode = false;
+	haldata->LastHMEBoxNum = 0;
 
 #if (HAL_MAC_ENABLE == 1)
 	status = PHY_MACConfig8188E(Adapter);
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 9133f3b0acc1..3da04751f25d 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -253,7 +253,6 @@ struct hal_data_8188e {
 /*  rtl8188e_hal_init.c */
 s32 rtl8188e_FirmwareDownload(struct adapter *padapter);
 void _8051Reset88E(struct adapter *padapter);
-void rtl8188e_InitializeFirmwareVars(struct adapter *padapter);
 
 s32 InitLLTTable(struct adapter *padapter, u8 txpktbuf_bndy);
 
-- 
2.34.1

