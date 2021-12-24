Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BE62C9D
	for <linux-staging@lists.linux.dev>; Fri, 24 Dec 2021 08:43:17 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id j13so6238141plx.4
        for <linux-staging@lists.linux.dev>; Fri, 24 Dec 2021 00:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5DsPt2zNbbtIU1NI6wS2ot/7njOz7ta1uGVnZDlkFWM=;
        b=odTBL+Ss8EO5+U+uct7LVs0Pve7LC5QfIaNtLt32WSB6piHr9KdMp+/19pIllXd9zp
         qqullEMewlissvvB5beEXjBRmG2GkmKb3xVskbcX0xeGcFDFxH/jBcSZjCxpNSoOWql/
         Fi8hQhJE9K1K3FUT6DUkN00QUE0FjpE0lFVRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5DsPt2zNbbtIU1NI6wS2ot/7njOz7ta1uGVnZDlkFWM=;
        b=o16UhYAlSj2M1HDjSPo9eP5Nmtio7/Nd8OpjExsMdyRgQpy8ZDQ4ta2g1SPk/Is6YG
         aR+AnuGA2j5wwMjn7/WUP+A15WEncDhImb3WdEzTqwKSgPYS5lnuB+gqHrZD5TtkSXkt
         InLcYyidRysWNDTdG2diDzSD+BnMOpWqmXhu+8fyPJX4wbxvm8irvqxTxXThedc6MEG/
         MQgqRV/3uYWM1XY0hUIHnQ3NOI7pKltJGkMnwEEwDDeNwLRcH23F6HUHzJXY5om19LA6
         mL8WgG4jBM/AnJAJ4DWBaoWQeleHFm0H2A80kfoOcIvME88tpTz3yfYAe1/2RY6/Xf7l
         6bjg==
X-Gm-Message-State: AOAM530OpaX00hwO3QreF1h1BJ7XP3Dlu7VVaoaILt3ajPRcbJ4ormGo
	kozDS6FE4Hjm5t9HMMFu1c43CA==
X-Google-Smtp-Source: ABdhPJyPRMLCBGrr/ppBW8e99WjUWf52RcTgYPg35ndZ15IoYOS+iG4iZ/CRCFWBrFVNLgJvmIUWlg==
X-Received: by 2002:a17:902:bd44:b0:148:a2f7:9d85 with SMTP id b4-20020a170902bd4400b00148a2f79d85mr5795145plx.164.1640335397029;
        Fri, 24 Dec 2021 00:43:17 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fd40:cbd0:c42a:3c26])
        by smtp.gmail.com with ESMTPSA id p13sm436369pgl.23.2021.12.24.00.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Dec 2021 00:43:16 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tomasz Figa <tfiga@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFT 0/7] media: hantro: jpeg: Various improvements
Date: Fri, 24 Dec 2021 16:42:41 +0800
Message-Id: <20211224084248.3070568-1-wenst@chromium.org>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
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


Please have a look and test. I only tested this on the RK3399 with
gstreamer. The H1 variant is untested by me.

To test the selection API bits with gstreamer, the v4l2videoenc plugin
needs to be patched. A gst_v4l2_object_set_crop() call should be
inserted after gst_v4l2_object_set_format() in
gst_v4l2_video_enc_set_format().


Regards
ChenYu


Chen-Yu Tsai (7):
  media: hantro: jpeg: Relax register writes before write starting
    hardware
  media: hantro: Fix overfill bottom register field name
  media: hantro: Support cropping visible area for encoders
  media: hantro: jpeg: Add JFIF APP0 segment to JPEG encoder output
  media: hantro: jpeg: Add COM segment to JPEG header to align image
    scan
  media: hantro: Implement V4L2_CID_JPEG_ACTIVE_MARKER control
  media: hantro: output encoded JPEG content directly to capture buffers

 drivers/staging/media/hantro/TODO             |  7 --
 drivers/staging/media/hantro/hantro.h         |  1 -
 drivers/staging/media/hantro/hantro_drv.c     | 51 ++++++++----
 .../staging/media/hantro/hantro_h1_jpeg_enc.c | 44 ++++++-----
 drivers/staging/media/hantro/hantro_h1_regs.h |  2 +-
 drivers/staging/media/hantro/hantro_hw.h      | 11 ---
 drivers/staging/media/hantro/hantro_jpeg.c    | 51 ++++--------
 drivers/staging/media/hantro/hantro_jpeg.h    |  2 +-
 drivers/staging/media/hantro/hantro_v4l2.c    | 77 +++++++++++++++++++
 .../media/hantro/rockchip_vpu2_hw_jpeg_enc.c  | 47 ++++++-----
 .../staging/media/hantro/rockchip_vpu_hw.c    |  6 --
 11 files changed, 186 insertions(+), 113 deletions(-)

-- 
2.34.1.448.ga2b2bfdf31-goog

