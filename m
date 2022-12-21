Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A13A7E
	for <linux-staging@lists.linux.dev>; Wed, 21 Dec 2022 12:33:28 +0000 (UTC)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 51A6FFB;
	Wed, 21 Dec 2022 13:33:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1671626005;
	bh=5Fd2x2guEXhJvwsldua4/D1afcQdq+w5Tdig2fs5xT4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=oylmFDmpwe19jgOU9ccsnHaXmatKYGIHtxpuqVJpQsyWHx+HvUbI60OYAfRcSH4Pm
	 dFq8xU+Z2huSzm3NiJalMifeCXhUJYBS9hkIBvvv7mqyBMd35Er2jtSBSLMPLE4woj
	 bMBrzycYHMJ+DwLgEKZnZLZp22Yw2tFHbuA53xDY=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221221074047.233473-1-umang.jain@ideasonboard.com>
References: <20221221074047.233473-1-umang.jain@ideasonboard.com>
Subject: Re: [PATCH] staging: vchiq_arm: Remove extra struct vchiq_instance declaration
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Adrien Thierry <athierry@redhat.com>, Stefan Wahren <stefan.wahren@i2se.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Umang Jain <umang.jain@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-staging@lists.linux.dev
Date: Wed, 21 Dec 2022 12:33:22 +0000
Message-ID: <167162600273.3944359.9522944722768752331@Monstersaurus>
User-Agent: alot/0.10

Quoting Umang Jain (2022-12-21 07:40:47)
> Additional declaration of struct vchiq_instance was introduced in the
> commit 726e79f8a648 ("staging: vchiq_arm: pass vchiq instance to
> service callbacks"). Drop the extra declaration.
>=20
> Fixes: 726e79f8a648 ("staging: vchiq_arm: pass vchiq instance to service =
callbacks")
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>

It's tempting to move the other instance up to near the top of the file
too, but not necessary.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> ---
>  drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/staging/vc04_services/include/linux/raspberrypi/vchi=
q.h b/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
> index 66965da11443..52e106f117da 100644
> --- a/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
> +++ b/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
> @@ -78,8 +78,6 @@ struct vchiq_service_params_kernel {
>         short version_min;   /* Update for incompatible changes */
>  };
> =20
> -struct vchiq_instance;
> -
>  extern int vchiq_initialise(struct vchiq_instance **pinstance);
>  extern int vchiq_shutdown(struct vchiq_instance *instance);
>  extern int vchiq_connect(struct vchiq_instance *instance);
> --=20
> 2.38.1
>
