Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D4B1CF7D7
	for <linux-staging@lists.linux.dev>; Wed,  4 Sep 2024 09:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725440452; cv=none; b=AVjd6KpsxBFxKGdLTuY6eIhs6ZMG+NwV76qHncAdzC/rmqKtk5hzWQ0QOY6dl096HSeuQgm9ETFHUJIDwcL89wztTn9Fyse8IDNvhr7eyEX3F6AwR7PM5QmLPppJ5Tl1KUwM55Sq+gl07fVBZMrMS8LuTl0CtvZ4kh5MZ75tgrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725440452; c=relaxed/simple;
	bh=kKpbV7T5jUPtXTxocZYWVKGYgF7sZOsNV8TjbJGjq+4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VYG7sRmijSEsOBvkkqD9CedXtp5kpFJWqyXW5EIOXXM9vnc3LTKmddFHnuS+G3/wxNbZzpGo3jsFtrM/LDwg7WUpt5qochwfuTj5k8N6cwfknXvfMJfrX+wQlByjz0WzPYM02V6DgAzyyCSrYpCHM+pge72uopu7kSjmFyC4bs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sllsR-0002wJ-AE; Wed, 04 Sep 2024 11:00:35 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sllsQ-005PYH-Jb; Wed, 04 Sep 2024 11:00:34 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sllsQ-0005LZ-1g;
	Wed, 04 Sep 2024 11:00:34 +0200
Message-ID: <d4d8746a388e9f939e3fac73b5b51044b53c02ee.camel@pengutronix.de>
Subject: Re: [PATCH] gpu: ipu-v3: image-convert: Drop unused single
 conversion request code
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Marek Vasut <marex@denx.de>, linux-media@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Fabio
 Estevam <festevam@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo
 <shawnguo@kernel.org>,  Steve Longerbeam <slongerbeam@gmail.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev
Date: Wed, 04 Sep 2024 11:00:34 +0200
In-Reply-To: <20240713153524.107019-1-marex@denx.de>
References: <20240713153524.107019-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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

On Sa, 2024-07-13 at 17:35 +0200, Marek Vasut wrote:
> Neither ipu_image_convert_sync() nor ipu_image_convert() is used or call
> from anywhere. Remove this unused code.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>

Thank you,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
