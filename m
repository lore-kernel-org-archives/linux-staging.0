Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAA119ADBA
	for <linux-staging@lists.linux.dev>; Mon, 30 Dec 2024 19:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735585789; cv=none; b=ojKXT3peLDhDarLWaeVfCkDGB3ClouBMkqBvyQt7zJR4+nWvXU0JKVfRSLFRnD+pkNHGmdLoCKvC6a2QluzSFrnQby1+aM8PS96V/IjmSA8HH/okE5NLstHMEjLhq1XCCnpKMU/psY0lbWMZvUKPskOBs4Daed+3tGTc5Lvxp78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735585789; c=relaxed/simple;
	bh=hRTC7gQvIpANVJnSEuSyOS2BqBnaStyxOCR43evHXn8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gplDqnKawcMs8HRWulzN7qd7ViCUvWxK6PNHmfjPaBvf3gwBuUeQGgqkBWM4sblUJmxouwHKAJDgK6uxS29L2wx/5gMWdLT1DD/+f1XOqK/VyabkXeD1J2JMBQK2U+kAFh9uuT4etvDBbhEfxe98SxLCCVIFbEL2PuvEI29ZDug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJj5+zpK; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJj5+zpK"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ef718cb473so1859799a91.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Dec 2024 11:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735585787; x=1736190587; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhujBAMi711rX4sFChpTBKWquP7CuLAwL+h0gUNEzis=;
        b=NJj5+zpKNHiQC9WGW0pL/hIdaxeOYp2MZn1a9GE6Fjikeh2KNcfV3mqyUV4+Oscdwf
         C2eKPpWUsIVWSq32sIj2khFVniAwxeTNMGEXxUNQfizi0z0ALICZQOjpMpLgFqyR3rPX
         mk2yEjxMBCf5JNKBNR5nVAjL1aYPLTBbbRhnzBXQWL3ENLbS1l87myuxYbLH6I4sSdGN
         onTZlhBgZxAU5TL/bdC/bebvc6NtC2CyzBCK/ri7LsChSckyb/2u9UkBmwAPhB+RF64b
         l+h3WKW168jMa4F14dw42EAAMfoGHToDyD7+2hPBh8cWmm+qet1TjhsbxC1yNEPpxij3
         2Lkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735585787; x=1736190587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mhujBAMi711rX4sFChpTBKWquP7CuLAwL+h0gUNEzis=;
        b=sOj/v5uToVvoIeOJ9lLEc63+dIRy+po8Dss+IgcOyNa3vegaJM6ZKzTyVgAcixEokw
         00RbJtiN7Hj37T4EG9bEOYctugFFv3mD04N51oD7wo4ehaBSs+qplmCy7Os9HXWB5k0t
         YaM7CADx5tu300k0jPHyyr71f7OyuiQMAT6daYarZC8S7ttQEPpYkaSz+GBSpltLo9yz
         weqCVGnu5HKPBT7ByfIUDjlVAde0wVgAu3rHHVy7RO0Ayv7Xd8QjUevcDogPlGANb3+O
         g4qcHj7GYki8x7s6nW9yHIHy5hWUNFBEVL2djGiQ+i1OUKYL+NWEvKb0DprGcrff32vM
         2tDg==
X-Forwarded-Encrypted: i=1; AJvYcCUetJ5KzN1ECxO2E0eFwtCx5nSToVf8j9q8tJzOuLhVVkxtHbFSyJQJPNcnOrFBf46F3lgAUz657LlR6qGq@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4s3Hv5X3IM8stwVIMggVtvXQ8GVfTKVP7WcFtCqCuyLNiTxVz
	ETCBcSV/Ij+9rs419nFHAe7c8pvo/tOn3ODvF2YSxpNX5XXAl1TA
X-Gm-Gg: ASbGncuzeeDLWjBjZ7jfJpZ0l1eaBLPT5wJVW68BUui5K5y8HZKkbhD+S1bMKej72oo
	2OtlxEb74S/KZ+Hvbg+Enii5tZyhEyGkt/3w2ADGK1YGo/Y69AG2m1PQ0/gSc8uwf4mjDAlAD1H
	prapcEMn0Lscw0BtZR1U6FHWtSKszSkPJLWxC+IlCk4ht2bPHNXJQUf/WXHKheKQclk9D4YqN/p
	P4EtM4iu/RGtiGCp+PK0TKDJ0JfAUeQlTw920SGT597L7ppT9lLZgY=
X-Google-Smtp-Source: AGHT+IF9/qByqpXKB+Ti9k6vfHKX4HuRQ4HiRR8hZaip/iJ7Kkkyt/0UlDlW6w0S3pRMjLiWcZPoxQ==
X-Received: by 2002:a17:90b:2f46:b0:2ee:a558:b6bf with SMTP id 98e67ed59e1d1-2f452efc09dmr20433792a91.8.1735585787122;
        Mon, 30 Dec 2024 11:09:47 -0800 (PST)
Received: from ice.. ([171.76.81.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc964f09sm182886795ad.26.2024.12.30.11.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 11:09:46 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v6 02/15] staging: gpib: agilent_82350b: Handle gpib_register_driver() errors
Date: Tue, 31 Dec 2024 00:26:22 +0530
Message-Id: <20241230185633.175690-3-niharchaithanya@gmail.com>
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

The function gpib_register_driver() can fail which can result in
semi-registered module.

In case gpib_register_driver() fails unregister the previous
gpib and pci registering functions, return the error value.
Add pr_err() when registering driver fails also indicate the error
value.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 .../gpib/agilent_82350b/agilent_82350b.c      | 23 ++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 53006d0cc79c..e9c1f0100b2a 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -910,13 +910,30 @@ static int __init agilent_82350b_init_module(void)
 
 	result = pci_register_driver(&agilent_82350b_pci_driver);
 	if (result) {
-		pr_err("agilent_82350b: pci_driver_register failed!\n");
+		pr_err("agilent_82350b: pci_register_driver failed: error = %d\n", result);
 		return result;
 	}
 
-	gpib_register_driver(&agilent_82350b_unaccel_interface, THIS_MODULE);
-	gpib_register_driver(&agilent_82350b_interface, THIS_MODULE);
+	result = gpib_register_driver(&agilent_82350b_unaccel_interface, THIS_MODULE);
+	if (result) {
+		pr_err("agilent_82350b: gpib_register_driver failed: error = %d\n", result);
+		goto err_unaccel;
+	}
+
+	result = gpib_register_driver(&agilent_82350b_interface, THIS_MODULE);
+	if (result) {
+		pr_err("agilent_82350b: gpib_register_driver failed: error = %d\n", result);
+		goto err_interface;
+	}
+
 	return 0;
+
+err_interface:
+	gpib_unregister_driver(&agilent_82350b_unaccel_interface);
+err_unaccel:
+	pci_unregister_driver(&agilent_82350b_pci_driver);
+
+	return result;
 }
 
 static void __exit agilent_82350b_exit_module(void)
-- 
2.34.1

