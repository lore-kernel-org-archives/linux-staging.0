Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508C071
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 09:41:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 43D6F61241;
	Mon, 12 Apr 2021 09:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1618220516;
	bh=nryu7mJqQngn8j8YZtZLJYylcpSAA1GV7IacvGJBhU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=STuZV4GG16WFSbDXkoIzgUj4qrGE+BNfUh2Lg/WrGBN+xuo3qmDW8oxav8Am7+q5q
	 gF/rw4eY3zm1BugsCBhA865iV4Ks6WF33e28RZbPtqreibVHp1BFK68nJtVmCtWld+
	 laVT1Liw4U7iEvDtgZ3dSDEJzsCG9W3QZLfwevTY=
Date: Mon, 12 Apr 2021 11:41:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: emxx_udc: remove useless variable
Message-ID: <YHQV4sX6rGjFb9yj@kroah.com>
References: <1618195990-85967-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1618195990-85967-1-git-send-email-jiapeng.chong@linux.alibaba.com>

On Mon, Apr 12, 2021 at 10:53:10AM +0800, Jiapeng Chong wrote:
> Fix the following gcc warning:
> 
> vers/staging/emxx_udc/emxx_udc.c:41:19: warning: ‘driver_desc’ defined
> but not used [-Wunused-const-variable=].
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/staging/emxx_udc/emxx_udc.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/emxx_udc/emxx_udc.c b/drivers/staging/emxx_udc/emxx_udc.c
> index 3536c03..741147a 100644
> --- a/drivers/staging/emxx_udc/emxx_udc.c
> +++ b/drivers/staging/emxx_udc/emxx_udc.c
> @@ -38,7 +38,6 @@
>  static int vbus_irq;
>  
>  static const char	driver_name[] = "emxx_udc";
> -static const char	driver_desc[] = DRIVER_DESC;
>  
>  /*===========================================================================*/
>  /* Prototype */
> -- 
> 1.8.3.1
> 
>

Does not apply to my tree at all :(
