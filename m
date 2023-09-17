Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706913FFB
	for <linux-staging@lists.linux.dev>; Sun, 17 Sep 2023 18:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB96C433C7;
	Sun, 17 Sep 2023 18:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1694975681;
	bh=oBHKXiAaWhylyQ/KERX2Lkd4BMGD/T9k0XU2r8coW6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rKau8ERtJ1aCkNupFiwDNrNObl3COJ1LLflqmmZY9zx8PDGgnrgLe01Q1CgmQSsYE
	 Bx8Pm+lAnFnykDRvvI8jU879Ssk8itcxmdoROTdvo0NKcTFMug/I1Vncqfabj3nQPr
	 NHBwq56fLIFDBllNdUBEYJqhNgwXxjyOVbfPxMAM=
Date: Sun, 17 Sep 2023 20:34:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Piro Yang <piroyangg@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: Fixed prink formatting issues
Message-ID: <2023091756-duct-agile-0023@gregkh>
References: <20230917171824.76702-1-piroyangg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230917171824.76702-1-piroyangg@gmail.com>

On Mon, Sep 18, 2023 at 01:18:24AM +0800, Piro Yang wrote:
> Fixed issues relating to prink message including:
> 
> a. using __func__ to replace function's name
> b. using pr_warn to replace "printk(KERN_ERR"
> 
> Issue found by checkpatch
> 
> Signed-off-by: Piro Yang <piroyangg@gmail.com>
> ---
>  drivers/staging/vme_user/vme.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
> index 5960562dcd96..56c528628e7d 100644
> --- a/drivers/staging/vme_user/vme.c
> +++ b/drivers/staging/vme_user/vme.c
> @@ -418,7 +418,7 @@ int vme_slave_get(struct vme_resource *resource, int *enabled,
>  	image = list_entry(resource->entry, struct vme_slave_resource, list);
>  
>  	if (!bridge->slave_get) {
> -		printk(KERN_ERR "vme_slave_get not supported\n");
> +		pr_warn("%s not supported\n", __func__);

KERN_ERR is not the same thing a pr_warn(), why did you make this
change?

And you are doing multiple things in the same change, why?

Also, drivers should always use dev_warn(), not pr_*() calls.

thanks,

greg k-h
