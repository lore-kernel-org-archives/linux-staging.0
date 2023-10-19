Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A2D27477
	for <linux-staging@lists.linux.dev>; Thu, 19 Oct 2023 14:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GsS22U8Y"
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80B7E276;
	Thu, 19 Oct 2023 16:02:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1697724135;
	bh=/LQn4FWo1AwRDApyIFU8vNNjFPJ6eTsRGSfbtUFvKcc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GsS22U8YeuBvb4iJQyAfi4RNlH8P3X4zbDspNGBSWAhxWCwdpBhr04eRP6HicHcPs
	 SLLgst6V7j/ectxkXqmv0do42Cxq+svcslXXVlZmipXnlfgECbBfr+oTIAAlDzRFu5
	 DrRw35iTr0CrCTzm2tQzYS5REfAFbXJdZS9x6x+o=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231019090128.430297-1-umang.jain@ideasonboard.com>
References: <20231019090128.430297-1-umang.jain@ideasonboard.com>
Subject: Re: [PATCH v3 0/3] staging: vc04_services: Tweak module autoloading support
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <error27@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Umang Jain <umang.jain@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-staging@lists.linux.dev
Date: Thu, 19 Oct 2023 15:02:20 +0100
Message-ID: <169772414040.630990.4275963316980490979@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Umang Jain (2023-10-19 10:01:25)
> As explained by Greg KH in [1], we should not be using MODULE_ALIAS
> to auto load modules within VC04. Drop that, in favour of
> MODULE_DEVICE_TABLE. This series addresses the suggestion.
>=20
> Patch 1/3 adds vchiq_bus_device_id and supporting entries in=20
> script/mod/file2alias.c
>=20
> Patch 2/3 drops MODULE_ALIAS from bcm2835-audio in favour
> of MODULE_DEVICE_TABLE.
>=20
> Patch 3/3 drops MODULE_ALIAS from bcm2835-camera in favour
> of MODULE_DEVICE_TABLE.
>=20
> [1]:  https://lore.kernel.org/linux-media/2023100955-stunt-equate-c6fa@gr=
egkh/

Does this series now complete the task in
drivers/staging/vc04_services/interface/TODO? :

> * Get rid of all non essential global structures and create a proper
> per device structure

The series looks good to me though:


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>=20
> --
> Changes in v3:
> - Drop "_bus" suffix from all patches (and commit message)
>   as pointed out in v2 review
>=20
> Changes in v2:=20
> - NULL terminate device_id_table arrays (in 2/3 and 3/3)
>=20
> Umang Jain (3):
>   staging: vc04_services: Support module autoloading using
>     MODULE_DEVICE_TABLE
>   staging: vc04_services: bcm2835-audio: Drop MODULE_ALIAS
>   staging: vc04_services: bcm2835-camera: Drop MODULE_ALIAS
>=20
>  drivers/staging/vc04_services/bcm2835-audio/bcm2835.c    | 8 +++++++-
>  .../vc04_services/bcm2835-camera/bcm2835-camera.c        | 8 +++++++-
>  .../vc04_services/interface/vchiq_arm/vchiq_bus.c        | 2 +-
>  .../vc04_services/interface/vchiq_arm/vchiq_bus.h        | 3 +++
>  include/linux/mod_devicetable.h                          | 4 ++++
>  scripts/mod/devicetable-offsets.c                        | 3 +++
>  scripts/mod/file2alias.c                                 | 9 +++++++++
>  7 files changed, 34 insertions(+), 3 deletions(-)
>=20
> --=20
> 2.40.1
>
