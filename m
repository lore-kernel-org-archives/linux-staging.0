Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D153321C1
	for <linux-staging@lists.linux.dev>; Wed, 20 May 2026 16:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779293269; cv=none; b=AYs/OIY3Rd2DKe3HnJrqDigq6UbOSGal2WIP3oW+5whf4/4gxXF6jeXGpNFxwlB673t/Qx44x4j4uZFF9chN1JdWGyjITggVy0W6Dk05Sjzhey4DHo+lHu8AcLzmIQTOgp4CO9dO326CxS0ZQqIVYMTmjAqtk9tcPHmgPE0Cgn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779293269; c=relaxed/simple;
	bh=FpVG9d2ym8nJWl9IUCSYSDsbzoV2woopoNJTOkHsQoI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HIgQ/uht78LRayhg7sKuBNtxq2AShNrKjxFrqJfA0D4lvMcEQK0MDSWM5BkS0NmSAZy8Myuz20mzNnnM6UkuRNOHJ/BUQd9tWRm7vpJ3l1w2vQZqGTdSG4SmFCkcUvZtFQYiACf3Ncg09JPTpyXU4Dq38qIeZT7x/sAm0cxDphg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ssuwbyfU; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ssuwbyfU"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gLGf86K6bz9vBF;
	Wed, 20 May 2026 18:07:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779293264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dCONIFfCZnASIMqpLbnNoalIShtt0LPSuyZvMDS6iYk=;
	b=ssuwbyfUQTBPJWAioyv7H9l9p+9t56ZEtHzI2UN/zkomB0hL7dCq4Tfl3g1sVR7IIFl2vz
	ywmvZfxL8Q+5vxC5L21UUMxf0s1L/0nTtAFUW8CLVzYhXTa39Vo7B9U38jEBbvD9CQAbDi
	lT/zQfDw7sU33JUHaBvht7+Vg4rBjy0xdAbqpAE8HYGxG24wuCecQ8wEOSnQPv+6eJFp41
	K9LHuV2wdixEkNbd/QcN99f7WyDJ0nydZXj1H9RdYukKq4hK4/o6JVl70NmNwuoGbibLoW
	GtYW/x5xOSLTXL7oKhFVBaJa0sRhKpIYRYeiq/neySGMKEgdH0kw0eCRVUfMwQ==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [PATCH] media: atomisp: replace kmalloc() with kmalloc_array() in sh_css.c
Date: Wed, 20 May 2026 19:07:40 +0300
Message-ID: <20260520160740.33555-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: wdqz5w7ufyz99mdsqs7aysd1aee96sis
X-MBO-RS-ID: 5cb01f46d6b4fc6c496

Replace arithmetic in the kmalloc() function with the kmalloc_array()
function, as this calculation method is unsafe.

Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 41 +++++++++-------------
 1 file changed, 16 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 6cda5925fa45..a325a7994068 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -5819,36 +5819,31 @@ static int ia_css_pipe_create_cas_scaler_desc_single_output(
 		i *= max_scale_factor_per_stage;
 	}
 
-	descr->in_info = kmalloc(descr->num_stage *
-				 sizeof(struct ia_css_frame_info),
-				 GFP_KERNEL);
+	descr->in_info = kmalloc_array(descr->num_stage, sizeof(struct ia_css_frame_info),
+				       GFP_KERNEL);
 	if (!descr->in_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->internal_out_info = kmalloc(descr->num_stage *
-					   sizeof(struct ia_css_frame_info),
-					   GFP_KERNEL);
+	descr->internal_out_info = kmalloc_array(descr->num_stage, sizeof(struct ia_css_frame_info),
+						 GFP_KERNEL);
 	if (!descr->internal_out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->out_info = kmalloc(descr->num_stage *
-				  sizeof(struct ia_css_frame_info),
-				  GFP_KERNEL);
+	descr->out_info = kmalloc_array(descr->num_stage, sizeof(struct ia_css_frame_info),
+					GFP_KERNEL);
 	if (!descr->out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->vf_info = kmalloc(descr->num_stage *
-				 sizeof(struct ia_css_frame_info),
-				 GFP_KERNEL);
+	descr->vf_info = kmalloc_array(descr->num_stage, sizeof(struct ia_css_frame_info),
+				       GFP_KERNEL);
 	if (!descr->vf_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->is_output_stage = kmalloc(descr->num_stage * sizeof(bool),
-					 GFP_KERNEL);
+	descr->is_output_stage = kmalloc_array(descr->num_stage, sizeof(bool), GFP_KERNEL);
 	if (!descr->is_output_stage) {
 		err = -ENOMEM;
 		goto ERR;
@@ -5974,29 +5969,25 @@ ia_css_pipe_create_cas_scaler_desc(struct ia_css_pipe *pipe,
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->internal_out_info = kmalloc(descr->num_stage *
-					   sizeof(struct ia_css_frame_info),
-					   GFP_KERNEL);
+	descr->internal_out_info = kmalloc_array(descr->num_stage, sizeof(struct ia_css_frame_info),
+						 GFP_KERNEL);
 	if (!descr->internal_out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->out_info = kmalloc(descr->num_stage *
-				  sizeof(struct ia_css_frame_info),
-				  GFP_KERNEL);
+	descr->out_info = kmalloc_array(descr->num_stage, sizeof(struct ia_css_frame_info),
+					GFP_KERNEL);
 	if (!descr->out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->vf_info = kmalloc(descr->num_stage *
-				 sizeof(struct ia_css_frame_info),
-				 GFP_KERNEL);
+	descr->vf_info = kmalloc_array(descr->num_stage, sizeof(struct ia_css_frame_info),
+				       GFP_KERNEL);
 	if (!descr->vf_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->is_output_stage = kmalloc(descr->num_stage * sizeof(bool),
-					 GFP_KERNEL);
+	descr->is_output_stage = kmalloc_array(descr->num_stage, sizeof(bool), GFP_KERNEL);
 	if (!descr->is_output_stage) {
 		err = -ENOMEM;
 		goto ERR;
-- 
2.47.3

