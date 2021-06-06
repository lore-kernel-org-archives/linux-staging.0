Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA4C70
	for <linux-staging@lists.linux.dev>; Sun,  6 Jun 2021 07:13:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DAAA5611ED;
	Sun,  6 Jun 2021 07:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1622963620;
	bh=kKgXqMKBbdsOTgX+oRuQSkCNMTlozOMRdBF9GdCe0Hg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TXnJZroJEikwRaj2EjCXxM6FL0JA5dAOcoFuuVzVZUQ1uHDYIWpV/TQmvV4vJET+B
	 N1vijX9LU8JBq1fp3Lsbbmp2jUvxgMlvMQPFdsEtwWKDj5dRqQLix6S2/CAS3OXoff
	 G3nP4obr0z/Krs7QXTEBUAiTmXFcK+kobD7PxoFU=
Date: Sun, 6 Jun 2021 09:13:37 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Wenli Looi <wlooi@ucalgary.ca>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Fix uninitialized variable
Message-ID: <YLx1oWQAFPYIFRkF@kroah.com>
References: <20210606070021.116284-1-wlooi@ucalgary.ca>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210606070021.116284-1-wlooi@ucalgary.ca>

On Sun, Jun 06, 2021 at 12:00:21AM -0700, Wenli Looi wrote:
> Uninitialized struct with invalid pointer causes BUG and prevents access
> point from working. Access point works once I apply this patch.
> 
> https://forum.armbian.com/topic/14727-wifi-ap-kernel-bug-in-kernel-5444/
> has more details.
> 
> Signed-off-by: Wenli Looi <wlooi@ucalgary.ca>
> ---
>  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index 2fb80b6eb..7308e1185 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -2384,7 +2384,7 @@ void rtw_cfg80211_indicate_sta_assoc(struct adapter *padapter, u8 *pmgmt_frame,
>  	DBG_871X(FUNC_ADPT_FMT"\n", FUNC_ADPT_ARG(padapter));
>  
>  	{
> -		struct station_info sinfo;
> +		struct station_info sinfo = {};

What caused this bug to show up?  Did it happen from some other commit?

Are you sure that all of the fields are being cleared properly here,
what about any "holes" in the structure?

thanks,
greg k-h
