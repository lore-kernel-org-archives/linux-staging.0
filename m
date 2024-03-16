Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824201172C
	for <linux-staging@lists.linux.dev>; Sat, 16 Mar 2024 10:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710585211; cv=none; b=Geu6l9m4JI7cR9+hoZHuQgPHnflev4qni0w7AQ0anWBYTeWba0BydZPCx6jBSsmwAzGP6FJqELqVvxjyFstVt5f6Xnrn9NimnQ8MxWWkuwnhVBv06/bfMd94C71nuoNjazY7xnBnCnJpLyjiUGde7kp3tHHUPrH8Ewgtn+5dcPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710585211; c=relaxed/simple;
	bh=u6XBiAkWB9BS6qy5F1hxI92PL0j3EUrDPwcdR5weZRY=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=bEK8lKJaAsa7xghclp3c5rc++4ihDropW4P2dIn3WmJbcPieuaq8+N/W5r6oKB6hIZbXM9uFBcZLbDmy8vSjuqb2Yw7d3KGQLJ+WB8CbnlSHjEkRZ+O9C/5B1FA3aik/TbYo0IbDCleIwp/8vsLXd+sUvuxShS94X82cknsij5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BhYRzESF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BhYRzESF"
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6B2B87E9;
	Sat, 16 Mar 2024 11:33:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710585183;
	bh=u6XBiAkWB9BS6qy5F1hxI92PL0j3EUrDPwcdR5weZRY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=BhYRzESFysvMK4DhEZs9hLsh5T7RTD/nj+RJ1QBEolDrqDBnLiTidvjkw5QZ2OZOK
	 MbWktrBGeo8K2KF2ODcRj/EJR61dbR7qipB1IX1Ak4O+skvGkNaGxjxQ/Tipdnqb3t
	 dk17eB1JxYSDfRLLFDPG6Xn8pTFYVCrzfqXosnHI=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240315105659.111544-2-umang.jain@ideasonboard.com>
References: <20240315105659.111544-1-umang.jain@ideasonboard.com> <20240315105659.111544-2-umang.jain@ideasonboard.com>
Subject: Re: [PATCH 1/5] staging: vc04_services: Remove unused function declarations
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Dan Carpenter <error27@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Phil Elwell <phil@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Greg KH <greg@kroah.com>, Umang Jain <umang.jain@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev
Date: Sat, 16 Mar 2024 10:33:25 +0000
Message-ID: <171058520523.2556397.8051048843766359387@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Umang Jain (2024-03-15 10:56:55)
> vchiq_loud_error-* are unused hence, remove their declarations.
> This seem to be remnants of custom logging helpers which were
> removed earlier.
>=20

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  .../staging/vc04_services/interface/vchiq_arm/vchiq_core.h  | 6 ------
>  1 file changed, 6 deletions(-)
>=20
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core=
.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> index c8527551b58c..5fbf173d9c56 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> @@ -470,12 +470,6 @@ vchiq_bulk_transfer(struct vchiq_instance *instance,=
 unsigned int handle, void *
>  extern void
>  vchiq_dump_state(struct seq_file *f, struct vchiq_state *state);
> =20
> -extern void
> -vchiq_loud_error_header(void);
> -
> -extern void
> -vchiq_loud_error_footer(void);
> -
>  extern void
>  request_poll(struct vchiq_state *state, struct vchiq_service *service,
>              int poll_type);
> --=20
> 2.43.0
>
