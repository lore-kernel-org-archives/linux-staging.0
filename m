Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC271AF0BF;
	Fri,  4 Apr 2025 10:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743764036; cv=none; b=GRU5Klg7KrwgRjR/DWnA6X5lNNYPAcw28i0zLRXqKteXtRm63N4L/3tvlvhCTKPj5t4g514oM6YUBI5hvIexg38hjwBuCeOvMMVcGP7MUk/YvnLPHibgzIdkRjHeMo3JwvZQzUWsD64+fA6MzPM9SUpM8Y0vKOU+eZLqXtyd1sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743764036; c=relaxed/simple;
	bh=BZCPedUVcTzEEIOESnFwk8dQ2HdKzUmeXl81sv2UEek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aVgQYq2GLuVzvspNZvj3xg/XqODWNrU0HTcttMfF4via4+qstU0myLEIZEt09+gdIYBfJZUzOlKYhEkpFbsjmEB5bYSokjjGCiu7UiydTlUi71LNreljfkgMvSpPwciq2m93gDDf8SVcciib8gnKKKvSHJ9TIUirlM/srWgHz2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BUBVevtB; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUBVevtB"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso3911011a12.3;
        Fri, 04 Apr 2025 03:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743764033; x=1744368833; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzoKOi3kQybFr6KxUAkiwvnDG/qKD+NYmi5Me4dtT8g=;
        b=BUBVevtBgFK/q+foQJe1HLkwgGGd2pOJW3cPOCKLyFhZ15gkt4+gQOdOXQN+miFUAM
         ErttPphpy6SkXUgC4PWncCRy7sGco78/+JyM0Zoim/qNjJvuU63uCI9LB8+B6ENRAv2h
         TBffwGnJX1SEEqHobtjIScKwONtsCalMjTWSMpf7yc1L7OGBUNofE0Ee6OkjxwNckVXj
         KRiCpNYC0dIBlL5hSCLCu9fRs9Tz/RsZCWwwIuhna8r5ZRf2gL4P5e/dtg/BtG8CVDLw
         Q871TjIg7xK1Tcl9LDGWIopUxkhF4fOJ+6M+ZQujzGbF+L1dIT+mgq+97EWoGY79284x
         fpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743764033; x=1744368833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzoKOi3kQybFr6KxUAkiwvnDG/qKD+NYmi5Me4dtT8g=;
        b=AIroM5vNTb5aP6JuDfAsKJaQvyAJHTMgT91mHZ2AIqdZ3YTNqIQEP7FqZQBeibfKuC
         YN94tqimMSWo/N5OFCxAVtqDiscRtHyYO2sItZgX91R7/12+018IISc22hJK21LuAKLC
         jxbtvDA2TxosX+aGM1Hc3VqM4PTTa4oZ2QM9JPY+wNq2o2x8I/2JvssT7nqPnJhhjk5T
         91DmszhAtrSxdNPdpjBXx2gdp8tDngpDPw2vvL4l53W0DStQgZDko9rK66n7lPH/RCbG
         mJcYrs52wWS2HKF429GJooDlMSS3R3A66h7IDQ+8rpJWM/FwWsJLDKzsQE1uKHEQPX8Q
         N5WA==
X-Forwarded-Encrypted: i=1; AJvYcCUV50LVaaU3zvZhI+aJ//eoi78qkelKBtpgXxcNKd2L0+jO3HTu7eVPKBZSCrJHq0oOnxzba7XKHAsQ@lists.linux.dev, AJvYcCXSUXm6FQgPsQLyY31gfv0CTWJwmTZcIfkD2Yyag4HgNfcQ27uxjG/tWQXeP9r0MKKKhmQw2fMZ3L6/evJS@lists.linux.dev
X-Gm-Message-State: AOJu0YyB+ZhnzHrMPFk30r6CwsH0VoKBVus0dfQBdCMlh44f5q4a5xZV
	NQF0wTwNAPBydKSjHyTJvKGdXVFfplHe5MVMLrGUGyai29cf/ovZnPR3aTz8JRjrB56rDou16a9
	yXs2wfg1ZaLRlyQqzUM0Gg335zbk=
X-Gm-Gg: ASbGncswDmaL9pxA3MFovdWGhIwetaV2u1VLwNrs3HJw/7KUn8cVFmEh3bqCI6UAAvZ
	2bDBwCjpkNlzxFUbyZl/RONtHjqeKHcfTbfiBIy3ClTvy+I/WMGlmrhowAlcYtriqCwB63ck2NY
	LC0CrgmrbS1cVDa/MD1Or8s+eA/CUk
X-Google-Smtp-Source: AGHT+IEPV8PAptMWDzfSdlSImvE7AO2/uprJzp9c+dI/pYZBjRLhfIX603krWrIhQBVUgvcHx5yh2sq0T5QpfCoLFG4=
X-Received: by 2002:a17:906:c156:b0:ac7:1ec1:d8bd with SMTP id
 a640c23a62f3a-ac7d190dcd8mr276168666b.29.1743764032815; Fri, 04 Apr 2025
 03:53:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1743723590.git.abrahamadekunle50@gmail.com>
 <6fe7cb92811d07865830974cb366d99981ab1755.1743723591.git.abrahamadekunle50@gmail.com>
 <CAHp75Vem1E9wmmfXWsbawj2f+F=UkfzML7HyAnhTdsUqvjW91g@mail.gmail.com> <33a8d769-33b9-43df-9914-99175605b026@stanley.mountain>
In-Reply-To: <33a8d769-33b9-43df-9914-99175605b026@stanley.mountain>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 4 Apr 2025 13:53:16 +0300
X-Gm-Features: AQ5f1JrMhUrmnx9y1Elr0jkkAtENgAZyuItBSPMV9LiPOkfcs7Op25giXezOGJk
Message-ID: <CAHp75VfDOaK0EXNc79cM1mNWapm7fhshU550q1mAKQdtRbUNwg@mail.gmail.com>
Subject: Re: [v3 1/1] staging: rtl8723bs: Prevent duplicate NULL tests on a value
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>, outreachy@lists.linux.dev, 
	julia.lawall@inria.fr, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 12:06=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
> On Fri, Apr 04, 2025 at 10:53:22AM +0300, Andy Shevchenko wrote:
> > On Fri, Apr 4, 2025 at 3:03=E2=80=AFAM Abraham Samuel Adekunle
> > <abrahamadekunle50@gmail.com> wrote:

...

> > > +                       psta->sta_xmitpriv.txseq_tid[pattrib->priorit=
y] &=3D 0xFFF;
> >
> > > +                                       psta->BA_starting_seqctrl[pat=
trib->priority & 0x0f] =3D
> > > +                                               (tx_seq + 1) & 0xfff;
> >
> > > +                                       psta->BA_starting_seqctrl[pat=
trib->priority & 0x0f] =3D
> > > +                                               (pattrib->seqnum + 1)=
 % 4096;
> >
> > Logically it's obvious that you need to align all cases to have
> > consistent approach.
> > Besides that the commit message should mention this change. Something l=
ike this
> > "While at it, convert '& 0xfff' cases to use modulo operator and
> > decimal number to make the upper limit visible and clear what the
> > semantic of it is."
>
> No, I'm sorry but that's really against the rules in drivers/staging.
> Don't mix unrelated changes into a patch.  It needs to be done as a
> separate patch if we're going to do that.
>
> To be honest, I don't even want people fixing line length issues or
> adding spaces.  I would have accepted small white space changes but I
> prefered the v2 version of this patch.  Once you start changing
> "& 0xfff" to "% 4096" that's not white space and it must be done
> in a separate patch. I use a script to review white space patches
> because I'm always nervous someone will slip something malicious
> into 100+ lines of reformated code.  It's really fast to review
> patches with my script but once people start mixing things in then
> it's a headache for me.

Separate patch is even better, indeed.

> Also if the change accidentally introduces a bug, I want it to be a
> one liner change and not something hidden inside a giant reformat.

The noisy {] have no point to be left. Now I'm curious, what do you
propose here?

--=20
With Best Regards,
Andy Shevchenko
