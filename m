Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDD018C323
	for <linux-staging@lists.linux.dev>; Wed,  5 Jun 2024 06:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717570315; cv=none; b=My0nc5cfQBDe6Lho+LzIJr8pygTDwEfjU7vBEp3/RTZ9iAIej+WCYb3tmU9yRAExynVn/VAQdP45HaQ8OL3X8kFfwR1CawzuK6dIwMtlEIaRXDW624FPqw4FdVFB3DQilYMCsElc4zJN/1FgYo+30QPPsopvWC3Pmh3gwg55Ncc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717570315; c=relaxed/simple;
	bh=JQvTXp/u13hNE9HZTmN3031xJuoZnsQBXSw2U3Npr1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sz2+elC/QnGBtwXTgbFYxT/RcTNv/OQ+FZYqkH/3xV9u0BOap1YnZkenRPNvECcqI3WzvKj5VAiQD5CcAVL7KgbG8RnAQIxw8XELR+1clH/8aUDNqfOjFUu3+CIhmfFwGMIrBKoCx++jouqfMLvfjmdGjh9e+eyzpO5E52RkwAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=imZHXs/A; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="imZHXs/A"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C2E915C5;
	Wed,  5 Jun 2024 08:51:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717570303;
	bh=JQvTXp/u13hNE9HZTmN3031xJuoZnsQBXSw2U3Npr1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=imZHXs/AANJYbOULXt7F5RVeuyEPyrKtaRJUDSlqL1PwfooUEON30pqtcQ5k4/oYp
	 wvElV6UWTK1irpVO60p0SgOdhpcC0etJMtLvoomK46JY2HfagbaSreBGKBek+AvvSk
	 lw1yH9dL77hVdGWRX6FOizFmN2tH+j+11orIWuL0=
Date: Wed, 5 Jun 2024 09:51:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 01/11] staging: vchiq_arm: Replace variable ret with
 status
Message-ID: <20240605065134.GC879@pendragon.ideasonboard.com>
References: <20240604172904.61613-1-wahrenst@gmx.net>
 <20240604172904.61613-2-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240604172904.61613-2-wahrenst@gmx.net>

Hi Stefan,

Thank you for the patch.

On Tue, Jun 04, 2024 at 07:28:54PM +0200, Stefan Wahren wrote:
> The variable ret is just storing the result of last function
> call like the variable status. So replace ret with status
> and make a consistent use of this variable.

I would have gone the other way around, and replaced 'status' with 'ret'
as the latter is more commonly used for this purpose in kernel code. I
know it will generate more churn, but I think the result will be more
maintainable.

> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> index 69daeba974f2..e2f4aa00cb70 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
> @@ -1298,7 +1298,6 @@ vchiq_keepalive_thread_func(void *v)
>  	int status;
>  	struct vchiq_instance *instance;
>  	unsigned int ka_handle;
> -	int ret;
> 
>  	struct vchiq_service_params_kernel params = {
>  		.fourcc      = VCHIQ_MAKE_FOURCC('K', 'E', 'E', 'P'),
> @@ -1307,9 +1306,10 @@ vchiq_keepalive_thread_func(void *v)
>  		.version_min = KEEPALIVE_VER_MIN
>  	};
> 
> -	ret = vchiq_initialise(state, &instance);
> -	if (ret) {
> -		dev_err(state->dev, "suspend: %s: vchiq_initialise failed %d\n", __func__, ret);
> +	status = vchiq_initialise(state, &instance);
> +	if (status) {
> +		dev_err(state->dev, "suspend: %s: vchiq_initialise failed %d\n",
> +			__func__, status);
>  		goto exit;
>  	}
> 

-- 
Regards,

Laurent Pinchart
