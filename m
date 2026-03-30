Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D68938F937
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 16:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774889119; cv=none; b=ekJQ3ni+/UNh5z30L77JTRE8e16cgG9RZ0spd3EAoVu2jMPctyIbvAJPnv0YtfbI6lpp4jM6PK6m7B4c0z8Yhj1dyTBe0lwKLb/xQyCQFAW2fm+Qy7sT3Tw8C2/Zhe0H6aReDU6OdwPtJb+EtDc24UmaXqAqygHLGfq6rQa2/g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774889119; c=relaxed/simple;
	bh=cDdS45lavJOKhvVvf7Im6p8b+Plxzdq4VLLt3nmyGa4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VIHkz6dMWDsuMPineq4sBDpIdFb43PSvgGxXiE2CYe41BcgNN2NZjHOtYBvNRh8HjO0hS0WK7ifSz8pw6RSYoqkCzDAJiOEXSRfRrHR0mpTqbZrAeQViBmBuQ+1YKALO5aqcqtCCQxEm/KUTXx/iQWeQblVNrfxXSpfVkgC8eoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BawTVvW8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BawTVvW8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8CB8C2BCB6
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 16:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774889118;
	bh=cDdS45lavJOKhvVvf7Im6p8b+Plxzdq4VLLt3nmyGa4=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=BawTVvW8MfthtSM7EjuuTexhu+g6v03GXeZmrU5PJ68JA/fGMBCWNIN2w0UAoGeVQ
	 3LBMLnsEeFzryjqocEIOr2JWRmS3Ys4N4jINcIoqlz6qlHK/OAHGJr8j3/A68i0WOr
	 Uc7oE3e1hmKKXP5aMtAs8FaptvXbhYRuUbsMZZClZqzkjrS27q0beJ6Qj7+CsJu7B0
	 kWzSWCqs94JnKjVyiofE9D3IJG1SPaXiCbPY4ZiBx324rwgbJ0pcghUVj093YlbB91
	 Fn95Wou9t4owNwX/4xfYYODNI6fPLDEWWqcgEpJnhdBWn1ZAJghXCFwZGzRKSvrdwg
	 EOqV8zObOAmCg==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38a76ba6a78so32203691fa.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 09:45:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVEruiqy3FbQGrEdrdx1SFEToae5u+D1XLLMbQmo4wA6uTaE4owzioTwbg/xuiz8QHkedEez5HJawDdabtL@lists.linux.dev
X-Gm-Message-State: AOJu0YxkhjRHcYMZDk+VettkskVPASkqhqUdm5DaTefDuJG8rPpPD3S+
	Sfn6FQiy6R/zJr+Ngw7258Wh967CHOevT8uN9xMXYVcoOpJeD0oarfuqLMFwi4YjWrDzI0p/Ul0
	5uqY+JOy7JJ5qZA/9vIO4n5dSxDkI6d8=
X-Received: by 2002:a05:651c:3041:b0:38b:dd7a:52aa with SMTP id
 38308e7fff4ca-38c731eb805mr36701791fa.7.1774889117273; Mon, 30 Mar 2026
 09:45:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260324080856.56787-1-pengpeng@iscas.ac.cn> <2823210.mvXUDI8C0e@jernej-laptop>
 <CAGb2v674Ei2uFh6O0LoFoJrPcqGKGr_v+hfvE7TSfwztxDfTAA@mail.gmail.com> <603785eb48d69bc50c0296fc696eb0985c2a3ac5.camel@collabora.com>
In-Reply-To: <603785eb48d69bc50c0296fc696eb0985c2a3ac5.camel@collabora.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 31 Mar 2026 00:45:05 +0800
X-Gmail-Original-Message-ID: <CAGb2v65EM1rZwePR2B8Y-ipz4iEJPLnd4jsfu140N9vq4GYL2Q@mail.gmail.com>
X-Gm-Features: AQROBzCCf-gBGZiQsgZ0PWLzupAc_iXzFsXr0d6GTNbJZ5GFha2Q7zktumWSWEw
Message-ID: <CAGb2v65EM1rZwePR2B8Y-ipz4iEJPLnd4jsfu140N9vq4GYL2Q@mail.gmail.com>
Subject: Re: [PATCH] media: cedrus: skip invalid H.264 reference list entries
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, 
	mripard@kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>, paulk@sys-base.io, 
	mchehab@kernel.org, gregkh@linuxfoundation.org, samuel@sholland.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 11:55=E2=80=AFPM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Le dimanche 29 mars 2026 =C3=A0 20:44 +0800, Chen-Yu Tsai a =C3=A9crit :
> > On Sun, Mar 29, 2026 at 5:21=E2=80=AFPM Jernej =C5=A0krabec <jernej.skr=
abec@gmail.com> wrote:
> > >
> > > Dne torek, 24. marec 2026 ob 09:08:56 Srednjeevropski poletni =C4=8Da=
s je Pengpeng Hou napisal(a):
> > > > Cedrus consumes H.264 ref_pic_list0/ref_pic_list1 entries from the
> > > > stateless slice control and later uses their indices to look up
> > > > decode->dpb[] in _cedrus_write_ref_list().
> > > >
> > > > Rejecting such controls in cedrus_try_ctrl() would break existing
> > > > userspace, since stateless H.264 reference lists may legitimately c=
arry
> > > > out-of-range indices for missing references. Instead, guard the act=
ual
> > > > DPB lookup in Cedrus and skip entries whose indices do not fit the =
fixed
> > > > V4L2_H264_NUM_DPB_ENTRIES array.
> > > >
> > > > This keeps the fix local to the driver use site and avoids out-of-b=
ounds
> > > > reads from malformed or unsupported reference list entries.
> > > >
> > > > Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> > >
> > > Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> >
> > Tested-by: Chen-Yu Tsai <wens@kernel.org>
> >
> > This fixes a KASAN slab-use-after-free warning when running fluster H.2=
64
> > tests.
>
> Ah, very good, can you cite which test caused that ? I didn't expect flus=
ter to
> cover cases with missing references. I think it will be handy for future
> testing.

Looks like it is FM1_BT_B. And it only happens on the first run after reboo=
t,
or KASAN just only reports it once.

BTW, this would be a lot easier to figure out if we could get fluster to
output a system timestamp for each decode run (at least in single job mode)=
.

I had to hack in delays between each decode rune, and then look at `dmesg -=
w`
and switching back to the window that has fluster running once the warning
triggers.


ChenYu
