Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AAC2BE027;
	Mon,  7 Jul 2025 14:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751897417; cv=none; b=rbJTW2v5JsM6/c2qOBlCd2myTMUvbyxQzvom1xH6Fw6DOn/HBwjv9/2fzEzm7cOijXs1ZPlSGExHjVBAjEJMJP2gVeT0UNDJ75gyyGmH0FP968VKiABfeZqYene+ssmRzzwpIFY/v47St/kQszBJJcCZXbJBM5+Ey6j9WfOPT78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751897417; c=relaxed/simple;
	bh=Ym1eaiaVRia3tu27Gd2iINJBWKHQtzx9zAsS8xqQYcc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GyUtpXBEHDGdG7x7bOD8Nb4VV+b7TIq6GxLkgPJeazu1lQa6Mtlldnl483wDAgE9LuDQxqVcVLVHvHwnQTkiXZ+hU1ODUk6V+ZckjshQGws0aUdHEmfHB/GsARyFhq53N29Rmr61dZRuvD7O5MU25S23NGX7WSYE/ntmeU5YoyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AdVrDjew; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AdVrDjew"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-adb2bd27d8bso50543366b.1;
        Mon, 07 Jul 2025 07:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751897414; x=1752502214; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zfoXr039Mj+Ko7iKVd/LqK9c7pPjVthdjnKyL8+H+oc=;
        b=AdVrDjewh+rEoiADn8cqYhg+hhATySfAlOp6GbkXVmJHj94LogqOwC0sPkEcMMH3/d
         3pnlst38IaSHW0UC1U9JohDHj0JXP1wiWKkkaksrw9Xc0USt6JlZBL3tNdI0cgjRY2BF
         Yr3Fq9fooBwY7baZ0hQsg4Z4YxfOSAT9cx5T+xSlHyJQRi78eZNmlG/HSlc7KBe1OfXg
         rdFwr0jisTdx+KHkdKbm1F3iVHPQcmUKBKMMSFrkufQ2orHB3bS/mMqz7B7DTkjy1D88
         BqrLyhvkj3mB4wghSXIFfd5z5wPZmr6IJohNZY7b0Kpoods5cUGMh7XiczZCFVWhGwWZ
         Xl2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751897414; x=1752502214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zfoXr039Mj+Ko7iKVd/LqK9c7pPjVthdjnKyL8+H+oc=;
        b=xSwihblYu63umbL6PvSyAvaP5osMBFh7ESt0+kO/+y5jpp8eAln6+TlfRyOhyzz4JC
         i4Bw2EgylnmNIW8KDWZ3u7CvoPjxiCAcywU5XT6wAbQYpzqjpJuHgBRy5z1s6Is8UOUl
         VreidIFdUvxSxgnU8yUIJft3gaqjdKfYN/04R/x4e77ODUogDHjp2ETI+snp+pMg0yas
         RlvQbdcN1eEmOCIIRBaQtU9oijsbx8vSrcATP2p6ejJciXq8mgioK+D93CJphg9ceD8i
         mg5d5KeUPDc6r273NSlHC0ynqmAd1flG2qCOsiXdhGjmy9jJVi9+fjZG0VcdzoymuKjZ
         1Fxg==
X-Forwarded-Encrypted: i=1; AJvYcCU/91IHeyd0OIk1A0KGeSItrE44qDlMmfrPDFEAcOGX80Th6MEtpvFRp+YfZhvc0D9+dqj6clk6rF0kSzE+ow==@lists.linux.dev, AJvYcCWVYVEOTfItQOutjJJVd8915y8wzbSVhcAabRmRNk+qlyKSanDTfuXz4tXv0r5DG869OTJLQemV1J0wbh9YAAMf4aeAWA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQY9bDLPZuLEf3+ve7V6agPRGuDVZo85pOyCsIoblfmVPiBMVN
	4C8ZUnG/gEJv13XRmeNCqKgJI6gUJFTQhbxADCTumqXy2BpittVU0UNB
X-Gm-Gg: ASbGncuOkmK3Xr2gMqmTDbnaVN7g501mQ9881yy8uSuiVpwJOx6AOK/eTqoxInsPSNi
	xjUyLBAuSPNnDSSS5XQdCiAGeiVsI95dPKBwDAkWMcrcRR1arMA0l7tW6xwpaRF20QPuDN8+G+f
	x9cP26A5UX0KavZc7rH3rPvi1FAGpPtm+4CnpJVW983fG76qiJPTpy6uX91zAGBdHM6jP/zX/pD
	wgrzG37foLPke1cPf64WfD2rz6ruhp4jH+ntRhL+RSfKdNN91+3v72xSCfJj/a50wEdCLFfJNMN
	zcyBPI41pRxHbbSJW4t8XA0Lwe1FTPzNNJmrpkKrm7ADVUEH1KY+IcHjb0PVWKlwbPaIppX5Ybs
	ydNmxcIVcFNl3fyyd67wm98FpOW2H7+p7ypqqaPzcc7KivxIeeFKm2aCL/dEP
X-Google-Smtp-Source: AGHT+IEKnVBWadATSlejdndh1B5AdduKqoWoYdl+TXtUEryj64Oa+knTxIvJk4uK+Ngcdhrr6ocq9Q==
X-Received: by 2002:a17:907:8688:b0:ae4:1eb:c461 with SMTP id a640c23a62f3a-ae401ebc908mr384594066b.14.1751897413716;
        Mon, 07 Jul 2025 07:10:13 -0700 (PDT)
Received: from yousrii-VirtualBox.hotspot.internet-for-guests.com ([82.129.154.18])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d1ae3sm710370466b.7.2025.07.07.07.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 07:10:13 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.org,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	dan.carpenter@linaro.org,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH 1/2] staging: media: atomisp: return early on hmm_bo_device_init() failure
Date: Mon,  7 Jul 2025 17:09:22 +0300
Message-Id: <20250707140923.58935-2-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250707140923.58935-1-abdelrahmanfekry375@gmail.com>
References: <20250707140923.58935-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hmm_init() would continue execution even if hmm_bo_device_init() failed,
potentially leading to bad behaviour when calling hmm_alloc().

- returns the error immediately if hmm_bo_device_init() fails.

Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
 drivers/staging/media/atomisp/pci/hmm/hmm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index f998b57f90c4..c2ee9d2ec0d5 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -36,6 +36,7 @@ int hmm_init(void)
 				 ISP_VM_START, ISP_VM_SIZE);
 	if (ret)
 		dev_err(atomisp_dev, "hmm_bo_device_init failed.\n");
+		return ret;
 
 	hmm_initialized = true;
 
@@ -48,7 +49,7 @@ int hmm_init(void)
 	 */
 	dummy_ptr = hmm_alloc(1);
 
-	return ret;
+	return 0;
 }
 
 void hmm_cleanup(void)
-- 
2.25.1

