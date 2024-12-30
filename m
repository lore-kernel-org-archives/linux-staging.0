Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C6619D089
	for <linux-staging@lists.linux.dev>; Mon, 30 Dec 2024 19:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735585802; cv=none; b=TE0d75tZtJmyN/uBKil757fJWgCnlLcrV+nI4u9CROTznBQ9fJs1BkqJre2F2hpoTC22CkSJvApkaPUS85W6bc7d1ERInvHsXWHuZhKG5efgEVIrzlHLVorJ+LNVrrFr66FU1dLhCAEHyRjekoR+n8kqL+erjAyWR01cQTgGWIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735585802; c=relaxed/simple;
	bh=cE62QEV/KBVbpuEXEN04Haz247wnPx6ZbxQNPO1vYBI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P0f/VmkTG2XSsyrqoL52yNm8OKfnclgfbwZQqUH8OW77sQ/Vq1ZUv68/XzEEUYPHUUozkiIuWvxYFzQ7A+rfww7wmnLZBzbjj8/CSXNacBFiToDGvuhY2WNy2bGyaPil/GQLJ9wQyJUbdWxWeQMJ+qEa+oFzBWIu33vCIEe9c6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eN9eJEZh; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eN9eJEZh"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21644b473ddso13625405ad.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Dec 2024 11:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735585800; x=1736190600; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yOUO9YPsefTgfIOt0AUjXALb7a4R9PKwgM8CDJeJtxk=;
        b=eN9eJEZhY7+HeOjyxRBc/KrEmA764NQF28ncvR8i2+4U/OmXvgNxz3cpRtYormyHNU
         CYSq/qDSEF7LIfxL9bIdFS3hvkuTDHAAfE4aMBwJ/3zI+vwXsO+5dEpAcwb07XalXe4S
         cpHzeTi6Q/mLXSIs0qxViHSJf21ouO/0vJHxvm1wvgekgkDoXe3l36PB5NNZHk/au2hv
         dN/Fg5IJIY0Duv6y36gzpXRZmW5oLYV9jzQpFAh9/SNcMNgUjhirP306FUivjxlVNrqP
         7RNQKaxrP4kbU+gK3HlcgKVsZlkPaaEDgyZdLKpxLeMAOTpqBI/XkBrkEjhoDlEBSolK
         8lQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735585800; x=1736190600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yOUO9YPsefTgfIOt0AUjXALb7a4R9PKwgM8CDJeJtxk=;
        b=S6Mh38pe+Ix+47IKM3hRMalCFRAg+J1zvaZUhJFOglCOnAhr8noJIt1+A1pPb18iNy
         wzVovDkrL75IECay+KatGrT36kAex5NI6yvOD77futQ6O72hT+2OrTnCb7XHT9LvmBcR
         vONr+nz7fY+sUDAAQjpvbnYEkT0ULqpXKFRcKYz3zJ0Yy14y7rrJHcSFDAq3QuEhDBcp
         /VU2xCh/kkGqTJzfW7b9yWy2tkjhFFM7zJ+8pIYdsDILrFuXj1ImLs9skS//8cakWOlh
         bWTt1DmBu2GoPOMpCw/Uh1ZM/x9LcTTXBgDJhdSG0pucAz/AJ10AockdpWIv9J4X81UG
         mJ1w==
X-Forwarded-Encrypted: i=1; AJvYcCXw2vqvgvgE6l8m56VgBwFHqmNfj9kvM8WQRC6ubW8ExEnYyT1S9hr8pVF6O3dKhO9O3vbt/5vxWAMzKfiZ@lists.linux.dev
X-Gm-Message-State: AOJu0YwcjnJZUo61qF5Z7flmWErTfK3pt7MAIIK1cmgtt/6aFRfRPApQ
	q4lbta1hZ8k4rETpBwqzy19VcRo07b8iwDbLnbLFQ7t5plxioNJ+
X-Gm-Gg: ASbGncv+Ozy2gsGo9fBjnNCxhGJME/Fu/+43lu50O6LzUpz1RckBs6bLPzU+sNZl++5
	Ml20wveoOdws3wIwbm1XQv3vKgk60iw3EemNpNXohUbdiN8NMI4BBLB42DzAxNV/y0NTGIuiyvH
	whHchOW2A60Iy2aBAxs95sFUPqJ0Gh1wdxy5fg2Yb6OAOeV/6nVQGTdNa8sg+w1xZ8/mjryELUJ
	e78IFAZYTBsUI88yYpl7M4x9AbtYiQrTJqKt72klT09CvchkQih3cU=
X-Google-Smtp-Source: AGHT+IHpjjH9niowQTZF88GunjXK3G9QKnriFbYqrDJc/MYzo+JYu1+AdCCZCrxWNN09hylMh9tXzw==
X-Received: by 2002:a17:902:ea05:b0:216:282d:c691 with SMTP id d9443c01a7336-219e6f1d288mr190075575ad.13.1735585800007;
        Mon, 30 Dec 2024 11:10:00 -0800 (PST)
Received: from ice.. ([171.76.81.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc964f09sm182886795ad.26.2024.12.30.11.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 11:09:59 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v6 07/15] staging: gpib: fmh: Handle gpib_register_driver() errors
Date: Tue, 31 Dec 2024 00:26:27 +0530
Message-Id: <20241230185633.175690-8-niharchaithanya@gmail.com>
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

The function gpib_register_driver() can fail, resulting in a
semi-registered module and does not return an error value if it
fails.

Unregister the previous platform driver, pci and gpib registering
functions if subsequent gpib_register_driver() fail and return the
error value. Add pr_err() statements indicating the fail and also the
error value.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c | 47 ++++++++++++++++++++----
 1 file changed, 39 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
index 62791db1c34a..90108ce0304a 100644
--- a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
+++ b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
@@ -1691,23 +1691,54 @@ static int __init fmh_gpib_init_module(void)
 
 	result = platform_driver_register(&fmh_gpib_platform_driver);
 	if (result) {
-		pr_err("fmh_gpib: platform_driver_register failed!\n");
+		pr_err("fmh_gpib: platform_driver_register failed: error = %d\n", result);
 		return result;
 	}
 
 	result = pci_register_driver(&fmh_gpib_pci_driver);
 	if (result) {
-		pr_err("fmh_gpib: pci_driver_register failed!\n");
-		return result;
+		pr_err("fmh_gpib: pci_register_driver failed: error = %d\n", result);
+		goto err_pci_driver;
+	}
+
+	result = gpib_register_driver(&fmh_gpib_unaccel_interface, THIS_MODULE);
+	if (result) {
+		pr_err("fmh_gpib: gpib_register_driver failed: error = %d\n", result);
+		goto err_unaccel;
+	}
+
+	result = gpib_register_driver(&fmh_gpib_interface, THIS_MODULE);
+	if (result) {
+		pr_err("fmh_gpib: gpib_register_driver failed: error = %d\n", result);
+		goto err_interface;
 	}
 
-	gpib_register_driver(&fmh_gpib_unaccel_interface, THIS_MODULE);
-	gpib_register_driver(&fmh_gpib_interface, THIS_MODULE);
-	gpib_register_driver(&fmh_gpib_pci_unaccel_interface, THIS_MODULE);
-	gpib_register_driver(&fmh_gpib_pci_interface, THIS_MODULE);
+	result = gpib_register_driver(&fmh_gpib_pci_unaccel_interface, THIS_MODULE);
+	if (result) {
+		pr_err("fmh_gpib: gpib_register_driver failed: error = %d\n", result);
+		goto err_pci_unaccel;
+	}
+
+	result = gpib_register_driver(&fmh_gpib_pci_interface, THIS_MODULE);
+	if (result) {
+		pr_err("fmh_gpib: gpib_register_driver failed: error = %d\n", result);
+		goto err_pci;
+	}
 
-	pr_info("fmh_gpib\n");
 	return 0;
+
+err_pci:
+	gpib_unregister_driver(&fmh_gpib_pci_unaccel_interface);
+err_pci_unaccel:
+	gpib_unregister_driver(&fmh_gpib_interface);
+err_interface:
+	gpib_unregister_driver(&fmh_gpib_unaccel_interface);
+err_unaccel:
+	pci_unregister_driver(&fmh_gpib_pci_driver);
+err_pci_driver:
+	platform_driver_unregister(&fmh_gpib_platform_driver);
+
+	return result;
 }
 
 static void __exit fmh_gpib_exit_module(void)
-- 
2.34.1

