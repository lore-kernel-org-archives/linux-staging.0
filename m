Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FF03E8C59
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 05:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772171922; cv=none; b=selx3ZQ4XAT1OWxwt7o4VIaQeDQRKJUws4Tb/HpZH/obwUcr8ieZI9eVt7Btz2ptDSDEcMf4LYB0b8AOiE9pkwjJZzI2ust28Smr6xOUcKY/VojInCJgFl8ezcqcBgMKvh9JHjH8kd3SZAB1PV7ogwFI5U6WMjeTUZ+LBhXiaqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772171922; c=relaxed/simple;
	bh=KSqqplUc/JsQtTjTe669QTt0F4HevSz7d+bP0+KPLEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=okAjvDrGeLFdh4QvPjne6rVcfSZQt6EWxwQjZwvepL/Hcab8St4zNe6b8GkY8wM5gPCVKnorbBQgic8pL5hcn14NJr0q39CZCzUbqb8zKVidbZ4HemBHRABVVRHPu63I0kY/QgbXHZTR3mkbEWFAVWg4VY0aOtrtUy/VNNH7EYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FyElxLW6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FyElxLW6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF2BAC19421;
	Fri, 27 Feb 2026 05:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772171922;
	bh=KSqqplUc/JsQtTjTe669QTt0F4HevSz7d+bP0+KPLEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FyElxLW68GnPhbZPelBRfjX/UP80F9AlVW++SRenr386j0YGk2d3sA3YD3JtWnMeL
	 TKH6sP/twA0Bghj+LyumukVjSJp9aVZDhLoSYa9u6dMc87aupafhVLG4EK1Ro6I57q
	 JcP90bEBysnfEtWO5bGSsn03wmefAS25FhvRxii8=
Date: Thu, 26 Feb 2026 21:58:33 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH 11/12] staging: rtl8723bs: remove unnecessary casts in
 rtl8723b_hal_init.c
Message-ID: <2026022618-unmoving-unpicked-b7d4@gregkh>
References: <20260226100255.167059-13-giorgitchankvetadze1997@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226100255.167059-13-giorgitchankvetadze1997@gmail.com>

On Thu, Feb 26, 2026 at 02:02:55PM +0400, Giorgi Tchankvetadze wrote:
> Remove unnecessary pointer casts in memset(), memcpy(), and memcmp()
> calls. These functions accept void * arguments, so explicit casts
> are not needed.
> 
> No functional change. Object code verified identical before and after.
> 
> Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> index 8d259820f103..bc10f4aecda5 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> @@ -1185,12 +1185,14 @@ void Hal_InitPGData(struct adapter *padapter, u8 *PROMContent)
>  		if (!pEEPROM->EepromOrEfuse) {
>  			/*  Read EFUSE real map to shadow. */
>  			EFUSE_ShadowMapUpdate(padapter, EFUSE_WIFI);
> -			memcpy((void *)PROMContent, (void *)pEEPROM->efuse_eeprom_data, HWSET_MAX_SIZE_8723B);
> +			memcpy(PROMContent, pEEPROM->efuse_eeprom_data,
> +			       HWSET_MAX_SIZE_8723B);

You wrapped the line which is not what the changelog said you were doing
:(
