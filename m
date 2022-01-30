Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652272C9E
	for <linux-staging@lists.linux.dev>; Sun, 30 Jan 2022 17:54:13 +0000 (UTC)
Received: from ipservice-092-217-087-009.092.217.pools.vodafone-ip.de ([92.217.87.9] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <postmaster@kaiser.cx>)
	id 1nEEOn-0007xP-Bc; Sun, 30 Jan 2022 18:54:01 +0100
Received: from martin by martin-debian-2.paytec.ch with local (Exim 4.94.2)
	(envelope-from <martin@martin-debian-2.paytec.ch>)
	id 1nEEOm-002wou-Ny; Sun, 30 Jan 2022 18:54:00 +0100
Date: Sun, 30 Jan 2022 18:54:00 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kernel@collabora.com, kernel-janitors@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rt8188eu: Remove dead code
Message-ID: <YfbQuA6SSIEXGrWu@martin-debian-1.paytec.ch>
References: <20220128111954.1028121-1-usama.anjum@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220128111954.1028121-1-usama.anjum@collabora.com>
Sender: "Martin Kaiser,,," <martin@martin-debian-2.paytec.ch>

Thus wrote Muhammad Usama Anjum (usama.anjum@collabora.com):

> rtStatus is _SUCCESS when the execution reaches this if condition.
> Remove the dead code.

> Fixes: 67396d2dfef3 ("staging: r8188eu: merge ODM_ConfigBBWithHeaderFile with its callers")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
>  drivers/staging/r8188eu/hal/rtl8188e_phycfg.c | 3 ---
>  1 file changed, 3 deletions(-)

> diff --git a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
> index 0b0690dfb947c..41a0d7f0d29f4 100644
> --- a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
> +++ b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
> @@ -504,9 +504,6 @@ static	int phy_BB8188E_Config_ParaFile(struct adapter *Adapter)
>  		ODM_ReadAndConfig_PHY_REG_PG_8188E(&pHalData->odmpriv);
>  	}

> -	if (rtStatus != _SUCCESS)
> -		goto phy_BB8190_Config_ParaFile_Fail;
> -
>  	/*  3. BB AGC table Initialization */
>  	if (HAL_STATUS_FAILURE == ODM_ReadAndConfig_AGC_TAB_1T_8188E(&pHalData->odmpriv))
>  		rtStatus = _FAIL;
> -- 
> 2.30.2

Thanks for spotting this. It makes sense to remove this duplicate check.

Acked-by: Martin Kaiser <martin@kaiser.cx>

Looking at the function again, the rest of the error handling should be
cleaned up as well. I'll send a patch for this.
