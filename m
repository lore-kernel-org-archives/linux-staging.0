Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DA046B8;
	Tue, 18 Oct 2022 17:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70173C433D6;
	Tue, 18 Oct 2022 17:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666112789;
	bh=Zhb/lj2rt5yGFgf8T/KJ6b2c8PnX/hhuM/ohylSM4Nc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H8GEnlVD56mgi40ebmUuPhLjNXC5y9Vt0AHRbRdo2RHMTYuzVbLzf9QG21neMmN0E
	 bm/0/0ggPxyUdUiUG7CbDH+CF029eKepjZZwPTk7GQFjC51+TXlPZmfXkUEfKS6clA
	 HIb8hBzKqeeFPgsxOt2PrZ/04FVBRiWg+bBxrOiQ=
Date: Tue, 18 Oct 2022 19:06:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v2] staging: rts5208: Replace instances of udelay by
 usleep_range
Message-ID: <Y07dExeWY5lXgKLr@kroah.com>
References: <Y07OcqPNjSihOByt@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y07OcqPNjSihOByt@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>

On Tue, Oct 18, 2022 at 04:04:02PM +0000, Tanjuate Brunostar wrote:
> Replace the use of udelay by usleep_range as suggested by checkpatch:
> 
> CHECK: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.rst
> +               udelay(30);
> 
> CHECK: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.rst
> +               udelay(50);
> 
> Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> ---
> 
> v2: changed the max values of the usleep_rage instances as they cannot
> be equal to the min values as suggested by checkpatch
> 
>  drivers/staging/rts5208/ms.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rts5208/ms.c b/drivers/staging/rts5208/ms.c
> index 14449f8afad5..a9724ca5eccf 100644
> --- a/drivers/staging/rts5208/ms.c
> +++ b/drivers/staging/rts5208/ms.c
> @@ -3235,7 +3235,7 @@ static int ms_write_multiple_pages(struct rtsx_chip *chip, u16 old_blk,
>  			return STATUS_FAIL;
>  		}
>  
> -		udelay(30);
> +		usleep_range(30, 31);

Did you test this?  And making the range 1 really doesn't make any
sense, right?

thanks,

greg k-h
