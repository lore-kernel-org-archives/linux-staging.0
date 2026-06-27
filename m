Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B6B1ACED5
	for <linux-staging@lists.linux.dev>; Sat, 27 Jun 2026 06:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782540432; cv=none; b=K9U7m4sjjjxfNoBuss8e/Uw0hAAUiJIpGyx0aypXd/U8ekQzGVqZxzXuCxg062VEZzvxTH1qLDFRMYVLoemc3QFuCDCJv24vMcWVtqsN2hrXmtuZfmyF3vapnMFoltEtEd4vdiM3q6d499+mbVS6VabBvJ6/JclAda3Rv7hI8Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782540432; c=relaxed/simple;
	bh=4LREPqg2WfTyqdb1L+xhLnGFM+/vi5VZ+yfBkau9XsA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TR7vvlc7KaBy2ziT+nRa/VnDUwsckX3y4m0LYcwVg5cQCDK6EfeAlnYAAUn5G/9XSvVKQNyY9mpjhHHn6Hpcm1ipLzdQ9YwiihxBKwYWFTaD1o2PEF3fRbzO4Bo8EL5TRUIbNnyNMzDoBQS663O3UTj9y9Q8v4D3M2tjix4rsuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=Ad23KUMs; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="Ad23KUMs"
Received: from DESKTOP-SUEFNF9.taila7e912.ts.net (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 43fb57346;
	Sat, 27 Jun 2026 14:01:51 +0800 (GMT+08:00)
From: Dawei Feng <dawei.feng@seu.edu.cn>
To: hansg@kernel.org
Cc: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	azpijr@gmail.com,
	error27@gmail.com,
	kees@kernel.org,
	arnd@arndb.de,
	pontescpedro@gmail.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	jianhao.xu@seu.edu.cn,
	zilin@seu.edu.cn,
	Dawei Feng <dawei.feng@seu.edu.cn>
Subject: [PATCH] media: atomisp: fix CAS scaler descriptor leaks
Date: Sat, 27 Jun 2026 14:01:51 +0800
Message-Id: <20260627060151.2543613-1-dawei.feng@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9f07ab8f6303a2kunm41fcde97ebed4
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGBodVhlNTBkfHUsfTRhCHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktISk
	9ITFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=Ad23KUMs7gHGe1npr+wDHSUhSJIxq1qB2DB0Tzy3/8tLPknoJr9mFHxhrdaiuFooDD5QjgpM7oHYMeEiUPKilSekDVsUcEApZYA7VDEsbpIplvp1nREFmCMtC/etOuxIzKNy0YawR8l+dDDLLKmpcM99sM8Rbef/v8awfFxjeB8=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=aiY8q6Mky3ednHnggxN7XrcwHP5//qKfIBb41Y+ZrCM=;
	h=date:mime-version:subject:message-id:from;

load_video_binaries() and load_primary_binaries() create a CAS scaler
descriptor before allocating and looking up the YUV scaler binaries.
Several failure paths after descriptor creation return without destroying
the descriptor, leaking the frame-info arrays owned by it.

Route those exits through a descriptor cleanup label while keeping the
existing pipe_settings ownership model. Also clear num_yuv_scaler when
capture scaler binary allocation fails, so the existing failure unwind does
not iterate a NULL scaler array.

The bug was first flagged by an experimental analysis tool we are
developing for kernel memory-management bugs while analyzing
v6.13-rc1. The tool is still under development and is not yet publicly
available. Manual inspection confirms that the bug is still
present in v7.1.1.

An x86_64 allyesconfig build showed no new warnings. As we do not have
an Intel Atom ISP camera platform with matching sensor firmware and ACPI
camera graph to test with, no runtime testing was able to be performed.

Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 35 ++++++++++++----------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 00082276f1db..d0ff16ba890f 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -4528,20 +4528,20 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 			  NULL,
 			  &cas_scaler_descr);
 		if (err)
-			return err;
+			goto destroy_cas_scaler_desc;
 		mycs->num_yuv_scaler = cas_scaler_descr.num_stage;
 		mycs->yuv_scaler_binary = kzalloc_objs(struct ia_css_binary,
 						       cas_scaler_descr.num_stage);
 		if (!mycs->yuv_scaler_binary) {
 			mycs->num_yuv_scaler = 0;
 			err = -ENOMEM;
-			return err;
+			goto destroy_cas_scaler_desc;
 		}
 		mycs->is_output_stage = kzalloc_objs(bool,
 						     cas_scaler_descr.num_stage);
 		if (!mycs->is_output_stage) {
 			err = -ENOMEM;
-			return err;
+			goto destroy_cas_scaler_desc;
 		}
 		for (i = 0; i < cas_scaler_descr.num_stage; i++) {
 			struct ia_css_binary_descr yuv_scaler_descr;
@@ -4557,10 +4557,13 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 			if (err) {
 				kfree(mycs->is_output_stage);
 				mycs->is_output_stage = NULL;
-				return err;
+				goto destroy_cas_scaler_desc;
 			}
 		}
+destroy_cas_scaler_desc:
 		ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
+		if (err)
+			return err;
 	}
 
 	{
@@ -5103,24 +5106,21 @@ static int load_primary_binaries(
 			  pipe_out_info,
 			  NULL,
 			  &cas_scaler_descr);
-		if (err) {
-			IA_CSS_LEAVE_ERR_PRIVATE(err);
-			return err;
-		}
+		if (err)
+			goto destroy_cas_scaler_desc;
 		mycs->num_yuv_scaler = cas_scaler_descr.num_stage;
 		mycs->yuv_scaler_binary = kzalloc_objs(struct ia_css_binary,
 						       cas_scaler_descr.num_stage);
 		if (!mycs->yuv_scaler_binary) {
+			mycs->num_yuv_scaler = 0;
 			err = -ENOMEM;
-			IA_CSS_LEAVE_ERR_PRIVATE(err);
-			return err;
+			goto destroy_cas_scaler_desc;
 		}
 		mycs->is_output_stage = kzalloc_objs(bool,
 						     cas_scaler_descr.num_stage);
 		if (!mycs->is_output_stage) {
 			err = -ENOMEM;
-			IA_CSS_LEAVE_ERR_PRIVATE(err);
-			return err;
+			goto destroy_cas_scaler_desc;
 		}
 		for (i = 0; i < cas_scaler_descr.num_stage; i++) {
 			struct ia_css_binary_descr yuv_scaler_descr;
@@ -5133,12 +5133,15 @@ static int load_primary_binaries(
 							     &cas_scaler_descr.vf_info[i]);
 			err = ia_css_binary_find(&yuv_scaler_descr,
 						 &mycs->yuv_scaler_binary[i]);
-			if (err) {
-				IA_CSS_LEAVE_ERR_PRIVATE(err);
-				return err;
-			}
+			if (err)
+				goto destroy_cas_scaler_desc;
 		}
+destroy_cas_scaler_desc:
 		ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
+		if (err) {
+			IA_CSS_LEAVE_ERR_PRIVATE(err);
+			return err;
+		}
 
 	} else {
 		capt_pp_out_info = pipe->output_info[0];
-- 
2.34.1

