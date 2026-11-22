Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795310967;
	b=f7gG2GPfGQmtl/EaxeJ6txl+h1rvxVZo6Nojlbb4OZuwJyBJwYRN7Oq1XPWl+/DvqlSn
	 CUv3sbn9vsDwdggUDB77S+mSoUU/DkwPChRMPuDHNCLq/B0ssfLqDzbCG5EGrfBr+MxJR
	 ZDRwMdc+L+Xvvej+uFd7o/2KrysCiQPA+XbvYsjUIeBixCIVbzBx5QNrU3xPNZdashHxy
	 DOKDzUmvkvj+5mtvUNkj9/hj1CkAHMGOcOlxzfSTn24Q0gY+NGcQKxtO2tXLIOH1RqcHM
	 C3ZvaI36FWWAdw5bKcM0ZDbfSQ9wU+Ml/6lxio3eqhLwoYOKSOtziUiMKfS2iKvI9xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795310967;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=Z70PYIui9VEuOne7HdVafDOBCOxQ+P2TK6HaLLeEkro=;
	b=S14PaxW+ripIK8Bqt0z0Mm4F18HHd6whZYx/IzV3DHdLLasM/H5uZKfDAvij4pgFIGJj
	 Fd41zx2iK6htr1TNXD2+R396DiHYxss/d5gOWwwbqUiA69s8bZUOF4d18RaFosh1otYai
	 F6gR+Hvlg49I69obXbuFGMxHf6Hw7R8yiibfaP/O2aEFNvfMR9InJ7cbFmSPd2Y442pIx
	 7BCp3sqA7ICacXUm/Vs8IODpiHJVhsATEQr3sZfVo7PlFXKDj3L0Xc6X5yVsSqM2PfeP0
	 bZc+dt12FSQFHhN+4r9NSWPAbGPFXbcMtN42ZedRCyPWeYcWGld/tXeifoCRDKNe5pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=nlfrXUKS;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2E2606A320;
	Sun, 22 Nov 2026 01:29:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C2E2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=nlfrXUKS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Z7
	0PYIui9VEuOne7HdVafDOBCOxQ+P2TK6HaLLeEkro=; b=nlfrXUKSjGO4lqiqg0
	k49xEJjZkR9GUyu+gnNXvcUxcuxd5fJQtJBhI1NHNQLj4jh7K83ALwO6jdeBDzBV
	BkE+CJRdC7z6fKfnwOenkEcPJP6tQDMqO4P++JZS+a7LV/cg9qpi0j/Pt7R6mXWA
	MGnb0FCFx897myF5Jd+YXbQsE=
Received: from Ubuntu26.04LTS (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3P_FiRQJrGE4QKA--.56681S2;
	Sun, 22 Nov 2026 09:29:07 +0800 (CST)
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
Subject: [PATCH v5 0/2] media: imx: staging cleanup and FIM export to v4l2-core
Date: Sun, 22 Nov 2026 09:29:03 +0800
Message-ID: <20261122012905.436504-1-shijiaqi_develop@163.com>
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
X-CM-TRANSID:_____wD3P_FiRQJrGE4QKA--.56681S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCw1kCry8WFW8Jr15Kr4xtFb_yoW5Gr4UpF
	4Fyw1akFWxJFsxZrnrJ3W7XFy5Xa1fCayag39rX34F9ryrAF9rJw18Ka4UXr98Gr92yw1a
	vF1Yqry7Wa1jyF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRcyCJUUUUU=
X-CM-SenderInfo: xvklyxpdtlsvxhyhz0rs6rljoofrz/xtbC8APEGGsCRWP+8wAA3t

Changes in v5:
- Use the source-independent frame-size enumeration for legacy capture
  nodes as well, instead of pairing generic pixel-format enumeration
  with source-dependent frame-size enumeration.
- Restrict IC capture format enumeration and fallback to YUV/RGB formats;
  CSI capture nodes continue to support the full format set.
- Keep the remaining STD and frame-interval legacy ioctls unchanged.
- Add kernel-doc for the public FIM configuration and helper APIs,
  including ownership, callback context, and locking rules.

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
 drivers/staging/media/imx/imx-media-capture.c | 391 +++++++-----------
 drivers/staging/media/imx/imx-media-csi.c     |  10 +-
 .../staging/media/imx/imx-media-dev-common.c  | 113 +----
 drivers/staging/media/imx/imx-media-fim.c     | 361 +++-------------
 drivers/staging/media/imx/imx-media-utils.c   |   9 +-
 drivers/staging/media/imx/imx-media.h         |  11 +-
 include/media/v4l2-fim.h                      |  57 +++
 14 files changed, 672 insertions(+), 714 deletions(-)
 create mode 100644 drivers/media/v4l2-core/v4l2-fim.c
 delete mode 100644 drivers/staging/media/imx/TODO
 create mode 100644 include/media/v4l2-fim.h

-- 
2.53.0

