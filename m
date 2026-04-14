Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949AB3CAE85
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 09:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776159892; cv=pass; b=DQYoKbwgrWamyJP3hIQHhfQGpFyBBjBpufgd658fg71Xyo+MfV5IvSx4f5+tQUFv5M6bq1ENV6Y/JxpCZeLfK/DPDA2u0L9hDGpqpyfsm6UKG1tiGwEP/Y/OwtWZtAOaUC2EUHMhp/zv5/UtLeqJtWV1A+3IPrFP/GJZGIFYHaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776159892; c=relaxed/simple;
	bh=xGDvPn2uXdqd2XWia7H51IAFBbwGGhKGm2F7xmF6L5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dF9z+k7e+IBPnkksW8Aw2MEzVbaZgotaoUyU2R1S/wd+BGCQAIIIp+PMr0D2570Zgg8BYkHT3a53vCjWXYEl+8NmprOg4lWaoqrOjJvFX2sb3gpV9sX5AyxLcPEsLLzqE4yXvboMlsTb6M6ZW9WafwreG2AWrstOecyWH3f7epc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lAdmMGzr; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAdmMGzr"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d572f7437so3398595f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 02:44:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776159889; cv=none;
        d=google.com; s=arc-20240605;
        b=LddtLqCc3Ib4TXF4u2B8DYGG5PpCC3nAlilQCi4ACf95SwVDu0C1cuCPtxX7YinzTB
         LtIlPe+nuPy74kZOzG4SkR1BuniEsQPECIv21DvGb84buPTp0x6LLLYHKw6434jsFpY2
         hy7n9VDENBzWUxuQmTH7My9kT2Ne/Bf9eui0ISWt8Gu1XzVNMvPrzxm/5WFSXDWi0ymy
         YfNQV9wUVpqZJ0UtAVRnn7uyUab117K6LkCyz8ST6Dlxs2Xw0HSmotDR4wNMLWdyQvs8
         6LqUbvAWTnS7vYugxYqwp+fJZOn3R8WT+fGy0Q6HH6YZrMfL9HVcl/TptI2MV1hh6o7y
         Nk7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lIaU1p6xw1+dwD4yvli/lO/hcmFigM23e72vtmpeMKw=;
        fh=XX7KrZ5aGE6VZSdsMGgvyGk58krJrSs50Ymj5Txb+q4=;
        b=VqQE/dub4IDin5g81birfg+ujM1Aqm1wtLUaWT9V94S9cfT36eS67hKF5jZpqsOjzU
         9SQpqFe6CNfD8db5SKU9sTRqGOyMRmZVI9rNqYdn+wYYrP2HQ0jG8zLMmL6RpKBM0XIk
         OpHr/Jwahd4lWbMlE0yeRquJbIb9/XL+2glA8EBwFGupYXu19/SQ4vahmxCrNys+J8jh
         BUHBMMP2OC2ycFs/mLWWGyu6taTDlXq8vfIe9x3AfflWw8qf+UbvZqEiOeCmcw3Z/gyl
         AFOLgYpxHT/Mi3vQVrnZwIy1tJDmXIMh/tnZwPFiBwQuPSrWHw6fbehaNQmm7jQexpwB
         S0LQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776159889; x=1776764689; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lIaU1p6xw1+dwD4yvli/lO/hcmFigM23e72vtmpeMKw=;
        b=lAdmMGzraiyl3pvTKPufUwIubGhMAjLsXBzvD3q8c20h9V9upF8zpoxR4Dyx1tTKoh
         2YARQRZj+AcfOAP0t0Ns6/v3EtfkwZKjVyvwcQM6syIUECT2Vkx9d6aqGn9R037NLDub
         ky9UstqUPdfz+7l7fsORRjAFDS3snc28JoR2fjPmvsdh8rARHlVP5V/YJBHxBu6jKmIE
         fMJb/x2mKZEnZ+Wt0yhUEwdiThxB+Eow/3Dg1qvnk27epJA0fFAYrLYXPNSLydUWB3Fk
         ds5gQ5T5/xL/f82nXgVk2qds7BhqgFw5xf5wLyOXOh86XCjpYphJVj9nDMFE0EGMdS6y
         UiRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776159889; x=1776764689;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lIaU1p6xw1+dwD4yvli/lO/hcmFigM23e72vtmpeMKw=;
        b=NJ8o+FBsc18C8ysGeKkaeYp6IHyuDmPVz+prDKzsRuholn2BZLn6ziXgCzUHAbaYfo
         hS1dn9ZogRr7FXjNHiONuH6XI1y0aD8u2K52jr0BcfZNr2XBywziXvGJNlyspaP4i55B
         ZxwK5UIoEshvcKcjOVOMsM8e8rS1IIov0dLJafdg+P4a+u8A1ZvOwVsRGtepUW08QuhR
         eF9dIFhrrPLdHUiTgBCDqeP9gEpppPnExu1bFVHTHW3Zqjaz1a+/p4y6euTNKqztE8PE
         uhgCFS96Fw937IIvu0q3uUu0aYOZcJfSQp7ZtKgxBYcxfQ+G3E3EusqlH2iYD5Xr091T
         HAog==
X-Forwarded-Encrypted: i=1; AFNElJ8QLcHZaZoj5w8oXXoseFGzZgCfkcK+Xo8xEQQQaxaNJXmSl6TgaaBtyQnDXgW9DPfoRu+IBBEWjY6xrjvE@lists.linux.dev
X-Gm-Message-State: AOJu0YyQKfX0xHepVrCgDyF9oAzLnozqt3OCPhO2aLxAFoONbfnWwMXL
	QR4jLeKmTzO69/ApYmEk5SSLcveLTltzYv20wSdDDRpM7XX5m3TfpGIZjVytBFvrJx6TqmFAbQ7
	mtDEgVhifoRjqbUcY1yp1SJd7kmta4Zw=
X-Gm-Gg: AeBDieuPvsp/YTJBLYNEQ1HcCGp8xOZx+5pyhNoY064uTqkNhee8gqPJoGqt3/zM5FW
	GY9f60RD3221bv7G9tw0f0NJ9tFodt72x8+fY5BjDa7ouJ0MHz1FTqtRtbIZAPP5eTIDLwfbvjF
	WqMzE9DfRKpX/ORW6YT41QWajfA8m+zng1AvWF7bkQtyv7UbeB/8h+HC3phktL9x3VmrrOJ5nYg
	o9hvwSnXK+BZuj7UWx3CHbzAqV4X2yU8CkaOftDDodq0ot6O3RRmP41DApUcgbDFvXpnba17Zyl
	jsDUWXNyOq8Ar5eH5Aq6XyMcrNmxgACT5S+uLnB+WbMFDwGUOGBtqQHwM60XNKqAwd9q+BVnjWQ
	rVCSvD30w3bSTLWuyEE4jAjx10fXSD1qPPtEkJQAxby/vgNB8ibkRH7vEldmxf3cO6G6kb2QwP/
	sX3ohYPP42EWwxaTaD
X-Received: by 2002:a05:6000:2885:b0:439:c661:3245 with SMTP id
 ffacd0b85a97d-43d642d1968mr24367297f8f.34.1776159888896; Tue, 14 Apr 2026
 02:44:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260414091250.1295-1-joshua.crofts1@gmail.com>
 <20260414091250.1295-4-joshua.crofts1@gmail.com> <ad4KgkcR58lQwPaD@stanley.mountain>
In-Reply-To: <ad4KgkcR58lQwPaD@stanley.mountain>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Tue, 14 Apr 2026 11:44:48 +0200
X-Gm-Features: AQROBzCFlwUqH0Bf2HSd12i91HAXfxMf168i7ss2SkRLFThDqiBxknVm1B-fKIE
Message-ID: <CALoEA-zXyZ9vLNZ_74qUADuxBHWCLmyUQtsbQ7g1Z4o1L6tvyQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] iio: frequency: ad9834: add mutex_lock() when reading st->control
To: Dan Carpenter <error27@gmail.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org, 
	gregkh@linuxfoundation.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Apr 2026 at 11:36, Dan Carpenter <error27@gmail.com> wrote:
> This doesn't matter in real life.  "Oops, the root user tried
> really hard to do something stupid and got "square" as the output
> a fraction of a milisecond longer than they were supposed to."
>
> Is there a tool which detects and complains about this?

No, no tool complained about it, I honestly just thought it's best practice to
add a mutex_lock() given that st->control is "volatile".

-- 
Kind regards

CJD
