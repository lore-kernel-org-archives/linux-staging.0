Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795822910;
	b=ewHvn92Rv62vwMN5RjUfPbO43ZW36/ytdoVvlsEGrTJUWG0eT7harh2xYuOiKtm7odZ7
	 w9rRS9CIvAU3/H5XoAnMobBKnVC+hyEH4GMH1wfa+gxbwPWkKq/Sjfc9Ak+r2MT7V8GJo
	 YE/vmWZi8fir6EZjbNo30GPTXEK4vA5xmQPigfBIexKFWLOojPj7arFGAnz8Fi1POO9iE
	 fhaO4cMK3Mgd/Q6hZAutB8/jlhgknIhLIhKMBMLyMM+uGoSr1u3GaMiEnvIGISgY5jsAE
	 0xvt7JrH3/XE6DMvrT8POfrW1RdYZ0jeFSKOJ2ui6DUtr9Of2zjNtOA263UsHJyE5TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795822910;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=mqsgecR7PqnKZ+BistIBVBvlZgZqI1OMCwkWI4zhdVM=;
	b=kqqSxhv+6dy/MNpKyNqMN3DO2qiNPGY1qNJ890hzQiBrr/0RT+H8IbBVL5HA4qhgB6gU
	 LyjNY+Jlylkk5oL8AFC5UtpXu84KEXPr1v43YKG5PVGIg9JX4w+hih5Ty0rX2Hetd+Zpc
	 NcGeY96DOyCnHs0Wa4qUDfs702kNPjL2721gVzrECOqyDFZsZqLUOO4MuC/ZNh3vaBKpq
	 HLnRNBgfUWFVjnFatWgWqwDATxnNNXQQOUbsmTgmyjfSWy2k38Q6aVoop9kwUnKz0Ob/O
	 Oqr6v5JLwhgLKjVIWRPlzDLOgsmToSzovxqSoWXXAXNX6IcYxSyYK6jEj9rstMl+FpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Kxl56kYC;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9070F606A31C;
	Fri, 27 Nov 2026 23:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9070F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Kxl56kYC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=mqsgecR7PqnKZ+BistIBVBvlZgZqI1OMCwkWI4zhdVM=;
	b=Kxl56kYCm+Ih6QbjDPV2JZvJOYNAUwL0+k09ocKWVMDGCvsHmb1gma5qjdqdjl
	XgJ6sCVW3muRrLYnDirmTvFnZS/tR1DTzNbx7pgW2a3w4BxhthU+Fdch2yulz7G3
	kPBaxzNr4+j0nWdccXMzOBkryKDswwwzNoENuURp+boHQ=
Received: from Ubuntu26.04LTS (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wDnb+YUFQprOPgvKQ--.24533S2;
	Sat, 28 Nov 2026 07:41:09 +0800 (CST)
From: Jiaqi Shi <shijiaqi_develop@163.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-staging@lists.linux.dev
Cc: Jiaqi Shi <shijiaqi_develop@163.com>,
	slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	Frank.Li@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com
Subject: Re: [PATCH v6 0/2] media: imx: staging cleanup and FIM export to v4l2-core
Date: Sat, 28 Nov 2026 07:41:07 +0800
Message-ID: <20261127234108.641406-1-shijiaqi_develop@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <479b6df1-3cd7-4609-b197-86bd937b1fdd@kernel.org>
References: <20261122114205.494704-1-shijiaqi_develop@163.com> <479b6df1-3cd7-4609-b197-86bd937b1fdd@kernel.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnb+YUFQprOPgvKQ--.24533S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZw1rZFW5Ww47KFW3ur1kGrg_yoWfZrb_Zr
	1kC3Z7Aw4DGFWfAa17Jay0vasxWFZ2k34jvwnxJ343tFWjqrWrGFWvqr4rAr1fZ3s8Arnr
	Gwsagw1Y9wnI9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUbjXdUUUUUU==
X-CM-SenderInfo: xvklyxpdtlsvxhyhz0rs6rljoofrz/xtbCzRWn+msKFRU3BgAA3V

Hi Hans,

On Wed, Nov 25, 2026 at 12:00:52PM +0100, Hans Verkuil wrote:
> In any case, don't move it to the core.

Agreed, I'll drop the FIM export patch. For context, it was driven by the
first item in drivers/staging/media/imx/TODO:

  - The Frame Interval Monitor could be exported to v4l2-core for
    general use.

Since you don't want it in the core, that TODO item should probably be
updated or removed, otherwise the next person will try the same thing.

On the FIM itself: I'm not aware of a documented userspace use-case for
these private controls and events, so if you'd rather remove it, I can do
that as a separate patch. It would only touch the imx FIM helper and the
CSI driver. Would you like me to do that?

The other patch in the series (removing legacy control inheritance and
source-dependent format handling) is independent of FIM and implements the
remaining TODO items. I'll resend it on its own.

Regards,
Jiaqi

