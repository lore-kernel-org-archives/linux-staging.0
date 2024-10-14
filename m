Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B075415B546
	for <linux-staging@lists.linux.dev>; Mon, 14 Oct 2024 10:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728900682; cv=none; b=ByRGc52UPr1+odKXTm36ksJryVHVhXcJ3uzK7dDO6oPvQf4Eqoyw7i9rwKx7imFE/z7/Z2HdeBbKkhVizQMe9+R0xZtpo/amNra5FAUaeWMVIePGtXjESR7moh2OB0cZVB2NokzHAdJR955Nzz3pijr9+vrzxn3a3Co639cejJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728900682; c=relaxed/simple;
	bh=45f5JP3bQWFt0F2u2LUbZ1L8HR/D6tqr+/MlO0jRbGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S6DPc9xrB4FWERT22jusJSI8duMx+s57eMWwhDotRAgbX627AKMq3oTGQoBvH/Pbp8NZ12ARcV4oAPpIajvpfMiqjiHST6qqtQtOgNyrYtNl25EkEJGzS0+ejKqS96w0PrUXJPNbWOVKIRQ+bw6zC557GENz98XaEwG3oNJQJoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XDLQfnnE; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XDLQfnnE"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a99543ab209so613142766b.2
        for <linux-staging@lists.linux.dev>; Mon, 14 Oct 2024 03:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728900679; x=1729505479; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I/LXd4VHO1p1BbKAcgczo+qxpSILM19q0yd+EHjEU8Q=;
        b=XDLQfnnEHTV0ubHjgQTGGUxIXk3hHb1cK1CtMoYipXh6elcGPWdtf+4MHCbI3exzDq
         FtOrZjg2YGBCOuUkq7XapJMeVaBWXjVSQELnWx/ue6jQ6g/wCp7AsXD9jZHJz6eSp0Uq
         ygKnFxk6K2bnf6PuBR4ybiDKb6GLT5Fr0AHowccvliJ84UGfF/xNmpFrRzTbg7UdnBIl
         znZSg7CQAL93Ed9WW7CHtCeIG9DokZuXH0syZ9PCvHnD5TXMLae35ybVJsRDJ5MMQof4
         YTbzuaKXBOSm3IgYs90Jw7u4DdGvjzozx0SV9PNiAiyxXDMz9Hhv+DEDXNXEck8EzK/1
         G/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728900679; x=1729505479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/LXd4VHO1p1BbKAcgczo+qxpSILM19q0yd+EHjEU8Q=;
        b=gggp09LAX+NiPMB9K2R1EMlyjNLSzHzQ5sroPgvmGrReu7ekmYF5VE7vesmT5MH92P
         pN2jWKUy/CVTd87vCoye1dP193DPFgVdjUSwPttZT1ihjSkVhHvCdEC5DKo7RMxjMrJE
         rflK0Z3n2PmKT+vAz29nT/PIItSHGuZrjS+RlBfLPQR6DTB8/kRI9ryuHdb8oCAGhCIp
         fMKik6S9DhNOO+v1JxX5dwdwkw+3/BWPyVPToHw9UKA0FVC+/nB6VjAuyrEpSxzOealZ
         Mi3U51W6YFfjb50sBMW8vkycIlIrfuIeKgpsa2A7gjcXTyHrr8uqVMNxPJT4CvnanvtB
         qAJw==
X-Forwarded-Encrypted: i=1; AJvYcCV3eXRglrSDCN7d1bg65wPypCfl2PujFv7tWsapmbnEofe51wLmtCDEWRbAzLxSN58Fw13ztQaClexMO8E2@lists.linux.dev
X-Gm-Message-State: AOJu0Yxg/sBMmXbOH4C3gMkc2GeLrE+SoVHS/kcDNYQFdWv1DO1ZkYoq
	PE2rnW/q0Il0OFA5Yk+vWAdw6R82rDtsDQUd+HnpqbJqfW2atmuAwaaBGhXufsk=
X-Google-Smtp-Source: AGHT+IETPBBETQDag5kjsGc5Ue8CZM6ASCuWmb5sR/j8wYmAJr0+kZOnRg/kDq19oUGmuUzvrlzu2A==
X-Received: by 2002:a17:907:60d3:b0:a9a:1796:30d0 with SMTP id a640c23a62f3a-a9a179635dfmr119185266b.62.1728900679059;
        Mon, 14 Oct 2024 03:11:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99e57f763bsm337884566b.85.2024.10.14.03.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 03:11:18 -0700 (PDT)
Date: Mon, 14 Oct 2024 13:11:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	kernel-list@raspberrypi.com, Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH v3 0/2] staging: staging: vchiq_arm: Two memory leak fixes
Message-ID: <3ec84f12-15b5-40c4-ba6d-137371d755d8@stanley.mountain>
References: <20241014100624.104987-1-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014100624.104987-1-umang.jain@ideasonboard.com>

On Mon, Oct 14, 2024 at 03:36:22PM +0530, Umang Jain wrote:
> Two memory leaks were identified and this series addresses those leaks.
> 
> Changes in v3:
> - Add Fixes tag to 1/2 as well.
>   (Suggestion by Dan Carpenter)

Thanks.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

