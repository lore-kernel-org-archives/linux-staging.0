Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FD533EAF5
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 08:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768205942; cv=none; b=XbbQ74VStYmSeYZWB516H4Ygv1/A7ZN2BiKrE/Hvrqn5lf9Hvj1U3MUGQklDVErZXExCJmeosC6yjKwIJehba/tquWTcJjdNJV9JdaQqxcGpXMQFYX4oba/sQLlPLuKsn65d/ftVWCI4TViV0Icl6V8U2kyLTDUAAM9D1/+QXtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768205942; c=relaxed/simple;
	bh=YxzlEMNKDF0g8mchGkxTwinv2UdMEtiyN/LBYdYwUMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eC1CMitT2L9nTp5N7aB/MAOTO9GCEvUEvYcxmkqFOoVuLhF7NxI5sSvN4HmoAb7aF3TIRSLOrVwKb6F2DTpYqolq1FN6I9vp4Xq8CcVPYbVZ0uS9N4So6BsK/kKfUdds8A8MoqN5lgqb22goWqGvWsjmTBXTDj7ovnYGMkYiNZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DUf+TIly; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DUf+TIly"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so32967885e9.0
        for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 00:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768205939; x=1768810739; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NuZvSlWAujHem4qpT7Gn5wLBwA3Ool/TXpYXI9500J0=;
        b=DUf+TIlyMyPRbXLVQlNxYMiEIzw5rXZVMIy29zFaCbodOkIk9p2mLO0eC0LQI4owBX
         8OnLAxNMgMFa7J7gPErkxbfqwigkZsKskEBFaMK8AMXUgws0fqpfdVxiauMVutp+IJEN
         PBtjyj/QcZk7Sa7AQEwcUwR7fix4SKQaFHcHNZQLkmSU93L092Ls7B0okFeUYyAiKdZU
         bvwJdTxlBsD/J73mDHT1SwCe2Gjovjs5s17/Yv19gXq2qPOIZklsgvLcFMwqUgLwhZWi
         mRAxFZBoZp0fukMNBxfRcZJNxac8IpvKX/9ds/KB78G264tt60zLLWC5FTVneqFFjX16
         HtXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768205939; x=1768810739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NuZvSlWAujHem4qpT7Gn5wLBwA3Ool/TXpYXI9500J0=;
        b=tbjD1p1hif2QF5ceou+g3FANougOoUwp4ZgaUyZgVBdyNlbat30aqXet9y+BUk5mxK
         PzmoAn5oNgGTw1pE/KUDN6FHvPN3nZIp9MCSI6guKvCCrWSKJQ/MQTRjBD845i2ayeCs
         fuKKjx9ZZ6V9VxWtaEtD8wfu9E00JYH15fpbFfS2jqDEuDwP+lBrQC9ERHzQmOV6E4W8
         C/e5+XPyOe1JldWZAOCfcluEW+LM64ur64sM524jLZk/Vx2VSxv2A5nR0HBCeAIWGYg/
         lH2OuMqiBP/B3EuHBpuOVvtB5So4ePKH6QFafyi1ynE8rHGhMPFkijy1vX0W9A0A5M2J
         hoFw==
X-Forwarded-Encrypted: i=1; AJvYcCW5lTHZ5g1XL5MlEfDUd75pztgiug0YdIKIvjtJlvkGdd8ZqEzGO8GBUzUiUoTpRwJsFkImTuKFurDxTQSW@lists.linux.dev
X-Gm-Message-State: AOJu0YwY0j0dvPblgcrbkQb4te96ZXicsi+jevASOFWxDcljC/TH4+bY
	uxRdGaerx8rykH8wiCeMoIasrZdGpgJToFM/YItRQ01U8IS/yFXb4LUsy5iGbz1+aWk=
X-Gm-Gg: AY/fxX50j+ClqbntFxwJg+kaoKIUHWB126VEB8HK6uePn1JZPX3lai/LHRDQMo7SFDR
	vpcUrYrSWeo+lxcCwxIq946qiJ+378e/ii++Q2MujzQszj+4gS+ezQcjQgroZ1mmtq3Rft8/g2T
	qrRhzzPbuMYUrYcO4bhD4utGGcswIoBoSBlkfTYD7szRPVrFbs7pxBSlaFqWIs5+8qeuW9Q7ExS
	44mB7/b/XH0qiLMc4o8TYyAmekjzV//aLbMWnhFTfxEVtqsnuA9tDaepnVpfdMnF2nNokyGy16c
	ZfhpWE/NuU1MKmZ9GcYAbjHldYitLRcCeMd8bgJlm2yQgVfVTSBzNpaVOk9pEUIGfL9iky6DGZ8
	UJt6WC71iixx3bQjuaC+L3Dt7lauhwU8yHqaApEq0aGqr0ryOXNNS8eoXWHx40pojD2EG8N+4lS
	tfVkZDI7QWrwCNoGwg
X-Google-Smtp-Source: AGHT+IHgTjliOBZESJFfHoP2lOsn/WfkCD5Nq4LP5m5xfIVnoxcvdXZ7nDXO2ChE3KU/+lNGhFaGdQ==
X-Received: by 2002:a05:600c:1992:b0:471:9da:5232 with SMTP id 5b1f17b1804b1-47d84b1a08amr211569615e9.15.1768205938986;
        Mon, 12 Jan 2026 00:18:58 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8662c09bsm131700035e9.2.2026.01.12.00.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 00:18:58 -0800 (PST)
Date: Mon, 12 Jan 2026 11:18:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Khushal Chitturi <khushalchitturi@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/9] staging: rtl8723bs: simplify boolean expressions
Message-ID: <aWSub-JIUiEWUpv5@stanley.mountain>
References: <20260111183630.12816-1-khushalchitturi@gmail.com>
 <20260111183630.12816-4-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260111183630.12816-4-khushalchitturi@gmail.com>

On Mon, Jan 12, 2026 at 12:06:24AM +0530, Khushal Chitturi wrote:
>  	do_queue_select(padapter, &pxmitframe->attrib);
>  
>  	spin_lock_bh(&pxmitpriv->lock);
> -	if (xmitframe_enqueue_for_sleeping_sta(padapter, pxmitframe) == true) {
> +	if (xmitframe_enqueue_for_sleeping_sta(padapter, pxmitframe)) {
>  		spin_unlock_bh(&pxmitpriv->lock);
>  		return 1;
>  	}
>  	spin_unlock_bh(&pxmitpriv->lock);
>  
>  	/* pre_xmitframe */
> -	if (rtw_hal_xmit(padapter, pxmitframe) == false)
> +	if (rtw_hal_xmit(padapter, pxmitframe))

You reversed this if statement.  Really, just please throw this patchset
away and restart from scratch.  This wasn't my only complaint about this
patch but the other was more of a style issue and I think you will fix it
if you go slower.

>  		return 1;
>  
>  	return 0;

regards,
dan carpenter
