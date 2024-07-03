Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF607180A73
	for <linux-staging@lists.linux.dev>; Wed,  3 Jul 2024 16:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720024298; cv=none; b=pE7kRJbYuRhrukIq+h3mRdpW5vI8Uo50jFipWh2kXUjxQ2K/0/UepkCcBQyLa3QLV64EfzFnHeP4sOZOjic65kZTyrcwrk4cH8rn2lCXGIErYtkhqiFt9NL0YAWgeTI9eVmQTZa0XRz4QdoyMcjcQQPTFL3kM/R6HCcIOMVRqiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720024298; c=relaxed/simple;
	bh=LR+8N0Ks2Ggvi9uRJqTi1Y8T6gvpMv+bHz+VwydKV/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c7jQXNgcVxDn37dPW4D6lQI2E/znorHm8Y1aG7/2UhKOXvY7/EjUhSLJ9GUTWYWMie+5Iv/E8l+w43DOH6BQGkce0TU3kk3G+saLj5nlq5QULn+tYIwjqA/8Y1D1k+Qn0XoKYpB9by8Zo9pPb5qQ/E48ekeRfBcQed8Ph/KbWNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=HEf6V4sE; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="HEf6V4sE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1720024292; x=1720629092; i=wahrenst@gmx.net;
	bh=hQUiovCsoTZV08dVJh986xuoVSCDrRQv1Njf7I+0B8M=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=HEf6V4sEeAoAyDP6F7JtRcSNeBwKmNKkT4e0N/PdRF3l/lgaRlKJXSUlbVFMiw+U
	 JcMGptQ6WAp+rfDB2+DVGXAtF8hp8PKyqk8DPbxrl4pEP9NqzUmWN9ZwUJpsoRcjP
	 52QME0/ufDw2mJ4l5FvJdMjKJg5f/ZVPamYY/MzjHmdMCm/CT/GXqMR+DBVr6okYa
	 H+6ryU9OSBcmrzhhnngt3L2828fvDVyrZ4qsoVGy1xJuitaxvuvHmixQWCCav8pcS
	 nfmwWhha4vPVlXyy+mSVhmKnU5cVZw3WaMzNoBN8F29g6BDbAr+uObAzMhMbsOyzh
	 3FeTucseGyUYStLr8Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MOiDd-1smK6u3Srn-00Rtav; Wed, 03
 Jul 2024 18:31:31 +0200
Message-ID: <e9b38efc-1167-4e73-8c98-5cb611804b1e@gmx.net>
Date: Wed, 3 Jul 2024 18:31:31 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] staging: vc04_services: vchiq_core: Stop kthreads
 on vchiq module unload
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20240703131052.597443-1-umang.jain@ideasonboard.com>
 <20240703131052.597443-3-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240703131052.597443-3-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:z5csupt+oodUHjj8hn5Sbv6KL0Bxo31IPKCF5kAx+ZmhiXXwhaS
 9+cuiqUih9Ma5ZVs4FJVm2N+o0FQD0cKWLQT0Kwdt6KIYVY8G16VmLrlbJ8Y7IW8XJnm/qx
 ySQWp1K8umDH+1iqoKS6ZEHZ7uQqxHYOxNvBgKcQshTdYi8QlSTcpnIIxDq5nAI3Ce7ZVdx
 wHBM5fGcw19haoWMGVvrw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Y+wCeTaxgOI=;jDXraK6preHPxEgDzwoIPaPZOhM
 FrorQS/u76jXY63aEvJNJ/Ol/XWJCvrGT5EfuikDrBCUYmaoFZ+LvXMw/HzHxyKJIfq0zKAIR
 KOkW4WX3Yw54+rH2k9NxjjXxvE62/T3q70mXYqPoEKwJiug9tVtAxGLcFPyDq0k2qdHZxCSTT
 BnBGlLTWK+QnvvfauxLE3EfsygYVIj9Y19aTaRz6+1fPjyCw1JEhMp/kIt/IexH6pP6rheAUl
 NDjVDacpWPI1UstKGxHFOt9rq0Qaop95U6QwYEOP+vwjJdEH8u2Rmy6rIqUfQ1wQES8+cx1C9
 jvxOxIPy1jeu/TUuLSnGQ35Edpinz0SzFHkx1xppoF8kRjbhFVx7+d6kxHbPmK99TAQpQz79M
 O6XgDgVRDzImwV5ou8vBmxuVrLdlCcFT7givMVYcvxcNAwxd+Hmed7ykUe7WiCTUeWKC5KOKb
 C+BUL8pCPiNcccbLozwbUoHHE94A7wOFuytXvbblKFIeySa/OJKMiq/GUGgO7tglJpblrqib4
 h/xyGthvFrupQcwAh8yBVdZ+G8BsqLD3Gnw860PxZJg9rDqGnHz8xVIXaBEpNEe/hd9m2Zcjm
 VNFdYQYxWFJl+FJcSiOglBd/FJSra5Z2KOft63grZtwIhJ7oewovNOhqHwOl0xvpKxXhiFLxZ
 hSfq0knnTA4/cFh2gSDODNyUVZ9u7tvVTngwt3wDJpsEfigjImx5V9alerVtIzP3a/gTIuM4s
 WC1Hib8gHxpik+U0fBBvPhdv1DZtn8b1ieZYFu8PUrG7jtekldiVr4oVS1uifhtN+ZqJ5Fw1v
 bLFfSM49cVD1/SNOWPgGyGq1qATbvbTXW7dvENFwc7IWw=

Hi Umang,

Am 03.07.24 um 15:10 schrieb Umang Jain:
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
> index 9e6102c43e00..c4d97dbf6ba8 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -1315,7 +1315,7 @@ vchiq_keepalive_thread_func(void *v)
>   		goto shutdown;
>   	}
>
> -	while (1) {
> +	while (!kthread_should_stop()) {
>   		long rc =3D 0, uc =3D 0;
>
>   		if (wait_for_completion_interruptible(&arm_state->ka_evt)) {
> @@ -1776,12 +1776,20 @@ static int vchiq_probe(struct platform_device *p=
dev)
>   static void vchiq_remove(struct platform_device *pdev)
>   {
>   	struct vchiq_drv_mgmt *mgmt =3D dev_get_drvdata(&pdev->dev);
> +	struct vchiq_arm_state *arm_state;
>
>   	vchiq_device_unregister(bcm2835_audio);
>   	vchiq_device_unregister(bcm2835_camera);
>   	vchiq_debugfs_deinit();
>   	vchiq_deregister_chrdev();
>
> +	kthread_stop(mgmt->state.sync_thread);
> +	kthread_stop(mgmt->state.recycle_thread);
> +	kthread_stop(mgmt->state.slot_handler_thread);
This is fine as long as vchiq_probe() is successful. But we also need to
cleanup the kthreads during vchiq_probe() in case something went wrong
after vchiq_init_state(). I think we should introduce a helper to
cleanup them up.

Finally the subject needs to be adjusted too.
> +
> +	arm_state =3D vchiq_platform_get_arm_state(&mgmt->state);
> +	kthread_stop(arm_state->ka_thread);
> +
>   	kfree(mgmt);
>   }
>
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_cor=
e.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index dd70f2881eca..50af04b217f4 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -1941,7 +1941,7 @@ slot_handler_func(void *v)
>
>   	DEBUG_INITIALISE(local);
>
> -	while (1) {
> +	while (!kthread_should_stop()) {
>   		DEBUG_COUNT(SLOT_HANDLER_COUNT);
>   		DEBUG_TRACE(SLOT_HANDLER_LINE);
>   		ret =3D remote_event_wait(&state->trigger_event, &local->trigger);
> @@ -1986,7 +1986,7 @@ recycle_func(void *v)
>   	if (!found)
>   		return -ENOMEM;
>
> -	while (1) {
> +	while (!kthread_should_stop()) {
>   		ret =3D remote_event_wait(&state->recycle_event, &local->recycle);
>   		if (ret)
>   			return ret;
> @@ -2008,7 +2008,7 @@ sync_func(void *v)
>   	int svc_fourcc;
>   	int ret;
>
> -	while (1) {
> +	while (!kthread_should_stop()) {
>   		struct vchiq_service *service;
>   		int msgid, size;
>   		int type;

