Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D865E2BE644
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 17:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773075845; cv=none; b=EZdeXuNKj/PEpLQ5dIqbG0+qq1EAMbs2v2SXl8FktzmeSSbJz/MpEdNBGwMNQS29JzwaKSAcAiPo8qHPzWfwyoOiNYoubBYHzBkHW+O1y9tC94G9sEm9OoYIewVq+HfOhnLqXIbs+aThOqwSByBLFK2BLc0vehObympUhNiEFSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773075845; c=relaxed/simple;
	bh=+NRQ2z+iGFTqYpUWkSuD+VeuVTuMeLBq9U1dIg9HPZg=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=LwTUj+TWpDU6G8hfBQxyqFEk0+RP34z0AxkOhGhp29rmheDNTZZxId/dTx5nSfHrsXFqmY0VDM6Gr/Gp9m4pPilvrC8FTpiSLkjRmHoauKo5ohpNl2Am3wR80jiv7UszHMXKSomW54YQo75loOr/AIpfWqj9ePHudOxTa7kgr58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vkpj514L; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vkpj514L"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852ff06541so22095325e9.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 10:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773075841; x=1773680641; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NRQ2z+iGFTqYpUWkSuD+VeuVTuMeLBq9U1dIg9HPZg=;
        b=Vkpj514LxWM1l9OxQc962GK+tAib19aX8sL4x7vcegGIBN25ByYmfQ1CR/3VzU4677
         8gxlIGbAQb3WpLyi+KW0e4aD2bMUFNCC9GngA5YwnNSM9x4gydatH65dK6U5z4Rqv2i5
         MMvcQmM6VlKsp0to0ZIS5vJGRUZWcMhKGarf2MtnDqprh989Vt/SjQhIZsrKbIvjq34+
         xu/x6ZTvtt1BYE3GhbhzXRZOAnOCTOJNzREH0ZzIRpE3ytiNEqkQfZVlWa5O9ilxn35o
         mciP6IPVIKWP2e4bQm8rVaUNGR5Dm5SHLg2KQ51vBk0QOneL8mYk4R9OOpEDcyqrG3xr
         YCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773075841; x=1773680641;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+NRQ2z+iGFTqYpUWkSuD+VeuVTuMeLBq9U1dIg9HPZg=;
        b=RE20UF/bY++B4S1LLxFJDZxUt/uQmcsTl4TC7ydH0Y8+5o1GYhJmU+0AE7lT66Gh8l
         BvqniHj7dDZi+ZXV08OnID/kGT2U45fr7r1vIYOIgIYMOOte2mibR/l8KnQE3YJgqazF
         s2sfdgH5UvFrckYTVzJ8piPZrOKOhXE8x9s9BmY+jrUmO1f0c3E+W6aMZ8yoVloo+APc
         lmXyKaAVK3+dNerDYZJoPGfkE2vGaF+EzYg3+aUb6ua2V9nCxVxQpxoB/pXMuIa2wOKq
         BjWLUYJWCINTqgxZc7s4ulhkTNb3GF0pM29UBLuyb/2fHNsST2gUalxmgLXIrYurgTH1
         CoHQ==
X-Gm-Message-State: AOJu0YwdsKp3g+synHhUW16vLWOkstXM3YwqWSzEXOPoOeWXUGHO1Ahf
	+cmOn96JKuPlAA9HgLafvELVd/4vvBAWb9n+Ee6wSleJpxKW8wqOYHnV
X-Gm-Gg: ATEYQzyoeBoVhMiULhDFiWMjTck+gGDp9Spr9Ct4j0Il1yVZx3fQSKYIBaVzfkhaLH3
	XxqINYNSmAnhQuSFO9mSAGpReUPovGBnALew8y/mQ38AdknrnNRzac3fyz5nLPRFbVzPpMj11Y9
	aG6CxiDiohe8RqT2T12kiCqud9jK283+UY7cJOIueQE0RiGecKdio+sRlC+NHMyKrjSD1YkEY5w
	9rsWvjbAaOm83W5/lQUPIHXYsNW/SeoCDc167p7Q20mzlJpDgx4FePwA4oykwnyhYE0VX66mHUn
	TPWiaubquvB6/7Od3gZM4agk7qSvGh1fHGj09tdm7Z73iiEFXADpIefPy3lhec0gsHKYXaKQDue
	9QE1xTrlfa2KiHQP7Q9jImlTIXuZo/tCtq8kYAYOK7Vq0euxFst+7PUo5Iq0OLu/pfcKtIXPfvX
	BIdj5bH6W3XBnjSxTr
X-Received: by 2002:a05:600c:3510:b0:485:3c05:24cd with SMTP id 5b1f17b1804b1-4853c0527dfmr56295505e9.33.1773075840609;
        Mon, 09 Mar 2026 10:04:00 -0700 (PDT)
Received: from [127.0.0.1] ([86.1.69.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541a6bc3bsm4770515e9.2.2026.03.09.10.04.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 10:04:00 -0700 (PDT)
Date: Mon, 9 Mar 2026 17:04:00 +0000
From: Josh Law <hlcj1234567@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Message-ID: <f202c101-6b9b-45e4-912d-ea5e9c3dd69c@gmail.com>
In-Reply-To: <2026030903-although-gratitude-49a6@gregkh>
References: <20260301005836.2513391-1-objecting@objecting.org> <2026030914-task-stunned-21e0@gregkh> <07e2ae8e-e6e9-4def-9eb2-2c48ce6669b8@gmail.com> <2026030903-although-gratitude-49a6@gregkh>
Subject: Re: [PATCH] staging: axis-fifo: minimize lock duration in write
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <f202c101-6b9b-45e4-912d-ea5e9c3dd69c@gmail.com>

9 Mar 2026 16:56:37 Greg Kroah-Hartman <gregkh@linuxfoundation.org>:

> On Mon, Mar 09, 2026 at 04:11:25PM +0000, Josh Law wrote:
>> 9 Mar 2026 16:07:50 Greg Kroah-Hartman <gregkh@linuxfoundation.org>:
>>
>>> On Sun, Mar 01, 2026 at 12:58:36AM +0000, Josh Law wrote:
>>>> Memory allocation and copy from user space with vmemdup_user() is rela=
tively slow and can sleep. Move it outside the lock to minimize the time th=
e mutex is held, reducing contention for concurrent accesses.
>>>
>>> Something happened with your line wrapping :(
>>>
>>> And are you sure that your change works?=C2=A0 What is wrong with grabb=
ing
>>> the lock this way?
>>>
>>> thanks,
>>>
>>> greg k-h
>>
>> The issue with grabbing the lock before vmemdup_user() is that the alloc=
ation and user-space copy can take a significant amount of time and can sle=
ep.
>
> But what is wrong with that?
>
>> Also, it's just to be more efficient haha, and yes I'm sure this change =
works, I own the hardware, and it operates better...
>
> Great, please put the performance numbers in the patch, that will show
> the need for this change.
>
> thanks,
>
> greg k-h

Hi Greg,
Fair point. Because mutexes are allowed to sleep, holding it during vmemdup=
_user() isn't inherently a bug. The issue is that while it sleeps, it block=
s other processes from acquiring the lock, which bottlenecks CPU usage time=
s slightly



Perf numbers:

sys before: about 18 seconds
sys after: 14 seconds

V/R

Josh law
