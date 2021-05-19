Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A41B2FB6
	for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 15:49:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 20C806112F;
	Wed, 19 May 2021 15:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1621439345;
	bh=lGC3DoCR5fr+NSKkmLNbBtqhdkxQjEhEKcRmDfRqFdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Aq5Z4H5LtXPZX4tAjSt8FUNSs3pMLfbACpQB3jPQNnffZANH2YoBDfmrOXMmtTzrh
	 QEYZRgyY9P3FYJe3aDl0yY3uNWFll1HWdGr0to+SfxTB4Vur00nCNv+Iesc8sVsYtC
	 0CtNzZTq5s8jPGKe750jI5GdRS7dZKdtoLS2MK1g=
Date: Wed, 19 May 2021 17:49:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Luo Meng <luomeng12@huawei.com>
Cc: nathan@kernel.org, ndesaulniers@google.com, fabioaiuto83@gmail.com,
	ross.schm.dev@gmail.com, marcocesati@gmail.com,
	matthew.v.deangelis@gmail.com, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: remove unused variable
Message-ID: <YKUzb7vI2puZzBaa@kroah.com>
References: <20210515082150.165660-1-luomeng12@huawei.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210515082150.165660-1-luomeng12@huawei.com>

On Sat, May 15, 2021 at 04:21:50PM +0800, Luo Meng wrote:
> Fix the following clang warning:
> 
> drivers/staging/rtl8723bs/core/rtw_mlme.c:2356:6:
> warning: variable ‘pframe’ set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Luo Meng <luomeng12@huawei.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index 4707dba90397..c2bbb66666b0 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -2353,12 +2353,11 @@ void rtw_build_wmm_ie_ht(struct adapter *padapter, u8 *out_ie, uint *pout_len)
>  {
>  	unsigned char WMM_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x00, 0x01, 0x00};
>  	int out_len;
> -	u8 *pframe;
>  
>  	if (padapter->mlmepriv.qospriv.qos_option == 0) {
>  		out_len = *pout_len;
> -		pframe = rtw_set_ie(out_ie+out_len, WLAN_EID_VENDOR_SPECIFIC,
> -							_WMM_IE_Length_, WMM_IE, pout_len);
> +		rtw_set_ie(out_ie+out_len, WLAN_EID_VENDOR_SPECIFIC,
> +				WMM_IE_Length_, WMM_IE, pout_len);
>  
>  		padapter->mlmepriv.qospriv.qos_option = 1;
>  	}
> -- 
> 2.25.4
> 
> 

Does not apply to my tree :(
