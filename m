Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1565E219EF
	for <linux-staging@lists.linux.dev>; Fri, 11 Aug 2023 20:36:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6D93C433C8;
	Fri, 11 Aug 2023 20:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1691786184;
	bh=CO/PRmXZJ/XJEvzde383SJj5YfF/JXNV6Vf20CHR8tw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=biPRe+KCwwX6O+jIaX11dkpDM/A/dxzJuT2wbWBTvDml+7cp3aOz1h48zdnTQWcK2
	 luUiUDlHFxYSGsKbgQ8JQm3fKWIp9q3DIyxI4QG8KuImYTIvTseTKr/BeqCG41R8wU
	 BfZER+VzQWfP21cUixPt8wkPDmn6nyZcHFEijlac=
Date: Fri, 11 Aug 2023 22:36:21 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mingzai Sun <szp2017@gmail.com>
Cc: forest@alittletooquiet.net, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: vt6655: Change camel case variables to snake
 case
Message-ID: <2023081111-ethanol-dipping-683f@gregkh>
References: <20230805035739.376502-1-szp2017@gmail.com>
 <20230810140834.5762-1-szp2017@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810140834.5762-1-szp2017@gmail.com>

On Thu, Aug 10, 2023 at 10:08:34PM +0800, Mingzai Sun wrote:
> Remove the unneeded "by" prefix.
> 
> Signed-off-by: Mingzai Sun <szp2017@gmail.com>
> ---
> Changes in v2:
>   - Change "by_contnt_offset" to "contnt_offset".
> ---
>  drivers/staging/vt6655/srom.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/srom.c b/drivers/staging/vt6655/srom.c
> index 812964ab68c5..1b89d401a7eb 100644
> --- a/drivers/staging/vt6655/srom.c
> +++ b/drivers/staging/vt6655/srom.c
> @@ -49,7 +49,7 @@
>   * Parameters:
>   *  In:
>   *      iobase          - I/O base address
> - *      by_contnt_offset  - address of EEPROM
> + *      contnt_offset  - address of EEPROM
>   *  Out:
>   *      none
>   *
> @@ -57,7 +57,7 @@
>   *
>   */
>  unsigned char SROMbyReadEmbedded(void __iomem *iobase,
> -				 unsigned char by_contnt_offset)
> +				 unsigned char contnt_offset)
>  {
>  	unsigned short wDelay, wNoACK;
>  	unsigned char byWait;
> @@ -70,7 +70,7 @@ unsigned char SROMbyReadEmbedded(void __iomem *iobase,
>  	iowrite8(byOrg & (~I2MCFG_NORETRY), iobase + MAC_REG_I2MCFG);
>  	for (wNoACK = 0; wNoACK < W_MAX_I2CRETRY; wNoACK++) {
>  		iowrite8(EEP_I2C_DEV_ID, iobase + MAC_REG_I2MTGID);
> -		iowrite8(by_contnt_offset, iobase + MAC_REG_I2MTGAD);
> +		iowrite8(contnt_offset, iobase + MAC_REG_I2MTGAD);
>  
>  		/* issue read command */
>  		iowrite8(I2MCSR_EEMR, iobase + MAC_REG_I2MCSR);
> -- 
> 2.34.1
> 
> 

This patch does not apply to my tree at all :(
