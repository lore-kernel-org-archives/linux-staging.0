Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5462A6D0D
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 08:32:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F94A61246;
	Wed,  7 Apr 2021 08:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1617784326;
	bh=r74abV0HnQhwcnFE9x4s3tE7D4/Va11TGitx5tmoBZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gAkFggY4GxEY5JTKLyGWfpcqP55G6bHc6irB5KEyY/OOTYZKBH9sBMeC7/bGmvNDY
	 ndlIcfYmf3/fINPA/suIvyrSL+R6V80rDuSRodJo9X3An160as6vvgU3ma1hNTJvxM
	 1Q7fv6QEirV8ZBLUcQ24CV3V9n+eQjd59jJ5z45U=
Date: Wed, 7 Apr 2021 10:32:04 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pavle Rohalj <pavle.rohalj@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/49] staging: sm750fb: Rename dviInit to dvi_init
 and update param names
Message-ID: <YG1uBAIOgwA2FYUB@kroah.com>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
 <6c6ecf7eee7d41492dbbcc4410db7eefd1fbb13d.1617776878.git.pavle.rohalj@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c6ecf7eee7d41492dbbcc4410db7eefd1fbb13d.1617776878.git.pavle.rohalj@gmail.com>

On Tue, Apr 06, 2021 at 11:36:01PM -0700, Pavle Rohalj wrote:
> Fix "Avoid CamelCase" checkpatch.pl checks for the function dviInit and
> its parameter names in ddk750_dvi.h.
> 
> Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
> ---
>  drivers/staging/sm750fb/ddk750_dvi.c |  2 +-
>  drivers/staging/sm750fb/ddk750_dvi.h | 20 ++++++++++----------
>  2 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
> index db19bf732482..943cbcafcffa 100644
> --- a/drivers/staging/sm750fb/ddk750_dvi.c
> +++ b/drivers/staging/sm750fb/ddk750_dvi.c
> @@ -30,7 +30,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
>  #endif
>  };
>  
> -int dviInit(unsigned char edge_select,
> +int dvi_init(unsigned char edge_select,

Why is this a global function?  Just make it static and remove it from
the .h file.

thanks,

greg k-h
