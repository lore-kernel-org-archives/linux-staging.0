Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D221C27
	for <linux-staging@lists.linux.dev>; Sat,  4 Feb 2023 07:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DEB6C433EF;
	Sat,  4 Feb 2023 07:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1675497314;
	bh=I+UA++7uy2P3zsjHcnqTaMLJ8Ky59RgkXxtzoV1Etfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bEcQriWL/szjvaNX4nwsmvBxoBUkBq2QH6aK5SeNnDZ0okRYAbqls2NsJsq5pCMch
	 4kYspymHE5k2GapjEoh8RwZIiGQ7xoExSNCuODDsfKesaq5gXksbwEIvDdAM3FUWDT
	 eTGdWWlD/xPPuFRMG8pblYybEpVgiqli1IIxra2c=
Date: Sat, 4 Feb 2023 08:55:09 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vt6655: Add braces to macro parameter 'iobase'
Message-ID: <Y94PXceerdFTBg5e@kroah.com>
References: <Y93WEZGlT5Vmeb50@combine-ThinkPad-S1-Yoga>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y93WEZGlT5Vmeb50@combine-ThinkPad-S1-Yoga>

On Sat, Feb 04, 2023 at 04:50:41AM +0100, Guru Mehar Rachaputi wrote:
> This patch is to fix checkpatch warning: "Macro argument 'iobase' may be better
> as '(iobase)' to avoid precedence issues.
> 
> Signed-off-by: Guru Mehar Rachaputi <gurumeharrachaputi@gmail.com>
> ---
>  drivers/staging/vt6655/mac.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
> index acf931c3f5fd..a33af2852227 100644
> --- a/drivers/staging/vt6655/mac.h
> +++ b/drivers/staging/vt6655/mac.h
> @@ -537,9 +537,9 @@
>  
>  /*---------------------  Export Macros ------------------------------*/
>  
> -#define VT6655_MAC_SELECT_PAGE0(iobase) iowrite8(0, iobase + MAC_REG_PAGE1SEL)
> +#define VT6655_MAC_SELECT_PAGE0(iobase) iowrite8(0, (iobase) + MAC_REG_PAGE1SEL)

This change really doesn't make much sense, right?  How about turning
these into an inline function instead?  That would be the correct thing
to do overall, right?

thanks,

greg k-h
