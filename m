Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D2F37E2E1
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 18:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773946693; cv=none; b=u2VNPaLZd4z7aw/j8fNubrjXRDt5Y4Gmn5FOOBLmRC7LxWa37mFmHPXl50Z7t4espGCBOVupzIGDSuEezj7a7jcFfaeZArPwWeD+zO0eKTgzIiI4QtJwojp6turxqdZUy5pg5mzkJEVemzscUQ1X0182NiubEiLjRsQamzwfUuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773946693; c=relaxed/simple;
	bh=vwDjQpdj3eWbxanqNgni6K+3Doku4gkbphzj5sRO1uo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=PBq9fcIyaLQYq8yxaDLlBDpKf1wesGo/4LU82icamRjJB5YR2CZy2wijFvo72QqjQoEdfO3XUFkPy8BGh1tjPb63kWMX9SUIrz/CnxvaPuFjwPiEW0nSj0qyOG4qgyoOtmuVk5xfWA/jQ60a28KkLEeruj2Fdnpr6iqIRNZHwXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R5Ow1DPW; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5Ow1DPW"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64ad9fabd08so1050284d50.2
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 11:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773946691; x=1774551491; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgvdV/GfEnt0ib/0W3RkqfdrYF59W9FuEUvFR8FEk/g=;
        b=R5Ow1DPWJKa6VZXw+jJchyuH4dPN8RIPjb4uphule+9FVlgHkgQbz7dVb1KRa6tvu3
         0umfYVVTPMbYLsF5SK/hIun1RTUAv+x2y38+Xckts7ALmwo0jvD5GkRni/tc6QU3mZUb
         r/9qyhNOk1Ck1KLjNbr+g5G8h/gCVb1ae7dQj3IY9iBKlbG+5wqIfbbeUSshuCbq3H4n
         Z0IJm3kZDym13T956cEpddr0AZRMZQNzEcb1OxM7Ssxqt5ggldLkk69WF8BXlAqSQEBZ
         2ng8PURVAZUs3/uDmkwlzj26rYIEuUL5XFqi5mvphFvXZFJ1QlWSTEWwELIsIpIZO9//
         AlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773946691; x=1774551491;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HgvdV/GfEnt0ib/0W3RkqfdrYF59W9FuEUvFR8FEk/g=;
        b=noEABqRwSg7IeosJoJxI8OeJyazqFj+jJy0K+93Bq2jd/lmgi8N4tkkDP03LpPq61x
         BAfQOpksajuJnGfwF/HQbqsbU8/hL8yXEr9MZR/Qpz+yufghqw6FuG/tbGEKs/fJk5+d
         /cgjoUq01/C+hmzbc+upE5/3qI3nCTHhoS+X/7/o0IMidRptsQmq/OTIDDVf55G9bW1b
         Oo2oCzPnjvdTervj/tViVN4JhydBpRRmdMa76DMTpa69/VhIcNcrTZccZLCyl7PUt2hG
         rh9ATAokrZ7S9/DxdJFUSpUVj8jnvQ01G8D/A52uy6nyyBYxwP1MQ83svxUnAe1sW7ZC
         v/HA==
X-Forwarded-Encrypted: i=1; AJvYcCXUUhBPkngC3ORZ/PTbGylBe2we0gjjs2cK4FwIUL4x9ddCTG5QHwYJFpgn2Yn5KlBCyWr+np1TcLuFSfDL@lists.linux.dev
X-Gm-Message-State: AOJu0YwFbJg4iS7lQIKYXnh6DwEhIxSg8ut0Lw6RiGepvvnIO4dtfzbc
	izDx8iLUHpgt7ETwCswG3RQnf1IR9yHZ3GZptqgc1vIH04Xvd3lVr2ek
X-Gm-Gg: ATEYQzw3L6cjEwTJLpYKcm8zyZXzmmn1MikHYO3fHjr5dS4g/TX4qxvV57FFU+AJA1a
	Xleu+3oqjzvZBanXifw2fHaJXqj3n3UdwUtrk+UP0SNpabQDJ5eHl41Z1Gyu/CAAm3XXKzuYNNu
	VlEPdCoGR2jJKBXG2V2RywG9E30XWfs/uZAxFb/Xy6FA/t3iFRHuZ8S6aq79zNUagFOXyyFF2j9
	p3AJzzpPf6DfmOVFLBvKgZ9elYMfivtWEtYfYQeHutbNM7D4KMgHdTKbUxSBO9iXq5VZ0F3+jr0
	5tW1lM8/3qg7JSL/vj8Lby59Q/v5TLvx7cykYmDrLDjpKnpUnMJnBk0C0a5TK5d/HpvzWGAZVBC
	+DzM0pDdEn5kOmj8hi2/2BpTN523k2S/X8rokPcCNwHs0GkcTaiWVpeMVSYkNWEShUgAkwdvEZi
	Zwl2LMeVknI4nNgoFlfp3M2VUfByC7TJQhTicXv1HxftCxg2WhVGIfZcUrpIbdixwG1+IIrqD/G
	ouviqAKTZaJrhr9SuQB/41+FR1xQaG1
X-Received: by 2002:a05:690e:1b49:b0:64e:a408:4328 with SMTP id 956f58d0204a3-64eaa8118fbmr492104d50.73.1773946691430;
        Thu, 19 Mar 2026 11:58:11 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::f769])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e91a47690sm4009610d50.5.2026.03.19.11.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 11:58:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 13:58:10 -0500
Message-Id: <DH6ZMB4R4HJN.3M9JIY3LOU8DT@gmail.com>
Cc: <luka.gejak@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: break long lines in rtw_sta_mgt.c
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "MalavyaRaval" <malavyaraval@gmail.com>, <gregkh@linuxfoundation.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260319174229.62021-1-malavyaraval@gmail.com>
In-Reply-To: <20260319174229.62021-1-malavyaraval@gmail.com>

On Thu Mar 19, 2026 at 12:42 PM CDT, MalavyaRaval wrote:
> The original patch attempted to use the preferred sizeof(*ptr) style,
> but since the target variable is a u8 pointer, this caused a buffer
> overflow. Reverting to sizeof(struct sta_info) ensures the correct
> allocation size while satisfying the line-splitting requirement.
>
> Signed-off-by: MalavyaRaval <malavyaraval@gmail.com>

You need to put FirstName LastName <email>.

...

> -	pstapriv->pallocated_stainfo_buf =3D vzalloc(sizeof(struct sta_info) * =
NUM_STA + 4);
> +	pstapriv->pallocated_stainfo_buf =3D vzalloc(sizeof(struct sta_info) *
> +						   NUM_STA + 4);

This just makes the code harder to read.

Thanks,

ET
