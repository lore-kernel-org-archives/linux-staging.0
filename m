Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEC92FB0
	for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 17:58:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 87DBB60FD7;
	Tue, 17 Aug 2021 17:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1629223081;
	bh=FXkhtOsU1DhgucCkfqBGz2M/mv9RZyXJ4JNhnZSuQF8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KgV/UCrxSe0y4S7duXpl7GS6AvasTEmtA0zGqfV7G7QK+z28kOFa6Aodon+7b1nS3
	 cwV1pOfMIQ32MmtUpnKKdYktV3BmW5baYaBWC1yhCmGuyOcmSOp6kuEh+fFAf9oGhb
	 0Nbetaza/mO6Y8ieEFpDCMXmxbNlEyMwqub92u80=
Date: Tue, 17 Aug 2021 19:57:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michael Straube <straube.linux@gmail.com>
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk, martin@kaiser.cx,
	fmdefrancesco@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>
Subject: Re: [PATCH] staging: r8188eu: refactor
 rtw_is_cckrates{only}_included()
Message-ID: <YRv4po3sLcH9VLuo@kroah.com>
References: <20210816193125.15700-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210816193125.15700-1-straube.linux@gmail.com>

On Mon, Aug 16, 2021 at 09:31:25PM +0200, Michael Straube wrote:
> Refactor functions rtw_is_cckrates_included() and
> rtw_is_cckratesonly_included(). Add new helper function rtw_is_cckrate()
> that allows to make the code more compact. Improves readability and
> slightly reduces object file size. Change the return type to bool to
> reflect that the functions return boolean values.
> 
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_ieee80211.c | 27 +++++++++++---------
>  drivers/staging/r8188eu/include/ieee80211.h  |  5 ++--
>  2 files changed, 17 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
> index 0c7231cefdda..892ffcd92cc7 100644
> --- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
> +++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
> @@ -68,28 +68,31 @@ int rtw_get_bit_value_from_ieee_value(u8 val)
>  	return 0;
>  }
>  
> -uint	rtw_is_cckrates_included(u8 *rate)
> +static bool rtw_is_cckrate(u8 rate)
>  {
> -	u32	i = 0;
> +	rate &= 0x7f;
> +	return rate == 2 || rate == 4 || rate == 11 || rate == 22;
> +}
> +
> +bool rtw_is_cckrates_included(u8 *rate)
> +{
> +	u8 r;
>  
> -	while (rate[i] != 0) {
> -		if  ((((rate[i]) & 0x7f) == 2) || (((rate[i]) & 0x7f) == 4) ||
> -		     (((rate[i]) & 0x7f) == 11)  || (((rate[i]) & 0x7f) == 22))
> +	while ((r = *rate++)) {
> +		if (rtw_is_cckrate(r))
>  			return true;
> -		i++;
>  	}
> +
>  	return false;
>  }
>  
> -uint	rtw_is_cckratesonly_included(u8 *rate)
> +bool rtw_is_cckratesonly_included(u8 *rate)
>  {
> -	u32 i = 0;
> +	u8 r;
>  
> -	while (rate[i] != 0) {
> -		if  ((((rate[i]) & 0x7f) != 2) && (((rate[i]) & 0x7f) != 4) &&
> -		     (((rate[i]) & 0x7f) != 11)  && (((rate[i]) & 0x7f) != 22))
> +	while ((r = *rate++)) {

Ick, no.

While it might be fun to play with pointers like this, trying to
determine the precidence issues involved with reading from, and then
incrementing the pointer like this is crazy.

The original was obvious as to how it was walking through the array.
Keep that here.

Remember, we write code for humans first, compliers second.

thanks,

greg k-h
