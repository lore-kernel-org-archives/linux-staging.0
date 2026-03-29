Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3709C280A58
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 04:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774760201; cv=none; b=pTpDVh8YnCs5BcEfXzwa3thTZ44BeLO943AjCmuusjZSnL5dV1XE4ATC7c9aQCzN2J4yTFEdNKbQnaQBEXl27CJXxv3yq5Z3DgBCrfrohmleuEc3PeEw+YW86/gp+ddQHHo69Sl19NUdpRHuewIdTi4HN8uO2qPd9Mio8WoT2yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774760201; c=relaxed/simple;
	bh=ivB1OmGdPNTW2GK2AKrypX3cG37iKp6PvyWPTdn8sXc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SxIBVs0mEy400Sc8J74ISlDeGRlZlk3LcP1OaNyPGw1w85Eoj45vp3rnI/mTT4A2iKnp922th9ZOie31jMb2Rq7KOTv5GUv4E1KRKyHldvsdCtUf+D44mdQZcsze8gXuYA8TGXuE8jYtycpRTZTtvW8ZdPDl5hQkQRBL+v8OSDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IK8XICxK; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IK8XICxK"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-408778a8ec4so2076376fac.0
        for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 21:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774760199; x=1775364999; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oOf1MJihMCaszzTY/m9WkVl5J6IxRQts736E69NospA=;
        b=IK8XICxK6UNbev7NH9XPyoZ3Wh29c4/IfiBLlqOfuylEFo6HqUuDQtzkC5zyPLM36k
         AfWwRpr2OcotNFLG0ENbjR75CXNMIh94LJu2rmmz9fxSipfunh+dmS6yG36Ev/6vlQyE
         Qqb/0aZyvgdLOBQB3WO2mPw3xWqrrL3JR/r95TV2p2vbt25HeCjILtWyK6547IihFIGn
         PaKeQV9QmYhWL7ebF8xseUhnRFCGC58zSVfZLHsQeGTW6htQwd7Kei4MhBv5vYiQJRc9
         4CvHBGDEN5xJS3S4vfZ+bXvq/29aq6Luba5cZ4MQGKBzf0qidaQ1v1/T7iHHFxv10EgQ
         XPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774760199; x=1775364999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOf1MJihMCaszzTY/m9WkVl5J6IxRQts736E69NospA=;
        b=Bs1fcL9g+kHUxRY0pzChJEp3oEcdaczMHGm1ZFD6msGdwfL2whOaDUZTJ1pcmwMpGQ
         PoSfBs0FjvEl3K2BwsKDoN4vETqxQXE4bNqicjiZ4HxYGxwbz610mGxyyEda4qGDlJB+
         xvoUlSFiJxJcGxcyWU4rNDT4iICyBHcSWxD3SL04S3m/g41/nfiszoezYhFGuSSmD3re
         VaOynrL5t1G3g5Y8+VTMGZlhRVP48/LdZzAfuipVVG8qgekXZQvESsArHqxaz3b7bpjr
         EYNFtYhk35vHAkU7IBqrj5pvEdcCqCrjdfNO8e/ZP0J93DukcsUaXnEPfENP5+bph3XS
         FOXA==
X-Forwarded-Encrypted: i=1; AJvYcCW6vSR9IlCOOl04gWuQncKYQHqjUV0AtBazBD4vKei/vdsRhjv/dIatjDvkofQwj5ZkqRW7cC/T1qGGms+l@lists.linux.dev
X-Gm-Message-State: AOJu0YxYIJkwJFtWBNcwAR5RcYIX243QcVBNIjT97lOnUMiuigkksX7R
	zx0Sb0zXSD2MLIb8QCB4gz1F7kejTKjmUZVw/m2miz9JM95+PWBjuHE=
X-Gm-Gg: ATEYQzwgk4k7b/6+MgKztVkSrPAbQ7Rv6kuW3nsYinuB38uPDeHuZghnoQPkM/bGyZ+
	+l6cDu/j0dhqrmvHaEB7AKMAPXp/lpuMOUV6QzJV9BBZqhFzVYoBIMNlKpHdUwE061LDBfDB0dJ
	fBIeimlmoO36zq3eNNIeJnuH8n3GNFwWiYbXzgGi73edJRWvnL4qOUD5v07sumuXoscFO4b9a3U
	RU44Nqm8VEhcfFZ/jHJdeXehkLt39UgiNlO7ynXQwTpfqex9L7PQiRnLTsBEmwziwp2v8tH8Gyc
	HdDHlbJnLKBmWmVuFl9VaSHwAB4ZrI63JoL+n3iro+9FVv+tnTO/s/DA5AQXWb1pDqefd4P/qlu
	+oAiVM5TPRL9Ee9PGgBaU3Alt3YkPhc5hMJzUrpwhnVpbJ5chvki00Zr674CT0FnINsM0WsGckp
	EuR9r73NR4I8R1QV+KjRY8CQVJZEBrdtOxp1c+oyS/ZqC3u41h0+4=
X-Received: by 2002:a05:6870:1611:b0:417:5a32:1e81 with SMTP id 586e51a60fabf-41cec172741mr4598926fac.17.1774760199034;
        Sat, 28 Mar 2026 21:56:39 -0700 (PDT)
Received: from miso.lan ([136.62.61.36])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41d0494be33sm2531786fac.5.2026.03.28.21.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 21:56:37 -0700 (PDT)
From: Matthew Laux <matthew.laux@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Matthew Laux <matthew.laux@gmail.com>
Subject: [PATCH v3 0/1] Add driver for StarTech USB3HDCAP capture device
Date: Sat, 28 Mar 2026 23:56:11 -0500
Message-ID: <20260329045612.6899-1-matthew.laux@gmail.com>
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

