Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36BC2C83
	for <linux-staging@lists.linux.dev>; Sun, 28 Nov 2021 13:53:38 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id o13so30488811wrs.12
        for <linux-staging@lists.linux.dev>; Sun, 28 Nov 2021 05:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XBHJ/aKw5Cr+IB+VkwG1v8Q23E2p2sxCrJ2g9gsZZxY=;
        b=o5f+F6qCNQU6FEYpLffXeR2zq8TaG+F4lj2rvXNwtsc+FCwvdbIyCNg5gnU+0UVWXG
         D/bIXQqDtyd2PTez5WcAK6FQR84UvDiinycQdgHoBjZBW+uIuZ3CA5cNO3+AyQIcyS75
         40fQrff58B165D/baVA3jt3mIMZIcA5U14v2xfxnZ/g877FOrx9x21TU7h5AYGNP8JpI
         Uwi0A21klpHDB6XLyJMyWQ5xYlGO/Ej4jaQk6dgk4I3MEK7wRXFPIKu49QNx6GzKuAg7
         2kP+BWydLWrFbAtEJDfLsDYsWxgq4lyxeEP1fLcofWSqnh14bptczgZV+aV3/885+/Mv
         Tq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XBHJ/aKw5Cr+IB+VkwG1v8Q23E2p2sxCrJ2g9gsZZxY=;
        b=ynoDSyzPGaqp0rGqWme5utrVkruoDRpXU94bb7l/dL41A09tJ/a/LQG4BvAwTJwLcz
         HI7PyxcMwuCKfsIvczQ/ZK8T5vKq10fsLngYL6NDe4SLZKAwhJrmtEqJ34u1CVlKzWFc
         5XJGz2e6H/r7ARzZykQJQKq9z6rHWV1vKA+rEdgRJNV4fxqXFuGwSpkvKWYiIKycddi7
         r9Ufoj6CRJDJM+0Os3rihuWOpgfhKN3y0BEdRZWnGoN0e0vt5TZ7aVZ+8Ah3TnalwkNS
         Psa0c29sOoocK1NnjdL+LZMfn0eJPV4qXZXBOviM4eUblE5GTejLHA/UyGEW66SCf2eG
         0KLQ==
X-Gm-Message-State: AOAM532XEy5SJhIl0dCQo9qxC/bSeGaZ9StrywF+7Oga/o4Zr0AtODFZ
	97KA5naoAhT07M4wvznsUU4=
X-Google-Smtp-Source: ABdhPJyZhD6oA1VKcnvLRyIOCP+HlvTd45EQcOH58TbWg5c39y5u4SREeqtK2kB/cyxFr4OrHBRNyg==
X-Received: by 2002:a05:6000:1568:: with SMTP id 8mr27783423wrz.76.1638107617064;
        Sun, 28 Nov 2021 05:53:37 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ac86])
        by smtp.gmail.com with ESMTPSA id l26sm13598510wms.15.2021.11.28.05.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 05:53:36 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/5] staging: r8188eu: remove rf_type from writeOFDMPowerReg88E()
Date: Sun, 28 Nov 2021 14:53:22 +0100
Message-Id: <20211128135326.9838-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211128135326.9838-1-straube.linux@gmail.com>
References: <20211128135326.9838-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pHalData->rf_type is always RF_1T1R. Remove unnecessary checks from
writeOFDMPowerReg88E().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_rf6052.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
index 946a1b97d96f..813dd938c817 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_rf6052.c
@@ -272,7 +272,6 @@ static void get_rx_power_val_by_reg(struct adapter *Adapter, u8 Channel,
 }
 static void writeOFDMPowerReg88E(struct adapter *Adapter, u8 index, u32 *pValue)
 {
-	struct hal_data_8188e *pHalData = GET_HAL_DATA(Adapter);
 	u16 regoffset_a[6] = {
 		rTxAGC_A_Rate18_06, rTxAGC_A_Rate54_24,
 		rTxAGC_A_Mcs03_Mcs00, rTxAGC_A_Mcs07_Mcs04,
@@ -302,10 +301,7 @@ static void writeOFDMPowerReg88E(struct adapter *Adapter, u8 index, u32 *pValue)
 		PHY_SetBBReg(Adapter, regoffset, bMaskDWord, writeVal);
 
 		/*  201005115 Joseph: Set Tx Power diff for Tx power training mechanism. */
-		if (((pHalData->rf_type == RF_2T2R) &&
-		     (regoffset == rTxAGC_A_Mcs15_Mcs12 || regoffset == rTxAGC_B_Mcs15_Mcs12)) ||
-		    ((pHalData->rf_type != RF_2T2R) &&
-		     (regoffset == rTxAGC_A_Mcs07_Mcs04 || regoffset == rTxAGC_B_Mcs07_Mcs04))) {
+		if (regoffset == rTxAGC_A_Mcs07_Mcs04 || regoffset == rTxAGC_B_Mcs07_Mcs04) {
 			writeVal = pwr_val[3];
 			if (regoffset == rTxAGC_A_Mcs15_Mcs12 || regoffset == rTxAGC_A_Mcs07_Mcs04)
 				regoffset = 0xc90;
-- 
2.34.0

