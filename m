Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B348173
	for <linux-staging@lists.linux.dev>; Tue, 28 Dec 2021 13:05:25 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 8D1DC3200904;
	Tue, 28 Dec 2021 08:05:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 28 Dec 2021 08:05:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=fm2; bh=LgvjAfc+b2l248WyB/HBBBCF00E
	oiQ69EgT/Ly4tEOA=; b=AFGonbwEmdFO0kKPYpWq3ZuSBnsG0XK1L2bGHK43nN4
	eB+nsD2/8j+p4iDiobZAFAbVFB7TptX2BZgnj2YaMUyvtxFXuTf8PCNtawm9YltW
	X4zhrg3SbUE81TQasveopYu7Qc8lnWLZW5hxiQZZU5hfYcLz6tjxO2yJdou4ArlU
	r/VnDhb48Gq42G2JOT5Bg86zud8evzw95CD3ZxhQOt1Rw9v3Q4/MbktsNDAd9emK
	ZhGmYq39027FR7UU7H8auCmH+XLXzDKK5JOo0KtB9e5JAL09pFuoEdENGCVgepJ9
	Z9w1UxZkJy7fQLdCs1holBZiT8uQz6ykfC5RHXwqYkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=LgvjAf
	c+b2l248WyB/HBBBCF00EoiQ69EgT/Ly4tEOA=; b=BY59p57asrO0pu16lAF3F1
	G70AyH4FoRy9DgKYT/tqepb2EHNB9KrYkuVNOyQWNbZkrsnbceM7VK+VGVNByvU7
	gH4QPtMuFD9mjFM6dO9eHJuLRkHOwdX98WearBBjwzY7sMQzsNwuoHAhQxZ+J2iG
	EhNhQL0OeBJJYbD2oMXRCtRWoQfaAbB4aCfdQoSaqXpBzLPAah92LI8pPN9XM69q
	386+1266+AFU+zxLxsQKpHByZvaLEpm9NrlZVKY+LGGu7P9FatQyw2Sz5UuVW4zk
	2xm6g4J0g651WV/k38pqxC/gRibrPuN+NFCal8LlCdrGL9TTBFuOSA8pfWPrcqNw
	==
X-ME-Sender: <xms:kwvLYXkKL7qGlAATmpEnoKczGvN5H7qj3YG7zIgotru9UUf878zxKA>
    <xme:kwvLYa1H8mb816HkYMnhFqRiQanRks6DK6GkVhWayh6WQwGef534oG7Oc8NHUKSoh
    jfSNR_vYpwY0Q>
X-ME-Received: <xmr:kwvLYdpKapLW2BNHtIbYSszOxwQoid4Axpl6As29rXT9QkbzR3OpYir8EaorlBvZ5aPr1jm_KmbysevNldNUEZop9i1nHymf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudduledggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
    dttddtvdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheq
    necuggftrfgrthhtvghrnhepveeuheejgfffgfeivddukedvkedtleelleeghfeljeeiue
    eggeevueduudekvdetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:kwvLYfkmXSj8fZRKqWgt6mmgaw506HaSZQpsdskTJoGwxm0lAyO8tg>
    <xmx:kwvLYV0SffhkDskFMVEMdq7wJxW0YF1g6k2NKtbkS3N4HAAGvLxNmw>
    <xmx:kwvLYev7YkB1TJKo9ey4NaNumVeIJxTNERACvumhaWrfxKuq77xa_A>
    <xmx:lAvLYTAuw93rAZxzvmLbO1YPXvJMD0-rBchHYQJtDTg4n7DTQLCFvQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Dec 2021 08:05:23 -0500 (EST)
Date: Tue, 28 Dec 2021 14:05:21 +0100
From: Greg KH <greg@kroah.com>
To: Adam Kandur <sys.arch.adam@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] qlge: refactor qlge_change_rx_buffers() in qlge_main.c
Message-ID: <YcsLkb8iDGDcmO8f@kroah.com>
References: <CAE28pkP48Or4LhmuBd2CMamL3yZ1_ipjtEFWqXjuUunNU9bTSQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE28pkP48Or4LhmuBd2CMamL3yZ1_ipjtEFWqXjuUunNU9bTSQ@mail.gmail.com>

On Tue, Dec 28, 2021 at 03:17:59PM +0300, Adam Kandur wrote:
> Greetings. As I understand, qlge_change_rx_buffers() waits 4 times for
> an outstanding reset to complete. And if it cannot, reports about
> timeout. I assume this can be written using for loop instead of while,
> wich looks nicer for me.
> 
> Signed-off-by: Adam Kandur <sys.arch.adam@gmail.com>
> ---
>  drivers/staging/qlge/qlge_main.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
> index 9873bb2a9ee4..f36e43a85038 100644
> --- a/drivers/staging/qlge/qlge_main.c
> +++ b/drivers/staging/qlge/qlge_main.c
> @@ -4012,19 +4012,16 @@ static int qlge_change_rx_buffers(struct
> qlge_adapter *qdev)
> 
>   /* Wait for an outstanding reset to complete. */
>   if (!test_bit(QL_ADAPTER_UP, &qdev->flags)) {
> - int i = 4;
> -
> - while (--i && !test_bit(QL_ADAPTER_UP, &qdev->flags)) {
> + for (int i = 4; !test_bit(QL_ADAPTER_UP, &qdev->flags); i--) {
> + if (!i) {
> + netif_err(qdev, ifup, qdev->ndev,
> +   "Timed out waiting for adapter UP\n");
> + return -ETIMEDOUT;
> + }
>   netif_err(qdev, ifup, qdev->ndev,
>     "Waiting for adapter UP...\n");
>   ssleep(1);
>   }
> -
> - if (!i) {
> - netif_err(qdev, ifup, qdev->ndev,
> -   "Timed out waiting for adapter UP\n");
> - return -ETIMEDOUT;
> - }
>   }
> 
>   status = qlge_adapter_down(qdev);
> -- 
> 2.34.0
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/email-clients.txt in order to fix this.

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/SubmittingPatches for what needs to be done
  here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
