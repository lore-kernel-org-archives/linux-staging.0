Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584395810D
	for <linux-staging@lists.linux.dev>; Thu, 14 Mar 2024 13:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710421248; cv=none; b=p+QPcLCu8/o0zxrHsr8AWT/RlAYXXBVTAl97E10Bq595ESAlsFVy0LbcBZL5JAdz3bkMGKtzuAMglzcbZlBJXWA91Wxk5J9xlqniGpPmzp1XoJBIhNA8c4bKR/ZfBrCZkjhC6yRk8sUd8yMhSx5f8rSb0G8+UhOjXWuwqNBorYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710421248; c=relaxed/simple;
	bh=GLucv/D2p8j1cBJW/P6/LwlSCHf+YTlixVy3kr6any8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=OzH2Ff1A9zGk0otKCU59/dBxBTWFeu5DUvijV/WhaWLQ9YrCfKXEzj39kHvk+gx8sHuclWzUX34Us++zACuUpjh5kYJgmxulOQnQKF793xZXieeTUle0OkHeIGOeq5PoQ6e5mh6izgg7H6/vWaLwmBiF+EzzJ4PsREDW9h7rYSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mhnUtj8j; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mhnUtj8j"
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D29896BE;
	Thu, 14 Mar 2024 14:00:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710421214;
	bh=GLucv/D2p8j1cBJW/P6/LwlSCHf+YTlixVy3kr6any8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=mhnUtj8jPjwuBP4bTpvfPWhqI7Ty8hX8VRFqMJDjxKxdOLKMTHKeaRhgjVaciAcc9
	 8qO1PMQKRErAIVJVCy9V1AEedTAqvVJ4lTQabwKkOWHrNMDC52DhgmKhdarfe4kn+q
	 XdhAamxRQ2B+VDapd4+JVEiLl0B2VWFym7uk32IM=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240314100607.336009-2-umang.jain@ideasonboard.com>
References: <20240314100607.336009-1-umang.jain@ideasonboard.com> <20240314100607.336009-2-umang.jain@ideasonboard.com>
Subject: Re: [PATCH v2 1/6] staging: vc04_services: Drop g_once_init global variable
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Dan Carpenter <error27@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Phil Elwell <phil@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Umang Jain <umang.jain@ideasonboard.com>, Dan Carpenter <dan.carpenter@linaro.org>
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev
Date: Thu, 14 Mar 2024 13:00:35 +0000
Message-ID: <171042123500.252503.16866991871655321528@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Umang Jain (2024-03-14 10:06:02)
> g_once_init is not used in a meaningful way anywhere. Drop it
> along with connected_init() which sets it.

It certainly looks lonely and useless.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  .../interface/vchiq_arm/vchiq_connected.c            | 12 ------------
>  1 file changed, 12 deletions(-)
>=20
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_conn=
ected.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected=
.c
> index 3cad13f09e37..4604a2f4d2de 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
> @@ -11,16 +11,8 @@
>  static   int                        g_connected;
>  static   int                        g_num_deferred_callbacks;
>  static   void (*g_deferred_callback[MAX_CALLBACKS])(void);
> -static   int                        g_once_init;
>  static   DEFINE_MUTEX(g_connected_mutex);
> =20
> -/* Function to initialize our lock */
> -static void connected_init(void)
> -{
> -       if (!g_once_init)
> -               g_once_init =3D 1;
> -}
> -
>  /*
>   * This function is used to defer initialization until the vchiq stack is
>   * initialized. If the stack is already initialized, then the callback w=
ill
> @@ -29,8 +21,6 @@ static void connected_init(void)
>   */
>  void vchiq_add_connected_callback(struct vchiq_device *device, void (*ca=
llback)(void))
>  {
> -       connected_init();
> -
>         if (mutex_lock_killable(&g_connected_mutex))
>                 return;
> =20
> @@ -60,8 +50,6 @@ void vchiq_call_connected_callbacks(void)
>  {
>         int i;
> =20
> -       connected_init();
> -
>         if (mutex_lock_killable(&g_connected_mutex))
>                 return;
> =20
> --=20
> 2.43.0
>
