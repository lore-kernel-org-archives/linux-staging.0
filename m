Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7D72D8DB5
	for <linux-staging@lists.linux.dev>; Tue, 18 Nov 2025 18:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763490973; cv=none; b=Qsi6Fjk8f58rJT5BjDt0B3wGJPLu6eKpdk3AxYq2AaQLwDOiCBU6pTa3pdNcdHtE41jrhRLtkg2ryJu9srts02Hjr6ZOGI+019SqBJsEOF/d05aTgu6hbrU0CfXkoVE4eRz7+rsY9FnuTta010SsH8TbADwvjS7RxWuljE06/Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763490973; c=relaxed/simple;
	bh=0W1aoFTm4VFMmK1hkBqJ2zS6FpPE0OxnZd4eurmwFPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G/gW92+uNKhn2XnMPWCczt3Os6QKiQvNq/+2E4La03w5/Ij9qYzdmxIgTw7lXhYuWRYNGyJjPKqPl0SMcfHbWwN7tUtq2oGIH5xouOrW2V93X0PT7A2dZDaGfK7xGP6HIhV9v2aJvNsYKttXZ+kxkxyoEwDcMjAJWB7g2XHclWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bx80cHVq; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bx80cHVq"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so4886971b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 18 Nov 2025 10:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763490970; x=1764095770; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=79j4iqbcGQ/T4wx0pyL6Ik5PHIuwtyqnErQphNVBlhk=;
        b=bx80cHVqbzvW7ulu1RMX853eDw7hOous5u/zc932+7/p4TehK5nb81NjXeAJ1jpkzC
         ZZ1aNF1paGpCI1zZq4tFLzV/W/zjd3AGMa8gZX98tIzD5cHAJSjCPXSk1K6ABGa1YJbz
         O7RVsAJvaAv9xRzqxdSjOjELLKtcT5h3noC0HdNWIJrzEN2BYdjRRyr1ckFZ+kz88qhp
         H20f6UFCsj0anzqGGesdtM874WH+fliDpQXXEk0DrhfutKvn7Lc+YpsG3X9KuiQqQrv+
         riTb1l6Y7+bHDjmgJ2+niRcApmS4IRydY3SXvk6zCUa6xRvrv3vSrjrrd2yG5rZOuQF/
         lOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763490970; x=1764095770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79j4iqbcGQ/T4wx0pyL6Ik5PHIuwtyqnErQphNVBlhk=;
        b=G1RnlXZX0CKWlH9T1QZJX2WgG8cU8tg988oshMwUkubzWhumkzrPHbOE0R/YPnYBcz
         CAVBdkIr6UlnHDT2culcKbDVZY61jF1kDansAhqUCTBu/AwSypP6/NQoOt2jdbeioghY
         6TFzEAr+ulBovWLrf7HdeGMqc6ECVixEE87btk723ekRmcwR0vgnqgvvINswtiBMw823
         pbPkTRI8PaZ2DJHj3YfVKDImHfFhqxvKlXVm+qQsb7Pu2gY1wLntz538uboWkr8IZoGO
         Oy96IdOE7Th6ga0CKUfGPCokE7i0d2DjC06sReiKD9Q3eVX41SEBT2J+lN/LRQ8/2uwb
         PoTA==
X-Forwarded-Encrypted: i=1; AJvYcCUda8MhXsT6RxYzlMX3mjbHdxhdCIjP3TYuyS5XOQe6QVx/Zpe7jh8CAQeqrvoqK3edbzxVGOZTRloDPnSn@lists.linux.dev
X-Gm-Message-State: AOJu0Yzyk8H5Y8/NNp/6BiwoSiC9V0pweesxf6cEhIpxoF4z+UTmrAGl
	aOUlngmk+aJNGYv1jPp6sEHbd371ZZrEJfoXEABtMdXbHYZy0DEClcM8
X-Gm-Gg: ASbGnctZISuMuzZv7THEZeLEWMGzsU50Ou2eVLeM1bKNRyKrlE8rDLoHhIqUSwll7rt
	P+Ik7rvHPKZyF4J4Pfy8jk/xT6FmxWRJR4PpxVOWlfTXogprC6f+hxZbiEw8abo6soQFicitJp7
	a514GJflnjTNv+OkRn2ehS9YKANmJGa0eF6ismim19ScUMr0yRO18hrlQGqG74m6t6xHGYVL7M5
	6inEIlXNKnQLvNniy7RbRhdMHbrBebs5apN2hGSSO0ooae3AnGy8xzQUmG55TVm5InlWThawI1H
	07FgikENoTxWtMPoeZztFW+peIVR9STrCODFhgeH4zWFhHxrEDGopmCFN1pmbJxzMeLirRkC+cQ
	mPIzQPsD7kukt/uTBCgKRd9P7FyZYjWtVJomCcEa2ApRAiepw8yisg80Lf0+KN4d80YKhbhxEpG
	YBIgWeOg2zP0yq
X-Google-Smtp-Source: AGHT+IHa4JRGCsbncxOnBeaVQyIlL5r4RDTWOvg7YK3NBAhwiTWYtCH0KppHR0FS1usI8OZ20uFUtQ==
X-Received: by 2002:a05:6a20:958e:b0:251:43f5:cad4 with SMTP id adf61e73a8af0-35b9fa862f5mr20739767637.10.1763490970504;
        Tue, 18 Nov 2025 10:36:10 -0800 (PST)
Received: from ideapad ([139.5.199.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36f52361fsm15893241a12.15.2025.11.18.10.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 10:36:10 -0800 (PST)
Date: Wed, 19 Nov 2025 00:06:05 +0530
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: gregkh@linuxfoundation.org, elder@kernel.org,
	linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org
Subject: Re: [PATCH 00/13] staging: greybus: cleanup, FIXME removals, and
 driver correctness fixes
Message-ID: <aRy8lRKzCTNDTc-u@ideapad>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
 <aRyaoaauQyE78OhX@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRyaoaauQyE78OhX@hovoldconsulting.com>

On Tue, Nov 18, 2025 at 05:11:13PM +0100, Johan Hovold wrote:
> On Mon, Nov 17, 2025 at 11:48:05PM +0530, Ayaan Mirza Baig wrote:
> > Hi Greg and all,
> > 
> > This series performs a set of cleanups, correctness fixes, and
> > remaining TODO removals across the Greybus drivers in
> > drivers/staging/greybus.
> > 
> > Greybus has existed in staging for a long time, and many FIXMEs,
> > outdated comments, and partial implementations had accumulated over the
> > years.
> 
> These haven't accumulated in staging, but during development as the git
> logs should tell you.
> 
> > While reviewing and compile-testing the drivers I found a number of
> > places where the comments were obsolete, logic was incomplete, or newer
> > subsystem APIs had evolved.
> > 
> > This series addresses those issues without changing any fundamental
> > design or architecture. All changes are self-contained, straightforward,
> > and focues on improving correctness and maintainability.
> > 
> > The patches include:
> > 
> >   * Removal of obsolete FIXMEs that no longer reflect the current code
> >     or hardware behavior.
> >   * Correctness fixes in several protocol drivers (UART, RAW, USB,
> >     Loopback, Firmware core, Audio).
> >   * Small improvements to error handling and shutdown paths.
> >   * Cleanup of commented-out or dead code.
> >   * Removal of the now-completed GPIO and PWM TODO items.
> >   * Removal of the empty Greybus TODO file.
> > 
> > All patches were compile-tested with COMPILE_TEST=y and all Greybus
> > options enabled. Runtime smoke testing was performed where possible.
> > 
> > This series does not attempt to graduate Greybus out of staging; these
> > changes are preparatory cleanups only.
> > 
> > Thanks for your time and review.
> > 
> > Ayaan Mirza Baig (13):
> >   staging: greybus: Remove completed GPIO conversion TODO item
> >   staging: greybus: pwm: move activation into pwm apply and remove
> >     request()
> >   staging: greybus: remove empty TODO file
> >   staging: greybus: audio: remove obsolete INPUT_PROP_NO_DUMMY_RELEASE
> >     FIXME
> >   staging: greybus: audio: remove obsolete FIXME and document topology
> >     ownership
> >   staging: greybus: bootrom: remove obsolete FIXME about SVC parallel
> >     event handling
> >   staging: greybus: bootrom: remove obsolete FIXME around firmware
> >     filename logging
> >   staging: greybus: fw-core: remove obsolete S2 Loader runtime PM FIXME
> >   staging: greybus: loopback: remove incorrect FIXME about async wait
> >   staging: greybus: raw: handle disconnect while chardev is open
> >   staging: greybus: uart: clear unsupported termios bits
> >   staging: greybus: usb: validate hub control response length
> >   staging: greybus: usb: remove obsolete FIXME about bridged-PHY support
> 
> I only skimmed some of these and there are so many bugs and
> misunderstandings here that I can only imagine what's lurking in the
> remaining ones.
> 
> The basic misunderstanding seems to be that FIXMEs can and should be
> removed without addressing the underlying issues.
> 
> Johan

Hi Johan,

Thank you for taking the time to review the series, and thank you for being
direct about the issues. I want to apologize for the misunderstandings and
for removing FIXMEs that should not have been touched. That was my mistake,
and I should have taken more care before modifying areas of the subsystem
I don't fully understand yet.

I also want to be transparent: I'm an undergraduate student who is just
starting to learn kernel development. I'm very interested in Linux and
want to contribute seriously, but I clearly approached this series with
more confidence than understanding, and I am sorry for the noise that caused.

I'll resend only a very small, focused series once I have properly analysed
the code. Before I send a v2, I want to make sure I am going in the right direction.

If you have any guidance on how I can improve - in terms of approach,
review process, or how to evaluate FIXMEs and TODOs correctly - I would
really appreciate it. I'm trying to learn the right way to contribute and I
don't want to repeat the same mistakes.

I also want to double-check whether the PWM apply() changes (one of the
TODO items) were done correctly, also if there are any issues in
[PATCH 10/13], apart from what Abdun suggested.
I'm willing to redo the work properly.

Again, apologies for the errors. I appreciate your time and feedback.

Thanks,
Ayaan
