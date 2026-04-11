Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C101723E33D
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 18:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775932732; cv=none; b=RH0huy4j+kAcxm14j1JSMVBNaBaKrQrtzvsLRSJT5WYdg/WaHjKs2a+d7LzcM+wmChOtHRrWJhDXwXyT6cthiLWo4UBLIrPeHmDpNcSSo1orUK4ZvP8cxYDfNX1UJOLcGSSUQi7j/IeKrPyxLfcF7s/08R8W+oidUW4wo2nmLCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775932732; c=relaxed/simple;
	bh=G32kimuHQulcIRtvbX70KIJe9/8qb/w1NZjaE6M/Yag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gmuELtFj+LeppiDdoXm82HNyKEC4dgzbN/MxwzdmruMSMzOmLGKBnjo/kojW5ruZGJ0DVm+gF9H2pxYF9sWHTbco6En2u5e8wKxXLolSlsYWl5Kg/OZDrsNlW+mQbyWwTJtKwSpMYYdCkTjZB5zP+YCx8REUuxkDcv12w2jT0y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=klZmoGZ7; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="klZmoGZ7"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7d86eb7c854so1572452a34.3
        for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 11:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775932730; x=1776537530; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IvRlNKmzBLvAqyEhUGRKAEPOoty+E4bUWcZT3jLP1DY=;
        b=klZmoGZ72GQkYNxk8Ty1wzRTR647KYkfUyrp+xC5v2DPW8R5OC3OK8IaRmhtcDnNKt
         d1SByCTLC2+cP+jA0WKQBg+iHNccEF3xPH7hFFG+1pW7IfHU7Uiix0vrivIhK0XRJeAa
         56OJs3q0c5pLowVqz4SiiVmsIUC6OoffwnFm+Hbo4V310vkDlEBasCYGKfzFZFsr+Xii
         VWV67+nP7fB1O38JJAInXn+EH4B5GUcgs9Lk5UoAPFC7lvCrGXqSUwX81R0tPWRvqGeT
         ZIxjkkhKzDztV9ZKzD65GXedjeM95i2N3doW+3jcAolRZY3er08xKGLihvUvBHO8XN2J
         DhLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775932730; x=1776537530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvRlNKmzBLvAqyEhUGRKAEPOoty+E4bUWcZT3jLP1DY=;
        b=rjUsFYzSmOoejVi665FsSryrORK9ViNiqesGQuadyeq7Bp2/pmtO8y+6BvJhl30qHX
         UbJ47spi+3e6euQugFYR8XthGtgCth9idx265pzTC2CdVSingXUHC9rueoNnJu8t9RdP
         8Cy2A6m0/JRWaBuIak0avb1/gF1MLiRVVeMz53cYMXalAcYOh1k4YUl4VRvlE0ecOsr9
         XFhrsRWX0gnWhx8zm7gYdH5k8IvBXaap+4xm81DbFY8XVEnIjZVz18hdbqw1ILjpQGNr
         9SVMbRm0fDvFdw5vDji1aewWWUaVe5KaSwofkkBttbGr6QAO2NAViFcva7f1aBGv5SHt
         D3Wg==
X-Forwarded-Encrypted: i=1; AJvYcCVZFLpqeRrirLRUc+jXzQO3WZi+2X+UU0/u9kJQRBMeUoD/A1d/tVeNi3dTR2EBf8oCSBT/F2J93BpCw2ap@lists.linux.dev
X-Gm-Message-State: AOJu0YzpocPfebPaVe3G80jo6NplXHHnBdWv3hMrryF7aEcwuHG+vEFD
	2V0okmVjkBboqS9a4IfjxB3Ckjup/CgI4ctQfnapCDNlnQMi+SCQVknC5+71LGG/eJ0=
X-Gm-Gg: AeBDies0SadsrIlXhVrRpFX01c76e/31FNJWeWQfpsyoz6tJbsMun30LaFjQ4k8+Iol
	aJd+7P2icP1aj6QAzTm9KdZaoIzqKqxtD/Zpb4z+Kl5G60WhteZFBC3CsM2/ntIsnbsslFwxZAb
	zYZB5rRgNpYcDoR7A1+udPLzEKfkJJU18BOUs98ZmG+7VvaSx9wjOMFnErC/sujDzVgRXoOzP3g
	fAtVwoAIxROC9aMJrju85ESkyUxtfKF/fDunHF5zxoDo5GTN7TMvjpgd52WJOz9R9tvYBtfxVS3
	yAG+AvSQUK5mVO+GRTSEOmmMAi9C55pZpmHy0gU/dWf4ax2wtruEeCuh8o9hoR4MOZwRddqqfJ9
	2fQkI5sro6LyF/45qJPLFLPG5ZNzdut2ElABY6UMPmy6mClZuI/piAAlcZaq3JSZ6byCoo4eVPN
	EN2J+FjnSZFdFnraULmUTEp1O9IN/34cdK04tUHxi427JWwS4JQP0/zoiuH3FI06E78xKdBTJvM
	w==
X-Received: by 2002:a05:6820:c086:b0:67e:2fe1:2764 with SMTP id 006d021491bc7-68be7de90femr2387447eaf.36.1775932729767;
        Sat, 11 Apr 2026 11:38:49 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:d2e5:c81c:5b23:fe55? ([2600:8803:e7e4:500:d2e5:c81c:5b23:fe55])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-423ddb20c0fsm4808905fac.11.2026.04.11.11.38.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2026 11:38:48 -0700 (PDT)
Message-ID: <693b0f48-9b2f-4989-89ff-280e3a9e1338@baylibre.com>
Date: Sat, 11 Apr 2026 13:38:46 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v2 2/2] iio: frequency: ad9832: simplify bitwise
 math
To: Joshua Crofts <joshua.crofts1@gmail.com>,
 Dan Carpenter <error27@gmail.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
 gregkh@linuxfoundation.org, nuno.sa@analog.com, andy@kernel.org,
 linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260411085848.75381-1-joshua.crofts1@gmail.com>
 <20260411085848.75381-3-joshua.crofts1@gmail.com>
 <adokoNfP-Ueg4yQ7@stanley.mountain>
 <CALoEA-z0hkOw35D9suEKi61x12fNSSzYem5pecCFj0w_EwLHvA@mail.gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <CALoEA-z0hkOw35D9suEKi61x12fNSSzYem5pecCFj0w_EwLHvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/11/26 5:47 AM, Joshua Crofts wrote:
> On Sat, 11 Apr 2026 at 12:38, Dan Carpenter <error27@gmail.com> wrote:
>>>  static unsigned long ad9832_calc_freqreg(unsigned long mclk, unsigned long fout)
>>>  {
>>> -     unsigned long long freqreg = (u64)fout *
>>> -                                  (u64)((u64)1L << AD9832_FREQ_BITS);
>>> +     u64 freqreg = (u64)fout * BIT_ULL(AD9832_FREQ_BITS)i;
>>                                                            ^
>> This extra i char is something I really dread as a vim user.  :P
> 
> Damn, that's embarrassing... Should I wait 24 hours before submitting a fix
> even if it's this trivial? Thanks.
> 

The risk of not waiting though is now you have a review tag on v2
and you've already sent a v3 without it.
