Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEFC26E140;
	Tue,  8 Apr 2025 12:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744116824; cv=none; b=J+2Wfvh1zFMyvRrmkN3EveaTfS11RTf6QTol0Oq6p8HAA54SxjyEHZOdKoOzg31tXguFbSK/uo/IIeM63OOKwzc3SXS4m8iiwA2AV45d7yl5lJBRzP48nDtWJ8huQWXuxQ5GI1JxrtrazVndUqAtoNUEBa+OzZirJgNe37a3A/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744116824; c=relaxed/simple;
	bh=eDQnZvYqzPIHj3GXOYZ62c9kispFDw2UFftF8wYsUPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ld1dT54uYJsNWwaGeA8OdNn1JiZsdd2/BtQGzun5prCo9oR/gYYyEIHDeLOW4ZiNyV5B5imYKlN6qJ9psYJBIRCHlnwHNV3lDBLf6mTJnjA1MkIwfhgDRBbUuqt5gHDm3FnhiOX6IgIl+4Qvq+cdUliWjRUz+pbhTbpjnqDGEN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PXwgQ5RU; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PXwgQ5RU"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-52446b21cfdso2425270e0c.1;
        Tue, 08 Apr 2025 05:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744116822; x=1744721622; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIq/yQ5RheCuvsfWtElAvvAAikClpQGQxOw/BQ1qNWc=;
        b=PXwgQ5RU9wpNubuoEfG/r7KWYjCMRip3sJSOobVX0ZhXP0fZ03R44FpdO6WRcKgjs1
         Jtjt5AUmm22ITteoSmIUdPloUFjMwMKkGIMTpR+96Jexwn5qVlznfDuhqmb1fq6a3gx7
         FR7jaIhZrqPKSOnkCrjvY2MiL3bS68L8WAfKEoeVK61qg8XsSpwY4nupwAL6bD5M6OL6
         nvK7OHu8sXnC+nzFFH6qA9a98ln1XXDbfLK2eG6xuVn0UI9ychmy+DA2WfB3r+q1Yjix
         +zIoKb/zF2zGrKAU/QW7sSyAdqjsmpjHcwcX6F/1tlqgqzVJH/NAo3hKc+CakOFym3uT
         OITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744116822; x=1744721622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GIq/yQ5RheCuvsfWtElAvvAAikClpQGQxOw/BQ1qNWc=;
        b=KINkPbURLxEdxcdioGJhUgrxOYuOKW4Ae1nCrfwEKK1rqvuCSVeRKeSByoCuLlxB4Z
         SFrHSFNLAyklmM33A0fBR2khxA0wkY0ta2G7sYioSAAeDGwBRqYpGvi7ytra1g9XDhHm
         mSt9+ZPRCS8oUq6gd7jGmBmHQA2NEcHeIA/fbgYRHWsorf5ii0sryvZ70s/zun+LeGdx
         oyJo43EHZL924+K1yg6e01ZSEYjMMKx4t4FLFKHPz5L04n2YFxeYfI1CBIzom/h/wHjs
         T+Y5Fyy+suavxLCqa2R1ACiSuPEaiuQ2W6sXjaSKdRPhK72rk4+PxZgJfqHb8MfKZJu7
         4CDg==
X-Forwarded-Encrypted: i=1; AJvYcCUWiDqCuI7EPnHvrKoHTKFk3FKXLV9phHtMo2E62deSDMGVcJiRyrXNN6EfBePuXHW5l6IfuXO2DSHKvD4V@lists.linux.dev, AJvYcCXjc7/1XKr91P/om4XhZyKe3ZSl+nBSpytfkQ7q6LyAuwdYA4A8eQFu8L41DTxWsSW+QYQxbvJREZtH@lists.linux.dev
X-Gm-Message-State: AOJu0YzGf0pKFXr44IIm6Kmz/JArhl6p+G3lmvBFTEJlRI+Oa/iM4NqT
	8BeVgqJra/P2m4WmVH52OMVBteTKnv5othe9ykaUASepyIdtkwtQf05GRf12uFwReo2qBnLkWCF
	VXtqh0RDV6Bq0lR6Z7HtSNtHjZf8jQGOI
X-Gm-Gg: ASbGncsliisFic6YhKMNz6nd/Os4Pq3DM2zORNmzUu23Mf9JfWLM3cQ38+rhqzvzQQR
	6d3C2YEjrCbtwcjAcid91YitRNvtAtEWdPpAS4Mj6XB6ivIeTTRm+KDeMLlV68GVkhdrMPLNuEe
	XH2wpsKI3EbpZxehJ6RMRyCdA50g==
X-Google-Smtp-Source: AGHT+IEHB/H9Zx51XBa+bNpK+8kfLf3aYgLj0AMK8itP336eyoFF/iW7S/dMcwS8QaJoGoxnRarogoVf8Q8WSArFHZw=
X-Received: by 2002:a05:6122:2016:b0:520:6773:e5bf with SMTP id
 71dfb90a1353d-52765c22e36mr9606626e0c.1.1744116821855; Tue, 08 Apr 2025
 05:53:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1744061673.git.abrahamadekunle50@gmail.com>
 <4ccdbfd3e8d74d99679927f294f71cfb694fcc6c.1744061673.git.abrahamadekunle50@gmail.com>
 <CAHp75Vfp8Je1fUavSwTDAM_5_rDaDfXETa2oM5f0CjL1mxWX_Q@mail.gmail.com>
 <CADYq+fbh=kG2JABmdF8FjjPiyigMpnJ7WhQh+faqRk6FJe4MBQ@mail.gmail.com>
 <Z_TtyXwkOBK1MXGy@smile.fi.intel.com> <b89c8837-4aa1-4073-bb09-f71f37b5dcc6@stanley.mountain>
 <CADYq+fZ-LmoyGrAFsEHBwM2WJthpqGYhPLmAJ3Ea0B=NvmC8aw@mail.gmail.com> <7bcdd745-539a-436a-a0df-bb2cd8dc7340@stanley.mountain>
In-Reply-To: <7bcdd745-539a-436a-a0df-bb2cd8dc7340@stanley.mountain>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Tue, 8 Apr 2025 13:53:33 +0100
X-Gm-Features: ATxdqUE_dphc2k6uzLw_C1GT06QIbYUlHzPUkh4Z-A6lb5uA7H9AiEW5_qnOICo
Message-ID: <CADYq+fas148z7WFMVk1_0bj4EmaWSV4_mE3sDr1VfTdFfts2-Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] staging: rtl8723bs: Add white spaces around binary operators
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, outreachy@lists.linux.dev, 
	gregkh@linuxfoundation.org, julia.lawall@inria.fr, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	david.laight.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 1:38=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> On Tue, Apr 08, 2025 at 12:51:03PM +0100, Samuel Abraham wrote:
> > On Tue, Apr 8, 2025 at 11:36=E2=80=AFAM Dan Carpenter <dan.carpenter@li=
naro.org> wrote:
> > >
> > > On Tue, Apr 08, 2025 at 12:35:05PM +0300, Andy Shevchenko wrote:
> > > > On Tue, Apr 08, 2025 at 10:22:44AM +0100, Samuel Abraham wrote:
> > > > > On Tue, Apr 8, 2025 at 8:20=E2=80=AFAM Andy Shevchenko
> > > > > <andy.shevchenko@gmail.com> wrote:
> > > > > > On Tue, Apr 8, 2025 at 12:54=E2=80=AFAM Abraham Samuel Adekunle
> > > > > > <abrahamadekunle50@gmail.com> wrote:
> > > >
> > > > ...
> > > >
> > > > > > > -                                               psta->BA_star=
ting_seqctrl[pattrib->priority & 0x0f] =3D (tx_seq+1)&0xfff;
> > > > > > > +                                               psta->BA_star=
ting_seqctrl[pattrib->priority & 0x0f] =3D (tx_seq + 1) & 0xfff;
> > > > > >
> > > > > > > -                                               psta->BA_star=
ting_seqctrl[pattrib->priority & 0x0f] =3D (pattrib->seqnum+1)&0xfff;
> > > > > > > +                                               psta->BA_star=
ting_seqctrl[pattrib->priority & 0x0f] =3D (pattrib->seqnum + 1) & 0xfff;
> > > > > >
> > > > > > You mentioned Linux coding style, which also requires lines not=
 to be
> > > > > > so long. These lines are. That's why a few versions ago I sugge=
sted
> > > > > > you to change these to be two lines each. I don't know how many=
 times
> > > > > > to repeat this (it's third one).
> > > > >
> > > > > Okay, sorry
> > > > > I will add a third patch for a line break before the patch for %
> > > > > operations since each patch should handle a single thing.
> > > >
> > > > I am not sure you need a third patch for that. It lies into categor=
y of space
> > > > and indentation fix.
> > > >
> > >
> > > Yeah.  Let's not go crazy.  Do the white space change as one patch.  =
The
> > > rules are there to make reviewing easier.  Splitting it up into three
> > > patches doesn't help anyone.
> >
> > Okay thank you Dan. I have collapsed the spaces and linebreaks into one=
 patch
> >
> > >
> > > In staging we say, "Fix one type of checkpatch warning at a time."
> > > That's because it's a simple rule to explain and it stops people from
> > > sending us huge patches that fix every checkpatch warning.  But this
> > > patch is small and everything is related and it's easy to review.
> > >
> > Thank you very much for the clarity. I understand now.
> >
> > I already asked Andy, but I would also like to seek your opinion on
> > how I should version
> > the next patch. I already made this current one v6. Do I send v7 with
> > changes in the cover letter,
>
> Yes.
>
> > or changes in the individual patches?
>
> Both?  Put yourself in Greg's shoes and do whatever is easiest for
> Greg.

Thank you very much, Dan.

Adekunle.
