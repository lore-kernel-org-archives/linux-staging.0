Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8A9264FA0;
	Tue,  8 Apr 2025 11:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744110195; cv=none; b=tDEu0dnHAyqNRXZWkX7Q3jIsxvIPREuim1mD5SfSCrIMmbdZ6i1M+eYi2PzMcPWthY8wPmkhB0YA2LwImlYi7wRKURAEkw1cIBURkg2weZBzham8iTSvIlVV/Ih4pYkzsbatvb9Xtj+DZjTIPTkP4779T3pefpqnj2shXm15468=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744110195; c=relaxed/simple;
	bh=BiijfwOxAtjf4oaJQt7JBfi9sANawaCZgX+NcFS9SlU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GxxLkffJqFoBG3h6BN56RoZqCyNNecNeDUPUh3GFHibi6daVz6GYS3BLxDGZXoXMZ0a5/yYHqhUxEzNWsgm8Pbfi/hM57dHizbnYf616C/PK2GaW4wyIxhJ+NYIddiwDJpuuwQh3S/WJ5BTZbhMB2QjMtUrbav1/1uR2EUmAxCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eu95XXpI; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eu95XXpI"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e6ff035e9aso10549770a12.0;
        Tue, 08 Apr 2025 04:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744110192; x=1744714992; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/00t6mg8lw/s9Ks8yQUEiUItwkteRs0MSMX6xy9kyuA=;
        b=Eu95XXpItf0mJA0czYWcKXxWmS5lar4l2H/2DCJxAL4XUY3In5hQ2gYA29WK4WsfcJ
         IdgxDLzLXunz4MJWmpanTyTCSwikPHo0bZhAroSHcYeoLWLmYN/Ww0N7y3qGMyS5sVu6
         qQOhqOIL+POfjKBgL3Zy9oU/F5aMU6BurlK3R0uYGL6ls7+gux0SqRHPussv3j+1/bBs
         aiaQWLDF48ckcnX0qxXjGF6Wpy3wpvHdD33/yqeG1iQRRKQa0HbubQCHcNcdC2ZtIF6H
         7YqDGd3V5qK9+n/YnqzmrS+Rwe5TIvdB+0iLG6Gfzl1u83Y0TZ0CsvDSZxjDPmFP5pvp
         MkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744110192; x=1744714992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/00t6mg8lw/s9Ks8yQUEiUItwkteRs0MSMX6xy9kyuA=;
        b=S+YgK+ZUIEqT4wZheOGmWiOewiO9AGyk3t1vKIPb8NGI5Acoz8J4hYlBtTyUDbIVKn
         SG21GZqK5bYJ9SmHvj58+LtC+EGoDRA1/V5drCXMLtK6eV5CP1lqXBUWD5DR236MV576
         wkVZEvL5rdHtozYcChKMnaZyb1ErM1AZECrpFBC1Q289FyvMJAAy3rrNAZha7lkQjP95
         ZT/3/McrPnHvpt8bCpHk4J4eKQuR3U7i3mNI4WdzA6x4JFxaPoJWNeGvQCyipAfFeLHw
         G/KmlldW/hRNtcldNCXlZQlrt7iN8BVgT1ecXu/FBHw1/GrZmS15xjda8pX5gpxmGH0x
         trsw==
X-Forwarded-Encrypted: i=1; AJvYcCUHF1sua3kaei3/PQ6PcPx8BQDYq83PyXLEkpkbKCMXhO5ssZrBzY29qSEE8qmsztNU2e/+ekqxIDMl@lists.linux.dev, AJvYcCXdApITlwwO/kG6tGvfJhD8vVg3vjaKYzqHJLSc58P2OLSDRDVQanRxC9sgqdZmcGOF3+LoxTnB+1XeAVLV@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1iqLL891hU/bQLSfayhGo0Fmy3Unx1eBDxCp7S5NR+z+y1veG
	LGpIs6KGHyVzQtXXj8gen4HHrqZ8is2LBbSTs13/ICf1NBNk9KF3I0+POJXSX+pgBaIz5mjDOIy
	XbH8U6pCuPpHArdJSjq6QWqBz9E0=
X-Gm-Gg: ASbGncvpB1CMxdYcQ1xSkVcDOykmZbHWKOJbnpeSXl3uB63qVZyk9hhh6IGxVSK15GR
	G+iXM4KoK2BnlAyjIs4naAhzxsyEYwIE3+V90y9uS9zdPsOl8oqQJFVs/XG7izfOasoL3lpOyg0
	vBi7/VH7StgviuBzXnvi/lsFIEOfEeLnoilkp+Jg==
X-Google-Smtp-Source: AGHT+IE/TipTw9wWWEYZAgWegMiEBEde2oa+sSYBenoR0MFphvXErC+5XgStffEBQsCm/1nD1TKQBdOyTJl6ckwjXMQ=
X-Received: by 2002:a05:6402:d09:b0:5e4:9726:7779 with SMTP id
 4fb4d7f45d1cf-5f0b3b6255amr13150494a12.2.1744110192194; Tue, 08 Apr 2025
 04:03:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1743857160.git.princerichard17a@gmail.com>
 <2025040538-breeze-espionage-dc6e@gregkh> <CAMyr_bL4Qo_eeVSHhy-_z9_PwcQAvD6N4jfqBb+rtN-Lj+YdmA@mail.gmail.com>
 <CADYq+fY-twT=NruAmfb6EpmYJLM971aTu-CUi-We_Fd6JSP47Q@mail.gmail.com>
 <CAMyr_bLkvFBTpYehG4fs-tqVE18YBf53okddU2=i7+Rr-zbCsw@mail.gmail.com>
 <2025040711-refutable-monetary-f0c4@gregkh> <CAMyr_bKgveKkpRdOWw+VfZDWridLirHp4VoeG_F-wwgSY5jpgQ@mail.gmail.com>
 <2025040840-domain-boasting-81ec@gregkh>
In-Reply-To: <2025040840-domain-boasting-81ec@gregkh>
From: Richard Akintola <princerichard17a@gmail.com>
Date: Tue, 8 Apr 2025 12:03:01 +0100
X-Gm-Features: ATxdqUF4gjnGhN8bVu9BMwjWfNpNmxpcYUvHkM9x18Tm4IWpbKt1sumwvhHSY_E
Message-ID: <CAMyr_bKpXh99=LLpvunwRO91c2u3TMqiO2a1npcjohxRs57Cqg@mail.gmail.com>
Subject: Re: [PATCH 0/8] staging: sm750fb: change function naming style
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Samuel Abraham <abrahamadekunle50@gmail.com>, outreachy@lists.linux.dev, 
	sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 11:48=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Tue, Apr 08, 2025 at 11:38:28AM +0100, Richard Akintola wrote:
> > On Mon, Apr 7, 2025 at 7:01=E2=80=AFAM Greg KH <gregkh@linuxfoundation.=
org> wrote:
> > >
> > > On Mon, Apr 07, 2025 at 06:57:38AM +0100, Richard Akintola wrote:
> > > > On Sat, Apr 5, 2025 at 3:16=E2=80=AFPM Samuel Abraham
> > > > <abrahamadekunle50@gmail.com> wrote:
> > > >
> > > > > This looks like a new version of a previously submitted patch, bu=
t you
> > > > >   did not list below the --- line any changes from the previous v=
ersion.
> > > > >   Please read the section entitled "The canonical patch format" i=
n the
> > > > >   kernel file, Documentation/process/submitting-patches.rst for w=
hat
> > > > >   needs to be done here to properly describe this.
> > > >
> > > >
> > > > Hi Samuel,
> > > >
> > > > I sent the patches individually before, but I was instructed to sen=
d a
> > > > patch series.
> > > >
> > > > Given that I didn't change any code, should I still add version num=
ber
> > > > and sending
> > > > patch series as the difference?
> > >
> > > Yes.
> > >
> > > Think about it from our side, what would you want to see if you had t=
o
> > > review hundreds of different patches a day?
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > Hi Greg,
> >
> > I have sent the new version, please do have a look at it.
>
> Again, please realize that some of us get hundreds, if not thousands, of
> changes a day to review.  A normal delay is about 1-2 weeks to get to a
> review of a change.  Ideally it would be faster, but there are only so
> many hours in a day.
>
> To help make this faster, please help out in reviewing other changes
> submitted by other developers, that will cause your changes to bubble
> up.
>
> thanks,
>
> greg k-h

I really do understand the situation and to be candid, I am in no hurry
but won't mind helping out in the review, perhaps a help with Review 101?

thanks,

Richard Akintola
