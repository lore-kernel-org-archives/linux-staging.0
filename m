Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6690779D4
	for <linux-staging@lists.linux.dev>; Mon, 15 May 2023 13:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92F86C433EF;
	Mon, 15 May 2023 13:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1684155741;
	bh=A50I111Beii2n1Gd+IAzZUqQEECQkz+pR1uvFuPD3ew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QL589bz/46+mnXFbkmBKzVB0rZe10E7eStjotjvFRsebyuoAh8Dj6Wlu2C3ApcXMQ
	 p3Wk1tO6/WIV/b8j4RqRXNaZrRtrIMI31UoXYsqRgEWrI33ditYZsjFQjsPd8b4Zxs
	 j6vLDs4TTtLk5NTMUibyPVWcdWgV7lPifCDNuFLQ=
Date: Mon, 15 May 2023 15:02:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Esina Ekaterina <eesina@astralinux.ru>
Cc: Rob Springer <rspringer@google.com>,
	Todd Poynor <toddpoynor@google.com>,
	Ben Chan <benchan@chromium.org>, Richard Yeh <rcy@google.com>,
	John Joseph <jnjoseph@google.com>, Simon Que <sque@chromium.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH 5.10] staging: gasket: interrupt: Clean interrupt_data
 after free
Message-ID: <2023051546-churn-obstinate-20af@gregkh>
References: <20230515122950.100564-1-eesina@astralinux.ru>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230515122950.100564-1-eesina@astralinux.ru>

On Mon, May 15, 2023 at 03:29:50PM +0300, Esina Ekaterina wrote:
> Add interrupt_data = NULL after kfree(interrupt_data) in
> gasket_interrupt_init. It is needed to avoid double free
> in gasket_interrupt_cleanup, there is a check for NULL
> before kfree(interrupt_data).
> 
> Found by Astra Linux on behalf of Linux Verification Center
> (linuxtesting.org) with SVACE.
> 
> Fixes: 9a69f5087ccc ("drivers/staging: Gasket driver framework + Apex driver")
> Signed-off-by: Esina Ekaterina <eesina@astralinux.ru>
> ---
>  drivers/staging/gasket/gasket_interrupt.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/gasket/gasket_interrupt.c b/drivers/staging/gasket/gasket_interrupt.c
> index 864342acfd86..48b664b9134a 100644
> --- a/drivers/staging/gasket/gasket_interrupt.c
> +++ b/drivers/staging/gasket/gasket_interrupt.c
> @@ -337,6 +337,7 @@ int gasket_interrupt_init(struct gasket_dev *gasket_dev)
>  			sizeof(*interrupt_data->eventfd_ctxs), GFP_KERNEL);
>  	if (!interrupt_data->eventfd_ctxs) {
>  		kfree(interrupt_data);
> +		interrupt_data = NULL;
>  		return -ENOMEM;
>  	}
>  
> @@ -346,6 +347,7 @@ int gasket_interrupt_init(struct gasket_dev *gasket_dev)
>  	if (!interrupt_data->interrupt_counts) {
>  		kfree(interrupt_data->eventfd_ctxs);
>  		kfree(interrupt_data);
> +		interrupt_data = NULL;
>  		return -ENOMEM;
>  	}
>  
> -- 
> 2.40.1

Also, your tool is wrong, this is not a correct fix at all.

How did you test it?  Why is your tool spitting out incorrect code?  Why
are you not verifying it's output before asking others to do so?

Please don't do this anymore, it's wasteful on our side, right?  Please
take the time to review existing changes for problems, that would be
more useful overall to everyone.

thanks,

greg k-h
