Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0199965A
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 07:49:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56A76C433C1;
	Fri,  9 Sep 2022 07:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662709767;
	bh=Ywgr3/9Kad9XGc5SqNblH8MkkCw6DjuU6+0H6YSvzig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F/ptCnACeRMoec8usrtMotwzIHZvmE4aF02OHwHhRUn9TjjENjUMMytuCPlPXZZrC
	 Mn8D7QOWffcA+pvt2qZFQw6QV48vPhQtBaSaNOG9WQLJTCS3IlQ0ohmwef0BRGQcQN
	 UhC1CGEyC1cgoy0RdTZyq7c8SBNQj/I/20d6nTno=
Date: Fri, 9 Sep 2022 09:49:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: xkernel.wang@foxmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: fix a potential memory leak in
 rtw_init_cmd_priv()
Message-ID: <YxrwBV9Xb/5ucEHA@kroah.com>
References: <tencent_3FB11458E1274AF3FF69207CCC10B92F1C08@qq.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_3FB11458E1274AF3FF69207CCC10B92F1C08@qq.com>

On Thu, Sep 08, 2022 at 03:33:00PM +0800, xkernel.wang@foxmail.com wrote:
> From: Xiaoke Wang <xkernel.wang@foxmail.com>
> 
> In rtw_init_cmd_priv(), if `pcmdpriv->rsp_allocated_buf` is allocated  
> in failure, then `pcmdpriv->cmd_allocated_buf` will be not properly 
> released. Besides, considering there are only two error paths and the 
> first one can directly return, so we do not need implicitly jump to the 
> `exit` tag to execute the error handler.
> 
> So this patch added `kfree(pcmdpriv->cmd_allocated_buf);` on the error 
> path to release the resource and simplified the return logic of 

Again, whitespace at end of changelog text :(

> rtw_init_cmd_priv(). As there is no FooBar device to test with, no runtime
> testing was performed.

"FooBar"?

> 
> Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
> ---
> ChangeLog:
> v1->v2 update the description.
> v2->v3 update the description.
>  drivers/staging/rtl8723bs/core/rtw_cmd.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index e574893..9126ea9 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -161,8 +161,6 @@ static struct cmd_hdl wlancmds[] = {
>  
>  int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
>  {
> -	int res = 0;
> -
>  	init_completion(&pcmdpriv->cmd_queue_comp);
>  	init_completion(&pcmdpriv->terminate_cmdthread_comp);
>  
> @@ -175,18 +173,17 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
>  
>  	pcmdpriv->cmd_allocated_buf = rtw_zmalloc(MAX_CMDSZ + CMDBUFF_ALIGN_SZ);
>  
> -	if (!pcmdpriv->cmd_allocated_buf) {
> -		res = -ENOMEM;
> -		goto exit;
> -	}
> +	if (!pcmdpriv->cmd_allocated_buf)
> +		return -ENOMEM;
>  
>  	pcmdpriv->cmd_buf = pcmdpriv->cmd_allocated_buf  +  CMDBUFF_ALIGN_SZ - ((SIZE_PTR)(pcmdpriv->cmd_allocated_buf) & (CMDBUFF_ALIGN_SZ-1));
>  
>  	pcmdpriv->rsp_allocated_buf = rtw_zmalloc(MAX_RSPSZ + 4);
>  
>  	if (!pcmdpriv->rsp_allocated_buf) {
> -		res = -ENOMEM;
> -		goto exit;
> +		kfree(pcmdpriv->cmd_allocated_buf);
> +		pcmdpriv->cmd_allocated_buf = NULL;

Why does this have to be set to NULL?

thanks,

greg k-h
