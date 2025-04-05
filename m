Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB261AF0C7;
	Sat,  5 Apr 2025 14:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743864930; cv=none; b=uQ7sUMwzKAKkaBCKy0pIbDaKIGKW//dqaBsiVhmGabXQqt7xvxyYTM8FyWXdAHT1bbiCaJ3ucAH7TVWUS85UpiodObxfWlcbatldk1n1HNk1ItTtThiPyGII7p+i1adiX2in1QYOmoI32OWMTOxlNdQky48yeCx0BPr7qKJhS8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743864930; c=relaxed/simple;
	bh=KN+GUQaDkyiC/q46ZCA0E+OC/aTo3sC5uzl2Y4YoofI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BgFi/lEY9Am10q0LWalu1LmApgTsvn0UgDxmZ3yBhf1N8blrnu1uJ/U3+d+8StAlTwOEF7H6yrzoKCJD0gWM0av9AregsxRBIi5PXbGKdpu+vdGJFbLz8Iz7uH0SbCn9DsvbDDz5TRMwsYURqCjdzKeXmRFNA6nYXETevtNUimM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITVy/CwJ; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITVy/CwJ"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-523f1b31cf8so1224457e0c.0;
        Sat, 05 Apr 2025 07:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743864928; x=1744469728; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0bylYK4rbcZkE8OQEolRnIpH1EzfwJRH0eir4LBzBk=;
        b=ITVy/CwJufly4gt9gzh6B0AAcAmMa+b7aj/cxBJBfih7sgpq62g0B1y4uUptJeC3If
         jqZYX4kFK0QnS6P2r3DSotEHZ3NJdnB5Fc0bs5I8pLxGv4D8JKLUm1newHbyc6YAzlSB
         FIHv1hL4mR+ZEWEBZPGM8Ynazaaiu03EdszIpD26viYTrgGyE7/cMWLeXO7L2mIxlk9R
         Py0qrLHFPRWYoddz4R4Z/emXTW6HfeOncfbP3KkKRCteWhIR/fl8ySPJsqQegG38S6KZ
         iip+EqzXj5Rx6E8rMqppL2mYWhDUdVZEX2A9AYIL7ZxheIyPRVbn3AccdRKhskugOriE
         bXMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743864928; x=1744469728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0bylYK4rbcZkE8OQEolRnIpH1EzfwJRH0eir4LBzBk=;
        b=JwEO0k6q9qyg/QCBZluba7BqrRJl5Qc2Z/JLsITjV1YbX4enVfsLuIhTioZgscfhk3
         679Y2XykxFET1akysacCH7O2Q5PiQqcOUkXBfdb6WjvfZcRUfMh70kCnHRLhKXnvGQII
         Co4axnAG1AeMVCpElqnJYfeqEOTKSPjx8fVE9eQq0vU3LGQqn7k//IR5NSi7hqQ3jWmr
         U99sQ3Xif1+tcVJ/bGeytyqNuGsgHiQqeJ0ULG2lruGfM2/X/GCuoude2XBW6dt0Hhfj
         BzAfjXpk/xDpSYjo5LzNHObrSaZMBwdJyKxmQHPpMD+bEKJFGhfmAbv948HMu9hbKkjx
         EFIw==
X-Forwarded-Encrypted: i=1; AJvYcCW5BqdVoSiH2JThvqRdQ6r7Cr7R3FMedZ3YAcDJ7lThaE9Vkwf8MUjfVQvjjwnXrn1wREeFmf0vyXo/@lists.linux.dev, AJvYcCWK4Lr868H3imEQu9vfVqRn3XXviY2nRfepNdy2vJzVs0WvR+usQHL4aV04jDJAq1G8mzZhZJY1xIqTpqrL@lists.linux.dev
X-Gm-Message-State: AOJu0YxQRxY0i6VoSWPNs0PGug2a4DqtJMcgaMbcW+EaDI5yIBIjd0fi
	ArVG1R/NyV1HyBVU4CA0nyE8C6Os8fS27tqnNWP3BMGYKcfCtOlOion7R5vT8eFXEQy9VHewgUz
	6z6I+C5JFK+khRHV6zvSp4dSsJ7jdBGCPDcY=
X-Gm-Gg: ASbGncv3MwabJWS858bfDntVnaw5FVP8FTELL5Wx3KJeUJ+Snn4yfV+BdbNUOciN4oJ
	IXVcdhj7K3wuJ0q2klUCBH/ksW7XZyuTFx2yY5JpZhyKdSLh4bmKG7I6nUUYeOQLhKx9tfdIN5M
	wi9HUCzojXSuBOpcNpojy0ykAmqY7r
X-Google-Smtp-Source: AGHT+IFXdU/YZAvxOJqqLDDhDC6P7HTyP2c16ab3xeaYKa0koLLHuUjJ71njQgO24nXztiAlRXq0RvDB6HV8pHKbYt0=
X-Received: by 2002:a05:6122:a09:b0:520:42d3:91c1 with SMTP id
 71dfb90a1353d-527645a5e5dmr5259213e0c.10.1743864928204; Sat, 05 Apr 2025
 07:55:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z/B019elTtKG/PvD@ubuntu> <2025040547-vagrancy-imagines-384b@gregkh>
 <CAHp75Vc0vOB1nDLrV+wmYeshxTsDwYq0xBkmJiOH=d5HONRpNQ@mail.gmail.com> <d3b4e3b4-b5cc-5b5f-26b6-1d726f5e57c@inria.fr>
In-Reply-To: <d3b4e3b4-b5cc-5b5f-26b6-1d726f5e57c@inria.fr>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Sat, 5 Apr 2025 15:55:18 +0100
X-Gm-Features: ATxdqUHEUzZewfl8XOUc_Hod2fcZH_lElHfHjiW2nrFT1vgN6wa3S2r6Ya11cKI
Message-ID: <CADYq+fYMPGFdFvNPyo_XoNdMhh6qu=h10Gb2EDc2Jw=JK9iXig@mail.gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: Use % 4096 instead of & 0xfff
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, andy@kernel.org, dan.carpenter@linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 5, 2025 at 1:30=E2=80=AFPM Julia Lawall <julia.lawall@inria.fr>=
 wrote:
>
>
>
> On Sat, 5 Apr 2025, Andy Shevchenko wrote:
>
> > On Sat, Apr 5, 2025 at 11:23=E2=80=AFAM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > > On Sat, Apr 05, 2025 at 12:09:59AM +0000, Abraham Samuel Adekunle wro=
te:
> > > > Replace the bitwise AND operator `&` with a modulo
> > > > operator `%` and decimal number to make the upper limit visible
> > > > and clear what the semantic of it is.
> > >
> > > Eeek, no.  We all "know" what & means (it's a bit mask to handle the
> > > issues involved), and we all do NOT know that % will do the same thin=
g
> > > at all.
> >
> > And that is exactly the purpose of the change. The % 4096 makes it
> > clearer on what's going on, i.e. we are doing indexes that are wrapped
> > around the given number.
>
> Ah, OK.  Samuel, indeed, the log message was going in that direction.  Bu=
t
> probably it should be more clear.  Why is 4096 the upper limit in this
> case, for example.

Okay thank you Julia.
So I can add something like this to the commit message?

"Replace the bitwise AND operator `&` with a modulo
operator `%` and decimal number to make the upper limit visible
and clear that we are doing indexes that are wrapped around the given numbe=
r"?

You also said I should add a patch for the white space around binary operat=
ors.
I did it together because the changes were on the same line.
Should I still add a second patch for that change?
Thanks

Adekunle.
