Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792823213;
	b=3a7fAN6OhJnG5PqS6LU2Wq4HJwhh98NbF7GbipoIG7s85F935LqXMs3Vwt9SPbhtNelX
	 UZu8Mje54lKVdaAkmEruACJaG0W5SQHol44GJAX+T85ukLuzuip5iRy4vn1C2k68JquIK
	 p8/cFt0zFhISkEBSq+qcO2TW/VrV1R1z7x6KZGOre+7rzpAjjMAwC3189ID9RvBik9Hzs
	 yDInNd9AXnVXcNf+iDZCsyFd8pbAhL66y82I0QrfC9LcuZhx8Vcx0gGJ3Ok6Tf9DWQBWi
	 JKLZn9CtJ6Jd5Zsz23zVuPzpHIsIR4lWQ4IzWR2yGy5ttjEt6rEv7wz+MrUXbeolpKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792823213;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3dfXsHIx+qJkR+5uXKkJ3gQP9AEFIpvibHUA1XRLtBQ=;
	b=IVjhWId29aTjvvqkT7kF5RxE/LgS9K2Kc+NqQ5zadZxsUtYqo97/0PNu2MGqIEIzYzhl
	 6aox3AV9fshO6/tY5l8s9lJX8PVIbRigsK701DV+AHOHgqHDsB94xajWpQcWccXGiYz9X
	 vJruLuvKfOdXrFXndgSi36k1WFju7SrIysgQTnenao9nlByfmNcan31ymsGtXFTidqVAD
	 7YGpDsMxK0Rq5YkPsMy5U/OY0yrKGv9O6XKI4a7ZK5gBmZLh+P+dktv+Vl2P7y+VTYFSL
	 tnzhpRHuzFQ5Fu5/lcr1SBsIvz/J2CaLLD3vbBQ/CRvJQg6p1wfUYg7f7kUTk/HGeVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=cvDu7rvz;
	arc=none smtp.remote-ip=162.62.57.137
Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6121C606A31A
	for <linux-staging@lists.linux.dev>; Sat, 24 Oct 2026 06:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6121C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=cvDu7rvz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792823207; bh=3dfXsHIx+qJkR+5uXKkJ3gQP9AEFIpvibHUA1XRLtBQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cvDu7rvzs4dbcVK8uT3xuMXE1MXRenOmk454PKt/wgCqKX0Zvz9uSR8zE6MwjjYwR
	 FxJWB0b3Z9Y6O9kGXhGh0paE1LX6qCWcoqgmuaDxbdLrvK5t3QZ7+Ggab/a7fMgXaF
	 6rgbI9NXcDKcwYcszuBXDylJN9iVKXln8MtgJnsI=
Received: from shuai-VMware-Virtual-Platform ([223.88.55.4])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 6AC14226; Sat, 24 Oct 2026 14:26:44 +0800
X-QQ-mid: xmsmtpt1792823204t5c8mnqo6
Message-ID: <tencent_891D4BBA91A54CFEA4290B57500C6282CD05@qq.com>
X-QQ-XMAILINFO: OIJV+wUmQOUA9s8P96OURdLMYK3Urot70WCfiw15QVosDMg1g4NdR6Vec90z61
	 hUWVknOMnCToh3PoGM2Og2wgpSuRE6njryUYpzxntFbMaaEs05vPRteLKVOANFcXR06uo5ae0jbX
	 1mRGIgLWdRqbRr3c8DTJ+97K4x8yvuWVLE4XOtfSZo5LfsAexaOoRvf5pfgTJYRRWGwVIyWxIW3Z
	 SGSsXNlY7MLKjdsiCgJT+zXPqI5jUhqHydbTC4Rwp9JDsOHkaF7DrhuTWJTCKs+Zq4OOJ2Bu/p9+
	 beuiEA8KU7GraW4Z9t4JWuQWRm21OXn5/sEw4L1VMrUFd58YgdqyBD/SH8LG4WZEmsfy91dtCU2R
	 U9jdXDz5ZkTpm0VDc+y0qtZofU5I2VvD9vG6rbuuJ3ZPVJZFI75ddQJ3BLnZuLd3EGiS0zJ3CuJv
	 Sg3zNb6Z7gl+YjehondWOKY6cYDMPgHETYDZF0uHw3HIuY8EjqcKeJHuEK1e3+A85zTR3TmF8aEz
	 x9Yobzo7SkrZVEgdh7mpIVXgprahBH9I7ZAvm4ymXiXZbbACKURhdleysNieAPrWmhPnpghUKNJY
	 y8woCFewU0r4epBMb4FbvgmBuVCseiEFqTL1zwutJ7r01Rb51IR5zEAYNLr8JqLq2b/i3Rb81iRz
	 dCS9mhkOiY5Lczab/s1Wrq22Y4zMoj6vyV4FYnpQhhQK+cjVmvAgH1TRf0r0JGhvP37iHw/yx6+H
	 5JMd5lz96OzOZPJq2r9J8OhMyCZcF9ptkVon6h15ApntXGe0F2Xcj+IHn3SARhN4QjOvmDLMdG3B
	 JgC9LDc6XCohKHFYhEWY6vCxp7gWyhOd/xp4m94K9UxvTGY3E3nIY61hhEUrLfGf9hqcRW64Nxqm
	 e/Wb9Wra1ATy4KrrR/fzOwUSMvFMQz8cMD1FH7CxV4ndQRzuNCRfr5mkrlj2R0cz0I8AG1T8R7me
	 QAyfwYNzuBRzB0pHCnIabZgcRK7c5Hkeft6PW0xMKoL7Suq+4XbpfYRvoD2S0wZ3dAJPuk90c7sf
	 SjVg4T2IMmIh1krFN0jDyEk7V+Z7U7lTsNuyO7ps3riAd39p6Wj+2BMjDy3iQ=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Shuai Liu <847807867@qq.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Shuai Liu <847807867@qq.com>,
	Sudip Mukherjee <SudipMukherjee@gmail.com>,
	"teddy . wang" <teddy.wang@siliconmotion.com>,
	gregkh <gregkh@linuxfoundation.org>,
	linux-staging <linux-staging@lists.linux.dev>,
	linux-fbdev <linux-fbdev@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] staging: sm750fb: remove unused macros in sm750_accel.h
Date: Sat, 24 Oct 2026 14:26:23 +0800
X-OQ-MSGID: <20261024062623.482116-1-847807867@qq.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <atuIxyy427lxFwag@stanley.mountain>
References: <atuIxyy427lxFwag@stanley.mountain>
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

Got it, thanks for the explanation. These macros document the hardware
register layout, so I'll drop this patch (and the ddk750_reg.h one,
which is the same case).

regards,
Shuai Liu

