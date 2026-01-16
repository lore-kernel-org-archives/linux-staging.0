Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81C53112BA
	for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 15:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768576800; cv=none; b=Tp2Oo7PEorKlcUTq3gNpgLyzgrPC2AHVsZ69NSb7yo9UV9pbE7SyUvEUAQv8OT1H3EA3+VVwyZc/CJ7dO99rZo5MDGtzVli7Zb4WpGvDP929vedfeFsUyYCIHwtjyk10GNuldy0v86Ru6MssBo7AVtE8VSTihNaU8Bz7hWzkwUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768576800; c=relaxed/simple;
	bh=L2lYznqZDKgUjrWPWKqTs0zfSH3aiRBL5hKpO3L81DU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tpyNeGHiEKKVUxmXz67Po9OYlRWhy1O4Cu/Vpa0Z7qbo80gnmMFF9TGv+vyaQoCqyulDzcZFa/p38TQ+EiX/rnqe9jWVwhlUkhADLGLYDyAupWiT5kPDIbIf8DMsBgxjIr5AheuQfHUyd/QpZP5MjjnplkYNId9WOCpobW9vktQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SA2neAkN; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SA2neAkN"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a110548cdeso15210585ad.0
        for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 07:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768576798; x=1769181598; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+a58N5EKM8h1DQSDCJ78rtg0HEA0BgF+0NkIjuAy5VM=;
        b=SA2neAkNp1eRNwgM2qaAiaNgFkLSRjlg3PRNTG+fZzwHuk38vLferb3qFRprE9EWCV
         pROaR7HRAFRkQhm3M/+AmVxw1k0rbDpclcNnJ8XFJO7DyjYI+JA0DbtHLiftFfitUcjG
         4TcdcZgBonZ0ZPNAX4500k+1TFe8kBNQc9dsh4plgEp5eF0Sm6AhL3V0Gav8a4v3GbUs
         uF1EhLRBf3Ksl0E+Opa7wHn/imFH34lxSfAgfZI5ilx9CcLmykw81uvcAkcC3+LB0bMO
         awkkYyACQPWoqkYdxX5H8VBGRBkbssu0j+N/y4JN9FolFUkbxFzpjYkZSwgn6LnCWgLo
         5BIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768576798; x=1769181598;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+a58N5EKM8h1DQSDCJ78rtg0HEA0BgF+0NkIjuAy5VM=;
        b=b7d9XWjSCNK0ibYKnxRnv8rxtn0npgXLaqCh62OHF1vvPbLshbtKxWHei/53BEQXkP
         1PKN4SH+ApmWhOOFzpJqPF9qdMrsAJDr5vkTyntWhxHnfLDEgsMI7uzOcOfM1KpbwcGk
         TDvCr9RjAYS1q9V4pNO1vDQ71JjWMesowAonrbrUhWUQg+j6JUptlAn16wL0Vbc7ryt+
         3kW8khPANpZpOD4P/r3L1R4zN0qVsRCsvrRKKEwYlyS7+NsThfrWiN0WU1llDWv1azsE
         8VL60GGP+X6GiIFXP7UujnuCUAae6J4U8kKDnftIzDdOT26MbMAtyAQV7qJv4XETB4cl
         EnOA==
X-Forwarded-Encrypted: i=1; AJvYcCXCRgRS0Zq8pf5MZFAJkPQ5DtfHGy3cWm7BXyW8S7VU+zfYaiouN7CgAAe5JaDbO55+EvkFaMtQEyNVdyqG@lists.linux.dev
X-Gm-Message-State: AOJu0Yxhhvd8WyLiui1V7SynBTj7i1cYK+wIi3YCuCvPMLc/BZJNvgUw
	yqB3HVngQ6tk1V9Z+9veE47X5Cnh4XAW4m7yfB5gYMJpD8mkOFpbqYmI
X-Gm-Gg: AY/fxX6QBSLAaa1wlU6seGGXphsZraiwoARk+8LPTknraACiDZU/9B7YLWoqyIzSm98
	6juqVM9VUNUu/rBD4vYsjoRYA+lDnSR+Lvg73UvmALopUqH9RhrUDbZEvzAUSDnsnS/Uqw8NTo5
	3w3wsxS2NfmTmHQyDhS1K4s3YoeP+6kZ6zpDSOwt/Mb3NnAdu4v02n0Bek34Pk8CVQAWgg6YiZ2
	XfdkxG9AgO+TZMA6i9fVoM4HhdW1sjwl+7+bXCzyLFd8fmyn863nS7ecbbDYbiJI3vsH44PunUa
	wtSo6k9aK+IVoCDNWYfDCAOsejvdyjoX+DbwdQ/pmVP+K7hWXHORq/2Keo4UxFaw5PCQLFf9Nws
	AsZyc2+/FaTY8NhfToWkG47B6vibZcAhrXFWPP24lRInVVb5+MNJwWt3lkYyNs6ns0ZhC+L9LJ4
	AAevlr6BjB7crv4A2SCjKIvHwx95dufU8zml5rx2IgkA0XI432XyKxqWM77MKuCDNjTC5KPt65Q
	aG0aKq9
X-Received: by 2002:a17:903:2a8b:b0:2a0:f0e5:3f5c with SMTP id d9443c01a7336-2a7175be47amr32930395ad.34.1768576797747;
        Fri, 16 Jan 2026 07:19:57 -0800 (PST)
Received: from ?IPV6:2401:4900:647d:8d87:29d8:49f2:6b71:bc64? ([2401:4900:647d:8d87:29d8:49f2:6b71:bc64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a71942248asm24358855ad.98.2026.01.16.07.19.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 07:19:57 -0800 (PST)
Message-ID: <d589ca34-debc-4a4f-811d-fe37802eea7f@gmail.com>
Date: Fri, 16 Jan 2026 20:49:51 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] staging: rtl8723bs: rename CamelCase identifiers
 to snake_case
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dan.carpenter@linaro.org, straube.linux@gmail.com, hansg@kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260116053052.4198-1-khushalchitturi@gmail.com>
 <20260116053052.4198-4-khushalchitturi@gmail.com>
 <2026011647-radial-everybody-b544@gregkh>
Content-Language: en-US
From: Khushal Chitturi <khushalchitturi@gmail.com>
In-Reply-To: <2026011647-radial-everybody-b544@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/16/26 6:43 PM, Greg KH wrote:
> On Fri, Jan 16, 2026 at 11:00:51AM +0530, Khushal Chitturi wrote:
>> Rename several CamelCase identifiers across the driver
>> to follow kernel naming conventions.
>>
>> The following identifiers were renamed:
>> 1) UserPriority to user_priority
>> 2) NumTxOkInPeriod to tx_ok_in_period
> 
> Why did you drop the "num"?  That has a meaning, right?  Now this
> variable looks like a boolean, not a count.

Yes, dropping "num" was a mistake.
I'll replace it with num_tx_ok_in_period in v4.

-- 
Regards,
Khushal
