Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D7117F
	for <linux-staging@lists.linux.dev>; Tue, 25 May 2021 16:21:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5903661157;
	Tue, 25 May 2021 16:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1621959716;
	bh=HE2xPhzMLMc/YvX06ShoQ0KcYQtdx/ARLVwHSbUrjVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M53zhkef+9rbnVADkt24MpmqiXRcy84iIiZnmzn719LayLN5VoxCCRbhvLHR3dhXK
	 K4xjLVTXE3cnknnpxxDf//DPZh63O2iwHpjSQ9Y0G9NGsgu7g3BDhSBFtVDIrymwSy
	 WGGrd2V1ZR+k7B6LK999DFafHQx0NCyRdMBShk9c=
Date: Tue, 25 May 2021 18:21:54 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shaokun Zhang <zhangshaokun@hisilicon.com>
Cc: linux-staging@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] staging: rtl8723bs: remove the repeated declaration
Message-ID: <YK0kIsNcPHDhvT8D@kroah.com>
References: <1621923531-21262-1-git-send-email-zhangshaokun@hisilicon.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621923531-21262-1-git-send-email-zhangshaokun@hisilicon.com>

On Tue, May 25, 2021 at 02:18:51PM +0800, Shaokun Zhang wrote:
> Function 'Hal_SetBandwidth' is declared twice, remove the
> repeated declaration.
> 
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
> ---
>  drivers/staging/rtl8723bs/include/rtw_mp.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/rtw_mp.h b/drivers/staging/rtl8723bs/include/rtw_mp.h
> index 2788ad80b114..ea3abee325ef 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_mp.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_mp.h
> @@ -348,7 +348,6 @@ void Hal_SetCarrierSuppressionTx(struct adapter *padapter, u8 bStart);
>  void Hal_SetSingleToneTx(struct adapter *padapter, u8 bStart);
>  void Hal_SetSingleCarrierTx(struct adapter *padapter, u8 bStart);
>  void Hal_SetContinuousTx(struct adapter *padapter, u8 bStart);
> -void Hal_SetBandwidth(struct adapter *padapter);
>  
>  void Hal_SetDataRate(struct adapter *padapter);
>  void Hal_SetChannel(struct adapter *padapter);
> -- 
> 2.7.4
> 
> 

You sent 2 patches with identical subjects, yet they did different
things :(

Please fix up and send a patch series that properly identifies what is
happening here.

thanks,

greg k-h
