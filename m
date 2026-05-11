Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0813B0AE5;
	Mon, 11 May 2026 08:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778487075; cv=none; b=DYu9D6U+dRjo0D+gilfUivuzoeScdrppC4xYPre2hveBeoKUl4WMVOeNBfcAklYMfoesM4tbIWNhNdy5oO+rVAyXDSbag5BuM2My1JrYYdnLzS8o6CQNa39/5wpJaA6MQ3v2mg+9UhwVoSWq+c86DDczWqyA3abbDu4JLFix7IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778487075; c=relaxed/simple;
	bh=XY/k4rKG27sdyypn1qIc2aI9q3+xBMhbzEJDC8QJCS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B1t8KBn3y6+pcxlTLVeQiPR3oN6X0rWLGOn3ZCyNwasSc/a13g8WFevBgqyG6hUJbVKRBB4yaiY5ubqUcubJZjirXmkVkiYTqGxsO3Z7z+TAXpaE3lh95qbBIy57PoZz5oH16pHVeJuT6wIG4NgvgypykHomkv5rJTKy7ndF9C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0w8Lyfg7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0w8Lyfg7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66747C2BCB0;
	Mon, 11 May 2026 08:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778487073;
	bh=XY/k4rKG27sdyypn1qIc2aI9q3+xBMhbzEJDC8QJCS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0w8Lyfg7AFdzqEjyyBRP/gb6Q2F3Sceo1Jc3rdopACgmtPIHsbavoPFZhmXFu9pFB
	 eI2sEn2u2d1oKctRWd36ZXJBAD62bSzyL4QsuuNf8ZOZNbA+LQbBiVXDdSpeewMHzn
	 GOREmnJqKdCkmxLGA/HojVyLyNXQgfAYQhMzn6fU=
Date: Mon, 11 May 2026 10:11:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pramod Maurya <pramod.nexgen@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	nikolayof23@gmail.com
Subject: Re: [PATCH v2 2/4] staging: rtl8723bs: Fix comparison style in
 IS_CCK_RATE and IS_OFDM_RATE macros
Message-ID: <2026051131-slicing-backroom-91c7@gregkh>
References: <20260510175207.563378-1-pramod.nexgen@gmail.com>
 <20260510175207.563378-3-pramod.nexgen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260510175207.563378-3-pramod.nexgen@gmail.com>

On Sun, May 10, 2026 at 01:52:05PM -0400, Pramod Maurya wrote:
> Place the variable on the left side of comparisons, wrap macro
> arguments in parentheses to avoid precedence issues, and wrap the
> long macro definitions with a line continuation.
> 
> Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
> ---
>  drivers/staging/rtl8723bs/include/ieee80211.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
> index 7a3609d019aa..11825ace95a9 100644
> --- a/drivers/staging/rtl8723bs/include/ieee80211.h
> +++ b/drivers/staging/rtl8723bs/include/ieee80211.h
> @@ -394,8 +394,10 @@ enum {
>  };
>  
>  #define IS_HT_RATE(_rate)				(_rate >= MGN_MCS0 && _rate <= MGN_MCS31)
> -#define IS_CCK_RATE(_rate)				(MGN_1M == _rate || _rate == MGN_2M || _rate == MGN_5_5M || _rate == MGN_11M)
> -#define IS_OFDM_RATE(_rate)				(MGN_6M <= _rate && _rate <= MGN_54M  && _rate != MGN_11M)
> +#define IS_CCK_RATE(_rate)				\
> +	((_rate) == MGN_1M || (_rate) == MGN_2M || (_rate) == MGN_5_5M || (_rate) == MGN_11M)
> +#define IS_OFDM_RATE(_rate)				\
> +	((_rate) >= MGN_6M && (_rate) <= MGN_54M && (_rate) != MGN_11M)

This is now harder to read, why not just reduce the number of tabs for
all of these #defines?  ANd are you sure the () change is needed?

thanks,

greg k-h
