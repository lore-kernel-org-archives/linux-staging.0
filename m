Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5753E304BBF;
	Fri, 15 Aug 2025 17:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755277756; cv=none; b=R5e8kKYK0eRXPAfhyy+NwyUot2wdwjlkvEeWeIWQOYdTMFMN767sWPUiBzaV4T/7Vqb7F9vfETA17G+lme4jqcnCjf9dhjqYU1mSgX6EEMlaTZKXOEPlVGHrE4UODTx7Q92IbS81ZDRsGpjujnc5namZJ6kqY0Xf7q9PgJo4UM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755277756; c=relaxed/simple;
	bh=i39aS+ObywOPyCHHVYemcnYSe1Eb0V7lSuSL0TimfzM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WilDw0J3H/VfphN/VE/pHXs6IrddyzTvq+TlMTkwMpqvqgTsstlMqDa5vTPtCt6dPKaW5zROSxVH/kiojPyoWhKFpTAtp0yQuTfnRSH5TTQRFYrui75ffYEy/qqbY3oFiCRi7+Kto6MQ2Tie20fwUEcH2qUmkh4wmp7MxKkScis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=In7vP2hH; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="In7vP2hH"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b9e4140f38so281036f8f.3;
        Fri, 15 Aug 2025 10:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755277753; x=1755882553; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S9f02u3GqmQB3JIkPAoqZ4J3n/9mgpEYVfExN7OiRrE=;
        b=In7vP2hHu3OSq46KGUy3kCFNBQ9E3NTuLUXH/7Px9eh1vNC11c7Ux1PISLWZASQoOE
         lPukH7VLk4gQ7w2o8AP8GOKY5Ec1EIQ86unuvBDUgdQrsnYdUEga8mmswY36Yw52eYz8
         Yxfo49gu6vvjk61ACIlwvA4xzDuJ+73k3oDXeihbXGmuwyJS8IaNwhwbDqOlJgj3C/0Q
         0jTx4qN5EJxIRy5rd3nwYELuwWofyr2yaMkSvHDKaCaaIGh8pCb88C7mADjxlYI/XOdw
         5FTspGxs0PFSt8iKA4UA2TcGFjvvDXW2J0tENdrYLAM9OOnjAxsbl1ZkYFva5Gwka/Xu
         TNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755277753; x=1755882553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S9f02u3GqmQB3JIkPAoqZ4J3n/9mgpEYVfExN7OiRrE=;
        b=pLpA9WDERXAK9tzO6mk0DResVXI8O2Aedinqil1MhXzNtBPpKmgNxtcOaGFKexIGYl
         xx/5HIDarzjVyj7SP2ASxShHvrldfkQeJOIORrenI2SWafdEknMoEiJazNAbZpKSNTem
         LIu+QnmrlbLwVdFS45siGoBtT/oBN9tawG1qWDhlu0FLtZNnTyk0nXjnZEh+hDRCAyiD
         F3BLISHYqE4/JxL7ni30hsONG0eNwMs5XKjs+C3B3oxKMbEJ11/XTRfO98qtnFggwfBu
         3yVnHiSDOCa4g3IAKTPBKb5jMJjV2da7maYvQ9aCmP5ZBK0ok2CtOnhlvK5n2p+6Tiuk
         FJMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwXt0NoObcTSdhDWLJjbn1Y/4LnwpFpNu0TvU2FsR2dOdHUXnreMo7U4hNXhwJxbpXxoCsbXLVtoZ33TPJvpO9WXnIvw==@lists.linux.dev, AJvYcCVQ/i0clQJSr2xXAvKpeqQO6zIqHS7FnuyKxGlG6WVik9j/ujJBfaZKi30IveiNPAy8UjWI++8vo54vvyzYnw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxzujolS+5uqVBlo8qHI6qEmT2u3Tp5Axrxy3sbOlN733ZLshzD
	PJpYioUBsv+53yrLCJPESJGFA/CV63wz1OauD0kZBgBB1a3eJIp2yAY3
X-Gm-Gg: ASbGncvw8yqzjCorgiDvrCRwQfI9VAA7tNfJmEGxOOHQ/DB44smMb7rysTpmySDFmcC
	Z4StDnVS1V1ZsaXTlepL9kmg77tjF9Zy+jw9aNZ2yo7gvy4l9ccnPmRZwMKtcrZ1IKa9gzaaNdd
	sCTXB483dxCgl6i81Nz9JxND66lqdu6UkHrDo1N1lNbEJNaCiMZCAAmnigYE0CfR3Rkt6VUGy9X
	Dry2YL4uRfgwv23lYYDx+dYyygn8rkE604uu9UFzV5ugS0De8AWF51YHWHSpxYZ9+zuruHod/D9
	oVwSZ2pMEsaBUSjpbe4nwVdxM0pbQyIY5tGaDHQvA0b217zlaOqAW9mCiw1x6oVXCdkQGE7/zOP
	LAR2YgiOVVPSSOg4GegLEW2TFVmlHvvQ25zAYDZPrhImsYqn+Fm4MkqwlGn9LxGdFU4im/fJuNo
	jSD+qO8Q==
X-Google-Smtp-Source: AGHT+IH2T8ITBmcU5I7J7F7gTLljdMAJMBGBNIMMZJDwQwmChaogZZpltoGJRKW+LVoQwndbI+PSsg==
X-Received: by 2002:a05:6000:3113:b0:3b7:87be:d9fa with SMTP id ffacd0b85a97d-3bb63ac9bd3mr942743f8f.0.1755277752496;
        Fri, 15 Aug 2025 10:09:12 -0700 (PDT)
Received: from localhost.localdomain ([154.182.175.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb6863fc29sm2760083f8f.66.2025.08.15.10.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 10:09:12 -0700 (PDT)
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
Subject: [PATCH] staging: media: atomisp: Add lock asserts for mutex protection
Date: Fri, 15 Aug 2025 20:09:01 +0300
Message-Id: <20250815170901.32105-1-abdelrahmanfekry375@gmail.com>
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
index be5f37f4a6fd..915c4c9ea9e2 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -1447,6 +1447,9 @@ int atomisp_css_input_set_resolution(struct atomisp_sub_device *asd,
 				     enum atomisp_input_stream_id stream_id,
 				     struct v4l2_mbus_framefmt *ffmt)
 {
+	struct aromisp_device *isp = asd->isp;
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
+	struct aromisp_device *isp = asd->isp;
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
+	struct aromisp_device *isp = asd->isp;
+
+	lockdep_assert_held(&isp->mutex);
 	if (asd->enable_raw_buffer_lock->val) {
 		asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL]
 		.stream_config.init_num_cont_raw_buf =
-- 
2.25.1

