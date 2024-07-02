Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25B79449
	for <linux-staging@lists.linux.dev>; Tue,  2 Jul 2024 18:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719945016; cv=none; b=L7ODkKSIov90KRO40EawQhENA7h/EBP6sAEWdHimxAyqp0AanvXw267Jf4N9iqP8N4cBctcdoRVE1YRXEB0oRmev4hI/OZXBTI3gkF1RTiTnKfowKnPkhggni575y+DEY14BIfi6LFfo0WcKGqn4CpJ1IZi7l662kIf50wEaUD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719945016; c=relaxed/simple;
	bh=a6HNYXH7RS4ePTfCnMvgA7bpikeqLzf3AxiAVEnIj9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rcDB6Nx+4O2+T3enygaPhSv54RrbLJBR3JRZKJb3rre2R3g4bG7Drqa/B12/rN9olWNMTVIaFl9LURkslKFfuQghoX8wvFjNY0/BlQm4A6EI1lOZBJhd2VpkilvLqQLa6GDKk/zeFSbKGsDfVLCHP4mbbxJrmRkU6y66AHrpYf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=LlkwRtzP; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="LlkwRtzP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1719945009; x=1720549809; i=wahrenst@gmx.net;
	bh=7XmUs8gEkJfDQJwXH0qxcDkVCskWPDS1Ao0lu82lgaA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=LlkwRtzPHSFzXBT6wmA+iljlpdwCxR1loac/UXv5rizgbF2olO4ztJXNxmwpI/R+
	 jGl8acNoJvBSlIf5RnWXzt9cXIp4PjsX6FfP4UBBJ3K/PUO1XSt2IuSU+zK52z6QI
	 jz7UEKrlOIG/cyTm5l2HVvukhCArFm0Z8nSklzdKQ51x7fea56Cp+f1eXcsd0udB1
	 FJ6d/ehDJfuH/xuv76uqpHiWp3W6Fe99g3z035WYye8JFUU+dui0trvxXYuSzpbAc
	 FT5Z6oliita7P5vNgaWKHPSRa0EbUN2ZYnRuycaL8dv7aRfLni7cVdKvuJiCTdzBq
	 XcK/aSRJR5qryTcMqA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbAgq-1rrrUP13EW-00o3BU; Tue, 02
 Jul 2024 20:30:09 +0200
Message-ID: <ccc9025c-79d4-4f52-b575-c151ae88797c@gmx.net>
Date: Tue, 2 Jul 2024 20:30:08 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] staging: vc04_services: vchiq_core: Stop kthreads on
 shutdown
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240702164256.754391-1-umang.jain@ideasonboard.com>
 <20240702164256.754391-3-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240702164256.754391-3-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zqIr7leLNuc8XQJ8KvjoJCnq7YZt6RnHpS4M39mwmD+kYu/i9M1
 G0oMZ/I2kC3wkJw9muAjsCUl9dkRlchA2z5b8Q0YMHn+YoPDQSYZAjZpHIKNeZTtC2R1yvw
 hNxWRvuMNei40o3ZClsz8shyiOCHDGB93IhPxNYfZCxoLgaCmCUf6Qf3FX+21ZOHo14X21S
 sgY+ltPQnSSLH5WS3vvag==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:939PPgdW1qY=;B0pmlS5VuQdehDgk5imdsYyV4eK
 5zaPl2WS5LilR1ufnVouSy1ZIg2/jJG/VWajH21kvN+5PAiZGWU1g/yejNKUdk3P6IAQkfQkO
 nE4rJIPucp7810zMml/GS9OfCtNtVkvvKHa3cBBpin6e76iaeeGTBZ3SqYCEmz/CUJrRkKxzb
 tafW7faMOcqVyixSPzg5ITIIN1zf8n7fl4os+a3BtFoZYq5YaPO3mGodvtzkhQ3xJEPKxDCiY
 CeBjc/35PfHdb3CJRTuxNCk0Ox+yte7wq7DAOiPTUvDD5wNyWVmg1pYZ/aPacbfk3hbYebNeW
 Gvuss0+tfz/dbN0CavfomOBiwdijBUWfanMzAFUMmfYZzeYxOjk5Jm+VpIXappGrn/SUC6r0T
 uXthjTeL54b3ceOEw/qVUuTWZ2C/zxfAAlRjekyWSAUKhIkLEbi93rUNvVR1Xdra7vTlQpCh+
 wkGnBzYsF6trvdqwnGNv1anEjsSp1u+SPdmMGro399mrzf59Lr9bggCfWZhvSyTkITnADAz6R
 ErrzCXLx6YGGwid6t5dCCPFvKHMs/5wxSl1KHwSVuvEcAVw5QxjRuNnKJhSRZ5ARu8ppGvYMN
 gsfKvJoUR0py4YCriJfg4rWfFRlrkHb27s4RVQBSpjQP9rjOWes8vmpA9Xrq158HlVeX/MV1z
 RCeufeufnG47kaTopLKbo42W6m2rGww7D4GG2v/hKOAVaqUHcyuw4CvyUPmieE7zLWLcm0UNC
 vGdV+oei/E+4ySReW08LhcudMBIiwGBWFXaKS1EC/vUi1NbkWoLU1SFdULWQKilgXXpCJesiE
 FxUetButDkrE+FSe6vETt//11CVxAbOY1XK0L3ombqMOs=

Hi Umang,

Am 02.07.24 um 18:42 schrieb Umang Jain:
> The various kthreads thread functions (slot_handler_func, sync_func,
> recycle_func) in vchiq_core and vchiq_keepalive_thread_func in
> vchiq_arm should be stopped when the module is unloaded.
>
> Previous attempt were made to address this but later reverted [1]
> due to VC04 firmware corruption. The issue around
> wait_event_interruptible() handling on stopping a kthread has been
> handled in the previous commit. Hence, it is now safe to stop kthreads
> on module unload, without any firmware corruption.
>
> This also completes the "Fix kernel module support" TODO item, hence
> drop it from the list.
>
> [1] commit ebee9ca2f59e ("Revert "staging: vc04_services: vchiq_core: St=
op kthreads on shutdown"")
>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>   drivers/staging/vc04_services/interface/TODO           |  7 -------
>   .../vc04_services/interface/vchiq_arm/vchiq_arm.c      | 10 +++++++++-
>   .../vc04_services/interface/vchiq_arm/vchiq_core.c     |  6 +++---
>   3 files changed, 12 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/stag=
ing/vc04_services/interface/TODO
> index 05f129c0c254..dfb1ee49633f 100644
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
> index 9e6102c43e00..48ec8a2b4601 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -737,6 +737,7 @@ void free_bulk_waiter(struct vchiq_instance *instanc=
e)
>   int vchiq_shutdown(struct vchiq_instance *instance)
>   {
>   	struct vchiq_state *state =3D instance->state;
> +	struct vchiq_arm_state *arm_state;
>   	int ret =3D 0;
>
>   	if (mutex_lock_killable(&state->mutex))
> @@ -749,6 +750,9 @@ int vchiq_shutdown(struct vchiq_instance *instance)
>
>   	dev_dbg(state->dev, "core: (%p): returning %d\n", instance, ret);
>
> +	arm_state =3D vchiq_platform_get_arm_state(state);
> +	kthread_stop(arm_state->ka_thread);
I think we came back to the discussion at the end of march.

Can you please explain why do you think this is the right place to stop
the keep alive thread?

This function vchiq_shutdown() is exported to multiple drivers, but i
think only the VCHIQ itself should stop this thread. Otherwise if we
unload VCHIQ audio this might break VCHIQ video too. Or do i missed
something?
> +
>   	free_bulk_waiter(instance);
>   	kfree(instance);
>
> @@ -1315,7 +1319,7 @@ vchiq_keepalive_thread_func(void *v)
>   		goto shutdown;
>   	}
>
> -	while (1) {
> +	while (!kthread_should_stop()) {
>   		long rc =3D 0, uc =3D 0;
>
>   		if (wait_for_completion_interruptible(&arm_state->ka_evt)) {
> @@ -1782,6 +1786,10 @@ static void vchiq_remove(struct platform_device *=
pdev)
>   	vchiq_debugfs_deinit();
>   	vchiq_deregister_chrdev();
>
> +	kthread_stop(mgmt->state.sync_thread);
> +	kthread_stop(mgmt->state.recycle_thread);
> +	kthread_stop(mgmt->state.slot_handler_thread);
> +
>   	kfree(mgmt);
>   }
>
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_cor=
e.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index b5f5853924a8..623ffd49549b 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -1939,7 +1939,7 @@ slot_handler_func(void *v)
>
>   	DEBUG_INITIALISE(local);
>
> -	while (1) {
> +	while (!kthread_should_stop()) {
>   		DEBUG_COUNT(SLOT_HANDLER_COUNT);
>   		DEBUG_TRACE(SLOT_HANDLER_LINE);
>   		ret =3D remote_event_wait(&state->trigger_event, &local->trigger);
> @@ -1984,7 +1984,7 @@ recycle_func(void *v)
>   	if (!found)
>   		return -ENOMEM;
>
> -	while (1) {
> +	while (!kthread_should_stop()) {
>   		ret =3D remote_event_wait(&state->recycle_event, &local->recycle);
>   		if (ret < 0)
>   			return ret;
> @@ -2006,7 +2006,7 @@ sync_func(void *v)
>   	int svc_fourcc;
>   	int ret;
>
> -	while (1) {
> +	while (!kthread_should_stop()) {
>   		struct vchiq_service *service;
>   		int msgid, size;
>   		int type;

