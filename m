Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6915D2980CD
	for <linux-staging@lists.linux.dev>; Fri, 11 Jul 2025 11:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752234888; cv=none; b=owhgVgunLgbNIzAMNZ8Aff7i+DzI1CvdcjHyAS29fjTyr1MW1b88FXklYX0eLjlXXc1qp+QNnqxztONzbHhfWwmIbygU3UJ9jq4Pq/oibHP5sL9CgnjLwHRLLVeTkyQUiFV+xCWxQn5vN/sDqCfQi+QX+uL470PIJ9TxoAJ7ATI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752234888; c=relaxed/simple;
	bh=AZX6kVF1g/cRe8XsgNWI9KMwm9xW3d2j4FgbxqLevNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZEekQnCCyT6W0PX0nxgqFSDR7F+G3cMe1UJx+TC2ibRg2qFEsNGU9qGM+lgge3a7oBHMxpcvMwYhwAnrHJvN6wHJTgxIFSIRbPEvHCOYrtd+prVMKm6Pd/XE6iNKJvs5Ss0f+JyJ+E7HBLDmiVRggI+cBdAf+pf/efGUvJXiEVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FnJp1fRP; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FnJp1fRP"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-235f9ea8d08so18822535ad.1
        for <linux-staging@lists.linux.dev>; Fri, 11 Jul 2025 04:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752234885; x=1752839685; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SJw5YhlCva5K9gfTlJfdEIZ6FPIj4yxrNOWwGxsH+uU=;
        b=FnJp1fRP+zp63ROIGVIZAf/4IL3Oo/IOQfNf/RFDZrbDCw4snjM9TMZ/EgW8ELapTh
         mptdE4Yp5mSZb+iXWnxWBv5fvrVMlHz5Kb9wKylrRpWqZXiH1ly52v7PauBGVOFz81AZ
         Qa6RU4pr9T8NhGSUMQ5B2XtP3F897ZHDYg5b9t1GXB2ngS7MgtDZNpNvNsQsgXYeWyRv
         zBFzsK8scbTC84nc6CTIrv3+D2YLJ4C+DpVTtAe8wvU/BqwAY+kPa8ev+bN59QoUVajk
         OEbsv6EgsGI1XC3QU5RjCqd8zcQooh7RPIK4Y54xLlKQUYzvGBh/nQ+DE9uxvf4ckU4b
         PwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752234885; x=1752839685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJw5YhlCva5K9gfTlJfdEIZ6FPIj4yxrNOWwGxsH+uU=;
        b=q5AMgAoEUNe8elv+jUKPVWFLyFPghhBxmuhRnKxwMLL0UxoIYjlCBhbAlfSSQRekrA
         JKfI7XT3wliW7iS4jPdtSmeZtUMRZdha6FDLOSx88fz4mLBRX/bEBeKIbDzUKBAo5k/d
         kJdSD85ldwedm0pLZf/v8jOAnVLT0vozzkDp8V0la9WbNq8Jqhh7hCw/qGZ7RHgmmqqk
         sNZRL5A6ElIOmF4EZNtNLU1ycldFEsCOGHbERTAk6juipbe6j6dTEbisIzSN9LzbZnoH
         z8+tElIrfvujHXyWBlEWpHLBEYXz9tAwPrxOj8KEGrjg7HTgOC5pvpIc9XO52XbFU1t/
         vpkA==
X-Forwarded-Encrypted: i=1; AJvYcCXduPz9KLPpzkIWTBoUbzztDCvdAhpyp2V+3c5YH/Jjy+sbK6gAVG925zQoOjgEZ+YmI3olo7LoEl3GqicN@lists.linux.dev
X-Gm-Message-State: AOJu0YwmKrHiSCiGIF9KsUlPBe6SC9UgxsTS6XBiIOHT2z0snLyndORc
	5iCivDYl6/UuNSnNCqyv09imNdzdXxThc3uwyCEAjhv7jIBoQe0Fylsd
X-Gm-Gg: ASbGncvsAX9DFadMlDHQo5p/rn9L7eBnEJJnYOw6Tn/6T+X/pIHHb7S928Ok3E0NzKt
	Q3s7ciQLa87qpS9LAyiwcGu2I/gnaTHVdIJMPgN4fUuYVHGU72EHcZgGDC1OS34S/djh0R1It1d
	Yhd0O2ht+GHissjts0avwc3aSxZUvRbpI4o9NDdjeG8A6CTX54g8sfI4it+7f53spHE9rGJVmK/
	d7RJ87s360GA81qQyjWQQILHkNku2vWFjwvhEfCDg4ezOADYLPDbHbh+qGmgLcZBbP2GvhRMm/A
	YYKmB/saJARo91tCGZsoUjohJb4dGDBm0QLXrn1fuuIA4wqRO0LRRbD4dBuJfjhGK7svLbHavgb
	d6EjOAy8SeWTUGgDaWafSsArK1VDj5VUp0xask0AChp4eZsY/lvK+Qt+1k5j7F13m5ebn4L3YxW
	Buvaw0rYqB7A==
X-Google-Smtp-Source: AGHT+IE/GNQHsDOkg4hebFNChU6e40ICf26SOfPwoJ/7Kba0PNQnjHtm2s4+itACNqTLwFmps56A0A==
X-Received: by 2002:a17:902:f603:b0:234:d292:be7f with SMTP id d9443c01a7336-23dede7d45dmr37114665ad.31.1752234884488;
        Fri, 11 Jul 2025 04:54:44 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de436e8e6sm46042135ad.255.2025.07.11.04.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 04:54:44 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Fri, 11 Jul 2025 19:54:37 +0800
Subject: [PATCH v9 2/3] staging: media: atomisp: fix indentation in anr
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-new_atomisp-v9-2-a9dd62425ef6@gmail.com>
References: <20250711-new_atomisp-v9-0-a9dd62425ef6@gmail.com>
In-Reply-To: <20250711-new_atomisp-v9-0-a9dd62425ef6@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752234878; l=5863;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=AZX6kVF1g/cRe8XsgNWI9KMwm9xW3d2j4FgbxqLevNU=;
 b=rmyCv0VDLYJVaFTd2HhQBMdEAJsgDwWu/HBjUPhHYGPHLPe7K+86ROdVrHA+qHw4fqcXV+g7K
 TnV6MawUe2QB5tk9Gp/598KkW4AXI+9aiyMnNXB30OaFt33XqQFL98c
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=/x4391DbJ19fFQI7t33HWt3lsHfYPl2I2ax8C+Vxr+M=

This patch fixes tab/space indentation issues in anr
following kernel coding style guidelines.

No functional logic changes were made.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Link: https://lore.kernel.org/all/CAHp75Vdd8aOhQ73opych5WohuM2CXq2dPgdgHW0ZdYHRU=u5WQ@mail.gmail.com/
Suggested-by: Hans de Goede <hansg@kernel.org>
Link: https://lore.kernel.org/all/e201c4b0-4fcc-4d98-9d76-0e9c41dc4d9f@kernel.org/
Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c  | 22 ++++++++--------------
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.h  | 20 +++++++-------------
 .../pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c   | 14 +++++---------
 .../pci/isp/kernels/anr/anr_2/ia_css_anr2.host.h   | 13 +++++--------
 4 files changed, 25 insertions(+), 44 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
index 899d566234b9d3a35401666dcf0c7b1b80fd5b31..ed582d38b27fbf6839a71a4037c310f320de3466 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
@@ -18,23 +18,19 @@ const struct ia_css_anr_config default_anr_config = {
 		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4,
 		0, 3, 1, 2, 3, 6, 4, 5, 1, 4, 2, 3, 2, 5, 3, 4
 	},
-	{10, 20, 30}
+	{ 10, 20, 30 },
 };
 
-void
-ia_css_anr_encode(
-    struct sh_css_isp_anr_params *to,
-    const struct ia_css_anr_config *from,
-    unsigned int size)
+void ia_css_anr_encode(struct sh_css_isp_anr_params *to,
+		       const struct ia_css_anr_config *from,
+		       unsigned int size)
 {
 	(void)size;
 	to->threshold = from->threshold;
 }
 
-void
-ia_css_anr_dump(
-    const struct sh_css_isp_anr_params *anr,
-    unsigned int level)
+void ia_css_anr_dump(const struct sh_css_isp_anr_params *anr,
+		     unsigned int level)
 {
 	if (!anr) return;
 	ia_css_debug_dtrace(level, "Advance Noise Reduction:\n");
@@ -42,10 +38,8 @@ ia_css_anr_dump(
 			    "anr_threshold", anr->threshold);
 }
 
-void
-ia_css_anr_debug_dtrace(
-    const struct ia_css_anr_config *config,
-    unsigned int level)
+void ia_css_anr_debug_dtrace(const struct ia_css_anr_config *config,
+			     unsigned int level)
 {
 	ia_css_debug_dtrace(level,
 			    "config.threshold=%d\n",
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.h
index 4f77900871c8b9d43bdc00308aa914eda3af7fa7..2f17d62b92087afd26aff2a49dadf4ee2fb7fcf5 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.h
@@ -12,20 +12,14 @@
 
 extern const struct ia_css_anr_config default_anr_config;
 
-void
-ia_css_anr_encode(
-    struct sh_css_isp_anr_params *to,
-    const struct ia_css_anr_config *from,
-    unsigned int size);
+void ia_css_anr_encode(struct sh_css_isp_anr_params *to,
+		       const struct ia_css_anr_config *from,
+		       unsigned int size);
 
-void
-ia_css_anr_dump(
-    const struct sh_css_isp_anr_params *anr,
-    unsigned int level);
+void ia_css_anr_dump(const struct sh_css_isp_anr_params *anr,
+		     unsigned int level);
 
-void
-ia_css_anr_debug_dtrace(
-    const struct ia_css_anr_config *config, unsigned int level)
-;
+void ia_css_anr_debug_dtrace(const struct ia_css_anr_config *config,
+			     unsigned int level);
 
 #endif /* __IA_CSS_ANR_HOST_H */
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c
index 09599884bdaefe32f891f437274b96110888a675..3c6d99139cda6f12eb6ef6fe8f996f7ff11551c2 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.c
@@ -10,11 +10,9 @@
 
 #include "ia_css_anr2.host.h"
 
-void
-ia_css_anr2_vmem_encode(
-    struct ia_css_isp_anr2_params *to,
-    const struct ia_css_anr_thres *from,
-    size_t size)
+void ia_css_anr2_vmem_encode(struct ia_css_isp_anr2_params *to,
+			     const struct ia_css_anr_thres *from,
+			     size_t size)
 {
 	unsigned int i;
 
@@ -28,10 +26,8 @@ ia_css_anr2_vmem_encode(
 	}
 }
 
-void
-ia_css_anr2_debug_dtrace(
-    const struct ia_css_anr_thres *config,
-    unsigned int level)
+void ia_css_anr2_debug_dtrace(const struct ia_css_anr_thres *config,
+			      unsigned int level)
 {
 	(void)config;
 	(void)level;
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.h b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.h
index 2b1105f21c1e2b37144083b6bb8f9dd465a2f43b..36fb6c25969991ffcdd4424a695dacc5b5c2a9db 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_2/ia_css_anr2.host.h
@@ -13,15 +13,12 @@
 #include "ia_css_anr2_param.h"
 #include "ia_css_anr2_table.host.h"
 
-void
-ia_css_anr2_vmem_encode(
-    struct ia_css_isp_anr2_params *to,
-    const struct ia_css_anr_thres *from,
-    size_t size);
+void ia_css_anr2_vmem_encode(struct ia_css_isp_anr2_params *to,
+			     const struct ia_css_anr_thres *from,
+			     size_t size);
 
-void
-ia_css_anr2_debug_dtrace(
-    const struct ia_css_anr_thres *config, unsigned int level)
+void ia_css_anr2_debug_dtrace(const struct ia_css_anr_thres *config,
+			      unsigned int level)
 ;
 
 #endif /* __IA_CSS_ANR2_HOST_H */

-- 
2.43.0

