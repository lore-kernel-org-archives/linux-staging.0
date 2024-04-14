Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2FB23763
	for <linux-staging@lists.linux.dev>; Sun, 14 Apr 2024 11:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713095893; cv=none; b=eoqoZRXYG2wW/h1NAAZUJw3NMzFQyJEIW1L0IjyZ08/OYUpcSML/lo3qsuFcwolx1D+Qi+becz3kP6/lTM8ZAgwusOj8jhJWhAU1Zlf/KCM97WhWXYze/WK27bCcQkLHv5YFbtlKosWGrQ/PQc4hrwgjx7qNT3QKNyVhkqLMnaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713095893; c=relaxed/simple;
	bh=y+qRf5CWRpfO+LqDLqtMYKgkKovr3UYgdsSLZgUSpfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D3paIoxPrfSA9u9rkJVUtAcLFqFFwNRHg1jgthNSGTBC2KmWoKmHyfSX10Q2g3YBBF1/MhIBpyyrcBCiyw6RlJbMa4fM9x1je2qfnvVMRhsJiF/Sh70rNqAvCxsgrij/5nXfsnGoBb7kItHmsHCuxpXCGVAt6x+zgmBNtOCv+6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=NhdAIr0/; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="NhdAIr0/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1713095885; x=1713700685; i=wahrenst@gmx.net;
	bh=XMQYsNEuWSF/E59X+89wYIel8l24nVaaVhv03ifgT+8=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=NhdAIr0/p+SvEeM4Ji7Yizw3Nd5vc4wBuDKBuxsTT1s4WNvZ92osLFeVRgoHX73k
	 v2A9sD8CU105vapQqX5fzs3By+0fMBol7WmcGwwC9482Q5GoKWURhinuf4tiIKsb1
	 lTG4AEJFZPEfxMDf3cgWiJcZjhY/uxrVns/4ey6LXa76gTJh4xGLJxDxXrnIrnTQz
	 mQE005+NZEM37vxzRR1zE+q9uDoVcUdHYW3SSS4BRlmQqZC5g8FR9d/RD+gKMWeO2
	 QZ7WudlJaCAJw0hYmEMD9sq4VqmBYJp+3qDr0prP+NwpyjGFIbAwZoHiT7LITFtRa
	 R2kwaCG7iSCvAykDvg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.167] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVeMA-1sNQym3kaC-00RZI0; Sun, 14
 Apr 2024 13:58:04 +0200
Message-ID: <589da063-ede9-4696-acf6-d0006762b8a1@gmx.net>
Date: Sun, 14 Apr 2024 13:58:04 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/11] staging: vc04_services: Move global memory
 mapped pointer
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev
Cc: Dan Carpenter <error27@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Greg KH <greg@kroah.com>
References: <20240412075743.60712-1-umang.jain@ideasonboard.com>
 <20240412075743.60712-8-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240412075743.60712-8-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:aUpXwh3FRuSIeBraPObKMPI1de6gyp3a0ASXJH+CWosa5ycLjPs
 SXA1+K6ffIYmsp3be3tPOVrLwjXjJ1z7CdEAZEJzFH/p/NGm/p7jzVZ50P3odo+iITlo+2Y
 2gsPk8nACg9cVu6j7L+4IKYDdQaG5wtHpbK9xHpGu1dh4c0EYNqysvYsI4zRmCv27kxK0ul
 mkT798kbMNEUUmCpH2YzQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OsSj2F9d9Hw=;cfjXJevw6xPMIz+bSFiEB/6M192
 oHcf41UW6DEw22NHQ3h4TkI5CZDuZvLEp48PkW0Q+6CuEq5PbGqK89aS9SfHe5BlGhEjtWW1X
 m8NCSpoIiZcjz4+jlBbaPfxEfQL6fYUAYeu/tyOjod0WeZA0gJ6rkq8+fePHwXzVr8wFMdPM9
 B7Ve6fnr8nVdMRKj0GhcAzTqNiLk4r8C/qvZrJvwR3qXBVgYnHjguSgXiBxDk1gR0ENUEu+C2
 L+BCVSef/3VM0zXndWXLa2hXjt53Bh2SIIxoVLvQrgAJQ0FZySbHZoAyk7zgV7bid/ubxYIAe
 IDjwRw6DkBbTxTSWf/N1TS4cNzkfpBYV+XIzlo5loS0H7X8lg597nZfbjDhs8ccixS6elntL3
 Th2JMDYB5TEBMIzBezIw4kO2hxd5Bvlb6oh8kyCwes2cTq+QypZJpF9HUUfM1V5NfRa2kS4E1
 XgyvNt1wy4G2SmEApp1CDHR9HuYLNu8hSq8SGTSG0gH+SRFjUeBhLXerY8+91WFdIxllT/1Tb
 2uOdbIwZtg/H8roOVegJf2sYxbo4xV1wDReWBj3kWaEXyTHDZYW/7cACDRJeEg2cOsBCwjS8h
 0sPDbcIiJaqwCQ/WfAREkPTBn3/jq0v/4xaMlmJBSDSnuXy4qmXKz7+TJ8xpqYt+AQ4bWecnz
 7lxf7gGYM0OXHmWi8y7dzlbMQBjr34sVPjEmmarICNTWM7Jj+yBEPPapynJI0h34hCNMaKCnP
 6CRpP+hvB+VU2efXspZqWX91kvN+cP8lcLIDhH8h2UL+dkxtQ/HcPv6wfuwa/KciWUMMWyWFs
 0PuwpCzNGytnzw8saZfdOdbhCpDC+a6FZM0UcxPH11jcs=

Hi Umang,

Am 12.04.24 um 09:57 schrieb Umang Jain:
> g_regs stores the remapped memory pointer for the vchiq platform.
> It can be moved to struct vchiq_drv_mgmt instead of being global.
>
> Adjust the affected functions accordingly. Pass vchiq_state pointer
> wherever necessary to access struct vchiq_drv_mgmt.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>   .../interface/vchiq_arm/vchiq_arm.c           | 19 +++++++++++--------
>   .../interface/vchiq_arm/vchiq_arm.h           |  2 ++
>   .../interface/vchiq_arm/vchiq_core.c          | 10 +++++-----
>   .../interface/vchiq_arm/vchiq_core.h          |  2 +-
>   4 files changed, 19 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm=
.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 29f9affe5304..9fc98411a2b8 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -129,8 +129,6 @@ struct vchiq_pagelist_info {
>   	unsigned int scatterlist_mapped;
>   };
>
> -static void __iomem *g_regs;
> -
>   static int
>   vchiq_blocking_bulk_transfer(struct vchiq_instance *instance, unsigned=
 int handle, void *data,
>   			     unsigned int size, enum vchiq_bulk_dir dir);
> @@ -139,11 +137,14 @@ static irqreturn_t
>   vchiq_doorbell_irq(int irq, void *dev_id)
>   {
>   	struct vchiq_state *state =3D dev_id;
> +	struct vchiq_drv_mgmt *mgmt;
>   	irqreturn_t ret =3D IRQ_NONE;
>   	unsigned int status;
>
> +	mgmt =3D dev_get_drvdata(state->dev);
Was there a reason against moving it in the declaration?
> +
>   	/* Read (and clear) the doorbell */
> -	status =3D readl(g_regs + BELL0);
> +	status =3D readl(mgmt->regs + BELL0);
>
>   	if (status & ARM_DS_ACTIVE) {  /* Was the doorbell rung? */
>   		remote_event_pollall(state);
> @@ -556,9 +557,9 @@ static int vchiq_platform_init(struct platform_devic=
e *pdev, struct vchiq_state
>   	if (err)
>   		return err;
>
> -	g_regs =3D devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(g_regs))
> -		return PTR_ERR(g_regs);
> +	drv_mgmt->regs =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(drv_mgmt->regs))
> +		return PTR_ERR(drv_mgmt->regs);
>
>   	irq =3D platform_get_irq(pdev, 0);
>   	if (irq <=3D 0)
> @@ -641,8 +642,10 @@ static struct vchiq_arm_state *vchiq_platform_get_a=
rm_state(struct vchiq_state *
>   }
>
>   void
> -remote_event_signal(struct remote_event *event)
> +remote_event_signal(struct vchiq_state *state, struct remote_event *eve=
nt)
>   {
> +	struct vchiq_drv_mgmt *mgmt =3D dev_get_drvdata(state->dev);
> +
>   	/*
>   	 * Ensure that all writes to shared data structures have completed
>   	 * before signalling the peer.
> @@ -654,7 +657,7 @@ remote_event_signal(struct remote_event *event)
>   	dsb(sy);         /* data barrier operation */
>
>   	if (event->armed)
> -		writel(0, g_regs + BELL2); /* trigger vc interrupt */
> +		writel(0, mgmt->regs + BELL2); /* trigger vc interrupt */
>   }
>
>   int
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm=
.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> index 52013bbc5171..10c1bdc50faf 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
> @@ -50,6 +50,8 @@ struct vchiq_drv_mgmt {
>   	char *fragments_base;
>   	char *free_fragments;
>   	unsigned int fragments_size;
> +
> +	void __iomem *regs;
I'm not a expert about cache line alignment, but maybe this should be
moved at the beginning of struct vchiq_drv_mgmt?

Not sure this would have a performance impact.
