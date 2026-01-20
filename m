Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FE23612C9;
	Tue, 20 Jan 2026 07:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768892999; cv=none; b=jaydFKcOnHNOrEZ7hb/yyJI15VlGKujN0qj/b5tqgjoNe9Hig0fu2xmws36vSgChFU+UFjwZSGHO8w/e51bAlakwi1FlwEVep9c+xWY6kMnVCIljVkoohs0hjrlFjdXkSVg0FM2AU5VheHmoMNhkB3CAYHyMTsopECTFReZVg8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768892999; c=relaxed/simple;
	bh=moegPz+ML0gdFecipcMmRMhdgWHCHbPMNwXLKdmh4Ds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CWmqQsrS0ZAHrQUQucAsZt8wUORWV4RFVLxAEfXeKfL5giRiHDIRXTahbE1SwfTm/8/OW+QsmX/uDp+gV6ilVA2uKgTH5QEOBcIKelPaN0X84Iz//aurJGK8X9G0QaZkLxGbum+6Fz737uWkkp8RHvgOxz873rwp6YZ5k2/Rtbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bxq6ar/C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bxq6ar/C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F5FC16AAE;
	Tue, 20 Jan 2026 07:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768892996;
	bh=moegPz+ML0gdFecipcMmRMhdgWHCHbPMNwXLKdmh4Ds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bxq6ar/C6N89cELHJrLeO/JGCvE4oEr6pUFjjEBatvXhuFGgy6CoUPSOe2zDUt583
	 zMXEfeSwxxfBQVrW5gcxzlj5FRmjm0e7adCbPVdE4H0KOrN7OZlDcGmCNlwWspomg3
	 lyDUb4BL5s8CcKIzkPrE8BFEs+o5wDs+77/J1bQk=
Date: Tue, 20 Jan 2026 08:09:53 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Lee Yongjun <jun85566@gmail.com>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio: Limit scope of jack-related
 variables
Message-ID: <2026012002-postal-fancy-8329@gregkh>
References: <20260120070701.3689-1-jun85566@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120070701.3689-1-jun85566@gmail.com>

On Tue, Jan 20, 2026 at 04:07:01PM +0900, Lee Yongjun wrote:
> Move jack-related variable declarations inside the CONFIG_SND_JACK
> conditional block.
> 
> These variables are only used when CONFIG_SND_JACK is enabled, so
> limiting their scope improves code clarity and avoids unused variable
> warnings when the option is disabled.
> 
> No functional changes intended.
> 
> Signed-off-by: Lee Yongjun <jun85566@gmail.com>
> ---
>  drivers/staging/greybus/audio_codec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
> index 444c53b4e08d..f752d5fbd685 100644
> --- a/drivers/staging/greybus/audio_codec.c
> +++ b/drivers/staging/greybus/audio_codec.c
> @@ -935,8 +935,6 @@ static void gbaudio_codec_cleanup(struct gbaudio_module_info *module)
>  void gbaudio_unregister_module(struct gbaudio_module_info *module)
>  {
>  	struct snd_soc_component *comp = gbcodec->component;
> -	struct gbaudio_jack *jack, *n;
> -	int mask;
>  
>  	dev_dbg(comp->dev, "Unregister %s module\n", module->name);
>  
> @@ -948,6 +946,8 @@ void gbaudio_unregister_module(struct gbaudio_module_info *module)
>  	mutex_unlock(&gbcodec->lock);
>  
>  #ifdef CONFIG_SND_JACK
> +	struct gbaudio_jack *jack, *n;
> +	int mask;
>  	/* free jack devices for this module jack_list */

Please no, let's keep the variable definitions at the top of the scope
please.  The compiler will handle this just fine if they aren't used due
to the config option not being enabled.

thanks,

greg k-h
