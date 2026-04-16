Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375193A9D8C
	for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 13:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776347189; cv=none; b=HwHUa4R9BKJyXnA2cChbVbetCo6lUWoo9Vum7FSYHytLttG7rUs0g9htycwxbTloGKTQ2jpwWm7I/tOyn8KeE0F/o7/fPf2uZkzGnjQhxBS+4qAAD2JroHBFHohulOgw44ZF/aULwa+DS+WljWzmZjAzKMkKc9Fnzpww49nbHnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776347189; c=relaxed/simple;
	bh=3EAwYE7+t5LBGy+Qw2ONJz+RCqEsQCzzTpMO2mrhpIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kcfudyZ8quJypi2pnLxhwdQBPwYyXnLQCOt63Yvz/RhprHyRR6e0TWA8qitTq+bSes2AgeAXrmYkM6DA6QHD+ckixLKqfrtCHlqWz2ya5sYEuft9mgqDLwH+e9tvQxX2o5GPpDE2uD0XnyvyLZRg1EmDrdzh0dUkBQ1yJ9hV5fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o9jZs4nZ; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o9jZs4nZ"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2d8fa0fadfeso329688eec.1
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 06:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776347186; x=1776951986; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=So59SyK+EyB2Z67BGgN+VJWPDFL7GSSTqAp2bhFGkV4=;
        b=o9jZs4nZDQxC+YNcxHDRcBUp/Ht2IKhBVZ2NxbmIF2QZiTse/h2o/qjK48j85goRjU
         Ty2wdD2NPzprFiY1xARzFaN5rZRLg2b+EeQx57wU2DNV4vz3xw0p8fm9A4VKMoUu4vk3
         4HujVfkUApkUDI66FMg3xvqI8a7AxF07g5Hr7Q/YSdNUL3vsoVV8qrb1/HzXoKPS/lAZ
         XpMW7mS0vDS1w+zpZ/JBTmOD/H+MHNPofwc5DfFyALXGXgVAZQOKptfsuH6f+7FJvOvx
         pEQCPQSzpLo+BY1pz1QSEnPRrl/2N6bvCmru0QGeloZPgqrqrfTJlwdCHClIFOcwrE/4
         zlrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776347186; x=1776951986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=So59SyK+EyB2Z67BGgN+VJWPDFL7GSSTqAp2bhFGkV4=;
        b=NgGUCY1ybCgB6kguLF94rS/v4UUaDa5KlCEYIGVSUTrd0BexV1v1EPh0TmHaTmcZTo
         +MK/n6eq25ipEX/qXQTdHcdTtw6ra/6cc8aK3rLhG+3a4KZZmCfwRIYGjlREmWPqDlNc
         BngvhdRI66ALS6fFvY0Tb5oUAhx3lGGxYaN3hgkg3dxxsKaoZO7yajLMfXABfQuZHVF5
         ZeftyQewQn2YCT9z2fpRA5KaaHM8anIB0WoufKIvAsUNXYWMxDihXN8v8appxs72R0Mf
         urtS/4GS1CgrnSWmbwSJZzLfPBt1JSVnZ6cqmJaiWvqUvmUS4VUBKVTnHF98zl4ckakN
         MBgg==
X-Forwarded-Encrypted: i=1; AFNElJ/FV2luQCp+ZsDaad+PR4iIFq1ltA5EknZ7zCwy4uFb6MEzzb03nO8I+FAgZ5wt8tphgssECgyg6mAxsNep@lists.linux.dev
X-Gm-Message-State: AOJu0YwvLFEpo3vD62/a3otuhj0AP0X1YcQFBhyhPmRmND92Hynm7qkx
	gPEIlpjALhEdFCda2aum4Wqhh9LzjMSlltbhgHDTapDFDYjZRqxWxJQ0
X-Gm-Gg: AeBDiesV4vEV4IK0kzoU13ruRFLs5Di+iBcWSR9knKqrSz8z/u/Babjm14GTPwpfGeT
	XLdp2iFQ1ZIQbsczaTHSLQmFlctXlNIQb816AgXuS2O03Lhbdr4fywkajvK5h21bRk0ykH+PQfD
	3Qo5Ui8sLXDYOubedjXZqFs03tFcGqx/9wL31u/R/rIxCW2mYagslTGoiEkVGA8tvteOnYzc0VM
	ZG+VPh1aQCU7UpcoKQL9jS8wiMFgOKNui9zeE37FfaFqkauHAHKI7L4EGsAgoaBbXcCY3IF6Tmw
	z5s/WnFgpCValMqQpytJzKgfLggx1x1Sp833pPTtAiC3u5fw2SkuB5Qw/EFCEO48jVIFzKcgu5O
	cvXptQlcXqqCMHCOpmtpsUuK+5OKMYIxnvnwWKb7cUABWPfzHKg03L7OkCivuirVncERZzjGhn6
	IhMfdPvdqk0sG8yDHQNJ5QBUkjl8fF8tkF7BPACw==
X-Received: by 2002:a05:7300:ac81:b0:2c6:67b6:3acc with SMTP id 5a478bee46e88-2df7f4671e7mr1831946eec.15.1776347186136;
        Thu, 16 Apr 2026 06:46:26 -0700 (PDT)
Received: from pedro-oxean-machine ([2804:214:400b:a09:b5a8:d8b1:e224:db26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8f965c5fsm7256740eec.26.2026.04.16.06.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 06:46:25 -0700 (PDT)
From: Pedro Pontes <pontescpedro@gmail.com>
To: hansg@kernel.org,
	gregkh@linuxfoundation.org,
	mchehab@kernel.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	kees@kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pedro Pontes <pontescpedro@gmail.com>
Subject: [PATCH] media: atomisp: use kmalloc_objs for array allocations
Date: Thu, 16 Apr 2026 10:42:15 -0300
Message-ID: <20260416134214.130665-2-pontescpedro@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert manual kmalloc() multiplications to the modern kmalloc_objs()
interface to improve type safety and prevent potential integer
overflows.

Signed-off-by: Pedro Pontes <pontescpedro@gmail.com>
---
This patch is a refresh and modernization of the following work by
Qianfeng Rong from August 2025:
Link: https://lore.kernel.org/all/20250821081746.528018-1-rongqianfeng@vivo.com/

The original version used manual multiplications; I have updated it
to use the newer kmalloc_objs() macro and enforced pointer-based
type inference (e.g., *descr->in_info) as is now the preferred
standard for these cleanups.

The patch has been verified with a W=1 build for pci/sh_css.o. Since I
don't own the hardware.

Please note that, since I'm a new contributor, I wasn't quite sure in
how to proceed in this scenario of "redoing" an older contribution.
I've credited the original author with the "Originally-authored-by"
tag. Please let me know if I should have done something differently.

 drivers/staging/media/atomisp/pci/sh_css.c | 57 ++++++++++++----------
 1 file changed, 30 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 6cda5925fa45..26b7ea560c02 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -5819,36 +5819,37 @@ static int ia_css_pipe_create_cas_scaler_desc_single_output(
 		i *= max_scale_factor_per_stage;
 	}

-	descr->in_info = kmalloc(descr->num_stage *
-				 sizeof(struct ia_css_frame_info),
-				 GFP_KERNEL);
+	descr->in_info = kmalloc_objs(*descr->in_info,
+				      descr->num_stage,
+				      GFP_KERNEL);
 	if (!descr->in_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->internal_out_info = kmalloc(descr->num_stage *
-					   sizeof(struct ia_css_frame_info),
-					   GFP_KERNEL);
+	descr->internal_out_info = kmalloc_objs(*descr->internal_out_info,
+						descr->num_stage,
+						GFP_KERNEL);
 	if (!descr->internal_out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->out_info = kmalloc(descr->num_stage *
-				  sizeof(struct ia_css_frame_info),
-				  GFP_KERNEL);
+	descr->out_info = kmalloc_objs(*descr->out_info,
+				       descr->num_stage,
+				       GFP_KERNEL);
 	if (!descr->out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->vf_info = kmalloc(descr->num_stage *
-				 sizeof(struct ia_css_frame_info),
-				 GFP_KERNEL);
+	descr->vf_info = kmalloc_objs(*descr->vf_info,
+				      descr->num_stage,
+				      GFP_KERNEL);
 	if (!descr->vf_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->is_output_stage = kmalloc(descr->num_stage * sizeof(bool),
-					 GFP_KERNEL);
+	descr->is_output_stage = kmalloc_objs(*descr->is_output_stage,
+					      descr->num_stage,
+					      GFP_KERNEL);
 	if (!descr->is_output_stage) {
 		err = -ENOMEM;
 		goto ERR;
@@ -5968,35 +5969,37 @@ ia_css_pipe_create_cas_scaler_desc(struct ia_css_pipe *pipe,

 	descr->num_stage = num_stages;

-	descr->in_info = kmalloc_objs(struct ia_css_frame_info,
-				      descr->num_stage);
+	descr->in_info = kmalloc_objs(*descr->in_info,
+				      descr->num_stage,
+				      GFP_KERNEL);
 	if (!descr->in_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->internal_out_info = kmalloc(descr->num_stage *
-					   sizeof(struct ia_css_frame_info),
-					   GFP_KERNEL);
+	descr->internal_out_info = kmalloc_objs(*descr->internal_out_info,
+						descr->num_stage,
+						GFP_KERNEL);
 	if (!descr->internal_out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->out_info = kmalloc(descr->num_stage *
-				  sizeof(struct ia_css_frame_info),
-				  GFP_KERNEL);
+	descr->out_info = kmalloc_objs(*descr->out_info,
+				       descr->num_stage,
+				       GFP_KERNEL);
 	if (!descr->out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->vf_info = kmalloc(descr->num_stage *
-				 sizeof(struct ia_css_frame_info),
-				 GFP_KERNEL);
+	descr->vf_info = kmalloc_objs(*descr->vf_info,
+				      descr->num_stage,
+				      GFP_KERNEL);
 	if (!descr->vf_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->is_output_stage = kmalloc(descr->num_stage * sizeof(bool),
-					 GFP_KERNEL);
+	descr->is_output_stage = kmalloc_objs(*descr->is_output_stage,
+					      descr->num_stage,
+					      GFP_KERNEL);
 	if (!descr->is_output_stage) {
 		err = -ENOMEM;
 		goto ERR;
--
2.53.0
