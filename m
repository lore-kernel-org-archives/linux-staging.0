Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF20E79F4;
	Sun, 15 Oct 2023 16:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TifoANNf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2767C433C7;
	Sun, 15 Oct 2023 16:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697386190;
	bh=9JuI03ZP/U0XMwAWcNqdQJ5I2Au2PAR4LpQx78SO3NI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TifoANNffvYUf3VBdZPNEO0sdMjAN9hMkqJgAQzesVprLSTCf85zi24+lSVOGUigX
	 0UNMJEGO0XN9qtQXLGVod5EeavGnI2fwaDMBQStvbCYWtYu8m933Vgfv1ARaQ87Yn2
	 7oz7+9VUVP2Swz/2b/5ni9YzVaDG8RYyIlwKu5L0=
Date: Sun, 15 Oct 2023 18:09:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192u: Align descendant arguments
Message-ID: <2023101519-cane-backlands-b376@gregkh>
References: <ZSuYUmX5P5M0Ok/I@gilbert-PC>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSuYUmX5P5M0Ok/I@gilbert-PC>

On Sun, Oct 15, 2023 at 08:44:18AM +0100, Gilbert Adikankwu wrote:
> Adhere to Linux kernel coding style.
> 
> "...A very commonly used style is to align descendants to a function
> open parenthesis" - (Excerpted from Linux kernel coding style (#2))
> 
> Reported by checkpatch:
> 
> CHECK: Alignment should match open parenthesis
> 
> Signed-off-by: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
> ---
>  drivers/staging/rtl8192u/r8180_93cx6.c     |  4 ++--
>  drivers/staging/rtl8192u/r8190_rtl8256.c   | 16 +++++++--------
>  drivers/staging/rtl8192u/r8192U_core.c     | 20 +++++++++---------
>  drivers/staging/rtl8192u/r8192U_dm.c       | 24 +++++++++++-----------
>  drivers/staging/rtl8192u/r819xU_firmware.c |  4 ++--
>  drivers/staging/rtl8192u/r819xU_phy.c      |  2 +-
>  6 files changed, 35 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192u/r8180_93cx6.c b/drivers/staging/rtl8192u/r8180_93cx6.c
> index 2527cea60e3e..1453a0307eb4 100644
> --- a/drivers/staging/rtl8192u/r8180_93cx6.c
> +++ b/drivers/staging/rtl8192u/r8180_93cx6.c
> @@ -114,7 +114,7 @@ int eprom_read(struct net_device *dev, u32 addr)
>  	ret = 0;
>  	/* enable EPROM programming */
>  	write_nic_byte_E(dev, EPROM_CMD,
> -		       (EPROM_CMD_PROGRAM << EPROM_CMD_OPERATING_MODE_SHIFT));
> +			 (EPROM_CMD_PROGRAM << EPROM_CMD_OPERATING_MODE_SHIFT));
>  	force_pci_posting(dev);
>  	udelay(EPROM_DELAY);
>  
> @@ -165,6 +165,6 @@ int eprom_read(struct net_device *dev, u32 addr)
>  
>  	/* disable EPROM programming */
>  	write_nic_byte_E(dev, EPROM_CMD,
> -		       (EPROM_CMD_NORMAL << EPROM_CMD_OPERATING_MODE_SHIFT));
> +			 (EPROM_CMD_NORMAL << EPROM_CMD_OPERATING_MODE_SHIFT));
>  	return ret;
>  }
> diff --git a/drivers/staging/rtl8192u/r8190_rtl8256.c b/drivers/staging/rtl8192u/r8190_rtl8256.c
> index 54747fda552f..a81e88894e01 100644
> --- a/drivers/staging/rtl8192u/r8190_rtl8256.c
> +++ b/drivers/staging/rtl8192u/r8190_rtl8256.c
> @@ -46,17 +46,17 @@ void phy_set_rf8256_bandwidth(struct net_device *dev, enum ht_channel_width Band
>  				    priv->card_8192_version == VERSION_819XU_B) {
>  					/* 8256 D-cut, E-cut, xiong: consider it later! */
>  					rtl8192_phy_SetRFReg(dev,
> -						(enum rf90_radio_path_e)eRFPath,
> -						0x0b, bMask12Bits, 0x100); /* phy para:1ba */
> +							     (enum rf90_radio_path_e)eRFPath,
> +							     0x0b, bMask12Bits, 0x100); /* phy para:1ba */

Now you added a different checkpatch warning, you can't say you fix one
and then add another, sorry.

greg k-h
