Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8552E8E14
	for <linux-staging@lists.linux.dev>; Mon, 10 Nov 2025 08:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762762958; cv=none; b=jwEkIwfMoU2R0my7MqWnpwHQQYzFqnO3YNVH8LNs1+sIDSMUmUMqQXJILQfWhU10IhTrC61I+umHyY6xiBfPiR1+jyB346AuwuI1ZBQKVyzgdEFvfeMBVi00n73jT9xhwvCTKNFah0VWQiB0cGKE83O4eYyYRRHPGx+WrKuQW2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762762958; c=relaxed/simple;
	bh=OxTYCu6RPB9p/Wk4BXZhXkRvVuWvgUVw9tNaOk3NdA0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uxb4t2UbGMtSlBL5qVU5GNYMrKWtwO+HGjWdbaqmNRmeejJPeY974uo6S1LI8t+MZ3/ex9aY/O5y7lSoqHDmtJNkgo9f2tEhHLkEJ8JS+R6ezP3VWxuoVH4W7uHe9XGPX1uP5p8eThsMMZEteYJgTd+y8Dqkacu0N0U2U4fCzpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vINAV-0005gU-8i; Mon, 10 Nov 2025 09:22:31 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vINAU-007zQ8-2n;
	Mon, 10 Nov 2025 09:22:30 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vINAU-0000000042S-3C6F;
	Mon, 10 Nov 2025 09:22:30 +0100
Message-ID: <0af422ff5881ec875ad7eea272e229ce3426956a.camel@pengutronix.de>
Subject: Re: [PATCH 3/6] media: staging: media: imx6-mipi-csi2: use
 devm_clk_bulk_get_all() to fetch clocks
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Frank Li <Frank.Li@nxp.com>, Steve Longerbeam <slongerbeam@gmail.com>, 
 Mauro Carvalho Chehab	 <mchehab@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team	 <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 10 Nov 2025 09:22:30 +0100
In-Reply-To: <20251107-stage-csi2-cleanup-v1-3-5d42535243ac@nxp.com>
References: <20251107-stage-csi2-cleanup-v1-0-5d42535243ac@nxp.com>
	 <20251107-stage-csi2-cleanup-v1-3-5d42535243ac@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-staging@lists.linux.dev

On Fr, 2025-11-07 at 15:44 -0500, Frank Li wrote:
> Use devm_clk_bulk_get_all_enabled() helper to simplify clock handling.
>=20
> Defer all clock prepare and enable to csi2_start(), which previous only
> enable pix clock here.
>=20
> Do that safely because there are not register access before csi2_start().

What about log_status()?

regards
Philipp
