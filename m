Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5139E361DBF
	for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 11:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782733714; cv=none; b=FrDyQ5tyNqNm+hEfzkj/t03U0rFQUP/sY8l4FNe1vPkKJp8wk3MoAwHRz9EU6vHTfJqQUVWS/ryglrSKF567qCJsjKZxNnqcJAi3T+U+UwcqvB+Fi1jKdRscz1xMaGXK8A0aHlvUsWI8hfmCXCqjlNd7qgktYrjmcLlSZO+oiy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782733714; c=relaxed/simple;
	bh=8ZRcLvTNqePiMje5i25yLpwIsHjdS6BX4UZZqJdU0NY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cpsLAmLoO7VckXWfyLM435Flg20ziiqRQiLfjpvnPHPS7yc1KPhewGenuEb7cwlwlQ0ZXmtT9I0if/uzdMR5o1skPxhPoFMDj6IHBGYQVvL+MtN9eclofHBxKpnZwGBPdyv5QjJWa8Z9KrXOr4xHfaS1n7Aw1/nLFeN4r8c3zro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=geZuFAg6; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="geZuFAg6"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aeb5e85378so1402880e87.1
        for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 04:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782733710; x=1783338510; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pny1Z5ThS2eDYF1Ex2XV9L1grJpAMKzgkVACXfGcMc4=;
        b=geZuFAg6yY3qpGehcQuq2Ie3JOHrSydy7rE82anUcsRM9L1V11H+duDcPUNdccsMC0
         CrigiIZxHYCZXXmn+OpqtJJh53CQXdelH+Z5hjP51cPYX6xMf4ZlrA3VbRW0TWHrWM2C
         UscP9Ffn6h4JdfRVs1jZUPhBL8ZSckMT5AV44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782733710; x=1783338510;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pny1Z5ThS2eDYF1Ex2XV9L1grJpAMKzgkVACXfGcMc4=;
        b=oJrk2+UgNXwWhOi6t5DztOXVTe9CFJP6H+sEBc/I0/eK3W54zxdgCmiQC7osygXfn3
         TkVxIMnlVO9JwAgGwGABAgJc5LZxlvQAIfX5r0v+mDMSyFErZb+3wnCVP5q+E37kuViy
         I0An2qT8WHXD+FDS+5KenywHa0EAmUuyet+K2QkYGAVAew4Rrfygdpvu8oJCyJgxWnRT
         1cpe5fbvcNoHoScAb5XxPgPPmbs0oOTGORovX851IZ4pjqWTADm/X3lYZjbvnnygXbWy
         YMitIWN9LgP/6GGyEAk1/kUTt+OLdYNTLXER/12rVzb3a9ckuJf3U5K4jwmzivvx7/V4
         rjXg==
X-Forwarded-Encrypted: i=1; AHgh+Rpmd+2cbv7s57YOdGgdxlsGuOsKIcZ7//FWgYOSulyE3MjPsAzKuw6tZfBgqRQ3XSelB22IhuYj6WgCMI+8@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3mUimVML2RjgVEJ+Wr3x4uau9n4ebdqLg1V8oGcZTvgMK2C5i
	0dj2K9Fk0o4x6ip/s7LwuERlffKaCwBgmPiWTDLwUX5FmzBZiwPViQTvwvx9+Hy+0A==
X-Gm-Gg: AfdE7cmDpukyf6Yz75S2tF5hOaj1LX+x7bl95eac7wi+o7KzJMzVQj7YHvw/9LmDajJ
	mBNFWp1bzY0KGMjpxkzAsQgXlfaO6SavAhhUQBrHQzQryvD3F4sSBSQbFtplHvEUM1cOeX1FoMm
	tLFKxmyWTjnJR9pHZLUK3aiJK75mHfd1rPbfdgpwJIYcyXKE3NaWz/wv+UXsW0Vz+Q92yo9CLz3
	15VNjleHdMp6tcw2sUpU0/hiGAYBXE0q4gXux+YS+mF1DmD51NJcF/t8SU/MgJPZljDRgJ2P0Y3
	FfPzYujbkDwmDAgD1Zi6NqSw9sETWUv3pW7e10ZLKlNgQMOmZLkh408LAIzd887VP5fj+u9CvSF
	D19qgBHhdyDK8uxjzVdXznunuF21tHzbxg8i4HsfqoRvuNri5447QlXvj/c+8OmX9QnWXROMTJ3
	VisSMXKOsMZ7dh1GkPqybIGDLw2T5j16nC0QT90+fIrxT9rX5fSx7J9m4lPro+Wol5vaXlShFSs
	3U7rYQ=
X-Received: by 2002:a19:f607:0:b0:5ae:bcdd:acef with SMTP id 2adb3069b0e04-5aebcefe4f6mr50866e87.22.1782733710410;
        Mon, 29 Jun 2026 04:48:30 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aeb0ee9edesm1745133e87.49.2026.06.29.04.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:48:29 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/2] media: atomisp: Remove doxygen comments
Date: Mon, 29 Jun 2026 11:48:27 +0000
Message-Id: <20260629-atomisp-kerneldoc-simple-v1-0-8ae282b85c5c@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAItbQmoC/x3MQQqAIBBA0avErBtILYOuEi2ixhoqFSciiO6et
 HyL/x8QSkwCXfFAoouFg89QZQHTOvqFkOds0JW2lVUKxzMcLBE3Sp72OUwofMSdUBunXG1N0zo
 DOY+JHN//uh/e9wPgZXBDagAAAA==
X-Change-ID: 20260611-atomisp-kerneldoc-simple-23f1f46357f3
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

The code was originally designed to use doxygen and that confuses
kerneldoc.

This series starts with a manual patch to remove all the comments that
confuses kerneldoc, and then with a patch to demote all doxygen
comments.

The goal is to add media-ci coverage for atomisp:
- https://gitlab.freedesktop.org/linux-media/media-ci/-/blob/main/test-kernel-doc.sh?ref_type=heads#L46

If needed, in future patches, we can convert the comments to kerneldoc,
I have made an experiment with Gemini and it threw pretty good results.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (2):
      media: atomisp: Demote all broken kernel-doc comments
      media: atomisp: Demote all kernel-doc comments

 drivers/staging/media/atomisp/i2c/ov2722.h         |   2 +-
 .../media/atomisp/pci/atomisp_compat_css20.c       |   2 +-
 drivers/staging/media/atomisp/pci/atomisp_subdev.h |   2 +-
 .../pci/base/circbuf/interface/ia_css_circbuf.h    |  40 +-
 .../base/circbuf/interface/ia_css_circbuf_comm.h   |   4 +-
 .../base/circbuf/interface/ia_css_circbuf_desc.h   |  14 +-
 .../pci/camera/util/interface/ia_css_util.h        |   2 +-
 .../pci/css_2401_system/host/csi_rx_private.h      |  18 +-
 .../pci/css_2401_system/host/isys_irq_private.h    |   4 +-
 .../host/isys_stream2mmio_private.h                |  12 +-
 .../pci/css_2401_system/host/pixelgen_private.h    |   8 +-
 .../atomisp/pci/css_2401_system/pixelgen_global.h  |   2 +-
 .../pci/hive_isp_css_common/timed_ctrl_global.h    |   2 +-
 .../device_access/device_access.h                  |   2 +-
 .../pci/hive_isp_css_include/host/csi_rx_public.h  |  18 +-
 .../host/isys_stream2mmio_public.h                 |  12 +-
 .../pci/hive_isp_css_include/host/mmu_public.h     |  30 +-
 .../hive_isp_css_include/host/pixelgen_public.h    |   8 +-
 .../pci/hive_isp_css_include/host/tag_public.h     |   4 +-
 .../pci/hive_isp_css_include/platform_support.h    |   2 +-
 .../pci/hive_isp_css_include/type_support.h        |   2 +-
 drivers/staging/media/atomisp/pci/ia_css_3a.h      |  30 +-
 .../staging/media/atomisp/pci/ia_css_acc_types.h   | 222 ++++++-----
 drivers/staging/media/atomisp/pci/ia_css_buffer.h  |  39 +-
 drivers/staging/media/atomisp/pci/ia_css_dvs.h     |   6 +-
 drivers/staging/media/atomisp/pci/ia_css_env.h     |  58 ++-
 .../media/atomisp/pci/ia_css_event_public.h        | 111 +++---
 .../staging/media/atomisp/pci/ia_css_firmware.h    |   4 +-
 .../media/atomisp/pci/ia_css_frame_format.h        | 104 ++++--
 .../media/atomisp/pci/ia_css_frame_public.h        | 120 +++---
 .../staging/media/atomisp/pci/ia_css_host_data.h   |   4 +-
 .../staging/media/atomisp/pci/ia_css_input_port.h  |  22 +-
 drivers/staging/media/atomisp/pci/ia_css_irq.h     |  88 ++---
 .../staging/media/atomisp/pci/ia_css_metadata.h    |  25 +-
 .../staging/media/atomisp/pci/ia_css_pipe_public.h | 192 ++++++----
 drivers/staging/media/atomisp/pci/ia_css_prbs.h    |  14 +-
 .../staging/media/atomisp/pci/ia_css_properties.h  |   7 +-
 drivers/staging/media/atomisp/pci/ia_css_stream.h  |   2 +-
 .../media/atomisp/pci/ia_css_stream_public.h       | 179 +++++----
 drivers/staging/media/atomisp/pci/ia_css_timer.h   |  23 +-
 drivers/staging/media/atomisp/pci/ia_css_types.h   | 414 ++++++++++++---------
 .../pci/isp/kernels/anr/anr_1.0/ia_css_anr_types.h |   2 +-
 .../pci/isp/kernels/bnlm/ia_css_bnlm_types.h       |  33 +-
 .../isp/kernels/bnr/bnr2_2/ia_css_bnr2_2_types.h   |  38 +-
 .../pci/isp/kernels/cnr/cnr_2/ia_css_cnr2_types.h  |  56 ++-
 .../conversion_1.0/ia_css_conversion_types.h       |  10 +-
 .../pci/isp/kernels/csc/csc_1.0/ia_css_csc_types.h |  16 +-
 .../pci/isp/kernels/ctc/ctc2/ia_css_ctc2_param.h   |   2 +-
 .../pci/isp/kernels/ctc/ctc2/ia_css_ctc2_types.h   |   7 +-
 .../pci/isp/kernels/ctc/ctc_1.0/ia_css_ctc_types.h |  99 +++--
 .../pci/isp/kernels/de/de_1.0/ia_css_de_types.h    |  31 +-
 .../pci/isp/kernels/de/de_2/ia_css_de2_types.h     |  29 +-
 .../pci/isp/kernels/dp/dp_1.0/ia_css_dp_types.h    |  38 +-
 .../pci/isp/kernels/dpc2/ia_css_dpc2_types.h       |   6 -
 .../pci/isp/kernels/eed1_8/ia_css_eed1_8_types.h   | 107 +++---
 .../isp/kernels/fc/fc_1.0/ia_css_formats_types.h   |  13 +-
 .../pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn_types.h |  35 +-
 .../pci/isp/kernels/gc/gc_1.0/ia_css_gc_types.h    |  49 ++-
 .../pci/isp/kernels/gc/gc_2/ia_css_gc2_types.h     |  14 +-
 .../atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h |  51 +--
 .../ipu2_io_ls/common/ia_css_common_io_param.h     |   2 +-
 .../ipu2_io_ls/common/ia_css_common_io_types.h     |   2 +-
 .../yuv444_io_ls/ia_css_yuv444_io.host.h           |   2 +-
 .../yuv444_io_ls/ia_css_yuv444_io_param.h          |   2 +-
 .../yuv444_io_ls/ia_css_yuv444_io_types.h          |   2 +-
 .../kernels/macc/macc1_5/ia_css_macc1_5_types.h    |  17 +-
 .../isp/kernels/macc/macc_1.0/ia_css_macc_types.h  |  16 +-
 .../pci/isp/kernels/ob/ob2/ia_css_ob2_types.h      |  36 +-
 .../pci/isp/kernels/ob/ob_1.0/ia_css_ob_types.h    |  81 ++--
 .../output/output_1.0/ia_css_output_types.h        |   4 +-
 .../pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a_types.h | 328 ++++++++++------
 .../pci/isp/kernels/sc/sc_1.0/ia_css_sc_types.h    | 102 +++--
 .../kernels/sdis/common/ia_css_sdis_common_types.h | 180 +++++----
 .../isp/kernels/sdis/sdis_1.0/ia_css_sdis_types.h  |  36 +-
 .../isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h   |  40 +-
 .../pci/isp/kernels/tdf/tdf_1.0/ia_css_tdf_types.h |  44 ++-
 .../pci/isp/kernels/tnr/tnr3/ia_css_tnr3_types.h   |  37 +-
 .../pci/isp/kernels/tnr/tnr_1.0/ia_css_tnr_types.h |  43 ++-
 .../pci/isp/kernels/vf/vf_1.0/ia_css_vf_param.h    |   2 +-
 .../pci/isp/kernels/vf/vf_1.0/ia_css_vf_types.h    |   2 +-
 .../pci/isp/kernels/wb/wb_1.0/ia_css_wb_types.h    |  45 ++-
 .../pci/isp/kernels/xnr/xnr_1.0/ia_css_xnr_types.h |  10 +-
 .../isp/kernels/xnr/xnr_3.0/ia_css_xnr3_types.h    |  44 +--
 .../pci/isp/kernels/ynr/ynr_1.0/ia_css_ynr_types.h |  88 +++--
 .../pci/isp/kernels/ynr/ynr_2/ia_css_ynr2_types.h  | 153 +++++---
 .../pci/isp/modes/interface/input_buf.isp.h        |   2 +-
 .../pci/runtime/binary/interface/ia_css_binary.h   |   2 +-
 .../pci/runtime/bufq/interface/ia_css_bufq.h       |  26 +-
 .../pci/runtime/debug/interface/ia_css_debug.h     |  40 +-
 .../runtime/debug/interface/ia_css_debug_pipe.h    |  10 +-
 .../pci/runtime/eventq/interface/ia_css_eventq.h   |   4 +-
 .../isp_param/interface/ia_css_isp_param_types.h   |   4 +-
 .../pci/runtime/isys/interface/ia_css_isys.h       |   8 +-
 .../runtime/pipeline/interface/ia_css_pipeline.h   |  10 +-
 .../pci/runtime/rmgr/interface/ia_css_rmgr.h       |   4 +-
 .../pci/runtime/rmgr/interface/ia_css_rmgr_vbuf.h  |  18 +-
 .../pci/runtime/spctrl/interface/ia_css_spctrl.h   |  15 +-
 .../runtime/spctrl/interface/ia_css_spctrl_comm.h  |  12 +-
 .../tagger/interface/ia_css_tagger_common.h        |   4 +-
 drivers/staging/media/atomisp/pci/sh_css.c         |  18 +-
 .../staging/media/atomisp/pci/sh_css_internal.h    |  53 ++-
 drivers/staging/media/atomisp/pci/sh_css_mipi.c    |   4 +-
 drivers/staging/media/atomisp/pci/sh_css_params.c  |   4 +-
 drivers/staging/media/atomisp/pci/sh_css_params.h  |  10 +-
 drivers/staging/media/atomisp/pci/sh_css_sp.h      |  14 +-
 drivers/staging/media/atomisp/pci/system_global.h  |   4 +-
 106 files changed, 2413 insertions(+), 1661 deletions(-)
---
base-commit: 253355887a1ab0ac8f33b356c7c1140eee554d18
change-id: 20260611-atomisp-kerneldoc-simple-23f1f46357f3

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

