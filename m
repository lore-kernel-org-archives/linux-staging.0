Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66025483811
	for <linux-staging@lists.linux.dev>; Tue,  4 Aug 2026 17:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785862870; cv=pass; b=aR9fGciPgCJGYqbuGOsZaVpAat+jfR86Y/3eVsPkPMJ4K5T50g4QZk5DqHyTgBvwgCi6jLBGPYYvbLkvqQhD77rrFkllYtyLeai3qpXI1hDix0o2KhLvkH1X/gx+XnT9FNtK1uhLl9Pp6HEzwVCO7V6Gtv3/5mqRcVlfgH1IUUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785862870; c=relaxed/simple;
	bh=7LGDvYNraJyxxzuG8UPCwg66JisUFuV0RYrRb4huUXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jV0u/YCYV4rpC5xu0F7E2h1caC38HQkfR+ri3Kw8+1DaVnsnh6YGY90qACftbs1HGZr7J5fHsJV7QsL60ryvFY/Pc7zg5MwLIAT7eZgvwvyFZre/hIFNVP04NMrDcyRpc1rgZ0kGSvTzEHJ+iGLOgGcwUYhiL3sCLfsPzoG7GVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XAqjIkYV; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XAqjIkYV"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e3617ba36so34046a91.3
        for <linux-staging@lists.linux.dev>; Tue, 04 Aug 2026 10:00:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785862859; cv=none;
        d=google.com; s=arc-20260327;
        b=E5JQI45mxD1l6QEJcBUsYftGNBBrVBbi9dCGDr6kO1iq3VBu8F/iAsntga8zV1QRwo
         Ctnz+LdAzvyk7bCqle0Uwryfl1g7fpOWNOUQJlPNMwgFhKYEFEsKEaXk9/AAAMp4YJDJ
         VznuGp60v/tMs2cad430OwmMPObKGyay9WRJTUD7xlAd3+rxQEQXSGitIfa9uIxmRBoI
         ommB5JD0S50yvgNhRjPIaX8cFHzdBMBabCHbmnbDW+BDT9sMdJKKFIE+wg0V0xSXtY1s
         x6o6ZqNCrFBuiTGxkQ/SYVQnPD9uGBoezsYz/nEPFeeiwo+BgfothxvTijam6+7OYqSh
         Izfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pCZuKs0qX4CU4q9WPMjt6iYrr/TPgzMfAAb/GRY+q7k=;
        fh=IEb9aZ05VL6meGhi6o7PA2yStYpEjNNGNNaonufcggE=;
        b=aRN4IUtpkpylGPWqaYUb5dUJa4idLvoCO57coWqJ5XlXiCgJJAvNYiWuXGb7i8dTgY
         uEHAv5mMGtpH26UeQIXB0LtGTSkyJNYP8uAmPydEnW4YXSoaI+CLaMpWO4FN9+RTnCtq
         oTTn9E2qhUFdPvf5J0N8WR2sQE1bJ32zQ1OoerE1UOSrv9xr07j2NyihpSaYY5Io5815
         XpuvUFhGvI9HfafrtCl6lYiHs+8hxVfGlHOXYCwC2umSAVdL8bG9tTaClyoNLe09mhHx
         9wkf1xjBny6ACzJMhpfTZCa+zA9Xtas4T3YCWIN5xT5k22bqs+f4xDjE/yTuVWbPNwn6
         7aeg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785862859; x=1786467659; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pCZuKs0qX4CU4q9WPMjt6iYrr/TPgzMfAAb/GRY+q7k=;
        b=XAqjIkYVLxmrIb18X2PzRd4eWRDPoDKCZ38YEYFWNIJ1RrVEbimZRHoNoWfdaYag+Q
         cUNzFh23xV0rnCF/kTLLmJZ2W7YV05MT0p+RQjvGLfF1+bBvMF+W1dc8Uzz+ZpjkPJx0
         B52WNAdDvhfszPMbWtuO+s6TYhCtXswI02Gi4nPijTVm6lzDtsaPGawIu6Tarn/FIh0C
         0LAXPu2OR5ERVo5uFRJuVNP4JbNAgo4PevuG6D9IyGovgw0dfKJsOMNBlpWjKKtg0vdY
         ceKsvd7XcGTjs/gSZuLjPJc+LlhCu0K2fGtGLRk/VeSfNxtPpoXLKvvCFx5AeLmt8fWd
         SB5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785862859; x=1786467659;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pCZuKs0qX4CU4q9WPMjt6iYrr/TPgzMfAAb/GRY+q7k=;
        b=act6HAuxZA5Qb07t9ie6mo8VrtO6ChoI4R5w0w6xuwEKkhUn2qR2ZpKQNl9jBGk8Fd
         HVFhKuKKJ3XzLrDH8ZzDzi0KzX7kuZ/iwBUnfopXH5hXPTmC3+NNkiA00kjgbrqeCt8w
         K+jlVCAri99zoK/1ceSSvbTMZK1wAQUCULjCvBV/qfDGMjSvbVKb4JnKLwX7QenXMjZs
         zx2HVCxnE17i6vnlkWqRseWvB0WysmTj49ccbooz9XKU6+ZyVXBenI+1b0F5dn+53aNN
         qnovoTkuvD0mgR2vBdqj9NIUVchntlSOmEqx5WDbGmnc2wgNps990UnrL1XNky0EEKHs
         FvhQ==
X-Forwarded-Encrypted: i=1; AHgh+RqZcY/GInuHkXvESlR44eLCcxxb5bYzTbK1BtJPjzx1L0niR+ZmL9GuA4uYwUZ07+uNJP1E+w1lSEzaNJdP@lists.linux.dev
X-Gm-Message-State: AOJu0YwBCv0+h4B7XBA9KxCcFSKPA1cHlmxp4rFsy7uFXNbmztxTUdy0
	sm3RS+4Ryjp6O3xQjaUe2gZHLRfs8ca6KA8ill0/IyzUbEGUw5x9USVcjemjsOTnX8X2IMwmjxv
	MO8Wg7u/avfh71JJlZARDL4aXrKSzvXQ=
X-Gm-Gg: AR+sD13EwNqFoxVajRXkyxlphRgPhid6SF8pNpn86OcffBdxqAYGwDaIsOZWlie0i7k
	48fSstW/qr8zPxScwZt7SUutFLu9BY2RQkaIBpLipHhnF8aDfo5nn5PNlb8ryOoEg3sDPv1T/uL
	39mxc2x/J+/r0xOddltZfkzM+lotXLm4xSuOlq7s5zCPT5ru9PqgiN+PFdzdqYMkZ3nBv4eNy/W
	nKkyL8fJ3+J0b7qqOxvTV/+duGB1LZBXWevcoUE0LDPgcV42/NdyF0+SpMDxl49OH2oFvvma9Mr
	P0iuRn4Cb2XHXFiETGNVI1AnGAPtDT4P8XssDEhTKT/yafQ=
X-Received: by 2002:a17:90b:2b44:b0:368:9da3:c496 with SMTP id
 98e67ed59e1d1-3903c699b4cmr324672a91.24.1785862858548; Tue, 04 Aug 2026
 10:00:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260729172707.13333-1-mishraloopmohit@gmail.com> <amyNLGjym9jzB-NH@stanley.mountain>
In-Reply-To: <amyNLGjym9jzB-NH@stanley.mountain>
From: Mohit Mishra <mishraloopmohit@gmail.com>
Date: Tue, 4 Aug 2026 22:30:21 +0530
X-Gm-Features: AUfX_mzP6vEXTfjcCNm3wOmegnJnHD1PGxUqD36tzr4_FXdOaeUm4N4gSkpphlE
Message-ID: <CAP5HdgqNmUoRVS1-091Zs96YopSt5ugP8LLK+v43EzvFzbx2+g@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: fix underflow logic in swing index calculations
To: Dan Carpenter <error27@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 5:40=E2=80=AFPM Dan Carpenter <error27@gmail.com> wr=
ote:
>
> On Wed, Jul 29, 2026 at 10:57:07PM +0530, Mohit Mishra wrote:
> > In ODM_TxPwrTrackSetPwr_8723B(), the baseband swing index variables
> > Final_OFDM_Swing_Index and Final_CCK_Swing_Index are declared as u8.
> > However, their calculation adds Absolute_OFDMSwingIdx, which is a signe=
d
> > 8-bit integer (s8) and can be negative:
> >
> >     Final_OFDM_Swing_Index =3D pDM_Odm->DefaultOfdmIndex +
> >                              pDM_Odm->Absolute_OFDMSwingIdx[RFPath];
> >
> > If the resulting sum is negative, it underflows under u8 rules (e.g. -5
> > becomes 251). This causes the lower-limit checks (e.g. <=3D 0) to fail,
> > and in MIX_MODE causes the logic to execute the "BBSwing higher than li=
mit"
> > branch instead of capping to 0.
> >
> > Additionally, in BBSWING mode, the check for CCK underflow mistakenly
> > examines the static struct member pDM_Odm->BbSwingIdxCck instead of the
> > newly calculated Final_CCK_Swing_Index:
> >
> >     else if (pDM_Odm->BbSwingIdxCck <=3D 0)
> >
>
> This is a separate thing and needs to be in a separate patch with a
> Fixes tag.
>
>
> > Fix this by changing both swing index variable types to int to enable
> > signed math and correct branch selection (aligning with the TODO item t=
o
> > convert remaining unusual variable types). Update the CCK check in
> > BBSWING mode to examine Final_CCK_Swing_Index.
> >
> > Note: The fix is scoped to the calculation and branching logic. When
> > passed downstream to setIqkMatrix_8723B() and setCCKFilterCoefficient()=
,
> > the values are already clamped within [0, 42], fitting safely in u8.
> >
> > Compile-tested only; no hardware available for testing.
> >
> > Signed-off-by: Mohit Mishra <mishraloopmohit@gmail.com>
> > ---
>
> The type issue is fundamentally a static checker type bugfix that
> unsigned values can't be less than zero.  Linus's take on that is
> that this code:
>
>         if (x < 0 || x > limit) {
>
> is perfectly fine and readable as a clamp even when x is unsigned.
>
> In this case the commit message has a lot of extra discussion about
> how the math could lead to a negative value because we entered negative
> data or we had an integer overflow etc.  The result is that we clamped
> it to zero instead of to the upper bound.  There is no evidence that
> any of this is possible in real life.  And also if it were who cares?
> Zero is a valid value.  If you use a complicated integer overflow method
> to get zero instead of just doing it the normal way, the result is the
> same...
>
> The code is pure garbage, of course.  I also have written that choosing
> u8 for this type of variable is dumb:
> https://staticthinking.wordpress.com/2022/06/01/unsigned-int-i-is-stupid/
> I don't object to fixing this code as part of a cleanup but the commit
> message needs to be more clear that were cleaning it up because the
> code is garbage and not because of some kind of complicated safety issue.
>
> regards,
> dan carpenter
>
Hi Dan,

Thank you for the detailed feedback and for sharing the article!

That makes total sense. I'll simplify the commit message for v2 to frame th=
is
strictly as a code cleanup,

I've also dropped the BBSWING check change entirely as suggested
keeping v2 as a focused 2-line type cleanup.

I'll submit v2 in reply to this thread

Thanks,
Mohit Mishra
