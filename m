Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769742907
	for <linux-staging@lists.linux.dev>; Sun,  1 May 2022 16:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F682C385AA;
	Sun,  1 May 2022 16:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1651423854;
	bh=UuPQPRcvBuddGzSocSImJOFLMKh6Eo2G60SPZFrwkNA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dvrw/CiftCprwtwgCxWY+XOi4xKcPdJFYVHYV8AB4qxzZoX8CWDIgCdjNrx3Ej6gK
	 0LMAPMl8v4kZEkcFHERHruK22hk7XPo+o8cw5h73mPI/aIrATsn10DbKDYVU/hTRxM
	 VA3TcwIMo+LHzj+YiW5TXqUelL/BwF7XceTxX1hc=
Date: Sun, 1 May 2022 18:50:15 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: vt6655: Rename function CARDbGetCurrentTSF
Message-ID: <Ym66R9hpFgRikNx7@kroah.com>
References: <cover.1651422181.git.philipp.g.hortmann@gmail.com>
 <1f38006d7eb18426a2336b7666d385021bf81faf.1651422181.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f38006d7eb18426a2336b7666d385021bf81faf.1651422181.git.philipp.g.hortmann@gmail.com>

On Sun, May 01, 2022 at 06:37:05PM +0200, Philipp Hortmann wrote:
> The name of the function uses CamelCase which
> is not accepted by checkpatch.pl
> 
> Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
> ---
>  drivers/staging/vt6655/card.c        | 10 +++++-----
>  drivers/staging/vt6655/card.h        |  2 +-
>  drivers/staging/vt6655/device_main.c |  2 +-
>  3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
> index ec6fd185d3fd..d1dfd96e13b7 100644
> --- a/drivers/staging/vt6655/card.c
> +++ b/drivers/staging/vt6655/card.c
> @@ -11,7 +11,7 @@
>   *      CARDbAddBasicRate - Add to BasicRateSet
>   *      CARDbIsOFDMinBasicRate - Check if any OFDM rate is in BasicRateSet
>   *      CARDqGetTSFOffset - Calculate TSFOffset
> - *      CARDbGetCurrentTSF - Read Current NIC TSF counter
> + *      card_get_current_tsf - Read Current NIC TSF counter
>   *      CARDqGetNextTBTT - Calculate Next Beacon TSF counter
>   *      CARDvSetFirstNextTBTT - Set NIC Beacon time
>   *      CARDvUpdateNextTBTT - Sync. NIC Beacon time
> @@ -288,7 +288,7 @@ bool CARDbUpdateTSF(struct vnt_private *priv, unsigned char byRxRate,
>  	u64 local_tsf;
>  	u64 qwTSFOffset = 0;
>  
> -	CARDbGetCurrentTSF(priv, &local_tsf);
> +	card_get_current_tsf(priv, &local_tsf);

Why is the value being passed as a reference and the error value (if
any), is not checked at all?

Shouldn't this just return the value as it obviously must always work?
(retorical question, something is wrong here...)

And this is a horrible global function name, can you prefix it with the
driver name to give us a chance to keep the global namespace sane?
vt6655_get_current_tsf() would be better.

thanks,

greg k-h
