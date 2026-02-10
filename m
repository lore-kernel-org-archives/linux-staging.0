Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6A733F360
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 18:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770749929; cv=pass; b=dejZUv/1gkgIXbz6Gg4pcwRPqHFhIv8pqRPuvpeUaGmj5no7vnuda2M5tC3uZQs528kUQAiAyiB7rfN134+SL80u9X0061PYMnNiIG+eijSCwQ8V0YTwKtOFwzH7rt4hDj6GOtBsjQ+6K3s6E7LR+Jw8VGOw4IfOxbzJP0I2aek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770749929; c=relaxed/simple;
	bh=wtRCPBbDcLH32HLcnLP2ZOQ51APKiYW4nqsGFVx3ouc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FGOkDMvmq+lGVsv0REpZMogkHbba89agybYtUrMNfMePa6Aw/1RPI1uv4fzPQ0ZWCU+d5tEkJFv2cn72Z+SzmrgtwkDXMBNQ7d+c6RmW3JYpwR7LXY91UGZpFyBYhTlh2fcgzoyDdjjqen1Yoco/6PKegwdr9RniMZtY+syvRzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N7/diuk3; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N7/diuk3"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b86d39cd50so3612615eec.0
        for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 10:58:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770749926; cv=none;
        d=google.com; s=arc-20240605;
        b=D6huA/7s3s7DvL9BQDu0+pM3qTAY0awadMUgD+OvFHlnNFZK67cZy0VwIoid5ONW7o
         1JT7n2lykJXavnr9CDcL3S/YhrADOpQYnbsM6zKpN4EU61XcbHwmDrPXO2Kh9gI7lZAC
         lxIqM1BHuSsyw0otfQHwkUjrYVDZTygaJ4kyCfVOAvCxnMgyjDVxWM4yL5NUmA3tG8R8
         rlnCoWxZsDZNEo8htF/B5TNSSyDMrU95gLP8lz+U/H8pp2omTdXomvlP4ZK5wyToPqhM
         8FB+Dg5VtByXpL5QFRFqq8hVZAkuzYiFTpaLnaAQDSSfScY7ZOYghbvQY1vcHTyBexuX
         ThvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wtRCPBbDcLH32HLcnLP2ZOQ51APKiYW4nqsGFVx3ouc=;
        fh=Ybdz21ObGdTs/OF0y/wDEUVgc/W+FGbdayrZReiaa/o=;
        b=TDeqF6wtOL8brfI6pyXCbEWVgdYeL9+4xn4CvA4b8Is+e9Fp5BHFZNtIZhtKHRiXZJ
         kXw4FtnXD/ldpL0+dGfW4q8+hRhBlpRAC4vGAAY4mrBmt1vcKnVjL/oHzkoxygyaHiXe
         x2XzSloIdQBDTp//S9C/LR5aDgTvGK7fALtgABq4GdgbGpG1b7aLyaf1CsUklS+0RFVr
         ZN4pDzPrLVCUhKfyUQePTSkBenGqABJsShb+PW0l8s3UdLoYTySTJqxp61Qv8ISmtVKk
         SglL/KgVxSufwU6ycE/tvNaO4krmzPSGwws3/JhBcKgsjqelf7LnPwa7Pk7s7rZxZrg8
         ZdnQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770749926; x=1771354726; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wtRCPBbDcLH32HLcnLP2ZOQ51APKiYW4nqsGFVx3ouc=;
        b=N7/diuk3GIEnrPukpbfkzLduSkBXkwgywQxVH0G3c8EkTysQxwHbEddO1hQMt81aqd
         V4F2XlG8hN63pkCSY2khKVvZKhZlywc+DAQWcXBcsU62g0e1YrSSR/+qw79MnU4WcQmR
         20HJ9QkZWsnp08tsFEXs6BJfz3fIx26/n5xHiuG7APRFXsggo1V5algJyHzf/8A2E3k+
         /NX43lnayxAGzMD7N44cMY1uer+Zlnv0JeaNerDhmyeV0Hcfod5K2WXjksBQFWt+myFr
         Y5DZNb4y9nP1eK+ooubuS1JODrXeDEOh/18FsIMobNd5Q/257UnUfZY/6V4lMf2e+yjN
         G4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770749926; x=1771354726;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtRCPBbDcLH32HLcnLP2ZOQ51APKiYW4nqsGFVx3ouc=;
        b=t72NyQlqeRUciMwMFeJseqUEH5PK7S4imEqRMSnNrTVtorjvdvtRVfbeAdBFjTiQmx
         jpjMzMHnxIwD0GCOutN7gEfml3+ha5H49jqS106wF1CXN6utMCg21XnY7BVihevHyJ/d
         wCmXSLIbtDTsvE8pXrTSM2r/xvBgu6iX25E45lTZdOhanJQL3Dz7CYhJvjRkYTPIBwjN
         RfJfu6VzcrSRSsmB+WEKVvUo7lg7KyKnVhEV0w1a3sWhNPfKoXCdHcrivnV8ZO3UZdwY
         8EExd4CPQUoxE4FNWhjvgmM7PYkcGpr+dKX9K8l09npgEaouI2PG2DW/UMmKi7by/ryQ
         WutQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1fhJEU/Z+0cbpfX1H6NlwfEzWrpM31zc1h8Eax36flUlxofYFYc1scEJx0o2QaH3E08msZSAwdH7kdyeE@lists.linux.dev
X-Gm-Message-State: AOJu0YxVMiPRk1TEED30X33B6Gw96vYu84w4a6GWev9qCvH/lv+AOYlF
	ftOCgeWMFcTy0WTfCuA3SEuuUg4iKstHSzDJr5JVr5Kz1L7/5Hi/e/QduxIkT3b9j7qcZft0mI/
	dkQxTnp5sm46xjQxfdfj6XRlNxYnZXo8=
X-Gm-Gg: AZuq6aKjCQ4pXKKgXHWEwsHptVIHtAR9XY6hMhBspszc4Op+nh+RwnPYVSmHAYwWR+m
	C+jPpSUYPSqwipqf6cuP9NExfxJTR9Nox9m3/mwciOFeYTW5QfC+4iAitUST2iqLEGwR3l0O0gc
	GI3kj11zLOSIyO50qnRDVmocd63Z348+twIlDZGyQyLe7UcByR8GpL5cEirVChgBTRhrfWvsIn5
	2Tpr5aL017iOhfZIqg0FiIFIPq6maI62Lzw08e0gICPpasFfqN0kITccFK34iz/j+SLOs9VTx0W
	hka+T9M=
X-Received: by 2002:a05:693c:2d8c:b0:2b7:1b54:6081 with SMTP id
 5a478bee46e88-2b856403e88mr7131215eec.11.1770749921128; Tue, 10 Feb 2026
 10:58:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260210161628.42130-1-tmimiharoen@gmail.com> <DGBID683QZLL.275K62PPUD5D8@gmail.com>
In-Reply-To: <DGBID683QZLL.275K62PPUD5D8@gmail.com>
From: Haroen Tmimi <tmimiharoen@gmail.com>
Date: Tue, 10 Feb 2026 19:58:27 +0100
X-Gm-Features: AZwV_QiCbXkmKc0whCMzZEG5zXObAbjK8uU-gJlzgYgZrCGrfaasjJ8nnBayOLo
Message-ID: <CAH+Y0=3S_h372odMdiOgch1v=ea-YnufZwOSSzS-OcmA9Eae8g@mail.gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: remove explicit comparisons to
 false in rtw_ap.c
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I tend to work in a dedicated block of some hours, so my apologies for
rushing. I will keep it in mind for next time.
Thanks for all the help.

Kind regards,

Haroen Tmimi

Op di 10 feb 2026 om 19:54 schreef Ethan Tidmore <ethantidmore06@gmail.com>:
>
> On Tue Feb 10, 2026 at 10:16 AM CST, Haroen Tmimi wrote:
> > Fix checkpatch.pl checks regarding error prone boolean comparisons.
> > Replace explicit comparisons to false with the logical NOT operator
> > to improve readability and match kernel coding style.
> >
> > These instances were remaining after recent cleanups in this file.
> >
> > Signed-off-by: Haroen Tmimi <tmimiharoen@gmail.com>
>
> Please slow down, there is no rush here. Wait 24h between submitting
> revisions. This gives a chance for other people to review your code.
>
> LGTM.
>
> Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>
>
> Thanks,
>
> ET
