Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B73344DA4
	for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 19:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774726065; cv=none; b=jp+tGLZ95MRIf/23JpR47dioDK/fEh95VfbVM2QMWEEKZlFqFVvyljwlaQ//QDO4GX9U9caHVv12/Z8u79aqv4nl3UwrZlxCZTjnG+UI5ikn8QWHrUvJycMJCCOLe2UQSlxo2YbV/22eo26fKxD49z9vkW9sfxHcpAwIFELVWYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774726065; c=relaxed/simple;
	bh=bC0DKDjrQLAjjJkrfj+dG8LmOIgjlk2HJJxcYl7Mhe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SCEf01XtBFmhSrXcCOQwo/Nr1SemP5OjMHWcTZ20rkHlm/qbsRrqRIdaMzggpwRaKyEU67Mv+GOkpjopNLBPTlhgHjLG8FxHI920mMnRJL/awSOo4ywoQc8wZcCfeYaLqDgb0IU8nOycMtyCn/4ejeBM30V9tUfb+CGC1tMaxy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WrqcXGRx; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WrqcXGRx"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-66a851e62c6so3427169a12.1
        for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 12:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774726062; x=1775330862; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2iKU/akDxfnh1nRLdbpAkE2AClT7RbbA3fVQinl+Nh0=;
        b=WrqcXGRxamLr7K7Y1myUYrxboap1zdc+udJjzg8nbt6ZP3UyGRq0iD21oLepa0iea/
         G6a9B/0RlTVrNFg3lAlyR/aqHaGMKI4i2nw2iCtAECg2z0ADTZRtPKxUIPmdtkWJBw9O
         knT2O+/BVvmv+pBfum4gP1DLv5kj6tqT7zgAyx4RL7ywdQe/keZ4IM+I5NOYCbQMTf+v
         jOtOu1DpBcrinCGs0CN5gaFQX+jg4EdM9cnySAYR4EJ0K3iqHUCIy4R5Wirlex8KYfoQ
         zR1RL4Pq6zfUzQ+JZYBSArpK82ssyZMG54Gq0LvJOIll9RqtMco0g+ovzqfTWUgJEx4w
         ZkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774726062; x=1775330862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2iKU/akDxfnh1nRLdbpAkE2AClT7RbbA3fVQinl+Nh0=;
        b=npu/z6jZ7JLdqX5OrUWu63ysDkL1jX/zC3+t+3SGX5P/YaitApXIUqJc5scyPWN4db
         tfXj6SgaHpK1qCYFZr5zjKmwQQZElOrOLhW6VKbZiP+JraY6kVua9+2naI5Qt2IchZGL
         gECbWqx6ECXAEGhOylsUmkRmPNbbMuWghZ1fzYzJmvuBBzFeftetzoIKkw0oLRbJBXB6
         WGdb4tjB5d/LZQ/4ZCnrGgyQC9OeoMGWtItmURa9sHLKtcp4CaqwF11mxp3mk0oFENXD
         jqJp0Fbg2OjXB0mWLS/NZxG71iRJSzDMcSMkOApASh/pQaNOWcTmrKG5YpMtGolLHBRe
         pWIw==
X-Gm-Message-State: AOJu0YwnCUtk/4DtUOzxlUaQyVlpS0QhA5Y+i2K3SHI+KAMnAhIb0ihK
	uA3/uAxX6Nb3cFAc+dxVoHMBaKuByBjoq2ulVodOVxjj1CNPzOgTmzjCvivNIVXW
X-Gm-Gg: ATEYQzw6Z664LNPKT0D6oXflgWDicoYkctqWiHmPf6j0aO/CFegVtFphC5uS8zjDn9l
	OiFJNHj7SvTGWP/4JFZUKWNFYaiSGSDgB5DuBMZxC41lwyJ/FKJM267zlNW4MKZa5Jd4klKEpOw
	Rnm0OkXdFJ6qc2u/RAivORRGCesVpLTtyhlIbazihUOVNmeywusZfeewY5K9ieTCZfRnUaBY1gE
	1U1jA8GZxjuAFOpqMW2psRw2AYrpzbaRl7bvzTHqZ56k4ibKHOOWKApKgi9iNemUHO7LFUsH0lE
	bCOzwN38M7O+ZozO4z47FSHo1LPXhFomND9xbiWJPBuq6q1x7oGT3eUSTOuhjZ6wbYP63V3j32h
	SgHxY0hL6uFSQEek0qIyxcn/Tv8w0x11u6OMY/oRGDbuI0uuP6/ksp450twhzVDnNAW8Q+5o/pE
	WM1X3U363EKWXfqHYThNHG8ps5NVhZBeAV5eU+Wo6tDjd7hA==
X-Received: by 2002:a05:6402:3583:b0:66b:8f61:a928 with SMTP id 4fb4d7f45d1cf-66b8f61ab75mr1285103a12.8.1774726062148;
        Sat, 28 Mar 2026 12:27:42 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:18b7:e580:68f0:a6ff:fe88:bed7])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66b76081af8sm857420a12.27.2026.03.28.12.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 12:27:41 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Cox <alan@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] media: atomisp: fix potential NULL pointer dereference in configure_isp_from_args()
Date: Sat, 28 Mar 2026 20:21:37 +0100
Message-ID: <20260328192721.255493-2-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328192721.255493-1-azpijr@gmail.com>
References: <20260328192721.255493-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function configure_isp_from_args() incorrectly dereferences
args->delay_frames[0] to configure cropping without checking if the
pointer is valid. However, as noted in a FIXME comment later in the
same function, delay_frames can be NULL in certain pipeline
configurations.

Add defensive checks for both delay_frames and tnr_frames before passing
them to their respective configuration functions. This ensures that
optional frames are only processed if they were actually allocated,
preventing a kernel NULL pointer dereference.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_sp.c | 44 ++++++++++++-------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 6da151e7a873..2904455b35f7 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -775,9 +775,17 @@ static int configure_isp_from_args(const struct sh_css_sp_pipeline *pipeline,
 	ret = ia_css_fpn_configure(binary,  &binary->in_frame_info);
 	if (ret)
 		return ret;
-	ret = ia_css_crop_configure(binary, ia_css_frame_get_info(args->delay_frames[0]));
-	if (ret)
-		return ret;
+
+	/*
+	 * Only configure crop if delay_frames are present. Accessing
+	 * delay_frames[0] without this check would result in a NULL deference.
+	 */
+	if (args->delay_frames[0]) {
+		ret = ia_css_crop_configure(binary, ia_css_frame_get_info(args->delay_frames[0]));
+		if (ret)
+			return ret;
+	}
+
 	ret = ia_css_qplane_configure(pipeline, binary, &binary->in_frame_info);
 	if (ret)
 		return ret;
@@ -808,21 +816,23 @@ static int configure_isp_from_args(const struct sh_css_sp_pipeline *pipeline,
 		return ret;
 
 	/*
-	 * FIXME: args->delay_frames can be NULL here
-	 *
-	 * Somehow, the driver at the Intel Atom Yocto tree doesn't seem to
-	 * suffer from the same issue.
-	 *
-	 * Anyway, the function below should now handle a NULL delay_frames
-	 * without crashing, but the pipeline should likely be built without
-	 * adding it at the first place (or there are a hidden bug somewhere)
+	 * Safely handle pipelines built without delay_frames
 	 */
-	ret = ia_css_ref_configure(binary, args->delay_frames, pipeline->dvs_frame_delay);
-	if (ret)
-		return ret;
-	ret = ia_css_tnr_configure(binary, args->tnr_frames);
-	if (ret)
-		return ret;
+	if (args->delay_frames[0]) {
+		ret = ia_css_ref_configure(binary, args->delay_frames, pipeline->dvs_frame_delay);
+		if (ret)
+			return ret;
+	}
+
+	/*
+	 * Safely handle TNR frames as well
+	 */
+	if (args->tnr_frames[0]) {
+		ret = ia_css_tnr_configure(binary, args->tnr_frames);
+		if (ret)
+			return ret;
+	}
+
 	return ia_css_bayer_io_config(binary, args);
 }
 
-- 
2.53.0

