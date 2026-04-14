Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3443E8C62
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 14:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776176915; cv=none; b=NlS6EEjC+R5P6yw90sr5JFd5DPnVdqOHsw3PS6UEffS/MJOrNYUVNrn9ONA9EoRsl8EAQl6OCg0q0iAzrBR4SnFajZ7T8SpCD7+gvEGCk+OlnXiv+XXybHM95Dq2MVpqczzWhsG71n94ewXejCmc+42j19xRjO1ncWWQwxjAp6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776176915; c=relaxed/simple;
	bh=U4pdr2GkpIWC2vNkg+yEuCLsbuNCTohVBAVAKaDkhlE=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject:
	 In-Reply-To:References; b=DUrMYa73Bt+n/cQHPzQb/JP7+Kr2pQTpCmOXaAeBc/+6yc4tVsWJP1tXpesVUIpJJ2czJl4oxVq2S1LelB2rCSvx6uLKFyla7L7aJ5hZr9Bk5/PHoOTknhDmKwYrJ0bHWeZIFzxfkkCQ+JMT1WOl3y/SGwHJsTnM0DurN8MbL8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UyQxE9Il; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UyQxE9Il"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-671ff4b716cso1092941a12.1
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 07:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776176913; x=1776781713; darn=lists.linux.dev;
        h=references:in-reply-to:subject:cc:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AmVhBhekni6akTViq7AtyVCpriJ3PfrjTpRNvwMcVvA=;
        b=UyQxE9IlhzyeL4o6+gxgODDX+YSleU1L/pzk8pmAsdAsHALlHYul/vhgUgZhNMenHB
         gFh5r95F7a1CNkvPW4U65/xuyXcZQKenPnd9CqGXFM91g+9Uc1ak0V6uJSj+3ggpwZnq
         Vs8aBWswut5s4f8Xpiy0w7JyD9qatWJ1bWyC5tWz8HRVbYdCwUyldbgzmd5LABWGdNE8
         fWTHkiQzjTMvFrKIavVAjvckhIYTXnjHVHOBDghfGLpK8dQ+aumUDvlkQj7/kttYPDr7
         1eBOG0jKo328U/hh9MumsGIG6arXi0dLca3dESBKVz/KQMquGCsQVf+kN0Tb/0qk0JHW
         Af5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776176913; x=1776781713;
        h=references:in-reply-to:subject:cc:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmVhBhekni6akTViq7AtyVCpriJ3PfrjTpRNvwMcVvA=;
        b=K55CDQ7B8lB667osS/xWB9NtcdClsedycvOzxPNz97qCO80giKdkZ8Y+80fZdeuoMy
         fR8Wg+Oe1iSqkv/Z4Q9ktlYb2IONcYZU952aZoDT/vwKNQC6ARczW+G1BD/p7RydFcgB
         r//58C71FteYV0cpTNZOEEdYhQ9YgwmX20NJhWe1FvCcNwwF93A2QpJoRZS9HkVqZ5ed
         vgXyYXXl7B6GP/uoVlAypcsSMGIyoxAaZyLiQQdiMtMmRZBfxEGzOap28EnDAyGZ6d4r
         MHGPBgvja2pEbRTqVwk/xVekFt/DxwjGnk3Yi2lcYWLdvmZKJMGx7mf7ZCcN2RBYx0Qc
         czxg==
X-Forwarded-Encrypted: i=1; AFNElJ82l1EskgD+9dN/a7s0O9gGuBEHlylNGdv3C/GT0avPVN0TtzrgIs69Fqizlgd2k00uxVn76hXVIF0lo3f0@lists.linux.dev
X-Gm-Message-State: AOJu0YyfEFY+mQVYCVxfpJLl1EzdQV6KnYVc8zEhkjFdUMyOOlJVJf0t
	1KTYPLPs9hGWSlKy4jiDWOQnj5HQT4sUNp/wOZQMxHwua4hM6EeRDb4z
X-Gm-Gg: AeBDievcCNQ3RNd3qWLWWM4LUqf7VS9FnDBPgCS8v6EwYR0e/+jp7TFbNFTnsH28Xw7
	gJa9u/5b0Pmbs7C+bwIBuDgI0TLmptY03hF6Euct7RVWoVnRbCIA3l0Gi2WbVxsV3YxIpi6pd2N
	SLF6N4h/jKUWrswDsV8g4BLwrIBpDZgRwFlEFI3AkXkHC8bADH6E241ZtlKIgGICfJvViiYlrj+
	37dySYLJugJm6PU93u8Ap+dgzJwMyDPzBW8pgw2NvtuwDSuz6PPQEA7y9TMDSbTfLEJRqw3dEZ2
	rMfSs/CQ9B7YXy8seUtXr08pTLMyISdCyrhb3RMmNvkV4m7QBA/WRUZ4+KlknH3m/Xn+BFXF2YJ
	F7pKg9XJAMwvIiY2pwPNci0X0uBEi7xnUUT9TsnqULKXIEBpje6ReB5c5JDmX2WLWrQulHLOmz0
	TGoz/et2/8molduU+SDzERARAKmAhATEPkpUPi7p3+21MSlRLhGQyTby2rwbajC8wIvwGY153Aq
	Fj0yXgnqDfGqMyqU7OZ92miDQIE5fvGW/vwFErUEd3gWMWX8GRbpY83sCd2rw==
X-Received: by 2002:a05:6402:4548:b0:66e:2f86:ab1b with SMTP id 4fb4d7f45d1cf-6707903f71fmr6647756a12.8.1776176912385;
        Tue, 14 Apr 2026 07:28:32 -0700 (PDT)
Received: from ahossu.localdomain ([145.94.221.163])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67205b178f9sm278929a12.29.2026.04.14.07.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 07:28:31 -0700 (PDT)
Message-ID: <69de4f0f.a70a0220.22ada8.489a@mx.google.com>
Date: Tue, 14 Apr 2026 07:28:31 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============1904756288140883639=="
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: dan.carpenter@linaro.org
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, hansg@kernel.org, stable@vger.kernel.org, hossu.alexandru@gmail.com
Subject: Re: [PATCH] staging: rtl8723bs: fix frame length underflow in OnAuthClient
In-Reply-To: <20260414100804.871764-1-hossu.alexandru@gmail.com>
References: <20260413202824.740653-1-hossu.alexandru@gmail.com> <20260414100804.871764-1-hossu.alexandru@gmail.com>

--===============1904756288140883639==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Tue, Apr 14, 2026 at 03:02:00PM +0000, Dan Carpenter wrote:
> Do we know for sure that this is within bounds?  And there is earlier
> code which pokes in pframe as well.  This code is quite complicated.

You're right, I missed that. get_da(pframe) at the top of the function
already accesses pframe+4..+9, and GetPrivacy() reads the FC field,
both without any length check. I'll add an early check against
WLAN_HDR_A3_LEN before any pframe access and send a v2.

Thanks,
Alexandru

--===============1904756288140883639==--
