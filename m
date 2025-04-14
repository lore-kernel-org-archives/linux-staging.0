Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D682749CC
	for <linux-staging@lists.linux.dev>; Mon, 14 Apr 2025 14:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642749; cv=none; b=jD+iJUwV8+u0+q+jG2zYtdjq18PpKkzhcf9iqZtLfC4D22BYYEZs+EKAU9GFxr3NFVn76FjkI9VAOSx4OmTNsGzkun/P1iRrJdVVu6xr9M1h0ycjx23QqbXXwEX2ROKhxpLM2QGQ5yafT6XXR/sUtErVKvYIMBLuuo0NTJNPn1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642749; c=relaxed/simple;
	bh=x8T8uwj/TLGIU0lF+Fq0pjFkLdrbonvSm35PpZ00zz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bV8UEeYek+je6fzj3dBS1+OIT/bOnW3K/mcE3nRMzVbNWi8Y3mSf0IW0YHDyyFjjTCHjQvfNDhLfdVCKxgVQFXtXieSYwE93GPdpYGgYjAkhvJnEuJKlgEj7t4JF51S28T4z0LhokJMGYUi8ADbLGhVEHbxNmNMjUF9/aDtdxoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=hhDT77ot; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="hhDT77ot"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-72bceb93f2fso2930328a34.0
        for <linux-staging@lists.linux.dev>; Mon, 14 Apr 2025 07:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744642746; x=1745247546; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PTu/tTBiLDnLTo19OmaQLQq2DdZvvnanifk4lVRIq1Y=;
        b=hhDT77otzRP5XOEBI40046I4X6oOR6RfqisNu5j0rrlDCTqKk6aKq6XeUIBYeETgh2
         QiJDyzVq8FCJN4aVSRm2n+mPxNXWV3z7EVyjtno7NSg7ep6RmEz4sjh9x//g2W8gNzKC
         P7CLxFJM0kdBW1tJSrkGgyonMtirc0OlmsuPvFsZQbdYIKML1sqni3oBr3VN5/ItF8qV
         +j5ORfksiGKDty9qBNEjMY1qU5CUOW8JOffsPwnganLziGDZ2HT2HguTxpKK2NLI4XDC
         eKMLt94g5kgKxhSqkUmxVE4zH6RD2NMqRH30jbxC1kljKoMNg9Cxs5MuOF77YqOMupC4
         pQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642746; x=1745247546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PTu/tTBiLDnLTo19OmaQLQq2DdZvvnanifk4lVRIq1Y=;
        b=lQK7QynynQBD9cDO/FmknNSe+wMVEUxRvxh57S7St5GlalCoc+X2g3hsYSCD7z3Wmk
         oau9FCkevfMMzy3nNz3uTYF8JXwlP+4WjfzmaMkbhm3GiaZCUkPeczvlr2g7ijerLy43
         VN0O5ygm0fKeXT4Ad80p82JPP0F/NPWivUngo0D8bZEyA4QgyopvY3bsLkq/0ydqjqLE
         6tL63U4Vv8HO2Fdn05TSNNRPWvtiCM2uGH8dnxoJqSP1JwsKpsm3uSeEN96F+qN0L4t2
         +47DXXHEZ0q1id9qBEtQx9NEbBGG4DxA6RvDTnbyYAEqpG5P4CnK7JFVXw3DqlxevoQx
         NCJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJvuxbzeAbBScur08VJThUAkuf+W9OuGj3nBFqL06FvpPWLu/AfDS7veJMcU+S5IMK6tufIp9XvWrhd1a7@lists.linux.dev
X-Gm-Message-State: AOJu0YytRG8GWYkgGo01RD7P3eSUIdjycKcEr1t6WS1xJUZYlc/YSr99
	Drm8pMaY6Ep99g/P9seIj34fnPTHoKz+EIGjht4vdA17YdnsEwGOIFqsrzgvlDE=
X-Gm-Gg: ASbGncv36fZSdwi7/54cXn8hgYw0zFyPXrYoaI4oOCSnUFr50weUN1vE6WzEfjnOHCv
	zxbd9xozGXUKO1qvlXThi1bZjSlXE+1OUSwRLlzrTr66hivKq5281m8miVcv0WYyxzZ29ixKbl/
	rwkULTpACk4ZDC3tE7nRpZDOwSauD0n4GtL1M6up9Yj+CI/hn4EPlUWmwYW3yuZUwHaf8Or12S1
	3soOOr6qNWjXXyXlNCA7sC5Ulh2hfVxpdmHugmYpVycJ7sirweFUA2xCP5k9i9SWSYsHEpkQ5yI
	9p7ncXtnzlLPsH64vEsBDwPCYwmOehN7p0q+oSZkPftd+zyvbAX8cYEcBrGvkeMVtr/Uoo+pIlA
	uj3Uhbhqrd+FxTT3MD31xAlI4INu/
X-Google-Smtp-Source: AGHT+IF1glTK7Rxcw8wLI6vS9cuIAF6Jejh7PaHmK35pumQJ1AqOK5QhIhTv8QqFc965AKmemYt/Rg==
X-Received: by 2002:a05:6830:6209:b0:72a:1222:9e8a with SMTP id 46e09a7af769-72e863c607fmr7034537a34.14.1744642746453;
        Mon, 14 Apr 2025 07:59:06 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:442c:b496:9db4:da43? ([2600:8803:e7e4:1d00:442c:b496:9db4:da43])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72e73d8ee4esm2029688a34.39.2025.04.14.07.59.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 07:59:06 -0700 (PDT)
Message-ID: <0b1b428d-9ad0-4581-a13a-88f4ffd6c4e3@baylibre.com>
Date: Mon, 14 Apr 2025 09:59:05 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: adc: Correct conditional logic for store mode
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: gshahrozui@gmail.com, skhan@linuxfoundation.org,
 kernelmentees@lists.linuxfoundation.org
References: <20250414140901.460719-1-gshahrouzi@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250414140901.460719-1-gshahrouzi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/14/25 9:09 AM, Gabriel Shahrouzi wrote:
> The mode setting logic in ad7816_store_mode was reversed due to
> incorrect handling of the strcmp return value. strcmp returns 0 on
> match, so the `if (strcmp(buf, "full"))` block executed when the
> input was not "full".
> 
> This resulted in "full" setting the mode to AD7816_PD (power-down) and
> other inputs setting it to AD7816_FULL.
> 
> Fix this by checking it against 0 to correctly check for "full" and
> "power-down", mapping them to AD7816_FULL and AD7816_PD respectively.
> 

Sounds like we need a Fixes: tag here that reference the commit
that introduced the bug.

> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> ---
