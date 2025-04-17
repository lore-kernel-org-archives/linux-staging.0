Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E206253F17
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 16:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744906664; cv=none; b=mUlMcGIw2ZM7uW0Mt2sAIvDy7Dmc1qLAprdnla9bYJDlnw566ndSPxYKU3F7bZb0Qx6nPFY5wcgH9JrgAzmbAfTk70RxcVdD/RBJusUVu3wT513xOgj2U/rNsyCMRb4AK+AFa1E3fO2nKkQwpI6MQNnOoB5BM1Mka8GDY3xb2Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744906664; c=relaxed/simple;
	bh=YdyGYQvJPxptB7Ud1K9823h/vEclrujKLrEKCBQa44w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TtowMbzO8F4oUnfe4PfD0uJvey8S7bjSAzcMX7nqEvRTrn1en8ISptJ0j7mKwCoygYjuE9U4zFC57vwBO/ygVuqkWlaYXWhkeTX0UvB2kWWyyn4MkRZ/vXtfcpHK482zNxuHQWPPzHL9GufT4xTnduus0YRxAWzCWG9GwMl3KU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Gq89bzuS; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Gq89bzuS"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6042c04fd18so448740eaf.2
        for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 09:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744906659; x=1745511459; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uJ86ga6RjrBQ4jtVg7iGsvEs2Pk/5xuTneiTlVnUO0k=;
        b=Gq89bzuSUdDW3k/DfAxpFiGuGN+EzjFWl8LsNxVOOW8Lp/e+s+e8rEJmQBKZOfkB0G
         w5XosN2JPNdVTbuOfb/E3CeMjUW/JpSEiaUR1hpixg8phsQgqCpgczjaT9wJ79E5Z4LX
         9drp0Rtm3lQYrLdNLDaowh47dj382f75jYtEgyrvlC5ZfmGKuVHMirpBLC6Kf7TWyNGz
         R2kc8EfQEdb1dRAbgKsQWtvRml5rM12OgImbyA0Tkq2wER5rw7IdauaPxGAkLGz6iZJq
         ECbiNCTaTgNphmo9KEPQNeGmBRFEr/E2zSjJGJwGb6CPFeab4QRpoisFd03GS5FCveYu
         8bIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744906659; x=1745511459;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uJ86ga6RjrBQ4jtVg7iGsvEs2Pk/5xuTneiTlVnUO0k=;
        b=OFggUMQnvgKNblK8XECxOwrUS6+JlZViWmBHod8kaFduGmSRCMHFYY+Inb7ZZr3kNP
         B3yPFoOFEZQaKJlnGPo1ehD30R25rg4kT5cebEvYairMM5qjPwkJ10ZxfGlKuDut+Nj6
         KyhXcPsRJCuCmtJH7uyVEmV1LfPYv8TTVAFtO27NOKdipYZO7NsxgfaIapTToV2Kr9ku
         NoDWy+DZSNvWJak5L/kYDGC89/VwIGUG49POu/J5BrX2IQ9zcW8ol6K1f17tleHhJSb7
         vKEF8fMauaWuSi6qvGKMrirTPYjOn/obTvWR8KckwhgD07OaVtByluqgT8D5ZwGDNJMc
         tuCA==
X-Forwarded-Encrypted: i=1; AJvYcCWnh7kz5rU/xQX7s4d2Njpdr5F97PV57JovTZ/8UzJogaxDw9aDw6TQHY8oSvWKazqO2ak1XOBsGZDxeWSS@lists.linux.dev
X-Gm-Message-State: AOJu0Yyyl0Xjlgpcxe37GZikTwC3YdTufpLbMXSHjOCHwARYXRp5nQdu
	tUJf9tzx+VoGCjwSUI9EgUVytlhKUSR2zCAQxSgYLavzZcoJ7eJvqoM+O8TC5mM=
X-Gm-Gg: ASbGncv7cqU7aE30I7oT+VeEuOrMX+DczPliclZltIjsaVd4eRg6JiHpdtbj3MMAsB0
	iMog/8Jgkgr1h7vCFdcB+pU4ayqEMmVxe2UJzsZFqoKxD6oH5uwGVYb9nzQxC05N8P8nN0cDq9j
	qXPHGWyrPvIILm/OEMwAo/ARu4ALhAyDPru+tWtMab8t63LDo5MJ8zOYvKK8tKeCiwU7uf+F67f
	Zr326sF4i2YD0MMwrKbRWWykFUAQZwUgFUjm2BbBItYYUyeJpDgY++Gk4yceELVT47TWpsvwxai
	twnpWJzCLyJbLJZwcxXef0i3cXZ6PtVgWUTBBajql+A5Udf7f6WK4JFsgsIa9CNE4U1ANQGs/Jy
	kb1bXZ/SZPf7VizTWcQ==
X-Google-Smtp-Source: AGHT+IGBBgE75fsVkLXxYoZqV19j+mS6o4e4vTLZSbr9DKTQoVtLZ0+RYC5g8QIKrdP0fbpy7FLYJQ==
X-Received: by 2002:a05:6820:1e13:b0:604:6b0:c259 with SMTP id 006d021491bc7-604a931e696mr3952610eaf.4.1744906659563;
        Thu, 17 Apr 2025 09:17:39 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee? ([2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-605ff6aacf5sm12896eaf.39.2025.04.17.09.17.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 09:17:39 -0700 (PDT)
Message-ID: <cd50b4eb-ef6c-4842-88cd-932042ca2629@baylibre.com>
Date: Thu, 17 Apr 2025 11:17:37 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: frequency:: Remove unused parameter from data
 documentation
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>, gregkh@linuxfoundation.org,
 jic23@kernel.org, lars@metafoo.de, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 Michael.Hennerich@analog.com
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
References: <20250417143220.572261-1-gshahrouzi@gmail.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250417143220.572261-1-gshahrouzi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/17/25 9:32 AM, Gabriel Shahrouzi wrote:
> The AD9832 driver uses the Common Clock Framework (CCF) to obtain the
> master clock (MCLK) frequency rather than relying on a frequency value
> passed from platform data.
> 
> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> ---
>  drivers/staging/iio/frequency/ad9832.h | 1 -
>  1 file changed, 1 deletion(-)
> 
Please include the driver name in your patch subjects. Otherwise readers will
assume that this is something that affects all IIO frequency drivers. I noticed
you are doing this on all of the patches you are sending, not just this one.


[PATCH] iio: frequency: ad9832: Remove unused parameter from data documentation
