Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A1214D6EB
	for <linux-staging@lists.linux.dev>; Wed, 27 Mar 2024 20:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711572049; cv=none; b=ChWitSJ4610qMtEju/gTl1lSYV2jBNzzlEMLtzeGIQGbyUwq9rv0tLQLoYjDRLi26Li7+vsPPAIXt2WPoJN5sHBbNuYuX/shJ3uDXqFpsSblDNYhA+G4v6sB/PphPDLkmRM0iwc9ABllohfHsBN8eCWMXHHRPmPt29dvA+I6sJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711572049; c=relaxed/simple;
	bh=Q5LVPDATQ00lsMj84TW1jf1AvRcZVbiLwuNTtQKS4dg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FwpOzDPv2zMBJhCgDPpC1TPbVFmvHlBAvQz7d0k2MG5kX64X9c4glvO1+pcVPBd0VC0uPFSa0RFKWkg8GveJxmQ0TMajP5I/gbzUZnprE0e2z2GQJrmCPzciyo813zgTedKEZKF4BIRdKxfYI33wZGdxOJv8ke195xeOfHdWLcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=cqOchNt/; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="cqOchNt/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1711572039; x=1712176839; i=wahrenst@gmx.net;
	bh=Q5LVPDATQ00lsMj84TW1jf1AvRcZVbiLwuNTtQKS4dg=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=cqOchNt/hATwwglTCGcEsMdR7gGuJb5Pj73aAR5xL4Nn8dMEmdPew5eqiruYnTUB
	 SzMyhzhR9yMR1OW/ALJIyjdl6z88JerhGGvqESvWWRvlEGZ2FzHOLgD+NApL/+rA9
	 IDLx90ualJfSU8a1A2KFnQQsIMcUHb65vvGdbraKrfmcdEC71g6ujzboEI/RGt7O5
	 W0yYyQ7lWkjSjEMbpBs6yKxRHWLYbSX3vHKkTNsGOhoso6/atjBbGjsLkEoRB7suD
	 B0p494YAPXaPnyO/SNVpET5y8ilyuDF72BiT6/i/v7BCT2+MquNqamO3ttENuqpt5
	 4JJ6ZRzbWZJD+/nsQA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUXtY-1sG59b0FCy-00QQqh; Wed, 27
 Mar 2024 21:40:39 +0100
Message-ID: <7fc1488b-a0d8-468e-a13d-92ee6e23d657@gmx.net>
Date: Wed, 27 Mar 2024 21:40:38 +0100
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
 <21fcc924-5502-48b6-9d42-b3eed5483944@gmx.net>
 <f4b729c7-744e-4c26-bdc0-23880a3bc4f5@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <f4b729c7-744e-4c26-bdc0-23880a3bc4f5@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:aj6gJ/Km0znhlGOVdrSPOQzTcTdWY8Wc1lcCJoUkoNv5+K9Vg1q
 QyfVRK7Cxz4eyVadDYbVbt1+f0T8vVs4aie/x6Id34z4sheM0dTY7GDzGbLWmWcgc5ygEkV
 u6vQLdKjGfK2FJkQcv2Xqo34hNcRVZcB0HRPeXrdNgHt71nwxruBfLxnrMyKyuYt+WwoWoZ
 twdfRL8BV4EIhMYC88yvQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:S3e4S50Zifc=;Cj78aL6COrkK6JbMzDJk1/vX7/G
 QSV5YJMDCoiZy+imAfC0pZjBe13QpRBpBN74g/ekA/K9QAetAejd5mX2vlgP7xPPuyTdcDA97
 Who9FGIF/ra8nKQsoA+kdH7HDKutsN7/HZm0D06xwPnIEliUC3HxPNfLQnZVAl9EjUUNajgeT
 lI9bh2PWAvKbkiEvvS66Bg1m1pgp306xJEr9U7Mq9j/NeVPoELt9/eEKMhEr9oDXPKFGJzQql
 UUNRhcrf/Kkr855S5swY1GsFp2vnKrC0hBh3xmJUqjx8JjXdYvokm7OK69aa6T2WnAbKdGf15
 slSrAPYjuh3GNTzKQG0YqSQt/WIYixOSbcH43laooNvr3LdQpK0aFkussUwn+5QUSLYkYbT9Q
 d2+PX12x4ORWLj2Xz9dicsMQ/rzgwq1lHiWtR/KTK7JxxeriN691HNS4kznMxiZU6CB1iY9PD
 gW5joFG9T7izYRoQCg3rAKHPeZI/IFf3vdIcsZ6T4muir4YcYEv71sbRIOQXSE9r8RNMGcRXG
 661Vk8gXatWExY+Z12WUkP5XB31WsBXU/S/4dFLz95Av5F35WXZNNvlol91RiYX7jV5hvWSYZ
 WST2/OF59KrVXU2DfHOW+XndFofKjTu3SShxtAZejZlhwy3/uGg9nZYi067KKqG1n5Ek8PcGN
 DEW9U9qMD5pFxi0nv5HbdRWV9m/QQXFz1Gfam8w0q1/68kyLoSjK4Zaxi6rn/uk1syI78GKu/
 yjzeqxeN5Fc6p6r0IMCdPC24lp/WSyD1ud9x1XnagQcX1B8lVpoYXtdCI/QXuvxmJDxaWOnAA
 wP8VhI1c/e5kTtd9yXrLjmYXzK99xBQWhMXEYZ0LUnEh0=

Hi Umang,

Am 27.03.24 um 21:00 schrieb Umang Jain:
> Hi Stefan
>
> On 27/03/24 11:49 pm, Stefan Wahren wrote:
>> Hi Umang,
>>
>> Am 21.03.24 um 14:07 schrieb Umang Jain:
>>> The various kthreads thread functions (slot_handler_func, sync_func,
>>> recycle_func) in vchiq_core and vchiq_keepalive_thread_func in
>>> vchiq_arm should be stopped on vchiq_shutdown().
>>>
>>> This also address the following TODO item:
>>> =C2=A0 * Fix kernel module support
>>>
>>> hence drop it from the TODO item list.
>>>
>>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
>>> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>>> ---
>>> =C2=A0 drivers/staging/vc04_services/interface/TODO=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 -------
>>> =C2=A0 .../vc04_services/interface/vchiq_arm/vchiq_arm.c=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 8 ++++++--
>>> =C2=A0 .../vc04_services/interface/vchiq_arm/vchiq_core.c=C2=A0=C2=A0=
=C2=A0=C2=A0 | 10
>>> +++++++---
>>> =C2=A0 3 files changed, 13 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/staging/vc04_services/interface/TODO
>>> b/drivers/staging/vc04_services/interface/TODO
>>> index 05eb5140d096..57a2d6761f9b 100644
>>> --- a/drivers/staging/vc04_services/interface/TODO
>>> +++ b/drivers/staging/vc04_services/interface/TODO
>>> @@ -16,13 +16,6 @@ some of the ones we want:
>>> =C2=A0=C2=A0=C2=A0 to manage these buffers as dmabufs so that we can z=
ero-copy import
>>> =C2=A0=C2=A0=C2=A0 camera images into vc4 for rendering/display.
>>>
>>> -* Fix kernel module support
>>> -
>>> -Even the VPU firmware doesn't support a VCHI re-connect, the driver
>>> -should properly handle a module unload. This also includes that all
>>> -resources must be freed (kthreads, debugfs entries, ...) and global
>>> -variables avoided.
>>> -
>>> =C2=A0 * Documentation
>>>
>>> =C2=A0 A short top-down description of this driver's architecture
>>> (function of
>>> diff --git
>>> a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>>> b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>>> index ad506016fc93..1d21f9cfbfe5 100644
>>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>>> @@ -726,8 +726,9 @@ void free_bulk_waiter(struct vchiq_instance
>>> *instance)
>>>
>>> =C2=A0 int vchiq_shutdown(struct vchiq_instance *instance)
>>> =C2=A0 {
>>> -=C2=A0=C2=A0=C2=A0 int status =3D 0;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vchiq_state *state =3D instance-=
>state;
>>> +=C2=A0=C2=A0=C2=A0 struct vchiq_arm_state *arm_state;
>>> +=C2=A0=C2=A0=C2=A0 int status =3D 0;
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (mutex_lock_killable(&state->mutex))
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EAGAIN;
>>> @@ -739,6 +740,9 @@ int vchiq_shutdown(struct vchiq_instance *instance=
)
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(state->dev, "core: (%p): return=
ing %d\n", instance,
>>> status);
>>>
>>> +=C2=A0=C2=A0=C2=A0 arm_state =3D vchiq_platform_get_arm_state(state);
>>> +=C2=A0=C2=A0=C2=A0 kthread_stop(arm_state->ka_thread);
>>> +
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free_bulk_waiter(instance);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kfree(instance);
>>>
>>> @@ -1310,7 +1314,7 @@ vchiq_keepalive_thread_func(void *v)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto shutdown;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>
>>> -=C2=A0=C2=A0=C2=A0 while (1) {
>>> +=C2=A0=C2=A0=C2=A0 while (!kthread_should_stop()) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 long rc =3D 0, =
uc =3D 0;
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (wait_for_co=
mpletion_interruptible(&arm_state->ka_evt)) {
>>> diff --git
>>> a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
>>> b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
>>> index 76c27778154a..953ccd87f425 100644
>>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
>>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
>>> @@ -1936,7 +1936,7 @@ slot_handler_func(void *v)
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DEBUG_INITIALISE(local);
>>>
>>> -=C2=A0=C2=A0=C2=A0 while (1) {
>>> +=C2=A0=C2=A0=C2=A0 while (!kthread_should_stop()) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DEBUG_COUNT(SLO=
T_HANDLER_COUNT);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DEBUG_TRACE(SLO=
T_HANDLER_LINE);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 remote_event_wa=
it(&state->trigger_event, &local->trigger);
>>> @@ -1978,7 +1978,7 @@ recycle_func(void *v)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!found)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
>>>
>>> -=C2=A0=C2=A0=C2=A0 while (1) {
>>> +=C2=A0=C2=A0=C2=A0 while (!kthread_should_stop()) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 remote_event_wa=
it(&state->recycle_event, &local->recycle);
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 process_free_qu=
eue(state, found, length);
>>> @@ -1997,7 +1997,7 @@ sync_func(void *v)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 state->remote->slot_sync);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int svc_fourcc;
>>>
>>> -=C2=A0=C2=A0=C2=A0 while (1) {
>>> +=C2=A0=C2=A0=C2=A0 while (!kthread_should_stop()) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vchiq_se=
rvice *service;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int msgid, size=
;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int type;
>>> @@ -2844,6 +2844,10 @@ vchiq_shutdown_internal(struct vchiq_state
>>> *state, struct vchiq_instance *instan
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (void)vchiq_rem=
ove_service(instance, service->handle);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vchiq_service_p=
ut(service);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 kthread_stop(state->sync_thread);
>>> +=C2=A0=C2=A0=C2=A0 kthread_stop(state->recycle_thread);
>>> +=C2=A0=C2=A0=C2=A0 kthread_stop(state->slot_handler_thread);
>>
>> i had a little bit time to look at the corrupt issue, i think this
>> caused by this change. This function is called by vchiq_shutdown which
>> is exported and used by VCHIQ user drivers like bcm2835-audio or
>> mmal-vchiq. So this is absolutely not the right place to stop the kerne=
l
>> threads and the issue is not specific to the Raspberry Pi 3.
>
> Can you try building with ARCH=3D64-bit and testing it please? Please
> refer to the cover section where I have tested 64-bit on rpi4.
sorry, i don't understand the point behind this. As i mention it's clear
that we cannot call kthread_stop() from vchiq_shutdown_internal because
this function is also used by different drivers. The calls to create the
kthreads should be symmetric to the stop calls. From my understanding
the kthreads are created from vchiq_probe(), so the kthreads should
stopped directly or indirectly from vchiq_remove().

This has nothing to do with Raspberry Pi 3 vs 4 or 32 bit vs 64 bit. It
was just luck that it worked in your case.
>
> Regarding 32-bit build for my Pi4 - everything gets broken for me RPi4
> (if I try to test via SD-card) ... and I am also having problems with
> setting up a NFS-mounted 32-bit rootfs today so can't boot the pi
> through NFS with 32-bit kernel :(
>
> My Pi3 power cable/microUSB went missing, so I have ordered a new one.
> It will take a couple of days to arrive before=C2=A0 I can test it there=
.
>
>
>>
>>> =C2=A0 }
>>>
>>> =C2=A0 int
>

