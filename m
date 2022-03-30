Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7DB7C
	for <linux-staging@lists.linux.dev>; Wed, 30 Mar 2022 11:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A94ECC340EE;
	Wed, 30 Mar 2022 11:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1648640616;
	bh=C+XthxcZK0slDrivIv8utqwUp6xmswLxrsdKB843Dic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lLee5w8CWHKteAqABcDu8vhQDbHClVDcrd071PCg+/6BRslt23gKBCpePgcw3CsE1
	 QMrsjGooFhBH8hyEr7uK0q1f9AkMT1pvx/uL4XrMOuqgg/JY7gu0ElMqKVq6Kd7mnT
	 kWUZ6BUXldbezyIldPKCheQ8oiKWZRCAOYNPMSxc=
Date: Wed, 30 Mar 2022 13:43:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: xkernel.wang@foxmail.com
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: r8188eu: fix a potential memory leak in
 _rtw_init_cmd_priv()
Message-ID: <YkRCZXmFk7ElDGGl@kroah.com>
References: <tencent_FF6828BEC24B9560FE5D405E998D73633809@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_FF6828BEC24B9560FE5D405E998D73633809@qq.com>

On Wed, Mar 30, 2022 at 07:32:21PM +0800, xkernel.wang@foxmail.com wrote:
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
> 
> In _rtw_init_cmd_priv(), if `pcmdpriv->rsp_allocated_buf` is allocated
> in failure, `pcmdpriv->cmd_allocated_buf` is not properly released.
> This patch is to free it.
> 
> Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_cmd.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
> index 56910c3..e76015e 100644
> --- a/drivers/staging/r8188eu/core/rtw_cmd.c
> +++ b/drivers/staging/r8188eu/core/rtw_cmd.c
> @@ -42,6 +42,8 @@ static int _rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
>  	pcmdpriv->rsp_allocated_buf = kzalloc(MAX_RSPSZ + 4, GFP_KERNEL);
>  
>  	if (!pcmdpriv->rsp_allocated_buf) {
> +		kfree(pcmdpriv->cmd_allocated_buf);
> +		pcmdpriv->cmd_allocated_buf = NULL;
>  		res = _FAIL;
>  		goto exit;

Shouldn't this be handled properly in the exit: portion instead?

thanks,

greg k-h
