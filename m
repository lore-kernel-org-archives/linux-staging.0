Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9899F1A582;
	Wed, 18 Oct 2023 13:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wGTnNf+Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12588C433C7;
	Wed, 18 Oct 2023 13:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697635573;
	bh=QibHFyUe/EPNDDhU4KtzbtUNy6mOEodj9TioLZzQ+ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wGTnNf+Ys3HVCRBatDeBspYArhSkDCQq/SJ9wJ9HoGw7Id72lDTvgas8JTPUmzkHY
	 vA6bz2PyxeGX2TfoNQmOtqtKhXx31EXv9XE/UYesjYil0+FT8Gxe0Mvko+fb1ILgK3
	 NfsPThfMoOw2dFebarl11b1szGByIC4w0Ksvn8ao=
Date: Wed, 18 Oct 2023 15:26:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Soumya Negi <soumya.negi97@gmail.com>
Cc: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>, outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/2] staging: vme_user: Replace printk() with
 pr_*(),dev_*()
Message-ID: <2023101823-unhidden-draw-d68c@gregkh>
References: <cover.1697601942.git.soumya.negi97@gmail.com>
 <a0579eeda5ce70f69b6bfdcbe534b9d37138096c.1697601942.git.soumya.negi97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0579eeda5ce70f69b6bfdcbe534b9d37138096c.1697601942.git.soumya.negi97@gmail.com>

On Tue, Oct 17, 2023 at 09:36:32PM -0700, Soumya Negi wrote:
> vme.c uses printk() to log messages. To improve and standardize message
> formatting, use logging mechanisms pr_err()/pr_warn() and
> dev_err()/dev_warn() instead. Retain the printk log levels of the
> messages during replacement.
> 
> Issue found by checkpatch.pl
> 
> Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
> ---
>  drivers/staging/vme_user/vme.c | 175 ++++++++++++++++++---------------
>  1 file changed, 94 insertions(+), 81 deletions(-)
> 
> diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
> index 6519a7c994a0..e8c2c1e77b7d 100644
> --- a/drivers/staging/vme_user/vme.c
> +++ b/drivers/staging/vme_user/vme.c
> @@ -9,6 +9,8 @@
>   * Copyright 2004 Motorola Inc.
>   */
>  
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

No, this is a driver, as others have pointed out, always use dev_*()
calls instead.

Yes, that means that sometimes you do need to propagate the proper
device to the function, but that's ok, it's the correct solution here.

thanks,

greg k-h
