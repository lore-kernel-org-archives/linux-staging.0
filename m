Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662153BFE4B;
	Mon,  9 Mar 2026 16:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773072723; cv=none; b=kS3AuLxEMI27VbHolLJXGsJa0aPH9ok4GKiXv4aHCJExnk50EvoObI93Y0pdJSS7aZbGs5Gxr8rDC7veKHF7WP0w5NrxBFTiXxDKjpcIg7EmSnXlcYLL33NTCPGNVx1uJ5pOC/j61dOoFl2mnZFg2cKnjopzKybsHkGzYeg+UZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773072723; c=relaxed/simple;
	bh=e9P97RjR8BNZVkfIkYSbQB467U3nbF1dILrMhlrr3GM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uOTJJZEdhNHlEY50vYoSQ0pcgDrMWezeevb2inlLDptJCyBrZb/OFYvi6EyKRKBr3DOmcEg54Yy7pmpc5WF8ZHugv2h43SFh1H6vtqIKr4Yp3HZ0nZOs02cLMUUMafkALuVuHQoWtIkcjY8fWCKOXdymUbIpj366mamd/O9iW7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SYEMUxeD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SYEMUxeD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C25C2BCAF;
	Mon,  9 Mar 2026 16:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773072722;
	bh=e9P97RjR8BNZVkfIkYSbQB467U3nbF1dILrMhlrr3GM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SYEMUxeD4Mcr4Qt5m700K3zgpvMzYbdBRinDeEkJhzpsavEA+JE0sb8KWvCyIBUuI
	 j0sjrp9WhJG8rZVwO/uQ9AfL9FleBcf9X+nSDrHWP0vXn1Kxbg93TCr3FOk2KpaPAq
	 Yooo9LOG7Dt9IZ47RK7QHAgfluTI+ceTfkgOD2Mg=
Date: Mon, 9 Mar 2026 17:12:00 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Bera =?iso-8859-1?B?Wfx6bPw=?= <b9788213@gmail.com>
Cc: straube.linux@gmail.com, Yeking@red54.com, hansg@kernel.org,
	andriy.shevchenko@linux.intel.com, ethantidmore06@gmail.com,
	weibu@redadmin.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: change custom comparing function to
 memcmp()
Message-ID: <2026030932-caretaker-reemerge-5b71@gregkh>
References: <20260227200637.47130-1-b9788213@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260227200637.47130-1-b9788213@gmail.com>

On Fri, Feb 27, 2026 at 11:06:37PM +0300, Bera Yüzlü wrote:
> eqNByte() function is a redundant reimplementation of memcmp().
> Remove eqNByte() and switch its usages to memcmp().
> No functional change.
> 
> Signed-off-by: Bera Yüzlü <b9788213@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/hal_com.c       | 12 ------------
>  .../staging/rtl8723bs/hal/hal_com_phycfg.c    | 19 ++++++++++---------
>  drivers/staging/rtl8723bs/include/hal_com.h   |  2 --
>  3 files changed, 10 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
> index 31b3e880ae6a..a7720f821823 100644
> --- a/drivers/staging/rtl8723bs/hal/hal_com.c
> +++ b/drivers/staging/rtl8723bs/hal/hal_com.c
> @@ -750,18 +750,6 @@ void SetHalODMVar(
>  }
>  
>  
> -bool eqNByte(u8 *str1, u8 *str2, u32 num)
> -{
> -	if (num == 0)
> -		return false;
> -	while (num > 0) {
> -		num--;
> -		if (str1[num] != str2[num])
> -			return false;
> -	}
> -	return true;
> -}
> -
>  bool GetU1ByteIntegerFromStringInDecimal(char *Str, u8 *pInt)
>  {
>  	u16 i = 0;
> diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
> index dc2da49e6738..b5ba3eba597b 100644
> --- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
> +++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
> @@ -8,6 +8,7 @@
>  #include <drv_types.h>
>  #include <hal_data.h>
>  #include <linux/kernel.h>
> +#include <linux/string.h>
>  
>  u8 PHY_GetTxPowerByRateBase(struct adapter *Adapter, u8 RfPath,
>  			    enum rate_section RateSection)
> @@ -819,27 +820,27 @@ void PHY_SetTxPowerLimit(
>  
>  	powerLimit = powerLimit > MAX_POWER_INDEX ? MAX_POWER_INDEX : powerLimit;
>  
> -	if (eqNByte(Regulation, (u8 *)("FCC"), 3))
> +	if (memcmp(Regulation, "FCC", 3) == 0)
>  		regulation = 0;

This should all be calls to strcmp() instead, right?  These are strings,
please treat them as such.

thanks,

greg k-h
