Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0347D3074BF
	for <linux-staging@lists.linux.dev>; Fri,  4 Jul 2025 15:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751643679; cv=none; b=KeNdI5uod3xpI6+OkgUjLLdKXxKifeCGHrePs16idq+eGRt+Fj1cIsMkM8W5fWoX5gJ8Rq4/b4vcW9WSsKLS0s6ty8J7ppMA1kNZSLvH+CA8H2VKoFQ0S0gz/SVnX0eudBI0I3OGgP12aWZ8hliGeamm4vFx+a+PS83duyo5vbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751643679; c=relaxed/simple;
	bh=3O23PovrqC+Eqola7rZwzAQ/Qycsqf0zMsQd7QF+gy4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SVrb++h0kuo/5JTkwe1Y8VVJlZhkkIujva9i6Rh9exkcr9tU2ZUmoJCjqjzJSCRzYrpvuFsxrRNE9XtNAOZs7JAYE5hxz3pvTqtvl3nRbW1yaW2qkYlh3jYuYPudBHcp3MXV/Ro2GUjRNpVby93k9QVt+WtWluLfDzsV1ktvxds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3okWlii; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3okWlii"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-23526264386so10600885ad.2
        for <linux-staging@lists.linux.dev>; Fri, 04 Jul 2025 08:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751643677; x=1752248477; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bwu9r1p26KTOzo+HYJ23OLsAkP90JLIljNiM101BJZc=;
        b=e3okWliiyUoVqb8RI911ENRv2SdR3IMTuB4FWfvzd1GyhPQpIbfhXjnminNA07AXYR
         EG3MPl3ZYgtkjbvniN1+SSUflNwxAup7tGEEshxbUMaSNAkXhBt9/k4oimX0h79Nuo8a
         jVBZeyOxsLrJfEq9lbfI47XLc5OKLwE7397RnFgImVn9hkT9lYIybJd68gXLrhmsAw1v
         g3NQlEnFmDZ27v/3x7h9aMkqdYb4iYVqYGMLhMhwavZ/hwVtx0fIJegTNkOmDPt4rnss
         Vrca0orRVcknGUPFKzJtlla/Zl1/QWUSUXJQpL3N0keUgrb3DRY1KnIsrmEyy1nBL8Lb
         vLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751643677; x=1752248477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bwu9r1p26KTOzo+HYJ23OLsAkP90JLIljNiM101BJZc=;
        b=L+VnT94cN4NJofhcgJLscgBw+Nbb6BnaVbd3YAUgouvzIGlttsgNpXpKBaE8mugO4F
         3DvGHgsF+Y2L6ZdRrcqyjw3Xyum8aHpL16HFzXqstZqMwvrYTgllIaie/YIsENYYsON0
         Wai3hXcPvM0S525xtiHgaocrMrQ/IhjIu/8nYvPc8hM8qKpPiodL70G38FPgz0peheu4
         WaqArvqapIm8ZGizzHDoUBNXfe/CXEjQDKASEkGJlz6aKePfdMkYKvopk51TPUaN7p9C
         sD/Qs9ssrhQljttQXsLPInH7xRqA9oQ4diNPeuY8VaJQc9jVVicsPACKLjDuCOlc2F7h
         wDGg==
X-Forwarded-Encrypted: i=1; AJvYcCXM0tA8rAEqz8OWYnFqKLKUD3tYyXEsx2DDIDKRaqYl5DmTF/elak6XePF+0wHLRgXmfJKz8jnYF1UN/F8M@lists.linux.dev
X-Gm-Message-State: AOJu0YwdFo0t9oSzZrvlmuyQiaPTD2yBkuVNojrHGKlJ0qsr6zNmm/R1
	lmmKh4FWNPpZMW8LQrvGMk7YBTepNO/1ixauJhuT1sXd45OFn1p42UTG4oucfDxE
X-Gm-Gg: ASbGncv2zem70pEX575fbK4RukYPm9fkx7exaTfmDV2lAaVqqA8jpGig0m1IC465s37
	YOc3xFWlW9Fv4KlHDzMjv48IKeq545tk7bWXOrB8CVnHAaGGgXnV73X1omiCyDzJN0mAwbyfpeI
	YO0u0TWhlKOwFnfpRb1OZVsl9WILLNidC7dx/gAd5hfUyH2XKLk4Ldxe1O7h8Y+bGnrqPLxFPL2
	p+TtZvLl0VIj+4ctpQ7uv+JNkY1YpFB35G8Sg2DWAfdkinbsXmxBd8pZ3Q6DGuF5mSlqPu18iAo
	d7G57/3Q3fBaBOHRDsqaZGRoXUJPDUAASyGZ8IR30HM7ttL4W+qDdjE9upx7JKq5RdfE+KUyYFi
	cBsD6y6BCMVBBTY5HpowzRI+GPcOf7CiF+JQkcQrHUNs4NLNfbA==
X-Google-Smtp-Source: AGHT+IHRLGL6bFK40PS5q8sdOtdC/6UZeqO1blXqQ9ve3eUIkRtlKPo2QyPqLuUTF53vj/rKWQe8rA==
X-Received: by 2002:a17:902:f611:b0:234:a139:1216 with SMTP id d9443c01a7336-23c875b0929mr45400045ad.44.1751643677091;
        Fri, 04 Jul 2025 08:41:17 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431a4b6sm21912375ad.29.2025.07.04.08.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:41:16 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Fri, 04 Jul 2025 23:40:54 +0800
Subject: [PATCH v8 3/3] staging: media: atomisp: fix indentation in bh
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-new_atomisp-v8-3-2a8560cbd9be@gmail.com>
References: <20250704-new_atomisp-v8-0-2a8560cbd9be@gmail.com>
In-Reply-To: <20250704-new_atomisp-v8-0-2a8560cbd9be@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751643666; l=4413;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=3O23PovrqC+Eqola7rZwzAQ/Qycsqf0zMsQd7QF+gy4=;
 b=jsooQGeH4Oti43sdbaM7xkpUZi/H5mJGJo1rmUlAOD+cqljrTCu2kpqrh1QIeyRUN2JYRgOSe
 Lt0OZfYBTPtDcX9kFVYBDJvkH7Q13HHfO6cWW7Ofxe5I+6IY67SeBD6
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=/x4391DbJ19fFQI7t33HWt3lsHfYPl2I2ax8C+Vxr+M=

This patch fixes tab/space indentation issues in bh
following kernel coding style guidelines.

No functional logic changes were made.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Link: https://lore.kernel.org/all/CAHp75VcPzq9XrFD29+uZ1rbFcDxb4UbXNkv_QZ=3iyVm3dxyPg@mail.gmail.com/
Suggested-by: Hans de Goede <hansg@kernel.org>
Link: https://lore.kernel.org/all/e201c4b0-4fcc-4d98-9d76-0e9c41dc4d9f@kernel.org/
Signed-off-by: LiangCheng Wang<zaq14760@gmail.com>
---
 .../atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c   | 18 ++++++++----------
 .../atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.h   | 12 +++++-------
 .../atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh_types.h  | 14 +++++++-------
 3 files changed, 20 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c
index 69c87e53f3c22fade6c4c7914d1550f68dd8f5c2..c120ecb178b2c60a3512725327779819d1888268 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.c
@@ -13,9 +13,8 @@
 #include "ia_css_bh.host.h"
 
 void
-ia_css_bh_hmem_decode(
-    struct ia_css_3a_rgby_output *out_ptr,
-    const struct ia_css_bh_table *hmem_buf)
+ia_css_bh_hmem_decode(struct ia_css_3a_rgby_output *out_ptr,
+		      const struct ia_css_bh_table *hmem_buf)
 {
 	int i;
 
@@ -38,18 +37,17 @@ ia_css_bh_hmem_decode(
 }
 
 void
-ia_css_bh_encode(
-    struct sh_css_isp_bh_params *to,
-    const struct ia_css_3a_config *from,
-    unsigned int size)
+ia_css_bh_encode(struct sh_css_isp_bh_params *to,
+		 const struct ia_css_3a_config *from,
+		 unsigned int size)
 {
 	(void)size;
 	/* coefficients to calculate Y */
 	to->y_coef_r =
-	    uDIGIT_FITTING(from->ae_y_coef_r, 16, SH_CSS_AE_YCOEF_SHIFT);
+		uDIGIT_FITTING(from->ae_y_coef_r, 16, SH_CSS_AE_YCOEF_SHIFT);
 	to->y_coef_g =
-	    uDIGIT_FITTING(from->ae_y_coef_g, 16, SH_CSS_AE_YCOEF_SHIFT);
+		uDIGIT_FITTING(from->ae_y_coef_g, 16, SH_CSS_AE_YCOEF_SHIFT);
 	to->y_coef_b =
-	    uDIGIT_FITTING(from->ae_y_coef_b, 16, SH_CSS_AE_YCOEF_SHIFT);
+		uDIGIT_FITTING(from->ae_y_coef_b, 16, SH_CSS_AE_YCOEF_SHIFT);
 }
 
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.h
index 36b360cfe62e65037522e0037cf51fca0fabdfba..9912dfea06074c6ecdbb1afb8de771b54b45aebf 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh.host.h
@@ -11,14 +11,12 @@
 #include "s3a/s3a_1.0/ia_css_s3a_types.h"
 
 void
-ia_css_bh_hmem_decode(
-    struct ia_css_3a_rgby_output *out_ptr,
-    const struct ia_css_bh_table *hmem_buf);
+ia_css_bh_hmem_decode(struct ia_css_3a_rgby_output *out_ptr,
+		      const struct ia_css_bh_table *hmem_buf);
 
 void
-ia_css_bh_encode(
-    struct sh_css_isp_bh_params *to,
-    const struct ia_css_3a_config *from,
-    unsigned int size);
+ia_css_bh_encode(struct sh_css_isp_bh_params *to,
+		 const struct ia_css_3a_config *from,
+		 unsigned int size);
 
 #endif /* __IA_CSS_BH_HOST_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh_types.h
index c717c636f666b984665f9d11c494843b55ee8c92..d62cb05d201dc8c9cabda03256f1d16103c5161a 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/bh/bh_2/ia_css_bh_types.h
@@ -10,14 +10,14 @@
 /* Number of elements in the BH table.
   * Should be consistent with hmem.h
   */
-#define IA_CSS_HMEM_BH_TABLE_SIZE	ISP_HIST_DEPTH
-#define IA_CSS_HMEM_BH_UNIT_SIZE	(ISP_HIST_DEPTH / ISP_HIST_COMPONENTS)
+#define IA_CSS_HMEM_BH_TABLE_SIZE ISP_HIST_DEPTH
+#define IA_CSS_HMEM_BH_UNIT_SIZE (ISP_HIST_DEPTH / ISP_HIST_COMPONENTS)
 
-#define BH_COLOR_R	(0)
-#define BH_COLOR_G	(1)
-#define BH_COLOR_B	(2)
-#define BH_COLOR_Y	(3)
-#define BH_COLOR_NUM	(4)
+#define BH_COLOR_R (0)
+#define BH_COLOR_G (1)
+#define BH_COLOR_B (2)
+#define BH_COLOR_Y (3)
+#define BH_COLOR_NUM (4)
 
 /* BH table */
 struct ia_css_bh_table {

-- 
2.43.0

