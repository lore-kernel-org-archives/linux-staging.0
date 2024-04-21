Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1623625
	for <linux-staging@lists.linux.dev>; Sun, 21 Apr 2024 08:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713689645; cv=none; b=TWTqTR5JXEuOreoSWJo3Zd6JESRbq7cZNjHEJqvvmvdvhqyKdXQZCk1QPi0g2WC8LHPD3QF7hPTrqjLnKwaJlGO2cALeNChXVZq0IWNAwULSIljhviHk+IWxuuIOD8bBd6SfFvOaiQydbbZxWGclRac/7yCpRDx9GaROzBJ3xBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713689645; c=relaxed/simple;
	bh=eaVJSKc5oCRD99pk5u5bgQtIJBks9d5keyCfCBN20Fg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XMvKTgtbY1m70sY3hGLEFgXUZmWugOVTZxLkvaYMbXazVCkcUV7wPkg4hTwe+MrfFMIMqbW/k7uhyOyMvgJFDl26pSmjy405bYaectHkwGEeE6jw/2bAsZ/Gknio0fLUyMXWBjNYRRibHQNfWhoG5p8DAiGEJsJxt11/I/JRpMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Y5fm++7f; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Y5fm++7f"
Received: from [192.168.1.105] (unknown [103.251.226.10])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 15482674;
	Sun, 21 Apr 2024 10:53:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713689592;
	bh=eaVJSKc5oCRD99pk5u5bgQtIJBks9d5keyCfCBN20Fg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y5fm++7fhszfF+0TYufHuIjCh8LCZLTtTBbuLgRQplSLqLlZqxlvKCW6T+bEsm17O
	 S++stCD6Z425p+jDWzJbXJI9NZ7DtpeG8HJI9FhclB1vgpmpZJe85fIkMlDwY96/EB
	 tlX6Hck7/obF3q2eak+HSeFDUBWEuDTfWLJ6+eYc=
Message-ID: <6b83abcf-5cb1-4e61-b839-b4d51abda18a@ideasonboard.com>
Date: Sun, 21 Apr 2024 14:23:54 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] staging: vchiq_core: Use printk messages for devices
Content-Language: en-US
To: Stefan Wahren <wahrenst@gmx.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20240420115351.27713-1-wahrenst@gmx.net>
 <20240420115351.27713-2-wahrenst@gmx.net>
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <20240420115351.27713-2-wahrenst@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefan,

Thank you for the patch

On 20/04/24 5:23 pm, Stefan Wahren wrote:
> Now that struct vchiq_state has a device reference, we can convert
> the remaining printk message helpers.
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Umang Jain <umang.jain@ideasonboard.com>

> ---
>   .../vc04_services/interface/vchiq_arm/vchiq_core.c     | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index 3397365e551e..129d73fec2bf 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -697,7 +697,8 @@ reserve_space(struct vchiq_state *state, size_t space, int is_blocking)
>
>   		if (tx_pos == (state->slot_queue_available * VCHIQ_SLOT_SIZE)) {
>   			complete(&state->slot_available_event);
> -			pr_warn("%s: invalid tx_pos: %d\n", __func__, tx_pos);
> +			dev_warn(state->dev, "%s: invalid tx_pos: %d\n",
> +				 __func__, tx_pos);
>   			return NULL;
>   		}
>
> @@ -1732,10 +1733,9 @@ parse_message(struct vchiq_state *state, struct vchiq_header *header)
>   				break;
>   			}
>   			if (queue->process != queue->remote_insert) {
> -				pr_err("%s: p %x != ri %x\n",
> -				       __func__,
> -				       queue->process,
> -				       queue->remote_insert);
> +				dev_err(state->dev, "%s: p %x != ri %x\n",
> +					__func__, queue->process,
> +					queue->remote_insert);
>   				mutex_unlock(&service->bulk_mutex);
>   				goto bail_not_ready;
>   			}
> --
> 2.34.1
>

