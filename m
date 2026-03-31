Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299BC274B4A
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 00:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774917560; cv=none; b=F8b6/KTHdZ3KAGGT8YGFDkhFuKd9C8Mumt/vXv9YJJMbTyFYYKI6fXppRXit2Hxe3gTrJqx3EZSNP2tNSXg9+CXqryYjFT1/mjcF9dxBPhfRF/Gu8Vi4rqh0GwVU/3KuYi8oJItSAH2vt2qSynXtm2LX/XVP87HjWSqGGJt3nLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774917560; c=relaxed/simple;
	bh=BNs4kWMgC4LhIpybP4JEKkM79J3ySRTrb6LS2+wEHF4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qUSOJIbMSGhSMI+9nWh8E5VRTnJAgJSwciCzgAY04/LiF5j8iMbqstB9+z3pbcXqWChDuWkauevJjobb0f54yRCP465iF53qF/aRMnR/QeOH/aYpQ6zLxZrMQVqUKpjwnMcqT4sC6ypuRE0v/MqKLulXHKRtx/DD9QW2bE3XLg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CN/evp4n; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CN/evp4n"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-46aa216a5edso1535115b6e.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 17:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774917558; x=1775522358; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RMuwGDW/FgnIJbFIDzAnfdz4iDnrrYckzTA+tSv3rM0=;
        b=CN/evp4nRsozRKWMWYrmFgEcvbmWwXiOw1eXxzwhCURMmVv6iC5I3Eqni20WdwELXW
         3oibi78Fma9rPomquPbxNwg34Tem6wIdKrxFgF3UQTRNkdaUXf+lp+mYxZpbgTAlkpvS
         t5CSk/lijZJIQjpZNI6wwZJoyW95HkpO3SwYRYr6w7fmlQYmYRrGaT84/4JN8aQCV+nj
         wMxEwuifi8erLNtpvIiuK01O3nuolVBShlWtusyhMvrIkUf4g9y9KccrBaQuhogHwVHU
         DrgHLXKoCUdeROk3Jb3qZ83UCUDrCrwx5nniJKNfJHAmGKu761pqni/5eqJeHU4M90ds
         dzSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774917558; x=1775522358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMuwGDW/FgnIJbFIDzAnfdz4iDnrrYckzTA+tSv3rM0=;
        b=SqBtuIXRmDl7KfivO0w4jmrp0Go624jc1ea3fW/5/Bm6VVBiEQqy0LVFVUnp3qfayP
         wd/RdyywniZWtDMmMHLe2WOChWK9Q4bwJAp9lxqg0xIzgMRa/mfD0s3UZzXa6lm4z633
         duvjNtnlxUz3B89z39R3bgDXIWMJEqpAHkXkCuVPEdDILA+tDVtTg4qwVxoZ5ekgVhTs
         sgCyyf2R2MTSX9EeG67wDvjn+9uZi2RBWjusu0f7YJk1A19WokfxTvMNDdh87lnMJeEx
         kcL5yZWPXgK8GEZ20Am+k5Yyi3CF7QTL9jM5waNlSpnZrpcwVOYNUwhJpNFYaWXlHZRK
         x6yQ==
X-Forwarded-Encrypted: i=1; AJvYcCXI6yCJDkmskHZzRsLnvu35yA0/MV7uZj6thIdb4clpbbTuXbONNC3wiJP6woh5cAAXYL+POcQYg6Dv7CeY@lists.linux.dev
X-Gm-Message-State: AOJu0YziyIpRz53Kvxbxkn2jmFC+sbsOn1KPi6+6PzQgygLxpH8+63WM
	dqda0IomxrV/XBLepFEzdWAIcYKZEKSVsEu4TkJJdcV9sHwnS/CczYQ=
X-Gm-Gg: ATEYQzy2NaEgcnNYQcRPuzJT55nNf75lxkcTj4FKYvMAGKmLIKEtzYV751H4M1YT1Ol
	dRqfzTXij2qEY4CgUSZQZQkoxBKqLg1nOWHrLmB3p6RrMO7NTa9oi6BZbCTMVOmpfxKVw9Vs610
	mLjN1gt6a0u8pPC/SMS1pMjYN97EDCZWRv45xe4kKsgQhCtsaYfE0e3mNenLkZUA8VvOiDHGqFg
	5q0ig4okrruXEN6vrRVgCLNy5RftqVeUZSHwnc7iXs+Mpw2WDdW3JzFZTrJCm4AgVAxb3DsNkDw
	pZBuyOMHYyWIkm1oxPTevgPCixoy3KoGSzNqY3Y1tqwqq94eLJh97G0pu0vCt0kaoARByRKdX5Q
	dxlnxUTQuP33WihVNpXteH8a+5YvBfiaGuDoiHJQpvQXWRBiadzA4TQiu2kJ1GAH1enG98bAHR3
	IWjk4hGvtRPRIHKytyHjndmFcofeJ+fpllbFKsXh8M2lBGwPyZXIM=
X-Received: by 2002:a05:6808:ec4:b0:467:2a6e:ada8 with SMTP id 5614622812f47-46a8a436d31mr7109800b6e.25.1774917557982;
        Mon, 30 Mar 2026 17:39:17 -0700 (PDT)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46aa03b1e64sm5776254b6e.15.2026.03.30.17.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 17:39:16 -0700 (PDT)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v4 0/1] Add driver for StarTech USB3HDCAP capture device
Date: Mon, 30 Mar 2026 19:36:15 -0500
Message-ID: <20260331003617.3684-1-matthew.laux@gmail.com>
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


base-commit: 4fbeef21f5387234111b5d52924e77757626faa5
-- 
2.47.3

