Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7BAD306
	for <linux-staging@lists.linux.dev>; Tue, 18 Jul 2023 13:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF596C433C8;
	Tue, 18 Jul 2023 13:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1689687222;
	bh=/gnZG6o0DMnotHgfldqGvalM6a/Vulwkk2wHnxMrZAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=upk/z28T72VgEyaJkNGdvIrsytrYpric58NXQB6VYUVRyy3OcNMqBWEtVf4ZIsT04
	 46s9mJsM3Ox9Mg6EJqNjwVJqwnJfiQWrUisHJ82lvg9rJh/9MzFuZZkBapJHUcy8Zl
	 0MJdaybC9IRqWDbu3/WTtODTkXY/jyp0H69miUmY=
Date: Tue, 18 Jul 2023 15:33:35 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2] staging: fbtft: ili9341: use macro
 FBTFT_REGISTER_SPI_DRIVER
Message-ID: <2023071817-enslave-unlovable-f8ae@gregkh>
References: <20230718081759.28902-1-rgallaispou@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230718081759.28902-1-rgallaispou@gmail.com>

On Tue, Jul 18, 2023 at 10:17:59AM +0200, Raphael Gallais-Pou wrote:
> Using FBTFT_REGISTER_DRIVER resolves to a NULL struct spi_device_id. This
> ultimately causes a warning when the module probes. Fixes it.
> 
> Changes in v2:
> 	- dropped MODULE_ALIAS changes
> 	- changed commit log for more accurate description
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
>  drivers/staging/fbtft/fb_ili9341.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Why is this a resend?

And the changes need to go below the --- line as per the documentation.

thanks,

greg k-h
