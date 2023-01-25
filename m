Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A09A1102
	for <linux-staging@lists.linux.dev>; Wed, 25 Jan 2023 05:30:35 +0000 (UTC)
Received: from [192.168.1.103] (unknown [103.86.18.176])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 29FBF6D0;
	Wed, 25 Jan 2023 06:30:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1674624626;
	bh=8jKxx++F8XtA53exWh94oMQrjqFa/mIS84/1iNnaZjM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bSaI9nws4dsOoYvo07sWA/8PfB52nN6IsQNEgrpTI8pz2WGKbrzHcbbB+SCPk7L9K
	 EjU2mvfvC9/FnKC1iqBQSiAjL+QfJEQ7F/K246hxBHx0oCDZ4Zje7LbAlvUyRRmGgI
	 OpzBvnsXwrvYNeQCOTGGgM2BrWpOS239Pqruv0Wk=
Message-ID: <7854b6de-126a-34e5-ed53-fd95510dda47@ideasonboard.com>
Date: Wed, 25 Jan 2023 11:00:18 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] staging: vchiq_arm: Improve error log for
 vchiq_platform_init
To: Stefan Wahren <stefan.wahren@i2se.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <f.fainelli@gmail.com>
Cc: linux-staging@lists.linux.dev, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20230123191629.21019-1-stefan.wahren@i2se.com>
Content-Language: en-US
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <20230123191629.21019-1-stefan.wahren@i2se.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefan,

Thank you for the patch

On 1/24/23 12:46 AM, Stefan Wahren wrote:
> During sending the base address of the slots to the VideoCore
> firmware via mailbox property, issues could happened on the ARM
> and on the VideoCore side. So better separate the error handling
> in order to provide more details. This should help to narrow
> down the possible cause.
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Reviewed-by: Umang Jain <umang.jain@ideasonboard.com>

> ---
>   .../vc04_services/interface/vchiq_arm/vchiq_arm.c    | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 4a57ff760106..2ae1d3f5d500 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -546,9 +546,15 @@ int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
>   	channelbase = slot_phys;
>   	err = rpi_firmware_property(fw, RPI_FIRMWARE_VCHIQ_INIT,
>   				    &channelbase, sizeof(channelbase));
> -	if (err || channelbase) {
> -		dev_err(dev, "failed to set channelbase\n");
> -		return err ? : -ENXIO;
> +	if (err) {
> +		dev_err(dev, "failed to send firmware property: %d\n", err);
> +		return err;
> +	}
> +
> +	if (channelbase) {
> +		dev_err(dev, "failed to set channelbase (response: %x)\n",
> +			channelbase);
> +		return -ENXIO;
>   	}
>   
>   	vchiq_log_info(vchiq_arm_log_level, "vchiq_init - done (slots %pK, phys %pad)",

