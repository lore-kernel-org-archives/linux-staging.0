Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCF17E3
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 10:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AF0FC433D6;
	Fri,  9 Sep 2022 10:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662718996;
	bh=FfE1rJR6SoQbtNJ6+IRKFmVG9deQF+tAuwlWHLSNdJo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=z7G6M2WYDBnSqeRqMxAyvB+IjoIsFzb27VylT7zTP/mZGNJmZf2dVUmPsjBG0Z05D
	 bogYDD7EhkEIOsTtqgPYb8hcuPfUBhrq9OYfJDfupszK4cUtPBrRLy0WE8XlzKUHXd
	 fLnxm0g7NbfTxtS83c+mes7Y4R51z1y66zKJsFjY=
Date: Fri, 9 Sep 2022 12:23:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nam Cao <namcaov@gmail.com>
Cc: forest@alittletooquiet.net, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: vt6655: use memset to make code clearer
Message-ID: <YxsUEUqbKRW85Z24@kroah.com>
References: <20220909090856.18427-1-namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909090856.18427-1-namcaov@gmail.com>

On Fri, Sep 09, 2022 at 11:08:57AM +0200, Nam Cao wrote:
> A line of code sets the entire struct vnt_rdes0 to zero by treating it as
> unsigned int. This works because sizeof(unsigned int) is equal to
> sizeof(struct vnt_rdes0) (4 bytes). However it is not obvious what this
> code is doing. Re-write this using memset to make the code clearer.
> 
> Signed-off-by: Nam Cao <namcaov@gmail.com>
> ---
> v2: re-write commit message because previous message describes a
> non-existent problem.
> 
>  drivers/staging/vt6655/device_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
> index 8e2a976aaaad..a38657769c20 100644
> --- a/drivers/staging/vt6655/device_main.c
> +++ b/drivers/staging/vt6655/device_main.c
> @@ -867,7 +867,7 @@ static bool device_alloc_rx_buf(struct vnt_private *priv,
>  		return false;
>  	}
>  
> -	*((unsigned int *)&rd->rd0) = 0; /* FIX cast */
> +	memset((void *)&rd->rd0, 0, sizeof(rd->rd0));

Why do you have to cast this to (void *)?  That should almost never be
needed.

thanks,

greg k-h
