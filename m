Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA493FC1
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 09:44:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B85B46069E;
	Mon,  6 Sep 2021 09:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1630921479;
	bh=URzFpDiRAvqj9TyRQWt1sJXc0kGU7HlFj/iPTlLyjsI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SUNuBrRWIQRZx6p82foUKLcl7NTyK6xjTdrnrJaiF4ALvbbbkzKX/B0HRuT6+38FB
	 KR22VEkY6+xW7ydwDZRp+sm0qUw1++aIv7UG19+wXW36g4FpKvRDhWJ8nJidVkF8I4
	 5r9EBVLmADNCp1lFJIauGO/mHhTu9pcQBudlbujk=
Date: Mon, 6 Sep 2021 11:44:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	straube.linux@gmail.com, fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: fix type mismacth
Message-ID: <YTXjBCZvdTeutTZX@kroah.com>
References: <20210905205216.24831-1-paskripkin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210905205216.24831-1-paskripkin@gmail.com>

On Sun, Sep 05, 2021 at 11:52:16PM +0300, Pavel Skripkin wrote:
> smatch says:
> rtw_cmd.c:1165 rtw_setassocsta_cmd() warn: struct type mismatch 'set_stakey_rsp vs set_assocsta_rsp'
> 
> Since psetassocsta_rsp has struct set_stakey_rsp * type, it looks like
> copy-paste failure. This error didn't cause any bugs, because
> sizeof(struct set_assocsta_parm) > sizeof(struct set_stakey_rsp), but
> there is no reason for allocation extra unused memory
> 
> Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for RTL8188eu driver")
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_cmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
> index fee4208dacba..afe6c7fa594d 100644
> --- a/drivers/staging/r8188eu/core/rtw_cmd.c
> +++ b/drivers/staging/r8188eu/core/rtw_cmd.c
> @@ -1162,7 +1162,7 @@ u8 rtw_setassocsta_cmd(struct adapter  *padapter, u8 *mac_addr)
>  		goto exit;
>  	}
>  
> -	psetassocsta_rsp = kzalloc(sizeof(struct set_assocsta_rsp), GFP_ATOMIC);
> +	psetassocsta_rsp = kzalloc(sizeof(struct set_stakey_rsp), GFP_ATOMIC);

Best way to fix this is to use the variable in the call itself, like:
	psetassocsta_rsp = kzalloc(sizeof(*psetassocsta_rsp), GFP_ATOMIC);

But as Dan said, this looks odd overall, please make sure that the code
is correct here.

thanks,

greg k-h
