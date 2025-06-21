Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B14730E83E
	for <linux-staging@lists.linux.dev>; Sat, 21 Jun 2025 14:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750516359; cv=none; b=N9smYWOUituR/wQ4OKJw2xxxX5EsNRlgxMIGBbPxicn95nWubyw1ndpqF2sMm/PA24wAI8ECIE++ZMPlW0erpV9hZ8RwRGuMAdmznk7guA3Jn+SfFkzw3iGCeG/WMJbjB5w8JRsNvqn99/KCsBmDpYwLbQc1E02WzLiUoNWKk7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750516359; c=relaxed/simple;
	bh=JVPFAAvse4A5IpP/YFqmn/hhxB+HgS5D6zZF1Yd2S3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lmP7e14syp5jmuEYpA+dlUeYHiA9J8Qn/BO/gjaNg1oCLIu2hIoW0tTctJCBhejc/IkCZG+0invIJggCS747ZGjZwY8ugytd9Ba/qisOJZ4t6MnY4ecl7s2jojZPXtcJAQB/6eYGkWSoEelUZkP60tHlRxDIL3LKdRnP01lOnKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AVfZYq4a; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AVfZYq4a"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7490702fc7cso1265379b3a.1
        for <linux-staging@lists.linux.dev>; Sat, 21 Jun 2025 07:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750516354; x=1751121154; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yL1kTJshOAGvipwJGRaHGGH+Jim1VlkRfihDhF37q38=;
        b=AVfZYq4aVD/ck8lV7K61LnO5++2LoUPebmRWNdinPjNXC4s+2hVZ/h3+ULI07E07cX
         jE3hAfmterLTh45U/ncc3JYWhXt4ydM5Qu+pB2V7nRaCARDECQjrqsttdqJWLRBQa6hs
         5HA4SwJSOZTTlq6WMzyVC89WoTJH1Sxeqv+vQbRIKWcZuAz8lXun1bzRW7o4EaDU00qY
         x7kbDkpy8+H3H0iPQwnk4FCRM8VGQCL9UFksNvX4U1Mu3eObClkCE5LC3pur6iHnaJDY
         pryNxZV2wTDcL4zegP+ug19NRrU+F7aYvAYQUzqvnu9iJtAT1Z+DR8RErR8rHM5RrUeO
         xtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750516354; x=1751121154;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yL1kTJshOAGvipwJGRaHGGH+Jim1VlkRfihDhF37q38=;
        b=NG+SB8ss9HDeSqTjeNiW+35QLHuSGceoMdZN3DIVCI2bWd4vSJB7ZaWLMVgyVuPkDd
         0Yqbhycq89p89htVBfdpmaSL5+bnRBgCrFR3SesVRXkKwO17+jUit/FDzy8aDqq+Tyaq
         YBvOiElqGDup9hn9g8ZNteAHDdArZb5nYJsDCOQHagt3uCEq9+OxmhQwaMjmOUGd5Z7e
         dv8TeWjSWsC8Dja/GJFxDhppo+a8L/XIplA311x1GYnpLZxcFL2gHC1+9E1UTQcIdcEP
         L0jyvscZtYNYzqtQPZqHeud5abSlq9YwXga27dhjD8klxagcP7iaFAA6lGTzT3M2RyER
         AhzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRwD7qvL3J9MebMssBGd0RxPJgmAvri613tw+RZ1wF+rKXpL/8SudnF8zhYOf6EIWb/LzjcyHj/o2ZU4cS@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5+mK6mXlZya7fHC6PDxEHUgq8CLBQYvkZIisDJeAdYg++d7hl
	Thb+IenGuin3MYxPL3OJMFm3DK5BlEuYAtyA71I401DLIzWaHuz7mOd0
X-Gm-Gg: ASbGnctaNEFt3yLIPMekVaXBZTcHYbNXWm8osU5jk8aUXkaetnhpV0Mh/k6Z3La1o7p
	ShJbEhjPQg8Un2UFvUoEKYF/KA/qBhiUM37powvJBVNPfbDhmsIlPULE7VBMtGOPxtOoAGhWefE
	I2H8xV1QQCpIUFgG24GO5VQfBEemJ5W5crvWkZpFWV1+Rrizv0J7S5XtUVdV0QrT3GHbeGPxOrN
	JXZ1o7YMdZE1gLbdyNWIEONllmJGAktcjWrs7nEmPjzsj7i/w32RY5R8qu8lrY4jks70bn6wdmV
	BdP2lmyp+Rht8A+8cxA0EGi0IAqJT8BADpd/cd7ilq/urpXwiKqOwA+dFQOtQ7LaLscZ6wkU9QK
	mM1tWnlwmuPOLsQuo3sdFhQ5xTW8UaXcJY9JPM9d3uiaa0K+o2w==
X-Google-Smtp-Source: AGHT+IE4ASQcgRWD/jZgC1n/UDfRdS8RrMiGc8W9Q9v6/qUF85DKlX48B/nBotJeArrpmvNsbvBT1Q==
X-Received: by 2002:a05:6a00:3d4e:b0:748:fd94:e62a with SMTP id d2e1a72fcca58-7490d4e3677mr8361899b3a.1.1750516354403;
        Sat, 21 Jun 2025 07:32:34 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a626c31sm4457914b3a.106.2025.06.21.07.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 07:32:33 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Sat, 21 Jun 2025 22:32:23 +0800
Subject: [PATCH v2] staging: media: atomisp: fix coding style in
 ia_css_output.host.c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-bar-v2-1-4e6cfc779614@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHbCVmgC/1WMQQ7CIBBFr9LMWsxAoW1ceQ/TBeC0ncQWA4ZoG
 u4udufy/fz3dkgUmRJcmh0iZU4ctgrq1IBf7DaT4HtlUKgMdkoKZ6MwfesGp3FyA0J9PiNN/D4
 qt7HywukV4ueIZvlb//0shRTGttQjat0pf51Xy4+zDyuMpZQvx1o43ZYAAAA=
X-Change-ID: 20250621-bar-573b8b40fb80
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750516354; l=2215;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=JVPFAAvse4A5IpP/YFqmn/hhxB+HgS5D6zZF1Yd2S3s=;
 b=3HJWzSk7bSPrIdSg4ZhvkYfzGpJsO+zuinCwnHYwi1F6c3nIqSCUoc40G6V+OFR0tDalMqWlF
 e8VF/EVeRjOASiw+ONLqSRVLe+dIvJAKc9XlZJieUyOSH9/lY6FI0kx
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=/x4391DbJ19fFQI7t33HWt3lsHfYPl2I2ax8C+Vxr+M=

Fix two checkpatch.pl ERRORs:
- Use tab instead of space for indentation
- Move trailing statement to next line after if statement

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
This patch fixes coding style violations detected by checkpatch.pl in the atomisp driver under staging.

- Use tabs instead of spaces for indentation
- Move trailing `if` statements to multiline format

This cleanup improves code readability and follows Linux kernel coding standards.
---
Changes in v2:
- Fix patch subject prefix to "staging: media: atomisp:" to comply with media CI style.
- No other functional changes.

Link to v1: https://lore.kernel.org/r/20250621-bar-v1-1-5a3e7004462c@gmail.com
---
 .../atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c   | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
index d09365e0c47104dbffbd455bfd649b9079f88c9c..044c7d3706f486ba7cae5941ac598044c831b6c2 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
@@ -74,7 +74,7 @@ int ia_css_output0_config(struct sh_css_isp_output_isp_config       *to,
 }
 
 int ia_css_output1_config(struct sh_css_isp_output_isp_config       *to,
-		          const struct ia_css_output1_configuration *from,
+			  const struct ia_css_output1_configuration *from,
 			  unsigned int size)
 {
 	return ia_css_output_config(to, (const struct ia_css_output_configuration *)from, size);
@@ -127,7 +127,8 @@ ia_css_output_dump(
     const struct sh_css_isp_output_params *output,
     unsigned int level)
 {
-	if (!output) return;
+	if (!output)
+		return;
 	ia_css_debug_dtrace(level, "Horizontal Output Flip:\n");
 	ia_css_debug_dtrace(level, "\t%-32s = %d\n",
 			    "enable", output->enable_hflip);

---
base-commit: 3f75bfff44be0646580fe4efda45d646f9c1693b
change-id: 20250621-bar-573b8b40fb80

Best regards,
-- 
LiangCheng Wang <zaq14760@gmail.com>

