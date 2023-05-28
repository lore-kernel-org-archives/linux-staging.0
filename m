Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBE2137A
	for <linux-staging@lists.linux.dev>; Sun, 28 May 2023 09:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ADB0C433D2;
	Sun, 28 May 2023 09:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1685264996;
	bh=kZ6IoS0UcCMIxeSXGK1EXw1CkRGzv/isIZN2mVYOPtY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Irq4RPws5C+scOIsu59eK+NTJe/3RjDT1qXYGDVJXa9YvrMAgZ6nAUOxx7XLhuCcI
	 cImMMuSLF8CQZW4JFIZNL9ncWv/F6Trdw98m5OkqP5hYQaEaWzAAY120wBoVl6wpsl
	 Nzpi8sqeeCykBDuwh8YixdmwyTMnSeY/2Hk8x3hQ=
Date: Sun, 28 May 2023 10:09:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dalvin-Ehinoma Noah Aiguobas <pharcodra@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: sm750fb: fix camelCase names
Message-ID: <2023052806-goldfish-snare-07a1@gregkh>
References: <20230514120040.GA10240@koolguy>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230514120040.GA10240@koolguy>

On Sun, May 14, 2023 at 02:00:40PM +0200, Dalvin-Ehinoma Noah Aiguobas wrote:
> Adhere to Linux kernel coding style.
> 
> Reported by checkpatch:
> 
> Avoid CamelCase:
> Rename variables and functions in ddk750_sii164.c which cause styleproblem.
> 
> Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <pharcodra@gmail.com>
> ---
>  drivers/staging/sm750fb/ddk750_sii164.c | 104 ++++++++++++------------
>  1 file changed, 52 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
> index 3da1796cd7aa..4b8f9e617a91 100644
> --- a/drivers/staging/sm750fb/ddk750_sii164.c
> +++ b/drivers/staging/sm750fb/ddk750_sii164.c
> @@ -12,11 +12,11 @@
>  #define USE_HW_I2C
>  
>  #ifdef USE_HW_I2C
> -    #define i2cWriteReg sm750_hw_i2c_write_reg
> -    #define i2cReadReg  sm750_hw_i2c_read_reg
> +    #define i2c_write_reg sm750_hw_i2c_write_reg
> +    #define i2c_read_reg  sm750_hw_i2c_read_reg
>  #else
> -    #define i2cWriteReg sm750_sw_i2c_write_reg
> -    #define i2cReadReg  sm750_sw_i2c_read_reg
> +    #define i2c_write_reg sm750_sw_i2c_write_reg
> +    #define i2c_read_reg  sm750_sw_i2c_read_reg
>  #endif

Why are these needed at all?  The above #define is always set, so just
unwind these to use the real function calls insteadd.

>  
>  /* SII164 Vendor and Device ID */
> @@ -25,7 +25,7 @@
>  
>  #ifdef SII164_FULL_FUNCTIONS
>  /* Name of the DVI Controller chip */
> -static char *gDviCtrlChipName = "Silicon Image SiI 164";
> +static char *g_dvi_ctrl_chip_name = "Silicon Image SiI 164";

Why did you keep the "g_" here?  That is keeping an odd identifier name
for no reason.

>  #endif
>  
>  /*
> @@ -37,14 +37,14 @@ static char *gDviCtrlChipName = "Silicon Image SiI 164";
>   */
>  unsigned short sii164_get_vendor_id(void)
>  {
> -	unsigned short vendorID;
> +	unsigned short vendor_ID;

Isn't the original the term used by the i2c specification?  If so,
please don't change it.

>  
> -	vendorID = ((unsigned short)i2cReadReg(SII164_I2C_ADDRESS,
> +	vendor_ID = ((unsigned short)i2c_read_reg(SII164_I2C_ADDRESS,
>  					       SII164_VENDOR_ID_HIGH) << 8) |
> -		   (unsigned short)i2cReadReg(SII164_I2C_ADDRESS,
> +		   (unsigned short)i2c_read_reg(SII164_I2C_ADDRESS,
>  					      SII164_VENDOR_ID_LOW);

You didn't fix up the indentation here either :(

I stopped reviewing here, sorry.

greg k-h
