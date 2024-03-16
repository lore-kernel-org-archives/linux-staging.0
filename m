Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A195D11718
	for <linux-staging@lists.linux.dev>; Sat, 16 Mar 2024 10:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710585192; cv=none; b=p3qPdsjBLI/bizsaZKl4qzcAg2LFcshLZc7NoGffXp0I4aORl0WGLMJL6dulE9/1BNaqUBSJ+6Wm3ozuMY6H7J8L4A0JqfZEvRtpEee3Hc90E6l2lGkQj3+8wl+PeW4txifbpBDaiCxj4+GTAnL7C0tSpjscAcG75kvYZFlg/7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710585192; c=relaxed/simple;
	bh=zXJ0SRVqxDOPQVLOY35GtFev7p7CO8pLKxmsiWPp3+Q=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Z3iR9k8O3cdXpuK4n4Vk5ijGXc5TgeqLleR3pWROuL0alxme7x1IvcmygUlnl4uPlu6Dj8iFR2t0L1TRuVtq6qfrtz8J6ln0sGpEm/fiSc1yOwoNQ6jLQ5Dj0XDmABxV5g+daCHCO1GaKWoViwi+ZA7UpJAQHRGSLJO01anNxFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JnsKjQU2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JnsKjQU2"
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E2D57E9;
	Sat, 16 Mar 2024 11:32:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710585164;
	bh=zXJ0SRVqxDOPQVLOY35GtFev7p7CO8pLKxmsiWPp3+Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=JnsKjQU2l29FBMbgsDLhe8h3m8WsDps99eSq/FhIJqNfE5osBHMsuLBFGIwhKPnFr
	 j+DRTwJhA6XYDzU6TK0ko19h7aHPvf53UOnuo86ik3iHKTO44mj5rFxb8S9de7Hcax
	 +wqMhqVUom5Z5ZgkRhpV/B3FtokXFzd61y2hZIHQ=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240315105659.111544-6-umang.jain@ideasonboard.com>
References: <20240315105659.111544-1-umang.jain@ideasonboard.com> <20240315105659.111544-6-umang.jain@ideasonboard.com>
Subject: Re: [PATCH 5/5] staging: vc04_services: vchiq_core: Stop kthreads on shutdown
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>, Dan Carpenter <error27@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Phil Elwell <phil@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Greg KH <greg@kroah.com>, Umang Jain <umang.jain@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev
Date: Sat, 16 Mar 2024 10:33:06 +0000
Message-ID: <171058518606.2556397.1542522714934109972@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Umang Jain (2024-03-15 10:56:59)
> The various kthreads thread functions (slot_handler_func, sync_func,
> recycle_func) in vchiq_core and vchiq_keepalive_thread_func in
> vchiq_arm should be stopped on vchiq_shutdown().
>=20
> This also address the following TODO item:
>  * Fix kernel module support
>=20
> hence drop it from the TODO item list.


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>=20
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  drivers/staging/vc04_services/interface/TODO           |  7 -------
>  .../vc04_services/interface/vchiq_arm/vchiq_arm.c      |  8 ++++++--
>  .../vc04_services/interface/vchiq_arm/vchiq_core.c     | 10 +++++++---
>  3 files changed, 13 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/stagi=
ng/vc04_services/interface/TODO
> index 05eb5140d096..57a2d6761f9b 100644
> --- a/drivers/staging/vc04_services/interface/TODO
> +++ b/drivers/staging/vc04_services/interface/TODO
> @@ -16,13 +16,6 @@ some of the ones we want:
>    to manage these buffers as dmabufs so that we can zero-copy import
>    camera images into vc4 for rendering/display.
> =20
> -* Fix kernel module support
> -
> -Even the VPU firmware doesn't support a VCHI re-connect, the driver
> -should properly handle a module unload. This also includes that all
> -resources must be freed (kthreads, debugfs entries, ...) and global
> -variables avoided.
> -
>  * Documentation
> =20
>  A short top-down description of this driver's architecture (function of
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.=
c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 1151cb4a84f9..60b4874049b4 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -726,8 +726,9 @@ void free_bulk_waiter(struct vchiq_instance *instance)
> =20
>  int vchiq_shutdown(struct vchiq_instance *instance)
>  {
> -       int status =3D 0;
>         struct vchiq_state *state =3D instance->state;
> +       struct vchiq_arm_state *arm_state;
> +       int status =3D 0;
> =20
>         if (mutex_lock_killable(&state->mutex))
>                 return -EAGAIN;
> @@ -739,6 +740,9 @@ int vchiq_shutdown(struct vchiq_instance *instance)
> =20
>         dev_dbg(state->dev, "core: (%p): returning %d\n", instance, statu=
s);
> =20
> +       arm_state =3D vchiq_platform_get_arm_state(state);
> +       kthread_stop(arm_state->ka_thread);
> +
>         free_bulk_waiter(instance);
>         kfree(instance);
> =20
> @@ -1311,7 +1315,7 @@ vchiq_keepalive_thread_func(void *v)
>                 goto shutdown;
>         }
> =20
> -       while (1) {
> +       while (!kthread_should_stop()) {
>                 long rc =3D 0, uc =3D 0;
> =20
>                 if (wait_for_completion_interruptible(&arm_state->ka_evt)=
) {
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core=
.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index 76c27778154a..953ccd87f425 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -1936,7 +1936,7 @@ slot_handler_func(void *v)
> =20
>         DEBUG_INITIALISE(local);
> =20
> -       while (1) {
> +       while (!kthread_should_stop()) {
>                 DEBUG_COUNT(SLOT_HANDLER_COUNT);
>                 DEBUG_TRACE(SLOT_HANDLER_LINE);
>                 remote_event_wait(&state->trigger_event, &local->trigger);
> @@ -1978,7 +1978,7 @@ recycle_func(void *v)
>         if (!found)
>                 return -ENOMEM;
> =20
> -       while (1) {
> +       while (!kthread_should_stop()) {
>                 remote_event_wait(&state->recycle_event, &local->recycle);
> =20
>                 process_free_queue(state, found, length);
> @@ -1997,7 +1997,7 @@ sync_func(void *v)
>                         state->remote->slot_sync);
>         int svc_fourcc;
> =20
> -       while (1) {
> +       while (!kthread_should_stop()) {
>                 struct vchiq_service *service;
>                 int msgid, size;
>                 int type;
> @@ -2844,6 +2844,10 @@ vchiq_shutdown_internal(struct vchiq_state *state,=
 struct vchiq_instance *instan
>                 (void)vchiq_remove_service(instance, service->handle);
>                 vchiq_service_put(service);
>         }
> +
> +       kthread_stop(state->sync_thread);
> +       kthread_stop(state->recycle_thread);
> +       kthread_stop(state->slot_handler_thread);
>  }
> =20
>  int
> --=20
> 2.43.0
>
