Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD7E2C82
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 13:41:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B07C360462;
	Sun, 17 Oct 2021 13:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1634478093;
	bh=XSF3t2/FRwE0noUF0lBUj1BR17pTGpHeG1T2Wt392AM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NZat772RvJvcwiXJt3FVvxbbeynTvqoGjRdLZFlG6brE6AUbkwb4ZDMy99O8Pu8Y8
	 y07LoaMe/dTnRLHny0tuvL5pR9J2CkN+wH0Jlg4Oov8Gh9N11720NLrKCoVRhVM06B
	 q9zTFTAO8U6Vxyja7ZvaFDpyRVUh0/MK+icyapLE=
Date: Sun, 17 Oct 2021 15:41:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sebastian Luchetti <luchetti.linux@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rts5208: ms.c: Remove two udelay calls and use
 usleep_range instead
Message-ID: <YWwoCuBIBc/xTPIu@kroah.com>
References: <YWwWoB3+4HQTD4/t@Mononoke>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YWwWoB3+4HQTD4/t@Mononoke>

On Sun, Oct 17, 2021 at 02:27:12PM +0200, Sebastian Luchetti wrote:
> This patch fixes the issue:
> CHECK: usleep_range is preferred over udelay; see
> Documentation/timers/timers-howto.txt
> in two occurrences.
> 
> Signed-off-by: Sebastian Luchetti <luchetti.linux@gmail.com>
> ---
>  drivers/staging/rts5208/ms.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rts5208/ms.c b/drivers/staging/rts5208/ms.c
> index 2a6fab5c117a..7292c8f013fd 100644
> --- a/drivers/staging/rts5208/ms.c
> +++ b/drivers/staging/rts5208/ms.c
> @@ -3236,7 +3236,7 @@ static int ms_write_multiple_pages(struct rtsx_chip *chip, u16 old_blk,
>  			return STATUS_FAIL;
>  		}
>  
> -		udelay(30);
> +		usleep_range(27, 32);

These are very odd choices of a number, where did they come from?

And as the other thread on this mailing list a few hours ago describes,
for this same type of change, you need to test this with the actual
hardware to know if this works properly or not.  Have you done so?

thanks,

greg k-h
