Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B7431618B
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 10:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776248237; cv=pass; b=WtancAfEEIJIfr11YzkQuJepvjkk9vKQ/h2oFPanf/2I0yRIhAREHOiUsRLP8I0YxoxfQwHW26QTbLSSUVeXKtVcNX685KSizrJDFWPwGYSN+snhoONVxTRovXtsciwh41RtJEEusWRFkjhB0QbCAQJl0ekDCBubRj0H5jyy+r0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776248237; c=relaxed/simple;
	bh=GEJRMbT1fnKhLCd2sVYksO5gfbs0YNvAaaLQ8+u9oxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mq70G5/2AEwo4XRp3WCSTqnzOF38SzcIIDq4KZMorQKbMzEy9mjVU9hPxv+8hgVEj3nrEzQhR/470O2IB/5miMF27Cd2StCNDChNDVzF1JVkUneEjFAMlADShKIucO6PPsfasqg1vsWqw74b/Eb/zxAy6lwcMuhiqsSVLNTaZM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=blcYz/3B; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="blcYz/3B"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so47349755e9.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 03:17:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776248234; cv=none;
        d=google.com; s=arc-20240605;
        b=bnmjY60Eq/zvZecufdOwO9dDI0cbM20GvKr82rW3QTCQAsPiZZBZypLXeMkf1jkDAS
         sPalkB/tcAhdOOhcCIvISHBZarjL6T6fqWvBbk5ZE7CimCECzVLM9GtNMGFlb18yFZYR
         a9iFGhDMG9VO0KGqFKbPFj+EuRehxhxbCXk1C6EHmlwaXhYoHPMxbIs/mvdBySvCrJaV
         4O4IeM211FltFXRm+kxMeTduuD+6pRcIeN8WbXQoeir3vWrQmOnglu8lqp30qOrbid5u
         kdYma9m9+L8F5jdD4olsZbCp9SXHiLB2R5fEmTDG4RgmuuAizxVtMBDjo5P28v1nYQbW
         d4/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Xdab+DX+2QKzxNGFb/RStcW513VAKLlMV/prpdYFeAQ=;
        fh=RQo1aimxD4K7HexZVDvDAhuDjNTsQELwN2nNEKIVfpo=;
        b=JM8BHmJ2QRtUZogzs//LTrozkJ0drfF/gP8aMg2axpFGTAYP2QxAiAi9N4E9Psc6n1
         YZ8gGo6GJZT7zOnq5bhAMyqTmpiAYg6r+hFkEGQgmOWLnFBr053qu70skD81tQQPIptk
         HzovCnjaDr5qlBSoE+6D5OsGpxLHhZHZxkkLi+fr2uypjW94tteiF6tqhp5KBusjN0eT
         QutrG/DX86vP0EGb4fnf0SJFX8LBYynDIsFr6WWx8eeAlHuHCWbiYbu9IcLbF0/XAZqn
         x/Fvo4qvFMtkwKeitwOnGKq3jj9Yy6w0egIQ+7z0TXxlkKAON5g/U5AVIOZPtBNUAiim
         NiXQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776248234; x=1776853034; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xdab+DX+2QKzxNGFb/RStcW513VAKLlMV/prpdYFeAQ=;
        b=blcYz/3BYYv5mITFVDhVZotxIKEnlsKk13Vbw/XKkwoc6IO7xIfuIg4FmYHZyi9JuH
         UTqMd960bGXThFQ0PCnvd0QYRdPPsR7ULXmlDf82PL0Be4Y7fSSF1muRoKmNjsaKZQG+
         fW/CAM1Bl6kuTxawHVIHQtvJe3iGbvkrbJTTkTtOEvXZFv6qaKbHKNBCW4FL8VM8AmQ1
         lFhkJmFavGixQ2DHLQ2IX+oawRjoV6CRkt3EZTeX2+BFP4eK+l3mxJWtp38s0QoIxyzA
         0oz08ib2oW/DJW5Olqk6Y0jwZ02wmbRsl7UZHTwwarDJkBbXxVmks8auj4+nibPwxSIx
         4iAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776248234; x=1776853034;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xdab+DX+2QKzxNGFb/RStcW513VAKLlMV/prpdYFeAQ=;
        b=MGwzwZyZwgl6RViPw5zRXSn8iXhAbT/ofG3iQ3OJW5MuvrwoneG/uaxTWdW3s+tQUK
         5vt4mDJRJI9Gq2ILE/tgXHGH/7R11FsrE/zmjgfWzD4yc0O+lYSTYA7WbtgNDUsLkXo4
         n8B9PiXhhRFa1I8fFUB8jml8EI45HHYEc9jllZUDsYIMrqjTA2Y8t1c2lSVr4epPAG+X
         KOrOYLV3tFkyYhlJHJo9s3rMAhBPrgei8zg+TiouzSFhaxF4AQ3cddJiMQcyfP2YDh8o
         xYHrZYQFxIW6n3UOq984GUW/xLb9JNaBYY78CuRuCi42V2ZLwvMWRjfGMu/rhW31/f3m
         QmBg==
X-Forwarded-Encrypted: i=1; AFNElJ9BRVFzDH5eg40y8kjPIMNvBJmQ8Xu3ATv7ao8HgvUOrj2GEzybev+V+S1n7IRcuTWpTlLQbfyTCg6Zawar@lists.linux.dev
X-Gm-Message-State: AOJu0YzbRXEwVqWtPhuJT06rTg4q0sdUvb6d6UfG5NsusSts6yum1kmx
	XjPnXJNOuNthnNAmzca0Fv8UzgmcdabQWC8kOy4NN9lk9Ka3MFmqfcGYjztaUq3fnWAsHY1ynec
	HvTbCvryTF9AmyG+KpgKKGukpnwwFfsY=
X-Gm-Gg: AeBDiev0PpiGUWKjO4AJ2as64kCWJJtmuXBEtXg15EKwKIC9Nmrp5LP8HMTGu/C1XOg
	5iAzTiS0BjmgKSeHSFXJr5bAIcH2A4DWyFHpDbRtQAZncYFrt1GK1PTV+UTuUQN2ZxE0nXji5f7
	L8Hv06e/agDTUgpBqOpr/cFurRjclqxKpIshV0MjDt3NcCox1G5DoNfASWXXzoaJrvxaUrgL7Aw
	VZ7n059JzMgKhQNhAWGUXAi3f8w6l0s2y/F6xRouvCDkYWwKozUTD5F2vu3tqIeW42V8iS/lr7w
	lueWl/uP4aEmRaL5m7dk7pTUIzHEpcv3slFuFqp2l1NRyvks74DjlhF3M09d2WSnV9gp4NlWQMG
	iU0Wgfy9QLhbOqFDNLyACJu0fWrSRXDG++f+QYwNNQ8DVyqC/Rbi0tOEN/Drld6BeZJj1EXaZ2j
	No1o3gK3VAYtQ71PNu
X-Received: by 2002:a05:600d:1:b0:488:8bdd:cfcc with SMTP id
 5b1f17b1804b1-488d6772785mr260505095e9.0.1776248234123; Wed, 15 Apr 2026
 03:17:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260415080812.1284-1-joshua.crofts1@gmail.com>
 <20260415080812.1284-2-joshua.crofts1@gmail.com> <ad9SzwJDwRNldv_z@ashevche-desk.local>
 <CALoEA-xy6WApV+ZUavnEipTKiAezYkXMwiE++TjtHuxkVdR1mw@mail.gmail.com>
 <ad9jThxf6PINFFmo@ashevche-desk.local> <ad9jtH1YgA6N6FYg@ashevche-desk.local>
In-Reply-To: <ad9jtH1YgA6N6FYg@ashevche-desk.local>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Wed, 15 Apr 2026 12:17:13 +0200
X-Gm-Features: AQROBzD-afV1ydOejveQ92FWSZHqehBRAG1Eprp9p5RAnyrkqn2RCy5sBp2paEI
Message-ID: <CALoEA-xopdHNGtBJQk1_cZZ823qu1_8EM5GR2tB+RdYyuWpWEg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] iio: frequency: ad9832: remove kernel.h proxy header.
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, 
	gregkh@linuxfoundation.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Apr 2026 at 12:08, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
> Ah, all of them have the first one an AI... Perhaps you are right.

Therefore, should I send a v5 amending the period and <linux/*> header fix?

-- 
Kind regards

CJD
