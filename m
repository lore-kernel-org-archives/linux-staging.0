Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192393F7AB0
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 20:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773951801; cv=none; b=fKc4xJ0aS87hSXbVuOKEr8cEJ/ceYp1A0edsn6zsSyXjpFAxk/f1Mcve8V1403L8BuWMY+6IRNpSA+hvXeye8fLwqwi4weWc4HMcDkA0S+TgBBnCcu8MojovFLls6O8zj8pdIQCsXK3m+lR4KqHQ7QhckN3PLQtMxZ24S3RFa4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773951801; c=relaxed/simple;
	bh=NzRwWCpasdVX+nAKYb304jjzZ5XSEXZdV29hlD4+FXE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=f0vwOrSJZTIVUx9lpb/m2sQzQ+1xVVwillbv5PjsPzxG0vRoPD2IQyoR/3qA30bLUsSpS4Y7A5mRPZUBJsj9w7wSII4tXamvGX6BEYpquUQckwKP2SECDux9Es5roARjT9Soci3TA9PCRV7SXgxenUQ7BWbUuXFJxrDn4Kl7Mhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KpI2PS4H; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KpI2PS4H"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79a535e7c00so15146907b3.3
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 13:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773951798; x=1774556598; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NzRwWCpasdVX+nAKYb304jjzZ5XSEXZdV29hlD4+FXE=;
        b=KpI2PS4HmhQYWSmnkgmCu1fekPqpe/i0EaYJ+1h+sOAIaWM9FEmzeL9lnjMBdeqO7t
         5kJV+boVgCdKlPdtqpENUeYJ/Do01Tn7a8z9zZrjocWL1+tavqyz7lxM9nqtvsDFi+UE
         wa+oDTLZzZYXxwX60+OZl4Dz3/ERuieUKNOa8862fX95th/EsAAww7OGX7ZGElknJELH
         1kJo4NZx1X7m4+vRjfj7aLCibU53I/xqqkZydouz6tJAwMN9lXt36aMURbjBGNQxsXj0
         9HLEFw9HlfpNDV84VtGjbHLLMPamROtv7f0pNLZ/m51fNEKZLTET5A+D76pwTw2GIm3+
         nXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773951798; x=1774556598;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NzRwWCpasdVX+nAKYb304jjzZ5XSEXZdV29hlD4+FXE=;
        b=svjgXgzyGPQOBtajJYhZp69DQURj3QpNtWJOfADLyz/Q+X1eXD/zZIZ6R1B+23S9Tl
         2I9EG33s9NQEE9HgNIUEHWBZ7G5ZeykO6ndT1kMWyLrx6bePo1hePniB+dYaHvjBN7AK
         EbAE7gpTmfrM7QkUDeL4dUub4tGEAdirLvNvGkH4uH7qyrRG7LMPAz5oNDlqczGR79nB
         iPKZuGl7IJ6pBvgSVwrqSQdiny8EaEjt3izawDsZ4g1cz1Bb/K8lH/7g7t35gL2PAWQZ
         dfUdRZVcu+jJCOwF1lER1EPtv2Cv2iP/35ykCpf5mfmR1LvIc71Ghk5J+T9xsFC0vrSL
         yuCg==
X-Forwarded-Encrypted: i=1; AJvYcCWn3IVVXfVp+WWdXbj+OaVdDESTtWAcLNI2CuA3kPghxlChAKotyc6uvAni7WG/EYiwr+cag6wVvAa8NNVs@lists.linux.dev
X-Gm-Message-State: AOJu0YwLM8BH/W+KDCGQCkQg3ALNS7z6UoQny3/yEvIj8gXXHQLzfBHG
	9W0iVIgzIhysFtyx0SZeejUZxsmsfsz76lqa23SXmsNtzF2vleo4IZwL
X-Gm-Gg: ATEYQzxkE5n/3o8b39nWqfexg5ybhMnWLUL8oc3BobbSsxHQ0qQt0IAvf4RHWtemjsE
	cKU7HY9iVPScCZS6vUZqun6vqfcd1OMsoPBqfDVGXnR9ZjxzJ9vPPOIwgs8jSLAJzVED47/m2jb
	pN2vQNlPtwcUvEIQYYzEhgNCJCbBqeIndRpep0V0Js9uRgFPwiHGof/Bl4lj4NyXIRKXl3IR2jo
	GFWMWa+b9mbFrJuqDZ0UcayHuM2Y56YR4vYIysHuXLViEDnL3kAl1BGhm2TfXwb5iK2XBlgwgYC
	5+sbrAQIRGXCez+CZ8NOxdvKhi4upNY4MN2QrHJqaFkPjDeFX1NjNtZdVdm56IeFzEVAItWzU0x
	0b2B/mLZCPPW7n0jbUBk6Rah/HLvQDba9grZ6tx2+rLu9SRyQyJj4K1D3xh7m8xld2oZPI4X8ni
	1RG2PSE4Whh8y3dRzId7nP5pmh344JHOSDe/RgjReUYucRb6zDTqWcMjwi5x7Jsu7MqNDZY6vMx
	BZxlN9+UXDbPxsRp7uq2U9BJeVF0N/aP/PZM9v7ABLQEF4qAT9t1hV7cEgAPO52m7Q=
X-Received: by 2002:a05:690c:6989:b0:796:357a:9ae7 with SMTP id 00721157ae682-79a90c08ce2mr5505987b3.51.1773951797834;
        Thu, 19 Mar 2026 13:23:17 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360:55e8:8501:5170:a49a])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a905bda3esm3297177b3.47.2026.03.19.13.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 13:23:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 15:23:16 -0500
Message-Id: <DH71FH1KOEKG.7DDYS7US7ZP5@gmail.com>
Cc: <s9430939@naver.com>, <architanant5@gmail.com>,
 <andriy.shevchenko@intel.com>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: Replace msleep with usleep_range
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "AyushMukkanwar" <ayushmukkanwar@gmail.com>,
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0
References: <20260319195437.53068-1-ayushmukkanwar@gmail.com>
In-Reply-To: <20260319195437.53068-1-ayushmukkanwar@gmail.com>

On Thu Mar 19, 2026 at 2:54 PM CDT, AyushMukkanwar wrote:
> The checkpatch.pl script flagged a warning regarding the use of
> msleep() for less than 20ms. msleep() relies on jiffies and can
> be inaccurate for short durations, leading to inefficient delays.
>
> Replace msleep(10) with usleep_range(10000, 12000) to allow for
> timer coalescing. This gives the kernel scheduler a 2ms window
> to group wakeups, improving overall system power efficiency
> while maintaining the required 10ms minimum delay.
>
> Signed-off-by: AyushMukkanwar <ayushmukkanwar@gmail.com>
> ---

Greg has already NAKed this change.

Thanks,

ET
