Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.250.56.165
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623951;
	b=RVyEjUkFGaiociU22fZnr5B4svTT5pGdLCb/H2WzfzDJV25NLCpR/niuRHdsqaW6vIJn
	 ntoCgucLY/wSULx0DV1yQluyou+I88x5GLgCETCmjnGZ3kiCuACb2AK6cFBQRKffxWeRi
	 dcFPaczFh8Zc5ke2oKJh8BwGWSl5eplQQuGwDi2tvJEJjbC52QAefK6ZkgalTQFzefiND
	 FhgYbvAV0cY1Aso25SSsNKG8BYeZYygt1JDlvxhFskEkmDahkbgylEu0xcMhOlJLH0q4k
	 1MpzEQ2UuY4UEJaEyL9dNnRJlmhoDe99jOp7HcyU0Y5h9YAT++byfpA6cxyiAzq02ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623951;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=+YRXx6QbkPty6llsFxUMyoQ+8oEYhrUtUmf5vBk/zCY=;
	b=2PjZ+jMD9WGlKawMSUjNw5aR+z4UbZJHsA0y6z/1+m51EnSIOCbG4QMyd3rm0BHEsBe8
	 NLfr8IVdSAJHYdf4m8r+NKFWGM031Ex4G0v44qc218q8Hv2q/b4XrFxMKkEwuQfGX2rtI
	 Gd3FQzXyP+Ip/Sh0G3J2Z/12ljvv+MnGS2Cp/LmgeEzMyLROF5aL584o7BJN/v1llu4kt
	 FlXfqSZucgFXossCy4GgW2e25fcY+m1j9Oy4WLdI4NAl/+od329rFuzwHIp+HSPfwDHfT
	 dHTu7PVCGfe8zvOlcRwY76mXMlFJx1ZwNdI9zPU1a+2QUbpvWrhh28BAl9+1Vi8m8oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideco.ru;
	spf=pass smtp.mailfrom=ideco.ru;
	arc=none smtp.remote-ip=51.250.56.165
Received: from smtp.ideco.ru (smtp.ideco.ru [51.250.56.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925C1606A324
	for <linux-staging@lists.linux.dev>; Mon,  2 Nov 2026 12:52:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 925C1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ideco.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideco.ru
Received: from [169.254.254.254] (localhost [127.0.0.1])
	by smtp.ideco.ru (Postfix) with ESMTP id 7133238BCB;
	Mon, 02 Nov 2026 17:52:22 +0500 (+05)
Received: from laptop-ak.in.ideco.ru (unknown [46.36.23.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.ideco.ru (Postfix) with ESMTPSA id 3DD3F32EA5;
	Mon, 02 Nov 2026 17:52:12 +0500 (+05)
From: Andrey Karelin <a.karelin@ideco.ru>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrey Karelin <a.karelin@ideco.ru>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH 0/3] staging: media: av7110: check demux and net initialization in av7110_register()
Date: Mon,  2 Nov 2026 17:51:28 +0500
Message-ID: <20261102125149.82725-1-a.karelin@ideco.ru>
X-Mailer: git-send-email 2.56.0
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

av7110_register() ignores the return values of dvb_dmx_init(),
dvb_dmxdev_init() and dvb_net_init() for both the main and the optional
budget-patch demux. On failure probing continues with half-initialized
objects, which leads to NULL pointer dereferences on first use or on
device removal. av7110_attach() does not call dvb_unregister() when
av7110_register() fails, so with this series av7110_register() unwinds
what it has set up on its own.

Andrey Karelin (3):
  staging: media: av7110: check dvb_dmx_init() result in
    av7110_register()
  staging: media: av7110: check dvb_dmxdev_init() result in
    av7110_register()
  staging: media: av7110: check dvb_net_init() result in
    av7110_register()

 drivers/staging/media/av7110/av7110.c | 49 ++++++++++++++++++++++-----
 1 file changed, 40 insertions(+), 9 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0


