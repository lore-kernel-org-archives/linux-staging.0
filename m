Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097193;
	b=JxnZrKPu7tXLUxH4rfYvQ02X2px8Ez2UZ01FdXP2NrBQjn7PtFH9dSIF48Y/48idgCIe
	 lRjkGe4ttbXvW2owGkcTnKFWMcxlBrHn5Ak+avXtSOrXQ/ze+vfbYhx7HdFYlrYhsdIAI
	 BnXgujLFB9l/rmaBNC4EF///rDrfOJJB5hTpwwMbtNLaceUaJyJvygUZk0GEvU79VNjND
	 VpLFrN629kyDO0q6ozKZHQbxghQkLoW1g3MnnkHsg+X8PhpMUpnJ/UKdKt2EQhuwyV8La
	 nYLuAuTZxKEeBNd5CdFa5HYlQO/JBDR1Gqc5hd0gTBmjv7H3LnKHk//yCPTPPdO7OyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097193;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=pO4KNAHeuPv/htSefOg3laqpMQME6yeGcrgpe//lcj4=;
	b=idPVBgwe9LXH20P1LFlH1B+NtNFG7ncMnUPkGiVGW6AmzSzWEPmTyv8d9GZUFWMpXHOX
	 cHXLNCak5uQ/EHKrFRT6D+OeL+4DQa3TJETEPVA7dfsnVcM3tnc9FfT40/NqoEdPf17I5
	 zjAv4EZV2Zb710199SMXD21v2dGcVtQuYVYZ56wVoVRJuj02DTFGL893GyWyK+4O/mnxY
	 h+wyHIcimyb/M3T3jwaJ4T322i2Pfi0eQGXL8jRWtotHVi/a5yT1BDROdl76P2ltdj7oI
	 pYs2HAyNDXEGa/7X9PD0UpelOaX3yHzRujcsacSRItMWxR4KeWRmmhnX2269lyrwLYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=b99lcHHk;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D861606A320
	for <linux-staging@lists.linux.dev>; Thu, 19 Nov 2026 14:06:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D861606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=b99lcHHk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=pO
	4KNAHeuPv/htSefOg3laqpMQME6yeGcrgpe//lcj4=; b=b99lcHHksvwHj/Wi0O
	CoJnFVqeoKnrBpRMaIglG9exX0Vsk6vaTvA2LVYS0fSPiSoc9zN0NKVZxj8lZeu7
	nziEgvl93guZR2RJ3+nMJ79Uz2j2h5Dqdl0zbJtSgC6maKwjC3XrBAZ9uq0t4SpA
	oVgjz8jydK9QAGWm1xF5NC+7w=
Received: from Ubuntu26.04LTS (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDnb6hdAv9qLxZ+Gw--.50288S2;
	Thu, 19 Nov 2026 22:06:21 +0800 (CST)
From: Jiaqi Shi <shijiaqi_develop@163.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiaqi Shi <shijiaqi_develop@163.com>
Subject: [PATCH 0/3] staging: sm750fb: remove dead code and redundant definitions
Date: Thu, 19 Nov 2026 22:06:17 +0800
Message-ID: <20261119140620.169368-1-shijiaqi_develop@163.com>
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
X-CM-TRANSID:QCgvCgDnb6hdAv9qLxZ+Gw--.50288S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZr4UCF4fCw47CrW3Gw13twb_yoW3Zrg_XF
	y2kF1xGr1qk34xJr4UWanxtFy7XayxX340kF1UK390yrn3JFZ5WryDAw47ZF93ZFWrK3ZF
	v3yrXFyfAF1vyjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRXTmhUUUUUU==
X-CM-SenderInfo: xvklyxpdtlsvxhyhz0rs6rljoofrz/xtbCzh4yhWr-Al44awAA39

This series addresses part of the cleanup item in the sm750fb TODO by
removing dead code and a redundant definition:

- an unused MHZ macro;
- struct fields that are never read;
- a duplicate SM750LE_REVISION_ID definition.

Each patch was build-tested with W=1 on arm64. Sparse checks were run
without warnings. No hardware runtime testing was performed.

Jiaqi Shi (3):
  staging: sm750fb: remove unused MHZ macro
  staging: sm750fb: remove more unused struct fields
  staging: sm750fb: remove duplicate SM750LE_REVISION_ID definition

 drivers/staging/sm750fb/ddk750_mode.h |  2 --
 drivers/staging/sm750fb/sm750.c       |  2 --
 drivers/staging/sm750fb/sm750.h       | 15 ---------------
 3 files changed, 19 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0

