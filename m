Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0633B1006
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 16:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778604289; cv=pass; b=cX5SqIMvRisgK98lBfryHtgAMCxvrzCuHU1RrSC2gDdxRptbU/JV67YM1P2EcjOUbjAOMppxBHAGLZG/TZgar14rUYn5ytqISb4VPolS/bZ/f9epWYVm8BcqS6taGtIP9YvC7L+vnziqFTT2seDy+99fh99neSwbn8MbuzMec7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778604289; c=relaxed/simple;
	bh=K6EwhBYgR8WREX71C7289RCShC9p/K05c7wVnAzzM+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RfrL6f6qfV+q2SYiDK+piTA94eqB7w29GRQgWochOqVKrjz7PMWhZLVDYm0pfuYy0I1753YDZgcIf5cuStGT8w3dLibQjXQp/2gijfDHJpcSkOp034g2gbVKRfbXSKdaih6WLQ9EWqZRRJW3LomfPXyQSxUSDsMaT/kQF56u/6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MGO0yV+I; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MGO0yV+I"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2f00a567cfaso3761399eec.0
        for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 09:44:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778604288; cv=none;
        d=google.com; s=arc-20240605;
        b=KKGxisKQS1f7iJw9Bufgu0ksKgJnKuYf3qXO/em9vvpum0Gy7zXkcuRAXofB+rWwO9
         WQ0zR3oeKY3ViyuTOyz/7jF/ESDOBENdSky/TJCOR09HVM3oKYU//P6gQdbx0+TamFtV
         UH8gmkwEnhPYFlZZq+8OgrSH8ZCvrXPtMR0vNmWidIxdJF0hvrgZI6MBUi54VS5CZz0Q
         GQEcV+Nvt4pYTA0F3ZArYQOP4mhHU2QE3AxLBSbq8Zej7nfV34+kbsGsBtXooNZwB7bS
         kWsC046bWEnihpJsEm3kocdi2kKzICLn4Y+fBI84BQW2xOaIKYar6/YrqxSOiwu6X7dD
         LN0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KE98TqSBxX5Jt7KSWTUV2v7V5IAS8/o4Rankgx3Gkes=;
        fh=Pngfo9ElFzDpiilUO4K+eGbrTKenuf5XIFIndjKpikI=;
        b=ehIOPFPsobhv7m/byZ8BuyDO+RmF+E1A+W0NZrx7+2iMG8LuTqEDaQyXvy5YfGvNYY
         9duQ3K8lRcanumDDrnWCy1q/w2HW8yyYLEfbbJENbWn4gAK1EgYf5nsjgF1gDwzS0Pp+
         jpyv2lStOmxuQe2yLYmivF2eLNW0yv3Oocb5jQSHf6RVu65MEOhyUtEg1wM/EW3nFU9T
         8B0WRt6HACMFNFsWlrTYj+iBbBGptKO1tyY/jtiKMPQ6oRBm4DGkJ64Xd4TR6MPoPuNP
         4X0DGTmsOxCvVyHTFcT5KGaEe8Wu+g8LTOpMs/ghiL/2pvK+W3y+3V1e2oFuc6acCPl5
         Irtw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778604288; x=1779209088; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KE98TqSBxX5Jt7KSWTUV2v7V5IAS8/o4Rankgx3Gkes=;
        b=MGO0yV+I2sU9hDGC0kMkTr4WJ/Gauqc6T1aqaHeFbdn+6lBwvx7Dp82P4S4JsOQ88D
         WrCVyUkN7xRJxY5J7vlBQkwKxiXjciZumAveN4AUZ64mB1AFqAmmNsJoZ2hzkOXt7Mgp
         ytxj9+vFswxHaTdtJY2qlgDmAGPclxid1ajPIie89ynfX3hgGOXIudAi1Bp31EI/tqlW
         nXuaS9C087HJgPSBE8fqcUDzFDeII6FMlJjEI3fmTZbp92JjM2fvVFV/ExXdL1bUrp85
         1snj7oSfy+ekuSMDx0pLBvuYRZoVOJ9qUSIjbQ+/zgZHSUyhC3kW89YNzIXjFDIbtJgv
         DJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778604288; x=1779209088;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KE98TqSBxX5Jt7KSWTUV2v7V5IAS8/o4Rankgx3Gkes=;
        b=NfTNcYbgaN5nLivPwKOxhk+F2YAyFnMAYKDRdkp57miv8NLEnljeGhArLVODQVrq7S
         7sZhTgBa3szDF1JWEqsdgILfkc9GtKfYIiLP38XMEPgh0fF3V8AMP5/0L3tvsX8XKy08
         MBN6IeDRb27tLv92x91cdkyNWnnXpxIYrNpr043BFIhEVn0demVQwSMdvFB5kGV2HzOE
         9NcTw2afMqBcG2X5TuncGqfnPB4LKb+5ocZjXAKiNR2hw8tPN5wjhsjPC6FE1wqx/o3I
         5NXbdPU9cgrRUjbvBJwvyZEISKiLdvoaZUeGm+EfqGXsUpeAojvXeMWzhom7H9v9UKos
         tZLA==
X-Forwarded-Encrypted: i=1; AFNElJ8K8GKjpYXC/o7ENV97Z+ciMT9gODsYzEXybrZBYS+sX3n6zkNzNTQtKybYX90up+Ob/F8V+Ni0GoNFydS/@lists.linux.dev
X-Gm-Message-State: AOJu0YyPfWQKKUQ6L9lPNuI7VFCLlLnzTybVlw2OYco5e0FEvFibr88X
	kFE7xT6axFc6y0tLwNMVcJsselwX/xjVNrtXDVBbFyAyPGLlUlFVKTIrK3C15SpNp1yVGCqNiwE
	6EAdDPFXXnuZHKFYIfW9jQiYUiTCgbDw=
X-Gm-Gg: Acq92OEHPiXK7X6cK0v6DySlZiS+Ofw86WteKm7IQ12mGMJepD0QfDVOtgrWOTeaiNL
	S53XtBdtfai8/owetudstKvgiZGlBkDciG+VvkyqNaZBISOmRiM4/rLIo2o4bCEe9D2rY44oD2u
	ZmUtrFtJLvZT3gSGqlMuopJtSh5eZ9PkzwAO52wfK1WAYr5IYIBklgqt9M3jyhmXMmeo1AcRE0D
	yL7CpLLXO8XvoTEa8hYCDBJ0xuYN/6vR32GkzJsyFysY3/ENjVruXipAvJ4n/qGjlFJUmHITqdq
	iNF6LN04
X-Received: by 2002:a05:7300:503:b0:2ed:e16:6b38 with SMTP id
 5a478bee46e88-2ff944e99b9mr2499775eec.16.1778604287204; Tue, 12 May 2026
 09:44:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260511171255.9668-1-abinashsinghlalotra@gmail.com> <20260512150846.76f896a7@jic23-huawei>
In-Reply-To: <20260512150846.76f896a7@jic23-huawei>
From: Abinash Singh <abinashsinghlalotra@gmail.com>
Date: Tue, 12 May 2026 22:14:34 +0530
X-Gm-Features: AVHnY4IgZXPWJF00K01R5LMvN5_zrc3SvwalKeQUzotOXkiT2RgTCJ5QeEP2vUI
Message-ID: <CAMV7Lq7NqxO5cpy7zSrawBORWgtEhm2QTTgRtLptV9==yCs+wg@mail.gmail.com>
Subject: Re: [PATCH] staging: Documentation: dds: replace frequencyY with frequency
To: Jonathan Cameron <jic23@kernel.org>
Cc: gregkh@linuxfoundation.org, dlechner@baylibre.com, nuno.sa@analog.com, 
	andy@kernel.org, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Abinash Singh <abinashlalotra@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonathan

On Tue, May 12, 2026 at 7:38=E2=80=AFPM Jonathan Cameron <jic23@kernel.org>=
 wrote:
>
> On Mon, 11 May 2026 22:42:55 +0530
> Abinash Singh <abinashsinghlalotra@gmail.com> wrote:
>
> > From: Abinash Singh <abinashlalotra@gmail.com>
> >
> > The documented frequencyY attribute naming is implementation
> > specific and differs from common IIO sysfs attribute
> > conventions.
> >
> > Replace the non-standard frequencyY attribute documentation with
> > out_altvoltageX_frequency and document tuning word selection
> > through out_altvoltageX_frequencysymbol
> >
> > This makes the documented ABI naming consistent with standard
> > IIO sysfs attribute conventions and clarifies how tuning word
> > registers are selected and programmed.
> >
>
> Hmm. So some history on why it was done like this (long time back
> but I think I recall the basic argument).
>
> Consider the programming you need to set up FSK on a channel and
> the fact that someone is recieving the result.
>
> When you set the symbol to program it that channel will begin
> outputting the voltage. That means someone at the other end starts
> decoding it.
>
> Hence we normally expect to set a frequency 'before' changing the
> symbol.  Hence the per symbol files.
>
> There might be a valid way to set them up using your proposed
> interface but I'm not currently understanding what it is.

I think I misunderstood the purpose of
out_altvoltageX_frequencysymbol.

I initially thought it was used to select which tuning word register
to write into, whereas it actually selects the active output tuning
word. That explains why my proposed interface was confusing.

The ordering requirement you described for FSK setup makes sense now.
With separate frequency0/frequency1 files, userspace can configure both
tuning words before switching the active symbol.

>
> We went through the same dance with the more complex DDS that
> Rodrigo is working on. Take a look at the multichannel approach
> he is using.  It may apply here - I'm not sure.
>

With my approach we can have a new entry  /out_altvoltageX_frequencySelect
which can act as a mux to write into FREQ0 and FREQ1 register
via  /out_altvoltage_frequency.

I will take a look at Rodrigo's multichannel DDS approach before
proposing any ABI changes further. It would be helpful if you could
share links to the relevant discussion or patches.

>
> >
> > Signed-off-by: Abinash Singh <abinashlalotra@gmail.com>
> > ---
> >
> > The out_altvoltageX_frequencysymbol and
> > out_altvoltageX_frequency_scale attributes can be added
> > through extended channel attributes (.ext_info in channel_spec struct o=
f IIO)
> >
> > Feedback on this approach would be appreciated, and if
> > there is some other way in your mind. I would like to
> > work on that.
> >
> > I am also interested in working on the sysfs-bus-iio-dds
> > documentation and the ad9834 driver. I recently bought an
> > AD9833 IC for experimentation and testing.
> >
> Excellent!
>
> Thanks,
>
> Jonathan
>
> > Thanks


And do we need to really work on this documentation in order to work on ad9=
834.c
What else can be done in ad9834.c apart from this naming.??

Thanks

Abinash Singh
