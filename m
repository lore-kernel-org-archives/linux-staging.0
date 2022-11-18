Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E395198
	for <linux-staging@lists.linux.dev>; Fri, 18 Nov 2022 10:30:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8F66449C;
	Fri, 18 Nov 2022 11:30:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1668767420;
	bh=sH88uNandLFM8Idyh7Z25gR1H2U7S+DF9vjx8nxGh5Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ufKjTUYB2EDNoPofR7vc1V5z2utB1DgO5xzx39ZdDleQ+akXgRAQarqyBdTAvNdwU
	 fUoX/3YAOjc/0ykB8PCQIZuUNrW4es2nDzTeliiBO1GLDC8QSya/R+IVemoN1qWy2E
	 uNrtmVeaXAxwNVKM3cRG8m7+sQhZ4tfi0XoOal+g=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221118084244.199909-3-umang.jain@ideasonboard.com>
References: <20221118084244.199909-1-umang.jain@ideasonboard.com> <20221118084244.199909-3-umang.jain@ideasonboard.com>
Subject: Re: [PATCH v2 2/3] vc04_services: mmal-vchiq: Use bool for vchiq_mmal_component.in_use
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Umang Jain <umang.jain@ideasonboard.com>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dan Carpenter <error27@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Florian Fainelli <f.fainelli@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Ray Jui <rjui@broadcom.com>, Umang Jain <umang.jain@ideasonboard.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-staging@lists.linux.dev
Date: Fri, 18 Nov 2022 10:30:17 +0000
Message-ID: <166876741790.50677.17305359640652054680@Monstersaurus>
User-Agent: alot/0.10

Quoting Umang Jain (2022-11-18 08:42:43)
> In commit 7967656ffbfa ("coding-style: Clarify the expectations around
> bool") the check to dis-allow bool structure members was removed from
> checkpatch.pl. It promotes bool structure members to store boolean
> values. This enhances code readability.

This only talks about 7967656ffbfa as I can interpret it.  A sentence
here describing what we're going to do about it in /this/ patch would be
clearer as a second paragraph:

"""
Convert the remaining bit-field storage for 'in-use' to a bool and use
it accordingly.
"""

But that's trivial and not worth a v3 specifically. (unless anyone
applying this wants to add it).

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>=20
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 6 +++---
>  drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/driv=
ers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> index 4abb6178cb9f..294b184d4a49 100644
> --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> @@ -1648,7 +1648,7 @@ int vchiq_mmal_component_init(struct vchiq_mmal_ins=
tance *instance,
>         for (idx =3D 0; idx < VCHIQ_MMAL_MAX_COMPONENTS; idx++) {
>                 if (!instance->component[idx].in_use) {
>                         component =3D &instance->component[idx];
> -                       component->in_use =3D 1;
> +                       component->in_use =3D true;
>                         break;
>                 }
>         }
> @@ -1724,7 +1724,7 @@ int vchiq_mmal_component_init(struct vchiq_mmal_ins=
tance *instance,
>         destroy_component(instance, component);
>  unlock:
>         if (component)
> -               component->in_use =3D 0;
> +               component->in_use =3D false;
>         mutex_unlock(&instance->vchiq_mutex);
> =20
>         return ret;
> @@ -1747,7 +1747,7 @@ int vchiq_mmal_component_finalise(struct vchiq_mmal=
_instance *instance,
> =20
>         ret =3D destroy_component(instance, component);
> =20
> -       component->in_use =3D 0;
> +       component->in_use =3D false;
> =20
>         mutex_unlock(&instance->vchiq_mutex);
> =20
> diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h b/driv=
ers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
> index 6d984cf5a83a..09f030919d4e 100644
> --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
> +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
> @@ -82,7 +82,7 @@ struct vchiq_mmal_port {
>  };
> =20
>  struct vchiq_mmal_component {
> -       u32 in_use:1;
> +       bool in_use;
>         bool enabled;
>         u32 handle;  /* VideoCore handle for component */
>         u32 inputs;  /* Number of input ports */
> --=20
> 2.38.1
>
