Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E7127477
	for <linux-staging@lists.linux.dev>; Thu, 19 Oct 2023 13:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n3KoXvNM"
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E122E25A;
	Thu, 19 Oct 2023 15:57:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1697723879;
	bh=GJtQKpJofzdnLKKcsOp74M2gyyhQr002FTk2bQxPdg4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=n3KoXvNMbvKObmFexEesMuq+fJWMWHXBTVgukjOUE8wHmK1wiZ8aaASD9BhQhexxn
	 MLUAeBrSZ+8eXByZ9B2va9QzDf+K+K85gS3NhRmyxGnXoW/1jCk1H5eOzZBtTrhMhD
	 NhxguGDLH+nWYwqEXrINKwgTn0ac1IkXIro5fU+s=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231019082147.384723-1-umang.jain@ideasonboard.com>
References: <20231019082147.384723-1-umang.jain@ideasonboard.com>
Subject: Re: [PATCH v1 0/4] staging: vc04: Drop custom logging based on printk
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Dan Carpenter <error27@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Umang Jain <umang.jain@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-staging@lists.linux.dev
Date: Thu, 19 Oct 2023 14:58:04 +0100
Message-ID: <169772388403.630990.11794601300278976038@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Umang Jain (2023-10-19 09:21:43)
> Hello,
>=20
> This series address the discussion on [1], i.e. removing the printk
> based logging mechanism and migrate it use dynamic debug.

Thank you - sounds like progress.

Is this series also already sufficient to consider the TODO at
drivers/staging/vc04_services/interface/TODO as addressed? if so - a
patch at the end of the series which removes the todo items would be
good to include in the series (and other cleanup series) so that the
TODO list gets updated as we progress.

--
Kieran


> Patch 1/4 targets migration of vchiq_log_error().
> Patch 2/4 targets migration of vchiq_log_warning().
> ... and so on.
>=20
> This series does not touch debugfs entries which are:
> DEBUG_INITIALISE, DEBUG_TRACE, DEBUG_VALUE and DEBUG_COUNT. As far as I
> understand from the previous discussions, those  too should be moved
> to use dynamic debug as well (but is not part of this series yet), as
> I found there are more moving parts involved. I will build a series on
> top of this one, to move the debugfs entries to dynamic debug and remove
> all custom logging remanants (like VCHIQ_LOG_* macros, *_log_levels exter=
ns)
> because they do still tie into vchiq_debugfs.c.
>=20
> [1] https://lore.kernel.org/linux-media/20230913185528.770634-1-umang.jai=
n@ideasonboard.com/
>=20
> Umang Jain (4):
>   staging: vc04: Convert vchiq_log_error() to use dynamic debug
>   staging: vc04: Convert vchiq_log_warning() to use dynamic debug
>   staging: vc04: Convert(and rename) vchiq_log_info() to use dynamic
>     debug
>   staging: vc04: Convert vchiq_log_trace() to use dynamic debug
>=20
>  .../interface/vchiq_arm/vchiq_arm.c           | 143 ++++----
>  .../interface/vchiq_arm/vchiq_connected.c     |   2 +-
>  .../interface/vchiq_arm/vchiq_core.c          | 329 +++++++++---------
>  .../interface/vchiq_arm/vchiq_core.h          |  53 ++-
>  .../interface/vchiq_arm/vchiq_dev.c           |  59 ++--
>  5 files changed, 307 insertions(+), 279 deletions(-)
>=20
> --=20
> 2.40.1
>
