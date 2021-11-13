Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F272C83
	for <linux-staging@lists.linux.dev>; Sat, 13 Nov 2021 10:21:32 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id r4so420835edy.12
        for <linux-staging@lists.linux.dev>; Sat, 13 Nov 2021 02:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ecovIr3cgAtR+3fYnJ5+gVzcYeZtoVQWk0eRWV5BA60=;
        b=dF9S9AHlGYB4O2sQGUKorbkrzvOWrHQ864io9IZdPvNyyFCmx0ngbxjFMrChpU2nQF
         Euh+Q9zczwVLex0vzFLldVyQkfF/IQvXtqUN8nJSxD7TZ0zp+/lQJeh62jRwHED/M9Bz
         hwnMMdGEjbGcMYwPPn7lgu4r7hqlDWXPK92i8FIXYnjBebeu1w388o7Pvi+RWgdZ/SZS
         6Ntc/vKkhTII0SEulIIIbPhehb1bCtdeiWnCBc73uHYfjMBdsFG6wgV7yXNr8VfOnldf
         iAwCcDDrG0b3SQul1PxebtwDWdO4PXW55BK4jmVuZeE7wRKEmBcjKMhT8RyYuY+MRL6/
         R9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ecovIr3cgAtR+3fYnJ5+gVzcYeZtoVQWk0eRWV5BA60=;
        b=4RpM2mPi01tnknQF54fu+W/hlccgHuCb1rDUz4dmKbGNpfEsj4Pa9bDPrvsUvJNmIx
         58njj0fneZ30nPWom3L2lSSFmGjWEp80PMXSKGfgjgqZ8MLW57x1Xvo3Aqr4/sHYWOsi
         x4x8/ywWilplilr4IEvhTxELZswdG7OjrqQC0Om/QdD2GITh/Wfq65LJFa40VFKNX/YP
         Lf/1TcQcQkcLPaZ9N9Clmc7wYmI2T0Mu7w5lQF/H1E2Vu0UI7z4j1arrOKwUTVQHzs/M
         k5x3vw0MbjZYtSAhfmtvGsYzdjXFemnSVQpgPsoqHtflQncuMiSoBG6EFDhiELbtydZS
         F7QA==
X-Gm-Message-State: AOAM530qH4Quelf9seghKDuZSgavN+f9/xTA8uzlXjdecCcKQCgjetqn
	KlpD0NksAfTrCJ9gQb4h0Io=
X-Google-Smtp-Source: ABdhPJxdk/MUFzyatk1yugomiILDuKYPh2gffhsNDkiSVq+0zSdCeo00SkxCGyahxRx2o9siG2mrqg==
X-Received: by 2002:a17:907:72c7:: with SMTP id du7mr28654805ejc.424.1636798891363;
        Sat, 13 Nov 2021 02:21:31 -0800 (PST)
Received: from tom-desktop.station (net-93-150-197-192.cust.dsl.teletu.it. [93.150.197.192])
        by smtp.gmail.com with ESMTPSA id e19sm4212840edu.47.2021.11.13.02.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 02:21:30 -0800 (PST)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: tomm.merciai@gmail.com,
	Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Karolina Drobnik <karolinadrobnik@gmail.com>,
	=?UTF-8?q?Aldas=20Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: vt6655: fix camelcase in bRadioOff
Date: Sat, 13 Nov 2021 11:21:20 +0100
Message-Id: <20211113102126.82904-1-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace camel case variable bRadioOff with snake case
variable radio_off.
Drop Hungarian notation prefix in `bRadioOff` variable.
Change it to use snake case.

Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
---
 drivers/staging/vt6655/card.c        | 4 ++--
 drivers/staging/vt6655/device.h      | 2 +-
 drivers/staging/vt6655/device_main.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 26e08fec6e6a..eac7c234f9db 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -404,7 +404,7 @@ bool CARDbSetBeaconPeriod(struct vnt_private *priv,
  */
 void CARDbRadioPowerOff(struct vnt_private *priv)
 {
-	if (priv->bRadioOff)
+	if (priv->radio_off)
 		return;
 
 	switch (priv->byRFType) {
@@ -429,7 +429,7 @@ void CARDbRadioPowerOff(struct vnt_private *priv)
 
 	bb_set_deep_sleep(priv, priv->local_id);
 
-	priv->bRadioOff = true;
+	priv->radio_off = true;
 	pr_debug("chester power off\n");
 	MACvRegBitsOn(priv->port_offset, MAC_REG_GPIOCTL0,
 		      LED_ACTSET);  /* LED issue */
diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index 4706bde1ec1d..3768791d9744 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -221,7 +221,7 @@ struct vnt_private {
 	bool bBarkerPreambleMd;
 
 	bool bRadioControlOff;
-	bool bRadioOff;
+	bool radio_off;
 	bool bEnablePSMode;
 	unsigned short wListenInterval;
 	bool bPWBitOn;
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 212d2a287b2c..e74caf22d75a 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -369,7 +369,7 @@ static void device_init_registers(struct vnt_private *priv)
 	/* Set Short Slot Time, xIFS, and RSPINF. */
 	priv->wCurrentRate = RATE_54M;
 
-	priv->bRadioOff = false;
+	priv->radio_off = false;
 
 	priv->byRadioCtl = SROMbyReadEmbedded(priv->port_offset,
 					      EEP_OFS_RADIOCTL);
-- 
2.25.1

