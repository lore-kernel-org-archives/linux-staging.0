Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E988837;
	Sat, 21 Dec 2024 07:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734767532; cv=none; b=IRDb6+zfNw+yOgL7ZWwTcCsDQEnDgIy6YQEijzw28n1YzxBE6IyG+ZbRNmnTrcJ1lAmktR2vZjHJR1ViTjQ7cRpbwvmeBLD4YThfHQvLr7/rnLpy3xFfoB/JuaRdDD3E9jfowJrqXdmINHdXMnPIN9skSWq3Qcf8ckjk4HejTUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734767532; c=relaxed/simple;
	bh=zkzSRsK5zEfNnGkLspo9k9ogDK3BGPwTRf2vs6PjhSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q/1X7S3sTOOD6+dnAA8W6oCfxsAhMSoHP+e1VZd9eUhZj9HFxo0VUXO5jfdZhrpN41sU9G2cxfKWHFQ2BuQw9L284FJKsbSOqjkIJP72pFAjrynbKi5dm6GiGzJhVeN242nWzsiyx8pjqDkQxjkzW9ZB9nMgDBHFEtCcKmV/1kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iFQ1mPyb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="iFQ1mPyb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FD24C4CECE;
	Sat, 21 Dec 2024 07:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734767531;
	bh=zkzSRsK5zEfNnGkLspo9k9ogDK3BGPwTRf2vs6PjhSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iFQ1mPybrRhyR3KFZlv9VxIg05dg2brzyzmGAQRps0Iaq3U0Xi8d68RVWoEVMIoQ4
	 pjyeHkNeS/uzBIxleAdFiiJ6Kd3yoIyA8Y6G7ytbrx+VzjuKJp3PF3dp4bMPh7Y5Li
	 5Z1gct/D/XaWQSTduHrrOIWSPfAeZkbLTgARwXdw=
Date: Sat, 21 Dec 2024 08:51:28 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nihar Chaithanya <niharchaithanya@gmail.com>
Cc: dpenkler@gmail.com, dan.carpenter@linaro.org, roheetchavan@gmail.com,
	arnd@arndb.de, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH] staging: gpib: cb7210: Add error handling
Message-ID: <2024122158-bunch-critter-0696@gregkh>
References: <20241221022632.20931-1-niharchaithanya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241221022632.20931-1-niharchaithanya@gmail.com>

On Sat, Dec 21, 2024 at 07:56:33AM +0530, Nihar Chaithanya wrote:
> The if condition in cb7210_init_module() would always fail as
> the value of err is constantly 0.
> Add error handling to cb_pcmcia_init_module() where it returns
> appropriate error code if pcmcia_register_driver() fails.
> 
> This issue was reported by Coverity Scan.
> Report:
> 
> CID 1635894: (#1 of 1): 'Constant' variable guards dead code (DEADCODE)
> dead_error_line: Execution cannot reach this statement: return -1;.
> 
> Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
> ---
>  drivers/staging/gpib/cb7210/cb7210.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
> index 63df7f3eb3f3..b2f6ad70ccaf 100644
> --- a/drivers/staging/gpib/cb7210/cb7210.c
> +++ b/drivers/staging/gpib/cb7210/cb7210.c
> @@ -1353,7 +1353,11 @@ static struct pcmcia_driver cb_gpib_cs_driver = {
>  
>  int cb_pcmcia_init_module(void)
>  {
> -	pcmcia_register_driver(&cb_gpib_cs_driver);
> +	int ret;
> +
> +	ret = pcmcia_register_driver(&cb_gpib_cs_driver);
> +	if (ret < 0)
> +		return ret;
>  	return 0;

Why not make this whole function just one line?  And then, as it's one
line, why is it a function at all?

thanks,

greg k-h
