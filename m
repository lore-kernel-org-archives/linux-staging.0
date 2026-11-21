Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795284064;
	b=t3Oe/20wntNMhxbRUCZ7aenTmtd0+MrKh52fiRIZvRu1Cos+j8BV41xUHxUaqybCEFwf
	 nPIKKIcoZw8ZGh5aRvvFqU03rSGNQKI3xIClkx7iEpe6CzFjInuY3JiImSxCJQvJIsHVv
	 1Ec3wm3vQNCqYR9Shn8t7oygE31T4rhuWHr8JpC2Cnkba3jUhbJRyGWhSDJOzrjf0Eg4r
	 tkjOmURN62EKw5wPmbFNnzvs8CL436Dl6npOSvE0NjR4uqnBW+MHWMSqH8s3XS1KmSIK+
	 J86qCmc8kVDARtsg2GLko4eq32ozkIWaUefMcS1UjEP4qGOPfYI9n5FlrYGhjE+PdIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795284064;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=gD94HvPiLO8Y6Pw1MEfxnz4cRxg1ZVaiRR8Hpdtd62o=;
	b=4gRWjd03sx0kjnJK8+u0RYk/DDmnj0O8WCbD/RRR9QI+9QOJ82lAoS6bUdwF4gWS/ydx
	 6g6kwhnSj28XVdvDDU0F8nCbwO7JqTuCVrh44eb6VUg3Z/fs3tpXLFRIcMi65KTssjaeQ
	 sas4ZaOC2kAsGEEdui3GZXwis2L4wRBS8UzGDta3r8GzvddoMU003qm1FYQrD6HP3lBzD
	 Gb8+b6B8Kt9ZyzdAqLCA7XhtZYFj+xZ25/C7+f1MlgB7DSmMmaGb5TZaXhAIFLXPLP1s9
	 2oigpmDZB9TxHk58RvijJw842vKWKDtM0C7E1g8NRjoarSz5NPMpTZROgHu6f0FI8tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=pEuRXVFq;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EB0606A32C;
	Sat, 21 Nov 2026 18:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9EB0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=pEuRXVFq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=gD
	94HvPiLO8Y6Pw1MEfxnz4cRxg1ZVaiRR8Hpdtd62o=; b=pEuRXVFqh1BDeCn2/b
	G54m7XRnJBtWRklbRPPiTI4gWv2CwBtxlPCWkViAqEPh/2G9pi9PZU+eH8BEeCtY
	HPx0wcWQHZzAAz8a1NV7gF2yam24nrxEzjJPX9DCl9B6sNxsMNh9htulvqYd6xeB
	/WivmrdOzakWGVKCFb/phIlgg=
Received: from Ubuntu26.04LTS (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3H6JM3AFrlIBEIg--.35728S2;
	Sun, 22 Nov 2026 02:00:45 +0800 (CST)
From: Jiaqi Shi <shijiaqi_develop@163.com>
To: linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-staging@lists.linux.dev
Cc: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	Frank.Li@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Jiaqi Shi <shijiaqi_develop@163.com>
Subject: [PATCH v3 0/2] media: imx: staging cleanup and FIM export to v4l2-core
Date: Sun, 22 Nov 2026 02:00:42 +0800
Message-ID: <20261121180044.424315-1-shijiaqi_develop@163.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3H6JM3AFrlIBEIg--.35728S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAr1xAw18trWrCF1rGFy5twb_yoW5GF1UpF
	yF9w4akrWxJFsxCrnrJ3W7JFy5Xw1fGayYg3srX3409w1rAasFqw48Ka4UJr90k3s7Z34a
	vF15Xry7Wa1jyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zMSoXUUUUUU=
X-CM-SenderInfo: xvklyxpdtlsvxhyhz0rs6rljoofrz/xtbCzg1luGsB3E056gAA32

Changes in v3:
- Add the missing struct v4l2_ctrl forward declaration to v4l2-fim.h.
- Validate exact media-bus-code/pixel-format pairs without falling back
  to another format, while preserving the intentional Y10/Y12 to GREY
  clamping supported by the CSI driver.
- Use 64-bit arithmetic for image size calculation and reduce the height
  when necessary to fit the 32-bit sizeimage field instead of failing.
- Sanitize ANY/invalid field values and validate field compatibility with
  the source at stream start, including IDMAC interweave field ordering.
- Default RGB formats without a media bus code to full-range quantization.
- Keep legacy_api enabled for the remaining STD and frame-interval ioctls;
  removing those interfaces is outside the scope of this cleanup.

This series continues the i.MX staging media driver cleanup by removing
legacy control inheritance and source-dependent format handling from
capture video nodes, and exports the generic Frame Interval Monitor to
v4l2-core while retaining the i.MX input capture controls locally.

Validation:
- allmodconfig build and sparse
- local FIM KUnit tests, not included in this series: 13/13 passed
- local white-box i.MX capture format tests, not included: 20/20 passed
- QEMU vivid: v4l2-compliance 125/125, 30-frame streaming passed
- QEMU vim2m: v4l2-compliance 49/49, 10-frame streaming passed
- i.MX register-level and hardware DMA paths remain untested

Jiaqi Shi (2):
  media: imx: remove legacy video node control and format handling
  media: v4l2-core: add frame interval monitor helper

 Documentation/admin-guide/media/imx.rst       |  20 +-
 drivers/media/v4l2-core/Kconfig               |   4 +
 drivers/media/v4l2-core/Makefile              |   1 +
 drivers/media/v4l2-core/v4l2-fim.c            | 331 ++++++++++++++++
 drivers/staging/media/imx/Kconfig             |   1 +
 drivers/staging/media/imx/TODO                |  13 -
 drivers/staging/media/imx/imx-ic-prpencvf.c   |   7 +-
 drivers/staging/media/imx/imx-media-capture.c | 326 ++++++----------
 drivers/staging/media/imx/imx-media-csi.c     |   7 +-
 .../staging/media/imx/imx-media-dev-common.c  | 113 +-----
 drivers/staging/media/imx/imx-media-fim.c     | 355 +++---------------
 drivers/staging/media/imx/imx-media-utils.c   |   9 +-
 drivers/staging/media/imx/imx-media.h         |   9 +-
 include/media/v4l2-fim.h                      |  41 ++
 14 files changed, 573 insertions(+), 664 deletions(-)
 create mode 100644 drivers/media/v4l2-core/v4l2-fim.c
 delete mode 100644 drivers/staging/media/imx/TODO
 create mode 100644 include/media/v4l2-fim.h

-- 
2.53.0

