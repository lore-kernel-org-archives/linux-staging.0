Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667D52CA2
	for <linux-staging@lists.linux.dev>; Sun, 22 Jan 2023 16:27:02 +0000 (UTC)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D748D308;
	Sun, 22 Jan 2023 17:26:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1674404814;
	bh=eujLJzueQN/rr7uEp/mzOY8lg5QhIUlSSUUSueSHrF8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=PF6/H4pYaje1DHtCKKhBZbSIvmIwHe93BCVej26Ongx+mvhibGt2Oi5X+QyVzt/zW
	 Ba14W9Q7TkuJNfBb91mHNK9g1hMRHziTVg66FcIqfaYwxhqU4Lcv1MnIvKY2XvyiTT
	 +uz8AO92TN2BXqlf9oWFcN0E34k3Lr2KhJX5M72g=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d5363f85-44e1-eee1-f7a5-61102637ef53@i2se.com>
References: <20230118115810.21979-1-umang.jain@ideasonboard.com> <d5363f85-44e1-eee1-f7a5-61102637ef53@i2se.com>
Subject: Re: [RFC PATCH 0/4] Drop custom logging
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Florian Fainelli <f.fainelli@gmail.com>, Adrien Thierry <athierry@redhat.com>, Dan Carpenter <error27@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-arm-kernel@lists.infradead.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-staging@lists.linux.dev, linux-media@vger.kernel.org, Phil Elwell <phil@raspberrypi.com>
To: Stefan Wahren <stefan.wahren@i2se.com>, Umang Jain <umang.jain@ideasonboard.com>
Date: Sun, 22 Jan 2023 16:26:50 +0000
Message-ID: <167440481093.3533645.5465896340839457121@Monstersaurus>
User-Agent: alot/0.10

Hi Stefan,

Quoting Stefan Wahren (2023-01-22 14:21:05)
> Hi Umang,
>=20
> Am 18.01.23 um 12:58 schrieb Umang Jain:
> > Drop custom logging from the vchiq interface.
> > Mostly of them are replaced with dev_dbg and friends
> > and/or pr_info and friends.
> >
> > The debugfs log levels (in 4/4) are mapped to kernel
> > logs levels (coming from include/linux/kern_levels.h)
> > Would like some thoughts on it as I am not sure (hence
> > marking this is RFC)
> >
> >  From drivers/staging/vc04_services/interface/TODO:
> >
> > """
> > * Cleanup logging mechanism
> >
> > The driver should probably be using the standard kernel logging mechani=
sms
> > such as dev_info, dev_dbg, and friends.
> > """
>=20
> at first i want to thank you for the work on vchiq so far.
>=20
> There is something which is not directly related to this series, but it=20
> is also about debugging. The driver has a buffer which is accessed by=20
> it's own DEBUG_* macros. The content of this debug buffer can be dumped=20
> via the /dev/vchiq which is also used by ioctl. I would appreciate to=20
> move this dump feature into a new debugfs entry.

Do you have a full list of the tasks you'd like to see completed ?
(including/or above drivers/staging/vc04_services/interface/TODO)

It would help to have a clear picture of tasks needed to get this driver
destaged, so that we can support the ISP upstream.

Regards
--
Kieran
