Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B31F2F21
	for <linux-staging@lists.linux.dev>; Mon,  4 Apr 2022 14:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9DEBC2BBE4;
	Mon,  4 Apr 2022 14:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649082576;
	bh=aT8e3BlBfNipB4O093d7n5Op1VJKa4RJFODCpYYoFsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hx6l2VVUpYnQOFTg6KmsjgZgEOjYARG7zUVdOY+6HXouOH7JSXoeRR3ZCcPm4fI1A
	 gVmDDfxhmRkKO8FzUeus9PzqkUQFSbMftgH1JrPxn9zGjBssGxkSIULTsHybgnfqxA
	 kg0HAuuvy56dEjOdoGDw33MvkEFbz891ehoXLHlw=
Date: Mon, 4 Apr 2022 16:29:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: xkernel.wang@foxmail.com
Cc: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] staging: rtl8712: add two validation check in
 r8712_init_drv_sw()
Message-ID: <YksAzXHif7Usdfv9@kroah.com>
References: <tencent_0A1273526E1E87150578F8B752CF7F178806@qq.com>
 <tencent_3096E1464A73FF232014CC40B9001C551408@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_3096E1464A73FF232014CC40B9001C551408@qq.com>

On Fri, Apr 01, 2022 at 01:07:45AM +0800, xkernel.wang@foxmail.com wrote:
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
> 
> _r8712_init_xmit_priv() or _r8712_init_recv_priv() returns -ENOMEM
> when some allocations inside it failed.
> So it is better to check the return status of them.
> 
> Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
> ---
>  drivers/staging/rtl8712/os_intfs.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8712/os_intfs.c b/drivers/staging/rtl8712/os_intfs.c
> index 9502f6a..163baaa 100644
> --- a/drivers/staging/rtl8712/os_intfs.c
> +++ b/drivers/staging/rtl8712/os_intfs.c
> @@ -308,8 +308,12 @@ int r8712_init_drv_sw(struct _adapter *padapter)
>  	ret = r8712_init_mlme_priv(padapter);
>  	if (ret)
>  		return ret;
> -	_r8712_init_xmit_priv(&padapter->xmitpriv, padapter);
> -	_r8712_init_recv_priv(&padapter->recvpriv, padapter);
> +	ret = _r8712_init_xmit_priv(&padapter->xmitpriv, padapter);
> +	if (ret)
> +		return ret;
> +	ret = _r8712_init_recv_priv(&padapter->recvpriv, padapter);
> +	if (ret)
> +		return ret;

You just leaked memory :(

please please please test these types of "fix up error handling"
changes, as there are lots and lots of ways to get these wrong.

If you can not test them, provide some sort of proof that the change is
correct please.

thanks,

greg k-h
