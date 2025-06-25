Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1E920B81B;
	Wed, 25 Jun 2025 20:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750882069; cv=none; b=SCaUXf4dhsI3rYA66t3yyIN38EGlsYPq64AWXHDSnSd+yW/xedV3THQWS9/CBDmLsIdittE1bL2hEObtlczPKaJT1rMvYmBIb6qJmBFkHG0odu3XACloTK1SWwIVLp8YVSYGBPiI7nLkcfQukgmt+uUKVQ6yQjCz7EvbAxsQNLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750882069; c=relaxed/simple;
	bh=EjtCgjlPuYa9OqKtTw5kDeGLPeJpAT12j+uPFgv0rOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lVx2+rvyBcFkCBQf29FSYJhcZFYOvzxBNXudjB3ave31gUkAgWF+13UBh9vBAkCXswN4xH3TxQm5cPmIDeaaiEbR2SORU/CXd/+aA4244ydUsoZkl0pSW/QZGW8K9/HmXOSa5Hqvpm5BoG5tCSIWsyFDokqFMWD7znzaxowz4MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCiCEVCJ; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCiCEVCJ"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-70e2a7a2ce6so306247b3.0;
        Wed, 25 Jun 2025 13:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750882067; x=1751486867; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjtCgjlPuYa9OqKtTw5kDeGLPeJpAT12j+uPFgv0rOg=;
        b=TCiCEVCJ77drPh93dIUhSOMkWm858e5sBOYnuE8ACjhvXk9WRtdDEqOrfBQPkq1A0y
         VgDDgoRyyGrxxY1EjwEUmPHGC5j4mswpIKk67kZM1P7s8NDvPZlbbmB2KDvNg7AyU77w
         jNTPISq2p8GqbhfKL3hveTexcIHZAT56AKzw93MS33177P+Vam22ThVPVkogVZm1y6ah
         Q76Z1PAwSYJzJ0gOFIj3i6QQF5VG0kIlCbYV31QmY2VjacqvXZxMqtXxiGOsFmwyHbAH
         bUqkG1fkd89ovOa1cQxUYy0ZxdfQHSsLpJmDC9kee2oHXkg7iIrhhdITHaBaet2js5/S
         mh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750882067; x=1751486867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EjtCgjlPuYa9OqKtTw5kDeGLPeJpAT12j+uPFgv0rOg=;
        b=pHp/1zrptjcGrOj3T7F4DHX8Eee6O4WE5Dn6JQbXNAfOuJKa6bRMWLr1AgrxFFlhfI
         9oUzIAgitv5ELLONUexWlEQpdp9cPJKiv8uJC4ZJLqwGT0H7yr4a5qxz0fr6gWPl1DpS
         iy9RxBSOvuF8qRbd9ffwvyc61r8sQapQzxoLa7jiiiLooQ6xowtCd3nwFb4sWwdphirJ
         VVPDBnfKraq1/3NJ7rVJTx4FGANBuy0XpiMgdHdAqPQ1OcmmnxAtK+fCXFaCWbHupXOO
         IJVrSOUcgTo4bTsXAF6eUyU33VHcl616JveA39M9uGw7BJrntBDyaHK7GxSZ7WH14PEn
         NquQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFRG/JPuJYOfnHALlJnKi+cI2c9TY6TKmQPqK00+rvD1RxptQOmxKjm4u8BvGu+WLEKxn2Ody4gxhdyBFOKw==@lists.linux.dev, AJvYcCXkdfrzaq928tiwDRbb1OQ4ceVT753deuS8rJ1WeM3yHWzjPVzD9VqKzkTJNpVzx4ywusIzwkjaAuNQy6b9BzailUdk8w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy15wgBloGCfZHkttD7BNNGfuyfjETlImNg002oKL304C84lG81
	jPG2ZsIR+dmovth66BkbBvtSssvr+LY2HduA0H2hVmNU/5CTm580yKNeZeAH40YqB7smqy1gygU
	w0sIvkrTaFRK2MH4YcoYkZZqCs/hTNxY=
X-Gm-Gg: ASbGnct1lavuUJlPON4/L6SgtAO5ZJdc09vlUNtbW+1CwDiQHG6g+FmjCG0m3Bp86bb
	FwT5SXXTXUYuMDpTeI9/FXYDANAy/HT+70cUoEQYsnsA67HjJQy5WoznymbZkw+kR0auItbo+xt
	YCz9fN70pmlHNtndeBoskdZZxpKsJoOyOO2kvr6s4oxU0=
X-Google-Smtp-Source: AGHT+IGz4txyKPd7fSv+f9CzjEkDSNQgHwjMbV5Yhzz8B88moF+AakLXs8owD2LqNSjcS5hCDxId5lFVReEZt6ABDzE=
X-Received: by 2002:a05:690c:67c1:b0:712:cc11:af5 with SMTP id
 00721157ae682-71406b6599fmr29578827b3.0.1750882065681; Wed, 25 Jun 2025
 13:07:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250624170746.47188-1-abdelrahmanfekry375@gmail.com> <CAHp75VfL2uMpOP2xfa6zf=MAFrt0Phz87xo5w3bC21t0-TTQKg@mail.gmail.com>
In-Reply-To: <CAHp75VfL2uMpOP2xfa6zf=MAFrt0Phz87xo5w3bC21t0-TTQKg@mail.gmail.com>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Wed, 25 Jun 2025 23:07:34 +0300
X-Gm-Features: Ac12FXzwVYZpPh2GdM0bP_aNvwstV2K-3UVsUmTB7suEGHiFt6UKlSIQ2Vw63lA
Message-ID: <CAGn2d8NmM3Jr+ZR=hj6KYyHdkx1Vc0-Q2RE7Y2o9RfQM1dPAog@mail.gmail.com>
Subject: Re: [PATCH v3] staging: media: atomisp: remove debug sysfs attributes
 active_bo and free_bo
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: andy@kernel.org, hdegoede@redhat.com, mchehab@kernel.org, 
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Thanks for your review and most importantly your patience :)

On Tue, Jun 24, 2025 at 9:09=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> You really need to slow down with the new versions.
>
> On Tue, Jun 24, 2025 at 8:07=E2=80=AFPM Abdelrahman Fekry
> <abdelrahmanfekry375@gmail.com> wrote:
> >
> > The sysfs attributes active_bo and free_bo expose internal buffer state=
 used
> > only for debugging purposes. These are not part of any standard kernel =
ABI,
> > and needs to be removed before this driver can be moved out of drivers/=
staging.
>
> needs --> need
> can --> may
>
noted , will fix this
> > - Remove active_bo and free_bo attributes
> > - Remove group registeration calls form hmm_init() and hmm_cleanup()
>
> registration
>
noted , will fix this
> > Suggested-by : Hans de Goede <hansg@kernel.org>
>
> This is not a tag. Check Submitting Patches documentation and find the
> issue and fix it accordingly.
>
noted , i now know the issue and will fix it
> --
> With Best Regards,
> Andy Shevchenko

Best Regards,
Abdelrahman Fekry
