Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAA52C0F84
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 16:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775148087; cv=none; b=KHoDDp2+z0f/uj/piGc5fkotxABWnug8fXpTycAqVNxKTizH3m9C8TWYO5eXwGg3jdWh43wosyOLqps/3yCaghNHX00AWa7+v9w7852yquC403VQdDvQgTbai3JsS8GjJCUupzWVwAh+MMEUdRUkDWD8ZkwDz3qD2vOPtLbqH3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775148087; c=relaxed/simple;
	bh=j92fQMokUXtQU45AJ9ImYltyPejQz8abzRIylojZiWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QKm7qVzWrEb4WGhmmqQxFOOfB034AzlPboJsCVODTr+xaVfWXBkidHhO7wbRr2sjYRLqg5SiE3RLCZGSmcMkjxds0QY1Pj4P/RfxlGHJZdtP+iqC2abH26C8T4nRnd0ILgzdVQcPBjcYNrX5TmpYCRhUS169jEwr+CFGj8MnjiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a3eR+5mc; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a3eR+5mc"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43cf5ad500fso979578f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 09:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775148077; x=1775752877; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XpboYraIWFzo0sK/X0wlhHAySzR5uckhPFgoZPKC0Ks=;
        b=a3eR+5mc3E/alNT4fbSQ+xGi7UdYqw13sIncb/vPZpASoghWU7rSVFIeNveaKZ1H3n
         msQygM6GBRrWh/jTEmBh0f9kdiT8ZgU9WlYZJcb6Ms1DJQzno5SgoF10972qplxF78bK
         slameczEEbulCDCPs/BxUSF5WVkPlacc+2zEf4FoRDC5AITyzFxTPZW/QT1iKbIuw87d
         TpaIvTEoo9T+fOmJxmiL2nU2/3ermO9GhYPP/VwboP+SA6mjPMwO8mioD5s2KavABqJF
         tvhGVMKJB41AtSERVWzOJ7765QGYfvL/zABuksU8qk1qjN2kDDmOSNYG08vuRMjb82B9
         sFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775148077; x=1775752877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XpboYraIWFzo0sK/X0wlhHAySzR5uckhPFgoZPKC0Ks=;
        b=F4dEbMiB/+vTB92eWQDqqEkF02XfPWd5A30heQyx8umzC401IKrekrF2ePP2lurBly
         l5sa7DW9nzd9+tNzcJE4cQt0AVupt5CTNoI4x+7+/8qNEtNCcZE1UinFfIMydcPwqUDh
         Ha7UNOzhVzOZDhP/59tQ/z83Q4xNS3u/lIv5V+gz8Xhz89a/0DBUZnAzmMAXoMqqbou6
         C9Fn5QIItB0vjsRY2doBtNH16mmdUvVjj+rs15858WyGdWukIp/+d9T8IAUHtzdWr/PV
         ckiA0KGt5lv3yX3fZm/aQ+TqoUi2gztHhEa0osSRNUkSKWKuEG2VkVt/mxudWZUl5LT5
         DPsA==
X-Forwarded-Encrypted: i=1; AJvYcCUUGyDKApBFRFv3HZVYJxTU3MnbA5ug6uf3C05n5ZdBtcu+F6UlixYhKhEgsiAXpOfGAMApinTGjOPr9Hjz@lists.linux.dev
X-Gm-Message-State: AOJu0YwnztREO2+vzOazcran9OXPh9Apqvtrocwyc2zG/QjABzeQkVbz
	7wIWV/U5dNkpJrIBWZeBOcMcrPgx8LQRp/E0HbJ/9/R9/CnktQVu9LVZ
X-Gm-Gg: AeBDieu7lefq06ntHWh52QgjJCTwjWsIbzEudzL2mhaDTsMlkD7fIWifPorw9QHOFpo
	Y+V2WutUyE3sdntcqsTBXZMTDds1x7GvjpN4sIXvWdrYEMYQPgP5OyyPu5mkiIiSrUPec9Vv1zv
	qgO4uea15IGKIiokzmBJK/24gSiZgPpxdSm3IUCtYaJbzwrgKXH6YFJx27BDiEd4wMmcOGMD2kO
	KhwEJpTtSqNmPod4CBCbgeWAUIWaQc5IlOQSyqrHD7gvLeihpIAZiFfNWsVpke+yWdKY+5eKvnY
	q7Fm2BPIl++v7T9pEMrSx6kD09C5sGEDd8steKA1oP8odetadUFvdrCRUT1L8qVCU+iRpF5Da5n
	hNANBHfQyyrVB17E2g11VwYl0D7HpFMo5uAusHF3VyEZ9A2rp27RpoTqB1y9VQ7CVafrR58o4wX
	ArjC29ahZ1Gt4tLLerRPQ=
X-Received: by 2002:a5d:5f94:0:b0:439:d755:a895 with SMTP id ffacd0b85a97d-43d1f26a6e6mr7668388f8f.42.1775148076745;
        Thu, 02 Apr 2026 09:41:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d2971sm9017187f8f.22.2026.04.02.09.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 09:41:15 -0700 (PDT)
Date: Thu, 2 Apr 2026 19:41:12 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andrei Khomenkov <khomenkov@mailbox.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Luka Gejak <luka.gejak@linux.dev>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 1/6] staging: rtl8723bs: core: simplify boolean
 comparisons
Message-ID: <ac6cKPY4MsKKRqH-@stanley.mountain>
References: <20260402150429.14761-1-khomenkov@mailbox.org>
 <20260402150429.14761-2-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402150429.14761-2-khomenkov@mailbox.org>

On Thu, Apr 02, 2026 at 06:04:24PM +0300, Andrei Khomenkov wrote:
> Simplify boolean comparisons to improve readability and conform
> to the Linux kernel coding style.
> 
> Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
> ---

What changed since v2?

>  drivers/staging/rtl8723bs/core/rtw_ap.c       |  2 +-
>  drivers/staging/rtl8723bs/core/rtw_btcoex.c   |  2 +-

[ snip ]

> @@ -1950,8 +1950,8 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
>  
>  			/* indicate this recv_frame */
>  			if (!pattrib->amsdu) {
> -				if ((padapter->bDriverStopped == false) &&
> -				    (padapter->bSurpriseRemoved == false))
> +				if (!(padapter->bDriverStopped) &&
> +				    !(padapter->bSurpriseRemoved))

Too many parens.  Other places have this issue too.

regards,
dan carpenter

