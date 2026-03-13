Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1AA2D2381
	for <linux-staging@lists.linux.dev>; Fri, 13 Mar 2026 17:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773424538; cv=none; b=bX27ma4p7FjSo1h8cDahIHlFApPr+ruR9S05xUvvxu6gn9OluAAqHD47fx1wypLUe9IQl1Vyp0X2EzpN4HJo9EdzAauw98faXr7e416Rjo/vqzGBsdjzgajQOPVx/QgdFPx32GeJVW/hoyeCx+OEs9ReGEwjXAhAwKrwf5hL1aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773424538; c=relaxed/simple;
	bh=9Gq0qj8d/rF77AtAbVb6xF3t67Z8R3Se/h26S6GZoJA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rYFWtp2oK1EW2wgWRuosnmkQwaZ9jSc++UB8X4BkQtaM3pJdvqriotmdUPEHB6+LGq5nSkQl20f13ZWBzVPl5GWcIahkxIR24SdOvhOetlyJFOGFxSdDTedjJe2OX2uXr9qwgOyi2DYSx+c7Hf0XOMNbC3R6QL5ub02cdfErkhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LMGNF0X2; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LMGNF0X2"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c73967cf77aso1056055a12.3
        for <linux-staging@lists.linux.dev>; Fri, 13 Mar 2026 10:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773424536; x=1774029336; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDFQWeInsFvR4o1W+3qvLdyqVqLtdW4pPGax3mpxcUo=;
        b=LMGNF0X21Odqvz961uC3gOZSVSvKJsNzX8j5LcTNXeGERkFS/w6epq7F578adhv3/I
         l8JXrv70vfbLYftYiCBADUsga04HSVe2K4bTngcDCm/WBrgpGv3s1oHexjGxnPMPvIJK
         Zs2MZT7lgnzWkNaaLVMYALBHdqPh4q6N4nln7bo/9NAqDDz1RnOLKNNkPrLLeuEqwSAf
         4Lr+pZcEvC/+XwQsJE4yA6aggMmWNu58TIp9YMYvUGH+LRtXx216NM/ALw2zQUCeWqF1
         yKZLlBy/wFKWBnMStfYu/UCFhsVFsx7DMrnmvjDZGvzb8QEL1qIhXbBGNNB4tS4Dr0rA
         eVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773424536; x=1774029336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kDFQWeInsFvR4o1W+3qvLdyqVqLtdW4pPGax3mpxcUo=;
        b=gtZxaLv2RPcj69wFTi42TjXhIKworWfkF0W5ZbzIEJBnds8vc2rkE6zZIHnIa3Wi1D
         bIIGllzGLNuE7wCap+Mb3DKuADYlKB/jGdJN0xtvyDU3QtNWeQ8Nlt+0Ob31nI9LKxI4
         SZEWMF0crm6dguTRmoILYKswA+Bgvd/DuIUNY93NpGFXX8gmgPIHa6ZIWRE9fNtY/agc
         yuq4sH5g5adSrkkXeiavfnS/iUagaLkA5C5tdUBgbxMy1D/FlkLux8I3EQMg9ohG9hMx
         yJ/PUZFVNRREJ1JxaUZPoePttHNS26tmuDZh+ZitfvPTgFY/tWEQ1gnOJGzbeYH462aO
         eSPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfKZanktlhVnl+CqBNnzXTAdQdDPZT0zL0oKeKQYTJr+WGrsour+aZ/l3gBAF+V7kpAcoVERrKO4bVqPss@lists.linux.dev
X-Gm-Message-State: AOJu0YxMq8JJn0lxit+C64tXlG+lIrTFnXc2wGkVnFawKNRmfMZTZURX
	ppMggHWp+h3sI5OYT7qlj8INYmyBvEJnK4nPiIDxSUBUUTQtTmHPchW/
X-Gm-Gg: ATEYQzyZHCflUAzk4t4etF1xg4zrezqRD9wItjacqukpiWJVR7hzwmyQ04g0P5+7vnH
	/tl2Z2h47mxhEeqPxYWwfZzUPb1lbJ2Q4aIA/nJg+7bNw8AGHfYi6e+0NMkpYLpojRbwBss9gpE
	AUbEWTcywG/Z6iya0l43ZP+q2QZ+zPXTip467Emnz+OO2nSqs0DxMPt0fvRslBQnhf0FsJHnpYa
	BTH4mdj/mPry2cBJ/QlFstqQg/zKY7hQPVPfx42NPdux3RYOgIHqhDfrdmlDjqk8nfub5/6FAtW
	MPWVW8/59/1mocRM64H2besv1949CP43F2N5ecdbyzu3iTmMZf27b8quSj6xCcuw3i+p9dncQzW
	H7tDvwvmq7ye4gqMbZoBRqLknq457Qko1jE0XW9+45hqWC4BWx8MWPtI9yl0nP4hOlO/odYMH9+
	j3f9wMQGlW0UMNuLgUUA9UCJUKnEtzbOHGZ+7sDxHR7zEOGK1G3epiDZ3UEeTMAof1S6xJIuOpe
	1QkIhQYgTjLTM/51Eg83OONii+IByq9DKY34w==
X-Received: by 2002:a17:903:3905:b0:2ae:a70a:2af2 with SMTP id d9443c01a7336-2aecab1ed76mr45383925ad.29.1773424536417;
        Fri, 13 Mar 2026 10:55:36 -0700 (PDT)
Received: from starpt-K55VD.. (2001-b011-7803-1632-43cb-2c60-f383-892a.dynamic-ip6.hinet.net. [2001:b011:7803:1632:43cb:2c60:f383:892a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece80a3a0sm26209175ad.65.2026.03.13.10.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 10:55:35 -0700 (PDT)
From: Lin YuChen <starpt.official@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	starpt.official@gmail.com
Subject: [PATCH v3] staging: media: atomisp: use kmalloc_array() for sh_css_blob_info
Date: Sat, 14 Mar 2026 01:55:26 +0800
Message-Id: <20260313175526.14974-1-starpt.official@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <abQ1nYvEpKV-rkL8@ashevche-desk.local>
References: <abQ1nYvEpKV-rkL8@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded multiplication in kmalloc() with kmalloc_array()
to provide overflow protection and improve code readability.

Signed-off-by: Lin YuChen <starpt.official@gmail.com>
---
v3:
 - Resend as a single patch to fix the incorrect versioning and
   numbering (1/2, 2/2) in the previous submission.
v2:
 - Remove unnecessary parentheses in kmalloc_array() call as suggested
   by Andy Shevchenko.
 drivers/staging/media/atomisp/pci/sh_css_firmware.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index 57ecf5549c23..af12df2f9b09 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -253,9 +253,9 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 	sh_css_num_binaries = file_header->binary_nr;
 	/* Only allocate memory for ISP blob info */
 	if (sh_css_num_binaries > NUM_OF_SPS) {
-		sh_css_blob_info = kmalloc(
-		    (sh_css_num_binaries - NUM_OF_SPS) *
-		    sizeof(*sh_css_blob_info), GFP_KERNEL);
+		sh_css_blob_info =
+			kmalloc_array(sh_css_num_binaries - NUM_OF_SPS,
+				      sizeof(*sh_css_blob_info), GFP_KERNEL);
 		if (!sh_css_blob_info)
 			return -ENOMEM;
 	} else {
-- 
2.34.1

