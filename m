Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003FB7B;
	Fri, 28 Oct 2022 06:07:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551F8C433D6;
	Fri, 28 Oct 2022 06:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666937275;
	bh=8GlBl/rE3PNGNLsO5yRSu8lq7b+oiLgB9BYbdsHZcr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LF1TZZEK52VICO7LECT4i97YjgMFwaHnR+wkjMFMEqoxlCnG/w2xbrH4y3ODL64ih
	 9zHWxwRnF10YXQMeTEHlgPTUB1F82JrLGdQnkyYs3lfBaBupnNnozU1RaBRVWj9BvK
	 1ZHx+QHBZ+WWuE8ZxW5nccmhjdaU7n4KKEzFvkw8=
Date: Fri, 28 Oct 2022 08:08:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: UMWARI JOVIAL <umwarijovial@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH] WARNING: Possible repeated word: 'very'
Message-ID: <Y1tx8XjmR5QKV9lQ@kroah.com>
References: <20221028051420.GA30073@rdm>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221028051420.GA30073@rdm>

On Fri, Oct 28, 2022 at 08:14:20AM +0300, UMWARI JOVIAL wrote:
> i used checkpatch.pl script to identify the above
> Repetition of the same word in one sentence same line

Please read the documentation for how to write a good changelog text.
Hint, "i" is not something you see in a text, right?

Also, why do you have WARNING in the subject line and not the driver
name?  Again, read the documentation please.

> 
> Signed-off-by: UMWARI JOVIAL <umwarijovial@gmail.com>
> ---
>  drivers/staging/rtl8712/rtl871x_xmit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8712/rtl871x_xmit.c b/drivers/staging/rtl8712/rtl871x_xmit.c
> index 090345bad223..30a0276b8b58 100644
> --- a/drivers/staging/rtl8712/rtl871x_xmit.c
> +++ b/drivers/staging/rtl8712/rtl871x_xmit.c
> @@ -766,7 +766,7 @@ void r8712_free_xmitbuf(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf)
>   * If we turn on USE_RXTHREAD, then, no need for critical section.
>   * Otherwise, we must use _enter/_exit critical to protect free_xmit_queue...
>   *
> - * Must be very very cautious...
> + * Must be very cautious...

The original text here is correct.

thanks,

greg k-h
