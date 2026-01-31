Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03D23570B2
	for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 17:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769880962; cv=none; b=VHm6FBecYS0peFAk6p9fbT0GPazfADwsnTo0mmtFJZTraIvN1hAfo3AqDPt/zADABfkLfZAZu/1KpRx/QzFj+9vHs6Gkhb/eK3Us/SW9b5JYb3VCIkC5JB7PYUVfuayq+rJ6JpsKevM3A+1zvVeV7Lb/GNR/U0VxUwpBswSz0Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769880962; c=relaxed/simple;
	bh=wRYovOCJEFYpD/m0OWEX50lFZV6t2ElXhxxMy4k9Y9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l/8elYZg8Uz8I8UyRIuxAvzxEEmc2/GxzBKIHH43VHHpX0DOEU6sEVSThu+DtcAQFyyjgmWXTomG1JoLWfwi+rq8hYNka0rB05h8r9BftPaUJF+QaqgsRdaBuygqD4qsuvxmlVuTmjK75Uie4fmw5t8y7Zsct1u0VNB/zD95Wro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xO5P2ez+; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xO5P2ez+"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so24914605e9.3
        for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 09:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769880959; x=1770485759; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DJGtibyHN9DsQJLWN5q9bgxgdkmcmPzmFO5lZgA2ACE=;
        b=xO5P2ez+qOf5l4dXVK+YfKXiLHnbMxAmBQKjdHSE3gI5G8QkDqvHWAvOeWX/AmEDjw
         WJmhPJtpScDRxD5vbqdE2NIpA1sYLx4WQg0GomHMitKXIZOMFz0HMLQCCjqP8ObHq8PK
         hf6TcgL1loXealL6At3PEaZv5M7czwDUPDcM7iS+veOd3G53FvPAQGXTV1kMdG7x/IoU
         C4VfYsPseibUBGVsU26NvkIW3u1dn4bkbEY+4ONCztU4zN+uXuoWpoY/4Ne62Nyrl3IG
         03UK2GQcpEPbjmy4UqTunBNSC+Vcn9SRtMYh7u0o8o2ncvit2U7wrUzPcmubEg5TCM60
         rq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769880959; x=1770485759;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJGtibyHN9DsQJLWN5q9bgxgdkmcmPzmFO5lZgA2ACE=;
        b=l7UGPzT+0OMMtwlqQEiGtuDABbZx1CZVftEQmazV4ys7LoKCDkT4amulSdznumH/VB
         eyAjhFDLULcghI5GYz6TDwv/wz7hqeO0SyDrx1t4mRa3YzBlxujTdYVMMqNlC8sKW1Lm
         8JjUpHc4W8BWCEbTe9MTfBiLbVJ6EM41BeFLgABP5G4/vUf/c9VOEEbr2i2GecaVtEQx
         2P96McsPwoXNiAgrR6f84b0JsaFqF/v8cvzAwX5VUVN0wkUnxm186NPW6TjNbuT37I68
         FlUWRHm62fYLUXKybrXCSOr7kLJvfntdPRVSD2z+oSq/QF7vmdg21RzOIN+e3cyaZZhM
         ywpQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+s7yvgvCA5QMZWGNlR7FxOa6BuXjZ9g6mhLGXR4pLiKzVLVvvzvEecpWh68/aiD3QtAN+g8GbKJdullzm@lists.linux.dev
X-Gm-Message-State: AOJu0Yzw78x8wR3IPJxNxTII8TkgIVGDDuSAuz9aIegf6ZPwKGWvL395
	AX+cq8ZKn9gx90hCO3nKCSgL0HpLLTGywe07XY1rmOnAe0Ksw7rhOVxh1VHRoMDhUDY=
X-Gm-Gg: AZuq6aKS4eOkmcAv6RrMq9YzWUhMTeQUaB+su0NaxBnUJKaH+V05L5KT9pt2N/Bd8Va
	E1pEgTj5x4RmgbpxROIEyD9LQfKyMRd+vzh/DpGEBUNkcg35PLeSHUhiWG6xeH2fSdddXssNghv
	W/PqbY2q6Dulkq3FPYIAOF6cbf+t0aTgwmdzkZt31z7Wi1FGRGdJdllxJv6Hc/HqSH/LED62Z/f
	V7BHy2TvKxUmQdjnFNHCJRNi73iCwC//+0V9qPELD+CiXsi5cRyjMi6iUgmuY/Hdnl3csJmRiYd
	D4E+hMptN4ma6ElMvI7vHRNgtcWRAhpnXrW/PJk1Cs5mKZdFCXvshpKQGSIp7rDvZOIbitKgFJG
	AK5WWPTd+N6gvhx+zkCICbRLuck7JhE0mAsMbK5ecjYUxdynjsTCBS72bEcaMkTITFw0iGh06fS
	5SORkc8x9W5beFCO/B
X-Received: by 2002:a05:600c:1d03:b0:477:63a4:88fe with SMTP id 5b1f17b1804b1-482db4521e1mr88434325e9.2.1769880958855;
        Sat, 31 Jan 2026 09:35:58 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4762sm29526106f8f.6.2026.01.31.09.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 09:35:58 -0800 (PST)
Date: Sat, 31 Jan 2026 20:35:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: William Hansen-Baird <william.hansen.baird@gmail.com>,
	gregkh@linuxfoundation.org, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: replace ternary comparison with
 min_t()
Message-ID: <aX49e37jGXj674bq@stanley.mountain>
References: <20260131133146.8174-1-william.hansen.baird@gmail.com>
 <aX4U_vhLXX0B12DS@stanley.mountain>
 <20260131155525.05e1645e@pumpkin>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131155525.05e1645e@pumpkin>

On Sat, Jan 31, 2026 at 03:55:25PM +0000, David Laight wrote:
> > > @@ -1024,7 +1025,7 @@ static unsigned short rtw_parse_assoc_security_ies(struct adapter *padapter,
> > >  			pstat->flags |= WLAN_STA_WPS;
> > >  			copy_len = 0;
> > >  		} else {
> > > -			copy_len = ((wpa_ie_len+2) > sizeof(pstat->wpa_ie)) ? (sizeof(pstat->wpa_ie)):(wpa_ie_len+2);
> > > +			copy_len = min_t(int, sizeof(pstat->wpa_ie), wpa_ie_len + 2);  
> > 
> > Use umin().  "int" is wrong because we don't want negative values
> > stored in copy_len.
> 
> And the correct way to fix min() bleating is to change the type of the variables.
> Using min_t() ought to be frowned up and only used as a last resort.
> 
> In this case I think all the variables declared with wpa_ie_len can/should be
> unsigned int.
> 

That also works.

regards,
dan carpenter

