Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4E21FDD;
	Sun,  5 Oct 2025 14:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759674240; cv=none; b=phfknLS/7YkznK2cc9quNMbSmpHRcENsZ5EQydPzYi279uVLlFdNtOpctdGaohZ2FocJeuyaU3G4cYDJUX0TjlDcjbJ8CtR6kRjnWrprUjLWJOBaB7nwZ9t+MnfDN14iQ+k62T/gJdb7VsxYbgYwgzpHmdyuSRXrKnUvVwR6jxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759674240; c=relaxed/simple;
	bh=Cuuos4rNHV1rf7F0Dz2eikPdfIxq7y7KhQcbmu2hCuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GpXSL5sbybTM98NKfbUmdxxT0y9ZrWpXqQ8A4mOaYGITpYPXgRd0XlOdiDYq5yj5QJg5unx8gJr41MtaVXLLZDIVePsHpI6HFSA9rt/CdP1vn4Fn2j54hOWayG4/vtjfcv4NU+tQPkUYATkxLuUX32RmRUnVar+ztQ/ZmvUKfUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oagOb4v0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oagOb4v0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20EFEC4CEF4;
	Sun,  5 Oct 2025 14:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759674239;
	bh=Cuuos4rNHV1rf7F0Dz2eikPdfIxq7y7KhQcbmu2hCuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oagOb4v0+4E94uMAzPr/6A6Lg1hTWULTru4ZY5+0LKzR/QY2Z2LAmPTtqldSEVqjc
	 L3aGcYRpWkcNzkJMixGMAJx/BK5l78BbR0BCwP+xFnOyKjtDfpKma0swua4M7U1QrF
	 gdUDoomf+WIMwDx6SBVU2TyMAT+XOhsegYrQ1pos=
Date: Sun, 5 Oct 2025 16:23:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Rohan Tripathi <trohan2000@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: clean up style in rtw_ap.c
Message-ID: <2025100523-kilt-feline-bada@gregkh>
References: <20251005135525.314476-1-trohan2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251005135525.314476-1-trohan2000@gmail.com>

On Sun, Oct 05, 2025 at 09:55:25AM -0400, Rohan Tripathi wrote:
> @@ -480,14 +481,13 @@ void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta)
>  		/* check if sta supports rx ampdu */
>  		phtpriv_sta->ampdu_enable = phtpriv_ap->ampdu_enable;
>  
> -		phtpriv_sta->rx_ampdu_min_spacing = (
> -			phtpriv_sta->ht_cap.ampdu_params_info & IEEE80211_HT_CAP_AMPDU_DENSITY
> +		phtpriv_sta->rx_ampdu_min_spacing = (phtpriv_sta->ht_cap.ampdu_params_info &
> +		IEEE80211_HT_CAP_AMPDU_DENSITY
>  		) >> 2;

These lines do not look right even after this change, do they?  We can
do better :)

thanks,

greg k-h
