Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CDC55775
	for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 04:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709008936; cv=none; b=NTuLTGnR6wZHDznKs/doblm81JILV19w5kZl7gjtxX3X3Q1DojjENEwzQPC9dpQ+vgT5Yohf1xfMaofd7I2N/epyueNlp9Rbp9pQzm0g5NwHGgAkdKDKLpeGo20z9oNyh0YO9FXs5wGP20PAaxb5Lvr7XOvNVFVeBO22n7wg26I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709008936; c=relaxed/simple;
	bh=nCBh6jOWfV9raD+ssu2XyS6gZGb2EqbYeymVcuscB9I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=soUNjlIV8ZJ+Tvep6ZeIQp74oKOfB5fFDdME//kV8JVu4RWEWgTwFrSd+5Sx1v2FF2EYFB50adpqyHq7G9FE1B9/0dtT3Pqamt8e4clR0As97zBev+psn2DMYr89FL8pGWiD9kO3L5iteW8Ec6KeWE7IoouGUvC3pRJHbu1JVsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=AasFgIPU; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="AasFgIPU"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6e459b39e2cso2282464b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 20:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1709008934; x=1709613734; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dBPLuEFjCgyZWSsbmwP+rRr1D5s8089WWtYk3fTyzUA=;
        b=AasFgIPUnLOo9VXqcx4sMQLhFFsjrKJZBylg3h2ZPjTGnLT9YzzIDP/UBiQoF0M/7c
         hB7HHzBi+SrixQcwhbEkqwp2PDNoxe+52G1xR0TlirpWypo2TQVk5Skg6GBP/PFKRqYI
         RMGAqrDrFKu4iUTNwICx0gpnrEBrkSX0klst1dqotwEeep+PEfPYCdnTJTon25+qU6si
         lwlnHwc5pC9Q6pzEG6FAb7y63iMTesry2142EbQ3+waqmb9xnfo89xi20+PDhfRwTXup
         fyM0ZYpuAJ2SikgQqZRWAc/XEqy9js+yhmKU7x1LAgAKrQOolF1lIZpAmr8f9KdkqEt6
         0aKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709008934; x=1709613734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dBPLuEFjCgyZWSsbmwP+rRr1D5s8089WWtYk3fTyzUA=;
        b=kcAQIjXiCA/godVCLgRc5xo2RZNpgaIgf9yliyuqCSXLHHlF7h0MyYpk7KzinZAGlv
         Zxy1lkF6L1UMl/MFPmZTan8Y+GSXNpSo1G5xXLVF8X7g0cC929rtO63pqipbnH52RxJX
         wwcxagZJR/tNhzXxPm9isERVVrTMrEz463uQpBb36jk8g4oq5ADU+CQotT3JFsfn89lo
         hClBMiJk/oQjkjI/UcaAwWhC/M5VqPd8Fybd7SQJc5QwAyR9SspxYqxlbfaWxHcY/BQx
         LxikPqrqYIgRJsNCSl4nlH/o4sGhpZU1sFNZeYUHiKeREZp3slfNjD8w+4Hcb4LXa7Ea
         BMQQ==
X-Gm-Message-State: AOJu0Yx0/gmc4WR85aQaqRUju5j66+yssGprpEyg5UrFdhPO6juI8ea1
	Ej6NKQ9aTEPHNNR1j51G5pzhX9QR4PvWakLBhVPcnYKv9E+XaXqC2IdYHm/vrJw=
X-Google-Smtp-Source: AGHT+IFfE/+orl8qcIqjtBTKROJqUolDTTvhmUAxHSyHQEhtytbUiHuAxbMB25q+6vt2nwDo3qSgDg==
X-Received: by 2002:a05:6a20:9f4a:b0:1a0:ed1a:801d with SMTP id ml10-20020a056a209f4a00b001a0ed1a801dmr1594323pzb.13.1709008934280;
        Mon, 26 Feb 2024 20:42:14 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id e30-20020aa798de000000b006e4ecc3e394sm4899782pfm.79.2024.02.26.20.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 20:42:13 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 11/20] Staging: rtl8192e: Rename variable CcxVerNumBuf
Date: Mon, 26 Feb 2024 20:41:48 -0800
Message-Id: <20240227044157.407379-12-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240227044157.407379-1-tdavies@darkphysics.net>
References: <20240227044157.407379-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable CcxVerNumBuf to ccx_ver_num_buf to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: no changes
 drivers/staging/rtl8192e/rtllib_softmac.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 794c50b2737e..3e26375a5622 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -852,12 +852,12 @@ rtllib_association_req(struct rtllib_network *beacon,
 	}
 
 	if (beacon->bss_ccx_ver_number >= 2) {
-		u8 CcxVerNumBuf[] = {0x00, 0x40, 0x96, 0x03, 0x00};
+		u8 ccx_ver_num_buf[] = {0x00, 0x40, 0x96, 0x03, 0x00};
 		struct octet_string osCcxVerNum;
 
-		CcxVerNumBuf[4] = beacon->bss_ccx_ver_number;
-		osCcxVerNum.octet = CcxVerNumBuf;
-		osCcxVerNum.Length = sizeof(CcxVerNumBuf);
+		ccx_ver_num_buf[4] = beacon->bss_ccx_ver_number;
+		osCcxVerNum.octet = ccx_ver_num_buf;
+		osCcxVerNum.Length = sizeof(ccx_ver_num_buf);
 		tag = skb_put(skb, cxvernum_ie_len);
 		*tag++ = MFIE_TYPE_GENERIC;
 		*tag++ = osCcxVerNum.Length;
-- 
2.39.2

