Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA751849
	for <linux-staging@lists.linux.dev>; Tue, 26 Sep 2023 09:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E41D0C433C9;
	Tue, 26 Sep 2023 09:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1695719447;
	bh=Pij0F/OHhe29LporfyG/dolasbY35LkZvuQqT1vlikc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q3R+LZ5BMFPUOh5zwmMvuhb1oJWKPSblJwKGZJQvmzRb/7bY2f+wwwOcbWp9jh1UQ
	 HJX9kFv5tZ6qbTJRR4msueu090+YIRzWPnd5jAWVAjeOpl9eokhNn7eixymDZZMMXB
	 LYsOhczTB8obQrjwg8aS/jnZiTJV3e4WwEhqpSU4=
Date: Tue, 26 Sep 2023 11:10:43 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Piro Yang <piroyangg@gmail.com>
Cc: philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: vme_user: using __func__ to replace
 function's name in printk
Message-ID: <2023092654-staring-smother-9860@gregkh>
References: <9548bc1c-23c9-427f-446e-61f051f14f9c@gmail.com>
 <20230917203019.79180-1-piroyangg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230917203019.79180-1-piroyangg@gmail.com>

On Mon, Sep 18, 2023 at 04:30:19AM +0800, Piro Yang wrote:
> Fix issue relating to prink message:
> 	*using __func__ to replace function's name
> 
> Issue found by checkpatch
> 
> Signed-off-by: Piro Yang <piroyangg@gmail.com>
> ---
> Changes in v2:
>   - Firstly, fix only one type of Waring by checkpatch.
> 	using '"%s...", __func__' substitute for function's name of printked information

This is v3, right?

> 
> diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
> index 5960562dcd96..de404c6765f3 100644
> --- a/drivers/staging/vme_user/vme.c
> +++ b/drivers/staging/vme_user/vme.c
> @@ -418,7 +418,7 @@ int vme_slave_get(struct vme_resource *resource, int *enabled,
>  	image = list_entry(resource->entry, struct vme_slave_resource, list);
>  
>  	if (!bridge->slave_get) {
> -		printk(KERN_ERR "vme_slave_get not supported\n");
> +		printk(KERN_ERR "%s not supported\n", __func__);

Please move to real dev_err() calls instead of trying to fix up old and
broken printk() calls.  That's the correct solution here for this
codebase and if you look on the list, I think there are patches that do
this already, right?

thanks,

greg k-h
