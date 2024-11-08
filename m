Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514181AA1C1
	for <linux-staging@lists.linux.dev>; Fri,  8 Nov 2024 19:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731094170; cv=none; b=eDyM5XCGtKoVf6Pxr7TYa7n/ehSfEz90+iSN9zPW+VRCrM0vLUn0nFBcGhXI9i2aZYhVh0VhLyIFRJkPDharMpwGPBfxw687U+7cJ/tVRmle943yNcFTHW32Fi1U1Ssg3EJ7/Cvn38IpOEbGRvb0X9Rs6pcNI4QaOrLgy0eTIE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731094170; c=relaxed/simple;
	bh=8Axv5eowf13X9q+rnuRDlqlI0Qk07RQb/a7Mq+/oWWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ndpnK2ySYnaXeT7g9TJ04O1dtPtDiuWYGJC+Bd7YnHdLCFRoQ5LcXf0/ynLseFlr//msXuN678tySy94mpzx38VpigWoF1jaeLnR9+Pyr0Uvy6RBz84z1/H9HeRrPL3ImdB6QGUFQdUHXdRjWyEnp9n/jG8E1cVZ8aIaNuxDR8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9FzqE0s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9FzqE0s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0097C4CECD;
	Fri,  8 Nov 2024 19:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731094170;
	bh=8Axv5eowf13X9q+rnuRDlqlI0Qk07RQb/a7Mq+/oWWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E9FzqE0sTAzw9zGBECOPQC1HNcxDr3dH1qtvi2FopfFpXVbRft+AI34je677o5gLy
	 fqSvpvfyDF8LvJMsyhoSI6CjgFYZTBKl0jmqzHTJUFIgGiJCv0nhJBRp9Y7S5ggUT0
	 15AniXy/9P12oOnC9Z6irqxmgVmuooY3LrjIbjLFq3vuNbIvIje+wHkYH9Th47l+6G
	 t97/VzU7+KNXwmhKqYq7uMUKqJuJl6lnAdWz05XmdfOpUQe1BSS6GMl3UaTeMfmYOg
	 3eKZzWD6ZXbCGnZpD53NGK7o4wj29k+o9dDRe4VZLjR5RWNrVHgOBgu9bMy1FtqSqx
	 +MVcjlnAlKZHQ==
Date: Fri, 8 Nov 2024 12:29:27 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Penkler <dpenkler@gmail.com>, linux-staging@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 4/7] staging: gpib: make port I/O code conditional
Message-ID: <20241108192927.GA2734142@thelio-3990X>
References: <20241016111521.1143191-1-arnd@kernel.org>
 <20241016111521.1143191-5-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016111521.1143191-5-arnd@kernel.org>

Hi Arnd,

On Wed, Oct 16, 2024 at 11:15:18AM +0000, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A few of the helper modules contain functions for both IORESOURCE_MEM
> and IORESOURCE_IO type access, with the latter not being supported
> on all architectures but also not used by all the drivers.
> 
> Add #ifdef checks around these to allow building the library code
> and use it on MMIO-only configurations.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/staging/gpib/common/gpib_os.c  |  2 ++
>  drivers/staging/gpib/nec7210/nec7210.c | 38 ++++++++++++++------------
>  drivers/staging/gpib/tms9914/tms9914.c |  2 ++
>  3 files changed, 24 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
> index e9dd7b2d1569..e93a45132a40 100644
> --- a/drivers/staging/gpib/common/gpib_os.c
> +++ b/drivers/staging/gpib/common/gpib_os.c
> @@ -140,6 +140,7 @@ unsigned int readw_wrapper(void *address)
>  };
>  EXPORT_SYMBOL(readw_wrapper);
>  
> +#ifdef CONFIG_HAS_IOPORT
>  void outb_wrapper(unsigned int value, void *address)
>  {
>  	outb(value, (unsigned long)(address));
> @@ -163,6 +164,7 @@ unsigned int inw_wrapper(void *address)
>  	return inw((unsigned long)(address));
>  };
>  EXPORT_SYMBOL(inw_wrapper);
> +#endif
>  
>  /* this is a function instead of a constant because of Suse
>   * defining HZ to be a function call to get_hz()
> diff --git a/drivers/staging/gpib/nec7210/nec7210.c b/drivers/staging/gpib/nec7210/nec7210.c
> index 632322799ed2..1330743d05fd 100644
> --- a/drivers/staging/gpib/nec7210/nec7210.c
> +++ b/drivers/staging/gpib/nec7210/nec7210.c
> @@ -1031,6 +1031,7 @@ void nec7210_board_online(struct nec7210_priv *priv, const gpib_board_t *board)
>  }
>  EXPORT_SYMBOL(nec7210_board_online);
>  
> +#ifdef CONFIG_HAS_IOPORT
>  /* wrappers for io */
>  uint8_t nec7210_ioport_read_byte(struct nec7210_priv *priv, unsigned int register_num)
>  {
> @@ -1050,24 +1051,6 @@ void nec7210_ioport_write_byte(struct nec7210_priv *priv, uint8_t data, unsigned
>  }
>  EXPORT_SYMBOL(nec7210_ioport_write_byte);
>  
> -uint8_t nec7210_iomem_read_byte(struct nec7210_priv *priv, unsigned int register_num)
> -{
> -	return readb(priv->iobase + register_num * priv->offset);
> -}
> -EXPORT_SYMBOL(nec7210_iomem_read_byte);
> -
> -void nec7210_iomem_write_byte(struct nec7210_priv *priv, uint8_t data, unsigned int register_num)
> -{
> -	if (register_num == AUXMR)
> -		/* locking makes absolutely sure noone accesses the
> -		 * AUXMR register faster than once per microsecond
> -		 */
> -		nec7210_locking_iomem_write_byte(priv, data, register_num);
> -	else
> -		writeb(data, priv->iobase + register_num * priv->offset);
> -}
> -EXPORT_SYMBOL(nec7210_iomem_write_byte);
> -
>  /* locking variants of io wrappers, for chips that page-in registers */
>  uint8_t nec7210_locking_ioport_read_byte(struct nec7210_priv *priv, unsigned int register_num)
>  {
> @@ -1093,6 +1076,25 @@ void nec7210_locking_ioport_write_byte(struct nec7210_priv *priv, uint8_t data,
>  	spin_unlock_irqrestore(&priv->register_page_lock, flags);
>  }
>  EXPORT_SYMBOL(nec7210_locking_ioport_write_byte);
> +#endif
> +
> +uint8_t nec7210_iomem_read_byte(struct nec7210_priv *priv, unsigned int register_num)
> +{
> +	return readb(priv->iobase + register_num * priv->offset);
> +}
> +EXPORT_SYMBOL(nec7210_iomem_read_byte);
> +
> +void nec7210_iomem_write_byte(struct nec7210_priv *priv, uint8_t data, unsigned int register_num)
> +{
> +	if (register_num == AUXMR)
> +		/* locking makes absolutely sure noone accesses the
> +		 * AUXMR register faster than once per microsecond
> +		 */
> +		nec7210_locking_iomem_write_byte(priv, data, register_num);
> +	else
> +		writeb(data, priv->iobase + register_num * priv->offset);
> +}
> +EXPORT_SYMBOL(nec7210_iomem_write_byte);
>  
>  uint8_t nec7210_locking_iomem_read_byte(struct nec7210_priv *priv, unsigned int register_num)
>  {
> diff --git a/drivers/staging/gpib/tms9914/tms9914.c b/drivers/staging/gpib/tms9914/tms9914.c
> index a85a796de024..b4a8ab55c5ec 100644
> --- a/drivers/staging/gpib/tms9914/tms9914.c
> +++ b/drivers/staging/gpib/tms9914/tms9914.c
> @@ -862,6 +862,7 @@ void tms9914_online(gpib_board_t *board, struct tms9914_priv *priv)
>  }
>  EXPORT_SYMBOL_GPL(tms9914_online);
>  
> +#ifdef CONFIG_HAS_IOPORT
>  // wrapper for inb
>  uint8_t tms9914_ioport_read_byte(struct tms9914_priv *priv, unsigned int register_num)
>  {
> @@ -877,6 +878,7 @@ void tms9914_ioport_write_byte(struct tms9914_priv *priv, uint8_t data, unsigned
>  		udelay(1);
>  }
>  EXPORT_SYMBOL_GPL(tms9914_ioport_write_byte);
> +#endif
>  
>  // wrapper for readb
>  uint8_t tms9914_iomem_read_byte(struct tms9914_priv *priv, unsigned int register_num)
> -- 
> 2.39.5
> 

Now that this change is in -next, I think it might be incorrect or
incomplete, as hexagon and s390 allmodconfig error with

  ERROR: modpost: "inb_wrapper" [drivers/staging/gpib/tnt4882/tnt4882.ko] undefined!
  ERROR: modpost: "inw_wrapper" [drivers/staging/gpib/tnt4882/tnt4882.ko] undefined!
  ERROR: modpost: "nec7210_locking_ioport_write_byte" [drivers/staging/gpib/tnt4882/tnt4882.ko] undefined!
  ERROR: modpost: "nec7210_locking_ioport_read_byte" [drivers/staging/gpib/tnt4882/tnt4882.ko] undefined!
  ERROR: modpost: "outb_wrapper" [drivers/staging/gpib/tnt4882/tnt4882.ko] undefined!
  ERROR: modpost: "outw_wrapper" [drivers/staging/gpib/tnt4882/tnt4882.ko] undefined!

and it is not immediately obvious to me what the fix is.

Cheers,
Nathan
