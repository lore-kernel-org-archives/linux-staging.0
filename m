Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485A827A924
	for <linux-staging@lists.linux.dev>; Mon, 14 Apr 2025 15:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642971; cv=none; b=fHkOXnsPRRp8DTXyg9Uxz1UyQbgmqIfAjwxP/etpztgXEE/HZyMTLA83j5VA7CXqry/lH3w8EYD5AsHR/uSJeAcx5QfOnYSkKlExNcCgl5rI215iJJBemWx9xVuDdOPkWeXFaPWs2GGQmKE7VysinPOsODG+mcW6hufuarIpolY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642971; c=relaxed/simple;
	bh=4k/xof5OQp7PIVTQYNQCGur66hRPvIJqafxT6KmwVEo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=R5ZNiO4KE9n/QOPyCG0O+POTOkjSe+geGlG9OewKakxT7XkvUxoLMxhC30e1swdxIM+xIEX06VRN3AVpd2LK5RwAvr3s7u0RLqvXVjQ2tMQ9qfKQzW8Twy+x47pNI9hsCBf2uanU6pXNCsaT/vlcu1dT3gEcRyPNnIIPhrYfwAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cUfVcbe1; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cUfVcbe1"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-60400013960so1026412eaf.0
        for <linux-staging@lists.linux.dev>; Mon, 14 Apr 2025 08:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744642968; x=1745247768; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sS4Zjvq3sJ+eWVkmWgf8OvoOhv08fRRBCISkBnmL1FM=;
        b=cUfVcbe1YnBN0ELELefL4m6p3wcbz/mkaFzGNpQAu28MtfBcKkfB7z57nl+3hnE7kJ
         vVlbHmTvp8FnFH0/4OlUsC51IsdA1FRRU2beT5YQ7UzPq/mZGkKt7sKbaBecBTvtRUHk
         ki8j7aE9cCWAqG9DsRYY0qwLK3i38j/dIFf5W+AoMYNY7grvabORulbTbG7//ycQelev
         dzee6gG9pMwK9Hj0FJh3syBd+BBC7W9TzsPO067slw6qZjbIMnj3D0Mebgk5veIyNcUK
         4zwxUrEXYvQjn9NaTIeudvUamvVQF/WCyELh3VAWa/uDNEVgFjUFD2vpkqgPCmOb8ZHr
         owAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642968; x=1745247768;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sS4Zjvq3sJ+eWVkmWgf8OvoOhv08fRRBCISkBnmL1FM=;
        b=ZMEVs21DKaM4pakCikuxRvmLTb2w3CGykzefSEDZjIZl/kRkkphjiEU1jeffyiN5/A
         PwdnfdoHyWNhBfBLfn1yaERCyjeAin/DfNLtFI3C6AC8CIJhK003cxVMGNjnFUG2s1Ur
         yrOc62pJe0fsEUKPOLSG/J6RJkqmTwsuV5UO2rP1RKHNec5/8ytlj0L1fTOGLFCtVzFG
         vzWpMHqyejscdoUiP0FWCf/b6LVDz++bISu5sgZ7u6MOXxEJ+PZSWdWwl4B0f2u4B358
         iuvgmlMqf3TrIAFxVltBu07keaXPv01bSMhW3NbGMEE6Uu1GvxIkhjXN56HWeFuyIb6A
         vMSg==
X-Forwarded-Encrypted: i=1; AJvYcCVpCwkxn9aEgwfV6hqnSN7NjIPBAjzqt6oinbdjiAhMrzhuORWdOuUosaZArfTb9fwt99ngV0zeGI0tfcnf@lists.linux.dev
X-Gm-Message-State: AOJu0Yzi0VpkWP1cz2m2GlZmBAenVm3vwcbfljtb/qavnhLjgHclFvuP
	tY3KwMc9FSSgKlFUsq+gKVyTjLj6CGxYAqb49odXbQcEJwMH20/af+iw0RqILOQ=
X-Gm-Gg: ASbGncsodyorO4K8hRzmWk8seh5cAW2604+BQ+DBkxM4CGSBVQ5c8fUfT1EU2dIoSZo
	Exfxp/qye4vAMyY+Q3sOlqCKXfc0w02B+EO+ex/CcsejGj9+VhaKRhtz88ggyA/NfuMmIyN7+Gv
	/LC5MmlpTJgp9b8KW9Ti1LoVPusFMIDY8pgcnmoJy4sLPecW2Jq6aGZNCm3M6jBXxz915+18FYf
	aFnfUCmMBSj5OhpPy9pD07S1K9zc4DhMb6kdSa7qEoKBhMqrz21TTIOgbxjSbFjy5ujqXFSdEHT
	vudK1LTRH5o+qLOcz4D/l7bUW8wfasdrNjS1cIVnaFiUwyNGboIkIeSgBbEPabjpPu8A3yWI6Df
	3KKsn3R1UG0vIThTLxQ==
X-Google-Smtp-Source: AGHT+IGge1vpcmLU7HQnnhk2Pd2GdQcITC0JwJErpepL0AlaxCPXrAcAXrwLje0ymi6nTKAEBpYLOg==
X-Received: by 2002:a05:6820:1e86:b0:600:239b:c1cd with SMTP id 006d021491bc7-6046f59b874mr7612300eaf.6.1744642967977;
        Mon, 14 Apr 2025 08:02:47 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:442c:b496:9db4:da43? ([2600:8803:e7e4:1d00:442c:b496:9db4:da43])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6045f522fffsm2020557eaf.10.2025.04.14.08.02.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 08:02:46 -0700 (PDT)
Message-ID: <25db1c97-001b-4b9c-bc57-879fcd0abb14@baylibre.com>
Date: Mon, 14 Apr 2025 10:02:44 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: adc: Correct conditional logic for store mode
From: David Lechner <dlechner@baylibre.com>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: gshahrozui@gmail.com, skhan@linuxfoundation.org,
 kernelmentees@lists.linuxfoundation.org
References: <20250414140901.460719-1-gshahrouzi@gmail.com>
 <0b1b428d-9ad0-4581-a13a-88f4ffd6c4e3@baylibre.com>
Content-Language: en-US
In-Reply-To: <0b1b428d-9ad0-4581-a13a-88f4ffd6c4e3@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/14/25 9:59 AM, David Lechner wrote:
> On 4/14/25 9:09 AM, Gabriel Shahrouzi wrote:
>> The mode setting logic in ad7816_store_mode was reversed due to
>> incorrect handling of the strcmp return value. strcmp returns 0 on
>> match, so the `if (strcmp(buf, "full"))` block executed when the
>> input was not "full".
>>
>> This resulted in "full" setting the mode to AD7816_PD (power-down) and
>> other inputs setting it to AD7816_FULL.
>>
>> Fix this by checking it against 0 to correctly check for "full" and
>> "power-down", mapping them to AD7816_FULL and AD7816_PD respectively.
>>
> 
> Sounds like we need a Fixes: tag here that reference the commit
> that introduced the bug.
> 
>> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
>> ---

There is also a typo in your email address in the cc: gshahrozui@gmail.com 
