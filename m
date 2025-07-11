Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D6D28C2A3
	for <linux-staging@lists.linux.dev>; Fri, 11 Jul 2025 11:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752234889; cv=none; b=AMit+UN56kziyI3x0R4+Z+b6GwZ2AROu/MlPVrIVl278U879L+EmywBNexSNvqxmc2AbIQSW34IsP2wjuGMxoQDW8hffS88iUCPX9cxxG6DuMdNPO1cIdz9LS8lctiBPKGTpN7jWuCYd8cSHBy01yKDI9E6MT8opMNbsLboiskM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752234889; c=relaxed/simple;
	bh=AqnW7/c9nG03ZAzoPbA3nRf1z9VOfMnwRCXHwCluQ3M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WyGulL5mw2574UkT7mlypOKcUEOrz9T5wFzlaJBINbWRzJ9wo1kbspWqKJoOXoYB4AIwIXhrtMiiXX9UmYRgd0f0wQw/zpvOzlvSUZuHnD+ElNbRWksl5VCXa7/Lp7Tw9st447Tf5OlbL56DgEACDCgaD4yC4uDliPIBCLBfe8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GfNAvsEq; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfNAvsEq"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2350fc2591dso20649025ad.1
        for <linux-staging@lists.linux.dev>; Fri, 11 Jul 2025 04:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752234887; x=1752839687; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DFtn4/ZNNp1Bo82KZbs6Ml2JzOPxRd2Eu3X06xLlUB0=;
        b=GfNAvsEq+/lS+gqUe9TmY3gyUkzsnR3xnXMDRtyNW1CJZM7G4Xstcyx6QlediXGJq/
         RoL6o9/4bGj74O20rtRv5UNT88zian7HDydEHmB6A5bOgCCipqqXmaQVnFW5+iNb6Vmz
         HgN/bh3arn++pVHcxbQoKIXO9+YslUuVy6bBuwgq3bGs4wYuWEVQkxGn/lvV1bTRaJEu
         UUXW1XtVZXApb8Y/mgniQTUIcUEfp7Qnrb5+OFzavyNfJSvX/1euXrPb+YJ9dGVX5Xa3
         c3ufE9OM87yEaxE7fH0T6XycU0w41SNiM/mrF3OzAJNamO5+cQ7YqQPLUedCB7O0VI8V
         rK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752234887; x=1752839687;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DFtn4/ZNNp1Bo82KZbs6Ml2JzOPxRd2Eu3X06xLlUB0=;
        b=RMDKuyT1d1IjOrkEXc2HbC9su7lbaNQwOCsFA6V8jC0x/oB6Z+TBS6RsuQ+mAGXP/A
         9eiS0PH5eMJvdkJg6iCdwhoJC+y9LJIfJsl/KRbLik5/isrce/dETsPjbgXHRuRBgOPr
         zE3uDckQuUsmsXt5lmmOckCQVJJB89DDTnzg+vF2bWXrrkb41pztKebynf4oa0O3OO2p
         d1/mqo6ZwsFEXOHU4oxhrV5wBcURNsXN6hpjYv9dYyOeZnRniPpb8px2J64IL5u+nlvj
         o7QIn629NR/Mbchc4sQFMndawOlZORSwDhRuTRGQq4MWgOzxUgHiEnugxQPg+9vtfClC
         7miw==
X-Forwarded-Encrypted: i=1; AJvYcCUlOX7rEJrcUGcFK/aZT7/13KWxqngDqnzGfUjlVysqRyMXktVZO5zd2vBaHx2JQnko5RQCFY341EgRUEfX@lists.linux.dev
X-Gm-Message-State: AOJu0YwlAtoZBM5XAPln/YQPLPqA2W2haifwXTJbv3Q9o5yIDej4Tm2O
	vbHE2EjuAlZJyEvGJe1EPCvfaiPo3CKR6QS5BvoHhtuJs0R0Xc9HscEy
X-Gm-Gg: ASbGncuz3PKpWSwyZZvYgN6NmaoiCXxehVc9H0QPP3aHGJRbQL+QPlMalUThRDNxUt4
	SPaMSW4J5JQ/Ntrc6B5axlXTrUQN8CFgdYduqslFSwm0i1dR1ocF5TPiXR/BuM0whZJxbzdcQ4A
	MUOboFMC056g4Y5S60duPWJ4TjuaPQZ8dOLJpvimrYLXqz+lHmSJs7ozoP9wjhbpji4PhgxSXQg
	lBy5fWfCvGapyd09h9gpeskRQV20DiiLDSyzSpahpp4hl05MMuUw8QUtKr8dtQQmlYS/YNRmiWr
	aOhOjgPyfsgbTZsf31+CzKPgF8coJ1TzwfHqoXgqqToL6rIlHczJiBuuOGYYaoQZPB4iSvDY6yh
	5evbj4Ewf9Qpsc2yTCg0mtkO9vgRLwYS/DH4q9BmoSuVBNlZ6ERWMALYRywSYFoSZ9p88EkMuHy
	aGrsSTyIaL2A==
X-Google-Smtp-Source: AGHT+IEk3wlzIO6RTnSOOWPjjVxW4BIHUDcW69FxA6Pav8/0J2N9+2Fr/Tpp38Fh6+83Gp6nU/1yvA==
X-Received: by 2002:a17:902:e951:b0:237:f757:9ad8 with SMTP id d9443c01a7336-23de2f3d787mr119083155ad.1.1752234886745;
        Fri, 11 Jul 2025 04:54:46 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de436e8e6sm46042135ad.255.2025.07.11.04.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 04:54:46 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Fri, 11 Jul 2025 19:54:38 +0800
Subject: [PATCH v9 3/3] staging: media: atomisp: fix indentation in bh
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-new_atomisp-v9-3-a9dd62425ef6@gmail.com>
References: <20250711-new_atomisp-v9-0-a9dd62425ef6@gmail.com>
In-Reply-To: <20250711-new_atomisp-v9-0-a9dd62425ef6@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752234878; l=2874;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=AqnW7/c9nG03ZAzoPbA3nRf1z9VOfMnwRCXHwCluQ3M=;
 b=N/M9KDmeKL/PVf0VtYy6+31rlg6csjPjfMikXL5zCjcyaiFAiiA7l+sqWvaClFLP88uYyNEc3
 0bAdZjbfLgBDtypt55CKlXMfYwUt4m0K6L2OD4+plyDYs+SDYYkQkxK
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=/x4391DbJ19fFQI7t33HWt3lsHfYPl2I2ax8C+Vxr+M=

This patch fixes tab/space indentation issues in bh
following kernel coding style guidelines.

No functional logic changes were made.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Link: https://lore.kernel.org/all/CAHp75Ve7y3pmZ5g8YXLNHyZgmZpiZNAuDdNfmhxYTOATrDBz5Q@mail.gmail.com/
Suggested-by: Hans de Goede <hansg@kernel.org>
Link: https://lore.kernel.org/all/e201c4b0-4fcc-4d98-9d76-0e9c41dc4d9f@kernel.org/
Signed-off-by: LiangCheng Wang<zaq14760@gmail.com>
---
 .../media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c | 14 +++++---------
 .../media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.h | 14 +++++---------
 2 files changed, 10 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c
index 69c87e53f3c22fade6c4c7914d1550f68dd8f5c2..b87eb1a21b216dc6132331d2a48d7cb56ddaea24 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c
@@ -12,10 +12,8 @@
 
 #include "ia_css_bh.host.h"
 
-void
-ia_css_bh_hmem_decode(
-    struct ia_css_3a_rgby_output *out_ptr,
-    const struct ia_css_bh_table *hmem_buf)
+void ia_css_bh_hmem_decode(struct ia_css_3a_rgby_output *out_ptr,
+			   const struct ia_css_bh_table *hmem_buf)
 {
 	int i;
 
@@ -37,11 +35,9 @@ ia_css_bh_hmem_decode(
 	}
 }
 
-void
-ia_css_bh_encode(
-    struct sh_css_isp_bh_params *to,
-    const struct ia_css_3a_config *from,
-    unsigned int size)
+void ia_css_bh_encode(struct sh_css_isp_bh_params *to,
+		      const struct ia_css_3a_config *from,
+		      unsigned int size)
 {
 	(void)size;
 	/* coefficients to calculate Y */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.h
index 36b360cfe62e65037522e0037cf51fca0fabdfba..964d658ceec31b0b22fc3bc6d19b40b07b2fc06c 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.h
@@ -10,15 +10,11 @@
 #include "ia_css_bh_param.h"
 #include "s3a/s3a_1.0/ia_css_s3a_types.h"
 
-void
-ia_css_bh_hmem_decode(
-    struct ia_css_3a_rgby_output *out_ptr,
-    const struct ia_css_bh_table *hmem_buf);
+void ia_css_bh_hmem_decode(struct ia_css_3a_rgby_output *out_ptr,
+			   const struct ia_css_bh_table *hmem_buf);
 
-void
-ia_css_bh_encode(
-    struct sh_css_isp_bh_params *to,
-    const struct ia_css_3a_config *from,
-    unsigned int size);
+void ia_css_bh_encode(struct sh_css_isp_bh_params *to,
+		      const struct ia_css_3a_config *from,
+		      unsigned int size);
 
 #endif /* __IA_CSS_BH_HOST_H */

-- 
2.43.0

