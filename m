Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205871B040A
	for <linux-staging@lists.linux.dev>; Mon, 30 Dec 2024 19:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735585812; cv=none; b=k50CX8aDD+JEnmaynbmu8Eh7AFjCMJ8Qsuidvnvs30UoLbtypCaGQ3GaI5YbSRtygjr7bi2tlP3W5iJwS6TFGzGfUcPBz9APbZFxlploV+RXR3LbVfUWEDcoBNCqx0RUiTUEFRKtK4crXVV7EddSVX/1acWubPIibypAMLxoyQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735585812; c=relaxed/simple;
	bh=DVomB153uv2ucWkt4FxxYYUTra1dhfZtXV1EuSVL7mY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H5S7TZ6XK2tnQQ6DgVJXaR3/5gJjZO4HNobIqd2hK8gN8nlSDjQPTHsP9vBYD3/090dEeS2bjKW+XLGDWh+g9F/sccdX8Sra/QM2NJod8Eu06rx3czmnRgP/UrHNX3vFe8Tw3jNGF2T9xi3FAjJrvf8f45EduT0A0fjBQ0DwePo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ktarAImO; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ktarAImO"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ef718cb473so1859847a91.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Dec 2024 11:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735585810; x=1736190610; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jDmzy7KMufL/WvjCZgi/2m4YouXgT+NH6CQmE520j0=;
        b=ktarAImOf8t3ntHUHBm7mvqk4Ko+4fBs4jBAT20axHlbJOFEaoT651iz6cqd29uFzI
         GVzwtc2K6bHncTbsHlIT2GfVTrpgG2DrEY4DTICYIuURDd+v+dVvc1/mEqvOsG6o7Q7k
         KcwhRVQ2fTflb4vr/tTxhl2vUxNcPbo7HD5arCno7/JVX52GRWGCAssWgJVquAUk4jUZ
         gxT/ZHencDCzOXunvYYrvUcbOgt5zm8lPrSY0hpYUS5dm5vS9ivErkPrc5gp4udb3bbF
         gbSs2gmunwAm1D+38ZstFzkZOcdE/BWflFKFoHc76ufwtYjXxSur5kzWtxB8T591W8l9
         YirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735585810; x=1736190610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/jDmzy7KMufL/WvjCZgi/2m4YouXgT+NH6CQmE520j0=;
        b=i27Z7+Y8zXiCMEjr0+0MucWq+Y6xLyFqqZssx25IiypyhWB8Jjjwt92h0yaw45gTAb
         Y+sOLkeizFy5yPCJkBIVomrHamcXi31f6jw6lE1/m50FcCNks6vNZXrC6YsKdSBCloRS
         0IKwKE9ax5Ep/JD4wKG3AIpib5/AtrGf7gqRiAt8ppEYlnYixPEJ5nGCdYFPws3K4q+M
         LKLQQQ5GTXZpk5yIAOSUnf/JReoX/kHaF26vMG4fLtbax1COq1LWvirY3+6Vuy1wsnef
         fu4Q6obl7nyH9Lpv5GkR7UWLLmwvvEvAuP2/9qR2xoC2OXp+dvdpKIMqP7FwBWDBUdFM
         BIfw==
X-Forwarded-Encrypted: i=1; AJvYcCWtzwQGBaY+Uorfa2kOeCloJJFWpR8RwLrcdFUm/5KTKrBfmUWr3YjZ33Ef+NRnpoyPbBU+NwbJTEV444mB@lists.linux.dev
X-Gm-Message-State: AOJu0YzkzWZkfblPFk8EtKscMtyAIMqUp3OsG1Z3mRBd96FHqG5ebOdh
	2Eschbz2Z5WTj7GI0lFsMaPiA45NtGpout3HFCUDgNeDckMztbJV
X-Gm-Gg: ASbGnct1zVR9nw5ipeKM4i2EGJ+0Dj3omRrjZ13eiRUiCdu/Z6UTNnDEK0C4sHffiWK
	1ChUo46xBxTy4/wuThKU01mFyqlpB9Ti467SjAcuFqMq5wnYdS7tTUIO7FdY3bqBlgCTo72g567
	08qBPxx6gqTNMoKG8Abv5A1+OWfFQfdXOgA6soCCpZpKr9swWj4NDr1HyElYvCGDW9vdcpT4WTS
	JoWtCYSK1yxoyX0oO1FmQ9yveabr4F+f/rsEPZDAOJUSFD9Y9IfqG0=
X-Google-Smtp-Source: AGHT+IGXu5X8emGu80X/vswGBEa425Jx71l/AtvmGRKBY9eyqT/Embg2lDyPy7hNygbdDUTDPKYXig==
X-Received: by 2002:a17:90b:4ed0:b0:2ea:b0d8:d5ed with SMTP id 98e67ed59e1d1-2f452efe0f4mr20004073a91.9.1735585810358;
        Mon, 30 Dec 2024 11:10:10 -0800 (PST)
Received: from ice.. ([171.76.81.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc964f09sm182886795ad.26.2024.12.30.11.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 11:10:10 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v6 11/15] staging: gpib: ines: Handle gpib_register_driver() errors
Date: Tue, 31 Dec 2024 00:26:31 +0530
Message-Id: <20241230185633.175690-12-niharchaithanya@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241230185633.175690-1-niharchaithanya@gmail.com>
References: <20241230185633.175690-1-niharchaithanya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function ines_pcmcia_init_module() can be replaced by calling
pcmcia_register_driver() directly. The error value from this
function is not returned and the previous registering functions
are not unregistered.

The function gpib_register_driver() can fail and similar to
pcmcia_register_driver() function failing, the previous registering
functions are not unregistered.

Replace cb_pcmcia_init_module() with pcmcia_register_driver().
Unregister the gpib and pci register functions if the subsequent
gpib or pcmcia register functions fail and return the error value.
Add pr_err() statements indicating the fail and error value.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/ines/ines_gpib.c | 94 +++++++++++++++++++++------
 1 file changed, 73 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 9d8387c3bf01..9d4bbb8e8a75 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -1227,12 +1227,6 @@ static struct pcmcia_driver ines_gpib_cs_driver = {
 	.resume		= ines_gpib_resume,
 };
 
-int ines_pcmcia_init_module(void)
-{
-	pcmcia_register_driver(&ines_gpib_cs_driver);
-	return 0;
-}
-
 void ines_pcmcia_cleanup_module(void)
 {
 	DEBUG(0, "ines_cs: unloading\n");
@@ -1420,28 +1414,86 @@ void ines_pcmcia_detach(gpib_board_t *board)
 
 static int __init ines_init_module(void)
 {
-	int err = 0;
+	int ret;
+
+	ret = pci_register_driver(&ines_pci_driver);
+	if (ret) {
+		pr_err("ines_gpib: pci_register_driver failed: error = %d\n", ret);
+		return ret;
+	}
+
+	ret = gpib_register_driver(&ines_pci_interface, THIS_MODULE);
+	if (ret) {
+		pr_err("ines_gpib: gpib_register_driver failed: error = %d\n", ret);
+		goto err_pci;
+	}
 
-	err = pci_register_driver(&ines_pci_driver);
-	if (err) {
-		pr_err("ines_gpib: pci_driver_register failed!\n");
-		return err;
+	ret = gpib_register_driver(&ines_pci_unaccel_interface, THIS_MODULE);
+	if (ret) {
+		pr_err("ines_gpib: gpib_register_driver failed: error = %d\n", ret);
+		goto err_pci_unaccel;
+	}
+
+	ret = gpib_register_driver(&ines_pci_accel_interface, THIS_MODULE);
+	if (ret) {
+		pr_err("ines_gpib: gpib_register_driver failed: error = %d\n", ret);
+		goto err_pci_accel;
+	}
+
+	ret = gpib_register_driver(&ines_isa_interface, THIS_MODULE);
+	if (ret) {
+		pr_err("ines_gpib: gpib_register_driver failed: error = %d\n", ret);
+		goto err_isa;
 	}
 
-	gpib_register_driver(&ines_pci_interface, THIS_MODULE);
-	gpib_register_driver(&ines_pci_unaccel_interface, THIS_MODULE);
-	gpib_register_driver(&ines_pci_accel_interface, THIS_MODULE);
-	gpib_register_driver(&ines_isa_interface, THIS_MODULE);
 #ifdef GPIB_PCMCIA
-	gpib_register_driver(&ines_pcmcia_interface, THIS_MODULE);
-	gpib_register_driver(&ines_pcmcia_unaccel_interface, THIS_MODULE);
-	gpib_register_driver(&ines_pcmcia_accel_interface, THIS_MODULE);
-	err += ines_pcmcia_init_module();
+	ret = gpib_register_driver(&ines_pcmcia_interface, THIS_MODULE);
+	if (ret) {
+		pr_err("ines_gpib: gpib_register_driver failed: error = %d\n", ret);
+		goto err_pcmcia;
+	}
+
+	ret = gpib_register_driver(&ines_pcmcia_unaccel_interface, THIS_MODULE);
+	if (ret) {
+		pr_err("ines_gpib: gpib_register_driver failed: error = %d\n", ret);
+		goto err_pcmcia_unaccel;
+	}
+
+	ret = gpib_register_driver(&ines_pcmcia_accel_interface, THIS_MODULE);
+	if (ret) {
+		pr_err("ines_gpib: gpib_register_driver failed: error = %d\n", ret);
+		goto err_pcmcia_accel;
+	}
+
+	ret = pcmcia_register_driver(&ines_gpib_cs_driver);
+	if (ret) {
+		pr_err("ines_gpib: pcmcia_register_driver failed: error = %d\n", ret);
+		goto err_pcmcia_driver;
+	}
 #endif
-	if (err)
-		return -1;
 
 	return 0;
+
+#ifdef GPIB_PCMCIA
+err_pcmcia_driver:
+	gpib_unregister_driver(&ines_pcmcia_accel_interface);
+err_pcmcia_accel:
+	gpib_unregister_driver(&ines_pcmcia_unaccel_interface);
+err_pcmcia_unaccel:
+	gpib_unregister_driver(&ines_pcmcia_interface);
+err_pcmcia:
+#endif
+	gpib_unregister_driver(&ines_isa_interface);
+err_isa:
+	gpib_unregister_driver(&ines_pci_accel_interface);
+err_pci_accel:
+	gpib_unregister_driver(&ines_pci_unaccel_interface);
+err_pci_unaccel:
+	gpib_unregister_driver(&ines_pci_interface);
+err_pci:
+	pci_unregister_driver(&ines_pci_driver);
+
+	return ret;
 }
 
 static void __exit ines_exit_module(void)
-- 
2.34.1

