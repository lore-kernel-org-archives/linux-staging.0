Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12ACD142E77
	for <linux-staging@lists.linux.dev>; Mon, 14 Oct 2024 08:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728893536; cv=none; b=fzIaTIC+cCONyTOcpT2U/80bpgMkRKfR/iuKLUZ5f9ALIx9H0REaC5Z5g1nMKr5XGU6L0PawaQcDXmLoWrQjYScfxiKnznduUNJN6jt8epZbxAM+jDQSBovVWoI17pebHD8b3+qJ4tPR8IrkyvynO47BhNPbFUmhePoyuYiWICI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728893536; c=relaxed/simple;
	bh=N6DXl5dUodjaLdYlEnsT+YbVP0lQzc0egliZj/Wvn1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LpqcX8nZyjk17xxCwve6MnMtTwoq4Jvf6N3X9AEK7VNk5okJSN/BbmrMAbbU4c6K4yFWUWT165GsfOKDpbwUDAYJI7NAWLgaIl2dhP6IxIcqlHai9cVZ8jfSnGadIKHOjWh7akeybICK+hqoX9jg9hwWLPSbiE4U/ncg9TmtquI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y17pMVdy; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y17pMVdy"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb3110b964so28864401fa.1
        for <linux-staging@lists.linux.dev>; Mon, 14 Oct 2024 01:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728893533; x=1729498333; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9aUotu0T3e6PAlRn40+hIj+iMbjMPli1mQQP9Z0ha7g=;
        b=Y17pMVdyu2dE5bO8mnb2bGTsOI7Ctr1Og2fwA6Dlmn26Zr9etlEJkwe0Np1Q/pdhg4
         kMlIqHAl63Sk79tz+uqPimJaYtjlDGDIyKSjHdHCoZmri7iA0cxnCHQ7Wzc94o2Ol53y
         wH8khCdc9qaC8dScb7uzhFjDETngkT/WCmUqK8D0AAke56byHW1iwxWaMqysshh/wI+g
         HH2iNUB+zbeHs1LvVcB18NwoL2Ai5bLUMqmuauRGTrm7JkVhCa/56cB9PVso3ZlkHj3t
         Qx4YhmEmIklpOh1h9TgEPaHSbiYQcurG68CGAZ+DIXBEzbsPFavZFxpb65MLIrHgiFhw
         W5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728893533; x=1729498333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9aUotu0T3e6PAlRn40+hIj+iMbjMPli1mQQP9Z0ha7g=;
        b=X0GDVpVqlGNZ4hRdAI7EUtKhaoNJ1BW2vB2AvRRrIaWXGSyJFN1FV5VVk5x1OcAQZe
         54dMdDqNLTJyBJ/D3Lql9eUkHyPrRhj/GbxDkDYLKVnadOohO2kHrSu1/16/JlBfWmKE
         H4qzDB5hOicRSBVJxtzp7J58f6B83nK2vH8uAMVhFPJwF3ZgWJWmurwlGKNh2WieTAie
         TzTr6pPVkWCnXvwOqs8/Jzw8GZrBKXkg0Sy9jNQkhECLXBpC8tboOvse+AtleuQ9vqEC
         7wZYxFfvAYWaNfHiec78k0vZaOkVBGpwW5/gAug6c7B84A5cjwIqx4wvUGdGXpsFC7Mk
         1MsA==
X-Forwarded-Encrypted: i=1; AJvYcCV2Di6xqyO7iz3PFweU+pevkFIwHxhzn/vcEUjcLyrg3CziDER9EiplYS3fQ37ffasOLSoLd7d7Q3MitvXG@lists.linux.dev
X-Gm-Message-State: AOJu0YwF/zeRHM4+OcV6WMWUew9qPkksE88ZRYv3TkvubDtBihpxqbQg
	Q2I7uO9gs7Un9F4jq98n5TOfoWwdgAIWXKoKvXiEpcObhlGElaaul8+2u6PEywE=
X-Google-Smtp-Source: AGHT+IHabo12la2Izo7lgweHkaqt7UEpu96db3u9lfxdb6EZEcpv7L6pwcbsTeO7dm1LFg5+sjT8tg==
X-Received: by 2002:a05:6512:33cd:b0:539:905c:15ab with SMTP id 2adb3069b0e04-539e55187aemr2575627e87.32.1728893533118;
        Mon, 14 Oct 2024 01:12:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430ccf43da8sm146036375e9.11.2024.10.14.01.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 01:12:12 -0700 (PDT)
Date: Mon, 14 Oct 2024 11:12:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] staging: vchiq_arm: Fix missing refcount decrement in
 error path for fw_node
Message-ID: <767f08b7-be82-4b5e-bf82-3aa012a2ca5a@stanley.mountain>
References: <20241013-vchiq_arm-of_node_put-v1-1-f72b2a6e47d0@gmail.com>
 <a4283afc-f869-4048-90b4-1775acb9adda@stanley.mountain>
 <47c7694c-25e1-4fe1-ae3c-855178d3d065@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47c7694c-25e1-4fe1-ae3c-855178d3d065@gmail.com>

On Mon, Oct 14, 2024 at 09:59:49AM +0200, Javier Carrasco wrote:
> This approach is great as long as the maintainer accepts mid-scope
> variable declaration and the goto instructions get refactored, as stated
> in cleanup.h.
> 
> The first point is not being that problematic so far, but the second one
> is trickier, and we all have to take special care to avoid such issues,
> even if they don't look dangerous in the current code, because adding a
> goto where there cleanup attribute is already used can be overlooked as
> well.
> 

To be honest, I don't really understand this paragraph.  I think maybe you're
talking about if we declare the variable at the top and forget to initialize it
to NULL?  It leads to an uninitialized variable if we exit the function before
it is initialized.

> Actually there are goto instructions in the function, but at least in
> their current form they are as harmless as useless.

Yep.  Feel free to delete them.

regards,
dan carpenter

