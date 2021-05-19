Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4402FB6
	for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 15:50:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94E7D6112F;
	Wed, 19 May 2021 15:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1621439422;
	bh=rYA/31RI19unKY33ZujGjk0FHRHaNlKBf7X+2ju0gmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VZD88qD1Bhjp4kQUbWuk4coZH/drDCr41S9q94kFr5eSWmatic5tSPSbc5o5Jz8sG
	 Sz9kNBIdgUoX6rBJ5CKYuX6J+PatLN6RiiBjNpMrKmiNyxf8frRg5ibZDFvGy5s//i
	 iTk1qVXClt6ckagdRlHfnUWHgfBoijvLfzm3mIp0=
Date: Wed, 19 May 2021 17:50:20 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Wan Jiabing <wanjiabing@vivo.com>
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>,
	Marco Cesati <marcocesati@gmail.com>, Jiabing Wan <kael_w@yeah.net>,
	Ivan Safonov <insafonov@gmail.com>,
	Ross Schmidt <ross.schm.dev@gmail.com>,
	Colin Ian King <colin.king@canonical.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: os_dep: Align comments and add a
 blank line
Message-ID: <YKUzvHg+m66d0v5x@kroah.com>
References: <20210518022207.83513-1-wanjiabing@vivo.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210518022207.83513-1-wanjiabing@vivo.com>

On Tue, May 18, 2021 at 10:20:54AM +0800, Wan Jiabing wrote:
> From: Jiabing Wan <kael_w@yeah.net>
> 
> Fixing the following checkpatch warnings:
> WARNING: Block comments should align the * on each line
> WARNING: Missing a blank line after declarations
> 
> Signed-off-by: Jiabing Wan<kael_w@yeah.net>
> ---
>  drivers/staging/rtl8723bs/os_dep/osdep_service.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> index c58555a4012f..2d965e62347f 100644
> --- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> +++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> @@ -7,10 +7,10 @@
>  #include <drv_types.h>
>  #include <rtw_debug.h>
>  
> -/*
> -* Translate the OS dependent @param error_code to OS independent RTW_STATUS_CODE
> -* @return: one of RTW_STATUS_CODE
> -*/
> +/**

If you are going to use kernel doc, make it kernel doc, don't just make
it half-way there :)

> + * Translate the OS dependent @param error_code to OS independent RTW_STATUS_CODE
> + * @return: one of RTW_STATUS_CODE
> + */
>  inline int RTW_STATUS_CODE(int error_code)
>  {
>  	if (error_code >= 0)
> @@ -262,6 +262,7 @@ bool rtw_cbuf_push(struct rtw_cbuf *cbuf, void *buf)
>  void *rtw_cbuf_pop(struct rtw_cbuf *cbuf)
>  {
>  	void *buf;
> +
>  	if (rtw_cbuf_empty(cbuf))
>  		return NULL;
>  
> -- 
> 2.20.1
> 

You are doing multiple things in the same patch, please break this up.

thanks,

greg k-h
