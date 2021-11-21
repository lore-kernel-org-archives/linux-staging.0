Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6B668
	for <linux-staging@lists.linux.dev>; Sun, 21 Nov 2021 11:27:16 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id y12so63636840eda.12
        for <linux-staging@lists.linux.dev>; Sun, 21 Nov 2021 03:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t8qwozoI4ZgvY8N3QOUrFpTNybxtK5/UyM93WgmSUcs=;
        b=FYbFHF2QM+ZPPXDFsPv/so2dy8U9Ff855nzNxC/vY6iUEN0Ys1bjUUs9G29y0uHjF8
         aVw1jQMB/0c5Pw7Pzle31twT8hQy7X8ONbqK47uU3Sp3JvXO2fqsHn3v1y6bT4e6xWuj
         0hemHxZU466JbWRht3jNPlJIhwNXScho6CsrhfeVhnkdbrAINqpmvV380Xl6IpmmzL9A
         ZIrHlaZ1CIi3q5t6V8DBN/96VbzCaqo8x9lkeXviCwuAKyA9MWW0cmjDXyja4U3f9s8i
         rQgh1RidJeIHztdKFo5lKtk1ypXUGEeCVFkbuVmESasOFykXQPShzoV+tRoZUH3V3zhV
         oznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t8qwozoI4ZgvY8N3QOUrFpTNybxtK5/UyM93WgmSUcs=;
        b=Xd0Q4/PyOGwPWTHOqI588le7383TB32s4myFApfyF4DVZdRKe12aEy9Gk2BDHXNQ1B
         BqUI5cJQr26oDMixDF5MKoZXioePEpCsY5TZjier0l1P68EEzn2HGzBbxkTQQg3JYvl6
         aa31F3+v6lE6rKms+MizLqFPPLykGNR5kKcaSlR2RLx66SBlbg0P3hIkWhmDtzpItisU
         KFLdxZTzaT/uzWx0LO87QWJa62G1QeIqQXREfgWjwLPvo8m5P8QPFWzL/VJftHOYZb6t
         dSUa3R4Odh2BNOefS3+eSYzA1845cSlBUBzIcuRxnqucZQN7MYlJSCEu+d4RKGuc355C
         VIAA==
X-Gm-Message-State: AOAM532hXQUsxy57vbbgMo/qXueMOGY3oZF0Gc1/soq/D64Gh7bcbsqb
	KrngVU/TUwUWDb20C53rfdA=
X-Google-Smtp-Source: ABdhPJyaVEhpifhFF0K+5F/45yMmT3PeLDFfsQeShkF7DuGSZYcOfrnfOWustG0rVCYxJuvAtQ/vrQ==
X-Received: by 2002:a17:907:7f1a:: with SMTP id qf26mr28790469ejc.543.1637494034513;
        Sun, 21 Nov 2021 03:27:14 -0800 (PST)
Received: from bulldog.fritz.box (host-95-252-102-163.retail.telecomitalia.it. [95.252.102.163])
        by smtp.gmail.com with ESMTPSA id nb4sm2309065ejc.21.2021.11.21.03.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 03:27:14 -0800 (PST)
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: alb3rt0.m3rciai@gmail.com
Cc: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	=?UTF-8?q?Aldas=20Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>,
	Karolina Drobnik <karolinadrobnik@gmail.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Lucas Henneman <lucas.henneman@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: vt6655: rename variable bHWRadioOff
Date: Sun, 21 Nov 2021 12:19:59 +0100
Message-Id: <20211121112000.632456-1-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace camelcase hungarian notated variable "bHWRadioOff"
into linux kernel coding style equivalent variable "hw_radio_off".

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/vt6655/device.h      | 2 +-
 drivers/staging/vt6655/device_main.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index ff171acc11f4..e9d1b56d8809 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -229,7 +229,7 @@ struct vnt_private {
 	/* GPIO Radio Control */
 	unsigned char byRadioCtl;
 	unsigned char byGPIO;
-	bool bHWRadioOff;
+	bool hw_radio_off;
 	bool bPrvActive4RadioOFF;
 	bool bGPIOBlockRead;
 
diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 1f98f2b069c4..897d70cf32b8 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -373,7 +373,7 @@ static void device_init_registers(struct vnt_private *priv)
 
 	priv->byRadioCtl = SROMbyReadEmbedded(priv->port_offset,
 					      EEP_OFS_RADIOCTL);
-	priv->bHWRadioOff = false;
+	priv->hw_radio_off = false;
 
 	if (priv->byRadioCtl & EEP_RADIOCTL_ENABLE) {
 		/* Get GPIO */
@@ -383,10 +383,10 @@ static void device_init_registers(struct vnt_private *priv)
 		     !(priv->byRadioCtl & EEP_RADIOCTL_INV)) ||
 		     (!(priv->byGPIO & GPIO0_DATA) &&
 		     (priv->byRadioCtl & EEP_RADIOCTL_INV)))
-			priv->bHWRadioOff = true;
+			priv->hw_radio_off = true;
 	}
 
-	if (priv->bHWRadioOff || priv->bRadioControlOff)
+	if (priv->hw_radio_off || priv->bRadioControlOff)
 		CARDbRadioPowerOff(priv);
 
 	/* get Permanent network address */
-- 
2.25.1

