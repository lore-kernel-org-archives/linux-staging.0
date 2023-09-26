Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7AE539E
	for <linux-staging@lists.linux.dev>; Tue, 26 Sep 2023 09:09:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1E8AC433C7;
	Tue, 26 Sep 2023 09:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1695719344;
	bh=EQ3gw+CGyonVOw7q786V0KhKp+/HJVjFTRG5l5JaYvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iFUmShKbYw2TTaK8PyHkqDC57kWl3Df9SASr7IonCUhrk+Ap7zW38RMkv85o8lWMX
	 hxCTPDgAOaV7li130deJz5njt5VOIiilGEsxbTaSmcXvrwvQk7zKsYZp9BInQMUjmx
	 grzOYrqYU2cTBU5V+RJezvUaqrw/Cp3iWBn4ZlL4=
Date: Tue, 26 Sep 2023 11:09:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Gary Rookard <garyrookard@fastmail.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] rtl8192e: renamed (1) mixed case variable
Message-ID: <2023092617-skydiver-unsworn-18f8@gregkh>
References: <20230925151157.3893-1-garyrookard@fastmail.org>
 <20230925151157.3893-2-garyrookard@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925151157.3893-2-garyrookard@fastmail.org>

On Mon, Sep 25, 2023 at 11:11:55AM -0400, Gary Rookard wrote:
> Renamed (1) prototype variable that was written in mixed case.
> HTUpdateDefaultSetting -> ht_update_default_setting
> 
> Linux kernel coding style "cleanup".
> No change in runtime logic.
> 
> Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
> ---
>  drivers/staging/rtl8192e/rtllib.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
> index 5517b9df65be..1a3dd4dcad81 100644
> --- a/drivers/staging/rtl8192e/rtllib.h
> +++ b/drivers/staging/rtl8192e/rtllib.h
> @@ -1807,7 +1807,7 @@ int rtllib_wx_get_rts(struct rtllib_device *ieee, struct iw_request_info *info,
>  void HTSetConnectBwMode(struct rtllib_device *ieee,
>  			enum ht_channel_width bandwidth,
>  			enum ht_extchnl_offset Offset);
> -void HTUpdateDefaultSetting(struct rtllib_device *ieee);
> +void ht_update_default_setting(struct rtllib_device *ieee);
>  void HTConstructCapabilityElement(struct rtllib_device *ieee,
>  				  u8 *posHTCap, u8 *len,
>  				  u8 isEncrypt, bool bAssoc);
> -- 
> 2.41.0
> 
> 

You just broke the build?

Also, you sent 3 patches that do different things, yet have identical
subject lines, that's obviously not correct.

Please fix up and resend a v2 series.

thanks,

greg k-h
