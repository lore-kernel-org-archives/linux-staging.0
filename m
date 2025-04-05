Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FC1366;
	Sat,  5 Apr 2025 14:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743864382; cv=none; b=MkQmRWDONkwbcIFfZD2fTF7o0Guo3bDypcOe0iIXyXs9KS4lKQCOQfLjpSNpJUNVLu2x8BIEPl9RILUcFAe3+lBiV+Nx1kvoIJl6JEuhvxcMszj9EbZ25CGDQ6pr+M080xD10nPsJr8NUltHPcfr0CDbIdVtRHywTtvSuILMiFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743864382; c=relaxed/simple;
	bh=4asEjp1/CUAT4ELHa+ao/ESAjyZCB6F1cHbC44yhvBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iNpSxMt70wVJcqI2CGqkEBPvnxcjCfH/2ZuipMO/2j5Q2M5xJSuGgWKEQbU8FzvqZwBB7yYQ4G3a3o6JUMs8QTR+r/OF8jkImfhLRYXfFLCm85XAXR7EhF+7TX/u13NbtRE/oMLQsw71lit/FZO7cGm0tkbsUDggSNMpiWixZGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fiGzke5Z; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fiGzke5Z"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-524038ba657so3021739e0c.0;
        Sat, 05 Apr 2025 07:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743864379; x=1744469179; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+q3WuE1NuO4BYZGOUfo2Q6wcwmVDQD0eIUmam6gSKw=;
        b=fiGzke5ZOQAka/NUNa129Qr5f9nn89LkGICU23ja31BYRORkW1RL6GYuBVx1FAES1A
         W7IybrokYWd4ZYEYqDpZ7pSxRpyU5XWqDqeKzdzA+tUgRTgchDakVnR1KyJXcHRwNJJ5
         8uL0/ul0VTBO1AksHWS/zQQwLbX7iDMcXLE6lbSaIfd9Fo2wrt+aNH4MKz+2nQSqyLW0
         u1WLvqltT4gJVmPUbRteUOdAW7ucU4IXxgXCRvhRAA1dd1YrQRVcCOaotuIj4G9EuGP4
         73uNCxnrjyV9vEYXn2l2mqz71CmVY/05o3U9QGh/FYDyV51ST0C/DpGejuraKDeE8U/q
         pPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743864379; x=1744469179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+q3WuE1NuO4BYZGOUfo2Q6wcwmVDQD0eIUmam6gSKw=;
        b=oVK8/6LE03N01w08yPWEmTR/M9qA2CpmXLZLln6sLc1T2cjw5Nexeq8g2r5zibuHXW
         uvWMXjG82Uc9yt24NcmDhSztqXmKL/E0grHrWRWHH9C+14X+ySE+3F1uOdRre25yX4/x
         +UBt0JCTEAJ6MKDlTbKl/67o22FUYPTwk4t7EeZr4gReMO5ephIMqDsBmatPuFdmoo0W
         bSSRMKrL/jLdOzke4siGfeVrg3+qvd2YqO+cc+94N64y3ghL5F4p48MMtHoXzsUuyh0h
         IqFNhmNgc+rnvycnLe27LJ7gC+aSdveXKTyhl+RwZGmUxtTy6Z9cQZ1eNhjykceGiV4c
         ZGog==
X-Forwarded-Encrypted: i=1; AJvYcCUPAFbb6Qg5471egDLsSRLyAq24kY/yaYlOGMTh7WqBtB/UTR2qzhNKsbce4qpcXN7/BiEh3+f0hDfHmNM8@lists.linux.dev, AJvYcCUmHPAQtHjFEi1bXn1Fjp3JoYdP5YzvkPS8TKDBSJBBgRSNxo6vZkFjRTP+/VQ4pLtfTD25MC8/GlVQ@lists.linux.dev
X-Gm-Message-State: AOJu0YwsWoeIYjkd8wLE1ncgVThiRbfGmnlVCQo7NiYwkRyliShnXWCZ
	u+bkkZytAoVpinBgFtc99Wc61AHpsGQ+2JLZv6S9HJUfmi8QwDMbui44/xsrJkXOAb6/vJSwr74
	qOdn+Kl8RmdQ8KCjJgBfxd6mYnaEeGzWk
X-Gm-Gg: ASbGncvGPBeW38x5gngz2s1OLZhQ/mNNMw81D8igBy+PyZgqUrTYnWM26MueEtnqMmW
	L21TkK/YMs/hLxuTw5TuOlJumPjIdb9DzLUMhGKM25rLHSItYXvl2LyOVpI+4Y5vopXEI6CcE0m
	wRHKMJ17rwLdxlunfpRWQGEobS6Dtd
X-Google-Smtp-Source: AGHT+IHK3HALCKLcqM31l5+4z/urCJhqbEIAa3hFB3B36fwMqBaiINXqmQPTg1JRU5BQX1UJJ6O770sR/t1LVxpF5QU=
X-Received: by 2002:a05:6122:1686:b0:523:eb47:2884 with SMTP id
 71dfb90a1353d-52756b4d089mr7598741e0c.6.1743864379634; Sat, 05 Apr 2025
 07:46:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z/EuZuvGyQ9QBl6z@HP-650> <7e94b75e-6959-75c-ab4f-58147fc37dc@inria.fr>
In-Reply-To: <7e94b75e-6959-75c-ab4f-58147fc37dc@inria.fr>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Sat, 5 Apr 2025 15:46:11 +0100
X-Gm-Features: ATxdqUHrDub-sVlNR5liL3rucUsftUW0tBdBhtBxgcddbIEWCgXS8YWRk2oigZg
Message-ID: <CADYq+fb+L9_S6WDJYKdugCVNCd9kT2QvEURimPHb+_3r-PoADg@mail.gmail.com>
Subject: Re: [PATCH v5] staging: rtl8723bs: Prevent duplicate NULL tests on a value
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, outreachy@lists.linux.dev, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 5, 2025 at 2:30=E2=80=AFPM Julia Lawall <julia.lawall@inria.fr>=
 wrote:
>
>
>
> On Sat, 5 Apr 2025, Abraham Samuel Adekunle wrote:
>
> > When a value has been tested for NULL in an expression, a
> > second NULL test on the same value in another expression
> > is unnecessary when the value has not been assigned to NULL.
> >
> > Remove unnecessary duplicate NULL tests on the same value
> > that has previously been tested.
> >
> > Found by Coccinelle.
>
> The changes are found in the same way, but the code patterns are overall
> quite different.  It could make sense to make separate patches for them.
> Then you could make a log message that is really specialized to the code
> in each patch and it would be easier for the reviewer to be convinced tha=
t
> you have done the right thing.

Thank you for the feedback Julia.
Okay how about the versioning. Should I make it like a Patchset?

Like [PATCH v6] with the cover letter and two patches, one for each code
pattern?

Thanks
Adekunle
