Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1422F3EA955
	for <linux-staging@lists.linux.dev>; Wed, 17 Jun 2026 11:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781697279; cv=none; b=aVf8JH2tK88nZW3N7fdeqH7o0hmDKvDCmNiO3zGUVD1WdpDW3fctVDwRsL6lDQzSiWdDjOg3m8M/bJvrY2ZsGPoXznth9jBGc4QW/s/JjnOGqRFGQOh4c/iZ+3AiZrpFyITPqcoULN6W1nHTCuLZgAVVKMQihxlKupq/BKtTsj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781697279; c=relaxed/simple;
	bh=e5vrnpOUrcBaorigMkTnmlPhHtvREVwycOP17OdKxLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=elbr1lGDx5sz1IY71r5eHp7XzRVB2vEuIJvlHC1RGYoFK2vYwbyCnDJUDls13Xjy6TSpSUKss+8d08c9hvC4HNwlFIWqU2FMA7qT4Hf6BBvFjutAyRsvQI4ayF9dGgcTdDdnRbJ0kOG4WsH1m/zKawVYmROfZJCi5wEwa+Tw/RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FfX0Y0VC; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FfX0Y0VC"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490acbb0f89so36840275e9.0
        for <linux-staging@lists.linux.dev>; Wed, 17 Jun 2026 04:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781697276; x=1782302076; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IYonsZZT3eMJ6eMwo9f2K9/Y+jgTVJ/DbNOOZxYP/Bw=;
        b=FfX0Y0VCa3SHTSUfxE6eOrVjCXZfIfXy2sw0OlScpP9gZ1kuWnBKayBsDTSPCSuE58
         M0dBmgU28i/HV5xTQ00ux7eeoTjOZFXVG2o8fJVjpJxBWn6z5nRUpZLasw2qLLjD0eLW
         AFbMU88DnUydiYE57S2IotCYi+k41GaYnoizrRiNVRXU8jbmlbrVDhcI+snQfGWMWTrv
         S60GbwHMIkREPOjNRbvirmySgNdvK+2n2GuHsq2x55VCIa3x9MLK7G1hTA8GFaTBe48L
         yGWAq+dNtwfDMbIbmW39ASqJOfifxdm3tLozflf4wTlpv5zexKWQy2cLQY5b1TuNEHQl
         wJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781697276; x=1782302076;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IYonsZZT3eMJ6eMwo9f2K9/Y+jgTVJ/DbNOOZxYP/Bw=;
        b=T6uQr+60O5FYWqhYfWfb0rCdoN+2ZpQyJ611qA8gry8NaaXj3APFzqEhnVslAntD/Q
         Cl3IOh95VP1Aq58glgeKMDlQ80Ptjy3QtEcCoL3UjRFGdHxFj5Wn9QJcXIOl7rxjOpjK
         xyzf926GgZD0ADM++DrH6uDvaV/K5WNttXwHGmS/TkVzZ5hJNq3moz0J5NxDVIEpkOWV
         7ib01XjuTZlFPA6pzKdbAn29ZYydpz0T2ybkukEa7zQKo5EGL17oMAGmWSkAX0QZFVAm
         W/n6E3NAyzdhdBicp6/RIRMi6o3j94mDTYpk+U+7tgyrYgnWyRTRBwWfrCjzRMyL6be3
         ze4w==
X-Forwarded-Encrypted: i=1; AFNElJ/Fhju+pci276afUvGMEMzIfwR12W1IhirtEAgJ2uaxcjUS4S1kSrsOdhd6fmh0AHMhXILXx6oXgxh/3UbR@lists.linux.dev
X-Gm-Message-State: AOJu0YwaL735pGa1adsUqzm5RWt7YsRUjph1A7Xgk8UCwSokqexce5hJ
	eW2Hdk/SlD52viOfWlvSWbDoinFuJsbezfqCkyA0OE9VIF7u/j9vp6fy
X-Gm-Gg: Acq92OG40EEj3i/tXcY7MCNO/HbDYGaoPiD5zvGXC/En3epfSGqaD9fhB79FRcB7kTh
	/VVhLby4up8Udlsm6IRdrsVx4Uatfxg98qWspvp/TVVo3FLrLMAmtaM2Z0/R3IX13KAxQxCOb8J
	57Nd45MS0LVjIHvabBzOypjsSqkJ1H1T7WO2wFW8ur8NUJiKPwhRXaa7Oa3shHhUhSmX/nic14O
	vT7M94L/SpZaUYZS0jbahAYpxeGcnSpWMxWnuKXJ/op3MjcZ/hY6+XdbE4OpJS1Dl0pDqRZuqnm
	lBTnlzY+p0l08Oej5rR7SsUUKLOkx9yJF2IPPdzFIQRXX22Q/2D7Oo6iC5Ibj0c6NVPoYhe46De
	2Lx1XCFzl1dZDKLnV/i5BRIZ40C5CKA8CLVSsMmfavM7oO13nE0Qguc7OJF6fWpABBH3QvngTx9
	rmZWcaTYoZXbo0uLkCBkk=
X-Received: by 2002:a05:600c:4e15:b0:490:9d1b:f086 with SMTP id 5b1f17b1804b1-492333a90d9mr66724385e9.14.1781697276205;
        Wed, 17 Jun 2026 04:54:36 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a96d14sm140042075e9.12.2026.06.17.04.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 04:54:35 -0700 (PDT)
Date: Wed, 17 Jun 2026 14:54:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: Subhrojyoti Bala <subhrojyoti0609@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] staging: rtl8723bs: Fix comment style issues in
 header files
Message-ID: <ajKK-FQbcYw-wNLU@stanley.mountain>
References: <20260617064150.16078-1-subhrojyoti0609@gmail.com>
 <20260617064150.16078-3-subhrojyoti0609@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617064150.16078-3-subhrojyoti0609@gmail.com>

On Wed, Jun 17, 2026 at 12:11:50PM +0530, Subhrojyoti Bala wrote:
> Fix various comment style issues in wlan_bssdef.h and rtw_mlme.h
> to comply with kernel coding style:
> 
> - Use proper multi-line comment format with trailing */ on its
>   own line
> - Remove extra spaces after /* in single-line comments
> 
> No functional change.
> 
> Signed-off-by: Subhrojyoti Bala <subhrojyoti0609@gmail.com>
> ---
> v2: Combined four separate comment style patches from v1 into
>     this single patch per Dan Carpenter's feedback.

LGTM.

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

