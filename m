Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B28629CA
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 09:35:06 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id w7so4449301plp.13
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 01:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M72YZwYw9pvtbpSVTp5m5V5BckLQlYZpyBC+Fudq/gQ=;
        b=FCvRy/NgcsWkWaftL3OklPtrwlp3MakeGnyg3cfrO2T1HD/fsyh3L5GeeCeFioBMq1
         hSL9ttME9mJXV2oZPc1y0C+l820gcPs+bfTNOep8HCpDh/415gXnxTV5eVDDLDD861ju
         mAf2ui5aodGlhqLI6Tq869SrwIW07cn1XDsZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M72YZwYw9pvtbpSVTp5m5V5BckLQlYZpyBC+Fudq/gQ=;
        b=ZhJiNvnjlNf0KZOvXW/uxlkttiYN9WwVu5QkqVSFX2Rtor/HAFrGKDeeOyxlKOTVC5
         WldaeDn5kXobd5IFAy7vFupQw7GoazK1baXAquzSbiayh5TkkoQ+SHKtlLF01gnYTxt1
         nAvUTF5nIbGGkIGhgB0a3C/wuCtqKJ+PbNMYxAS4zD/PHz2KUoaeO4kb/0duVuH3LPkh
         vc8ffnWd2DP08dxO64HzNEL62z3kc2eCYFJrU63/067JCoZb+3gMj2wgu8qnbQlhtrT7
         QQeMSSl3CBJJvnGGCI+bHBHbee++RsWF/qGJEDdBaB+3ROGcMbbAjZwr1CMfwOuFA5QA
         kphw==
X-Gm-Message-State: AOAM533cZnpCkppdoCsq6+cz9FtzfM7jJBpTHij9W3beePdafvl+VvqA
	dRMk7KCrYD1PBI3T20Ie8Lxkdg==
X-Google-Smtp-Source: ABdhPJzSA56kYIS/uw09iEzjo1FQYuRC75hjOlr6z5DRrfMoNU3Mj+lNSS1VRZxmv/3eS4ZNnns7gg==
X-Received: by 2002:a17:902:bc4c:b0:149:ed05:3027 with SMTP id t12-20020a170902bc4c00b00149ed053027mr7388414plz.174.1641548105983;
        Fri, 07 Jan 2022 01:35:05 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8f6b:ee:64d8:ae81])
        by smtp.gmail.com with ESMTPSA id j17sm5269192pfu.77.2022.01.07.01.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 01:35:05 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFT v2 0/8] media: hantro: jpeg: Various improvements
Date: Fri,  7 Jan 2022 17:34:47 +0800
Message-Id: <20220107093455.73766-1-wenst@chromium.org>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi everyone,

Here are some improvements to the Hantro JPEG encoder driver. This
finishes two of the TODO items.

Changes since v1:

- New patch 8 cleaning up JPEG quantization table dimension magic
  numbers and sanity checking of various tables

- Add sanity checks for JPEG header size and alignment

- Drop linux/dma-mapping.h header now that the DMA bounce buffer is gone

- Make JPEG_ACTIVE_MARKER control read only

Patch 1 cleans up the final register write sequence in the JPEG encoder
driver. This particular bit was a bit confusing and hard to understand
given the lack of context around the original wmb(). Was it used to
force all the register writes to finish or to make sure memory writes
were completed? In the end I stuck with what the other hantro decoders
were doing.

Patch 2 fixes a misleading register name.

Patch 3 implements cropping on the output queue with the selection API
for the JPEG encoder. This allows specifying the visible area slightly
smaller than the macroblock-aligned coded size. This bit can be reused
by other stateless encoders once they are implemented.

Patch 4 adds a JFIF APP0 segment to the JPEG encoder output.

Patch 5 adds a COM segment to the JPEG encoder output. This is used to
align the SOS segment payload area.

Patch 6 implements the V4L2_CID_JPEG_ACTIVE_MARKER control. This is only
used to signal the segments added to userspace. The driver ignores any
changes requested.

Patch 7 lets the encoder output directly into the capture buffer,
getting rid of the DMA bounce buffer.

Patch 8 cleans up some of the magic number 64 instances around the
quantization table code. Sanity checks are also added.

Please have a look and test. I only tested this on the RK3399 with
gstreamer, and with Chromium's jpeg_encode_accelerator_unittest with the
patches backported to v5.10 on a RK3399 Kevin Chromebook. The H1 variant
is untested by me.

To test the selection API bits with gstreamer, the v4l2videoenc plugin
needs to be patched. A gst_v4l2_object_set_crop() call should be
inserted after gst_v4l2_object_set_format() in
gst_v4l2_video_enc_set_format().


Regards
ChenYu


Chen-Yu Tsai (8):
  media: hantro: jpeg: Relax register writes before write starting
    hardware
  media: hantro: Fix overfill bottom register field name
  media: hantro: Support cropping visible area for encoders
  media: hantro: jpeg: Add JFIF APP0 segment to JPEG encoder output
  media: hantro: jpeg: Add COM segment to JPEG header to align image
    scan
  media: hantro: Implement V4L2_CID_JPEG_ACTIVE_MARKER control
  media: hantro: output encoded JPEG content directly to capture buffers
  media: hantro: jpeg: Remove open-coded size in quantization table code

 drivers/staging/media/hantro/TODO             |  7 --
 drivers/staging/media/hantro/hantro.h         |  1 -
 drivers/staging/media/hantro/hantro_drv.c     | 41 ++++++---
 .../staging/media/hantro/hantro_h1_jpeg_enc.c | 44 ++++++----
 drivers/staging/media/hantro/hantro_h1_regs.h |  2 +-
 drivers/staging/media/hantro/hantro_hw.h      | 11 ---
 drivers/staging/media/hantro/hantro_jpeg.c    | 86 ++++++++++---------
 drivers/staging/media/hantro/hantro_jpeg.h    |  2 +-
 drivers/staging/media/hantro/hantro_v4l2.c    | 77 +++++++++++++++++
 .../media/hantro/rockchip_vpu2_hw_jpeg_enc.c  | 47 +++++-----
 .../staging/media/hantro/rockchip_vpu_hw.c    |  6 --
 11 files changed, 206 insertions(+), 118 deletions(-)

-- 
2.34.1.575.g55b058a8bb-goog

