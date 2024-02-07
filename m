Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83565208D4
	for <linux-staging@lists.linux.dev>; Wed,  7 Feb 2024 11:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707306097; cv=none; b=WEmOeOarPDeEsD7R1iiex03KA+LXJyioy0xwYg0TukvWEEzucrJPV03MJeldP6MXgV+tKHmA9IVsRTmn0Q8JJ87xR7wwdugCVYNRqXfQHBegnGVpDNBg6RCCmmsGO3x32EYCAfrejbaKJaXr4FCMUqlLC0syTKxmjB9JZjcLG64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707306097; c=relaxed/simple;
	bh=DSEGhs8t89Wdn2lcJ90v4XZSTRSPwqMTcFcLFnVX0eE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WMIWToXeUSCNYOT0HuXaE66EkSP4v8UE96zrJQCgGMRhkNpBUKXXGzDNjB/n1+By+W5PDKSzyg6XxKWIF1GXnpS7epXC4O6lrMbNpE/eiNamT2aRj/GsBKnPH2+lGiztvfUfziNA9fu+VQFnYmjH8aN126scR4WEOu/vokBYORQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SsHMNfUn; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SsHMNfUn"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a26f73732c5so74468766b.3
        for <linux-staging@lists.linux.dev>; Wed, 07 Feb 2024 03:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707306094; x=1707910894; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FL3Nd1dBR3qVr0CHzLN14MZA1GoEXteTVfY++m2CnRQ=;
        b=SsHMNfUnVXfkRedkHocmu6C3M5O+iBYyaS/Bxewba91bNL13uAHzebFUuwGfKvRNgg
         PyFhJdiZw91D6Sepvd9GSYsRfNn/hWbLYZfBIyBN2r/m8xY2YUOtjVuFNNbfXeJpT7yS
         0wcxJWnr8ZNjljsv2loOFeBtsCtD8urVptm+PN6MheoDDjfkiAk8nrpyd3Hnv0a3w9wr
         l0FXimew0jpPPAVAiCsGeOiWxHrjZfSwB9mkDzlZe83U3W8SdrqxcNCldGYMnJ3YC3at
         OlR7TZFZRBNoyOFPeYb01bgbUy++cR8klHTfXCdukcLVnZR0MS1mLwtHl/a3zdJK+WVz
         Pj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707306094; x=1707910894;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FL3Nd1dBR3qVr0CHzLN14MZA1GoEXteTVfY++m2CnRQ=;
        b=cb0uUD2vruK2uej7QUYANpjpVo7Hl+LCW7l5dIsCQ+sdFw+zInOnw1Egna3xNdBqoC
         QTwkSiWlsj0vmM6g4/poj+0JGVoudLc8K8dAPDaUAdc7ZP7M9gD5pSYucs8r0uHPYuFA
         DDEyWczkEPQPudUW2oQmrii0FBw4c1VKId5ROWEAH/SUQh6y8E4xXBb/pAPoJQpa8/YG
         hyC588R55iVQE+S93f+S1Jru00a4NjMmJ1Sjps/eaYvhaUStRThLRQbTgTPkT+bmrEdG
         menzV37T9QbIGUz9SRajTS4gl35rlqPJ3w+4ygfN3Z+Lyz2Lrgeur6tz9p+O/D/oQi5H
         /bpA==
X-Gm-Message-State: AOJu0YzQ0bqxeDDEhUidCUSTSRh6ZPiqtGmAR6Q2oBw6h6ZCi21FeYy/
	g2ltfszEzg21WNZF2xckoRVNx39lhc3iM738Pb7uvQe/NLUfR1ggmIJI/37fohk=
X-Google-Smtp-Source: AGHT+IFNWaPuRkjzOYD4a/taM4lEjaWAuh/+EnUb1hQh75fo50QW325Fjq/rKO3VEl0kkL6PzrQBwg==
X-Received: by 2002:a17:906:81a:b0:a36:8711:f7b6 with SMTP id e26-20020a170906081a00b00a368711f7b6mr4240520ejd.34.1707306093690;
        Wed, 07 Feb 2024 03:41:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWWGh1g4tYG8YziMu+0MDmUirKCnk8R0cuPEipPxa2rQp7fWSiuyuuRRa6ZzjzjiHoBdFDroaFOuzFRbvs4BB+l2pRmYydz7gJyyO9GZ7A9IxetoexL70Fqm8/6HgnPPh5UTONOkihXP+9xszWjM76im7beCX/mGolvJoBM/qPTFYReXZRm
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id y22-20020a17090668d600b00a38291a7f01sm668319ejr.170.2024.02.07.03.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 03:41:33 -0800 (PST)
Date: Wed, 7 Feb 2024 14:41:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ahmet Sezgin Duran <sezgin.duran@linux.org.tr>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: remove redundant braces from single
 line if-else blocks
Message-ID: <c682509c-40d3-4db2-b9e4-c563e6239f21@moroto.mountain>
References: <b97e1f8927d81b9b72cdea7a30f300b35854c38d.camel@linux.org.tr>
 <2024020757-desktop-atlantic-749e@gregkh>
 <54d63b6edc5421a5be2e552b03592eca5cf85b2e.camel@linux.org.tr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54d63b6edc5421a5be2e552b03592eca5cf85b2e.camel@linux.org.tr>

On Wed, Feb 07, 2024 at 02:13:14PM +0300, Ahmet Sezgin Duran wrote:
> > Why is all of this here in the changelog body?
> > 
> > Please fix up and send a v2.
> > 
> > thanks,
> > 
> > greg k-h
> 
> Sorry, I forgot to remove those before sending.
> 
> Should I send a v2, even though Michael Straube has already sent a patch?
> (didn't know)

No, don't bother.  Patches are merged first come first serve.  Michael's
patch will get merged first.

regards,
dan carpenter

