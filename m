Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BDBE57B
	for <linux-staging@lists.linux.dev>; Thu, 21 Mar 2024 17:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711041513; cv=none; b=FcZWV9U1crt6eBT37YuR4yFkZmpY1LpHTZJM3y0Uc0+MGZHyyfNX+jQtVkKaIlICNpIhKLS7ANJhf7eAOmM6je5ToQ+VNJ0gFuroSQvX46DTTSMF7m8ItrMGPRsnoUgr9atIkzs8zMK3PjDjAUkQnzbKyuVw/GzJDF9Yd9+gKr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711041513; c=relaxed/simple;
	bh=JWsEErti/jfv8RbPxDTb2XtPZICl2QlWc0saltDpQfs=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=HlAXnZbAiBZBAygPRi3aZmC3Myvc7UpXxn0v3KzcDOltWitGWNS+TQGfVyJ9uThzkkg1o4qTDFodW4UCL2mlTKF71pYdwmgIeNU9zyNh85Gxzh7gos3ATP099MMM3wmxdWcd+Gx45msIsjlxzb4d7nSztiCVnU7XlY6+4QSF514=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iI+MCn3b; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iI+MCn3b"
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 04C542B3;
	Thu, 21 Mar 2024 18:18:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711041481;
	bh=JWsEErti/jfv8RbPxDTb2XtPZICl2QlWc0saltDpQfs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=iI+MCn3bs417putjEVkTvXL1zkXXb60zuBOSjV1zEKu2zZILh+19Y0H7thADPl47j
	 UeSXwst0IuIc+X2e1HkLu5bqpUSPWEDMiILyImaFXtDhgZZ/Xw9dbWy/0+vWZflgbm
	 J42cQy1MXcLUgr6seNJ2KPNq7pGNjhngUOWkLoqQ=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240321130737.898154-5-umang.jain@ideasonboard.com>
References: <20240321130737.898154-1-umang.jain@ideasonboard.com> <20240321130737.898154-5-umang.jain@ideasonboard.com>
Subject: Re: [PATCH v2 4/5] staging: vc04_services: Implement vchiq_bus .remove
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Dan Carpenter <error27@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>, Greg KH <greg@kroah.com>, Umang Jain <umang.jain@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev
Date: Thu, 21 Mar 2024 17:18:26 +0000
Message-ID: <171104150601.3566204.5965127233700490228@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Umang Jain (2024-03-21 13:07:36)
> Implement the struct vchiq_bus .remove() so that cleanup
> paths can be executed by the devices registered to this
> bus, when being removed.
>=20
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---

Don't forget a changelog when possible.

v2:
 - Check driver->remove before calling


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>  .../vc04_services/interface/vchiq_arm/vchiq_bus.c      | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.=
c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
> index 68f830d75531..93609716df84 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
> @@ -37,11 +37,21 @@ static int vchiq_bus_probe(struct device *dev)
>         return driver->probe(device);
>  }
> =20
> +static void vchiq_bus_remove(struct device *dev)
> +{
> +       struct vchiq_device *device =3D to_vchiq_device(dev);
> +       struct vchiq_driver *driver =3D to_vchiq_driver(dev->driver);
> +
> +       if (driver->remove)
> +               driver->remove(device);
> +}
> +
>  const struct bus_type vchiq_bus_type =3D {
>         .name   =3D "vchiq-bus",
>         .match  =3D vchiq_bus_type_match,
>         .uevent =3D vchiq_bus_uevent,
>         .probe  =3D vchiq_bus_probe,
> +       .remove =3D vchiq_bus_remove,
>  };
> =20
>  static void vchiq_device_release(struct device *dev)
> --=20
> 2.43.0
>
