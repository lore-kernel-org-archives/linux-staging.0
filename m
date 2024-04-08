Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1761D558
	for <linux-staging@lists.linux.dev>; Mon,  8 Apr 2024 06:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712558127; cv=none; b=uP6vHSDRofTopEWdjGRZokXO8pJuQXMf+9NbyNgkHKCa1quFvmHSDmDr13GFuTS7148UwYJ07rx0UUtPxN5V1DCoxx0IMNebZFBMmbxXtxTTPKk932ZztBsAM66E1qhBCdxDCsdBZLvWLMEAidop6NE6L1201MnxbMSXb5eExxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712558127; c=relaxed/simple;
	bh=/a3dQF9z2JQVz9cciOeh+y8wRKyVwnn+yO0CdzhrgHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WchaYv7HNSuPWE+EancYgPp5nDnrZYSEtFNa5RteXY71J8O1jK1AB6IEIOI2R1TDyRsL6X0ymp6uvRuCkJQcWgjJmGb+15vNz3T2LDTnAWBLWnFuY2RE6QkA0GhgBenER/9xNTrJBC939rDeyYoKer0Q3E1PpHqgq+/k8G8KWVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YzGMJu0w; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YzGMJu0w"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a51d05c50b2so98475966b.0
        for <linux-staging@lists.linux.dev>; Sun, 07 Apr 2024 23:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712558124; x=1713162924; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FgLtq4Q2TlcP1vQLZpHaRdv1skB8tG59UvbmyPM0V6M=;
        b=YzGMJu0wZYzP0pz+4xhSqZaxrdENqCQXTAZ+6v4WvGH+wL6ahrmsTgRDcP7KKFcKTO
         nvcSRHbZHRtfxvQ7b21V3SVTuGJSnI8f1qPIxKySm0Kup7peXSXeGNqWq2j4ON2hp6/B
         mzNSjwapQweJiCW9PNquYU6SWoOqEw4QFXPtHecUjY6bJXM48RVT3aY/BfWkGmWZ+ASg
         1elKCNwTaRyqFIy3UkLwTRHIxu2pW8FlgrOwJ9i++Nuv6ic+YI/k1qPL/TvLCENDOOgE
         OOCnM6RHVz5nLid92oKiuWnyRXdiop70X4X8tR6aV4dINu3LN/mTCawS/qPaJdJOYGeX
         QN9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712558124; x=1713162924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FgLtq4Q2TlcP1vQLZpHaRdv1skB8tG59UvbmyPM0V6M=;
        b=BIo97itjh5ENOdSbeqUceECygrFEHtgS9X/YbgrzVChPSjPv0Aj2WM3IrE5p7pNmEE
         8BnflDJdkCMTvgSz8aIJLoMS6usQA35+rHjTtZsnEIQCLvj9GIBmPylsRlY1Lzsvih+k
         WhkfpdwnO63MnRahNWtMZ6Ew0U19PAD0X+AZG3C8p23rmQwtyZguXxFBMXrtfqWGoPG8
         XF/oofVY0bOc2RVfsLRG8Q+hsCFL+23SO6bVD2ml44gjr3kTVV9d2nyVFtcx7yHozNYa
         gcaGM255k3qYNQYy+PLpn6/yUdvcmUownFIGkXpbLcUmc/iDGz1YgvQUZehiRcgp7gxR
         VJCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXee+u+IYZDDrHUqXHBuicn8uDT2IxpCKWjFTbpVZi201rfQgtxbxwFao65h7x2gJdPbAMpU7y0GzEIRQqwUGKEKk6G0+xKOdGNXJFmmw==
X-Gm-Message-State: AOJu0YyK7f5LvhaZW4voSvcu5GXRYJMbgq/SbNOme8oIv7etJogoFl4X
	wHIvqYKqI1fzOt/QvM3HlOwweAwYI384cAUY04Uz07EYWiMUgecELBAZJZU/2/wfeys8gfyflaO
	3
X-Google-Smtp-Source: AGHT+IF4EKTTmquAMoLVkOL3W63bmhNdWh38zIYl5ZaMdc7DqN4H52hPc5f4R3mNWxMKNOJbOZxeIw==
X-Received: by 2002:a17:906:3752:b0:a4e:23a1:9ede with SMTP id e18-20020a170906375200b00a4e23a19edemr5078782ejc.36.1712558123980;
        Sun, 07 Apr 2024 23:35:23 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id i21-20020a170906a29500b00a51a2711177sm4054925ejz.13.2024.04.07.23.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 23:35:23 -0700 (PDT)
Date: Mon, 8 Apr 2024 09:35:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jackson Chui <jacksonchui.qwerty@gmail.com>
Cc: Alex Elder <elder@ieee.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: Clear up precedence for gcam logging
 macros
Message-ID: <e037e303-47b3-4758-914c-980ebe88d450@moroto.mountain>
References: <20240404001627.94858-1-jacksonchui.qwerty@gmail.com>
 <658e1f40-d1eb-4ba7-9ba3-0aa05a1ed06e@ieee.org>
 <ZhBrff8qkkmum4wc@jc-ubuntu-dev-korn-1>
 <5eb3afe2-da7b-4f98-aac2-bff529a02cea@moroto.mountain>
 <5e1c5156-d906-4473-970b-bff71e4dcd96@ieee.org>
 <ZhHOKkqVIdsuZ-4Q@mba15m2.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZhHOKkqVIdsuZ-4Q@mba15m2.local>

On Sat, Apr 06, 2024 at 06:35:22PM -0400, Jackson Chui wrote:
> > 					-Alex
> 
> Dan, Alex I think both of you are spot on.
> 
> I like the suggestion of adding 'gcam_dev()' as an accessor
> function and directly calling to 'dev_*'. I'm busy this weekend
> but will send out a new patch with this change next week.

Nah, don't bother with adding the gcam_dev() function.  Like Alex says,
it's only 4 characters shorter.  Just get rid of the macros and do:

                dev_err(&gcam->bundle->dev,
                        "Unsupported unsolicited event: %u\n", op->type);

regards,
dan carpenter

