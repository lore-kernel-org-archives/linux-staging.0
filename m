Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851925;
	b=QYeBcAepmoNHepqZdSh3Y0FWC7c1D524NJJ2sKDCJMxbhr3Hw/DzWZxc0aOdVLB4jA4t
	 OLYaDoHZi72C0BVsK5TyML1RqfQv8rMgHtuQehbhmydkRioKQ8mJDZy7ShlbCwyOJ3cX7
	 JatR3kSI2Ctgtm2Xt3CfjluIYCiBLpP8uKo2yhcTveZTaYPdY7AK2ZYjoLnIWfoOMblxj
	 6n+catEFyVSx3LOAR+97R6Bp1bvKHwdR4wAydSdllnNjfV7pn5pozwbRrjKMAgIwSyOKO
	 lnKZugoNJ11qn7oSPKShQ8MToKqEwfEnXoOyUcB+BDevnG+FZkOvcPmrCh8qPMhnLxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g6TQmkuyMCXzib2c99Z9MWfPdjMzOohKSTeFZiXInjw=;
	b=zk9KICJ4a+p4aOhfC00bmLJSv9klL0V0aJjrmbwpN6WT3+mPJPA5qDKtwCZX203SN0Wp
	 Df7fL2r8xR2T97EHQRV80uq/dHWOvskuvScLnshxtCLJHdiZnT4cWwg+FLrDroCOc0bO2
	 bhp7z8BC44XvUzyluRc+sCP+iMC5x9mQjdcb0SDqtgtyhZ5pXy0fqHsQtGEdGywWcOQVR
	 tnmXeV77R3aqZddNqmtlSUfqb2HQJVM650WhHVnNcgcNg69Ll++HkbuNGWL1tq5pyjc5u
	 Rvxw0TTG1IiFK6bWaHsbhTTYBa07y3BYY34fQ+1xrS6Z+koBw7ZvnCahs9vT/9kV8fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mh554RTx;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB4B606A330
	for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 17:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFB4B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mh554RTx
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490f38e9688so89077f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 09:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851923; x=1795456723; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g6TQmkuyMCXzib2c99Z9MWfPdjMzOohKSTeFZiXInjw=;
        b=mh554RTxPvLDKAAPHVQBPS+3zv5rcSFaI1RFjlU46e1o9BcLh7ykWJlhquwdQSzR2Z
         cnORMHlciKaJzi29j9kefh9iLew5xkuq8JQiyU9l/kRUl8xGNlbSSo71lmBQpute3DXF
         NEUNIR9gqaYFS3oCqYw9d32ZjVnLYUYv9n3APXJuR0bD9cPC7McgXDR0anKRHN2Wo8bb
         UZPl3THb+VoSJ8JKvGr1oc7SRBNZzSh+n3JPoYNJjhK8dRU1o3E5XdkJOsgZdF425PlH
         Okzk77BBSZvhhJ+aoZ5851WXDM/ZFoqm8/lsfvwaUohjHgz9Pv6BZTJAd29pFI17leuL
         UR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851923; x=1795456723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g6TQmkuyMCXzib2c99Z9MWfPdjMzOohKSTeFZiXInjw=;
        b=KENmotUyGOuk3PxviSxGEgb5RHOubKKdkXFyC7ALtfzW2TIqHg/0yJNYXP0GLGYLhh
         90um8aRRCKn/fqbu+HuHC/iNIk8axwY0bObqGjF8YnCsYNZSDeUWpXjJJXVLNliU7Vh1
         Tri0hy4JAUmTc9mLJuiwr1scz/SGgGMAtQBY4013JCs8ON1eyJnRfcx7y+I+9MSn299L
         CpvSbPbb1bjUnm4Z+7UWQhSPyRX95BmaZLex9bfYyeYDVcRbeOy/OCYv5j+Mz0/sn5rA
         3z62FBBQ7532bLrsKrKcWLw9FCQ9KObGmFe5gvNWBoVFtDPBXMy7CElu7axpGSJt4tFB
         iXXQ==
X-Forwarded-Encrypted: i=1; AL+hErFQIqh02wcplEd+fV3LoWIfh8s6xE/ry3rB9WHd1TqwkJCv8mVIRPo4gqNfbUMzmP+iHC0b3xBpe8PPl/2D@lists.linux.dev
X-Gm-Message-State: APuU4Z+n6YKKXqBq4cXymWuoQ5o/FOqtzqxvtDNyI+piviSnCdbHPqZc
	mr+e5WK40QVU8Y3UnaUV/cxK6ZTNxdBqukAAFxyeH4AiPeNj50MRyCystZzM5nL2eaOV12ZY
X-Gm-Gg: AZFdTZeyUAdg8cUIkveYAMODLz5apYSqj0NRy8mKwb5qyICI2+bfwaaP5OFjM1sXmJm
	tDcxOHvoMfFeSFkNxUatryrSJ4TJc/vxbAa0XyC02i211F0yEVLZWVJ9H82Fj4BSYw7OZuNQDLh
	Me86A4u6sX8GX6/ZYcwz0gVBva6V1XsH+eYTrYS3QSsFhyW3c3CaHar6XURxNDonrcyXcEhRNCu
	bxm/2ANhTV0ZNUou902Zz+qdEfJ3FzA/m/rUfovg7dxLaCsvXmmTcE6kZqPOg1+dlFdEtuLCOa5
	gU+YakMTaBNvXfeEN47gWPl9nLl/IpIQq86o8zfQlRoLNYO3aepM0vL4cAhjzhnDoF6A0Z2R45l
	MoehaF9fujimOOvSl4BdCiZt5VOuGC5AQHJSm99ameHX1TueAqDBgS2r883VZacgnvvv5JTumeP
	w7lFDiJXF3QDbEuPuxHAtYfyLNa10uyc957scLZ3rbHkEqBZj2C8OsyncXGP6IDkJ39IVWR5x58
	YqadoQC6r86FPxjo4tza3UQ+WE15R4CWuMTQTWFS98evmE5AvhAWtJ54e2yU8kIvFt6kkLakAte
	08a1udXNE0N3ZLO95uhvR3YlUjvsNmBGgkYFejW7eesxrQ==
X-Received: by 2002:adf:e18a:0:b0:491:d721:548f with SMTP id ffacd0b85a97d-4a3735b4463mr501445f8f.12.1794851923193;
        Mon, 16 Nov 2026 09:58:43 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:498f:88ac:2ca1:60d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d22394esm24171374f8f.3.2026.11.16.09.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:58:42 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Volodymyr Chapman <volodymyrchapman@gmail.com>
Subject: [PATCH 2/2] media: atomisp: Report frame interval for sensors without enum_frame_interval
Date: Mon, 16 Nov 2026 17:57:50 +0000
Message-ID: <20261116175750.21905-3-volodymyrchapman@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116175750.21905-1-volodymyrchapman@gmail.com>
References: <20261116175750.21905-1-volodymyrchapman@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

atomisp_enum_frameintervals() passes VIDIOC_ENUM_FRAMEINTERVALS on to the
sensor's enum_frame_interval pad op. Most sensor drivers used with atomisp
do not implement it, e.g. the OV2722 driver only implements
get_frame_interval and raw sensor drivers such as the IMX175 driver set
their frame rate with the pixel rate and blanking controls instead. For
these sensors VIDIOC_ENUM_FRAMEINTERVALS fails, so userspace does not know
the frame rate.

PipeWire's V4L2 source then advertises a framerate range of 1/1 to 120/1.
Firefox (libwebrtc) takes the minimum of such a range as the camera's
maximum framerate and drops all but 1 frame per second, while the sensor
runs at 30 fps.

When the sensor has no enum_frame_interval, report one discrete frame
interval: the sensor's get_frame_interval if it has that, or else the one
following from its V4L2_CID_PIXEL_RATE, V4L2_CID_HBLANK and V4L2_CID_VBLANK
controls and active format, rounded to a whole number of frames per
second. This is the interval of the sensor's current mode, which is
reported for every frame size; for the OV2722 and IMX175 all modes run at
30 fps.

Tested on a Lenovo ThinkPad 10 (20C3, Atom Z3795) with this file built out
of tree against a 7.2.15 kernel: ENUM_FRAMEINTERVALS reports 30 fps for
both the OV2722 front sensor (from get_frame_interval) and the IMX175 rear
sensor (256 MHz / (3430 * 2500)), and webcamtests.com in Firefox 160 shows
about 30 fps for both instead of 1 fps. This was build-tested on top of
media.git next.

The problem was investigated and this patch drafted with the help of an
AI coding assistant (Claude); the testing was done on the hardware by the
submitter.

Signed-off-by: Volodymyr Chapman <volodymyrchapman@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 046a95857..c83834405 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -576,6 +576,65 @@ static int atomisp_enum_framesizes(struct file *file, void *priv,
 	return 0;
 }
 
+/*
+ * For sensors without enum_frame_interval, get the frame interval of the
+ * sensor's current mode: from get_frame_interval, or else from the pixel rate
+ * and blanking controls which raw sensor drivers use to set the frame rate.
+ */
+static int atomisp_sensor_frame_interval(struct atomisp_input_subdev *input,
+					 struct v4l2_fract *interval)
+{
+	struct v4l2_subdev_frame_interval fi = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+	struct v4l2_subdev_format fmt = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+	struct v4l2_ctrl *pixel_rate, *hblank, *vblank;
+	struct v4l2_subdev_state *act_sd_state;
+	u64 frame_size, fps;
+	int ret;
+
+	act_sd_state = v4l2_subdev_lock_and_get_active_state(input->sensor);
+	ret = v4l2_subdev_call(input->sensor, pad, get_frame_interval,
+			       act_sd_state, &fi);
+	if (ret != -ENOIOCTLCMD) {
+		if (act_sd_state)
+			v4l2_subdev_unlock_state(act_sd_state);
+		if (ret)
+			return ret;
+		if (!fi.interval.numerator || !fi.interval.denominator)
+			return -EINVAL;
+		*interval = fi.interval;
+		return 0;
+	}
+
+	ret = v4l2_subdev_call(input->sensor, pad, get_fmt, act_sd_state, &fmt);
+	if (act_sd_state)
+		v4l2_subdev_unlock_state(act_sd_state);
+	if (ret)
+		return ret;
+
+	pixel_rate = v4l2_ctrl_find(input->sensor->ctrl_handler,
+				    V4L2_CID_PIXEL_RATE);
+	hblank = v4l2_ctrl_find(input->sensor->ctrl_handler, V4L2_CID_HBLANK);
+	vblank = v4l2_ctrl_find(input->sensor->ctrl_handler, V4L2_CID_VBLANK);
+	if (!pixel_rate || !hblank || !vblank)
+		return -EINVAL;
+
+	frame_size = (u64)(fmt.format.width + v4l2_ctrl_g_ctrl(hblank)) *
+		     (fmt.format.height + v4l2_ctrl_g_ctrl(vblank));
+	fps = div64_u64(v4l2_ctrl_g_ctrl_int64(pixel_rate) + frame_size / 2,
+			frame_size);
+	if (!fps)
+		return -EINVAL;
+
+	interval->numerator = 1;
+	interval->denominator = fps;
+
+	return 0;
+}
+
 static int atomisp_enum_frameintervals(struct file *file, void *priv,
 				       struct v4l2_frmivalenum *fival)
 {
@@ -601,6 +660,11 @@ static int atomisp_enum_frameintervals(struct file *file, void *priv,
 			       act_sd_state, &fie);
 	if (act_sd_state)
 		v4l2_subdev_unlock_state(act_sd_state);
+	if (ret == -ENOIOCTLCMD) {
+		if (fival->index)
+			return -EINVAL;
+		ret = atomisp_sensor_frame_interval(input, &fie.interval);
+	}
 	if (ret)
 		return ret;
 
-- 
2.43.0

