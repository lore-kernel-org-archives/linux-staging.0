Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A6B367289;
	Tue, 26 May 2026 16:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779812542; cv=none; b=sNlT72ZsMgDxPpHWC+9aDlg23h2y+/GajcD/7jmB63taKl81b9DFUMnK+Y4B2l1uP6V1TFQqJws1WY+ku1vjZY3dkRAtI7KjZHiowGhurcxss8rs10NfMpXxCyOt40/mpsUu8WA8oOuoaXgUUo9oKo/YCzQJeR/6Xhocl0zutuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779812542; c=relaxed/simple;
	bh=FFiBhserKSLwjTP430SHlji4VgkUnzwzOL1bQhNfZ2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NDGxhOWWZr0LLDpkoIValFWlkDR4cTcKKJ8K3JZZL89WaoH4mzQG4nhc7jnXahJtyqXZ0YoJc3FDkrpioVmE4sOishokGoXazztxm4E0MFAc3q5+ngOqwlO4OlEtXQwhW3oi7htpB0B7eeUv7GeebKDhB34uC/WEDhHk0gCGVDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=By71Q4z6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="By71Q4z6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A33341F000E9;
	Tue, 26 May 2026 16:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779812541;
	bh=uewZdXLtjOGDTMkJFzDQmKnizzh9dAL//Kz+jsL4M78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=By71Q4z6AbwXnMYvCMlnuuDU6Yc67cOPzN2H4fisekSv3C05V3wWaRoZk52LsX6Li
	 AoRIdTqL7xjuxWUzN9fbwbJb9hpFOiYOyEk/QrGxTNLEAZBPY7qv9iIp7AS/h1wZdx
	 F7tRF6i2q+lRQNHxfH78S6liqiDx88usspXamLMQ=
Date: Tue, 26 May 2026 18:21:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jeongin Yeo <jeongin.yeo@luaberry.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, matt@mattwardle.net, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: use __func__ in debug messages in
 binary.c
Message-ID: <2026052613-glamour-caress-1b8a@gregkh>
References: <20260526104750.1284935-1-jeongin.yeo@luaberry.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526104750.1284935-1-jeongin.yeo@luaberry.com>

On Tue, May 26, 2026 at 10:47:50AM +0000, Jeongin Yeo wrote:
> Replace hardcoded function name strings with __func__ macro in
> dev_dbg() calls within ia_css_binary_find() as recommended by
> kernel coding style.
> 
> No functional changes.
> 
> Signed-off-by: Jeongin Yeo <jeongin.yeo@luaberry.com>
> ---
>  .../atomisp/pci/runtime/binary/src/binary.c   | 127 ++++++++++--------
>  1 file changed, 68 insertions(+), 59 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
> index e9016d7775dc3..2355fdf357fcd 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
> @@ -925,8 +925,8 @@ int ia_css_binary_find(struct ia_css_binary_descr *descr, struct ia_css_binary *
>  	/* MW: used after an error check, may accept NULL, but doubtful */
>  	assert(binary);
>  
> -	dev_dbg(atomisp_dev, "ia_css_binary_find() enter: descr=%p, (mode=%d), binary=%p\n",
> -		descr, descr->mode, binary);
> +	dev_dbg(atomisp_dev, "%s() enter: descr=%p, (mode=%d), binary=%p\n",
> +		__func__, descr, descr->mode, binary);

dev_dbg() already has __func__ in the output, why is it needed again?

thanks,

greg k-h
