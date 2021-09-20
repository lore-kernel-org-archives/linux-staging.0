Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1AF72
	for <linux-staging@lists.linux.dev>; Mon, 20 Sep 2021 15:38:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 44574610A3;
	Mon, 20 Sep 2021 15:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1632152312;
	bh=1F3PXoFKRyGnJqNMxiWHzpAQJEH6bcpzvzx6prYefJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RRnLU2c43xT85EkPdNm3NvkiUBO+VqlS66Lnqun+4zb5p+7XEZQMRI/eCQnnyw5rI
	 H1imqK+04Nj2N9CFF8oyU6OL+P0F9AlTe9ym9KmoXmAYRC1etcXIBATKD+k9aQdTk1
	 CiO9k09jqhfN+LSBvZtDPdQdQ+1bRLpG9JxBl8oI=
Date: Mon, 20 Sep 2021 17:38:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Zachary Mayhew <zacklukem.kernel@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@lists.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: add docs for fbtft_write_spi()
Message-ID: <YUiq9iDGLN6+5+rd@kroah.com>
References: <20210920152601.170453-1-zacklukem.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210920152601.170453-1-zacklukem.kernel@gmail.com>

On Mon, Sep 20, 2021 at 08:26:03AM -0700, Zachary Mayhew wrote:
> Subject: [PATCH] staging: fbtft: add docs for fbtft_write_spi()

Odd, this shouldn't be in the body of the email :(

> 
> This patch adds documentation for fbtft_write_spi() to make its
> calling context clear and explain what it does.
> 
> Signed-off-by: Zachary Mayhew <zacklukem.kernel@gmail.com>
> ---
>  drivers/staging/fbtft/fbtft-io.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/staging/fbtft/fbtft-io.c b/drivers/staging/fbtft/fbtft-io.c
> index de1904a443c2..985d7cf8c774 100644
> --- a/drivers/staging/fbtft/fbtft-io.c
> +++ b/drivers/staging/fbtft/fbtft-io.c
> @@ -5,6 +5,19 @@
>  #include <linux/spi/spi.h>
>  #include "fbtft.h"
>  
> +/**
> + * fbtft_write_spi() - write data to current spi
> + * @par: Driver data including driver &struct spi_device
> + * @buf: Buffer to write to spi
> + * @len: Length of the buffer
> + * Context: can sleep
> + *
> + * Builds an &struct spi_transfer and &struct spi_message object based on the
> + * given @buf and @len.  These are then used in a call to spi_sync() which will
> + * write to the spi.
> + *
> + * Return: zero on success or else a negative error code
> + */
>  int fbtft_write_spi(struct fbtft_par *par, void *buf, size_t len)
>  {
>  	struct spi_transfer t = {
> -- 
> 2.33.0
> 
> 

Is this file being imported into the kernel doc tools?  If so, great, if
not, this isn't going to help out all that much, right?

thanks,

greg k-h
