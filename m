Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3840B22D78A
	for <linux-staging@lists.linux.dev>; Mon,  8 Sep 2025 11:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757330160; cv=none; b=m1nNbyNCSlYa6o88C2uBPAMzVoe5z01ZZD6jjr3hp+AntU1oLrP36ClYOHx7x5JGmAKqsyGmzkvTxYBZWHHPtdq0I6Co8fqWYu94tqMTTKYVD5fZTxs2xeYsRl7Kvabl88d/7OyLixbPCwgWBrc2p9DNYFQ/bMtqxHbWiEBwXg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757330160; c=relaxed/simple;
	bh=+8Z8atAnfriG15S5k0i4V2/xNbQzXkz5PziUTXcBQe0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=hj45wPadVdPV7xDUNp44UfQV3zFN4BAcFq4ELcfTfA/BNRhFsdbAjRh9EjTm0Y8WQ/BRcTyE99Rqnyl1So+oxJQ/wBLL+WhPIRDfr85EdURe3PIGCX7JhhkHDVYjv5t7kpqclIyxkUivilkwgYhmktDSXa/G1hy4sOuARjlN/f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MtEXD2U+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MtEXD2U+"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:c9e9:75f9:f434:33cd:e4fe])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 51346725;
	Mon,  8 Sep 2025 13:14:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1757330082;
	bh=+8Z8atAnfriG15S5k0i4V2/xNbQzXkz5PziUTXcBQe0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=MtEXD2U+aGfOqJspEKZo5QXwh0CeOGPsQ6sDmV/H/A1CAZLTVzuXptUKRuZMD3SnG
	 +TXeXaSYNUpKi8TskBfd15Y0DSIe6wMuGNtFr7LysZfxv249kQCL5TwL2gcBtseZqX
	 DU+BOYzHlhbl2YlEpmH49f6HE4HvR34NDSlv6P64=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <aL5uKTiEYZP68xLd@stanley.mountain>
References: <20250907-vchiq-destage-v2-0-6884505dca78@ideasonboard.com> <aL5uKTiEYZP68xLd@stanley.mountain>
Subject: Re: [PATCH v2 0/5] staging: Destage VCHIQ interface and MMAL
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-list@raspberrypi.com, Stefan Wahren <wahrenst@gmx.net>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Umang Jain <umang.jain@ideasonboard.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Date: Mon, 08 Sep 2025 16:45:46 +0530
Message-ID: <175733014607.8095.7451233410776368088@freya>
User-Agent: alot/0.12.dev28+gd2c823fe

Hi Dan,

Quoting Dan Carpenter (2025-09-08 11:18:25)
> It's really hard to review the code when it's just sigle line like
> this:
>=20
> >  .../raspberrypi/vchiq-interface}/vchiq_arm.c       |    9 +-
>=20
> It's also a head ache to do a cat -n filename and then copy and paste
> it into an email message...  I thought there was a trick to make the
> diff show up in the email?
>=20

I am not sure how to configure b4 to give the full file path instead of
shortening it after the first file in a list.

Does git-format-patch already have some option? I can use that to ease
reviews till b4 adds support for this feature.

Or did I misunderstand your problem?

> regards,
> dan carpenter
>

Thanks,
    Jai
