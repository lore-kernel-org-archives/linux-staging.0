Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B171CD213
	for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 19:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735242582; cv=none; b=FPcc78JcyFzYbjOCBisekKH3CGs8n3eqORC65EVKnkmaDTZNt0BGxBBFCsJaxnz/LY23vfrwLzmTIqmonmaHSzt9PiKOfJ/ZdGHx8mKtz+8ExzXKBk0NV1E2tOrnR3dwyw0LFbWVL8B4iJ20ea2zptnUPtAgZ3MPCDuVdpTT5T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735242582; c=relaxed/simple;
	bh=1QbddRKCNYr3HYo4IhQB9/Bf6CeIQvgX6GjTWhQ89Ls=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uxlacO6HI5JD1NWlefUWoWBYXSt+z+L6Bh1H8V1aS7K2AZBHYLf43QLT56aggoVuZA6NdLXPuMeNxjqdx+VhJqCxvPi3NNG5Ki/N1580ka/4kunGN9xfSdTuIjQTVOtJvAf/R1WTO814y6BdYsMk3Q27SVJNpkW6b1WxaH4v/nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UNFMePe7; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UNFMePe7"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2166db59927so9430715ad.0
        for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 11:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735242580; x=1735847380; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqW9Swsnv7VLS6ZMLw89eDGe2BsxNZ7CXUs3SW+g2Lo=;
        b=UNFMePe7wv2Jh7NqyKBEp4QhW2XN8pVm4fyst0hnVLszj2C/tVa/h2nYwz0GdsiSIg
         Vq0cdAxoGYrNQJV1sovQFbPz9uIdBkHgjfd0uT6eXyubJ8glTx92MgHE8UerrlKslPkR
         q9hbhQrJsqrzyUoJYLx6OGvHuJLfMPg/KelzlD+6teIc4gI4qWpujCPgO+MX7a/swgqk
         xigMOJHnYopub5/EzpX6Z4pX1Jd4WGnDDYUpdGOVBTKwgVnVT3Ul5sWnX1r/J/KfX2KW
         oDr3xnRlJMl8/G3zIe/P0yFvz3vZUigjXjcnoxVqVPM4kyVLSLLE6MJGAN5w0AWVBsUQ
         ko/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735242580; x=1735847380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqW9Swsnv7VLS6ZMLw89eDGe2BsxNZ7CXUs3SW+g2Lo=;
        b=jokskXwQRQ4wyj196wxCEFCFjm6LtElDWLBpH/fJ49jjiwg6JDFhAW+hb5uy2CVLrc
         3+Amk5STO0wvp6fg7MLWBy1SWZI1FyXKE9jnlfgI/uO46ww3tipb4M+chJHJVnMLdRo2
         lR0Bg8Jcc1O/KSkVxI7Noq829Y6qkf3Ex7z3gXiGgov/ElNimRaQ4cj3TAO9D0mXf5PR
         CBs7do1MBZ/7cvMA2fOPlqTSlQE3DGmrZM919QEXIBmJi+Fm1b+kdWJ0BOhVOepUhEe+
         UtBPYw5GvQOW1BDd+rZV3+1ROCHnjqg8kbtosSSYZ2WyIF1zIDWE1nzkDEVec+T2GUf+
         VLAA==
X-Forwarded-Encrypted: i=1; AJvYcCXLLdBz17tCI9R0PnREJsVnhYPwisKxBCYQnUPQelhG2Tf/TRVCFNVhNNYKpucQITBGCfWzmK3vBiS0RePa@lists.linux.dev
X-Gm-Message-State: AOJu0YxwW5GBloPqseMg2Kp2VHrPoRrY+wDdbWJlto9+RrPgJgb1yXcJ
	8+9aBFSCQD19kI8OL13DytoV3ldNQJNsRQPwWHvz1DQ5Qs8cC0hV
X-Gm-Gg: ASbGnctGuUaPftRvbJ1OkwQG6xuPNAf10AocEduoM7VUQ8YjuJMqoHIbJ3zHLKUud/S
	q3f+V/auGKf58w7CaTIgp4I6qPQTFBwkxE68hBMNtsElbSTnxBkjhOydQ/z+5BeyKS8rw4IqhuF
	0jGVBdsGRfDf6C5MuuZ7GMV1GtlpysjHmdGeLEIFRwxHyDa4lzPBnGcBZEeHSgm1ZQQ8FcvDrK+
	YczdMBOSBF3OJ6I7+tumebu5t8gKsjRkVErIRevUFiQBWp242GD2s8=
X-Google-Smtp-Source: AGHT+IGJHnyHlHs1hPjONK46MhelbvDImJ/ZpAqtTjiBRJ7oN6fZpHhJaDQL8rrZudWKWC7KD09S2g==
X-Received: by 2002:a05:6a21:3381:b0:1e1:d2a0:46ae with SMTP id adf61e73a8af0-1e5e081ee64mr15060906637.12.1735242580514;
        Thu, 26 Dec 2024 11:49:40 -0800 (PST)
Received: from ice.. ([171.76.83.141])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842e35d4becsm10304580a12.79.2024.12.26.11.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 11:49:40 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v4 11/15] staging: gpib: ines: Handle gpib_register_driver() errors
Date: Fri, 27 Dec 2024 01:06:35 +0530
Message-Id: <20241226193637.241049-12-niharchaithanya@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241226193637.241049-1-niharchaithanya@gmail.com>
References: <20241226193637.241049-1-niharchaithanya@gmail.com>
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

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/ines/ines_gpib.c | 78 +++++++++++++++++++--------
 1 file changed, 56 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 9d8387c3bf01..dda9205bfd97 100644
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
@@ -1420,28 +1414,68 @@ void ines_pcmcia_detach(gpib_board_t *board)
 
 static int __init ines_init_module(void)
 {
-	int err = 0;
+	int ret;
 
-	err = pci_register_driver(&ines_pci_driver);
-	if (err) {
-		pr_err("ines_gpib: pci_driver_register failed!\n");
-		return err;
-	}
+	ret = pci_register_driver(&ines_pci_driver);
+	if (ret)
+		return ret;
+
+	ret = gpib_register_driver(&ines_pci_interface, THIS_MODULE);
+	if (ret)
+		goto err_pci;
+
+	ret = gpib_register_driver(&ines_pci_unaccel_interface, THIS_MODULE);
+	if (ret)
+		goto err_pci_unaccel;
+
+	ret = gpib_register_driver(&ines_pci_accel_interface, THIS_MODULE);
+	if (ret)
+		goto err_pci_accel;
+
+	ret = gpib_register_driver(&ines_isa_interface, THIS_MODULE);
+	if (ret)
+		goto err_isa;
 
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
+	if (ret)
+		goto err_pcmcia;
+
+	ret = gpib_register_driver(&ines_pcmcia_unaccel_interface, THIS_MODULE);
+	if (ret)
+		goto err_pcmcia_unaccel;
+
+	ret = gpib_register_driver(&ines_pcmcia_accel_interface, THIS_MODULE);
+	if (ret)
+		goto err_pcmcia_accel;
+
+	ret = pcmcia_register_driver(&ines_gpib_cs_driver);
+	if (ret)
+		goto err_pcmcia_driver;
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

