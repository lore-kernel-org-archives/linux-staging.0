Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E823033CF;
	Mon, 11 May 2026 07:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485935; cv=none; b=g/TFgSweYQo2z1VTKSVu25GmHKqWfofUFPgRu41bqHQlU2LiZlIuu/Hz5WHqFrwMOF88bedQr3WgfNT/mWk7Wyrnhc+wQcB1eycq8H7hsaMGBfcHySEIKcvmGq+0rnrHW7ZM0cB+JepzZ+06bwHJO+NfbrhoOhrGq3ZwQyzJu9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485935; c=relaxed/simple;
	bh=oNVvykfZedGYg9BkuI3U3BYL+aLgP1HD/D4U/64+O/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bU5n1/sJ7AMx18K4ymBhaxRqP7GB6ne0smeC+VKdCACzRel0b657x6MoP/KAoZFt678iicfGgKATTseuU2EEcMIZFRIHYKDDNP41UbOfqY9dbnnNYRfYC0jKyq+sle+W+ReW+aGdtFHJuFTzMIUK7RkBn/WwI1RJt7Qtq9Fu9gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OiP2BfdL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OiP2BfdL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52439C2BCF6;
	Mon, 11 May 2026 07:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778485934;
	bh=oNVvykfZedGYg9BkuI3U3BYL+aLgP1HD/D4U/64+O/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OiP2BfdL9O5dSYuvFESPz6pN4eqhoSWIA+b6CLRtXtZiTBCS8AO4q2ca87SDPz6ZX
	 sNcMK7Zmy0X2M4cnXrXPj1ajG8aVdCsnNn/Kfzb23BSS3LpSZifuTPJUok6snEmkIt
	 myqKiDR1TpbrpHGDwg05yR5HLA7U6dp17AcN2XsE=
Date: Mon, 11 May 2026 09:52:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Khaled Saleh <khaled.saleh.req@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: split gb_audio_gb_get_topology()
Message-ID: <2026051140-frozen-tried-7799@gregkh>
References: <20260504171330.83727-1-khaled.saleh.req@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504171330.83727-1-khaled.saleh.req@gmail.com>

On Mon, May 04, 2026 at 07:13:30PM +0200, Khaled Saleh wrote:
> Split gb_audio_gb_get_topology() into smaller helper functions
> to improve readability and maintainability.
> 
> No functional change intended.
> 
> Signed-off-by: Khaled Saleh <khaled.saleh.req@gmail.com>
> ---
>  drivers/staging/greybus/audio_gb.c | 25 ++++++++++++++++++-------
>  1 file changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
> index 9d8994fdb41a..b5ead09532c8 100644
> --- a/drivers/staging/greybus/audio_gb.c
> +++ b/drivers/staging/greybus/audio_gb.c
> @@ -8,13 +8,10 @@
>  #include <linux/greybus.h>
>  #include "audio_codec.h"
>  
> -/* TODO: Split into separate calls */
> -int gb_audio_gb_get_topology(struct gb_connection *connection,
> -			     struct gb_audio_topology **topology)
> +static int gb_audio_gb_get_topology_size(struct gb_connection *connection,
> +					 u16 *size)
>  {
>  	struct gb_audio_get_topology_size_response size_resp;
> -	struct gb_audio_topology *topo;
> -	u16 size;
>  	int ret;
>  
>  	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
> @@ -22,10 +19,24 @@ int gb_audio_gb_get_topology(struct gb_connection *connection,
>  	if (ret)
>  		return ret;
>  
> -	size = le16_to_cpu(size_resp.size);
> -	if (size < sizeof(*topo))
> +	*size = le16_to_cpu(size_resp.size);
> +	if (*size < sizeof(struct gb_audio_topology))
>  		return -ENODATA;
>  
> +	return 0;
> +}
> +
> +int gb_audio_gb_get_topology(struct gb_connection *connection,
> +			     struct gb_audio_topology **topology)
> +{
> +	struct gb_audio_topology *topo;
> +	u16 size;
> +	int ret;
> +
> +	ret = gb_audio_gb_get_topology_size(connection, &size);
> +	if (ret)
> +		return ret;
> +
>  	topo = kzalloc(size, GFP_KERNEL);
>  	if (!topo)
>  		return -ENOMEM;
> -- 
> 2.34.1
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You sent a patch that has been sent multiple times in the past and is
  identical to ones that have been rejected.  Please always look at the
  mailing list traffic to determine if you are duplicating other
  people's work.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
