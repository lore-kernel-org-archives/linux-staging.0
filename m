Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042EC1FB7
	for <linux-staging@lists.linux.dev>; Sun, 16 Jul 2023 15:20:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12D00C433C8;
	Sun, 16 Jul 2023 15:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1689520821;
	bh=72ikFVHayvUhCOUqEUnivclFjsyClhyTTmSahMGBE3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yZvdeqFGDdgW22R+V1j+1f09Hyen2Ep6ijbAinq2tR/FTpL8mnTdzY/WMsnwV2vF+
	 PKd8R78vntNQEW8jP/IOrulpua7jKrKqM5xBqno4suhZMvPmyR1SH97y8dOp3sqjxr
	 kahCNgBrQEq8uD7g+RBZyvGYf+MPd0LuNGHa/8So=
Date: Sun, 16 Jul 2023 17:20:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Anastasia Belova <abelova@astralinux.ru>
Cc: Rob Springer <rspringer@google.com>,
	Todd Poynor <toddpoynor@google.com>,
	Ben Chan <benchan@chromium.org>, Richard Yeh <rcy@google.com>,
	John Joseph <jnjoseph@google.com>, Simon Que <sque@chromium.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH 5.10] gasket: make interrupt_data NULL after free
Message-ID: <2023071601-uncombed-stifling-bb3a@gregkh>
References: <20230707134712.7019-1-abelova@astralinux.ru>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230707134712.7019-1-abelova@astralinux.ru>

On Fri, Jul 07, 2023 at 04:47:12PM +0300, Anastasia Belova wrote:
> Gasket common interrupt module was deleted in version 5.13, 
> but there is possible double free in versions 4.19-5.12.
> 
> gasket_dev->interrupt_data should be NULL when
> gasket_interrupt_init returns error. For example,
> it is necessary in gasket_enable_device to avoid
> double free.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 9a69f5087ccc ("drivers/staging: Gasket driver framework + Apex driver")
> Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
> ---
>  drivers/staging/gasket/gasket_interrupt.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/gasket/gasket_interrupt.c b/drivers/staging/gasket/gasket_interrupt.c
> index 864342acfd86..24fa5df0628b 100644
> --- a/drivers/staging/gasket/gasket_interrupt.c
> +++ b/drivers/staging/gasket/gasket_interrupt.c
> @@ -337,6 +337,7 @@ int gasket_interrupt_init(struct gasket_dev *gasket_dev)
>  			sizeof(*interrupt_data->eventfd_ctxs), GFP_KERNEL);
>  	if (!interrupt_data->eventfd_ctxs) {
>  		kfree(interrupt_data);
> +		gasket_dev->interrupt_data = NULL;
>  		return -ENOMEM;
>  	}
>  
> @@ -346,6 +347,7 @@ int gasket_interrupt_init(struct gasket_dev *gasket_dev)
>  	if (!interrupt_data->interrupt_counts) {
>  		kfree(interrupt_data->eventfd_ctxs);
>  		kfree(interrupt_data);
> +		gasket_dev->interrupt_data = NULL;
>  		return -ENOMEM;
>  	}
>  
> -- 
> 2.30.2
> 

As this can never happen in real life, and no one is using this code,
I'm going to ignore this patch for now, sorry.

greg k-h
