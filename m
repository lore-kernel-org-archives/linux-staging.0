Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B2D2F80
	for <linux-staging@lists.linux.dev>; Thu, 30 Sep 2021 06:00:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D0A6261265;
	Thu, 30 Sep 2021 06:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1632981606;
	bh=+9Cimias7j0INGICFeEb++U9FTUPDMbOhsM3g32/A/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FJ9v3kPBgadWq9TqyDSkBB+ZjCCPeEb68cegwt58vk1kS1yM5e1cWDPYnwdpXz2Cv
	 hAKlC9vcnNclW3U+9HxmV1aUWWR+JTuIuDnK9Rxanfkl55bGXaFDXvyYWTPXlXtKts
	 dpVzVAdvmFM3U1qB5YQ8EQXj7BsZyEXZ8RjlCM9o=
Date: Thu, 30 Sep 2021 08:00:01 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dawid Esterhuizen <desterhuizen@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8712: Statements should start on a tabstop
Message-ID: <YVVSYVpUPekkUsLy@kroah.com>
References: <YVTN5i8qwjlGwOPp@kkobus.whirley.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YVTN5i8qwjlGwOPp@kkobus.whirley.local>

On Wed, Sep 29, 2021 at 10:34:46PM +0200, Dawid Esterhuizen wrote:
> This path fixes four checkpatch.pl warnings:
> 
> Statements should start on a tabstop
> 
> Signed-off-by: Dawid Esterhuizen <desterhuizen@gmail.com>
> ---
>  drivers/staging/rtl8712/rtl871x_xmit.h | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8712/rtl871x_xmit.h b/drivers/staging/rtl8712/rtl871x_xmit.h
> index 2e6afc7bb0a1..bc1287cc853e 100644
> --- a/drivers/staging/rtl8712/rtl871x_xmit.h
> +++ b/drivers/staging/rtl8712/rtl871x_xmit.h
> @@ -182,11 +182,11 @@ struct sta_xmit_priv {
>  };
>  
>  struct	hw_txqueue {
> -	/*volatile*/ sint	head;
> -	/*volatile*/ sint	tail;
> -	/*volatile*/ sint	free_sz;	/*in units of 64 bytes*/
> -	/*volatile*/ sint      free_cmdsz;
> -	/*volatile*/ sint	 txsz[8];
> +  /*volatile*/ sint head;
> +  /*volatile*/ sint tail;
> +  /*volatile*/ sint free_sz;	/*in units of 64 bytes*/
> +  /*volatile*/ sint free_cmdsz;
> +  /*volatile*/ sint txsz[8];

I think you now have added a new checkpatch warning, right?

This is not the correct indentation anymore, why not work to see if you
can remove the volatile comment instead?

thanks,

greg k-h
