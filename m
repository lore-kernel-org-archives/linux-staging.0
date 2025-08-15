Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5413C20E31B;
	Fri, 15 Aug 2025 18:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755282290; cv=none; b=ZOsDybeEd70jZxX5o0EIBsyGkan6h91EgQhYSyj06R0s9zUeRquxdLmxxxFXs17iZK8zj4sFexImg5g+8dAbyBj1g+LD3HJgTRWX1lk5WmMECEF5xAxU9RT7T1XrVJ97SxGGs5NJosaf3IojarWhJSA7ndF5swqsDGGS4XfswfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755282290; c=relaxed/simple;
	bh=QobVYEfTkkSCAnUJE1eYW2fseY8dFPW4L7iGC07OMNU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ozx7buKRB3ynWMDMzGt1KFMDAd8FXtXetQ0NMF54xatGSbHFhuWpxLictt/6I/EDPjCF4yrSN/UNsruOH1oPZ8YY7KhAuWcVfsSxjnYHkqdaX/Mh0eUU7v/E2qFkGMAozcOPwS7BhsJwNJmA6f9KVyviSen+LxusXf3Nm8lrLcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YfpoNvS9; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YfpoNvS9"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b9e4140f38so289330f8f.3;
        Fri, 15 Aug 2025 11:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755282287; x=1755887087; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q0zpMZnkL3xUP4iMVr2Rvk20jrCXLh2STUJz8BkNkI8=;
        b=YfpoNvS9fo9rJlWnTo3ED/4LfV9o0W/Yh7UbXaQbdM5Dutj4+nXIWg6/42gGmZe6i+
         IF+Ea15ZjMqA/INc85EDS0b/oOgdwOytfcVIdGr90a9izZ+k3BVN1XKOkcPoinwZNeUk
         u3V0I1+mGfiVZb+4KLyRjnmyiNwCGilyf0TXqmucrC8x7WLKjkA7BLu6IEu3w1G99CbW
         795yb/T9Yl+NyvFIiZ7X2LbZhicgFxGxf0u/AbyRxsTa7wpKqC5+Lbkp/OaLHXWJ4PeQ
         kMNE6e+jSop9+eHLE3xOOc5k9dLx4JwiQ4ORhtK+d7rnC3ij8LnH0vNsO90/GEZUSJcf
         WUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755282287; x=1755887087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q0zpMZnkL3xUP4iMVr2Rvk20jrCXLh2STUJz8BkNkI8=;
        b=p9udIh4ozQcD4kbIAOQ9gkRKGbvDFEz3XZ4w8DEjJgBWJujG4yM7KV/yhKK3hBykjU
         euDSv4NbQ03xIJA+E8xP1tyAZWzbwR2kgV8CRoqTesWy1wIz3vX5qnF8++Biv5YvoZXE
         oIHXXuXuJ80VKB8w5mJ3HiaTKt7pNMsQdS2Qnv5YKYt2lxym8DbArrLrAre7HvlVzuBV
         R4qdbUvAzRhx0VV92Ki9HX3An+Iaa5YfU/AVyupRt4RJN4mSo/K12H6c2J+J0ocLv/Uh
         l9R8+4Bw/y6lonyaXuJ3AdKNK4OL3mmW6q2bYCtn3qknbcbfb1cMx8LegcGl/Dm0E2/1
         ZiIg==
X-Forwarded-Encrypted: i=1; AJvYcCUFuXA+UF6l4yqeI9wltVi7pLpS/CpQrDJ24n0AWEMWwmV6VP8CeS6uIDvxoLibNk0VNLW1u+hipDMsbm/4dZwMZb3laQ==@lists.linux.dev, AJvYcCWA1bKUZY0rGf+yUzJ4SasNCtZROACEoPZdDG3O3vxOH1eqnapmpQ+vaoPqjEn8DbVNoPU2yA5ycUTCwd+bAw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0E15SO0S/wOyBAxIebIvmkSOXuOsriZM1JixqE7kujS3QuRTb
	sjQ6FIKQsGOwbX4Ni8WAIts1bS06qqCcc9KLSBLLKzYGCtC0urgWjr+6
X-Gm-Gg: ASbGncsCp2CMSfJ82vJfvrk08l0FYVk26bgnb7Wkwf+VRWzY2Z3Uzhuw9NpLhQX+cjQ
	FpHjS0jub8oWuf/mAv4CIWZRApSox6/qFQNP+TBrEzcxKBGguZgFWaw2PEJCTWrJnYwAD6wbZPv
	fQFPnr89HYSYYA9QZXO9cVXMEvrfmSODdvDLh2ztcvpAPJ63WtlzShcx6pSSP9P13Ii+O7U3NDo
	Coa/WKpHtW+VhcHlkVUG9OATGHgcdAINsdGbK5qoN9nk7jQpsOVzF83nySsohHiAFNhiuRM2Sv5
	90vS3hZaSlJc+BgLOLPSL+Ld+V2fN7NZCsym5kqAP7aiMeJxunlQCwn9hFJU1GDjjm5fFZ9tniZ
	SHZ87fYNRLnKc7jXEYIZP5cmJK/fo/7XWr4LbvJGt2rb30ENEnuEcfLUzyD0Zt7hJm4HUDQ4=
X-Google-Smtp-Source: AGHT+IG2Hgsf0X8riW5W1RS9V2Pmq4G97r97dj8tDlD9PVoE/DtRi0I+An1Iqw2p7XKPxCN6Cv5pOQ==
X-Received: by 2002:a05:600c:37cd:b0:451:df07:f41e with SMTP id 5b1f17b1804b1-45a21803ec8mr11696575e9.1.1755282286429;
        Fri, 15 Aug 2025 11:24:46 -0700 (PDT)
Received: from localhost.localdomain ([154.182.175.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6be103sm71465605e9.2.2025.08.15.11.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 11:24:46 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	dan.carpenter@linaro.org,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2] media: atomisp: Add lock asserts for mutex protection
Date: Fri, 15 Aug 2025 21:24:11 +0300
Message-Id: <20250815182411.36092-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add lockdep_assert_held(&isp->mutex) to critical functions accessing
shared device state. This enforces proper locking and detects violations.

Suggested-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>

---
v2:
- Fix Typos
- tested by building the driver

v1: https://lore.kernel.org/all/20250815170901.32105-1-abdelrahmanfekry375@gmail.com/
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  3 ++
 .../media/atomisp/pci/atomisp_compat_css20.c  | 31 +++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 3a4eb4f6d3be..48ca33e1c92d 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3794,6 +3794,7 @@ int atomisp_try_fmt(struct atomisp_device *isp, struct v4l2_pix_format *f,
 		    const struct atomisp_format_bridge **fmt_ret,
 		    const struct atomisp_format_bridge **snr_fmt_ret)
 {
+	lockdep_assert_held(&isp->mutex);
 	const struct atomisp_format_bridge *fmt, *snr_fmt;
 	struct atomisp_sub_device *asd = &isp->asd;
 	struct v4l2_mbus_framefmt ffmt = { };
@@ -4324,6 +4325,8 @@ static int atomisp_set_fmt_to_snr(struct video_device *vdev, const struct v4l2_p
 int atomisp_set_fmt(struct video_device *vdev, struct v4l2_format *f)
 {
 	struct atomisp_device *isp = video_get_drvdata(vdev);
+	lockdep_assert_held(&isp->mutex);
+
 	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
 	struct atomisp_sub_device *asd = pipe->asd;
 	const struct atomisp_format_bridge *format_bridge;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index be5f37f4a6fd..94f63d6a85df 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -1447,6 +1447,9 @@ int atomisp_css_input_set_resolution(struct atomisp_sub_device *asd,
 				     enum atomisp_input_stream_id stream_id,
 				     struct v4l2_mbus_framefmt *ffmt)
 {
+	struct atomisp_device *isp = asd->isp;
+
+	lockdep_assert_held(&isp->mutex);
 	struct ia_css_stream_config *s_config =
 		    &asd->stream_env[stream_id].stream_config;
 
@@ -1519,6 +1522,10 @@ int atomisp_css_set_default_isys_config(struct atomisp_sub_device *asd,
 					enum atomisp_input_stream_id stream_id,
 					struct v4l2_mbus_framefmt *ffmt)
 {
+	struct atomisp_device *isp = asd->isp;
+
+	lockdep_assert_held(&isp->mutex);
+
 	int i;
 	struct ia_css_stream_config *s_config =
 		    &asd->stream_env[stream_id].stream_config;
@@ -1621,6 +1628,9 @@ void atomisp_css_input_set_two_pixels_per_clock(
 
 void atomisp_css_enable_dz(struct atomisp_sub_device *asd, bool enable)
 {
+	struct atomisp_device *isp = asd->isp;
+
+	lockdep_assert_held(&isp->mutex);
 	int i;
 
 	for (i = 0; i < IA_CSS_PIPE_ID_NUM; i++)
@@ -1631,6 +1641,9 @@ void atomisp_css_enable_dz(struct atomisp_sub_device *asd, bool enable)
 void atomisp_css_capture_set_mode(struct atomisp_sub_device *asd,
 				  enum ia_css_capture_mode mode)
 {
+	struct atomisp_device *isp = asd->isp;
+
+	lockdep_assert_held(&isp->mutex);
 	struct atomisp_stream_env *stream_env =
 		    &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL];
 
@@ -1646,6 +1659,9 @@ void atomisp_css_capture_set_mode(struct atomisp_sub_device *asd,
 void atomisp_css_input_set_mode(struct atomisp_sub_device *asd,
 				enum ia_css_input_mode mode)
 {
+	struct atomisp_device *isp = asd->isp;
+
+	lockdep_assert_held(&isp->mutex);
 	unsigned int size_mem_words;
 	int i;
 
@@ -1690,6 +1706,10 @@ void atomisp_css_input_set_mode(struct atomisp_sub_device *asd,
 void atomisp_css_capture_enable_online(struct atomisp_sub_device *asd,
 				       unsigned short stream_index, bool enable)
 {
+	struct atomisp_device *isp = asd->isp;
+
+	lockdep_assert_held(&isp->mutex);
+
 	struct atomisp_stream_env *stream_env =
 		    &asd->stream_env[stream_index];
 
@@ -1726,6 +1746,10 @@ int atomisp_css_input_configure_port(
 {
 	int i;
 	struct atomisp_stream_env *stream_env;
+
+	struct atomisp_device *isp = asd->isp;
+
+	lockdep_assert_held(&isp->mutex);
 	/*
 	 * Calculate rx_count as follows:
 	 * Input: mipi_freq                 : CSI-2 bus frequency in Hz
@@ -1760,6 +1784,10 @@ int atomisp_css_input_configure_port(
 
 void atomisp_css_stop(struct atomisp_sub_device *asd, bool in_reset)
 {
+	struct atomisp_device *isp = asd->isp;
+
+	lockdep_assert_held(&isp->mutex);
+
 	unsigned long irqflags;
 	unsigned int i;
 
@@ -1815,6 +1843,9 @@ void atomisp_css_continuous_set_num_raw_frames(
      struct atomisp_sub_device *asd,
      int num_frames)
 {
+	struct atomisp_device *isp = asd->isp;
+
+	lockdep_assert_held(&isp->mutex);
 	if (asd->enable_raw_buffer_lock->val) {
 		asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL]
 		.stream_config.init_num_cont_raw_buf =
-- 
2.25.1

