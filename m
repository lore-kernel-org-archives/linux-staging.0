Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56CA33EC
	for <linux-staging@lists.linux.dev>; Tue, 14 Mar 2023 11:43:24 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id ay8so4818395wmb.1
        for <linux-staging@lists.linux.dev>; Tue, 14 Mar 2023 04:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678794203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ooBUhVhCqisZJ8iFuqAxT4qE8PBELCGSQnXBwgwo9FQ=;
        b=jrvesbJQwoSIRLAzVMo01IbkpsdrM0EQDt8iOZB8IWYVcA7NSDtMBnzu4TjhBAgEeg
         RazP0UPxBHxBJ33oJZ2rdAlqN+9sVAN27fVDHEiEtkNyljrAYHRESiRZBJpw+Z7sxUhI
         QEiEPD0dV7sXAy/FGKbNTmKJYpabkxzk1K4tBkiOT0rDeOzXgFZAi7frM8bcOPJW1aKC
         pSrVf2gJo92dg7G9UHS5Vzjt5d5XPSm25BXe7cU9lI9CyoWLg9Wkxq/AlOdWdHJq7NEc
         4zXYNBvCW8oOcZrwdU3PQSWpkZZJxSNagFRiijVAv+JEgM9prPcaYkCxfZYlhm7xOnzq
         wgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678794203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ooBUhVhCqisZJ8iFuqAxT4qE8PBELCGSQnXBwgwo9FQ=;
        b=zbF69G5ktYT3nYNi91Wmakqapdnzv1STF71aOg8nqmSljFTK4oS8us1pxWk7clXU0f
         RcdnABWqpDvJrL7wUTtdzAhTBpazuy9ninMUDbucbRI1R6saNp064fcpww8lXELYj/Wt
         nSpH58dv01jNQZ4ZF71NrkH09s/f5/hnbrlQzTgBoyWGhE+BeeDcGBaQK0yjGfvlK86n
         3Qzc6yEPTc8VYguHpqUxtPJCOT1aWnWXzF10csizlXYDDTPizmRBrEWE4/IzHyugEneO
         a7Y1ooK/Vw/IpFKvtoniROj4etnxLdX37HPbTXlVnEKQvC4dxLXFyYS18PDHVaIrimBN
         LQJA==
X-Gm-Message-State: AO0yUKUG4ubif6zY61tvvQoIRLmlgu/Ssa6WXQg/u5K2mcsd6waIFXW8
	rIBMLSMEjoYZIU9CUQZ5Xag=
X-Google-Smtp-Source: AK7set9RIIQlNtVhSOoG4lHHjC76XZo3/vmwVv6WFjbYYf+QoYb0pNd1mdUJwo8feqwrICAb65T/Ww==
X-Received: by 2002:a05:600c:470a:b0:3e1:bfc:d16e with SMTP id v10-20020a05600c470a00b003e10bfcd16emr13901241wmo.39.1678794202958;
        Tue, 14 Mar 2023 04:43:22 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id v7-20020a05600c470700b003ed2a458a7asm2710590wmo.44.2023.03.14.04.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 04:43:22 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH v3 0/2] media: meson: vdec: add HEVC decode codec
Date: Tue, 14 Mar 2023 11:43:16 +0000
Message-Id: <20230314114318.4057353-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This mini-series adds support for HEVC decoding. It combines the original codec
work done by Maxime Jourdan in 2019 [0] and improvements by Benjamin Roszak in
2021 [1]. Only GXBB/GXL/GXM are enabled as decoding currently crashes on G12A
and later SoCs when trying to decode a 10-bit HEVC stream.

The goal of upstreaming the driver in its current state is to encourage greater
community contribution towards adding missing features, and fixing the bugs and
conformance issues necessary to get out of staging.

The HEVC codec presented here is generally partnered with FFMpeg sources that
are being maintained by the Raspberry Pi Foundation [2] and [3] that contain
numerous improvements to v4l2_m2m (and v4l2_request) support. There is active
work in progress to refine the FFMpeg changeset and send it upstream.

Christian

Changes from v2:
- fix memory leak reported by smatch [4]

Changes from v1:
- Fix unused val warning reported by kernel test robot <lkp@intel.com>

[0] https://github.com/Elyotna/linux/commits/4.20/v4l2-m2m-pr
[1] https://gitlab.com/benjamin545/linux-amlogic/-/commits/aml-hevc
[2] https://github.com/jc-kynesim/rpi-ffmpeg/commits/release/4.4/rpi_import_1
[3] https://github.com/jc-kynesim/rpi-ffmpeg/tree/dev/5.1.2/rpi_import_1
[4] https://lore.kernel.org/r/202303120441.YFGHDOya-lkp@intel.com/

Benjamin Roszak (1):
  media: meson: vdec: implement 10bit bitstream handling

Maxime Jourdan (1):
  media: meson: vdec: add HEVC decode codec

 drivers/staging/media/meson/vdec/Makefile     |    2 +-
 drivers/staging/media/meson/vdec/codec_h264.c |    3 +-
 drivers/staging/media/meson/vdec/codec_hevc.c | 1463 +++++++++++++++++
 drivers/staging/media/meson/vdec/codec_hevc.h |   13 +
 .../media/meson/vdec/codec_hevc_common.c      |  161 +-
 .../media/meson/vdec/codec_hevc_common.h      |    3 +-
 drivers/staging/media/meson/vdec/codec_vp9.c  |   35 +-
 drivers/staging/media/meson/vdec/esparser.c   |    4 +-
 drivers/staging/media/meson/vdec/hevc_regs.h  |    1 +
 drivers/staging/media/meson/vdec/vdec.h       |    1 +
 .../staging/media/meson/vdec/vdec_helpers.c   |   44 +-
 .../staging/media/meson/vdec/vdec_helpers.h   |   10 +-
 .../staging/media/meson/vdec/vdec_platform.c  |   37 +
 13 files changed, 1678 insertions(+), 99 deletions(-)
 create mode 100644 drivers/staging/media/meson/vdec/codec_hevc.c
 create mode 100644 drivers/staging/media/meson/vdec/codec_hevc.h

-- 
2.34.1

