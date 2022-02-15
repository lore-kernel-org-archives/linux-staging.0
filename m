Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E911578
	for <linux-staging@lists.linux.dev>; Tue, 15 Feb 2022 16:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 110F8C340EC;
	Tue, 15 Feb 2022 16:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1644941415;
	bh=btmIpiqpKbhsvTMtjH1n8pyIl3PypLvmjDYFv6l3URU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jX1Js0zkOXAvMHbLktSGh36A0Fx5IarIZ5AdvVvA1JFW7tqBKZ2Czk2ZT0vkhh1eI
	 5m+GnAt2frvbsCQYDEUSQOTa3VXhiKvnkUVGAUnWIVdVHwIlacfGOFey20Yj0TOv3b
	 Q7y7fnJrki9NOreG9945F8Aprab8j+i3C2uH85KY=
Date: Tue, 15 Feb 2022 17:10:12 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] staging: r8188eu: Use kzalloc() with GFP_ATOMIC
 in atomic context
Message-ID: <YgvQZDBLCsvwTtJM@kroah.com>
References: <20220208180426.27455-1-fmdefrancesco@gmail.com>
 <20220208180426.27455-3-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220208180426.27455-3-fmdefrancesco@gmail.com>

On Tue, Feb 08, 2022 at 07:04:26PM +0100, Fabio M. De Francesco wrote:
> Use the GFP_ATOMIC flag of kzalloc() with two memory allocation in rtw_set_key() 
> because it is not allowed to sleep while it executes in atomic context.
> 
> With the GFP_ATOMIC type flag, the allocation is high priority and thus it 
> cannot sleep.
> 
> This issue is detected by Smatch which emits the following warning:
> 
> "drivers/staging/r8188eu/core/rtw_mlme.c:1603 rtw_set_key() warn: sleeping in atomic context".
> 
> Fixes: 79f712ea994d ("staging: r8188eu: Remove wrappers for kalloc() and kzalloc()")
> Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for RTL8188eu driver")
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_mlme.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
> index f5b2df72e0f4..860835e29b79 100644
> --- a/drivers/staging/r8188eu/core/rtw_mlme.c
> +++ b/drivers/staging/r8188eu/core/rtw_mlme.c
> @@ -1600,12 +1600,12 @@ int rtw_set_key(struct adapter *adapter, struct security_priv *psecuritypriv, in
>  	struct mlme_priv		*pmlmepriv = &adapter->mlmepriv;
>  	int	res = _SUCCESS;
>  
> -	pcmd = kzalloc(sizeof(*pcmd), GFP_KERNEL);
> +	pcmd = kzalloc(sizeof(*pcmd), GFP_ATOMIC);
>  	if (!pcmd) {
>  		res = _FAIL;  /* try again */
>  		goto exit;
>  	}
> -	psetkeyparm = kzalloc(sizeof(*psetkeyparm), GFP_KERNEL);
> +	psetkeyparm = kzalloc(sizeof(*psetkeyparm), GFP_ATOMIC);
>  	if (!psetkeyparm) {
>  		kfree(pcmd);
>  		res = _FAIL;
> -- 
> 2.34.1

What code path is calling this in atomic context?

thanks,

greg k-h
