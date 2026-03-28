Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94CB260592
	for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 03:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774667698; cv=none; b=eO5CIfDnMm6Go66+8s3NayLF4LofqlhMm3QS59Bd6u+xIsoefvzZfXauW5Jvj9xeV3Zi5OyVz1hhOcO94ntN1BtNhrxzhbkHKyUJ09M7zr8qxb1jZAYB3R9vNVKtCPSKVyf/OPwzRaie8Wp4acH7Ct/M7hS2hxXtO1mBBOIE1d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774667698; c=relaxed/simple;
	bh=ivB1OmGdPNTW2GK2AKrypX3cG37iKp6PvyWPTdn8sXc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jj87y/32mXO9t7O8kQMlLb4gSdzX07kVkqgFvGlCLQAswoJ29f6NObExFa19LfRyj1K+6/2cUjeTC1my07Ufh/icdyox14sIDAqaNWjTkrunnXWto8BNPmZiC+EP3xbDqGr//R2FINepX6a42LOrwPxHb/gvTNvBlqyHLGRyb2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BzkeKIPQ; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BzkeKIPQ"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-67df618d095so1574034eaf.0
        for <linux-staging@lists.linux.dev>; Fri, 27 Mar 2026 20:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774667695; x=1775272495; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oOf1MJihMCaszzTY/m9WkVl5J6IxRQts736E69NospA=;
        b=BzkeKIPQ7MadoMTjkZ190WtyQFSZKWExAaZWYEyAbJjZ+ZtxKKSu/et/n3XAe/IyFU
         P230pMcgvrNsRglkAP+eGanShSCuAxVM9L7yRtZ+x8Rb2VUSJwlK0Zw+yHEMRDiPpo7y
         tMPxSqnLATBNdIv8JHDrEN9Ldytf482BREUBYfqA6d2uXgY7CXhu1zFdttAeYmZkFXZe
         hyabfJrKMSDtI0dL17stmdjsVvQY7wC4QvG5n20kc7nK4FayY5aqoQmOQaMjwPy5Llr4
         V2toz/qnDkrlQlNFwAkvkp4BthTq4wL1GagXQ2Edz/U6eGxhKk3FVQnIUlOCB44I1nx8
         39/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774667695; x=1775272495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOf1MJihMCaszzTY/m9WkVl5J6IxRQts736E69NospA=;
        b=Vked0zcgrv27fuejUpLwmbSn+BI4hfXjofnLE76tzsq3i/mLDEJ41ZBixWwVys1jft
         L1F/IwpNABsgYEEWklgHvdLGftnLCulRUckgCuvecFsZ8ElOyYQNnEqHoXKiirt9kGQp
         agFI3iMO+xg5d7quA5keJYX47ZOwlSYTfqHaZoxNF9Azm66Fr2he3QFVAianVwpkAjCO
         Y0c1+tXj22jmIWxv2mGsHRLERau17MrP50EorgvoMoiPZ1BvKIXAoYSkYqUXkYxAm6xU
         VeorusaKQNU+vau0bIY6JIluEdD8RqiC8gPy1BMw8w2nvkAHHKfir398KDZQokuD4AAs
         /g6g==
X-Forwarded-Encrypted: i=1; AJvYcCXQ+7EwUbBWyTDqn6nF11iUrpHpkRlAkgNKtXvro0xQ7fOuEIbN5vm/hTNyADYZPZrvMJgR6A8bln4b7Kj2@lists.linux.dev
X-Gm-Message-State: AOJu0Yyo+ZXUdmaKACCHIQlp7tt4AIlSX776h4uUgQ5r6JZxfvB7epD0
	6r3UNDVsO+pmY1zLKrf6d6eavsK5p9XbeHqPTbOETf7oAtGSrlZZKr0=
X-Gm-Gg: ATEYQzzLOOOc6NtMuhRTy8C8pUlmil8vCucOKKEklS1YhT8yvxEngvd4Ae9tB5bnX/6
	N3XsztGoODAoV6V937sG+JLfTEJ19bbG/lMrMZs4LyBFXRcaGNXvh4RxUnIar7qa59gL7T0wmzo
	g7wGOkNLO9GSACF4SPle5ITP+Br5dw/JgyUEyyO2ar/XoYIXicRLr1c3c5HZTLVx9i0r/mNWHzZ
	pJhRJ6yhuMuz7tQ8AjRhsmzoXK64bGBMjJQgd0FNOkL19iKlcMWYCSQxtiPWQKQSd3KAzsVD2zj
	0Gj3ZF82tBsUz3FpgFsKU7JURyl2QCBGJlXztLmsMyswzgwCO7RiCg0QAWDaAKQS4xw/nK7MrrI
	LBX9xxMxkaytfMkRu7zd5a/pGghAplLzwvoHrSOhKgi8yv9fxTv+P9gfih5LBxSrOi6LbkYVxex
	2Ahp3Nh+8qDib70dvBPPr+piQ60GI6ezMDHNy6KN+tNuugFgl1Iqc=
X-Received: by 2002:a05:6820:807:b0:67e:e80:694e with SMTP id 006d021491bc7-67e186ec7e9mr2683232eaf.46.1774667694816;
        Fri, 27 Mar 2026 20:14:54 -0700 (PDT)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67e231ad680sm726309eaf.10.2026.03.27.20.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 20:14:53 -0700 (PDT)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v2 0/1] Add driver for StarTech USB3HDCAP capture device
Date: Fri, 27 Mar 2026 22:14:17 -0500
Message-ID: <20260328031418.10459-1-matthew.laux@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a V4L2/ALSA driver for the StarTech USB3HDCAP (and Micomsoft
XCAPTURE-1 variant), a USB 3.0 video capture device based on the
MST3367 HDMI receiver, TW9900 composite decoder, and CS53L21 audio codec.

The driver supports composite, S-Video, component, and HDMI inputs,
including audio capture. I'm targeting staging because the I2C chip
drivers are currently embedded rather than using proper subdevice drivers,
and some other minor issues remain (see TODO).

Tested on all four inputs at various resolutions. All v4l2-compliance
tests pass, including streaming tests, but I did find what might be a bug
in v4l2-compliance that causes any device that uses V4L2_FIELD_ALTERNATE
to fail the streaming tests - I believe the sequence number checks in
v4l2-test-buffers.cpp are contradictory for V4L2_FIELD_ALTERNATE and
impossible to satisfy. I temporarily changed my driver to report
FIELD_NONE to have the streaming tests run. I'm happy to fix the
v4l2-compliance issue if it is indeed an issue, or fix my driver if
it's not :)

This is my first contribution. I based this driver heavily on the
existing `usbtv` driver and welcome all feedback. I am committed to
eventually getting this out of staging and will stick around to make
any improvements needed so that can happen.


Thanks,
Matthew

$ v4l2-compliance -s -d /dev/video2
v4l2-compliance 1.33.0-5455, 64 bits, 64-bit time_t
v4l2-compliance SHA: 95ad25f6a77a 2026-03-17 13:08:36

Compliance test for usb3hdcap device /dev/video2:

Driver Info:
	Driver name      : usb3hdcap
	Card type        : StarTech USB3HDCAP
	Bus info         : usb-0000:00:14.0-2
	Driver version   : 6.12.73
	Capabilities     : 0x85200001
		Video Capture
		Read/Write
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x05200001
		Video Capture
		Read/Write
		Streaming
		Extended Pix Format

Required ioctls:
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video2 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 4 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK
		fail: v4l2-test-io-config.cpp(210): field == V4L2_FIELD_NONE
		fail: v4l2-test-io-config.cpp(386): Timings check failed for input 2.
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: FAIL
	test VIDIOC_DV_TIMINGS_CAP: OK
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 8 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls (Input 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK

Control ioctls (Input 1):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 8 Private Controls: 0

Format ioctls (Input 1):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls (Input 1):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 1):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK

Control ioctls (Input 2):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 8 Private Controls: 0

Format ioctls (Input 2):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls (Input 2):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 2):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK

Control ioctls (Input 3):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 8 Private Controls: 0

Format ioctls (Input 3):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls (Input 3):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 3):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)
	test blocking wait: OK

Test input 0:

Streaming ioctls:
	test read/write: OK
	test MMAP (no poll, REQBUFS): OK
	test MMAP (select, REQBUFS): OK
	test MMAP (epoll, REQBUFS): OK
	test MMAP (no poll, CREATE_BUFS): OK
	test MMAP (select, CREATE_BUFS): OK
	test MMAP (epoll, CREATE_BUFS): OK
	test USERPTR (no poll): OK
	test USERPTR (select): OK
	test DMABUF (no poll): OK (Not Supported)
	test DMABUF (select): OK (Not Supported)

Total for usb3hdcap device /dev/video2: 134, Succeeded: 133, Failed: 1,
Warnings: 0

Matthew Laux (1):
  staging: media: add driver for StarTech USB3HDCAP

 MAINTAINERS                                   |    8 +
 drivers/staging/media/Kconfig                 |    2 +
 drivers/staging/media/Makefile                |    1 +
 drivers/staging/media/usb3hdcap/Kconfig       |   13 +
 drivers/staging/media/usb3hdcap/Makefile      |    4 +
 drivers/staging/media/usb3hdcap/TODO          |   15 +
 .../staging/media/usb3hdcap/usb3hdcap-audio.c |  301 +++++
 .../media/usb3hdcap/usb3hdcap-composite.c     |  182 +++
 .../staging/media/usb3hdcap/usb3hdcap-core.c  | 1002 +++++++++++++++++
 .../staging/media/usb3hdcap/usb3hdcap-hdmi.c  |  802 +++++++++++++
 .../staging/media/usb3hdcap/usb3hdcap-video.c |  505 +++++++++
 drivers/staging/media/usb3hdcap/usb3hdcap.h   |  234 ++++
 12 files changed, 3069 insertions(+)
 create mode 100644 drivers/staging/media/usb3hdcap/Kconfig
 create mode 100644 drivers/staging/media/usb3hdcap/Makefile
 create mode 100644 drivers/staging/media/usb3hdcap/TODO
 create mode 100644 drivers/staging/media/usb3hdcap/usb3hdcap-audio.c
 create mode 100644 drivers/staging/media/usb3hdcap/usb3hdcap-composite.c
 create mode 100644 drivers/staging/media/usb3hdcap/usb3hdcap-core.c
 create mode 100644 drivers/staging/media/usb3hdcap/usb3hdcap-hdmi.c
 create mode 100644 drivers/staging/media/usb3hdcap/usb3hdcap-video.c
 create mode 100644 drivers/staging/media/usb3hdcap/usb3hdcap.h


base-commit: 2c8fe1f14240d75f2002e16b2b69c5c2d27ed41c
-- 
2.47.3

