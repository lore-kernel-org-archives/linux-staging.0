Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D11F352C35
	for <linux-staging@lists.linux.dev>; Wed, 22 Apr 2026 12:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776859808; cv=none; b=Vj6QxGY1TQnW8e3mu1fsSEt7aCqLdZ5gsInKXhTbASOXnYI50LywyxOylm332fkQZ3TjhfVy6xcwpLc76u0GhEnLptWFMi/Y/F72TZtSpny21B29WWQiHn+JFiIf6ZFVnh2GpkG5D0PCM6a7tzlQykFDVzEDbwevy7YEXkDPR6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776859808; c=relaxed/simple;
	bh=XUqVcOXAKzTqGA6Z2c1AFVR2aNm5CJbRFrh06LG1BcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pn2SFm7zeKmCq0xtZwNcqUXJtcha7D1/AYbEaur6QatRsCylBLZQyhBoryueimHJH013elvGCe4zb/bbUvmw/bgb+rRuEbpQ1CR3UMn74EHmwqZ4WFByi+/GsXOwrt4SGV47npwznjIE+Ef/2w3SCu8hgzXS0ERPZhngkKeJJGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OMeQ1TbY; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMeQ1TbY"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4836fc075d2so4232035e9.0
        for <linux-staging@lists.linux.dev>; Wed, 22 Apr 2026 05:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776859805; x=1777464605; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tam6RGKwM8v0Yrur3J/sa8/9SSQOMsdD8uAdRFq7HuU=;
        b=OMeQ1TbY+e/pRTwiusBHFTqWwrRO/ji7aPpXX1srNPX6wpsEELA3s1lHVsZ99M7ofn
         20BLBVb6n4CsIiDepDc6/9dKrJrts9UFyFrx79PfH74G+ebp1b9L1WdUzY0rHM8bltR3
         elYND2Btz9EL59RMr4vjEQY0/QV8dYvjxPIZdj4L8j74iR/lYL0KijbcvqDNHyzdqfDM
         quDQz9KlVeOcuRX/c+cCXj+Vb1q3vaRcgYwXdfM4d67D4E9jff86yxUT7LotCZfJedge
         JB0gZnBnCRhBZJbFOqY5Bk9+W9XbwMlA98vaaj6s7TyfhuP0ZIgpYtruPTGi082LmrC7
         Rqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776859805; x=1777464605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tam6RGKwM8v0Yrur3J/sa8/9SSQOMsdD8uAdRFq7HuU=;
        b=Ybk4Ejza98yIQyk0S6ccvl8eCppirYZ7KiIYvIt8Rx8JbSlVSc0C8HDQWbYpjwt3PS
         YC5IyZGimikF2EaMyU/5AKVzO1QLziAvUZG/GoAomlrqpds2iIgH8gfV5Cmlu/w/uATn
         lnXvh9WPv9uMx71xJFSiyDukmBbV9+Az4SSCgzDLn4Z6a4n62QcuRYz6zy2RNxSdceWv
         jtE04hvKIg2ImvITTqLLt3d1I+QuPzBXbOHOVWnBoBULQS33rKxuFax2U54sV4d/YbgO
         r1W+5FmYHIz+dFTolur/Ok00gHXadK1T8RCM+asSpSEDNg+bWGqoCJ+U01LyLDowfoVf
         Ct2Q==
X-Gm-Message-State: AOJu0YyFez65qGsuuwE3v+PtiVLxePGjsNGpq6mS15mmvT+mDQvazRlr
	/PNPCXYR4Vom0PCKwotx4ikjQAlHkHXiMcggkiQYEnLMe6+xK120lkdG
X-Gm-Gg: AeBDiet+yXO/sxl5uaI9qIL0UMD5rWLJaLOnTBuSVD5VBCQzMQ5enQUMv3YlNfxZBGB
	RS99lLJlGoMz3zHjlA5HzcR4Cgm+FJN2M6G5tKG983NTsyfRg4eBVSU8n2xWA5zq/mc7TFiFgch
	E5LRAZyIJJsgmtpAyxo4wWmOUvgIq1OQso5Xj+GfWTFiRXDWKLvNCKd6CiWyxPh0HdVBxxFshPH
	XGjgn5JxKGaMt9Mi/4dyzREAX3UmpXEU7N6D7QMXl5Ru1UspzKkSkOsqgDxhelFEYUCQ06E9TsM
	8KhiEhIsKSWsqaiPoRcCS8zuQUwA1Efygrb5+8uZ2O4WKicJrJK39QStlTJzdlvRJ5OySnYEZ35
	VPoRkdsGUBcqKk8UntbAG0gkuJxr+ZpatisdfejsnL146630ES7Y+His3cb7jaINDDp2QXgHumw
	4T/Bo7DPnSopjQN7VZmQCqdaiKGSvH8b0wf94UOYZfMVKJv8YMDrz1dI8i/JPXM9wpoSr4XkNMd
	udtuvQJMTaiFFoA1WRtF9jmHKzfMlfijw2rN3wOWBpE0y9qtouE4Ak8JEVqKoJ2k28CNxSyhQ==
X-Received: by 2002:a05:600c:4503:b0:489:1c1f:35e5 with SMTP id 5b1f17b1804b1-4891c1f3837mr102684375e9.6.1776859805202;
        Wed, 22 Apr 2026 05:10:05 -0700 (PDT)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ffad20f2sm200425825e9.0.2026.04.22.05.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 05:10:04 -0700 (PDT)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH] staging: media: atomisp: gc: Fix function declaration formatting 
Date: Wed, 22 Apr 2026 16:09:39 +0400
Message-ID: <20260422120938.77230-2-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move function return types to the same line as the function names and
replace leading spaces in parameter lists with tabs.

No functional change.

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 .../isp/kernels/gc/gc_1.0/ia_css_gc.host.c    | 48 +++++++------------
 1 file changed, 17 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c
index afef48ebd818..3e44f0a331f0 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/gc/gc_1.0/ia_css_gc.host.c
@@ -25,11 +25,9 @@ const struct ia_css_ce_config default_ce_config = {
 	255
 };
 
-void
-ia_css_gc_encode(
-    struct sh_css_isp_gc_params *to,
-    const struct ia_css_gc_config *from,
-    unsigned int size)
+void ia_css_gc_encode(struct sh_css_isp_gc_params *to,
+		      const struct ia_css_gc_config *from,
+		      unsigned int size)
 {
 	(void)size;
 	to->gain_k1 =
@@ -40,32 +38,26 @@ ia_css_gc_encode(
 			   IA_CSS_GAMMA_GAIN_K_SHIFT);
 }
 
-void
-ia_css_ce_encode(
-    struct sh_css_isp_ce_params *to,
-    const struct ia_css_ce_config *from,
-    unsigned int size)
+void ia_css_ce_encode(struct sh_css_isp_ce_params *to,
+		      const struct ia_css_ce_config *from,
+		      unsigned int size)
 {
 	(void)size;
 	to->uv_level_min = from->uv_level_min;
 	to->uv_level_max = from->uv_level_max;
 }
 
-void
-ia_css_gc_vamem_encode(
-    struct sh_css_isp_gc_vamem_params *to,
-    const struct ia_css_gamma_table *from,
-    unsigned int size)
+void ia_css_gc_vamem_encode(struct sh_css_isp_gc_vamem_params *to,
+			    const struct ia_css_gamma_table *from,
+			    unsigned int size)
 {
 	(void)size;
 	memcpy(&to->gc,  &from->data, sizeof(to->gc));
 }
 
 #ifndef IA_CSS_NO_DEBUG
-void
-ia_css_gc_dump(
-    const struct sh_css_isp_gc_params *gc,
-    unsigned int level)
+void ia_css_gc_dump(const struct sh_css_isp_gc_params *gc,
+		    unsigned int level)
 {
 	if (!gc) return;
 	ia_css_debug_dtrace(level, "Gamma Correction:\n");
@@ -75,10 +67,8 @@ ia_css_gc_dump(
 			    "gamma_gain_k2", gc->gain_k2);
 }
 
-void
-ia_css_ce_dump(
-    const struct sh_css_isp_ce_params *ce,
-    unsigned int level)
+void ia_css_ce_dump(const struct sh_css_isp_ce_params *ce,
+		    unsigned int level)
 {
 	ia_css_debug_dtrace(level, "Chroma Enhancement:\n");
 	ia_css_debug_dtrace(level, "\t%-32s = %d\n",
@@ -87,20 +77,16 @@ ia_css_ce_dump(
 			    "ce_uv_level_max", ce->uv_level_max);
 }
 
-void
-ia_css_gc_debug_dtrace(
-    const struct ia_css_gc_config *config,
-    unsigned int level)
+void ia_css_gc_debug_dtrace(const struct ia_css_gc_config *config,
+			    unsigned int level)
 {
 	ia_css_debug_dtrace(level,
 			    "config.gain_k1=%d, config.gain_k2=%d\n",
 			    config->gain_k1, config->gain_k2);
 }
 
-void
-ia_css_ce_debug_dtrace(
-    const struct ia_css_ce_config *config,
-    unsigned int level)
+void ia_css_ce_debug_dtrace(const struct ia_css_ce_config *config,
+			    unsigned int level)
 {
 	ia_css_debug_dtrace(level,
 			    "config.uv_level_min=%d, config.uv_level_max=%d\n",
-- 
2.52.0

