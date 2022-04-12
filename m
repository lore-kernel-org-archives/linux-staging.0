Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1622F1FBA
	for <linux-staging@lists.linux.dev>; Tue, 12 Apr 2022 13:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65436C385A1;
	Tue, 12 Apr 2022 13:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1649771052;
	bh=X6XotoyowuMHXvt4AIv+L9FrbiAXaSm0YU6Jcdl7Tow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g5t/uoqmEGh7k64siQ/BSapzZauBHrbbv8uDiCTuMWJUPjdWFMiDRGE9tY8FinwPN
	 nnOl6JnKVdTR9zu1cKYJKt86/ihgaNSa3173sqpzmV1f2vF/MB9TXHkEXFGkQKw//h
	 hRiJkvE6WzYxCn4H8xOrixXsGDWkmSDADaTAKjsg=
Date: Tue, 12 Apr 2022 15:44:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/7] staging: vt6655: Replace VNSvInPortB with ioread8
Message-ID: <YlWCKTLemyQose/C@kroah.com>
References: <cover.1649706687.git.philipp.g.hortmann@gmail.com>
 <2f1392d831d005709c859aedf75de7e7ca2269cf.1649706687.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f1392d831d005709c859aedf75de7e7ca2269cf.1649706687.git.philipp.g.hortmann@gmail.com>

On Mon, Apr 11, 2022 at 10:49:20PM +0200, Philipp Hortmann wrote:
> Replace macro VNSvInPortB with ioread8.
> The name of macro and the arguments use CamelCase which
> is not accepted by checkpatch.pl
> 
> Since there are more than one checkpatch issue per line,
> more steps are rquired to fix.
> 
> Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
> ---
> V1 -> V2: This patch was 4/7 and is now 3/6
> V2 -> V3: Changed from rename macro arguments to replace
>           macro VNSvInPortB with ioread8
>           This patch was 3/6 and is now 1/7
> ---
>  drivers/staging/vt6655/baseband.c    |  6 +++---
>  drivers/staging/vt6655/card.c        |  2 +-
>  drivers/staging/vt6655/device_main.c |  4 ++--
>  drivers/staging/vt6655/mac.h         | 26 ++++++++++----------------
>  drivers/staging/vt6655/srom.c        |  6 +++---
>  drivers/staging/vt6655/upc.h         |  3 ---
>  6 files changed, 19 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/baseband.c b/drivers/staging/vt6655/baseband.c
> index dfdb0ebf43b5..decb55e96f02 100644
> --- a/drivers/staging/vt6655/baseband.c
> +++ b/drivers/staging/vt6655/baseband.c
> @@ -1916,13 +1916,13 @@ bool bb_read_embedded(struct vnt_private *priv, unsigned char by_bb_addr,
>  	MACvRegBitsOn(iobase, MAC_REG_BBREGCTL, BBREGCTL_REGR);
>  	/* W_MAX_TIMEOUT is the timeout period */
>  	for (ww = 0; ww < W_MAX_TIMEOUT; ww++) {
> -		VNSvInPortB(iobase + MAC_REG_BBREGCTL, &by_value);
> +		by_value = ioread8(iobase + MAC_REG_BBREGCTL);

This type of change is great, but...

> @@ -597,18 +597,12 @@ do {								\
>  #define MACvReadEtherAddress(iobase, pbyEtherAddr)		\
>  do {								\
>  	VNSvOutPortB(iobase + MAC_REG_PAGE1SEL, 1);		\
> -	VNSvInPortB(iobase + MAC_REG_PAR0,			\
> -		    (unsigned char *)pbyEtherAddr);		\
> -	VNSvInPortB(iobase + MAC_REG_PAR0 + 1,		\
> -		    pbyEtherAddr + 1);				\
> -	VNSvInPortB(iobase + MAC_REG_PAR0 + 2,		\
> -		    pbyEtherAddr + 2);				\
> -	VNSvInPortB(iobase + MAC_REG_PAR0 + 3,		\
> -		    pbyEtherAddr + 3);				\
> -	VNSvInPortB(iobase + MAC_REG_PAR0 + 4,		\
> -		    pbyEtherAddr + 4);				\
> -	VNSvInPortB(iobase + MAC_REG_PAR0 + 5,		\
> -		    pbyEtherAddr + 5);				\
> +	(*((unsigned char *)pbyEtherAddr) = ioread8(iobase + MAC_REG_PAR0));		\

Why cast one and not all?  No casts should be needed.  If so, the caller
is wrong.

> +	(*(pbyEtherAddr + 1) = ioread8(iobase + MAC_REG_PAR0 + 1));	\

That's odd.

Ok, I guess it's an array, right?  How about:
	pbyEtherAddr[0] = ioread8(iobase + MAC_REG_PAR0);	\
	pbyEtherAddr[1] = ioread8(iobase + MAC_REG_PAR0 + 1);	\
and so on?

Much simpler and easier to understand.

And then there's this odd stuff:

>  #define MACvGPIOIn(iobase, pbyValue)					\
> -	VNSvInPortB(iobase + MAC_REG_GPIOCTL1, pbyValue)
> +	*(pbyValue) = ioread8(iobase + MAC_REG_GPIOCTL1)

pbyValue?  unwind this first, you should be able to just have a normal
ioread() call, right?

Or, make it a function.

thanks,

greg k-h
