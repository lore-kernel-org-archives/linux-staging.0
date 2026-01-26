Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC59230D0F;
	Mon, 26 Jan 2026 14:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769437955; cv=none; b=TfEzNI6UcVe25CpNdl/2FGBqwnDBTzzhzwK8qTmADKIHpn2xsnnj/Yd6chKg6NAYzGYHxaIALdZ9BmX8OAH6IhLdLoQz6sSVGUPM7lg8PWu6UQxWQkly8FCDg0cW4fF34HuLfnnm9+TopJ5y1poBfuhzQXxSqVGw6JAevcqlJZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769437955; c=relaxed/simple;
	bh=0jXx9kvBL9LUfqDto1wC2WcHOPUqvZsriF24HGQ+c/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3JNVxc2KEYk6PRaVM/cSXxLWjObkTIuRUQVyqOScjFasYCn63cjSbIE9Y3TaROpa4SLqujVLufACnR8AmVOO9FfX1M1+awviS1Y/tg+LctCceC8JnDqpeLjgououcTjNhh/IM/f+y03bgZC2hsOSy1JvZOAqZkRjnVHah67yR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=I6lAjT2b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="I6lAjT2b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C454AC116C6;
	Mon, 26 Jan 2026 14:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769437955;
	bh=0jXx9kvBL9LUfqDto1wC2WcHOPUqvZsriF24HGQ+c/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I6lAjT2bUD449XXtgEePsQu51O09RJimyKLzmdPTo62NEoXd53OfSwXO7EeWMK9ag
	 3JEz6Ebkd3XzWX/jis0iqbNqdD286m24W9mbyBaVFR1s2vZ36vaGfMS+HKDne3+COq
	 JN5rYd4BoMRvsZt/WCH0l6beiGKSZJfovsRXgAq8=
Date: Mon, 26 Jan 2026 15:32:31 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Akiyoshi Kurita <weibu@redadmin.org>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v1] staging: rtl8723bs: rename members of struct
 registry_priv
Message-ID: <2026012647-overheat-elm-aecc@gregkh>
References: <20260126141543.2527-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126141543.2527-1-ethantidmore06@gmail.com>

On Mon, Jan 26, 2026 at 08:15:43AM -0600, Ethan Tidmore wrote:
> Rename CamelCase members of struct registry_priv to snake_case to
> comply with the Linux kernel coding style.

Close, but:

> +	u8 b_en_rfe;

What does the "b_" here mean?  The original variable name had it, but
that was because it was attempting to do a "hungarian notation" type of
name, which is not the correct way to name Linux kernel variables,
sorry.

Also:
> --- a/drivers/staging/rtl8723bs/include/hal_com_phycfg.h
> +++ b/drivers/staging/rtl8723bs/include/hal_com_phycfg.h
> @@ -90,7 +90,7 @@ void PHY_TxPowerByRateConfiguration(struct adapter *padapter);
>  u8 PHY_GetTxPowerIndexBase(struct adapter *padapter, u8 RFPath, u8 Rate,
>  			   enum channel_width BandWidth, u8 Channel);
>  
> -s8 phy_get_tx_pwr_lmt(struct adapter *adapter, u32 RegPwrTblSel,
> +s8 phy_get_tx_pwr_lmt(struct adapter *adapter, u32 reg_pwr_tbl_sel,

That was not a change needed do to the structure name changes.  Please
only do one logical change per patch.  Maybe one per variable name
change to make it more obvious and easy to review?

thanks,

greg k-h
