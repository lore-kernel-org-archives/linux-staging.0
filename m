Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56C01429B
	for <linux-staging@lists.linux.dev>; Sat, 16 Mar 2024 10:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710584930; cv=none; b=O+023wlij5mfrWDjn+HlgyYuXS0g5StRUrnKGYKC0TUVEKmMMx5EjQQk3dlK/2qKR5UFMOqGYrtBdF4sw7jGMZKK2AzIg31QKr2AADKNvTPtKhD3SZbeH4hrYgv7hybsrz/MWV9bXYlGuriqBDU/dk9AH30Dlm/ymHrJObKl+Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710584930; c=relaxed/simple;
	bh=FC8h4VNvaiAXF1BLRJMuFWXd6lEUo00YyFl9ylMzowk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=aczf/1SOaDckF0I7GZTTQujEg1c668by3R5WryCx7CKzwbOXb/dQv86psJF1QVB/+ytFvKJ+xgAmI7h/d0hHQ/9tS892B0Hf9ZQmNGW/VWjZvoQWsH+ZzGvFaN/4ETyCEYkP79gRRqc8PYdhxjErKPRdXpqLL9jjV3TPO+HJjbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=dEOt1lWZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dEOt1lWZ"
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B0587E9;
	Sat, 16 Mar 2024 11:28:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710584901;
	bh=FC8h4VNvaiAXF1BLRJMuFWXd6lEUo00YyFl9ylMzowk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=dEOt1lWZUa1VqlZ3XN8ysjmTjZJxqgC7+FeL1MXDUqm8GNGKmaoci02QwKUJqQ6kK
	 BnsswWFWFq1F4nqSUmeQ920W4GesRR9/JJSy5pN5GKhYLc0UQKxh6NZYlzKNANokWv
	 cx/t0soc6iBoS7PpVg+L0PRbQA1SApdidk45mM2A=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240315105659.111544-3-umang.jain@ideasonboard.com>
References: <20240315105659.111544-1-umang.jain@ideasonboard.com> <20240315105659.111544-3-umang.jain@ideasonboard.com>
Subject: Re: [PATCH 2/5] staging: vc04_services: vchiq_arm: Use appropriate dev_* log helpers
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Dan Carpenter <error27@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Phil Elwell <phil@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Greg KH <greg@kroah.com>, Umang Jain <umang.jain@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev
Date: Sat, 16 Mar 2024 10:28:42 +0000
Message-ID: <171058492288.2556397.4617260952431108092@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Umang Jain (2024-03-15 10:56:56)
> Re-evaluate logs on error code paths and fix a few error logs
> with  appropriate dev_* logging helpers.
>=20
> For a case where a null ptr check is performed, use a WARN_ON()
> instead of logging to dev_err().
>=20
> No functional changes intended in this patch.
>=20
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.=
c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 1579bd4e5263..3c3e6f3e48ce 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -1317,7 +1317,7 @@ vchiq_keepalive_thread_func(void *v)
>                 long rc =3D 0, uc =3D 0;
> =20
>                 if (wait_for_completion_interruptible(&arm_state->ka_evt)=
) {
> -                       dev_err(state->dev, "suspend: %s: interrupted\n",=
 __func__);
> +                       dev_dbg(state->dev, "suspend: %s: interrupted\n",=
 __func__);

This looks good.

>                         flush_signals(current);
>                         continue;
>                 }
> @@ -1380,7 +1380,7 @@ vchiq_use_internal(struct vchiq_state *state, struc=
t vchiq_service *service,
>                          service->client_id);
>                 entity_uc =3D &service->service_use_count;
>         } else {
> -               dev_err(state->dev, "suspend: %s: null service ptr\n", __=
func__);
> +               WARN_ON(!service);

This sounds like something that shouldn't happen. Can it actually happen?

If it can happen - can it be caused by userspace through the VCHIQ
interfaces or is this just an internal code path?

Bumping up to a WARN_ON could probably need justification that deserves
it's own patch, but for the rest of the lines:


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>                 ret =3D -EINVAL;
>                 goto out;
>         }
> @@ -1753,7 +1753,7 @@ static int vchiq_probe(struct platform_device *pdev)
>          */
>         err =3D vchiq_register_chrdev(&pdev->dev);
>         if (err) {
> -               dev_warn(&pdev->dev, "arm: Failed to initialize vchiq cde=
v\n");
> +               dev_err(&pdev->dev, "arm: Failed to initialize vchiq cdev=
\n");
>                 goto error_exit;
>         }
> =20
> @@ -1763,7 +1763,7 @@ static int vchiq_probe(struct platform_device *pdev)
>         return 0;
> =20
>  failed_platform_init:
> -       dev_warn(&pdev->dev, "arm: Could not initialize vchiq platform\n"=
);
> +       dev_err(&pdev->dev, "arm: Could not initialize vchiq platform\n");
>  error_exit:
>         return err;
>  }
> --=20
> 2.43.0
>
