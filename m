Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FF27A
	for <linux-staging@lists.linux.dev>; Fri, 25 Feb 2022 09:01:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92021C340F1;
	Fri, 25 Feb 2022 09:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1645779668;
	bh=vrv1RPmPuA5wxi40zAhhHwbfUznT5MJ6l1l1typKQu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zOEUJEUmPDu7A1MsA3kCOzeMMpoOVwnsRMt7OxAqs8lhU/bnIbSYoR9hSmHBTn3L1
	 FEI395tCBA7NTkcOi4YMSneGRckQ3fgD/DWaI2khsDIxM1C68hOtVmlDPm1txyBw7r
	 ENCyyMUifSPGoO4e6CPRbRI1fodhXzfynHqxxpQk=
Date: Fri, 25 Feb 2022 10:01:05 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Samuel =?iso-8859-1?Q?Sj=F6berg?= <info@samuelsjoberg.se>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] staging: rts5208: fix Lines should not end with a '('.
Message-ID: <Yhia0QoJTT9IB2UW@kroah.com>
References: <20220221214344.5895-1-info@samuelsjoberg.se>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220221214344.5895-1-info@samuelsjoberg.se>

On Mon, Feb 21, 2022 at 10:43:44PM +0100, Samuel Sjöberg wrote:
> Fix the following error reported by checkpatch.pl:
> 
> CHECK: Lines should not end with a '('
> +                                       retval = ms_transfer_tpc(
> 
> Signed-off-by: Samuel Sjöberg <info@samuelsjoberg.se>
> ---
> Changes in v2:
>   - Fixed subject line and commit message.
> 
>  drivers/staging/rts5208/ms.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rts5208/ms.c b/drivers/staging/rts5208/ms.c
> index 2a6fab5c117a..14449f8afad5 100644
> --- a/drivers/staging/rts5208/ms.c
> +++ b/drivers/staging/rts5208/ms.c
> @@ -1749,11 +1749,10 @@ static int ms_copy_page(struct rtsx_chip *chip, u16 old_blk, u16 new_blk,
>  
>  				for (rty_cnt = 0; rty_cnt < MS_MAX_RETRY_COUNT;
>  				     rty_cnt++) {
> -					retval = ms_transfer_tpc(
> -						chip,
> -						MS_TM_NORMAL_WRITE,
> -						WRITE_PAGE_DATA,
> -						0, NO_WAIT_INT);
> +					retval = ms_transfer_tpc(chip,
> +								 MS_TM_NORMAL_WRITE,
> +								 WRITE_PAGE_DATA,
> +								 0, NO_WAIT_INT);
>  					if (retval == STATUS_SUCCESS)
>  						break;
>  				}
> -- 
> 2.35.1
> 

This change never ended up on the mailing list for some reason :(

Please fix up and resend.

thanks,

greg k-h
