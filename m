Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBCA333445
	for <linux-staging@lists.linux.dev>; Mon,  2 Mar 2026 21:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772487367; cv=none; b=EGqgq4I+tO6fV15ktwghs+tm9WY1HqGmrSUBYMdLfkkzdtoAiMTWJNjn8yO3e3etbfZXFleAHDxug0DLH50bw/PUiUKjhTIyN/e4nkswC7jQR+JYHwE0V/jB6TopQ9h4qyu99G0D2WPC4HlwVnmV1YPKw/MJXWgQnwxMciI0cr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772487367; c=relaxed/simple;
	bh=BVTyJY2VL76QXYNAkaKgm2E2fCj6qtDizLaGMDdZTjg=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=mMYBrSNY6+N7wukFDjE5JtwVBeq1Hdx4HG1qHyimGehlGV7qP4eGvpCAJfie7IvRcNSMOfHfm9GKpZCJqHxihVLqTg0ypeXiWwQmJcPeYbiDhYUWY7OtcM6tP27xLZW6KJ9G0NgN+hfTMBaV/TEKjBZoRZgOrY3W/1kDT3zfPKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pd/6BTeL; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pd/6BTeL"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4375d4fb4d4so3606149f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 13:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772487365; x=1773092165; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVTyJY2VL76QXYNAkaKgm2E2fCj6qtDizLaGMDdZTjg=;
        b=Pd/6BTeLxJV+CbIt81nwKOjbdbWkiS6syvWy7Ky6DOnYdC9A3LiAgy4i+rc4a8wArZ
         tzjrsbXWWfgFeGeoCCCRVDwzKXJFnL46DGfQUfbWlXlnaV7scfE9ygfzmjl38uTmidsV
         UJ5uP55ZjnBLXmyMpisg/T6DklPplErIhnv+SuEKBKgIIBDpi+s0XQF3teZYMaTTMAot
         9H5zXZWkxxXIoYpn1acK7T6XUM6ApKdDakp8sTVjEoGmSSeBsjPPcORxvoSTj5ROFQfI
         UY+oAQymM+Z8YVDVgJu6kWhIM/8igbZcYv1WekpfAnKGopJdJC4aAVEGugofHnIq8kMd
         MN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772487365; x=1773092165;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BVTyJY2VL76QXYNAkaKgm2E2fCj6qtDizLaGMDdZTjg=;
        b=npi3kwZiOnCNkEQmh+obDchIDcZ7e4HqjEtB9cc+kB/bSzD1x8RF0PVlhV7RAeVEoC
         wO5BbJhU6NwrMtVkqd8oP8EpzYwjjlTTNUTEgKbEEje5qh9t0xKc2HwpSoeQwpxDp+64
         1iUs+p9CnzmPEjMO3ffS+dgkP0yNosUxqFAjO/CTp8q8EPg2vkx9b2sWiXcres13msXd
         mFtjMsOnP7bdklvIuKFoYHu+bPOwl+GVhLFEtEH/3vSvCzqCfOSpVVy7o4Zs0cKVxd3K
         oSNuyWn5OdKBEGUjqhZDogUY4TcORNZloOAiNZLZm9M67t8Y1hVoUs+yopfNUR3qalT9
         T57w==
X-Forwarded-Encrypted: i=1; AJvYcCVTFjpR6Snd0mdd+dSyU6279JzezipX0POZBAz+Tpj1px7VxcPavYX0QKTvGl5YKnb0DmZGu3pJtg9FcS2d@lists.linux.dev
X-Gm-Message-State: AOJu0YzevmaPANFfuIS8KcctwbRn7YAqJO8AH777q8XWkgDp51oLcZHQ
	gF8kQKbnIRrxpVzbnZNauLxo0O3PwWOgZ0cVFSElwdVz/yGLReGOctKp
X-Gm-Gg: ATEYQzwXMr3n1bVZqS+lwO7S+fvgpeF7bVn/1wWNkQavv5HK1KYCpnYsxeIY/HDm+nB
	IuzhuYwESM+Ku6WZ/At2OYJqWvabV5zCKvcn/ZtOjS13sECp9Zruep+/X5kO+31d//dcj0ZS/RH
	YVlzMzfH7fbt7QNQVlVoKjpCrcegznNyvOWLNx22MwUsnwdN1uEI+y3ZDscNGW4IaokQBXFvgN+
	mV+DspxTCdZXK6EOOkfGWMNdLh/iDGSSDBhGYXbTfGWUGyitvatW89Xf33OxWdz3VA8XLLqYhkE
	HwmiWY4DUKiHKuobDPKAysVZzLVWFQjr4zdA48nEBDTyg4NoJJfuuPi3duKw+N3KBegE12fD1U0
	FEDBeqkxlwwXEBDWHr9+RLf+1mkcQzPJlZkQ4tMkz3J90YnGOVs60oZEVLK3oid6c4tiHPf+g2n
	G53zOJFrKldsPsryAgpyaiQmJM+g==
X-Received: by 2002:a05:6000:250a:b0:439:ae7b:4b1d with SMTP id ffacd0b85a97d-439ae7b4c6fmr14239847f8f.51.1772487364548;
        Mon, 02 Mar 2026 13:36:04 -0800 (PST)
Received: from ?IPv6:::1? ([2a00:23ee:1cd8:7917:2ec0:d6c6:6e79:9f9e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ae0e7abasm15936933f8f.23.2026.03.02.13.36.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 13:36:04 -0800 (PST)
Date: Mon, 2 Mar 2026 21:36:02 +0000
From: Josh Law <hlcj1234567@gmail.com>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Message-ID: <0e6cda63-aa40-42c9-92ef-ce1fe177ba0e@gmail.com>
In-Reply-To: <DGSM87K2CH4Z.244A6JVK7ZSK9@gmail.com>
References: <20260301005519.2512706-1-objecting@objecting.org> <DGSM87K2CH4Z.244A6JVK7ZSK9@gmail.com>
Subject: Re: [PATCH 1/3] staging: axis-fifo: simplify resource mapping
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Correlation-ID: <0e6cda63-aa40-42c9-92ef-ce1fe177ba0e@gmail.com>

2 Mar 2026 21:31:31 Ethan Tidmore <ethantidmore06@gmail.com>:

> On Sat Feb 28, 2026 at 6:55 PM CST, Josh Law wrote:
>> Use devm_platform_ioremap_resource() to simplify the code and remove the unused struct resource pointer.
>>
>> Signed-off-by: Josh Law <objecting@objecting.org>
>> ---
>
> I've already told you your patches will *not* be accepted if your from:
> and SOB do not match, there is actually legal precedent.
>
> Thanks,
>
> ET

Man.... Check my V2 patches, they are all fixed, Please..
