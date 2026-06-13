Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569003D5C0E
	for <linux-staging@lists.linux.dev>; Sat, 13 Jun 2026 11:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781348848; cv=none; b=HM/N1WNWWKDM+VEpwj2oJ9qUbePwcKUzo7WygJqYJJcgt4F5JO4n2Y0A253FLsFFboi99RHwSbTO7xzp51Izp5sVQxX62uJmnAsVmhJoVIut8RPlfi/ChwPgBv+PERsvOLO9MiwED+mR/SK6FEXh58UYE3DyUatZVneWoOw8X4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781348848; c=relaxed/simple;
	bh=+heRHkIURyFGLZHxjcrleQQ+x4Unx3SMBRMaUHSTHFc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sr7n3OJQvhQKk4lPl0cOk15JoebyffgX69f7O3iiA4ZGERzbf4JxcCTtxJ5StNpIHmKexrd3LjYFW0L6UP9EG4vjNIuGVN+ALhlPNKgTN1qSjY207JWPuaq2TyWnOZgLGDhtJskgb+il8OxKRAOnN9Ll3Eln0Mw1xIFax3A4dIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Sr4AgNSl; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Sr4AgNSl"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gctrT0lyHz9tWv;
	Sat, 13 Jun 2026 13:07:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781348841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=t4WHk1J2apBTKP9jPyHQHuDRKBQZmA7+m1fUz8RYlXc=;
	b=Sr4AgNSlUdeCoGGyYU+9BcP0UqhAqfVvnU7ACt9KeX87iI2lo2lmBVg1uzPvwHEY7j9RSG
	ENMvU8whPFdbZDSBOIAYXzcWTlCgKYUs3v3Av/NOU5L76P5V3hP1Ur6AVMk3Lgmk0pGRkl
	4TjgysbHcO4kuVuZc9RdOxD9bpHQwgVPkX75lj/L0SMN59v42FZ/Jd0PKJ3msxCzUlmo7e
	f9OrXc7jMToER+MjydP+HDs+P8Rs6rcFdCULPTghaIIpv0r0wJBRoaHZeVh5j2+DE3lzjh
	Z70MvbItHM2zl1/jUo2xr0gvSKasOCBgy2mAyhiOG3W9y8ocJTxUS/nYN2gA5A==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [PATCH v2] media: atomisp: replace kmalloc() with kmalloc_array() in sh_css.c
Date: Sat, 13 Jun 2026 14:07:12 +0300
Message-ID: <20260613110712.71436-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 5wp4ybkzt43mzxqj4xdmkqtzmwfs5zgb
X-MBO-RS-ID: a7812fbf3f9028165d3

Replace arithmetic in the kmalloc() function with the kmalloc_array()
function, as this calculation method is unsafe.

Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
---
v2:
 - use 'sizeof(*ptr)' instead of explicit type

 drivers/staging/media/atomisp/pci/sh_css.c | 38 ++++++++--------------
 1 file changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 6cda5925fa45..37ab569664c2 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -5819,36 +5819,29 @@ static int ia_css_pipe_create_cas_scaler_desc_single_output(
 		i *= max_scale_factor_per_stage;
 	}
 
-	descr->in_info = kmalloc(descr->num_stage *
-				 sizeof(struct ia_css_frame_info),
-				 GFP_KERNEL);
+	descr->in_info = kmalloc_array(descr->num_stage, sizeof(*descr->in_info), GFP_KERNEL);
 	if (!descr->in_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->internal_out_info = kmalloc(descr->num_stage *
-					   sizeof(struct ia_css_frame_info),
-					   GFP_KERNEL);
+	descr->internal_out_info = kmalloc_array(descr->num_stage,
+						 sizeof(*descr->internal_out_info), GFP_KERNEL);
 	if (!descr->internal_out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->out_info = kmalloc(descr->num_stage *
-				  sizeof(struct ia_css_frame_info),
-				  GFP_KERNEL);
+	descr->out_info = kmalloc_array(descr->num_stage, sizeof(*descr->out_info), GFP_KERNEL);
 	if (!descr->out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->vf_info = kmalloc(descr->num_stage *
-				 sizeof(struct ia_css_frame_info),
-				 GFP_KERNEL);
+	descr->vf_info = kmalloc_array(descr->num_stage, sizeof(*descr->vf_info), GFP_KERNEL);
 	if (!descr->vf_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->is_output_stage = kmalloc(descr->num_stage * sizeof(bool),
-					 GFP_KERNEL);
+	descr->is_output_stage = kmalloc_array(descr->num_stage, sizeof(*descr->is_output_stage),
+					       GFP_KERNEL);
 	if (!descr->is_output_stage) {
 		err = -ENOMEM;
 		goto ERR;
@@ -5974,29 +5967,24 @@ ia_css_pipe_create_cas_scaler_desc(struct ia_css_pipe *pipe,
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->internal_out_info = kmalloc(descr->num_stage *
-					   sizeof(struct ia_css_frame_info),
-					   GFP_KERNEL);
+	descr->internal_out_info = kmalloc_array(descr->num_stage,
+						 sizeof(*descr->internal_out_info), GFP_KERNEL);
 	if (!descr->internal_out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->out_info = kmalloc(descr->num_stage *
-				  sizeof(struct ia_css_frame_info),
-				  GFP_KERNEL);
+	descr->out_info = kmalloc_array(descr->num_stage, sizeof(*descr->out_info), GFP_KERNEL);
 	if (!descr->out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->vf_info = kmalloc(descr->num_stage *
-				 sizeof(struct ia_css_frame_info),
-				 GFP_KERNEL);
+	descr->vf_info = kmalloc_array(descr->num_stage, sizeof(*descr->vf_info), GFP_KERNEL);
 	if (!descr->vf_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->is_output_stage = kmalloc(descr->num_stage * sizeof(bool),
-					 GFP_KERNEL);
+	descr->is_output_stage = kmalloc_array(descr->num_stage, sizeof(*descr->is_output_stage),
+					       GFP_KERNEL);
 	if (!descr->is_output_stage) {
 		err = -ENOMEM;
 		goto ERR;
