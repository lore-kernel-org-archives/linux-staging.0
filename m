Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0458A2E8B83
	for <linux-staging@lists.linux.dev>; Mon, 10 Nov 2025 08:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762763009; cv=none; b=RFPjBNcRMA1wnf0fj91qBZCv55OCK9xniwv40mVjbXYvkKeHqzhwtxiVTp0slfjeCJMwF733ltbwWSA4OpzAcV7gyDni3kPBn9mWfo8cUQL1IbAfi8hjukmiTSQzNhwBIezo/EQyDxcH76fbqymNj7rszDV22Uv8taWSQrC64GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762763009; c=relaxed/simple;
	bh=df094fQFKVW5CYPMljAhSh/S5b+6dOd3Q81MPy5kS9s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VHmSCnmPnJ0EQ2Ssxnx7HgmV+HUSqRvOUYQi8f26D8KXHkEuruaPlu0uJjE+jP/tvHai+yqdXZQ8VFKOWF7iDK556fguobQeqfJJ/VGeAgcsgtu8CcXKXasm57cS4eu7VQvQgMw2ZP5bP97Yx6cGa+5R2wuvMWabicHMyE9vTKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vINBI-0005qH-VN; Mon, 10 Nov 2025 09:23:20 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vINBI-007zQD-23;
	Mon, 10 Nov 2025 09:23:20 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vINBI-00000000449-2GKK;
	Mon, 10 Nov 2025 09:23:20 +0100
Message-ID: <213e291cfcce29969fe6addd35c6c633289a5270.camel@pengutronix.de>
Subject: Re: [PATCH 4/6] media: staging: media: imx6-mipi-csi2: use
 devm_mutex_init() to simplify code
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Frank Li <Frank.Li@nxp.com>, Steve Longerbeam <slongerbeam@gmail.com>, 
 Mauro Carvalho Chehab	 <mchehab@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team	 <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 10 Nov 2025 09:23:20 +0100
In-Reply-To: <20251107-stage-csi2-cleanup-v1-4-5d42535243ac@nxp.com>
References: <20251107-stage-csi2-cleanup-v1-0-5d42535243ac@nxp.com>
	 <20251107-stage-csi2-cleanup-v1-4-5d42535243ac@nxp.com>
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
> Use devm_mutex_init() to simplify the code. No functional change.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Although I think this should come before patches 2 and 3.

regards
Philipp
