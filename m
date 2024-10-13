Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80F66EB5C
	for <linux-staging@lists.linux.dev>; Sun, 13 Oct 2024 07:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728804151; cv=none; b=n4f5HY3c+BlO8UMhoaIZjonBeegFEsH0ZhuQWn8pD3V/Lm/dj7VfVpb1pAaFs3PPVs6thZhfNqgrvZDdMDJLuB8cAc1vw7TwYLDq0G4cQcO0+kFjwN0yVra4SsbFxLUfdSxUSHtDlW70kgDUkHB4ltOT9bzmyN4a4ZT98QFQ2Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728804151; c=relaxed/simple;
	bh=iRwyhDS9GmtUdJlbMLme1ZNGyUQWpIwxKlQXAlgrrmI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=O143s8C1Xqc3CamuZaRj7O9fix2wUStlmhAbfCr7+1JA1oBrIMqgky1yatMl9uhYVtmv3/HhoJI4NvpOFUJV9mKV7L6eALmj3u2Z4AMJKE8eEiV9r07C4wlOQSPGtnm6Diu5r73McFVIYEg3rBe6CgCB1zcbMkkUb5LXvQnFr94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qc2y8drD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qc2y8drD"
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 698C582E;
	Sun, 13 Oct 2024 09:20:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1728804047;
	bh=iRwyhDS9GmtUdJlbMLme1ZNGyUQWpIwxKlQXAlgrrmI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=qc2y8drDsQ5BGQj+yeEtmWfPNGu34SpCjKFJminAXTMed2ZiN3Bo80qJgZHfk7cZR
	 9Ww14Gc1FUeao8oLRh8Tw5w4bj5WEL4aadRHQzYnVCe+ufmbZx8xsumYAj8rsS83/T
	 Ca3WLWAWmpCUsyy58ZA96XAR51lztuUe2YtW26js=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241012185652.316172-5-umang.jain@ideasonboard.com>
References: <20241012185652.316172-1-umang.jain@ideasonboard.com> <20241012185652.316172-5-umang.jain@ideasonboard.com>
Subject: Re: [PATCH v3 4/6] staging: vchiq_core: Refactor notify_bulks()
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, kernel-list@raspberrypi.com, Stefan Wahren <wahrenst@gmx.net>, Umang Jain <umang.jain@ideasonboard.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Umang Jain <umang.jain@ideasonboard.com>
Date: Sun, 13 Oct 2024 08:22:25 +0100
Message-ID: <172880414537.1925926.9488617715642757683@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Umang Jain (2024-10-12 19:56:50)
> Move the statistics and bulk completion events handling  to a separate
> function. This helps to improve readability for notify_bulks().
>=20
> No functional changes intended in this patch.
>=20
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  .../interface/vchiq_arm/vchiq_core.c          | 77 +++++++++++--------
>  1 file changed, 46 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core=
.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index e9cd012e2b5f..19dfcd98dcde 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -1309,6 +1309,49 @@ get_bulk_reason(struct vchiq_bulk *bulk)
>         return VCHIQ_BULK_RECEIVE_DONE;
>  }
> =20
> +static int service_notify_bulk(struct vchiq_service *service,
> +                              struct vchiq_bulk *bulk)
> +{
> +       int status =3D -EINVAL;
> +
> +       if (!service || !bulk)
> +               return status;

Both of these are guaranteed by the (only) caller so I'm not sure they're
needed ?

But maybe it would be used elsewhere later?

If these checks were kept, and the int status removed as mentioned below
this would just be ' return -EINVAL;' of course.

Or just drop them if it's easier and guaranteed.

> +
> +       if (bulk->actual !=3D VCHIQ_BULK_ACTUAL_ABORTED) {
> +               if (bulk->dir =3D=3D VCHIQ_BULK_TRANSMIT) {
> +                       VCHIQ_SERVICE_STATS_INC(service, bulk_tx_count);
> +                       VCHIQ_SERVICE_STATS_ADD(service, bulk_tx_bytes,
> +                                               bulk->actual);
> +               } else {
> +                       VCHIQ_SERVICE_STATS_INC(service, bulk_rx_count);
> +                       VCHIQ_SERVICE_STATS_ADD(service, bulk_rx_bytes,
> +                                               bulk->actual);
> +                               }

I think the indentation on this } has gone wrong here.

> +       } else {
> +               VCHIQ_SERVICE_STATS_INC(service, bulk_aborted_count);
> +       }
> +
> +       if (bulk->mode =3D=3D VCHIQ_BULK_MODE_BLOCKING) {
> +               struct bulk_waiter *waiter;
> +
> +               spin_lock(&service->state->bulk_waiter_spinlock);
> +               waiter =3D bulk->userdata;
> +               if (waiter) {
> +                       waiter->actual =3D bulk->actual;
> +                       complete(&waiter->event);
> +               }
> +               spin_unlock(&service->state->bulk_waiter_spinlock);
> +
> +               status =3D 0;

This just looks odd here. If it weren't for this I'd have probably been
fine with the initialisation of status

> +       } else if (bulk->mode =3D=3D VCHIQ_BULK_MODE_CALLBACK) {
> +               enum vchiq_reason reason =3D get_bulk_reason(bulk);
> +               status =3D make_service_callback(service, reason, NULL,
> +                                              bulk->userdata);

I think I would probably just drop the int status altogether and make this

		return make_service_callback(service, reason, NULL,
					     bulk->userdata);

> +       }
> +
> +       return status;

And return 0 here. Then we get rid of the awkward initialisation and
usages above.

> +}
> +
>  /* Called by the slot handler - don't hold the bulk mutex */
>  static int
>  notify_bulks(struct vchiq_service *service, struct vchiq_bulk_queue *que=
ue,
> @@ -1333,37 +1376,9 @@ notify_bulks(struct vchiq_service *service, struct=
 vchiq_bulk_queue *queue,
>                  * requests, and non-terminated services
>                  */
>                 if (bulk->data && service->instance) {
> -                       if (bulk->actual !=3D VCHIQ_BULK_ACTUAL_ABORTED) {
> -                               if (bulk->dir =3D=3D VCHIQ_BULK_TRANSMIT)=
 {
> -                                       VCHIQ_SERVICE_STATS_INC(service, =
bulk_tx_count);
> -                                       VCHIQ_SERVICE_STATS_ADD(service, =
bulk_tx_bytes,
> -                                                               bulk->act=
ual);
> -                               } else {
> -                                       VCHIQ_SERVICE_STATS_INC(service, =
bulk_rx_count);
> -                                       VCHIQ_SERVICE_STATS_ADD(service, =
bulk_rx_bytes,
> -                                                               bulk->act=
ual);
> -                               }
> -                       } else {
> -                               VCHIQ_SERVICE_STATS_INC(service, bulk_abo=
rted_count);
> -                       }
> -                       if (bulk->mode =3D=3D VCHIQ_BULK_MODE_BLOCKING) {
> -                               struct bulk_waiter *waiter;
> -
> -                               spin_lock(&service->state->bulk_waiter_sp=
inlock);
> -                               waiter =3D bulk->userdata;
> -                               if (waiter) {
> -                                       waiter->actual =3D bulk->actual;
> -                                       complete(&waiter->event);
> -                               }
> -                               spin_unlock(&service->state->bulk_waiter_=
spinlock);
> -                       } else if (bulk->mode =3D=3D VCHIQ_BULK_MODE_CALL=
BACK) {
> -                               enum vchiq_reason reason =3D
> -                                               get_bulk_reason(bulk);
> -                               status =3D make_service_callback(service,=
 reason, NULL,
> -                                                              bulk->user=
data);
> -                               if (status =3D=3D -EAGAIN)
> -                                       break;
> -                       }
> +                       status =3D service_notify_bulk(service, bulk);
> +                       if (status =3D=3D -EAGAIN)
> +                               break;

This now reads as=20
                 if (bulk->data && service->instance) {
                         status =3D service_notify_bulk(service, bulk);
                         if (status =3D=3D -EAGAIN)
                                 break;
		}

which is much nicer.

With the updates above handled, then I think we're more accurately at no
functional changes:

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>



>                 }
> =20
>                 queue->remove++;
> --=20
> 2.45.2
>
