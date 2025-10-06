Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56E823B604
	for <linux-staging@lists.linux.dev>; Mon,  6 Oct 2025 07:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759735619; cv=none; b=sQnUTNHUAm7oVkineiNGfgqAb5yqfZn6SPOi4Agh1jbC+nX05uSh5IMkp1ErME5WiNgKzSL+tDpqyAwXYX0t7+uJRCHzPkKsgxK4LE1LMKUBxIZqtrNV4So8itqOx8IoCdY/fawc1YYw/ZK9SmOA6pNgqYHlyd9oiNLY0+PZujI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759735619; c=relaxed/simple;
	bh=ZSV4IFjn5S/793vrMHRESbrBLLit6xDjG7yB+mPfIgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C26D+yTiqrbMIOjcdCFq4+QBTGdM3Nl4hsba/FSwdOq+MZ2wF4MpKlsg9xxl3Qb0NOyx6SCaBIdELxI58OM7DNghNUhC9N+JXJhubAx4fgbNBwTsQrxHtRGT1d4Ujf87nxoniu+8pfjzHov0JDz6ZsH6hbiI99dDdzN6HUrvyls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SuKSA/x9; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SuKSA/x9"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ee130237a8so3009956f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 06 Oct 2025 00:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759735615; x=1760340415; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DrN7ZozqF/Mn/6ehte6QeL3Mcq45F8goFBLH3ErZr3c=;
        b=SuKSA/x9FZxa46XdrHaDz3GSaW+bsvbx4lbVyIMwxMWhfgSoso2WfcDpJBxs1LroXf
         3qgkW/HZoQl/S/W6xljYhKS6/6O3d5oCWriPAe9P4VsO7VLq+JcVxWFCeOlEPdnb0hoe
         ilFubQSZtwU+6FxD5Nj6WUjHyhRmNCJ5BJ5nO5lFx/LJME32mGO9vzxisRvJ6XP51Otl
         NInHNTPbt+Lz+DUJMkeAeqGhsx/flXyCOPY0cdR5WdHdfen4yQzzWaIKmvLcGOEGxIeX
         U/K9cNnMTV+2X7Lwt4VwQVfWen8dmc0xHtZX2/JHQePRnzkg0lEuUiP8c0m/5Poah5ng
         mtag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759735615; x=1760340415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DrN7ZozqF/Mn/6ehte6QeL3Mcq45F8goFBLH3ErZr3c=;
        b=EQ6Tc7U48rHQexiUg6PuZy31Z1Gn5RHQV+Tj40qyUSXM3tgBADiQUjWI4VFbMrq8Lk
         /g6adRQCfmA2HqLJ2SS8bTsNjmulWOt3zS6mKpaIfr/rGIAzyH0/NdRyOI2QNVxQXSHC
         kK4cNteLD6dluY/NUnvv7JM0VGFFV5My9T0IsJLAWqPGeHRI0f/hfGgOetvtdvw+iHn7
         lGhTRiORDJQBSG36uULXrZktafXX3+DYE8EhamRkvRM+DF2wsb5dxjKSlYSx0gARfT9y
         1Av3Z7tU9g6tPDf6u9PV/Lp6W+ZJrE4JrbL9AJo7lE1JwT2bbwC5Z054l1IuGWprTh0j
         aD6g==
X-Forwarded-Encrypted: i=1; AJvYcCXNqJClI+6Zc27/gw0w8bOhXLuTsDbUVOPdlC+Y8apR5Qz0qld06bgo7SxMcsOCNTytGUuB0ZqcPxJxmOg6@lists.linux.dev
X-Gm-Message-State: AOJu0YxXrg8V7uL64YNYGXnZjYUPe+xwPn3/M7PGwHJQDEK+VZ+GLUZt
	aKjMsqAdDXlTSC8y7JoWRlFg00pF0GXwzYr3PRu94w4j/n8H9eF3SPun+LM7m87k24M=
X-Gm-Gg: ASbGncuL6/Lc41vUl6qUJmibHfcpY2DAVvk4zcFVhfBBd6Et+vMGon4W0VEd1Tddfb6
	NKWIebNRnq0w5BPM2l4L9TctP4+bskfg1PSqqH0m4oa/PEPJ3JHC/O0Nwwdo9Hd9m6GW1ycn1Ea
	vFlXyKnapdfvM7GEjtPIh1mwsLzTRWOoL1SiJgJ/zFB7BsJcGoMU9QKf1lCAhHLgqPl8stypXsF
	ukUNH9LldAyYq1CxhiZ6SOlkKmLgrwQku2/+Bw3UEfKeWSpM133z2dxSIfzpmlLq27lk6tJtB5O
	s96lzHELjvyWdoGD9Bb9DgvtIC+rY+Jp2AfTq4UoYPlaXGeKt+VEYo2g73NFD7VDO3JLztcPvSk
	ns9jf/9/CGRAEPB0BBkuVVh+5vgfRvBqRoXRxQN23t9GCz0KLW/tksEJh904Kz70tOXs=
X-Google-Smtp-Source: AGHT+IG2XBqil6G6TC4mt93U+4Uu572R8R0hylqEdTrhXnnJpQZ4j3fC83aTn/veVeHYslgxQyxt+A==
X-Received: by 2002:a05:6000:1847:b0:425:75b7:4b67 with SMTP id ffacd0b85a97d-42575b74b70mr3419997f8f.58.1759735614851;
        Mon, 06 Oct 2025 00:26:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4255d8e960asm19393087f8f.37.2025.10.06.00.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 00:26:54 -0700 (PDT)
Date: Mon, 6 Oct 2025 10:26:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rohan Tripathi <trohan2000@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] staging: rtl8723bs: clean up lines ending with '('
 in rtw_ap.c
Message-ID: <aONvOsbVxGYKZnvD@stanley.mountain>
References: <20251005155920.381334-1-trohan2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251005155920.381334-1-trohan2000@gmail.com>

On Sun, Oct 05, 2025 at 11:59:16AM -0400, Rohan Tripathi wrote:
> This patch fixes coding style issues where lines ended with an opening
> parenthesis. These expressions were reformatted so that opening
> parentheses remain on the same line as the statement, with proper
> alignment of continued arguments.
> 
> This is a coding style cleanup only. No functional changes.
> 
> Signed-off-by: Rohan Tripathi <trohan2000@gmail.com>
> ---

This needs to be marked as a v2:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

>  drivers/staging/rtl8723bs/core/rtw_ap.c | 250 +++++++++++-------------
>  1 file changed, 109 insertions(+), 141 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
> index 0908f2234f67..93ab0015ca89 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_ap.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
> @@ -480,14 +480,13 @@ void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta)
>  		/* check if sta supports rx ampdu */
>  		phtpriv_sta->ampdu_enable = phtpriv_ap->ampdu_enable;
>  
> -		phtpriv_sta->rx_ampdu_min_spacing = (
> -			phtpriv_sta->ht_cap.ampdu_params_info & IEEE80211_HT_CAP_AMPDU_DENSITY
> -		) >> 2;
> +		phtpriv_sta->rx_ampdu_min_spacing =
> +		(phtpriv_sta->ht_cap.ampdu_params_info &
> +		 IEEE80211_HT_CAP_AMPDU_DENSITY) >> 2;

No, still not nice.  I think I would go over 80 characters.

	phtpriv_sta->rx_ampdu_min_spacing = (phtpriv_sta->ht_cap.ampdu_params_info &
					     IEEE80211_HT_CAP_AMPDU_DENSITY) >> 2;

Another option would be to do:

	phtpriv_sta->rx_ampdu_min_spacing =
			(phtpriv_sta->ht_cap.ampdu_params_info &
			 IEEE80211_HT_CAP_AMPDU_DENSITY) >> 2;

> @@ -498,15 +497,13 @@ void update_sta_info_apmode(struct adapter *padapter, struct sta_info *psta)
>  		phtpriv_sta->ch_offset = pmlmeext->cur_ch_offset;
>  
>  		/* check if sta support s Short GI 20M */
> -		if ((
> -			phtpriv_sta->ht_cap.cap_info & phtpriv_ap->ht_cap.cap_info
> -		) & cpu_to_le16(IEEE80211_HT_CAP_SGI_20))
> +		if ((phtpriv_sta->ht_cap.cap_info & phtpriv_ap->ht_cap.cap_info) &
> +		cpu_to_le16(IEEE80211_HT_CAP_SGI_20))

This needs to be done like so:

		if ((phtpriv_sta->ht_cap.cap_info & phtpriv_ap->ht_cap.cap_info) &
		    cpu_to_le16(IEEE80211_HT_CAP_SGI_20))

[tab][tab][space][space][space][space]cpu_to_le16(IEEE80211_HT_CAP_SGI_20))

You get the idea.  Same for the rest of the patchset.

regards,
dan carpenter

