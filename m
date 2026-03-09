Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7CE3ED5CC
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 17:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773076943; cv=none; b=G6b6hrkRQCkuDoTOsDrXvel3aXICRoQNb36bBf9e9fQGvhjHld2kLIevAa8La/FAwncIkFOOIvBcGSrEuepm+5r61e3sRvHAPkkfdkywiP+qz6x0FZCOOZirGqY/tmF/ECwFpfgQotqynZqVWwbDpaLYsIobV6U5Ez/TTPtlxQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773076943; c=relaxed/simple;
	bh=+G33lbd8NB+lT8+s9Pai77iqHHECGyWJo66j0Bxf5PA=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=iVVI3kMZTQYO0tZWtZMU80H0bi4gpjjY5yA7zINI4yCR525DI0c4hyO3GhUCls07oa5tXdNx7R89ms8g5eVVOtenPOMLjMt50RZVern7GQyyeJyimoSecM3dftUl5E4fRyOCK6YPzINKZLCsKgCCVlbW1YzBU1ZO7avS/RUfMwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OR8GKHqy; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OR8GKHqy"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48539d21b76so11298975e9.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 10:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773076939; x=1773681739; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+G33lbd8NB+lT8+s9Pai77iqHHECGyWJo66j0Bxf5PA=;
        b=OR8GKHqyjMVgF7LBMO+76+Zlqj7znj3Ppm3i5aWaFr06CQyOgodxfgJsdkwWdzyVWL
         aSlGDUOV90RBF0VNOtbRFmlin1q+BFkJeRpqT9lza7Yxdyt2xFt07eNjfqJqQVdwP6tD
         oiPoCA4BSnXw7P7D+lavzK4VNw3zuLVrLl4BTkYSJvAmFsKc3CV30o4l/XcgZ24k8tU/
         bmMU+gzDcPwth7NQ87TPTTUTOo19WlCcUm5LfmxEJNycep+zl4B5QNGu1rsX46I6C5vp
         vTxxz06g6L8ehDph640IFrawIW8bdCF4cUzWzYf+s5Y2hYV5jYjHYa6xumu5lGXzijFw
         2bdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773076939; x=1773681739;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+G33lbd8NB+lT8+s9Pai77iqHHECGyWJo66j0Bxf5PA=;
        b=r6FkmCxVtNKeeto45U3NpDOl7BJOxV5+V+qGgGAC0fk2qbCELCj4S+iaEYTM+AQs6A
         x85OgIcIps0e6nN+HEH6ZoDgUj+DdcISb3lQ488pOwGVEhtL8gN/CzKKs9UO3x6Gx+go
         wciJq/cJwwWmfC+mB2idGlOH6hxPbvfQEAvzhq3Kn4gwVLtanWP01LtsbcqXSZhVeE6z
         kFm3UUvS91+AO1d1n9fnv2c1h8/8HzVKsOl0COjapvfZBqovnBL7B/Rx6o+x/9BPpWn8
         RCYYMRoAfP5WIfVbgS0KiYaj557/0yolZxEwfWQ4e5Mth2xuSlNDVVPCzifp6uH8tGTQ
         eBTA==
X-Gm-Message-State: AOJu0Yxpc/YPQq6RKW2UMiR1UOWChP9FyuUiq9+sS2ZCUwIMBcN9eWsw
	397UTvqo4drLQch55dZxJrZg/ES+JeuS6n4u47VCDwJWof9lD6ggYEiZhtRXdR/NmeeSRQ==
X-Gm-Gg: ATEYQzytnsX+OogqPMPQQXlnGSfPtrd7CD04tRp5RNmCFnogfkP+n8u3g1I/naE32JS
	rYrlbUeW8UGVb4hmbqSQdAEeKFzqYJzS6Jw5SPCqUU+d6pQsdiqe0XauH8Sxkqf5vR3MVMJ+pMB
	L1GBYYeklD53TYXQiPXiFjhe9nZAHBGEkoobwFnHIv9E+XEoVi5BXXjw1mylnAjRnU2tUW5IJc9
	jjPw1UZy/tSr4DgwmVIEeUoPVsyUm/YUYQypG7Vas/ST/OT61YVEapS5p2y7BJmz40samnwchwj
	UptqT1EEouVhX4yl4zMRi0eSW5uYQrdyAG/PLX8GIgV0XQ+uoRCCg8UNQUr4F5g4FYqLwlUy2Ff
	pOsQ2a5LUvHOwxh6O0+tV0i0XGciQyk8U5eURZCOUf7deu7g6NaItGKl9UMCY0lTsAckoy1U8Yn
	x93Ni1FHDkAmVpO+i/
X-Received: by 2002:a05:600c:3593:b0:485:3c7f:527e with SMTP id 5b1f17b1804b1-4853c7f53cemr53118215e9.15.1773076939115;
        Mon, 09 Mar 2026 10:22:19 -0700 (PDT)
Received: from [127.0.0.1] ([86.1.69.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541a7f1f5sm10534455e9.4.2026.03.09.10.22.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 10:22:18 -0700 (PDT)
Date: Mon, 9 Mar 2026 17:22:19 +0000
From: Josh Law <hlcj1234567@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Message-ID: <8e07f7f7-8019-4edc-9a33-99a66db12e49@gmail.com>
In-Reply-To: <4219d437-d0d5-464e-8b92-095690bbbd98@gmail.com>
References: <20260301005019.2510157-1-objecting@objecting.org> <2026030908-destitute-rely-9997@gregkh> <532d31d1-0c06-4c8a-af80-86b6fdf07225@gmail.com> <67b71192-97e8-40f6-9b88-666526ccd16e@gmail.com> <2026030952-petroleum-osmosis-50df@gregkh> <356a52f4-84d0-4872-b713-9833f07e1a8e@gmail.com> <2026030928-smartly-spinster-ae05@gregkh> <e65d636a-325c-41f4-978a-6c09a967a923@gmail.com> <2026030931-quiet-crimp-e4aa@gregkh> <4219d437-d0d5-464e-8b92-095690bbbd98@gmail.com>
Subject: Re: [PATCH] staging: axis-fifo: remove redundant goto end
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <8e07f7f7-8019-4edc-9a33-99a66db12e49@gmail.com>

9 Mar 2026 17:09:53 Josh Law <hlcj1234567@gmail.com>:

> 9 Mar 2026 17:06:48 Greg Kroah-Hartman <gregkh@linuxfoundation.org>:
>
>> On Mon, Mar 09, 2026 at 05:04:24PM +0000, Josh Law wrote:
>>> 9 Mar 2026 17:02:10 Greg Kroah-Hartman <gregkh@linuxfoundation.org>:
>>>
>>>> On Mon, Mar 09, 2026 at 04:59:58PM +0000, Josh Law wrote:
>>>>> 9 Mar 2026 16:57:19 Greg Kroah-Hartman <gregkh@linuxfoundation.org>:
>>>>>
>>>>>> =E2=80=A6
>>>>>
>>>>> You've NAKed all 10 of my patches....?
>>>>
>>>> You have had review comments on all patches sent that I can see, did I
>>>> miss any?
>>>>
>>>> thanks,
>>>>
>>>> greg k-h
>>>
>>> You missed about 10 of my V2s
>>
>> What is the lore.kernel.org link of the patches I missed?
>>
>> I see Dan's response to your v2 series of 10 patches, which I agree
>> with, you need to address that before I can look at that again.=C2=A0 Pl=
ease
>> don't ignore his comments.
>>
>> thanks,
>>
>> greg k-h
>
> https://lore.kernel.org/all/20260301214815.2628942-1-objecting@objecting.=
org/
> https://lore.kernel.org/all/20260301214815.2628942-2-objecting@objecting.=
org/
> https://lore.kernel.org/all/20260301214815.2628942-3-objecting@objecting.=
org/
> https://lore.kernel.org/all/20260301214815.2628942-4-objecting@objecting.=
org/
> https://lore.kernel.org/all/20260301214815.2628942-5-objecting@objecting.=
org/
> https://lore.kernel.org/all/20260301214815.2628942-6-objecting@objecting.=
org/
> https://lore.kernel.org/all/20260301214815.2628942-7-objecting@objecting.=
org/
> https://lore.kernel.org/all/20260301214815.2628942-8-objecting@objecting.=
org/
> https://lore.kernel.org/all/20260301214815.2628942-9-objecting@objecting.=
org/
> https://lore.kernel.org/all/20260301214815.2628942-10-objecting@objecting=
.org/
>
>
> V/R
>
>
>
> Also, I am responding to Dan's comments, but I am focusing on lib/ at the=
 moment, since I'm a reviewer, and I've had more time to fix lib/
>
>
> Later, the patches that Dan NAKed, I will go ahead and fix them for you

If it's convenient for you you can ignore one and two since they have no de=
scriptions, patch 5 is worth looking at maybe.
