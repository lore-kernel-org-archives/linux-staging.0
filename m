Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D2D19A298
	for <linux-staging@lists.linux.dev>; Mon, 30 Dec 2024 19:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735585796; cv=none; b=ocZ4olCZ07Tb/TiGVIJuWljntBjxNJQZEPzlvuBHj7cCZhJNyJC0Bqd/5eTDVXH7nxKiPzrJcpbYKEZenvCPsbFmferwVgcmus1FXOFQVYF1PNUFYUtjqqEwPa9dyaU5c6qkOGlzOe+ssB7FX5U9Cau3jfakTD8tI4M3OHgblzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735585796; c=relaxed/simple;
	bh=+/U6TP0u4+L0ticmjRX+UP8OM1S6krGy8xWAWPiUEKE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b9RUpsfSkSNe4prMSOrpYwdOmuCgTjtsK9Q8AWRRYUbLRIf6Hn5dKeXJ6yhVx3g+gvoX9BXHuxh2iZWLS26Tr5nnt+GUmhHxD26Nq/GyWo3kOGyyv2Pp6tb0xj4zCxcPkL8X5UW02mNGENbXx5kGcOUI8vRtMjSfx2UzhAVHfcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y5StX91T; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y5StX91T"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21a0374a1fcso9936475ad.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Dec 2024 11:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735585795; x=1736190595; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oT5isU+QbLuiUavKN59sWsElBo1xMBVRc25NaB2S0Ro=;
        b=Y5StX91T+s37p+oIb5xl/q9JAyPBGsYL/MVIRgMtsmm5Jn+wCacOzjHrMv4e/Mbpwl
         6zfWE2OzRtL+n4YUFYasp7s5VWyWUKv0pG9vsci824ZTSXz9uet+j86O3MiPnvOZL9ZP
         SlnbMfhICls5Z8wDDM1NGm7jGyafmHrIBQp1SgzMyoklXI1llfnn8Xjwqjyyby4vpC3p
         tWEPbQsQDEX0bcZE3U0Na3YmK4qe141yEeQ+/xWbOYyB5z41tPxwOv/XjXFO1wUrbIAC
         ShEDihHxJNtTTDrmS7n9vd+lmhXRgne3MrQu6QEm17SVUDUdgN1WPmDg86DA/aIJSbUB
         CdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735585795; x=1736190595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oT5isU+QbLuiUavKN59sWsElBo1xMBVRc25NaB2S0Ro=;
        b=xSH5cM5v2XlgIQfNQCEdpTLlXnH8uIJMLn5qoIkPpdvvkAVpwrVsao5svhzJzkoz9T
         cGk9madDBJqCyQrSeBzRp8zLgxJhnZkb4evG3D9u5ew+4vDXUigE6ZvclyxLG0FIKkn2
         N94gwP7chbzkkp5XRWvzX599USoJ+khL2k0r3g4fw3S97dmPZRLTFhPeJpkmeSwOtc9M
         yxbp+J2Q/DnmBzEd2wlZ6RDHZUVj5LiCiY0EHa37h7/sp75DC9qWuMTGXs4fogWqIXBt
         c5Ff0GxfLG7jARRP8UglPbAW2AMJzOwcbDrr4vSRtQIGahlnQS6HHxxAO+tcEneZYRD2
         IA2w==
X-Forwarded-Encrypted: i=1; AJvYcCX2NC6u/o554Kb+qoo4tRLwu+ugzfEx9WWQfSmpCFIj3wm4qZ5aFVI2rWfsXkP/bea92YYigp+84SeQPULm@lists.linux.dev
X-Gm-Message-State: AOJu0Yxri7q1PsxgNJALgTD+KRuXLAMX2k2p1vvGzEClgMvh4ryRvIW2
	Oq5k+f6A6Oa3BiPsZBaLyCZpDY1fy0sLgmt7nU+n4nniLrrdZvRA
X-Gm-Gg: ASbGncuZN5RFmMPiWASUM1pItYe9HeMEVVBTGqCS84J/E6H0TRtOMoqBrbgJZ3UPr1+
	v1onvDYaE3+SrUN++OhR0zHMM0hthBb93fcKzSW5EJnyl9nB0YjIuVQv0L+aMHFCcGzJK9TSKJh
	XTnuoHv/CTRTsctyYzXf9WKuzFK14+JPzBksjbcCw3uCorNiMZIzRlF0tki0URYln6zARCCskPG
	hQxI443tv7qW1hukb/coo+EkrGMjClgnLEFg89cZlJGlDB2K5WZ21g=
X-Google-Smtp-Source: AGHT+IHY/qiDc4ESBgY9biNcH91XNLwJ0wzCiwd+E9nfO4KdooIKN/6Kym6OcqndVAqo2gvhOdyEXQ==
X-Received: by 2002:a17:902:c40b:b0:216:6590:d477 with SMTP id d9443c01a7336-219e6e854c7mr199666195ad.2.1735585794810;
        Mon, 30 Dec 2024 11:09:54 -0800 (PST)
Received: from ice.. ([171.76.81.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc964f09sm182886795ad.26.2024.12.30.11.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 11:09:54 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v6 05/15] staging: gpib: cec: Handle gpib_register_driver() errors
Date: Tue, 31 Dec 2024 00:26:25 +0530
Message-Id: <20241230185633.175690-6-niharchaithanya@gmail.com>
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

The function gpib_register_driver() can fail and result in a
semi-registered module and does not return an error value if it
fails.

Unregister the pci registering function in case gpib_register_driver()
fails and return the error value. Add pr_err() statements indicating the
fail and also the error value.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/cec/cec_gpib.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/cec/cec_gpib.c b/drivers/staging/gpib/cec/cec_gpib.c
index 3dc933deb401..e5b0941872f5 100644
--- a/drivers/staging/gpib/cec/cec_gpib.c
+++ b/drivers/staging/gpib/cec/cec_gpib.c
@@ -365,11 +365,15 @@ static int __init cec_init_module(void)
 
 	result = pci_register_driver(&cec_pci_driver);
 	if (result) {
-		pr_err("cec_gpib: pci_driver_register failed!\n");
+		pr_err("cec_gpib: pci_register_driver failed: error = %d\n", result);
 		return result;
 	}
 
-	gpib_register_driver(&cec_pci_interface, THIS_MODULE);
+	result = gpib_register_driver(&cec_pci_interface, THIS_MODULE);
+	if (result) {
+		pr_err("cec_gpib: gpib_register_driver failed: error = %d\n", result);
+		return result;
+	}
 
 	return 0;
 }
-- 
2.34.1

