Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA713D6CAD
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 09:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777369716; cv=none; b=rWO5ktVfqJkclswyz3Q5r/DQvZiv/XtkgiXFevPTagzSOOkiDo+lSkke53IWQ6Wo0T/pltpEKfFfMykioxTh2OwqRRi7nlBaejEn80lKOPh9KAk7YHnDX6gFT7QkrTCjc8mAo5rcbIXdFcwaIbE9MU7ouE9ox4mHh8fUVeIRKqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777369716; c=relaxed/simple;
	bh=W8HGzQJFGOvOk1Wnj506pBzw5Rf/xaX4Wio8E6icdxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KIKY9HZDT2fIIIhQIwH31k6qfYPmMP1bVfaZc4ZzMfualC8jiDRWIY/pJFeiXEJgPmheSUGFyPK0JjjAi7HLGMv03SNKPF0jMh4+RxWRWZmzGEWZCZ59AGZiZfTzzcKBhrcwl13qXrt8b1Lk5SovFh/Gdzng/tJQJwsgBe1Wgsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7OnOwwn; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7OnOwwn"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43d6fbd0954so8557473f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 02:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777369713; x=1777974513; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qO9AMiD4sJRw4hR2b81vFZ+0BepqwH69J84Nu4gaIE4=;
        b=B7OnOwwn2KmK1I+7kIL/mjBb2RwwcvjS5oa/daKAAaUkykN0rHyVOEa7aLrYnY+YVd
         vliCFer/d7mGK+6qEg1yEw6jqdSNY1Z7zJI99XcmhTRV8Ay0f90O9OoSi43ZR4bOwU88
         jRPqQNGPXKtLQKIsiOAdtsFskN5FnaIGbn6omvwEhoW5kjHUQA3wsWEtITG3xJj5WbSL
         LK8adBOPPj2nJh3z4gc/0IGsIkQPa/OYs8YlXSvDPzA5n77Z1F5bLFQlnruNZwk+4yj/
         ZoG7KqJM/zf0si/NUjPaTWQboLL7C4yhEnrD7IDIBSgJQaBUCIje/EwEE66u/HRblxUy
         1+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777369713; x=1777974513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qO9AMiD4sJRw4hR2b81vFZ+0BepqwH69J84Nu4gaIE4=;
        b=hJIrqX5ocFIB1XX2C0RMNoTzOlskIYh1AUXdIDLkmGxB4I9k+Zs5rhDi2xFv01T+BV
         lzLipnbADE7JukGUDwye4xDF65Zg2r8vNg5VTiPCllMhwc4BZFDksL9aCq5yeASJNlbI
         sX8kksGY/JSP5tkcEW0TIqbiGdi0ixZn5cDtruoelLbMnUdlzSoGJpWeA2F38NFUDRfx
         bIJWCTHoc7vnnt/MK8ggkhGrpkQVyn61bFn8D0o3bTfoUh51Z8k0HbAk18+1Pt4eti2+
         q0d0xCSxJ466Y9A8a5pSaPrQRLStCXmMTvF1AwMncz87T1t3ZH1hTqoI806CP7fQ+6Cp
         nOiw==
X-Forwarded-Encrypted: i=1; AFNElJ/+ZindMH/UqKkVJBCas3HvtqLcu+A5JGIFo0CJ8QBZUIgyyRlkJpBSyhFtBjVAynpzJW7vszJEIvBrpTPY@lists.linux.dev
X-Gm-Message-State: AOJu0YwyngzVn95XrLj6Kf7DmV5Sfz08H0wGBLvXbMIi/fJRS0pClmBx
	0IRXhirhi3BvvnoRF7sR/2ks8l9mZNfufBq1USI5l66BmKRe6agwQ67cNpQn5w==
X-Gm-Gg: AeBDietPs6zfv54WiXC0tOcLJkcJEK8dsMQlYc+yveUbNX+km5c0/T7/AfS0eCn7E4x
	TyqTMYyUECWC9223XHBBxwwcgEjrJ9W3Pxd5DaHwbvWQ5sK7zSAUhz9mNjLSA+ofihYkIoOQyNN
	Rrp82mK+G7OQ/wSTfA090LO4IFGh2BWHvVkwxfrWOkjPP1I+5MUyuJ7yfoa9h3N0BSFvEktSeyJ
	sP+GptePQCb7Hwbbyoqo5rE36c2rsafa0T8m/3sTLozaCfDy1LlyCLA2iOU6FswXNVgBLg7UbgQ
	11pA+Pp8G9YB+8wao9aZBDphYpSZGOQzscAWecWV2yFNMx9es6eHjm94RsMmqIoBCDUCootH9zq
	hV7/zSOCz5n+qKjJxZGU0tme6nWQiTqytdPi+Zn3sWbMdC8N+YKerYA25J0f1wC1Gq45Ih8ITsM
	orCQHnKxuoZolfRKmZKXsG4Semv8+0zg==
X-Received: by 2002:a05:6000:2212:b0:43b:8f4e:27f8 with SMTP id ffacd0b85a97d-446481b01e4mr4140361f8f.12.1777369713097;
        Tue, 28 Apr 2026 02:48:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463fa890a6sm4622204f8f.30.2026.04.28.02.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 02:48:32 -0700 (PDT)
Date: Tue, 28 Apr 2026 12:48:29 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/4] staging: octeon: refactor to per-device state and
 pass platform_device
Message-ID: <afCCbbPAcwtY3IS-@stanley.mountain>
References: <20260427151556.91153-1-ayushmukkanwar@gmail.com>
 <20260427151556.91153-5-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427151556.91153-5-ayushmukkanwar@gmail.com>

On Mon, Apr 27, 2026 at 08:45:55PM +0530, Ayush Mukkanwar wrote:
> Move the static oct_rx_group array from ethernet-rx.c into the
> octeon_ethernet_platform structure to associate receive group state
> with the platform device.

How is this related to logging?

> Pass struct platform_device instead of
> struct device through the ethernet-mem and ethernet-rx call chains,
> extracting &pdev->dev only at the point of use in dev_warn() calls.

You're undoing something that you did in patch 1.  Just do it
correctly the first time instead of doing it and the fixing it
in the same patchset.

> 
> Move struct oct_rx_group and struct octeon_ethernet_platform
> definitions into octeon-ethernet.h so they are shared across
> compilation units.
>

Btw, here:

> +	struct octeon_ethernet_platform *plt = platform_get_drvdata(pdev);

Could you name it "plat" instead of "plt"?  Generally "plt" is an
acronym for something else.  Procedure Linkage Table or
Phy LED Trigger.  There are a couple other meanings.

regards,
dan carpenter

