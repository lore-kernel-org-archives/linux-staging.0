Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB64634574B
	for <linux-staging@lists.linux.dev>; Wed, 18 Feb 2026 18:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771439809; cv=pass; b=Qym/O1f07IfzeMeoRznWdhmERwoBFL+tiV9YxkowEVjdG1uuR45B7EED4p54XsqBqRMd7WQzYzEs0t/I/yCE3wnQZg1ldsyV76+jhVU2yrK8kyKw3qjNs6o3jkW3cc9Rj135fBCF2vf3+BsaUIItneJtpcS5O7QUc8TqzxD49ps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771439809; c=relaxed/simple;
	bh=qJRMUf86+NOgYgCCQFrRHcXWIEKIxMuDM8i/3pCwCL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W7e96hC9t3CktSh1U6iDWO0lhN4SN8jGSn/BJdXA2GElxzwcxN02OLwHI/RMz4Piek0Ppb3foFM8sELGRKFU1n1cBSLdL2ZjfolLL3zoIB0wwsUgR32GWQyG4PSwcKaL9FFFlDjcwkeo/zSkZQVyns4nGORJzabqDHs9fuWX2fE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QPRQUFmg; arc=pass smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPRQUFmg"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64acd19e1dfso72596d50.0
        for <linux-staging@lists.linux.dev>; Wed, 18 Feb 2026 10:36:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771439807; cv=none;
        d=google.com; s=arc-20240605;
        b=SCFibw6Zvv82jLLG3LAbpeTg+UDLq+G64D/sqW8yD+T2KsEjf4kMqm2Hip1ZoYIH9M
         d4QDDI2btg4QQFrqNQ8j5A+Xxno6GwEpnxb3K4Y9YCMsU/d6qYIsHnxsqe9gcS0WWDsf
         jSVYwpdWrufj8I1yYSUEkm+p17PW6uw9MWK2Hts2csDmmidnnVaplNFhMfAXsOGYGwHE
         pfIgy8EXmeWgJjsVfri+GyI6Tk9QbJEq/Khk/+N9BULgBVx9kCGwARe7mfXuTis/t1OF
         LK5jIYZ3WF2Le9eGDSvuXfAW1QUT6BgBnjLS10Bhnytkz70TSwH/eJH+uz1ciDWZsjgq
         frBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T14iRY2Y74KYwPv5eSSsu4CRHshEldQbD4XUo8Y2gto=;
        fh=/OwEaPtgT4eRJjB3Ubiv9rl7BBWs0HYgUXqt19kCGkA=;
        b=JuSn97qLgMx88cNdFu5sRguNWrtVF2PClDjQXYQL0Z5jyKRmDxycOwfwwCu7KFMySi
         KL92kFgm+rWoR96iEIqkjeIZ06XSusDsVJU9Xaw1q6IkSMbp1hxH9Vx0ZBZrj+ohHIc/
         cI+X7/EeW9/qKAN6ojviBYykQOcHVhWmsgtC9646x8kFFc6DH2y/5/WDF+OvnPrv7DlR
         MID7s/L5CLoTa2mmNlHCY4Q9Kg3Ev5vVPi3AysC2cVLcZKvAvdwVG8TIRhF1JU6SDtXp
         xuP3A82U3a1ojCLH3x7AqZGGZRIWcDVx33ZuhTEBUxEkS0yOufop02UTY3tkbQm6kv9c
         7YuQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771439807; x=1772044607; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T14iRY2Y74KYwPv5eSSsu4CRHshEldQbD4XUo8Y2gto=;
        b=QPRQUFmgzjgwxLUb7rg6S0coVufX6MoNpdUraYd9qtp/fvdaivj+yBDx2HlV4v1ivp
         zvhI7y2BCQvrNnMjZzrPoh3yMD2ooXJSfk0odDSk2Q4YD3Y5u/LSI2MBYXyMfi+ZnCwP
         8rfmsa5WmWmUO9OqhTOoLgojQFEXbq3CsDhphqeo8GAEX9H8cywgSwJnyCaJrBu8Gaqz
         +mXizlOtAnfK7LQDX4RfH5Ue++ADnL20I9SlTHqep2m9dlsI6zOPtHnlUIGfa2rPZyHE
         H+BjIuKLJeGQ+DOmUIRZTpoJlYY8xf2r+GSIGEM1hgmQ7bZyoDeRUgHUqOFDgzV8SH7Y
         HXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771439807; x=1772044607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T14iRY2Y74KYwPv5eSSsu4CRHshEldQbD4XUo8Y2gto=;
        b=W9aLUw0gytuCsGlVenhXtNNPOXwk4/60alGB8ezNu7dKQHxLXCQFzkRZauH2XAVmfo
         18AA76pLRl5143nCOYIV68coQYCyzIyX5TXqXkDFfC79eU6n1u82X1UAi/CWowa1q9uz
         pOas7s8t343bpHlLUNSMk0qVO2y0ePWHDD7tGTrNMSeldmVLUouFzLhO9svFaV/rR2aH
         rMOyhaes7D96AA6y/c0f4EQee+fpIEuJk8/OeQfwQntukpBsUycmNpJlmYHbQO3jNWYc
         HNxUuvqI5oF8+xqaEhTt/gPBU8u8XXsRFa1AI0EW6wPfR/Suw6qfX5jGGLWJ+93Pjwdy
         YWgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNfWDgO3wZxTrY/pNYbR6JZBYMPcsaewhF9PvIv/c+TZF46bVr4T2xNoet+nwMuWI+NCc8IEvcy+Dpwt8i@lists.linux.dev
X-Gm-Message-State: AOJu0Yz95dyl03eCho6C6UMF1cyDI7xE52R+zWftRd1XHewUeLqqYEs/
	+RRa5v7oNSklMdeycbt5idc1uL9fDJXPNfHtF6/VYUOj/iEI5L9hcpeQQf6lFbd3gfF+waW5iNL
	7ZWjrd5TzcGwAufGac7YLTpNENNWeil8=
X-Gm-Gg: AZuq6aKqLwvhNItdyjBmO71zDvYnGM00cV52OIXLp92jPerRBsprcA604POInLTVKun
	KYm7pPTmSTElbJNH/Kk9gLQEe4mn4uIT8ZcNuy+0E9347dYr5e+uuLR/XJLMG4Bh8nNhQn25xKE
	SvrwVO/QZuX7prSkt3ORBaBtgqkwBnQN3UZlvQz4i040B5+hIxccSoF75AkJpPKyZSf7ljcdqYU
	em899HzRvLrw9jiLqFYIpYDLUwpu6hK1bwxVhNm1VhNakktx6KEhVxBvGgom9cd1hBfUMxDrA89
	TLzpf50Y4s9aR42SL+QKoZQKpQjJCgKPGRLOx8ZDKtr2xert/Q==
X-Received: by 2002:a05:690e:d51:b0:649:e501:21b2 with SMTP id
 956f58d0204a3-64c6136c98cmr122071d50.12.1771439806745; Wed, 18 Feb 2026
 10:36:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260122145633.14938-1-architanant5@gmail.com>
 <aXI-ZV4uAd5GyFLz@smile.fi.intel.com> <aXI_HnvDNbX68-lq@smile.fi.intel.com>
 <CADJHxWB3b+bH2+HBP+SG0jxhGNcozstBeWeDH_3dgS-4c2G-6g@mail.gmail.com>
 <aXJmYAZ-8KkXCFI9@smile.fi.intel.com> <CADJHxWDCer97pMNHV-69B9AEVY0NfimTcxo8k8yFBbstg0wMQw@mail.gmail.com>
 <b27c638e-f0fb-42af-978f-89e38dea2b23@baylibre.com> <ca488ef9-f4f1-4f7e-9656-8c5d132d0d1c@baylibre.com>
 <CADJHxWDXqgpbK1+cffhPeTEz95L0zeCGGWb96_QwuxjEofBNKg@mail.gmail.com> <20260218181851.46b339a7@jic23-huawei>
In-Reply-To: <20260218181851.46b339a7@jic23-huawei>
From: Archit Anant <architanant5@gmail.com>
Date: Thu, 19 Feb 2026 00:06:34 +0530
X-Gm-Features: AZwV_QjQfcP7XaukHvAMxMCU8-hwa45RdEVjgcEe3tgBYP7REDOOEU7aNAJJ5tI
Message-ID: <CADJHxWARFsyFR3jHXzFjcOsTYN1HwSDzWwXGRNO2yg1z0i77nQ@mail.gmail.com>
Subject: Re: [PATCH] staging: iio: impedance-analyzer: ad5933: use div64_ul()
 instead of do_div()
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andriy.shevchenko@intel.com>, lars@metafoo.de, 
	Michael.Hennerich@analog.com, gregkh@linuxfoundation.org, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Gabriel Shahrouzi <gshahrouzi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 11:49=E2=80=AFPM Jonathan Cameron <jic23@kernel.org=
> wrote:
>
> On Tue, 17 Feb 2026 22:16:19 +0530
> Archit Anant <architanant5@gmail.com> wrote:
>
> > On Tue, Feb 17, 2026 at 12:34=E2=80=AFAM David Lechner <dlechner@baylib=
re.com> wrote:
> > > Actually, I just saw this was in staging, so I guess not breaking use=
rspace
> > > isn't the top priority if there the other way is objectively better. =
I would
> > > assume that testing/measurement could show which is actually correct.
> >
> > Since I don't have the hardware to perform those measurements and confi=
rm
> > if the precision improvement is valid or a regression, I will take the
> > conservative
> > approach for v2.
> >
> > I will send a v2 that only replaces do_div() with div64_ul() and uses
> > BIT_ULL(27), preserving the original (mclk / 4) logic to guarantee no
> > behavioral change.
> >
>
> I started writing that I didn't care either way and given the chances of
> not having to fix some ABI up on the way out of staging is near zero
> (which would break any userspace anyway) but then I took at look at the
> log.  We've had a fixes for this fairly recently!
>
> Might imply Gabriel has hardware? (or a 'healthy' interest in
> reading data sheets! :)
>
> So +CC Gabriel who might have some insight.
>
> Thanks,
>
> Jonathan

Hi Jonathan,

Thanks for the lead.

Hi Gabriel,

I sent out a v2 of this patch earlier today [1] using BIT_ULL(27)
while preserving the original (mclk / 4) logic for safety.

If you have access to the hardware or documentation, I would
appreciate any insight into whether Andy's suggested simplification
to (mclk) instead of (mclk / 4) would be a valid precision improvement
or if the original truncation was intentional.

[1] https://lore.kernel.org/all/20260218125327.21467-1-architanant5@gmail.c=
om/

--=20
Sincerely,
Archit Anant
