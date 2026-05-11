Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A1C3B5837;
	Mon, 11 May 2026 08:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486892; cv=none; b=hiuELlelYQF7uEUyW6jMCiMEnY+bqgo7iweo/WEi2s6lYPDp6jPYDbC1/5rKysZIq5rj1Vmld2C52qYn7FSaSD8hhh8ruTfnyc970CkcC3HEceGXvv6FTtf5E3PN8cCP2rhE9odukqWQ6aeYOcnEOf3d3RNVmyRpxMVrbH4Q7hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486892; c=relaxed/simple;
	bh=YvBUtP/gdCKpEKGYJLuLxwXknVlxIQYPqQPlHkzxwHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AA+c2ljKoZlKGScH0QebJYc3yi+VnT3xFSbuULCn4rXzS9s6/chhgm/btFLdJE5mFsO6nQ0HLi83pYyZ6KdALch2lWyZDrxCAbSdA6eJhiY79VlBLLKeZ8UMgpOngl9GP8rxEjn4JOoQLW8QqbHwFA4zW5Ih4DZ7AthsTEjtY58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sZM870Q0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sZM870Q0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F453C2BCB0;
	Mon, 11 May 2026 08:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778486889;
	bh=YvBUtP/gdCKpEKGYJLuLxwXknVlxIQYPqQPlHkzxwHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sZM870Q0jbbAQvIsMphJ9j73zXT9P69UHAQH5Of9gyEhqkgrwVHhS4UD09uDtiLSo
	 z7S3cnIGLtHpiJbCE/cgR8Wu1IkHlPc0AushsYKP1yLXyac61f/07kc9i+U3uU9DXY
	 K9C2rH6Y48NiY2cFGYas/3b6OXkL9kTfNrxujHJc=
Date: Mon, 11 May 2026 10:08:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Salman Alghamdi <me@cipherat.com>
Cc: straube.linux@gmail.com, error27@gmail.com, luka.gejak@linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/7] staging: rtl8723bs: rtw_mlme: add bounds checks
 before ie_length subtraction
Message-ID: <2026051143-armadillo-outline-d8b2@gregkh>
References: <20260508222725.24075-1-me@cipherat.com>
 <20260508222725.24075-2-me@cipherat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508222725.24075-2-me@cipherat.com>

On Sat, May 09, 2026 at 01:26:57AM +0300, Salman Alghamdi wrote:
> Add guards to ensure ie_length is large enough before subtracting
> fixed IE offsets to prevent unsigned integer underflow.
> 
> Signed-off-by: Salman Alghamdi <me@cipherat.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index 268f294528e6..9f21a2226dbd 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -604,6 +604,8 @@ static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network
>  	privacy = pnetwork->network.privacy;
>  
>  	if (check_fwstate(pmlmepriv, WIFI_UNDER_WPS)) {
> +		if (pnetwork->network.ie_length < _FIXED_IE_LENGTH_)
> +			return false;
>  		if (rtw_get_wps_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, pnetwork->network.ie_length - _FIXED_IE_LENGTH_, NULL, &wps_ielen))
>  			return true;
>  		else
> @@ -617,11 +619,15 @@ static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network
>  			bselected = false;
>  
>  		if (psecuritypriv->ndisauthtype == Ndis802_11AuthModeWPA2PSK) {
> -			p = rtw_get_ie(pnetwork->network.ies + _BEACON_IE_OFFSET_, WLAN_EID_RSN, &ie_len, (pnetwork->network.ie_length - _BEACON_IE_OFFSET_));
> -			if (p && ie_len > 0)
> -				bselected = true;
> -			else
> +			if (pnetwork->network.ie_length < _BEACON_IE_OFFSET_) {
>  				bselected = false;
> +			} else {
> +				p = rtw_get_ie(pnetwork->network.ies + _BEACON_IE_OFFSET_, WLAN_EID_RSN, &ie_len, (pnetwork->network.ie_length - _BEACON_IE_OFFSET_));
> +				if (p && ie_len > 0)
> +					bselected = true;
> +				else
> +					bselected = false;
> +			}
>  		}
>  	}
>  
> -- 
> 2.54.0
> 
> 

Doesn't this fix a real bug here and should be backported to stable
kernels?  If so, can you send this as a separate patch removed from this
series?

thanks,

greg k-h
