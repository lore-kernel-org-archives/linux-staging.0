Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9FE348458
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 04:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772168266; cv=none; b=O9KvXdfE6IuYrxdxNxP3+bsQaBYIMHGPkLj2NIaK6YIXMj1lyJL0Jnv5IASLmGnVXnCG1HfE3X2kvkWNbX8JNaWNXMyC7zwCzsGxevmAfQCuZqL47LQsGxr1yJpAnXK7h2yXkGynk/YnAcOTUohwjswqfkPTrVwAqH2KByHS0Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772168266; c=relaxed/simple;
	bh=P9j9juF5fqGMZ7pq8lHHDR5NvfxUwqlGfwVtsx1gs+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zbq+/65yptZXltgTb/L/6cGXn4ybi3u9QuySqdw3r9nmlGL7csrU4wX/R3aPn09V4hUxxi2Q9ItNQI3ReEWJZjsvGoH4+0BmS2PmyRVp5mZk85I2lxBi/DVhXlsyNVi184MjH2IVXJkCZ6Zw73tnIvY2q4bnhh/8kDxldHmZymI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EHCH37zq; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHCH37zq"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c70e96737a5so517936a12.2
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 20:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772168265; x=1772773065; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P9j9juF5fqGMZ7pq8lHHDR5NvfxUwqlGfwVtsx1gs+w=;
        b=EHCH37zqGIr5NaezZHSO0JWC8n4CqATbSLKy3oCpv4KRO+O8Pj9jqUW0H9axReXNzL
         YeSrUwdaF1Bgrv7YiLHYYo7R9GJuolvnQpz97IZhpRnwx4otLjkafJU20ODjXCmpa5dr
         mJP4C1kblRU0hZerB1npt27OoCxTOZWVSW3l+piO5m1Qs4+M83RUq0q2VHxhtTykSkdf
         htDUl/iLudf1rXVSdNSqQQDjJg+MT5t1NyApEcBjx8Tby4otTmJ4GcR0NTjJqlC+vk9l
         TWXpnLbUHdmYAgXy7AsI6pyMxD4UPl6MwQfrNqX1zMpNT9slDb3h4vR8ffxyplD50PFQ
         OuTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772168265; x=1772773065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9j9juF5fqGMZ7pq8lHHDR5NvfxUwqlGfwVtsx1gs+w=;
        b=ebXE/25XJsyJ4Z6TiXbJtrC2gYJmYmbTKOBIpkuh7CGFDAEFQmzX9XZwI8Ee8ALhx6
         841UyjX25MyrEgAm1/yk3QsRUfJo1XJarasP02GQukIZGGS0ESavnbOgPIUJoDhwj3yj
         1CUyPO6vfUt0HOwl5d5wMrdhladJ7lkL/lo2obalBzsssAoSgo2/EICcUG0X1eG7oVCn
         +5Kh6F07OxR9bRwhI+zxPv7UI2yo+e8u2MV0BCGR9miuwFsGH5dbLGY18olIyPvINLho
         d/9vOuJKjKVKPlrmanG95nIKuSakH92EXn+aF1g+P418GyIy032U3UQLVCmVGqQ9KueU
         73sg==
X-Forwarded-Encrypted: i=1; AJvYcCV5RRsuhm8xbWuqPc1Eo+On5i5Mp2w6++Hizi0cNLOjjADM8hkBPscEROgH79rWhVJyWVVEzi1agnUkD+vS@lists.linux.dev
X-Gm-Message-State: AOJu0YwJkYrzz05+R7eilKnCD6LeEzcHfPt3cFc2WTQJM9wXoCzMSzkU
	rSniy83uvUAhD3FHtIEJ9wWxVLmYBJPklQ1eduMKe3fyoeZRdgBxLPRn
X-Gm-Gg: ATEYQzw71wyHlmF5TNUqVidezHsUEBP06CRAtEQVkOcfhliKat00Ssf4p04J0JSrnUY
	m4tmWeiOuAstehybZvsj3oQI/Ett61wQqfeQUOkOH/Ps++LiM+faYDSHml/guz1IojvaVFnreAy
	wEPPjiOp4muUmR2vY+v6zg0Gi4UZ7FjckrbkgQi6QaN9lyAI8YRhf/qQzNIOwH2JeWb6umgAndg
	BiKa1zP1JvuL+KFOoh4KvQwq1FyX4Er0OcDx6/ubJY+xFUEzBYmUIg8hZ9X3lW8dRfmvdqI9B+g
	5OF4ru7ygtAg1lcyzOcckxmuSwobK/LesDPWEyD4RFg6IIwZYL0zj2GKzxhXn4s78pYqqO0XA7c
	ZWbJuvAt6ssRAJSEFHqJuUAAP9WRSFlkH77xfLVC1KZ98S1ngOhf/jJV8eCxTwNj60QaXdWKZ3D
	+EkjxQKUAMJo8dxiGXkuyXjM7oorEsf+SCB66O
X-Received: by 2002:a05:6a20:9386:b0:366:14ac:e208 with SMTP id adf61e73a8af0-395c3b6d2c8mr1632025637.70.1772168265084;
        Thu, 26 Feb 2026 20:57:45 -0800 (PST)
Received: from latitude ([2401:4900:ae25:bd8:c189:b262:db26:b797])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa6203a6sm3235670a12.8.2026.02.26.20.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 20:57:44 -0800 (PST)
Date: Fri, 27 Feb 2026 10:27:35 +0530
From: Dhyan K Prajapati <dhyan19022009@gmail.com>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, Jason Donenfeld <Jason@zx2c4.com>
Subject: Re: [PATCH] staging: rtl8723bs: fix function header alignment
Message-ID: <aaEkPx1LbV57c9VK@latitude>
References: <20260225085747.9639-1-dhyan19022009@gmail.com>
 <DGPDSKXS6NJH.3MWCJMW7KLGW4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <DGPDSKXS6NJH.3MWCJMW7KLGW4@gmail.com>

On Thu, Feb 26, 2026 at 08:16:38PM -0600, Ethan Tidmore wrote:
>On Wed Feb 25, 2026 at 2:57 AM CST, Dhyan K Prajapati wrote:
>> fixed header alignment in hal_sdio_get_cmd_addr_8723b that violated
>> kernel coding style, cleaned the header by pulling arguments onto the
>> same line.
>>
>> Signed-off-by: Dhyan K Prajapati <dhyan19022009@gmail.com>
>> ---
>
>LGTM. However, next time say parameter alignment instead of header. Was
>a little confused what you meant at first until I read your subject
>line.
>
>Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>
>
>Thanks,
>
>ET

seconded, i'll keep that in mind the next time.
