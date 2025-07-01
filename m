Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBBD274650
	for <linux-staging@lists.linux.dev>; Tue,  1 Jul 2025 14:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751379068; cv=none; b=YyAznJcqC/RO7+ZCf27HYbpL2DGmFe731xw2BoYmlNZ7q0P59ih1MNsZQ85UXhuO9wDOAgRLPR216tBCVK8mBp95yTqlL9JbjK8mEsrrfGnSHM9hdEQSIrYjbJyFhcYjDwr+5r3D3irWM4AZdzAFhmqT1+Wk2lkTw/pFxdYITfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751379068; c=relaxed/simple;
	bh=2K9ZivYXUuwV2vkpZBcFHQhkKQ12wzxuV9+F7FGnQiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q1l8J84wvg7bq3GEg5+73z0EqkDXzZ6X2tcbuDmsQLpaPFJvwfQ2EZk0jeKVhvO/RF1x9nQ7YgB1D1QlrMEZg7PKtmlabZd4AOjyF2sYiJFcuZcvwSF9eexDYPmWysTx37PLfBggN/N4gdRu5bVPRWHtw2lRk5bKlPglPgqlzYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rs3U4l9Q; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rs3U4l9Q"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-61169c35f2aso1542844eaf.2
        for <linux-staging@lists.linux.dev>; Tue, 01 Jul 2025 07:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751379065; x=1751983865; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zBZDo+iIbaRT38p2M2Gt1DuCw7wsjHy8MPcNuCpg9Jk=;
        b=rs3U4l9QVGX9PHPxKrU8sSso5CSqIcwX0LY1io9PfTmL7jGerDXvbHGXRh2aZjSSZc
         L1WJWkNKJzqqqvOEP51ZXewitFE+31eozcPSZ6qg6o3vcRNf88tgFy0uPF2tnn7TPw3b
         9dJ5zSpi7le3PYhXbcrkq2nXi+E/tHKlibk5DUH+UTg48HXb4H3vhDi92JCYDTopzW6A
         w9v2p6dv+Myl1gR7X3XIiUupZp4hKpEh4MuBT3I0yEDGvPrjtrKlRrR6GSLyaHRhNiSS
         WiOTNs0lWsFEElNYhTPLCg7mYfPiJtSRgIIsjFUWjrJmfBlgLyibJndtv/8lZGE4wLJr
         a+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751379065; x=1751983865;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zBZDo+iIbaRT38p2M2Gt1DuCw7wsjHy8MPcNuCpg9Jk=;
        b=UzcVrRT/o8PDeLJcGKpiqs0vjpOpjW5mPhFIHWWF25km3SEdOl/xYrcC5hszfWooA1
         JUjj4ITxjoAfiDACj1MZFExS19c1pL9HOfRygbtLS82Q8cwz1WC0ysHmK1+GO8j5OU9x
         m+bQfU/uVmFpzcyYL9tfCYWd7mGvNIGc//GkqqqLzkPAkazZH9RL+nrCioVgqdluJ8yN
         OCSCEo5AOmKalggLF92sBg9+82CI/U1vM2D+V9b2WK2OsDV4ohKr0rCxxSeyE4LqwF7L
         SFOwzAaHar23O1nzlsZ4EHIAITXQKCmwsAY/MYbbl+MxGOqSdS78EMbhOzJgj9Gzr22B
         +y8A==
X-Forwarded-Encrypted: i=1; AJvYcCU5TfVpK8zrpu7+DMWrwur2xtnPQUMzoM4AK16e2TUR6lVZWTjud7MWwqIXsG+6J81y871AC9d1q6gJGMgU@lists.linux.dev
X-Gm-Message-State: AOJu0YyAZqY6hbyt0S2/S15C5QgD86NvuSixuqbP0l1I1HuQTfEjqxc+
	DthmIOtTkB1TroH7GyZMTeL8Sbs0AZBcbUBFJH+xJJxm/LF+XoNg+NKg2s6MxhyFWPQ=
X-Gm-Gg: ASbGncuhcdU9tq1KU00zprrGGy6dLjLDOROhYEFYq6QvuZXC8nAvUotPa5gzFmjHWBl
	rCT22YKDFQAEQXX1EZ/g/Akdsc8n2EzMwZHDhLg2IwqawxOeYZ1PQ4v3gBYxXjMc5M8rbv6dSf/
	RXLImXgAojy7Lx6+LKGVc2Y1FtBZY5XfhtFUMkOCxIyHsinuVQxUJpvka34NvETq+theD9Xodzk
	xkwgwN6lPAPAh3Pdx9FqRoYd4fFbk/M7CZkyzytig0iDtg5v23ZIEozwZLsxWAemVL10bNHHs4w
	yumkG4JqqkuKrVXsNZyXt0b8PdV/wPISbecE2nU0LxOlPbNN8QqXZInviIRXO6vEO7jO3g==
X-Google-Smtp-Source: AGHT+IFLkQYxN+cJSXm+bghahO0tFjg9oH443l9I3mmEiA3RIQYgQ4k8orQ+i61VslSoHfkS0P+xRg==
X-Received: by 2002:a05:6870:b689:b0:2c7:6150:fff7 with SMTP id 586e51a60fabf-2efed776901mr13786145fac.35.1751379061278;
        Tue, 01 Jul 2025 07:11:01 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8ebc:82eb:65f7:565e])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd4ef026esm3306223fac.11.2025.07.01.07.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 07:11:00 -0700 (PDT)
Date: Tue, 1 Jul 2025 17:10:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marcos Garcia <magazo2005@gmail.com>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	karanja99erick@gmail.com, rodrigo.gobbi.7@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH staging] staging: rtl8723bs: replace magic numbers in
 rtl8723b_InitBeaconParameters()
Message-ID: <9f4ae2d7-5a8b-4785-9df8-3d22925b8f3a@suswa.mountain>
References: <20250701074243.1300186-1-magazo2005@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250701074243.1300186-1-magazo2005@gmail.com>

On Tue, Jul 01, 2025 at 09:40:49AM +0200, Marcos Garcia wrote:
> 
> 
> Replace hardcoded values in rtl8723b_InitBeaconParameters() with defined constants
> TBTT_PROHIBIT_VENDOR_DEFAULT (0x6404) and BCNTCFG_AIFS_MAX (0x660F) for clarity and
> maintainability, addressing the TODO comment in the code.
> 
> The values were sourced from the following documentation:
> - REG_TBTT_PROHIBIT (Offset 0x0540): Bits [15:8] = 0x64 (100ms prohibit time, 1ms units),
>   Bits [7:0] = 0x04 (2ms margin, 0.5ms units), as per RTL8723BS Datasheet v1.5,
>   Section 7.3.1.5 and RTL8723BS Programming Guide, p. 112.
> - REG_BCNTCFG (Offset 0x0510): 0x660F sets max AIFS (0x0F) to prioritize beacon
>   transmission, as per RTL8723BS Datasheet v1.5, Section 7.3.1.3.
> 
> Hi Dan,
> 
> Thank you for your detailed feedback — I truly appreciate it. I tried to contact you
> earlier, but it seems my email didn't reach you. This is my first kernel contribution,
> and I started by addressing TODO comments, thinking they were straightforward. I now
> realize even these changes require deep hardware understanding. I used AI to assist with
> parts of the commit message, but I didn't review it thoroughly enough, and I take full
> responsibility for the vague comments. I could only find limited references to these
> values, and the documentation seems restricted. I apologize for any oversight and
> promise to research more carefully in the future. Thank you for your guidance.
> 

I feel like there needs to be some kind of notice on patches which are
generated with AI.  I was so puzzled when it said that the units were
in half miliseconds, but AI sounds so confident and professional and
people do crazy things all the time.

I have sent my fair share of guesswork patch where it's like "I think
the code is correct, but it's just indented incorrectly" or whatever.
And I try to put a note to say that it's guesswork so, "Please, review
this one extra carefully."  With AI it's all 100% guesswork, but it's
formatted as if it's quoting a spec.  There is a lot of potential for
confusion.

regards,
dan carpenter

