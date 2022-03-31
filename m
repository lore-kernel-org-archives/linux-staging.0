Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554087E0
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 06:05:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81348C340F0;
	Thu, 31 Mar 2022 06:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1648706753;
	bh=Fajq2q58T8JQGQNMfV56qm0v4N1kyLJuA/ecjhDD1uk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KtVXBVFWe65EbTJaSQ0rWEp5jG70gQhlnIMqxtxuAW7E7HqlLsyyMqQ/TnRt3t/yG
	 H5bGuBuC7rmOlsot/6n5nIoGrJQQ+xh/PDkP3+RF+iJGZTedWrAWahPNRFgkAgmp7g
	 uK+lFoQ/lidLocrhSQ8n/wVQMuaeXtDRqGo8JZpU=
Date: Thu, 31 Mar 2022 08:05:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: xkernel.wang@foxmail.com
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: r8188eu: fix a potential memory leak in
 _rtw_init_cmd_priv()
Message-ID: <YkVEug04VgT70AzB@kroah.com>
References: <tencent_1150789052C1FF3548117344EE374723C506@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_1150789052C1FF3548117344EE374723C506@qq.com>

On Thu, Mar 31, 2022 at 12:15:35AM +0800, xkernel.wang@foxmail.com wrote:
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
> 
> In _rtw_init_cmd_priv(), if `pcmdpriv->rsp_allocated_buf` is allocated
> in failure, `pcmdpriv->cmd_allocated_buf` is not properly released.
> This patch is to free it.
> 
> Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
> ---
> ChangeLog:
> v1->v2: simplify the function.
>  drivers/staging/r8188eu/core/rtw_cmd.c | 21 +++++----------------
>  1 file changed, 5 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
> index 56910c3..3de3a39 100644
> --- a/drivers/staging/r8188eu/core/rtw_cmd.c
> +++ b/drivers/staging/r8188eu/core/rtw_cmd.c
> @@ -17,8 +17,6 @@ No irqsave is necessary.
>  
>  static int _rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
>  {
> -	int res = _SUCCESS;
> -
>  	sema_init(&pcmdpriv->cmd_queue_sema, 0);
>  	/* sema_init(&(pcmdpriv->cmd_done_sema), 0); */
>  	sema_init(&pcmdpriv->terminate_cmdthread_sema, 0);
> @@ -26,34 +24,25 @@ static int _rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
>  	_rtw_init_queue(&pcmdpriv->cmd_queue);
>  
>  	/* allocate DMA-able/Non-Page memory for cmd_buf and rsp_buf */
> -
>  	pcmdpriv->cmd_seq = 1;
> -

Why make whitespace cleanups at the same time?  Please do not do that.

And I do not think this patch applies anymore _rtw_init_queue() is not
in my tree.  Please rebase and fix up and resend.

thanks,

greg k-h
