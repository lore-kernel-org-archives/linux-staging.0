Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CDCD52D
	for <linux-staging@lists.linux.dev>; Tue, 17 Jan 2023 18:26:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263B0C433D2;
	Tue, 17 Jan 2023 18:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1673979973;
	bh=Q90VKPgW+JFewMBMzsuqXxzkJi00frMGuUon88lOkq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WKUzgGiVxZPomNN4Vll7M7TaAlTGSxJlPBgepOpf9lT+Oim9Gn4s6/+RVIejzX3ji
	 ClOaH5eELzunGqHvd8uW1lmpe1dsg5Ua2sgalCQ4GqrbxOUom/ex25fVlOsWQHSVH9
	 wnZ2DGZ/n6Gz7YTYDNUCJEFzMVkHTExRnjKDuDVo=
Date: Tue, 17 Jan 2023 19:26:11 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Aldas =?utf-8?B?VGFyYcWha2V2acSNaXVz?= <aldas60@gmail.com>
Cc: manishc@marvell.com, GR-Linux-NIC-Dev@marvell.com,
	netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: qlge: remove unnecessary spaces before function
 pointer args
Message-ID: <Y8boQ0T9yZ+78t7y@kroah.com>
References: <20221214205147.2172-1-aldas60@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221214205147.2172-1-aldas60@gmail.com>

On Wed, Dec 14, 2022 at 10:51:47PM +0200, Aldas Taraškevičius wrote:
> Remove unnecessary spaces before the function pointer arguments as
> warned by checkpatch.
> 
> Signed-off-by: Aldas Taraškevičius <aldas60@gmail.com>
> ---
>  drivers/staging/qlge/qlge.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/qlge/qlge.h b/drivers/staging/qlge/qlge.h
> index fc8c5ca89..05e4f4744 100644
> --- a/drivers/staging/qlge/qlge.h
> +++ b/drivers/staging/qlge/qlge.h
> @@ -2057,8 +2057,8 @@ enum {
>  };
>  
>  struct nic_operations {
> -	int (*get_flash) (struct ql_adapter *);
> -	int (*port_initialize) (struct ql_adapter *);
> +	int (*get_flash)(struct ql_adapter *);
> +	int (*port_initialize)(struct ql_adapter *);
>  };
>  
>  /*
> -- 
> 2.37.2
> 
> 

Does not apply to my tree :(
