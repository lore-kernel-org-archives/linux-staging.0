Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3481D5ABA
	for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 06:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752562679; cv=none; b=UqDrNkti9wdVu3FXNx5sXxJOwH75ILl/HGE1LlDSrIBFmtSqENfbcNNZRDnfOzhCFuxhR4yf+TONI4gIzxfyqZa/w64NxVDkBgD5D3YjZIR7BHWEbbb3ax0DXBikVyvt4gq96a5Aa4vK8mn8tRJbTTfkkYDopsIdAKyLUpu6JUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752562679; c=relaxed/simple;
	bh=hi3b18kCJ2PN/uE94e7W0oedaOkuFFQ0dFZ0p41G3yg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HfmfSaYCMjg+CrU69oXi5gWcIVbcFHpvxhw0ZGUl9QD3p5js121aIThT/d4FORU68visqBLwfenrVneQRU5Qf4+U1yn+9YSbrBO9rbZsrZb+TUYYdYlmBqZiX7lS6tb1ewLc4PaqbEYTnF6LNbMHl+dlIWYObqQIpMMtc0h4ILk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLx5vGX3; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLx5vGX3"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae0b2ead33cso893284166b.0
        for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 23:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752562676; x=1753167476; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hi3b18kCJ2PN/uE94e7W0oedaOkuFFQ0dFZ0p41G3yg=;
        b=aLx5vGX3TBtnQs/FC2pMpPMCvk3JyYQNjzcc9E1x6paBY64THO4BVYSHDgiYofFL/J
         J5Wu1fJ0YPKjhQQ2vbQGdy+HCEDHtRiO9suknj3FHYKYxuMIXqIOv7poPSBzU/GqgdlO
         JmJcNwItb0lrip23xuaOxKOecRm7QCfB+n8gWMQ2F7LXCH5Sos6YN1lRw6M3Gib0rh0y
         pXpz4LuOBff7mMjd5fxLAmhDRCeBDjvKgpU+X1pB3XOChipj5oD46tqEFwI9J/H7FZg5
         GY40swE68+WliAErdO096feYMXAl0pcw+GHNlixFYeXGIHopNOfDdJrCi5Ej79cijTKG
         JEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752562676; x=1753167476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hi3b18kCJ2PN/uE94e7W0oedaOkuFFQ0dFZ0p41G3yg=;
        b=IKDGAThIsQNtGVDB0ODza/NLFGn8nh2y0OeWnKiLWKRGWcgsrJXcwaxHrMmXPAS6d5
         wi10mTnFqDadgteSfhUz0HOaNJ8USiI9e/XWQZzGh1ibdNC3b8PemPAWJqwLv/3YAFPG
         1eO2SOuorKmY+6PQ/zGsZdfExgzsrZ/mpTwB0BU9aKeEl34fWWonTei6/pHZuqJIPJBO
         S9/KnW4lEgNjdLZvBUHlmYqmUbfc5wMer5ulsNMrXR+MQMY3PMxgM5sxav+F/lzl+qEo
         x7LZBf9O05NU8gkEBLfmQRTrshVv+S+Xls16xuxe+xyf1T74KF+Iom6KsnG+kO4VNbyM
         2GIg==
X-Forwarded-Encrypted: i=1; AJvYcCXtCgNNXFk3w6qcwJY5iwljqjr1wb4k5m2np9Go5Lno3Bfoxcix6liIVOzfZfDmkbWMukVp31JAI/8tKKrp@lists.linux.dev
X-Gm-Message-State: AOJu0YyY4cmjqJp9U6OhBDeqFLw5M+G274sRjYS/RgCETlMZKcJIwUde
	Vl4a/eJHwwezvbUbOe5732++u9tTla37angV/GEmCoCaBT+v5ODJiYvFGfNcqLECAi9yjDwmuo+
	idY8Fdn3vXwgw5FYeUtZ+1AG/8btyx3Y=
X-Gm-Gg: ASbGncs3WJGPx6BYaRHuGNZAlCconaSoiRcE9yhdNSDHbeBXupailfheKjKWELLo4w8
	OsQkIRLq4etQeYHvGzum6tRGCugV3EuhN901mLj33c70nGDYxYEWspe7YMvKUYk7QftoW0GM8MR
	FMrA9FdbTkJlkIhial+zk3iLqTGJmXApCo1ytgeyPpqxMStZYnHDA1kk/C7q1X9RoHruc/5eoDR
	rXbqrSfkKDdUCGUQQLQ
X-Google-Smtp-Source: AGHT+IG0UYcy/IX+HCgW4D/Eb7WFEQbTW2Fprb7+3GKJ779x4KY8mPx/djHYIJol9OlevhyUSkGo9wlgh5i3URkxtE4=
X-Received: by 2002:a17:907:f810:b0:ae0:a465:1c20 with SMTP id
 a640c23a62f3a-ae9b5c2bf92mr234673866b.14.1752562675871; Mon, 14 Jul 2025
 23:57:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250714153409.46085-1-martin@weidenauer.cc> <CAHp75VdUNe=bn-Emv6oyHtejTMyhKaiqQfGic0Ha94Z_FAPs2A@mail.gmail.com>
 <4289C286-62A1-4C22-9A03-E6CD3731F3D7@weidenauer.cc> <CAHp75VcvOaSPbrpurRAjrvwW992qiP-ffZcroQ-feg=_PAoquQ@mail.gmail.com>
 <1D5485BE-E03F-4364-A48D-051AAECFBA9A@weidenauer.cc>
In-Reply-To: <1D5485BE-E03F-4364-A48D-051AAECFBA9A@weidenauer.cc>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 15 Jul 2025 09:57:19 +0300
X-Gm-Features: Ac12FXz-ngLNhXyig1mNzAZmiCXxYtUqkaoJxPmRSqbAxbX9Ie3FUAhsw-uMXeY
Message-ID: <CAHp75Veovvxbr_6EuubDa7x8P5j12WjER=ar7E69A4r=sGONsw@mail.gmail.com>
Subject: Re: [PATCH] staging: atomisp: isp: fix open brace on new line
To: Martin Weidenauer <martin@weidenauer.cc>
Cc: Woohee Yang <woohee9527@gmail.com>, Jongmin Kim <jmkim@debian.org>, hansg@kernel.org, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com, andy@kernel.org, 
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, 
	~lkcamp/patches@lists.sr.ht, koike@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 12:54=E2=80=AFAM Martin Weidenauer <martin@weidenau=
er.cc> wrote:
> On 14 July 2025 23:38:47 CEST, Andy Shevchenko <andy.shevchenko@gmail.com=
> wrote:
> >On Mon, Jul 14, 2025 at 10:39=E2=80=AFPM Martin Weidenauer <martin@weide=
nauer.cc> wrote:
> >> On 14 July 2025 19:47:41 CEST, Andy Shevchenko <andy.shevchenko@gmail.=
com> wrote:
> >
> >> >Guys, please, coordinate and issue only one (or a few) patch(es) per
> >> >an issue. No need to send zillions patches for the same problem
> >> >file-by-file.
> >
> >> >On Mon, Jul 14, 2025 at 6:34=E2=80=AFPM Martin Weidenauer <martin@wei=
denauer.cc> wrote:
> >> >>
> >> >> Fix checkpatch error "ERROR: that open brace { should be on the pre=
vious line"
> >> >> in ia_css_dvs.host.c:277.
> >
> >> I deeply apologize, however this was the instruction of our workshop i=
n DebConf by Helen Koike <koike@igalia.com>
> >
> >This may be okay for the driver that consists of let's say less than
> >10 files, AtomISP consists of dozens of files in several (nested)
> >folders. It's not a good example for such an approach.
> >
> >> Here is the link to the exact workshop:
> >> <https://debconf25.debconf.org/talks/55-submit-your-first-contribution=
-to-the-linux-kernel/>
> >
> >Hmm... this really needs an update to explain how to work with the
> >drivers that contain many files and literally tens of thousands lines
> >of code.
> >
> >In any case the problem with your contribution is not the code, the
> >absence of coordination and possibility to clash with somebody else.
> >Also it looks like a DDoS attack against maintainers capacity. The
> >smaller patches are and the more of them --- the less the usefulness
> >of all this activity as at some point that floods the maintainer's
> >mailbox.
> >
> >TL:DR; (always) Use common sense!
>
> To be honest, such a contribution also seemed to me a bit useless but I t=
hought all of this had been discussed with you maintainers beforehand.
>
> As it seems this was not the case, although the workshop has shown us how=
 easy it is to make contributions and for my part I will use the knowledge =
to make meaningful changes.
> So you can scrap this commit and I'll make a few commits in the next days=
 which make more sense.

The problem is not the code, the contribution is okay and appreciated.
The problem is that for _the same_ issue there are tons of patches
from _different_ people. Just discuss who does what and send "one
contributer =3D=3D one issue" (under one issue, I mean class of the issues
checkpatch or other tools report, for instance, the "if (foo)
return;"-like which are on one line and needs to be two or more lines,
do _all_ of them by _a single_ contributor.


--=20
With Best Regards,
Andy Shevchenko
