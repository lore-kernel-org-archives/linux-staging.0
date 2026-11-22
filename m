Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795347751;
	b=S7mtw7r27RjWCz/0aCesJINcAHeJ2dChPSYgzpwLejsXXWerxFAfzHpC/4AfobbfLl0l
	 R4455cyjlPN4RhS0Xh24HhjnOh6LNBQ2Qkv9LeJJoRHMyxprzlvP7701flD7pe/2D3uPH
	 XTvdKMUBFhCLD1K8D8MJl+Qr5w15FBmGi5AvhFeuqFjMFzxxsOfNRJOghXIvy9MHO4rS9
	 KL5ExMaT4fAO3V7LBreayV3OuzfAYMTkPeowBLjV92iDyupT1VGEuxqbrJCO7nPg31iYj
	 zXxMH22m56vMzALtTFvAubeY7PwkZ6946DBr4/VsAcGceZlQ4K42rlDHjt42ElRu/+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795347751;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=gohUQPM7rw2xA0lCUCOd6vhIwBrCwipEuEodVc6L4lA=;
	b=DIlHGCdkbHL0bkuTzfw+u8LotmgewRFaUjk4ZY9nlEsDm97oPMvvH7YqW1ylyVBD7Yq/
	 dKCGRYeF+/f9/2bkx2R61lGbsMmKzTd70kC+ju+/Af7BiEkymlXQWl2RXrzlcKzfFJSLC
	 pm93DZ+qcHLWwDLbbxmJzjuZSKWwbRPoc8IA5kdLPEAGq/msmInvkjNr2gtNle47IML8q
	 BZuWu9LNJmffv4G3vrMzY+AjDsSRz9K2uJlBU+znKrMAokNeeLEmzBenMtjOcFlcRTZ7u
	 EFu9QyNcouiuykRfZibf8LZQ2w0LrQ/aV8NOwOe4GrkKuyEd2bHggFNth+ebLFsEFeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=mP7HNCcl;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB03E606A320;
	Sun, 22 Nov 2026 11:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB03E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=mP7HNCcl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=go
	hUQPM7rw2xA0lCUCOd6vhIwBrCwipEuEodVc6L4lA=; b=mP7HNCclDkJ5dWMJo4
	GRhUVrfZjt39TuTYr0zTn6f9ypqx5LfeX0wdBXnpTk9xeqoGKfydeaOOCtqll4r0
	LetEdpEd2i1OBhk0BpOLeyHcoNEjsT6A1EQaVprZxTik5sCLJhqdEhHPFhA1C1aC
	sOPCTUiuE0HkgcaHIZFRRpcgw=
Received: from Ubuntu26.04LTS (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3H6YN1QJrHreuJQ--.55539S2;
	Sun, 22 Nov 2026 19:42:06 +0800 (CST)
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
Subject: [PATCH v6 0/2] media: imx: staging cleanup and FIM export to v4l2-core
Date: Sun, 22 Nov 2026 19:42:03 +0800
Message-ID: <20261122114205.494704-1-shijiaqi_develop@163.com>
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
X-CM-TRANSID:_____wD3H6YN1QJrHreuJQ--.55539S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF48uw1rtFyDXw1xZw4rAFb_yoW8tF17pF
	4Fkw4akrWxJFsIvrnrJ3W7XF98X34rCay3K347X34F9FyrAF97Xw18Ka4UXr90kr97Z34a
	vFyYqrW7Wa1jyF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRBT5dUUUUU=
X-CM-SenderInfo: xvklyxpdtlsvxhyhz0rs6rljoofrz/xtbCzQ7TJ2sC1Q5-3AAA3m

Changes in v6:
- Apply the IC route format selection consistently to pixel-format,
  frame-size, and frame-interval enumeration as well as TRY/S_FMT.
- Keep the remaining STD and frame-interval legacy ioctls unchanged.

This series continues the i.MX staging media driver cleanup by removing
legacy control inheritance and source-dependent format handling from
capture video nodes, and exports the generic Frame Interval Monitor to
v4l2-core while retaining the i.MX input capture controls locally.

The new FIM files are already covered by the existing MEDIA INPUT
INFRASTRUCTURE entries for drivers/media/ and include/media/.

Validation:
- allmodconfig build and sparse
- scripts/kernel-doc -none on the FIM header and implementation
- local FIM KUnit tests, not included in this series: 13/13 passed
- local white-box i.MX capture format tests, not included: 21/21 passed
- QEMU vivid: v4l2-compliance 125/125, 30-frame streaming passed
- QEMU vim2m: v4l2-compliance 49/49, 10-frame streaming passed
- i.MX register-level and hardware DMA paths remain untested

Jiaqi Shi (2):
  media: imx: remove legacy video node control and format handling
  media: v4l2-core: add frame interval monitor helper

 Documentation/admin-guide/media/imx.rst       |  20 +-
 drivers/media/v4l2-core/Kconfig               |   4 +
 drivers/media/v4l2-core/Makefile              |   1 +
 drivers/media/v4l2-core/v4l2-fim.c            | 385 +++++++++++++++++
 drivers/staging/media/imx/Kconfig             |   1 +
 drivers/staging/media/imx/TODO                |  13 -
 drivers/staging/media/imx/imx-ic-prpencvf.c   |  10 +-
 drivers/staging/media/imx/imx-media-capture.c | 401 +++++++-----------
 drivers/staging/media/imx/imx-media-csi.c     |  10 +-
 .../staging/media/imx/imx-media-dev-common.c  | 113 +----
 drivers/staging/media/imx/imx-media-fim.c     | 361 +++-------------
 drivers/staging/media/imx/imx-media-utils.c   |   9 +-
 drivers/staging/media/imx/imx-media.h         |  11 +-
 include/media/v4l2-fim.h                      |  57 +++
 14 files changed, 680 insertions(+), 716 deletions(-)
 create mode 100644 drivers/media/v4l2-core/v4l2-fim.c
 delete mode 100644 drivers/staging/media/imx/TODO
 create mode 100644 include/media/v4l2-fim.h

-- 
2.53.0

