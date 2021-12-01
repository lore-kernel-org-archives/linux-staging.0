Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A776668
	for <linux-staging@lists.linux.dev>; Wed,  1 Dec 2021 01:33:39 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id z26so28638542iod.10
        for <linux-staging@lists.linux.dev>; Tue, 30 Nov 2021 17:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z6+Hsl2E7Fnoefi4agcFRg7vLMjgK5Iu6TjBvSeyeqU=;
        b=i+kUWaVqqQZG9C824ctJ3vKTiwSiGEPuzWPmD6nxB1isjgMBq9ueQVb2J7WGfUoOsP
         dAokJBh1JXTjMUA107+TkDuGzB7CfvcQkFrZiGrOVchE9y4N2Tu7JXfjuNqCRrmFnEM4
         /R+zMMiycEZBYYqbQzW+hPEIUvCVcmnwGlRLsuDjU6+s0rNjIZSWYlD+rARVK5XDDADQ
         MAY7uj621/0AaiL1xZg8GyVdhpLD3CyrqiGBBC4xlT5w9b+TwkYPgRsP9/GIY52vUP3I
         biMS4DaVlzka/KAJ3UeGvDjmSDp4FeFxiFGkHEbLhRDVAA6oz8Cc5CJzImWZga6sEkLD
         s1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z6+Hsl2E7Fnoefi4agcFRg7vLMjgK5Iu6TjBvSeyeqU=;
        b=r2JWJtgrfzprnt6EKOoyoBX8PryvBYYWSDqemwTq2HgwbCCHQ+sq+JbX5niJOWQD7q
         rq1l+dnqRDNsTujkoblgZSfaN78ZE2zpdJx+2o7Fboq9Ucsq2pEWyecu1WlZjQRNmn7L
         mpK8csoZg3bdYjGrXlqTlniPVxw/WkDfJjzNaLx3BZCgbBp25XX4HHgFBq2i0KhhCQm7
         6Va5L/nMVK0c6RaxoNbmMKi0VwfVvIpb/drLlOqrQDoh5Q8W7YNhJqf1U9FlBM1u8xlE
         IJ+NMRPvWyWifbdx6rOJsbAvRpkL9uA7mW1Kaci6LPJ0R8zmn/uuPs6JFuBM5WoHQnKg
         MY5w==
X-Gm-Message-State: AOAM5316s+2GMwBad5RmfDizh6HO4esIn6aIuUULJ86u/ocOqYn8YobN
	0jIApdP94O1Fkk0OAF1pwAM=
X-Google-Smtp-Source: ABdhPJyW+HrcS0ZmOpkgFwvWGKGW6/Hwc9Osh0IEW7UhpCwjn64FvGv3Cn9B4lISIyqF86IIatHz8w==
X-Received: by 2002:a05:6602:2e81:: with SMTP id m1mr4265751iow.55.1638322418535;
        Tue, 30 Nov 2021 17:33:38 -0800 (PST)
Received: from aford-IdeaCentre-A730.lan ([2601:448:8400:9e8:b7ee:f768:f33c:c028])
        by smtp.gmail.com with ESMTPSA id u24sm11856737ior.20.2021.11.30.17.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 17:33:38 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-media@vger.kernel.org
Cc: ezequiel@vanguardiasur.com.ar,
	hverkuil@xs4all.nl,
	tharvey@gateworks.com,
	nicolas@ndufresne.ca,
	aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: [RFC V2 0/2] arm64: imx8mm: Enable Hantro VPUs
Date: Tue, 30 Nov 2021 19:33:27 -0600
Message-Id: <20211201013329.15875-1-aford173@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i.MX8M has two Hantro video decoders, called G1 and G2 which appear
to be related to the video decoders used on the i.MX8MQ, but because of
how the Mini handles the power domains, the VPU driver does not need to
handle all the functions, nor does it support the post-processor,
so a new compatible flag is required.

With the suggestion from Hans Verkuil, I was able to get the G2 splat to go away
with changes to FORCE_MAX_ZONEORDER, but I found I could also set cma=512M, however
it's unclear to me if that's an acceptable alternative.

At the suggestion of Ezequiel Garcia and Nicolas Dufresne I have some
results from Fluster. However, the G2 VPU appears to fail most tests.

./fluster.py run -dGStreamer-H.264-V4L2SL-Gst1.0
Ran 90/135 tests successfully               in 76.431 secs

 ./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0
Ran 55/61 tests successfully               in 21.454 secs

./fluster.py run -d GStreamer-VP9-V4L2SL-Gst1.0
Ran 0/303 tests successfully               in 20.016 secs

Each day seems to show more and more G2 submissions, and gstreamer seems to be 
still working on the VP9, so I am not sure if I should drop G2 as well.


Adam Ford (2):
  media: hantro: Add support for i.MX8M Mini
  arm64: dts: imx8mm: Enable VPU-G1 and VPU-G2

 arch/arm64/boot/dts/freescale/imx8mm.dtsi   | 41 +++++++++++++++
 drivers/staging/media/hantro/hantro_drv.c   |  2 +
 drivers/staging/media/hantro/hantro_hw.h    |  2 +
 drivers/staging/media/hantro/imx8m_vpu_hw.c | 57 +++++++++++++++++++++
 4 files changed, 102 insertions(+)

-- 
2.32.0

