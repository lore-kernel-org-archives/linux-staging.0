Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395C11799F;
	Sat, 15 Nov 2025 13:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763212617; cv=none; b=uMLG9BUSGp1nytIf+5TUuhB2yFsr/APx8mcstEZjof3hXGqNyGbwkxhog5hYNMWD5f7izJaJcw8VWo0d3nHpSLSoKjayr2lclfUzkt2MiwJhHtfeve2HK6NsQ86ZnmtIy/JvPN/i3URW+CwNYhwfc33/72jaVbeLvU9aSAbvQ/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763212617; c=relaxed/simple;
	bh=MAXZ62LPu5nVaq3zefnV6BF5MPPuwi96VcEnDFgF5No=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PIZCPeVhuZwKNAZnV0RGjrYAX33LbhD61/CDrtJD38W5dhVWqtIXYDCtqVJIc6uJ6lAJXeI/AYiugpS7yDzLHjhQx0/miTsafmlBu64dtr6kddwiveFdIxAbFGvCHOU51H+5LGK3tMBymcRBQaCImJIiEabTYeUMuVf49a0DIaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KnNCZFkm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KnNCZFkm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7196CC4CEF5;
	Sat, 15 Nov 2025 13:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763212616;
	bh=MAXZ62LPu5nVaq3zefnV6BF5MPPuwi96VcEnDFgF5No=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KnNCZFkmfXcdhvCPbcJoFtLsEDojtNXhJqYGVI72UajqrJQTjEtablnEZE5h2rXzS
	 syvyGnpZOsSWwYeLKs7aRztYY0W6PDuVGauCjLiJFmsQ1EdWMCqWiw5l1a8grSHcKb
	 Zb923pBIOD9d90mHHJ/W30+zTHD2KhtjNq5Q8Ajs=
Date: Sat, 15 Nov 2025 08:16:53 -0500
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chang Junzheng <guagua210311@qq.com>
Cc: outreachy@lists.linux.dev, Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chang Junzheng <guagua210311@outlook.com>
Subject: Re: [PATCH v2] staging: greybus: audio_manager_module: make envp
 array static const
Message-ID: <2025111542-crucial-unmovable-a65e@gregkh>
References: <tencent_A64EA96730156BC5D2E33B86752776DB9D07@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_A64EA96730156BC5D2E33B86752776DB9D07@qq.com>

On Fri, Nov 14, 2025 at 09:40:43AM +0800, Chang Junzheng wrote:
> From: Chang Junzheng <guagua210311@outlook.com>
> 
> Fix checkpatch.pl warning by changing envp array declaration to
> static const char * const. This improves code safety and follows
> kernel coding style recommendations.
> 
> Signed-off-by: Chang Junzheng <guagua210311@qq.com>
> ---
> Changes in v2:
> - Restored original indentation of array elements
> - Only changed the array declaration as originally intended
> 
>  drivers/staging/greybus/audio_manager_module.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
> index 4a4dfb42f50f..78013d59fc93 100644
> --- a/drivers/staging/greybus/audio_manager_module.c
> +++ b/drivers/staging/greybus/audio_manager_module.c
> @@ -159,14 +159,14 @@ static void send_add_uevent(struct gb_audio_manager_module *module)
>  	char ip_devices_string[64];
>  	char op_devices_string[64];
>  
> -	char *envp[] = {
> -		name_string,
> -		vid_string,
> -		pid_string,
> -		intf_id_string,
> -		ip_devices_string,
> -		op_devices_string,
> -		NULL
> +	static const char * const envp[] = {
> +	name_string,
> +	vid_string,
> +	pid_string,
> +	intf_id_string,
> +	ip_devices_string,
> +	op_devices_string,
> +	NULL

Why did you change the indentation again?

confused,

greg k-h
