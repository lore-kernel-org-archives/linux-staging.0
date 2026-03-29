Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651D136EA9B
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 12:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774788281; cv=none; b=naCVFTA5bHwIByq2Ddhll+rO0FV/1uVLHTMgsmHoZAbWIPrtVc2N77zGwhv5Hb1AM8fy4E+XQRil2kfu90hyVfBVBlXN9XphqePuAv1Xm22rRJ2fAtViMu2gaOqnpfI7HZmCHA11QtgvA3qeuaTZUHe6Yg+dlPHzzfRUT8nhKoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774788281; c=relaxed/simple;
	bh=vU0+X+y3jioy6E9J30w+FzWYOuFdPtfTOpozKDtwEEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rJ4ILXNgFqZqMtqXzQgvJaGaHbr7J/0jIGg7uQztVU5itaNQqK/I4HOnhUjiajk/jGJ0NSmuZGlNnjCiU2tSFjjixJJyIUIfVF1fatZg+bTD5NpAPLE4iib39elHAGI5OZkkldcamv4qWBv7JND6cCNQVEmd43q+6lrvy1HVyYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sykENkDT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sykENkDT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12B9FC2BCB6
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 12:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774788281;
	bh=vU0+X+y3jioy6E9J30w+FzWYOuFdPtfTOpozKDtwEEc=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=sykENkDT++Jf86J8mOgWM6MXobVRK7SW/QNk54DSf995REgGBtIdJj2QRrmJqHA3G
	 oXpmbf5/h7xLeddkmdyIY3BKhMpQ4nf/l4hNEbpzE3MFo659oVTzR7fNISdVs3xeA+
	 Nvt+8WbZcwlvU7eNe3431MVo2eVLLxVuYWjLbRkOy6m7fbYk7T9aRteKtdCIEr5FTT
	 XUaY+KAQeybXF9WcNfuHEWqqn39Z1YaIZUSZzoSkN/gGnkfBoCkFhsLtjaEixEjqnj
	 3nW79M54oN9h6HTPMzK9TbGmmYPLSc39jDauyk6twRCdQf8S3gARUbaU3h55NMFr/0
	 Of/VKc1VTOHxQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38b3ee785a5so30168851fa.1
        for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 05:44:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVvjtawyC7qLYeuMCBYpzaXALQklBKvkGITcRhR8w/7fMWnLXuHs4T6NLX1vy0lMJSALIiphxGOYv79++0T@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/SrcNaky1B99lqG3X6w3BJTCsmlda2Y5EFUP8eInPra7Xshn3
	PBzoIkvVO5zDQuDsT1T/+8kxB3m9v6M1N0QhUpSpPd9t4+8qnmLUtWnVa6ZSoDPLkFkNAYg5fy4
	rMFODj2q7mnyFvQ6BNhqEzBCcv8nNATk=
X-Received: by 2002:a2e:a54f:0:b0:38a:2a56:9546 with SMTP id
 38308e7fff4ca-38c75c900demr24797411fa.13.1774788279369; Sun, 29 Mar 2026
 05:44:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260324080856.56787-1-pengpeng@iscas.ac.cn> <2823210.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <2823210.mvXUDI8C0e@jernej-laptop>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sun, 29 Mar 2026 20:44:27 +0800
X-Gmail-Original-Message-ID: <CAGb2v674Ei2uFh6O0LoFoJrPcqGKGr_v+hfvE7TSfwztxDfTAA@mail.gmail.com>
X-Gm-Features: AQROBzBu8cBmUz_qtapXabXSe1cUlYbMC4_Is2O7MBHQ-BNPxfI_Wv0OKcRIafM
Message-ID: <CAGb2v674Ei2uFh6O0LoFoJrPcqGKGr_v+hfvE7TSfwztxDfTAA@mail.gmail.com>
Subject: Re: [PATCH] media: cedrus: skip invalid H.264 reference list entries
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>, paulk@sys-base.io, 
	mchehab@kernel.org, gregkh@linuxfoundation.org, samuel@sholland.org, 
	nicolas.dufresne@collabora.com, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 29, 2026 at 5:21=E2=80=AFPM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne torek, 24. marec 2026 ob 09:08:56 Srednjeevropski poletni =C4=8Das je=
 Pengpeng Hou napisal(a):
> > Cedrus consumes H.264 ref_pic_list0/ref_pic_list1 entries from the
> > stateless slice control and later uses their indices to look up
> > decode->dpb[] in _cedrus_write_ref_list().
> >
> > Rejecting such controls in cedrus_try_ctrl() would break existing
> > userspace, since stateless H.264 reference lists may legitimately carry
> > out-of-range indices for missing references. Instead, guard the actual
> > DPB lookup in Cedrus and skip entries whose indices do not fit the fixe=
d
> > V4L2_H264_NUM_DPB_ENTRIES array.
> >
> > This keeps the fix local to the driver use site and avoids out-of-bound=
s
> > reads from malformed or unsupported reference list entries.
> >
> > Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Tested-by: Chen-Yu Tsai <wens@kernel.org>

This fixes a KASAN slab-use-after-free warning when running fluster H.264
tests.
