Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59996FA1;
	Fri, 24 Mar 2023 15:12:47 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C2396E0007;
	Fri, 24 Mar 2023 15:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679670760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uEOh0qZu1a2y7GIksVmAUhkUm9kTU1yLtPR9HJ3ihj8=;
	b=B5BnTzisW50LzspF5O2jxGpSPr1Nxkx+49UiHLF0VjP3w5CkLT5bKVsyuR1ENRXgD+XZbW
	eggTwlU2IsiUqMvICT7jzFRVg1kgvztD13zs+EzZskvCb2LMBB1PccWz/lOUATSkobuCSs
	fwjDf2vkSI6yaG1aK1HQO1M5BDZfsNkXF6C6eNor5V1b9cnmlQM+HqoqgcI9kNZ5hzEfG6
	ffUTbOlGIhVQnY3nxMnVOqjY6a0AXkGmd3yocYHIyf+LLcgMGZqMeMe8BUR4vqrd5fjHIk
	B8Cp1kRst2DDlY5D81NpLGS5Fg39IrAat7cgjyGJpXaJ68xulkdPpfZd1EjyTQ==
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Adam Pigg <adam@piggz.co.uk>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 0/9] media: sun6i-csi/isp: Implement MC I/O support
Date: Fri, 24 Mar 2023 16:12:19 +0100
Message-Id: <20230324151228.2778112-1-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is a follow-up to Adam Pigg's "suns6-csi changes to support
libcamera" series, with the same purpose.

As discussed in the original thread, it takes a different approach
and ensures input/output format matching is maintained without
regression.

New v4l2 format info is also added about unusual formats used by the
driver so that no specific logic is required to handle them.

The same functionality is also added to the sun6i-isp driver.

Paul Kocialkowski (9):
  media: v4l2: Add RGB565X pixel format to v4l2 format info
  media: v4l2: Add NV12_16L16 pixel format to v4l2 format info
  media: v4l2: Introduce compressed pixel encoding definition and helper
  media: v4l2: Add JPEG pixel format to v4l2 format info
  media: sun6i-csi: capture: Rework and separate format validation
  media: sun6i-csi: capture: Implement MC I/O with extended enum_fmt
  media: sun6i-csi: capture: Implement enum_framesizes
  media: sun6i-isp: capture: Implement MC I/O with extended enum_fmt
  media: sun6i-isp: capture: Implement enum_framesizes

 .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 157 ++++++++++++------
 drivers/media/v4l2-core/v4l2-common.c         |   6 +
 .../media/sunxi/sun6i-isp/sun6i_isp_capture.c |  35 +++-
 include/media/v4l2-common.h                   |   7 +
 4 files changed, 154 insertions(+), 51 deletions(-)

-- 
2.39.2

