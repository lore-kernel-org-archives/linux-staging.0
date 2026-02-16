Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6597C330667
	for <linux-staging@lists.linux.dev>; Mon, 16 Feb 2026 15:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771257166; cv=pass; b=HaYwYcUrFczNdAFauWjqBcEjGeLKxS/8UEkhDtAcWHUSyqZ3lymeQG6CWxI6fRKb5WLH8xyzcC7fjSdF+D4A1Pl09o0tTTLAVWmBOaNiKgMslS9ZACL0jSVPyJYpZuQfVlFgMejtwOmS5biBh0+aSbJ8lQnfzco4vXJat4Sge0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771257166; c=relaxed/simple;
	bh=WtNg8/l1eqg1/NegOwlpY7SzuGpHu6ScT3AQG3qCNFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZCru+dduvHiZzMOWx6xlVJ2byAgI1Xv81blt+E7GSzb6UJ0fpYh2+Kpdpq+oUmRDQR+83yDIR2euIPUwU0B25KqZ+YsZzDXkKYlM4/XpCBRMWKptb4/MZ4iqAcaF2XTVvbCk9DGiVKLqsHTRpyS+sDsx5CiSxBmtun3pDqnydnA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N3fv17dL; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N3fv17dL"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64ad62a294bso3098199d50.1
        for <linux-staging@lists.linux.dev>; Mon, 16 Feb 2026 07:52:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771257164; cv=none;
        d=google.com; s=arc-20240605;
        b=XhRZunrKl+VEvewvC6tu8HubqqxmIdvJ9bKjrM/ZmwJXABME1NXexq29/QBp0uEQtG
         cUjhZn1mTSAMBRLBj8dE2GyKCIPCDu6RGpgNP0ImkAII4l5fKEgvZWZWmDACj3DyNRxL
         LxOBphL9i9qHvT7p7ytT6R3RIrve2s9wW7NMesIx0YDPHXE2f+RWUGkTWjuuOcSEBzSY
         BtZS40cIIXtKHbJGPBhHVbkGmDLoYkwre6ok40KQk6QZ/7YQs17DR+uve5lYPvpGCcyl
         6zRFxk8LA18Ut7upxmnWUJwreabsu7sXfn5jOcnrHVjVZxQStlBQNaxnn1yyENlUn4Re
         SqLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ot2mU0yu83xeq0xqLkly0xKYSkvAdLvXToIN6WuukKc=;
        fh=bk/xWWhTKJKS5EEnNFAifdUbt3o4qLvvRbmn1V5Gw2A=;
        b=NCB1/m7H4qSc1ehaSEd/jhx7xlJQUay4MxHjn1HFfAxjAQojVLWzvqI5mfekERSmN/
         BXuqxBI3YpsHUVkNDmbfOKVgJU/qqSsBXTIUbrfXusvegyUCNBoKeeSjcMIm2yHBzDR5
         jkEKNuF5se2kvM/hNo+vW7E8NJ8IILr7dOvdZHioZ3JyfmD0xnM6QddBM+ydQQPVCbuA
         mNGa73Hvj5KZ0RGiCRkqHjibAhZFb+uLWR6CNuk3GbHq/rusVGMlpT4vg8BbXSQ5js9m
         jawO+n8mVCNPhYG8J9S//mV4yexV/bx9q9RQpJd29RbkgvlYLC57LMxt0vHynyzF70RG
         3oAA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771257164; x=1771861964; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ot2mU0yu83xeq0xqLkly0xKYSkvAdLvXToIN6WuukKc=;
        b=N3fv17dLe1EQ/LDY2IgINc7PT/YtzOFQlAFq37M36kXGd8o3nlOpydJhbrIWcReHnq
         JZrno598tJMy+xTvGWhVPtqFrtB62Fgu0UF22QS1neNQf3YZtkGa/It2XWY0gHw+1brX
         D4W6B0NL7tfW63Sw01swoeYUY65zerv0LnjBzKaVAKeVMRaBhsBrZiLJ1b/2ASJdsIXO
         pXkv/s5XHBXwVYa56PvGHgpTVa5e+9xzs60XfljELiBhlH4YOH7fGg4N8KHjWACDNcgQ
         KzeoMmUHd3IdADZJuwTeCfCRDPY7x+9y8S0URFOPXZof+ZTKaSwd/MGlzHffgdSB6FlC
         gtcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771257164; x=1771861964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ot2mU0yu83xeq0xqLkly0xKYSkvAdLvXToIN6WuukKc=;
        b=Azm0Yt/zF7SpcMgkdeeg7QsNZODXLJOe23KtObDtLib+5fd/+4C2d2UAtb+ldG0uOc
         iJlAqRY4nTMtU5dn4Oc2jgeUe7Ui1bG2jaRk2+tToyPBf91a7nVMa8eltkqCdfXlvZsp
         l5ETRiP2zTpb/MyGY9pGHxipMn/3kMUmS83vfrhVroNzh8nVdp0aQjjZ3C5dxOkgrP31
         CPI6oy5KAVO5YHHFhswwM3wzGbgkgG6XXHewEC6gjkOpr8ZQCh9lh8PrqmtuG0cHdAia
         if7EsOirZ5svE5WIrSt3uLCzTuZrQ2u0poAUUTRHmNHNAJ7NbS6GIYtlivF0skK7MnIy
         lw+Q==
X-Forwarded-Encrypted: i=1; AJvYcCX2Lk3ECZ3s41Lp5uxeG38SpCPAan43hmkkNe5NI3Q49OfET8Dm1POCJrqDzPJPgUaM01zaXK5pqXdprsis@lists.linux.dev
X-Gm-Message-State: AOJu0YyfRsz/Fwwt7IXhM7b1k6P8Jkrw6qbjXtnKdMUtl/IL9/vmZTqv
	ouahs9iRrH6dgOGAv9zIIO3wcWdY+c/zv3cCvyw/0BBes6CoVOMio3aP2oDI7Z3U0Lxm0A2K3jO
	87cbSdKvf/s1qn9IBvXu26vJvPLgaV8Q=
X-Gm-Gg: AZuq6aLccLOCr+ZvisUkJhwxIDgf8Tz1Kgh+mKfDZEIdOOFsnqKNs4EFZREalpNReLs
	KUAX/9IUtoGbqsuH02p/QapRhlHKNMXuKaRUNsYP+NWo7bFBskaoijcXcrVFUlwHC+G1p1HIjBX
	qDwOEJENRiU5GSeYpiX7K0ZSeRHPx96603HPDnaaEJT8efsCpyZd7/nfacz2BHQoqDFgX4lUG9T
	mGddWe8vaAJLUwCG8UJ53gj6ckIT6cIslWo9VBR1mKza1zeaFgp0zaE+kKXZIJS44k+doVWYB/8
	tq3VGj9H5k+O6j2SBILF2fRLMLAmhZ/dF0r7RnDjPA==
X-Received: by 2002:a05:690e:4146:b0:64a:db1d:2d57 with SMTP id
 956f58d0204a3-64c21a44454mr6338152d50.2.1771257164397; Mon, 16 Feb 2026
 07:52:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260122145633.14938-1-architanant5@gmail.com>
 <aXI-ZV4uAd5GyFLz@smile.fi.intel.com> <aXI_HnvDNbX68-lq@smile.fi.intel.com>
 <CADJHxWB3b+bH2+HBP+SG0jxhGNcozstBeWeDH_3dgS-4c2G-6g@mail.gmail.com> <aXJmYAZ-8KkXCFI9@smile.fi.intel.com>
In-Reply-To: <aXJmYAZ-8KkXCFI9@smile.fi.intel.com>
From: Archit Anant <architanant5@gmail.com>
Date: Mon, 16 Feb 2026 21:22:32 +0530
X-Gm-Features: AZwV_QhGPY-D69MH0lGVyOerHPtqCOXaIaKC2LSoy8MQRUla2KLfpWELTuP0yyM
Message-ID: <CADJHxWDCer97pMNHV-69B9AEVY0NfimTcxo8k8yFBbstg0wMQw@mail.gmail.com>
Subject: Re: [PATCH] staging: iio: impedance-analyzer: ad5933: use div64_ul()
 instead of do_div()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com, 
	gregkh@linuxfoundation.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Gentle ping on this.

Has anyone from AD had a chance to confirm whether the original
truncation via (mclk / 4) was intentional?

If there are no objections, I can prepare a v2 using the BIT_ULL(29)
form as suggested.

Thanks,
Archit

On Thu, Jan 22, 2026 at 11:33=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Thu, Jan 22, 2026 at 10:27:52PM +0530, Archit Anant wrote:
> > (Resending to the list, apologies for the private reply earlier.)
>
> First of all, do no top post!
>
> > Thanks for the review and the detailed math breakdown.
> >
> > I agree that `(freq * BIT_ULL(29)) / mclk` is algebraically superior an=
d
> > improves precision.
> >
> > However, regarding your concern about the original code:
> > > "why the original code drops precision, was it deliberate?"
> >
> > Since I do not have the AD5933 hardware to test if the register expects=
 the
> > truncated value from `(mclk / 4)`, I am hesitant to change the logic in
> > this patch.
> >
> > Would you prefer I:
> > 1. Stick to a purely mechanical change (keep the logic equivalent, just=
 use
> > `div64_ul` and `BIT_ULL(27)` for readability)?
> > 2. Or proceed with the `BIT_ULL(29)` simplification assuming the precis=
ion
> > loss was unintentional?
>
> I definitely prefer #2. That's why I plead to AD people to confirm.
>
> > I'm leaning towards #1 for safety, but happy to do #2 if the maintainer=
s
> > (Lars/Michael) think it's safe.
>
> > On Thu, Jan 22, 2026 at 8:45=E2=80=AFPM Andy Shevchenko <andriy.shevche=
nko@intel.com>
> > wrote:
> >
> > > On Thu, Jan 22, 2026 at 05:12:42PM +0200, Andy Shevchenko wrote:
> > > > On Thu, Jan 22, 2026 at 08:26:33PM +0530, Archit Anant wrote:
> > >
> > > ...
> > >
> > > > > -   freqreg =3D (u64)freq * (u64)(1 << 27);
> > > > > -   do_div(freqreg, st->mclk_hz / 4);
> > > > > +   freqreg =3D div64_ul((u64)freq * (u64)(1 << 27),
> > > > > +                      st->mclk_hz / 4);
> > > >
> > > > It can be one line to begin with.
> > > > Then drop that ugly castings and explicit big shifts.
> > > >
> > > >       freqreg =3D div64_ul(BIT_ULL(27) * freq, st->mclk_hz / 4);
> > > >
> > > > Now you can see That 4 is only 2 bits, so this can be written in
> > > > simpler way:
> > > >
> > > >       freqreg =3D div64_ul(BIT_ULL(29) * freq, st->mclk_hz);
> > > >
> > > > which may give a better precision at the end of the day.
> > >
> > > It also might be worth to add a comment on top to explain (with given
> > > context
> > > I don't know if there is already one on top of the function, though).
> > >
> > > And I think we want AD people to comment on this and maybe explain be=
tter
> > > the calculations done (and why the original code drops precision, was=
 it
> > > deliberate?).
>
> --
> With Best Regards,
> Andy Shevchenko
>
>


--=20
Sincerely,
Archit Anant
