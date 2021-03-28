Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D968E70
	for <linux-staging@lists.linux.dev>; Sun, 28 Mar 2021 12:33:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DECE56192D;
	Sun, 28 Mar 2021 12:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1616934798;
	bh=pdQRUpZ1Av2+lJEcYllJX2Tydj9H56i/I6uC16wmCWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QPOchp5lrSIPyjWUct7Dwia853m6sPQVQPTG1uXD55+6irAdV65MiWvwEMtff52S2
	 Tf7K9Q2A3FPj27EGGz4QfAlLZCJpCfTDv/FI0YVQeHJEcfDaQmCXJ7wsW2wvPF7ZOg
	 jVlFqIpi8n3FoMdDHS0nCxzcTtSLL+9qzJGE1/Sg=
Date: Sun, 28 Mar 2021 14:33:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Edmundo Carmona Antoranz <eantoranz@gmail.com>
Cc: marcocesati@gmail.com, dan.carpenter@oracle.com,
	ross.schm.dev@gmail.com, fabioaiuto83@gmail.com,
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH -next 2/6] staging: rtl8723bs: mlme: remove unused
 variables
Message-ID: <YGB3i1qYdvJtGpIz@kroah.com>
References: <20210327001736.180881-1-eantoranz@gmail.com>
 <20210327001736.180881-2-eantoranz@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210327001736.180881-2-eantoranz@gmail.com>

On Fri, Mar 26, 2021 at 06:17:32PM -0600, Edmundo Carmona Antoranz wrote:
> The variable *pframe in rtw_build_wmm_ie_ht() and rtw_restructure_ht_ie()
> is set but never read. Both instances are getting removed.
> 
> Removing these warning:
> 
> drivers/staging/rtl8723bs/core/rtw_mlme.c:2560:6: warning: variable ‘pframe’ set but not used [-Wunused-but-set-variable]
> drivers/staging/rtl8723bs/core/rtw_mlme.c:2576:21: warning: variable ‘pframe’ set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Edmundo Carmona Antoranz <eantoranz@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index 29d4b7493784..83fbd415d766 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -2555,12 +2555,11 @@ void rtw_build_wmm_ie_ht(struct adapter *padapter, u8 *out_ie, uint *pout_len)
>  {
>  	unsigned char WMM_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x00, 0x01, 0x00};
>  	int out_len;
> -	u8 *pframe;
>  
>  	if (padapter->mlmepriv.qospriv.qos_option == 0) {
>  		out_len = *pout_len;
> -		pframe = rtw_set_ie(out_ie+out_len, WLAN_EID_VENDOR_SPECIFIC,
> -							_WMM_IE_Length_, WMM_IE, pout_len);
> +		rtw_set_ie(out_ie + out_len, WLAN_EID_VENDOR_SPECIFIC,
> +			   _WMM_IE_Length_, WMM_IE, pout_len);

Why not check the error value?

thanks,

greg k-h
