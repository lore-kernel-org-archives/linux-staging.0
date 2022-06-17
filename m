Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C752F25;
	Fri, 17 Jun 2022 11:58:12 +0000 (UTC)
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:faf2:1a12:f903:cc5e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 54D35660179A;
	Fri, 17 Jun 2022 12:58:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655467090;
	bh=bmkptHQUlkkCdHC5ksCT9Ab01Sj/lrYkZJFYy5abr5o=;
	h=From:To:Cc:Subject:Date:From;
	b=frdPQspHObR+qQp+aMt1vMTPsEKhPxUimVzD3mf5lVBRs4QpJILObfMH9YhyawfbW
	 nJNWbZDKAyt+ILWlmeWko/eNcjEvZHSqxP+GkHvNGH64PzofVTk+ZvMud6k6eZ31cl
	 sOXt8FDUjoG10MYruAk3U9q9T6h0rQKaljoCUsSoWQOhmHxzzhci6elqRH6irsqBkY
	 CU0Z6FtviZPJDxraRylHumnwPDVIvTnZ6srn8EVQY/yoLv3fXbWRbssXUTRS3P5hYh
	 9JFlp1J6cukoY65uaZNzwj8tgCPIA50GPGshdvjNOn2/leQux2HSTsi/LMRyy/UNNd
	 A4bzxH0yF1Juw==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	mripard@kernel.org,
	paul.kocialkowski@bootlin.com,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	nicolas.dufresne@collabora.com,
	andrzej.p@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH 0/7] Enable 10bits bitstream for Hantro/G2 HEVC codec
Date: Fri, 17 Jun 2022 13:57:55 +0200
Message-Id: <20220617115802.396442-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is based on top of Jernej series: "media: hantro: Add 10-bit
support" v2.
Jernej series is focusing on VP9 and hardware block with legacy regs.
This one add 10bits support for newer hardware blocks (i.e without
legacy regs) and for HEVC codec.

It based tested on IMX8MQ with HEVC conformance tests.
The results are that all 10bits bitstreams are OK.

Benjamin Gaignard (7):
  media: hantro: Store HEVC bit depth in context
  media: hantro: HEVC: Fix auxilary buffer size calculation
  media: hantro: HEVC: Fix chroma offset computation
  media: hantro: postproc: Configure output regs to support 10bit
  media: Hantro: HEVC: Allows 10-bit bitstream
  media: hantro: imx8m: Enable 10bit decoding
  media: hantro: Allows luma and chroma depth to be different

 .../staging/media/hantro/hantro_g2_hevc_dec.c |  4 +--
 drivers/staging/media/hantro/hantro_hevc.c    | 13 +++++----
 .../staging/media/hantro/hantro_postproc.c    |  7 ++++-
 drivers/staging/media/hantro/imx8m_vpu_hw.c   | 27 +++++++++++++++++++
 4 files changed, 40 insertions(+), 11 deletions(-)

-- 
2.32.0

