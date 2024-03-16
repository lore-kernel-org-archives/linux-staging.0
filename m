Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAB4125C9
	for <linux-staging@lists.linux.dev>; Sat, 16 Mar 2024 10:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710585046; cv=none; b=bzmMgPA8mRzbPZiGdBDXlSpEDu+dcm9wWsuDT8qwcjdGlfg2HdROoTFiEysKMMn9mEcZHSUu3liqc2GPueXIwM7cHBfhecB4pprB1S42/Y5B8AyjpjSdYJTh3l7gL4nDWSC9Ugy0EUb5oZSrASlz3UurvyfAS+4yqU5jiHnLUgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710585046; c=relaxed/simple;
	bh=LiH/otIS0FOfxGG39QDx2khXYdaAexVBOoDEveU7/+U=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=FhFLso8XCVJNGXVS9qBDT3TSaoKOXOEU4xjLvoWyYbvDP1n8Nc0BydxDQMOGukTodtcVoJXClcY3wAuKLIQbsU8igOFwUIs4uu/cxG1HBpqba1XQ66kZk99GWtKkoReTs890ovtqS0WWDXL5ErJz5d5AUzmoffvI44Gu2DTlpg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DKV80ais; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DKV80ais"
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A42E07E9;
	Sat, 16 Mar 2024 11:30:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710585017;
	bh=LiH/otIS0FOfxGG39QDx2khXYdaAexVBOoDEveU7/+U=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=DKV80aisVqlQoyxICGyq35Iw0J1ifa/mPGCjFIZ/dOaoai7x5tyY6ZBzmbjtwHJ/0
	 TaL5FbeiY4JOKFFNPE3a/wS3ln0MOno7E0hg8WLadUkoo7hLB75amoezi2xR72zNT9
	 tHTJjOf57F8haohyr1m0g1cNPopHjaVmkrXNJFW4=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240315105659.111544-5-umang.jain@ideasonboard.com>
References: <20240315105659.111544-1-umang.jain@ideasonboard.com> <20240315105659.111544-5-umang.jain@ideasonboard.com>
Subject: Re: [PATCH 4/5] staging: vc04_services: Implement vchiq_bus .remove
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Dan Carpenter <error27@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Phil Elwell <phil@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Greg KH <greg@kroah.com>, Umang Jain <umang.jain@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev
Date: Sat, 16 Mar 2024 10:30:40 +0000
Message-ID: <171058504005.2556397.16687127113831375501@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Umang Jain (2024-03-15 10:56:58)
> Implement the struct vchiq_bus .remove() so that cleanup
> paths can be executed by the devices registered to this
> bus, when being removed.
>=20
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  .../vc04_services/interface/vchiq_arm/vchiq_bus.c        | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.=
c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
> index 68f830d75531..d9aa2f41ce13 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_bus.c
> @@ -37,11 +37,20 @@ static int vchiq_bus_probe(struct device *dev)
>         return driver->probe(device);
>  }
> =20
> +static void vchiq_bus_remove(struct device *dev)
> +{
> +       struct vchiq_device *device =3D to_vchiq_device(dev);
> +       struct vchiq_driver *driver =3D to_vchiq_driver(dev->driver);
> +
> +       driver->remove(device);

I suspect this be:

	if (driver->remove)
		driver->remove(device);

?

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
