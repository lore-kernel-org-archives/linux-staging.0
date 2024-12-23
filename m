Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDF41B6CF4;
	Mon, 23 Dec 2024 18:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734977139; cv=none; b=g5u67Ol1w3Rsadl8cud+Wm5vypN7kZScrb9kYtYvHIGp4Yy0/DCEKXDJtccXVaYOfFe54J4qJKIhTbR48bZTSUuTNPR0QKvmb7JJWWc5P20pkznVLhLsGbMKESuGKGQ/ffsU1slWBHx2R3GZgyiyl9i/rH4WcnQV2gqGVNjvXlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734977139; c=relaxed/simple;
	bh=nBM5cD9bxkmfcYVcW9x+AfW5SCErHBeFWpVZ+h5BUS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hzUgMgjkzKnjH3q1wgAow/lneK3Hp8yu58152Di2ErXxHGoDJacam/94iunjXTYnbJvD7kW2MoD9wTbXOUnRS6J2zAygul6xgEtmcn/vW2vdTRTrQ+RGr7KKsyXnmOL7IXQkIi7dKELLR6i3Vow3J8/gXdqFzvN7a8LUU0woxTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=up2pegsY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="up2pegsY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A6C4C4CED3;
	Mon, 23 Dec 2024 18:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734977138;
	bh=nBM5cD9bxkmfcYVcW9x+AfW5SCErHBeFWpVZ+h5BUS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=up2pegsYpcxKMlPlL2tBbC3dpZcbQYlMHk7Pco8LdHZv0TjB+iXejvFzxNm2lv/yQ
	 JK3/Nwpu7YIAXAKRssjKDAcz7PExQJE3NwGObLPH0osjrsvHpa4QmqtfBjnmYrw7/6
	 y1mItBILIQZq4NH3TqIrt1YibGNt/0rfEqsK8UyI=
Date: Mon, 23 Dec 2024 19:05:35 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Atharva Tiwari <evepolonium@gmail.com>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: Remove module from list before freeing
 in gb_audio_module_release
Message-ID: <2024122358-vexingly-broadly-7df7@gregkh>
References: <20241223151112.206908-1-evepolonium@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223151112.206908-1-evepolonium@gmail.com>

On Mon, Dec 23, 2024 at 08:41:12PM +0530, Atharva Tiwari wrote:
> Previously,the module was freed without detaching it from the list which could lead to memory leak
> this patch uses list_del to safely remove the module from the list
> 
> Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
> ---
>  drivers/staging/greybus/audio_manager_module.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
> index 4a4dfb42f50f..7e52c3f95692 100644
> --- a/drivers/staging/greybus/audio_manager_module.c
> +++ b/drivers/staging/greybus/audio_manager_module.c
> @@ -69,7 +69,8 @@ static void gb_audio_module_release(struct kobject *kobj)
>  	struct gb_audio_manager_module *module = to_gb_audio_module(kobj);
>  
>  	pr_info("Destroying audio module #%d\n", module->id);
> -	/* TODO -> delete from list */
> +	if (module->list.prev && module->list.next)

For lists, you really shouldn't poke around in the prev and next
pointers, right?

Have you tested this?  This feels like an odd change, is it a real
system that is using this code anymore?

thanks,

greg k-h
