Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8491F2BBB
	for <linux-staging@lists.linux.dev>; Wed,  2 Apr 2025 12:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743596911; cv=none; b=Of2Aj02h3q5F/G7yzy/CcFdWN0sA+oAm84pPk2A/0BP3JUHTlBcMP5n2j9hlGzv5z2/GMmAAV6vSZPsf/+YJxC8ssAvkFwcg6fUTE9L/BcZ4OJZFUZHLY4EGCyh+jpXDd+FWqH+eRZ0Yc7eZFhGZPN5oTWieHIBhnwhOwZ0l6Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743596911; c=relaxed/simple;
	bh=3GJnv086E8giW2AgWyctw2s3hdsLylkH8BB7S+aQQ0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UVwUEKJU65i5NmcJjfl1WAcXOJQXQu9GI+PDwxEIbfbUQV//PUUwEJ/AKh0mCIVY31oYFpXOxhnUE63bhDRmVyed3HijVsQE8zLr+XFpgVIwvfvjD4SEGf5wPUHOvb7L+QKfI1edU2a3LrB7ooyu8oBHTODV/Y/C5GG7uvte1Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JFVHah8z; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JFVHah8z"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c554d7dc2aso1126279185a.3
        for <linux-staging@lists.linux.dev>; Wed, 02 Apr 2025 05:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743596909; x=1744201709; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GJnv086E8giW2AgWyctw2s3hdsLylkH8BB7S+aQQ0A=;
        b=JFVHah8zWe/oUXz+8epExt5SvN1eCiGwU7UKne/uSd/jhBdbsfGnCrgZpovt/z2g2P
         wnHTbZFAvsBSm8LZkWorPKOdOPwaYA4rwxncJiR8NO9+E734BwbsUNLKqm0WVDZtoQmq
         HhZj052E2q2zZM8wFP+ajw0ESv0SPeN5UNoaVoPV3ldmD8Zt7bvVwbAfl+Ok9YOIVxTa
         MQ0dATf+OBv3bDKPUwFXwFRrNhWAn5vHtfcULgg8Wbqwtd+elnIEww360JeEQtTeDc5w
         19msBDHPymTdAZz3nQy3kAT2C6iRDPhDsPOTNm86GLC8Akzq2hZ1aspiRWOeSkkMrYGW
         h9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743596909; x=1744201709;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3GJnv086E8giW2AgWyctw2s3hdsLylkH8BB7S+aQQ0A=;
        b=nQAYv6NkPBZQ1j2lzf2yxej2zYbRm62zyBKDyWt6fckb1g57/eqiA+WnyeKw/tw2ug
         xiGwTrmnvMVtCUqJTo11ia8sya21lvXRG4DjoeI6r4iCWRtK3OIlVVicyB3MLiF46KBQ
         8jbScTkBBhibzWvnyH11Qx4qGgjTNkIzt5UMKb0Nvjsbm/bZtZ4d3xJFlEamikC4TvSe
         ZGBTMVvLWhibCziR22aRRuliyuXsyU9x1eyxS/rYimwdyKiDUwjGqbq3nmZdEE2yJkND
         Fh0oOdxhTqa2r5F8YhaB73X4fpjARzO81XEGxfJLMfZa/p7RxWYxZXAUpriAWzQ72ToC
         +U3A==
X-Forwarded-Encrypted: i=1; AJvYcCUi2IH/4EUwNUmpJqyBXKHF16Kq8UUSxifXI3Xu3df4tJCyyCkECheBTVplMlx7DjQzSi1WnmzlDvuWkNME@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/FHeRPG4moyVXOiLjC9pqa44qi0Vq46vPQaazPrXF9kJMIH1O
	yI0wDwwQF8+OL2fq9IvmSDkG1cm8MruXf/LuQjwNZKLIBXRk6dS/S76RcGRvZLYw3M5Ho14EbGM
	2nAshhpMS2VUXkIX2C7ERNePalaA=
X-Gm-Gg: ASbGncvceEPioxiUH43ZSjJar/um5mSWRgrCi0qQ3tvpOnTvYWnOhQe2n4UsGJCS/Zc
	s7xbhiBdjECkOXJC0qQWcWPK7dyq8rQt058ycuEKEBrXeTEfgH5tzDOToaEl64iTneQlQ0gwg9N
	Kz49+w898u0DcubN9Jqa2DGTW5jQis0aOr9IE/cfJuWyiM9Q+m5btmYgC3ww==
X-Google-Smtp-Source: AGHT+IEuUnjhwnbiKPNa2iql9SktgL1DtzPXqOEtIP0f4sok+TQAufPBAnt51aXcIpZAD242gbrDpZ9sN4sj8A+JfDA=
X-Received: by 2002:a05:620a:171e:b0:7c5:44d0:7dbb with SMTP id
 af79cd13be357-7c69072f194mr2490451885a.28.1743596908669; Wed, 02 Apr 2025
 05:28:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <67eca38a.d40a0220.22c3d5.88f3@mx.google.com> <CAHp75Vf4abzcNFwo2W-=-fOr1_j51RAUPxDbGNVX9F-Soxbs3A@mail.gmail.com>
In-Reply-To: <CAHp75Vf4abzcNFwo2W-=-fOr1_j51RAUPxDbGNVX9F-Soxbs3A@mail.gmail.com>
From: Gabriel <gshahrouzi@gmail.com>
Date: Wed, 2 Apr 2025 08:27:00 -0400
X-Gm-Features: AQ5f1JodykYOOexOE4Nc0cNNufpO84gEFflIgsTdTE8NE3csTAuFfwB702epNyA
Message-ID: <CAKUZ0z+mqGwyEt8oem7gLMXbNp6D3MPPMXEH5GCdA4_768d=5g@mail.gmail.com>
Subject: Re: [PATCH] staging: media: Fix indentation to use tabs instead of spaces
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-media@vger.kernel.org, andy@kernel.org, hdegoede@redhat.com, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 3:12=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Apr 2, 2025 at 5:40=E2=80=AFAM <gshahrouzi@gmail.com> wrote:
>
> Is it your first patch to the Linux kernel? See my comments below.
It's among the first patches I've submitted.
>
> > >From d6a08153171ac52b438b6ddc1da50ebdd3550951 Mon Sep 17 00:00:00 2001
> > From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> > Date: Tue, 1 Apr 2025 22:04:25 -0400
> > Subject: [PATCH] staging: media: Fix indentation to use tabs instead of=
 spaces
>
> First of all, your patch is mangled. You want to use proper tools,
> perhaps. One of which is `git format-patch ...` and another one is
> `git send-email ...`
I was using git format-patch but not git send-email which seems to
have been the issue. The meta-data from the patch was getting appended to
the top.
>
> > Replace spaces with tab to comply with kernel coding style.
>
> Change 'tab' to 'TAB'.
Got it.
>
> ...
>
> Change itself is okay, but is this the only one case in the entire
> driver (which is something like 100k LoCs long)? Even though, and
> while for the training purposes this is fine, you can also think about
> checking the common style of other functions, which may be shifted
> with TABs, but still having not enough spaces or so.
Good point. Regarding formatting, it probably makes the most sense to
address these issues comprehensively in a single cleanup pass (similar
to https://lore.kernel.org/linux-staging/cover.1743524096.git.karanja99eric=
k@gmail.com/T/#t).
This particular instance caught my attention because I initially
thought the author might have accidentally used spaces instead of
tabs. The line in question used 2 tabs + 8 spaces, while subsequent
similarly-aligned lines used 3 tabs. However, after examining
different files in the driver, I noticed that while the formatting
appears inconsistent, it likely exists for specific reasons. It's
probably better to avoid changing a single detail without considering
the broader formatting approach, and to treat checkpatch.pl more as a
guide than the final authority.
>
>
> --
> With Best Regards,
> Andy Shevchenko
