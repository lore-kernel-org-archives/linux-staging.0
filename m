Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED1E2C237C
	for <linux-staging@lists.linux.dev>; Tue,  7 Jul 2026 08:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783411589; cv=none; b=C8EHXEAc0/g+mTtFFqSZUJwX4HJwN8XEncQPnDvr31pNgF86y+VxhHnb14t6wvkKfBofr2SSFmzZAVW6pc22zco/fR9ns/DXnutp+cG9KtMS2NOJTyr+7PNsQ7qVCQDYZhNQPHRGipn/3b7NoLYtP9F6APylBYrFr/YtNTDvW+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783411589; c=relaxed/simple;
	bh=jJ7ty7jq4rNWfZ6cw92JQ71UqFobN1PDQyluvXEEPxc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BBM8F4/oaD6wapUbmm0WBMaEi5nR7Yz5o2+18GM7JBxx+5KI4MMIZDt1ZfUanO5aFBLNfEeR/j+ieJf/3yE6Py92ILcxcxh7jHh9pxsMhV/d+kXST1fvOepmF3G09Q2MZ96QXrgttjBxs6cl+J3frHLZAVr5qZaW73ExBc8mZvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=MphwiHHY; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="MphwiHHY"
Received: from DESKTOP-SUEFNF9.taila7e912.ts.net (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 453773698;
	Tue, 7 Jul 2026 16:06:21 +0800 (GMT+08:00)
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
Subject: [PATCH v2] media: atomisp: fix scaler setup leaks
Date: Tue,  7 Jul 2026 16:06:15 +0800
Message-Id: <20260707080615.631222-1-dawei.feng@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9f3b9d201703a2kunm9435365539493
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQx1MVh9DTUMYTB9PSUtMTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktISk
	9ITFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=MphwiHHYuTi6ESIPoyYhQeosf81+2JlXOhTh1dtcrppDctICkIKMhSi+R3H+zQ7fj7impmx7NjU3s74WdXmOtSrgoIbdBDb+oFLykddMsmdGh00Ypqs2PJC8A3UzoK6vVWRExQl1xeZJqojd9Leex8utvz360VH4vgP5pn/Xhqk=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=nBpWsa4JwdsFOGP1xCF1vGkR/mRGjxPDQ0mKNQD/sqU=;
	h=date:mime-version:subject:message-id:from;

load_video_binaries() and load_primary_binaries() create a CAS scaler
descriptor before allocating and looking up the YUV scaler binaries. Error
paths after descriptor creation can return without destroying the
descriptor and without freeing the partially allocated scaler state.

Fix this by properly destroying the CAS scaler descriptor on failure and
using reverse-order cleanup labels to free the partially allocated scaler
arrays and state variables.

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
Changes in v2:
- Use reverse-order cleanup labels to free partially allocated scaler
  state on the scaler setup failure paths.

 drivers/staging/media/atomisp/pci/sh_css.c | 43 +++++++++++++++++-----
 1 file changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 6cda5925fa45..b17e0b3879f4 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -4527,21 +4527,25 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 			  pipe_out_info,
 			  NULL,
 			  &cas_scaler_descr);
-		if (err)
+		if (err) {
+			ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
 			return err;
+		}
 		mycs->num_yuv_scaler = cas_scaler_descr.num_stage;
 		mycs->yuv_scaler_binary = kzalloc_objs(struct ia_css_binary,
 						       cas_scaler_descr.num_stage);
 		if (!mycs->yuv_scaler_binary) {
 			mycs->num_yuv_scaler = 0;
 			err = -ENOMEM;
+			ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
 			return err;
 		}
 		mycs->is_output_stage = kzalloc_objs(bool,
 						     cas_scaler_descr.num_stage);
 		if (!mycs->is_output_stage) {
 			err = -ENOMEM;
-			return err;
+			ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
+			goto free_yuv_scaler;
 		}
 		for (i = 0; i < cas_scaler_descr.num_stage; i++) {
 			struct ia_css_binary_descr yuv_scaler_descr;
@@ -4555,9 +4559,8 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 			err = ia_css_binary_find(&yuv_scaler_descr,
 						 &mycs->yuv_scaler_binary[i]);
 			if (err) {
-				kfree(mycs->is_output_stage);
-				mycs->is_output_stage = NULL;
-				return err;
+				ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
+				goto free_output_stage;
 			}
 		}
 		ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
@@ -4734,6 +4737,15 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 	}
 	IA_CSS_LEAVE_PRIVATE("");
 	return 0;
+
+free_output_stage:
+	kfree(mycs->is_output_stage);
+	mycs->is_output_stage = NULL;
+free_yuv_scaler:
+	kfree(mycs->yuv_scaler_binary);
+	mycs->yuv_scaler_binary = NULL;
+	mycs->num_yuv_scaler = 0;
+	return err;
 }
 
 static int
@@ -5105,6 +5117,7 @@ static int load_primary_binaries(
 			  NULL,
 			  &cas_scaler_descr);
 		if (err) {
+			ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
 			IA_CSS_LEAVE_ERR_PRIVATE(err);
 			return err;
 		}
@@ -5112,7 +5125,9 @@ static int load_primary_binaries(
 		mycs->yuv_scaler_binary = kzalloc_objs(struct ia_css_binary,
 						       cas_scaler_descr.num_stage);
 		if (!mycs->yuv_scaler_binary) {
+			mycs->num_yuv_scaler = 0;
 			err = -ENOMEM;
+			ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
 			IA_CSS_LEAVE_ERR_PRIVATE(err);
 			return err;
 		}
@@ -5120,8 +5135,8 @@ static int load_primary_binaries(
 						     cas_scaler_descr.num_stage);
 		if (!mycs->is_output_stage) {
 			err = -ENOMEM;
-			IA_CSS_LEAVE_ERR_PRIVATE(err);
-			return err;
+			ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
+			goto free_yuv_scaler;
 		}
 		for (i = 0; i < cas_scaler_descr.num_stage; i++) {
 			struct ia_css_binary_descr yuv_scaler_descr;
@@ -5135,8 +5150,8 @@ static int load_primary_binaries(
 			err = ia_css_binary_find(&yuv_scaler_descr,
 						 &mycs->yuv_scaler_binary[i]);
 			if (err) {
-				IA_CSS_LEAVE_ERR_PRIVATE(err);
-				return err;
+				ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
+				goto free_output_stage;
 			}
 		}
 		ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
@@ -5257,6 +5272,16 @@ static int load_primary_binaries(
 	}
 
 	return 0;
+
+free_output_stage:
+	kfree(mycs->is_output_stage);
+	mycs->is_output_stage = NULL;
+free_yuv_scaler:
+	kfree(mycs->yuv_scaler_binary);
+	mycs->yuv_scaler_binary = NULL;
+	mycs->num_yuv_scaler = 0;
+	IA_CSS_LEAVE_ERR_PRIVATE(err);
+	return err;
 }
 
 static int
-- 
2.34.1
