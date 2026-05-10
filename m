Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555D23F9FB
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 02:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778378427; cv=pass; b=H3esmEOouvHSNRNKtckT3NC6QpGcnK/KsthLhDehF1gwwlKFxQ15F/6jjZv66DEY30znleUjVeIDccUQHuMHldF3oHhnzjGeWYLRmj2KCO/WwMkPcTLxs6j47SsrRSofvEeVlJN34FUjoBGFyyshKMVUw+oMdfrsWCrKUhx9XA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778378427; c=relaxed/simple;
	bh=pUI1z7i7mQlBpC0C/OpSH1TNtGxr3q8tqLoXXv4K8Zw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MsfIIPDRL06thHluwowb3m3py0Ms2TFszEjYN9lLByA0Gh4GbSK/A10LsU408saDg7TjrtgM4eY61mxbRZey7HyqS/VvuVI1CMTLA7jS+pb2FQ7BnVa1c8OiFOhsdxCBrlDSnlItlNyT5G8MacgWda0i7mwvwKkBbkMj+TgzMGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AP5ZcaUD; arc=pass smtp.client-ip=209.85.167.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AP5ZcaUD"
Received: by mail-lf1-f66.google.com with SMTP id 2adb3069b0e04-59dea72099eso3075188e87.0
        for <linux-staging@lists.linux.dev>; Sat, 09 May 2026 19:00:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778378424; cv=none;
        d=google.com; s=arc-20240605;
        b=kyZ3lF6qn25hHztHTIDFnIRXWOqtZd22bsJhtM9d+l2OvucMXZAEy4OLARP2yzZhMm
         R/tcHUFibFr88hMfD/ukRN+hJqaeQATCOrcLU2N/arM43BWxq+YMe+1CX//cStpdMEGn
         GOiapb3lXeOhtMvSHJ8qNIdp+xCH2nKx9O5fpMwGy7QEyMOdxKp3JJZnuvSFwo1ZAM2J
         Vna/mZnAud44gldhfuMQDaOmED9sWfeDKN1Kls+SJj/WhWlcJHCxXXbyeDTLcz4l+oRX
         PcoD+m+waVHIK7xGuX6QNI/nqxDMiAtegXYB6aovFoy45JGiBd9egx3haFBY18FZnVDm
         SI7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TND6KxJoYNL4nBC3/lGAR/tckoAP9dbwYM7OnK3ow60=;
        fh=qRDw/Ld7PSdRvEUV/FJ/+HmY9mSDxBVuVpczIrGuYx4=;
        b=HeB600kzj1T38XJoJablhbIo0NRqdCXHsc6kB8wYyhotDdAolfCzsCh2alWDNF87eh
         fXjM3GWM/WE+ciJbiTH1hoFLB52jwv4eJBwKIraFpa+o6GQYz+lG8lI0M938biXL/laS
         1YLdfnuKBo1g1+Qqs32u4CAeE1KsCXrmBO/pkTwwAIMc2mPHEMEzFJqfflOITMY7/Qce
         cCSv62Ll8948WNJM38+VwOqm/xDichG3COr7IDFXutNeZKzw4pemCOh9yoYhRZ+X/A1k
         ptjaG/veFhQPftQio8TuWE3bL1pr2a+Sa3e33mkwevYkut+k1UMApe3j1BwZlHgxZy1T
         YeLQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778378424; x=1778983224; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TND6KxJoYNL4nBC3/lGAR/tckoAP9dbwYM7OnK3ow60=;
        b=AP5ZcaUDxC2yg0rYr3OZmw8lCwDbgAvS/9FMtEJT7zpeMWX0q/NpJu6ibneUzdju2r
         E4ccf4aG3jHE4lzye2AEChLOGnjt7n2qM4aLXRxB2saOGdBKEXPZYAjotLHZlT37u9zB
         1e2L7AeawEsIHUT+W8fpRucfzk2DpIthk7pO4amKd24D2sW+VJhfeYRI+vcj9XqphYdv
         fc1a+asjDV05+aaINWES/hhw5J4bPQSBPIQW3MKNy1CCwS5sgYnNtwqnSl3lVyJCmc+2
         ioh/yxWOw1n/0NGa8MdxjhQqy5zCJ3ByuuxCM5fJh6+BIVG/aJQH61okg6vzukUziWwK
         kagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778378424; x=1778983224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TND6KxJoYNL4nBC3/lGAR/tckoAP9dbwYM7OnK3ow60=;
        b=PzD9xGVrL+GPYQ0mFydHjPv8Ge9aGuKwk1BBcq5iW85eOviu6qk8T1EoPRfqkWlouo
         Sy51OI4ZOAM4bWe0L3M2FuO8NoLcEuzpEQGZRtGxFChkwEsTQNlPCSdNUk8ZR9MGNFD9
         oN9yDjxOOD8oBrv9vAwDCvYqS6eewyqMr1dTjI9sfuUVmff8ymJb4AupMjbMNZaojBa4
         5u4BtWKV0boxSf8+qA5az0guQU/usILo/eJGaYF9fFH+dxUhhJW7ohwexYkyH8Rc0MtK
         MPStbxSuBahXkWfaF/4DKaC1Simhe8fdN11vXXsLqNMJ8nE5bgvKYMZjcnMYEqGCmHeQ
         f9Pw==
X-Forwarded-Encrypted: i=1; AFNElJ+Eq6Z7bygh/uRS7ae/4yhOO4+u6aWG8Etwzg4oLnqD1FtTCVW0I5aFfoEFznBifu0uL6H2iEDRG5OfSVYa@lists.linux.dev
X-Gm-Message-State: AOJu0Yzlm/5+nTkgIWm5dFWFM0oEN7rPj7IaYRN4jG8gdUkhhipfz1B3
	QSM4C7sSL/Tia4SXzaz1o9zK1nWupW8oV2iXDG/ZHJ4XbOSGGhoXniLaV9r/1U8KPwQ8KGsC/f6
	qtJw0N3YZBVNR3jCMgBtRNUABPwJKKyc=
X-Gm-Gg: Acq92OEltzxywesa5sYhKhhGCGLkg7Tg4GbWsUJ1AQIp1o69XZapb78dK4VQpGJ1g2u
	YMqvpFmQm6unIZNuLLbIcO7SjCwio2OVp/fgCgnPFX10g9T7It1Ilt6ey6mhjM6pUtu994aUICM
	qH5C6M+AyMIx8LotOietjxHj18OmRDWyR1/sIx6qUI5y5oOYjtNe70TtTC7ipIggEHQLvRQQF2P
	1+pexzDIpibmckw5yW1FmoLmxdxheEVoNgYDmqZgYL1d7ct7Ri/yHmsaE/ryx6ki7JDle92Oo4R
	UiikiVF+LXZuRX0EEf+OePDUDQDn5I50G+YAM1RNmoDg+GesKLYS
X-Received: by 2002:a05:6512:2256:b0:5a8:8db6:b1f with SMTP id
 2adb3069b0e04-5a88db6109fmr5937652e87.24.1778378424284; Sat, 09 May 2026
 19:00:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260509090320.85481-1-dennylin0707@gmail.com> <CAKqfh0F+rAqAwdu=BtagPa2D-F-TANm8Tx3RCOoLyZXkYAn2pg@mail.gmail.com>
In-Reply-To: <CAKqfh0F+rAqAwdu=BtagPa2D-F-TANm8Tx3RCOoLyZXkYAn2pg@mail.gmail.com>
From: Denny Lin <dennylin0707@gmail.com>
Date: Sat, 9 May 2026 19:00:13 -0700
X-Gm-Features: AVHnY4LZNb2ydQINtTmvXcR-KwfUE7QOTj-W4MjCiP5irhAWA0AT3jcREx_Wze8
Message-ID: <CAGEkeHcqG2_c7Ls_=ZMkKfR_MpSNiuRO5d159oWfuN_A6qNEoA@mail.gmail.com>
Subject: Re: [PATCH v2] staging: iio: addac: adt7316: check SPI write errors
 in probe
To: Maxwell Doose <m32285159@gmail.com>
Cc: linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nuno, Maxwell,

Thanks for the feedback.

I agree that just warning is not very useful, and we should bail out on
errors if we check them. However, I currently cannot test the failure
case and I'm not sure how the device behaves if the switching sequence
is interrupted.

I've reached out to Analog Devices to clarify this. For now, I think it's
safer not to change the behavior until we have confirmation.

I'll follow up once I have more information.

Thanks,
Hungyu

On Sat, May 9, 2026 at 1:26=E2=80=AFPM Maxwell Doose <m32285159@gmail.com> =
wrote:
>
> On Sat, May 9, 2026 at 4:03=E2=80=AFAM Hungyu Lin <dennylin0707@gmail.com=
> wrote:
> >
> > The probe function issues three SPI writes to switch the device
> > from the default I2C protocol to SPI protocol, but ignores their
> > return values.
> >
> > Switch the repeated SPI writes to a loop and return an error
> > if any of them fail, as failing to switch the protocol should
> > abort the probe.
> >
> > Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> > ---
> > Changes in v2:
> > - Return error instead of just warning
> > - Clarify that repeated SPI writes are converted to a loop
> > ---
> >  drivers/staging/iio/addac/adt7316-spi.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> [snip]
>
> Hmmm...has this been tested? Normally patches like these don't get
> merged unless tested since we need to know how the hardware would
> respond when we hit an error case and quit sending data, and also some
> of the timing changes introduced by writing, checking if its an error,
> then jumping back. I've personally tried this patch before and it got
> rejected so I'll link it below since the questions that you might get
> asked will likely be similar.
>
> Link: https://lore.kernel.org/linux-iio/20260426205039.125818-1-m32285159=
@gmail.com/
>
> best regards,
> max
