Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554543C0B
	for <linux-staging@lists.linux.dev>; Thu, 28 Mar 2024 08:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711615078; cv=none; b=pdg1MRns8FZWnzm0VrWt5E4rJKYlH5NvKEEsiBRUHq/8ImLDws94ubvEYa6pXJFS42QejgKWvlAiVoRVdBP0aMtL2j4cSvhOH7mybPpMuSueNWCUp4b+o1da4gXgiNk/+xnMIP8X3wA6vR2Irs1bxW1mk6i0A/dAJa1LeP3910c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711615078; c=relaxed/simple;
	bh=tGEoW6T+5GMu/gdeyW+c42036//L69MN3jKuv2WLK9Y=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=mApluiN4oo2xzrj1Fpchqw2k57+SzSPo0+I9NuXjOKA8E1wZA+ytNKBJDjZiSfhmpHAci0yPC9+2PX6xZ9hs/vpDMCSWg0lcuHn3W6xq0QH+ajMZ8AdXqvO/cPjrfN3HFa4lw/9oKMqvL/l0veWU/RS4QyrQlPT0l+Mngn8VhqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Nl4QSLPM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Nl4QSLPM"
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7DA0ED20;
	Thu, 28 Mar 2024 09:37:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1711615040;
	bh=tGEoW6T+5GMu/gdeyW+c42036//L69MN3jKuv2WLK9Y=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Nl4QSLPM7EdbJsmD1SNBE/BpgIIgBXBrrCZRmk6AbwqJBVsqUlOfdR/tfaFLJw2Cc
	 w31ovuFsnjm0/vtwFHfk+ep7BvVVTfH8K5VMn1EGhGWmcu50e2l2kICukL+7B3/qa+
	 AWyIWayRjv2Ih32kKX58Jju7Fpp30PB2L/HR3f54=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240328051615.618908-1-umang.jain@ideasonboard.com>
References: <20240328051615.618908-1-umang.jain@ideasonboard.com>
Subject: Re: [PATCH] staging: vc04_services: Stop kthreads on .remove
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Dan Carpenter <error27@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>, Greg KH <greg@kroah.com>, Umang Jain <umang.jain@ideasonboard.com>, Stefan Wahren <wahrenst@gmx.net>
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev
Date: Thu, 28 Mar 2024 08:37:50 +0000
Message-ID: <171161507013.3072637.12125782507523919379@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Umang Jain (2024-03-28 05:16:15)
> It turns out that stopping kthreads on vchiq_shutdown_internal()
> corrupts the vchiq firmware during probe.
>=20
> [   11.005324] bcm2835_vchiq 3f00b840.mailbox: sync: error: 0: sf unexpec=
ted msgid 0@b18db30a,0
>=20
> Since the kthreads are created during vchiq_probe(), symmetrically
> they should be stopped on vchiq_remove().
>=20
> Also, vchiq_shutdown_internal() is called by vchiq_shutdown() which
> is a exported function. Hence, modules can take indirectly shut the
> vchiq interface by stopping the kthreads.
>=20
> Fix it by stopping the kthreads in .remove instead.
>=20
> Fixes: d9c60badccc1 ("staging: vc04_services: vchiq_core: Stop kthreads o=
n shutdown")
> Reported-by: Stefan Wahren <wahrenst@gmx.net>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>=20
> Reproduced on rpi-3-b 32-bit kernel with multi_v7_defconfig and all
> vchiq configs options. Patch seems to fix the error mentioned in the
> commit message.

Yikes, I wish I'd spotted that asymmetry in my review of the previous
patch, but certainly keeping this symmetrical here sounds correct and
looks right to me. And if it fixes the bug ...

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>=20
> ---
>  .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c   | 6 ++++++
>  .../staging/vc04_services/interface/vchiq_arm/vchiq_core.c  | 4 ----
>  2 files changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.=
c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 1d21f9cfbfe5..9af77d17a1e8 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -1771,10 +1771,16 @@ static int vchiq_probe(struct platform_device *pd=
ev)
> =20
>  static void vchiq_remove(struct platform_device *pdev)
>  {
> +       struct vchiq_state *state =3D vchiq_get_state();
> +
>         vchiq_device_unregister(bcm2835_audio);
>         vchiq_device_unregister(bcm2835_camera);
>         vchiq_debugfs_deinit();
>         vchiq_deregister_chrdev();
> +
> +       kthread_stop(state->sync_thread);
> +       kthread_stop(state->recycle_thread);
> +       kthread_stop(state->slot_handler_thread);
>  }
> =20
>  static struct platform_driver vchiq_driver =3D {
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core=
.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index 953ccd87f425..658d19f1e7e8 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -2844,10 +2844,6 @@ vchiq_shutdown_internal(struct vchiq_state *state,=
 struct vchiq_instance *instan
>                 (void)vchiq_remove_service(instance, service->handle);
>                 vchiq_service_put(service);
>         }
> -
> -       kthread_stop(state->sync_thread);
> -       kthread_stop(state->recycle_thread);
> -       kthread_stop(state->slot_handler_thread);
>  }
> =20
>  int
> --=20
> 2.43.0
>
