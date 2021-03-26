Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65DC70
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 14:08:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0D24861A24;
	Fri, 26 Mar 2021 14:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1616767687;
	bh=sfKejFZdHc5ocWb1u29Ga9LhysZMd+NqlM93fFQXeLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wN2ED4td46fy0E+xRVuWJcEoR+TURtgYYeFTQnmwfzznS/s96egLlT+pOxYTfz4yG
	 NO2+OrzveTor9cJTr/O0m2UeQ4Z3LREi8JGMsnB3Uy5iLeXR/uFlQYn/7mhUPFHjoa
	 6dr27IR72nYvDggowmZslO8agE8NROpjOk4fD66c=
Date: Fri, 26 Mar 2021 15:08:05 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Xu Jia <xujia39@huawei.com>
Cc: ross.schm.dev@gmail.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, hulkcommits@huawei.com
Subject: Re: [PATCH -next] staging: rtl8723bs: core: fix error return
Message-ID: <YF3qxema68+hLEZq@kroah.com>
References: <20210325083041.1881347-1-xujia39@huawei.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210325083041.1881347-1-xujia39@huawei.com>

On Thu, Mar 25, 2021 at 04:30:41PM +0800, Xu Jia wrote:
> Function rtw_init_bcmc_stainfo() is always return success.
> Variable 'ret' set but not used.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Xu Jia <xujia39@huawei.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_sta_mgt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
> index f96dd0b40e04..7b578192adf5 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
> @@ -551,7 +551,7 @@ u32 rtw_init_bcmc_stainfo(struct adapter *padapter)
>  	psta->mac_id = 1;
>  
>  exit:
> -	return _SUCCESS;
> +	return res;
>  }

You just changed the logic of this function, now it can return a
failure.  Is that ok?  have you tested it when this fails?

Given that I do not think anyone actually tests this value, should this
function just return void instead?

thanks,

greg k-h
