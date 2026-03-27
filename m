Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5E93C7E0F
	for <linux-staging@lists.linux.dev>; Fri, 27 Mar 2026 07:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774597365; cv=none; b=WmpjohuTnDYl9FHptc1GwtjF14YOS1g70/Y9UGeZe53N/WL4+dGRjn4LKxdRGSxnNjiDsBA2F7/2oIv7msf400Z6cyOCe/6a1xjvkSchtvq15AwJFcUCs7Npc+oajNbWhrJTKNDwcfM4AIRZmS5Q8r5hdFh61ZYhAoBnxa6j+Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774597365; c=relaxed/simple;
	bh=h6FUJpIJwHLmPDE2ruUvriC+2eZJ+e20rQMiN3xzpPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fyHKn+E0V5z/W9AJvttjAJXOJ+Wdiz4pbfWVlKH3ENGQbMK5RcU9/4bj5SVZd2eK1u552wQbzyoBp9F0JyYwZ6f9PNX1JGiv53k02UGmriDgEbskLLND8x0UXKbMANI1L+8GPm9iwOMNF3AJQKRX3jG7pshw02tVnubG4w1czds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wBxtP7UJ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wBxtP7UJ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so13196175e9.0
        for <linux-staging@lists.linux.dev>; Fri, 27 Mar 2026 00:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774597360; x=1775202160; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=llZHrroUZZY9BhgMmFmlJa2knhYN+/BKrhPpRJ8N7jQ=;
        b=wBxtP7UJAeEOwf0heby/60H8Xr1d3NZ7mFvl5QGYeMfdrCNkUVhImKcT57Cy3DCsHV
         hb/eBZJG2vKm1lGDHtymCXTBqmf2aADD+L8ZNKJ+PviPmrWzwdpEk+8EUanpM0vPVYZv
         BWPqMjfJ+laj51fi+HqKAHvbrjJIK/qdY/ZzyPddELeFLDaFeBy6As8dKzvI94ot6UHn
         kXsKQ2WdTZsaDkvAr9wYnVnBitTGYrS6N4oXURNv1YxzymBz3qZ+SsPBRMzhO0ZXiRjx
         fu1rCKw4cwQ5xhz0gdfal7p3sBO7p7Ztb19gvNwUGDKs0gLOo1e91CkA4S2h5rik8Uz3
         VU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774597360; x=1775202160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=llZHrroUZZY9BhgMmFmlJa2knhYN+/BKrhPpRJ8N7jQ=;
        b=D/jsMTCQI0T2E6RYvb2uKaupe2iwsVoGvyORFy5v/0IL+uDob33ScWNYEEVlXXCaL8
         Kmp4A6+deNd06pBZGrSkIJMGEzREJZr/HInetDIscu/dOZZk0nvKAKNYP6SqO97g3WJ4
         +WKuu1EabPEKIXca1ls3Irr98D8niQ5eODlgpPkdfiTdb/l667CiQe4FlZeSLAvIV8LG
         agO+gAJHZKutzsGKtN1BIrFLErBnNNBZ1ZK9v5knOzoV46OhauwAkY1kpsNRaIrEtt9/
         EKm7pkvHTXhxdN4OmScOoyH+OWAUtJOrJgJgrdCAIoS2335S9CpKRpuNFkizS9gVZ3di
         dH4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKYZp4uWY0hjIZQJ+6gX+Zxrolb1yD99it2bWQYV76pSJB8fO9TCpW2wCMyGkaxilKJ8oLTjjTHEiPoU/E@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1r0izrd1bA/jijBccQoIH5NieUw2NoO5pAJzTs4cUK+50iSH4
	Ncvwm2doXslam+UW0vkH5ZmWZIuBADbuEYTU/1bCZnFHKkZ8PL7KC7I2hdRZidLnc8o=
X-Gm-Gg: ATEYQzx5B7++mcaDEJFlJZnUU9n3LZb0KPlV2QaIe40VMPN5PvDCph41UkaETVUDxuR
	Ajy9337BG0TaGwP7RoCMS8W+UBlSPlCZo9Z80iXK71TjPJD/Zud8gTzyAzyoemwwvBXXjG1KTBm
	+6fqezAMH3qN2tv1nyL3u3wI8ChCwNMIW4gFOxYf/QKriAp4hvBcQxmqlKarolQ6iRoFMR8yUJE
	HHSfqy3bFG0Xsr8JYrHFXJ6deIW1etl2LGmZd6eVlD2HOgF9cy/0Yxzz6kgRV780swRfYRrrVpY
	g+3gks7ZMvPa8wKdb11BAiv8LIqyoSPUNkcCPFmy6A+yiDKaGjORumIfP//zPTq9Mgh6Nx2zGrs
	lNwGlV2+0D+HJ+6mnWHvYDFxmQYxoPdHQKZCaVeOdW4HFKD2szanvhdlrODNt5dUGv1JxZqIN7K
	1PwueT/hGzVmOPFyeSqr4GPxv43Bfz
X-Received: by 2002:a05:600c:3d87:b0:487:1114:d42f with SMTP id 5b1f17b1804b1-48727d59da0mr22692065e9.1.1774597359281;
        Fri, 27 Mar 2026 00:42:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c845b8sm72964655e9.4.2026.03.27.00.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 00:42:38 -0700 (PDT)
Date: Fri, 27 Mar 2026 10:42:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Romy Rianata <arokigaming@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: rtl8723bs: Remove unneeded blank lines
Message-ID: <acY064OgwY5iRi3H@stanley.mountain>
References: <20260327002212.33024-1-arokigaming@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327002212.33024-1-arokigaming@gmail.com>

On Fri, Mar 27, 2026 at 08:22:11AM +0800, Romy Rianata wrote:
> @@ -292,7 +290,6 @@ u8 HwRateToMRate(u8 rate)
>  void HalSetBrateCfg(struct adapter *Adapter, u8 *mBratesOS, u16 *pBrateCfg)
>  {
>  	u8 i, is_brate, brate;
> -
>  	for (i = 0; i < NDIS_802_11_LENGTH_RATES_EX; i++) {
>  
>  		is_brate = mBratesOS[i] & IEEE80211_BASIC_RATE_MASK;

Looks like you accidentally deleted the wrong blank line.

regards,
dan carpenter

