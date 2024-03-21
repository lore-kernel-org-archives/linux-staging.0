Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D603F8C0A
	for <linux-staging@lists.linux.dev>; Thu, 21 Mar 2024 17:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711042884; cv=none; b=DUZQ/7tETBI+VtaOmdgUWPsqfpn25PMU1fqXjYwPmkHVPbPXJ9buPjj/dtu3MbXBCypPafqv0FyGZVE6M5i0s9pevfMeKbmhxgMr/B9lTynpge5nXaNTnJ9k1i1BaAnCziKk2zlOjysc0zqIporNoMZH654dDVl/TBjU/khZOFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711042884; c=relaxed/simple;
	bh=tsIQHqVhNPacvuzeL3KVpeRin7EogR4UUTOpCmM7l+k=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=rz7IqKysIORlbHKkWEF1unuMyUh1FnpLyVKVlP3cRP9dn2KyaYhEmRV07sJPS4JZXClGvrYLd9T93hx2l9E5naTkqteyUtrHOv6pZtmcq5K+V5gLvPmkkbZmaqazU2tYFHnEoY6NDLnJGOGgPeZS7yogcv+p9ILhQHeaXjJJrao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UBohlIPg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UBohlIPg"
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 452BB2B3;
	Thu, 21 Mar 2024 18:40:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711042853;
	bh=tsIQHqVhNPacvuzeL3KVpeRin7EogR4UUTOpCmM7l+k=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=UBohlIPg/2i57+/0m6yjPc7jj+3Xcn5Ixml2Ngdc1pvUnTx0oLxkW1Gz5Yv3XzoFo
	 g4Jf4ps8Zcl3trnzRF66JvkXVZ8AKBMoKvBkHZEodMrxsSN49A/EtVskrOxanaJh6Y
	 T0vb0k6S/edh1CCjtQvcAl7Wffz3XxZkivHD4EM8=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240321130737.898154-4-umang.jain@ideasonboard.com>
References: <20240321130737.898154-1-umang.jain@ideasonboard.com> <20240321130737.898154-4-umang.jain@ideasonboard.com>
Subject: Re: [PATCH v2 3/5] staging: vc04_services: Do not log error on kzalloc()
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Dan Carpenter <error27@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>, Greg KH <greg@kroah.com>, Umang Jain <umang.jain@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev
Date: Thu, 21 Mar 2024 17:41:18 +0000
Message-ID: <171104287840.3566204.1235074372960963136@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Umang Jain (2024-03-21 13:07:35)
> Do not log any error for kzalloc() error path. kzalloc() already reports
> such errors.
>=20
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>

Given I read lately how I don't think these can actually ever fail:
 - https://lwn.net/Articles/964793/
 and=20
 - https://lwn.net/Articles/723317/
 - https://lwn.net/Articles/627419

Removing these messages seems fine to me.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> ---
>  .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c    | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.=
c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index b3021739b170..ad506016fc93 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -690,7 +690,6 @@ int vchiq_initialise(struct vchiq_instance **instance=
_out)
> =20
>         instance =3D kzalloc(sizeof(*instance), GFP_KERNEL);
>         if (!instance) {
> -               dev_err(state->dev, "core: %s: Cannot allocate vchiq inst=
ance\n", __func__);
>                 ret =3D -ENOMEM;
>                 goto failed;
>         }
> @@ -956,10 +955,8 @@ vchiq_blocking_bulk_transfer(struct vchiq_instance *=
instance, unsigned int handl
>                 }
>         } else {
>                 waiter =3D kzalloc(sizeof(*waiter), GFP_KERNEL);
> -               if (!waiter) {
> -                       dev_err(service->state->dev, "core: %s: - Out of =
memory\n", __func__);
> +               if (!waiter)
>                         return -ENOMEM;
> -               }
>         }
> =20
>         status =3D vchiq_bulk_transfer(instance, handle, data, NULL, size,
> --=20
> 2.43.0
>
