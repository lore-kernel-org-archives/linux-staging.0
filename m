Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C20523C0;
	Sat, 29 Oct 2022 07:31:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC8CAC433D6;
	Sat, 29 Oct 2022 07:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667028715;
	bh=fekE5mNaYU4tr5MhqcASkIRisSfr+Jn/AaUqP85eL+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uluSYSgud7ecH98orcfLZR6rZJpz5vUm8xklBEvKmggI+8OHnG4WimG5LQ0GrO/Qb
	 txnao02M1F7L8uZKqImEiln9TlcWj7LekeXoC4SvXonhrgsWBiXPWoD/p9DoA+Arki
	 /M6YkBm1MbL/Rkl47i40POXLMzQmC/viFg0B6/9Q=
Date: Sat, 29 Oct 2022 09:32:50 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Deepak R Varma <drv@mailo.com>
Cc: outreachy@lists.linux.dev, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: Use ARRAY_SIZE() to get argument count
Message-ID: <Y1zXIjCe3LGwApWD@kroah.com>
References: <Y1vZXUi0Bjiub8HZ@ubunlion>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1vZXUi0Bjiub8HZ@ubunlion>

On Fri, Oct 28, 2022 at 07:00:05PM +0530, Deepak R Varma wrote:
> The ARRAY_SIZE(foo) macro should be preferred over sizeof operator
> based computation such as sizeof(foo)/sizeof(foo[0]) for finding
> number of elements in an array. Issue identified using coccicheck.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>  drivers/staging/fbtft/fbtft.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
> index 2c2b5f1c1df3..5506a473be91 100644
> --- a/drivers/staging/fbtft/fbtft.h
> +++ b/drivers/staging/fbtft/fbtft.h
> @@ -231,7 +231,7 @@ struct fbtft_par {
>  	bool polarity;
>  };
> 
> -#define NUMARGS(...)  (sizeof((int[]){__VA_ARGS__}) / sizeof(int))
> +#define NUMARGS(...)  ARRAY_SIZE(((int[]){ __VA_ARGS__ }))

Please please please test-build your patches before sending them out.
To not do so just wastes reviewer resources :(

thanks,

greg k-h
