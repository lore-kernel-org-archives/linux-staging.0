Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9526F1D4605
	for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 19:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735242593; cv=none; b=h/g6eXyEsIWfKDxQ6OKLAZ2UYKwBm6feWTSiPsVflVZh1QcZ5fXQxec4J/qvuJPTV9NtlF0+bngPkmkm84lkdCx1N+wrSsPT4Hg428+qW7L20dU3oCtojzMdm/SAY+fZueQ7c+Tf19LHDYAE5jqIun/lp72f1jpq0lCjO30Yq8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735242593; c=relaxed/simple;
	bh=uoRS2FQJmsfyJ4pjwVrUVvJUL2CXgWB/WSSSY69yO8o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ESam9fVFwv794nG/4HzQbk0NX9itvXll27thqNxwUJrlVVz7m5y8EdlEPDHK77xI/lSwU1IBCDqbcqIgD8zAi11OHRUn/dyLSpLBMmaRnuJMBa1/8QBj6Fz8G/5S8VGbOSiVkK7OhCF/wDUgTfI/HQB758rhPEEoSu3z46e/u78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7Ed5wSo; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7Ed5wSo"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-216325f516fso8594945ad.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Dec 2024 11:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735242591; x=1735847391; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzTMfFBlFZr+lpOgXP6pxefjRutEhsyjgWDG/oae2Wg=;
        b=D7Ed5wSoIP4cP2O99R6eML6EUc3k8Q/PZXg2pVXWFChwq/OtqmCIkZuhWEmgLz77qj
         4FpAxWI5De2PI3nfJNAdGdCeEhOOZsjaXLuLGT+1xb/JBPZHg8CjnFoVpKvZXDtnC515
         NXogSzRlZaw80swvfs806ymKgyT/VlBkG0yxQPYNpW7tO+aBZAbRDliTepB2WiRG55mZ
         iFXReuMzFDcVQLr21PN1FTAMf8ODtXPAdXLWNdkQJUfPEjBJBf7ySBkfgMucnGNP4afP
         0+MLcBz66b7RPUv/Hg9XyFwlg+uXALrlTGzkn63H6zamdCeSbnns2IktGr67Q0t551jp
         ZExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735242591; x=1735847391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzTMfFBlFZr+lpOgXP6pxefjRutEhsyjgWDG/oae2Wg=;
        b=V8rNC2+8zrs7AV3LQtjUZ1en+KXP8PEvfmwXrKYXPMPLDEfV4s1BcZoq8zHvE+EY31
         fBii5c8or50YixuXNUseHDJSyC+lZ/rtqWSPXpaORWkShU1STpKPrn0lh34ggw9whSci
         xl17ise1YDBNTMseLwH5Y8Pg17sDPyLxWQZhaWNh8+p3GqFrOsXxhiJ5RT0qGCb1VgI9
         HdJ7SqT9600TyyS8nQLO4J/tUKYtwfLII/boB9pG3Y7Z9Hbc9CUinmRLJ+RBv+eI5To7
         AcZXYcg87f7jS41UvvKv00v64Y5EvOHB2cUY455aVgt7ez+ll/ggHQuKiBUmot13Dfet
         sQvA==
X-Forwarded-Encrypted: i=1; AJvYcCUhSOHMpdrq/Q8cAFMD81T4kK4+Qw8ZKYgbaAGLMWvRXIQkgl/H1RmdX/Z365IA00rqO+dVTOUR2tWqTKHi@lists.linux.dev
X-Gm-Message-State: AOJu0YzWHZ7qAhu1scC47G5NWvpn49Qn+z3vT9T9GxoQhfdPtzGopFWH
	r79xrOCLysx0nkKqYPbh6sMoKNzvQczzXBuV4YmbKWq5fJNAcw9V
X-Gm-Gg: ASbGncu/mvTVtSpLHoM4OHstnX0H0klPFpfUDXbgwFCPUQqtMDXiteTps1rNVqJNPK2
	ASX1JlXVtEvoipQiWq67yxs3gUmhNtxQF4JZ+prVuCGqV9c6UMzT5WxB8/Y6Ual14XPNPw0itTt
	IXsjmn/9AyTTgOIaS2jHfBwE+nZWO9952a0FoZtcVsCD0kx3Ko7pDDa6p4DFjDQZhXaMX/nD3iU
	24OMPFDMq+NA4YflZxzhwXNxP8wEd/bSYc7sn8e3AtFXcPYUQ7KG38=
X-Google-Smtp-Source: AGHT+IEFjWIkssF5xwActXI8r1y01mJnLV/vNZGiVEfCF5IFGTaaL4qeFUKa1NL7iaHwb6KheZ9v7A==
X-Received: by 2002:a05:6a20:8409:b0:1e1:c26d:d81a with SMTP id adf61e73a8af0-1e5e080dcc1mr14527061637.8.1735242590764;
        Thu, 26 Dec 2024 11:49:50 -0800 (PST)
Received: from ice.. ([171.76.83.141])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842e35d4becsm10304580a12.79.2024.12.26.11.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 11:49:50 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v4 14/15] staging: gpib: pc2: Handle gpib_register_driver() errors
Date: Fri, 27 Dec 2024 01:06:38 +0530
Message-Id: <20241226193637.241049-15-niharchaithanya@gmail.com>
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

The function gpib_register_driver() can fail, resulting in a
semi-registered module and does not return an error value if it
fails.

Unregister the previous gpib registering functions if subsequent
gpib_register_driver() fail and return the error value.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/pc2/pc2_gpib.c | 30 +++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/pc2/pc2_gpib.c b/drivers/staging/gpib/pc2/pc2_gpib.c
index 7b3b34f47341..1d42ced67b2c 100644
--- a/drivers/staging/gpib/pc2/pc2_gpib.c
+++ b/drivers/staging/gpib/pc2/pc2_gpib.c
@@ -635,12 +635,34 @@ void pc2_2a_detach(gpib_board_t *board)
 
 static int __init pc2_init_module(void)
 {
-	gpib_register_driver(&pc2_interface, THIS_MODULE);
-	gpib_register_driver(&pc2a_interface, THIS_MODULE);
-	gpib_register_driver(&pc2a_cb7210_interface, THIS_MODULE);
-	gpib_register_driver(&pc2_2a_interface, THIS_MODULE);
+	int ret;
+
+	ret = gpib_register_driver(&pc2_interface, THIS_MODULE);
+	if (ret)
+		return ret;
+
+	ret = gpib_register_driver(&pc2a_interface, THIS_MODULE);
+	if (ret)
+		goto err_pc2a;
+
+	ret = gpib_register_driver(&pc2a_cb7210_interface, THIS_MODULE);
+	if (ret)
+		goto err_cb7210;
+
+	ret = gpib_register_driver(&pc2_2a_interface, THIS_MODULE);
+	if (ret)
+		goto err_pc2_2a;
 
 	return 0;
+
+err_pc2_2a:
+	gpib_unregister_driver(&pc2a_cb7210_interface);
+err_cb7210:
+	gpib_unregister_driver(&pc2a_interface);
+err_pc2a:
+	gpib_unregister_driver(&pc2_interface);
+
+	return ret;
 }
 
 static void __exit pc2_exit_module(void)
-- 
2.34.1

