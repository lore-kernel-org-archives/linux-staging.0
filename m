Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A16C130A63
	for <linux-staging@lists.linux.dev>; Wed, 27 Mar 2024 18:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711563553; cv=none; b=EBTSTr57pBymuslZUeZyCfX4vW9IhH0DSkYWAHeUUpYey000PCM2RGPK2IX+sJkCFXCQWrhf1JF/kB2UneIPtFM9lBJ2mZAvY4+2+Kigwp8mmRx6EEsKMW8KJY4cLvhSaMxJYVEDn7OxqFHPhwgZOyqgAfKl6RtM2Lj3/QEhPw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711563553; c=relaxed/simple;
	bh=658QOmJD3Wq31JbXH7FbP81pWj5tdNCNAFEcynv7Aig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SEhpToZ9QKOtbkE6k6qfdR0PYMJH6CgHvDgYiw2v8FoxioNZVLQ/k1IwdR8utT/NC1piwuRL7/pUWMVwjynawVbuymJnrQbeCGDsr0vLTFcf0cgT3JTc//rsirXSj8AvdA0UrGlmxFpk/4mHpsvj/7H0FiF18YkXtto4XM01zno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=CaH0jIzz; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="CaH0jIzz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1711563543; x=1712168343; i=wahrenst@gmx.net;
	bh=143qTFQiAVxia11VXgcM+JMxIHQ7+b1B650Ou/wesHA=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=CaH0jIzz9B6E65kA6EH8qrm+7MeZOA/TATkK9dikvHW4zeUkvk6pZ5YjutnXqDe3
	 aTt1OoxFxZp2rWtmt7iNKIu1NYmmAyNFYR/BIULJxTZjyqFNUA1bgfe8VONwSCCFO
	 nwAGRVb0KyFmfznqJpHO3f6NogdD1RN92bMgHr9ARBWhL+9Pdw988F0wwM/5OeHh8
	 G6ynkseb5TbYFlby0pA70Xtawf5SKbkD7tn60Mgy8NemIN+irxsZF+mxepCVaqSqb
	 d6kO3LVdR8Kbp22KLyvelN0xU77iHKS7gTpDcGUh3NWCBqqide8HyooAJODUE53wc
	 GjLaKMhTLskGfNkxQQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCbIn-1rz8Fg1chf-009k7e; Wed, 27
 Mar 2024 19:19:03 +0100
Message-ID: <21fcc924-5502-48b6-9d42-b3eed5483944@gmx.net>
Date: Wed, 27 Mar 2024 19:19:02 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] staging: vc04_services: vchiq_core: Stop kthreads
 on shutdown
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Greg KH <greg@kroah.com>
References: <20240321130737.898154-1-umang.jain@ideasonboard.com>
 <20240321130737.898154-6-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240321130737.898154-6-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rXwSbbKxlHwZgY324CrSA1h7Oye8d4ljto0MlAtTLWkhtTgY7Ez
 4elIvgWNE9BudZPuShnrqgHQf8eOloETt0inLyNC+yyzWbu3gugXq/J65KPmWXwzu/OGxKM
 bT2pGSEOyfgsC6w4kkBF6xDci4KUHxjZNSCSOMm3mdBqlOfEw8ilBV4A4LUzD2hbXUiFrZE
 RYjiWVC2F64FA0oCZTKrw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zrTwzpoMKQo=;8iZ6S5Lqfvg7Wpm2mTOyivpuO5O
 xuK/6pzUW9RTvSapgd2zLHxq5/G8tK0m/4PEBdmndDWTyKFqKDmo+cXowt+uYf/p6KrDlHDk6
 nFpFg/bGRiXl7ci2mpViAjrr/iPj9M0SKpCbUBmz6lVyNBIAAI6TYjYVAcvtws1vsTH6nSf9y
 B6batYDWJvy7lFLzkESQqVdiFaUB7OzJX4wELOlN6a79FFnY4bwcFxUfSUNZIpCy1qe0Ct0h7
 2GeyYUhMpBBfV/OsaawTuWMdOppl2aV9Yl6pZjir+HvyM23qnpV0SOMkohorLJV7jpz/8ju7j
 PHgUbOMdFw1qFddCUndmZxN+RZ+Ld/lelLhs+hR+6dO3X/Du0ctrt6iMUPogpsfg2hCXOUS0E
 0nnXAk1foca0gB+EGkUPOR4//XN3dh3aP91uudSu2oa1dteFQgdkeuF+aqWuPaECNmoRUhaUe
 cypVUU1wlrNjqQ9f6KmAAlBZF61LxxSYn6Q/z6KKw4/+xGfWnWGFRnCTcr71a98LBR0rQiTky
 XWUdKeyZYIA0tRh3qjA9dpepCdmEUh6cbUlGb5xeYf7FH1DdU27hw+0K6YVEuAxpVggTitKNv
 BgXx3+F8LeFR1t3eri54m4scO5GbmsJFGK5YxMf4GrcOsWMvT9FR2k9Kr0/QECyqaVeOYmbFl
 qI1Sl+lup1ZkeRpdatjskHakoPWVeHlUrMP0EDlhd7CfpE+H6S2n0aJYHHnzq3+jGWe0wx5cQ
 wg01aQyVMESVfieewR9I4nFH3vopsYHqnfbN0xcPXU9TQ1IJBkFBw1hlscZa4yIdjwOkU78N1
 cCyCQgmJz6ecildQz/SOCAiIrIlDVI31HorkM1CuARSn0=

Hi Umang,

Am 21.03.24 um 14:07 schrieb Umang Jain:
> The various kthreads thread functions (slot_handler_func, sync_func,
> recycle_func) in vchiq_core and vchiq_keepalive_thread_func in
> vchiq_arm should be stopped on vchiq_shutdown().
>
> This also address the following TODO item:
>   * Fix kernel module support
>
> hence drop it from the TODO item list.
>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>   drivers/staging/vc04_services/interface/TODO           |  7 -------
>   .../vc04_services/interface/vchiq_arm/vchiq_arm.c      |  8 ++++++--
>   .../vc04_services/interface/vchiq_arm/vchiq_core.c     | 10 +++++++---
>   3 files changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/stag=
ing/vc04_services/interface/TODO
> index 05eb5140d096..57a2d6761f9b 100644
> --- a/drivers/staging/vc04_services/interface/TODO
> +++ b/drivers/staging/vc04_services/interface/TODO
> @@ -16,13 +16,6 @@ some of the ones we want:
>     to manage these buffers as dmabufs so that we can zero-copy import
>     camera images into vc4 for rendering/display.
>
> -* Fix kernel module support
> -
> -Even the VPU firmware doesn't support a VCHI re-connect, the driver
> -should properly handle a module unload. This also includes that all
> -resources must be freed (kthreads, debugfs entries, ...) and global
> -variables avoided.
> -
>   * Documentation
>
>   A short top-down description of this driver's architecture (function o=
f
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm=
.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index ad506016fc93..1d21f9cfbfe5 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -726,8 +726,9 @@ void free_bulk_waiter(struct vchiq_instance *instanc=
e)
>
>   int vchiq_shutdown(struct vchiq_instance *instance)
>   {
> -	int status =3D 0;
>   	struct vchiq_state *state =3D instance->state;
> +	struct vchiq_arm_state *arm_state;
> +	int status =3D 0;
>
>   	if (mutex_lock_killable(&state->mutex))
>   		return -EAGAIN;
> @@ -739,6 +740,9 @@ int vchiq_shutdown(struct vchiq_instance *instance)
>
>   	dev_dbg(state->dev, "core: (%p): returning %d\n", instance, status);
>
> +	arm_state =3D vchiq_platform_get_arm_state(state);
> +	kthread_stop(arm_state->ka_thread);
> +
>   	free_bulk_waiter(instance);
>   	kfree(instance);
>
> @@ -1310,7 +1314,7 @@ vchiq_keepalive_thread_func(void *v)
>   		goto shutdown;
>   	}
>
> -	while (1) {
> +	while (!kthread_should_stop()) {
>   		long rc =3D 0, uc =3D 0;
>
>   		if (wait_for_completion_interruptible(&arm_state->ka_evt)) {
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_cor=
e.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index 76c27778154a..953ccd87f425 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -1936,7 +1936,7 @@ slot_handler_func(void *v)
>
>   	DEBUG_INITIALISE(local);
>
> -	while (1) {
> +	while (!kthread_should_stop()) {
>   		DEBUG_COUNT(SLOT_HANDLER_COUNT);
>   		DEBUG_TRACE(SLOT_HANDLER_LINE);
>   		remote_event_wait(&state->trigger_event, &local->trigger);
> @@ -1978,7 +1978,7 @@ recycle_func(void *v)
>   	if (!found)
>   		return -ENOMEM;
>
> -	while (1) {
> +	while (!kthread_should_stop()) {
>   		remote_event_wait(&state->recycle_event, &local->recycle);
>
>   		process_free_queue(state, found, length);
> @@ -1997,7 +1997,7 @@ sync_func(void *v)
>   			state->remote->slot_sync);
>   	int svc_fourcc;
>
> -	while (1) {
> +	while (!kthread_should_stop()) {
>   		struct vchiq_service *service;
>   		int msgid, size;
>   		int type;
> @@ -2844,6 +2844,10 @@ vchiq_shutdown_internal(struct vchiq_state *state=
, struct vchiq_instance *instan
>   		(void)vchiq_remove_service(instance, service->handle);
>   		vchiq_service_put(service);
>   	}
> +
> +	kthread_stop(state->sync_thread);
> +	kthread_stop(state->recycle_thread);
> +	kthread_stop(state->slot_handler_thread);

i had a little bit time to look at the corrupt issue, i think this
caused by this change. This function is called by vchiq_shutdown which
is exported and used by VCHIQ user drivers like bcm2835-audio or
mmal-vchiq. So this is absolutely not the right place to stop the kernel
threads and the issue is not specific to the Raspberry Pi 3.

>   }
>
>   int
