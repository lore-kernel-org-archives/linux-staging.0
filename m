Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C648D150983
	for <linux-staging@lists.linux.dev>; Wed, 27 Mar 2024 19:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711566810; cv=none; b=Ksj/rTlK2g/HFcSzu5gc6uzveEF6hANHVC0HUveAjIhDwA4bSmmZ90iEN49dGIuPuPPNX6enyrwv4qsnDWpimAFLMeRURPrH16xaaBBDAnXXPmdyFz+JDpcS53UNXF7pJYsBHZRVrobqXJgIfU5uwVShPWa1L01MS1byo+gsqu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711566810; c=relaxed/simple;
	bh=AOr5jmDe+7IUVT1JcnkAgfe0iSFoQ6Rm98g8VbVUXJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FdKAuVtHu26WQQLlqVmv+gYBG0hYO76eE70PWdx5is4HzC7JAXrTpTckBndr7/52/d9+nAUThZCfd5axNcGLRpVOt7iukXCnCQlvv67RC7c30Psa2+4cqF8+IYPMxXpHogpMseWknFDWChpcu8vykKRhiNHaL5ZABHALR9Cg1qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JeAB2BfS; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JeAB2BfS"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3c3ae53f662so111401b6e.3
        for <linux-staging@lists.linux.dev>; Wed, 27 Mar 2024 12:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711566808; x=1712171608; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ApXXhv3UWIeELY0teQK//GdogJ+SWaFmwt8VGFJJU9o=;
        b=JeAB2BfSpFYZT5p8dVZqLWcGWzSepnSAOtEcFBTK99OOti7XulBTiJOHht3v5P5N3E
         qele4djOwgXnNdjDWQeB4MIyQPzfqReHWLbDkZ9kKmjAQa5AmeVHPRX76CKwwBXzvsC+
         l5Rr057JiiiCMSQqblhWjkw/2v9wfNh70ETkt0GHxc4qedWr7n7eXYxS6Fihi9eDABRI
         EV9KYPsmsukeVH7L7RSEgKYjQojMhqC1NqhjkVu2HvgQpVB+BAE3HsVgMosKvedjPmgc
         E++zcfvIzvCiZT9qsO2Xt9ufHCtlYyaMRKlYh4UIGZNBrqxntYTwlNNFONSGEV5RyeO3
         OebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711566808; x=1712171608;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ApXXhv3UWIeELY0teQK//GdogJ+SWaFmwt8VGFJJU9o=;
        b=jLWrwNqsAjuJKXTZvMbmDOC2YAv2OM4qByFLP7EvAb7HDg9jUiTnXJVia0uHQm0UXW
         bsMrlEw/z2ZAOsuVJNOYcBQZtHmXPqNMF9tgL6l/tPhcOWiGqTK68cz0aE5MNrz8sZNv
         WTpZoqtY+8FuGOn9BrFo0UA7xWtr7wuo5mpcw+qe4aftnq0Yvk6HJDBgurYkbnlRVd4m
         Q0Up796Gfn4TGy4OCJedc4+t6Vo11dwJzxJpBomerbHf6kED0IGpvrMb6tjcxtW5Z/4Z
         lczWJWgQzaq/VG0CzUriyoEhaXqKuRs1B/s/64fGu8wyqQZmVP3gXEDLShSo0yxsAP6V
         /mhA==
X-Forwarded-Encrypted: i=1; AJvYcCWPblOeaabK/bglO1UD/Y90DyFUhiXiDvAdZEHoO+6/9DdExfpCyNND003MjV/Dl2Z5lEPxLCIJfyEiZXVTfshIF0+fgXc6he+GF7i8Hw==
X-Gm-Message-State: AOJu0YxkUO55xHkz74zu2aVeDSCULMUmyIVzaPypy4YhVmWmEJFEh+gz
	BnPpPNXtWEPJxFAb9ofPxrYlbzKDgdPdC2eeFVeL3/FWGWzR70xR
X-Google-Smtp-Source: AGHT+IF+UlL5cdcNCyTgQlp270nnJnrfc5qgK3T7ZwYqc54hifRqCipV//l+Fc1hXqndAT6VS1TCGw==
X-Received: by 2002:a05:6808:8fc:b0:3c3:d48e:ca9a with SMTP id d28-20020a05680808fc00b003c3d48eca9amr761410oic.51.1711566807948;
        Wed, 27 Mar 2024 12:13:27 -0700 (PDT)
Received: from ?IPV6:2a06:c701:736b:f200:f38a:32d3:e6f6:959? ([2a06:c701:736b:f200:f38a:32d3:e6f6:959])
        by smtp.gmail.com with ESMTPSA id gd14-20020a05622a5c0e00b0042f21fe66f7sm5071744qtb.73.2024.03.27.12.13.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 12:13:27 -0700 (PDT)
Message-ID: <c5c3fe31-2c68-4eec-9f4a-0c0bc8428461@gmail.com>
Date: Wed, 27 Mar 2024 21:13:24 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] staging: pi433: Fix includes, comments & macros.
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: gregkh@linuxfoundation.org, elder@linaro.org, robh@kernel.org,
 parthiban.veerasooran@microchip.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240327063156.96307-1-ikobh7@gmail.com>
 <ZgQavKRkO0gt6Qdt@smile.fi.intel.com>
Content-Language: en-US
From: Shahar Avidar <ikobh7@gmail.com>
In-Reply-To: <ZgQavKRkO0gt6Qdt@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/03/2024 15:10, Andy Shevchenko wrote:
> It's your responsibility to carry on the given tags for unchanged patches.
> I believe I gave a tag to two out of three patches.

Sure.
Thank you again for your time.
V3 was just sent with the reviewed-by tag.

-- 
Regards,

Shahar

