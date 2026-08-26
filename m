Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359F942317C
	for <linux-staging@lists.linux.dev>; Wed, 26 Aug 2026 13:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750604; cv=none; b=c6Eu6OSTz6EH/0t9yiDGyRMea6Ix1fKpp6Y8bs/ZnMG/UHK/K773Eb7eTUrGxes1q7G8kep0E925I089BFWmrkXPQgfmHRDKPUIlOoMH9uaaUAMG2XyzcwyR/+CLapkidellNHvWNbeaXaVZ0Rmok6hPtWeQQbTy2mOULGwimTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750604; c=relaxed/simple;
	bh=NUyFjKb1yUUuxtBJbcuPJ4siECfjk98r6Wdhsi921mo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qdqXFZVy817JB6MGde9sVKYpcDYPwiIvlKnuFmt3OnWmx5lBQzbJEg9gAkMUFZ2VioWDqg+hKNyHFvo5pChbhv074hSoOcLH/fpEuisdSjRysSU9LlodLzWm7Y5CPrLyuU/UwwnQrylwW2GNmIo4Ae03rYSeARh/fbrNVcJ7yGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z0R930sU; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z0R930sU"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a41191c9a9so1197535a12.3
        for <linux-staging@lists.linux.dev>; Wed, 26 Aug 2026 06:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750598; x=1788355398; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gT6oHl5fAdL/6qqxz6ZMerR7vYW0T8hvLKXs7O+hHbI=;
        b=Z0R930sUBWk+g+w3FVSRiEe/zbRYoxxxHFDsveLBCm4jl2BJ51P/Cz1YEyQf4yDBEt
         7ar1+WfAFRfM/G+KwWMJglNBNS5GY63pJpzlLWeDQ3j1C7b2KCKE0EXmaNqiLpGFEc6R
         KSY9op6/lDNzPC/KLCiKdg4iCgj7Xeqgw5VGNBugO9HC3Htc09K7W/XpxmpyhyseRnNV
         QnXjsbpDVFViDEId0zk02PbMx4riUyjlqpUAE4vYgpUtfkcwqI4n7DIFj7T+393R3Tvd
         G8yXZPxNGvI9Rg9BpEaiB6k2+WbNHN21APsP3XJHRi5iLMUWMoVj9p5dp9bqP5WSe6C1
         lbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750598; x=1788355398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gT6oHl5fAdL/6qqxz6ZMerR7vYW0T8hvLKXs7O+hHbI=;
        b=M341jDIZH2ESPsIEXNAk2zqFN5vLQnRpgeAyWwDFyEdCSG4xuP7fT/qgkZwI6PLj+Z
         yJl7S27qxAy0eJabwYXpTGRTeoNfazTti5sZIgHddNTCxnyFOo827fansWNyu/6GvFAD
         64blIgybIAKhSemjR6EahprfKJ0pyTclTLW723jXnvyG8K3LhjdxKQpMd9VsHgD5Mf3y
         H3r2s2UM1n0r4KFQRU7qS6oArfaYxLiYDvvRhFDDRRiQXG/EkFDPpRPb7E0J60B4Qb/n
         7aMzI8xUvb9Q9nDBGgryByKQHsxbHr6C1OfMKTMVp38MTg+TIOjM7l1j/gZD1n5maPJA
         j5CA==
X-Forwarded-Encrypted: i=1; AHgh+Rphn+LAZrX4Q7b8wRGoB8Jzan1ReACOvxLvhorCFnYcu6DFkwWrMrB6R2TZHi/2IdmaqoctLiJhNk56Qa9V@lists.linux.dev
X-Gm-Message-State: AFuF++lNFtgHTuxj9EiT50hoMyoAXiUk4jcUIXoKtHnWs6MNsJfxui59
	t82VjIIA68rXiQrDG0q1vaKAhrME9HFTCJGCx1K9D6EiJFlZQfJwtRTv
X-Gm-Gg: AR+sD12SI4Hf4xuPWpOPhCWG8fXob51Eny7BVIFsAK0P5KPBTCnIfSPYW41ZsM4Q97h
	B2JIGFWLtfF63GuQ7Fio5eTMUcPbbrxUgB5LCukkkQ0FsbegPtTQWmBDGU4VNlIJ0UB69eiUfe/
	mTC4lc0HUT1xepQcg3+Jidfl9G6PqUywbarHvjkZ0v+Xbq5lAV3IwLNySnqGMEnTiybj1K5XArt
	IxevJgzMbzjdaowwUjIscFOPpu3qHKdVL+nv8LHw303QMJ4Q5DyiJDLt7wJvLEFjUw0zz5vbjw+
	kxxKPKtUooTpzFco8/pF3ZB+In4mINALhUmQ0NT24jirxfVEv0nF8/HpmmfYjWmoAWSahaSBRh0
	cSytJ0hTRJe/u82/MAwAZX2eoma3JRW3TR4bESyUBKxk5VYeUP0opskxes6hZK04nGs/qmFqa+R
	bLYSIJaeg3QIyBrt9B+G5sFs9+EwdMGj5uBEs+axrgoaoa89p1CjwiT2+RmFaCrRf03IwosmlTK
	QrvX2L7ENcYzeO+uZ1Yf6n+XTC/Ug5FjK0ankd3LQo=
X-Received: by 2002:a05:6402:2490:b0:6a5:d8eb:da01 with SMTP id 4fb4d7f45d1cf-6a5df31ac64mr9983196a12.0.1787750598390;
        Wed, 26 Aug 2026 06:23:18 -0700 (PDT)
Received: from 1Z10 ([37.163.238.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5dea83a30sm3633147a12.15.2026.08.26.06.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:23:17 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH 7/8] media: atomisp: allow opt-in raw Bayer capture
Date: Wed, 26 Aug 2026 15:22:55 +0200
Message-ID: <20260826132256.3343451-8-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AtomISP currently rejects all raw formats and silently substitutes
YUV420. This prevents userspace camera processing stacks from obtaining
unprocessed sensor frames.

Add an allow_raw_output module parameter, disabled by default. When it is
enabled, enumerate only the raw format matching the sensor media-bus code
and reconcile raw format requests with the code selected by the sensor.

Also apply the per-sensor padding discovered by the CSI-2 bridge when
enumerating and negotiating frame sizes. Existing systems retain the
global padding and raw-output defaults.

Tested on a Lenovo Yoga Book YB1-X91L with raw capture from its OV2740
and OV8858 sensors.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 24 ++++++++++++++-----
 .../media/atomisp/pci/atomisp_internal.h      |  6 +++++
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 13 ++++++----
 .../staging/media/atomisp/pci/atomisp_v4l2.c  | 15 ++++++++++++
 4 files changed, 48 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 6cd500d9fd26..9e6387b662bc 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3572,10 +3572,14 @@ void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,
 	u32 min_pad_w = ISP2400_MIN_PAD_W;
 	u32 min_pad_h = ISP2400_MIN_PAD_H;
 	struct v4l2_mbus_framefmt *sink;
+	u32 input_padding_w = input->padding_override ?
+			      input->padding_w : pad_w;
+	u32 input_padding_h = input->padding_override ?
+			      input->padding_h : pad_h;
 
 	if (!input->crop_support) {
-		*padding_w = pad_w;
-		*padding_h = pad_h;
+		*padding_w = input_padding_w;
+		*padding_h = input_padding_h;
 		return;
 	}
 
@@ -3588,8 +3592,10 @@ void atomisp_get_padding(struct atomisp_device *isp, u32 width, u32 height,
 		native_rect.height /= 2;
 	}
 
-	*padding_w = min_t(u32, (native_rect.width - width) & ~1, pad_w);
-	*padding_h = min_t(u32, (native_rect.height - height) & ~1, pad_h);
+	*padding_w = min_t(u32, (native_rect.width - width) & ~1,
+			   input_padding_w);
+	*padding_h = min_t(u32, (native_rect.height - height) & ~1,
+			   input_padding_h);
 
 	/* The below minimum padding requirements are for BYT / ISP2400 only */
 	if (IS_ISP2401)
@@ -3804,8 +3810,9 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 	int ret;
 
 	fmt = atomisp_get_format_bridge(f->pixelformat);
-	/* Currently, raw formats are broken!!! */
-	if (!fmt || fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
+	/* Raw output remains opt-in while the legacy CSS path is validated. */
+	if (!fmt || (fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW &&
+		     !atomisp_allow_raw_output)) {
 		f->pixelformat = V4L2_PIX_FMT_YUV420;
 
 		fmt = atomisp_get_format_bridge(f->pixelformat);
@@ -3846,6 +3853,11 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 			ffmt.code);
 		return -EINVAL;
 	}
+	if (fmt->sh_fmt == IA_CSS_FRAME_FORMAT_RAW &&
+	    fmt->mbus_code != snr_fmt->mbus_code) {
+		fmt = snr_fmt;
+		f->pixelformat = fmt->pixelformat;
+	}
 
 	f->width = ffmt.width - padding_w;
 	f->height = ffmt.height - padding_h;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index 5a69580b8251..99a55297033e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -98,6 +98,9 @@
 #define ATOMISP_CSS_SUPPORT_YUVPP     1
 
 #define ATOMISP_CSS_OUTPUT_SECOND_INDEX     1
+
+extern bool atomisp_allow_raw_output;
+
 #define ATOMISP_CSS_OUTPUT_DEFAULT_INDEX    0
 
 /* ISP2401 */
@@ -116,6 +119,9 @@
 struct atomisp_input_subdev {
 	enum atomisp_camera_port port;
 	u32 code; /* MEDIA_BUS_FMT_* */
+	u32 padding_w;
+	u32 padding_h;
+	bool padding_override;
 	bool binning_support;
 	bool crop_support;
 	bool sensor_on;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 50366bf10f32..e63b3e99e5fd 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -554,8 +554,10 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
 		return ret;
 
 	fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
-	fsize->discrete.width = fse.max_width - pad_w;
-	fsize->discrete.height = fse.max_height - pad_h;
+	fsize->discrete.width = fse.max_width -
+		(input->padding_override ? input->padding_w : pad_w);
+	fsize->discrete.height = fse.max_height -
+		(input->padding_override ? input->padding_h : pad_h);
 
 	return 0;
 }
@@ -629,8 +631,11 @@ static int atomisp_enum_fmt_cap(struct file *file, void *fh,
 		 *
 		 * FIXME: fix the pipeline to allow sensor format too.
 		 */
-		if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW)
-			continue;
+		if (format->sh_fmt == IA_CSS_FRAME_FORMAT_RAW) {
+			if (!atomisp_allow_raw_output ||
+			    format->mbus_code != code.code)
+				continue;
+		}
 
 		/* Found a match. Now let's pick f->index'th one. */
 		if (fi < f->index) {
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 812230397409..d30f69f5a794 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -25,6 +25,7 @@
 
 #include "atomisp_cmd.h"
 #include "atomisp_common.h"
+#include "atomisp_csi2.h"
 #include "atomisp_fops.h"
 #include "atomisp_ioctl.h"
 #include "atomisp_internal.h"
@@ -72,6 +73,11 @@ int pad_h = 16;
 module_param(pad_h, int, 0644);
 MODULE_PARM_DESC(pad_h, "extra data for ISP processing");
 
+bool atomisp_allow_raw_output;
+module_param_named(allow_raw_output, atomisp_allow_raw_output, bool, 0644);
+MODULE_PARM_DESC(allow_raw_output,
+		 "allow experimental raw Bayer output (default:false)");
+
 /*
  * FIXME: this is a hack to make easier to support ISP2401 variant.
  * As a given system will either be ISP2401 or not, we can just use
@@ -889,6 +895,15 @@ static void atomisp_init_sensor(struct atomisp_input_subdev *input)
 	struct v4l2_subdev_state *try_sd_state, *act_sd_state;
 	int i, err;
 
+	input->padding_override =
+		atomisp_csi2_get_sensor_padding(input->sensor->dev,
+						&input->padding_w,
+						&input->padding_h);
+	if (input->padding_override)
+		dev_info(input->sensor->dev,
+			 "using ISP input padding %ux%u\n",
+			 input->padding_w, input->padding_h);
+
 	/*
 	 * FIXME: Drivers are not supposed to use __v4l2_subdev_state_alloc()
 	 * but atomisp needs this for try_fmt on its /dev/video# node since
-- 
2.53.0

