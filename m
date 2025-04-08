Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68896264A88;
	Tue,  8 Apr 2025 10:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744108724; cv=none; b=jJWUdQGOVXIAXcZ2Ch3FL+W0+eg1ODLhROPc0/6XGZW4CLGJC5orVkqHIhZ2lwZZHcgOUNvBXCoLZQEcRYtGMWzfazFfv4hl1IZbsKAWTlAnaouCxyUnJauY3CvuIOW+ax2eT8tZb1UK64FekppLwiaQ3H3TvsbpBJBxQLMZfzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744108724; c=relaxed/simple;
	bh=ClASX4VBDVwAzQdSceNylf/BZKDO4TwJQdbNrAChR4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aLOZ+4ppPIlNdzUPtZOQN7vEN84x39P9y7oordKkpl1IR4WOZ07e0NiF9UvOW9jKuRPU+4jBJ6/4HajVE7cd9SZ9SzRYgHY9Muneh2E8WDmhhsKZ/ZUFzwF1Sv7RGSrLs+FQs8fE0REwXR6jnWujwltL433U+JOybdKECXXOK3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iTem7HKX; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iTem7HKX"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so9293176a12.0;
        Tue, 08 Apr 2025 03:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744108719; x=1744713519; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLaSOgwbcr+Il2t2O6boJjLPotCqperIiZ1qWfjVdnY=;
        b=iTem7HKXAagBTtXEK/GBh6QKDJWGRADXPmlDjo8+R0odCoNDpmz05Iv6GcYrn9VbUd
         8FHMpRFAOuFng9X/yvvyunnfkfiJ0VQXdGP60FVrxgRVnyseutEudmZ5cnTW6Ie9mpLL
         pubhE+ICSD+2wk0hj/HiJTB7TmJckS0c3zgIuy6ftLupOMo+QZG6teVZIthzgeeMR0/D
         RThsy2pkL4wVwaMLS9290ohUdv3Ot9WTlJUGfWfgx22lVfpGS3vI3BSRrchwwfAwtNFw
         bY9+w5Xoj4b264AkEQq9GmxknSdAnhnIrMoUvgDq0k+XBEVFGuEJKjg1d7UkcyEXVaEL
         KbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744108719; x=1744713519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aLaSOgwbcr+Il2t2O6boJjLPotCqperIiZ1qWfjVdnY=;
        b=AHCef/2cdsYKrys5qMaV7MJdt8mcL9pqlARV0e2GW6hFPOkGkmIM+MbagsS6WguBLm
         wUiZqJzSC0YBkAOE0IYAKqnk8TwxfjKbqVOCgFk+AY7/MaNCgFyLi6GN7otlg3ANEfzn
         72iGc5hs7O8Us5oPovehEB5Wv4wO1BMNipyXvkzkkUtWeNHdYDAH5wzcGqI/RObBFz/S
         fTVnD66uvoUiZq7SRWlXjpbr0e6i6MYqrYajnx3u3EHw1XCawPAvXMf3Xg8z1Sl0e8b5
         DAI9659jRFkoZZffB0GskrrnFWRZrQnXevKFB9MJ/8qxHwo9F6kQ9f1rU1J3ijOZHnsE
         gAeQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3X/e/UVBB3dSNqY2n6NRSpXqw4GQ9MVCY+jTbyte3xZeLRnIbjQoxsen0QKSTjICyiujv/2HQpcgf7gu+@lists.linux.dev, AJvYcCWoSK6NSa+eakbv28jckIodJnM7HUgK5Ejo+TMOK0IR0h/uftXViYkz231B9UwCuBHBZkaX5QKGRPVD@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5u6znPrPszv9LhH2rPj1ZqM4jAS2h7xX39lzZcbdjlswOtMz+
	HQ8aeQxVIqR1IGUPNSnZtKV014ty18nEQrNlsrbg+pAqdg4f6WqRWARKvTt/MnWruDpAlT8D7C3
	Cb89N/8gUVSssqpDNK2TSMCBF5Lr6KQcTKVI=
X-Gm-Gg: ASbGncsZLpeeR4Xj2LnX4QRqaJSXPg2jutqmtM1tjL0GHXlWnt2M15i39LK49w3xhou
	2163wRSjM4q2OLLgVDNs4LcI5nTzU7YdnmYBdBENJ2nFjIVIkK++LnWOVEQxThmD/MJKvWn5Ld5
	q+f+9YiXo/BOdV9yDguswtMOKh0Mg=
X-Google-Smtp-Source: AGHT+IG1OkLi2dBwtZHj8xh6E4uTxeL61LbO5cEWBcFX3jqGDmARdYvh3vX315w/re8lZ0aqREIlR0wet3AJ2lKZaAc=
X-Received: by 2002:a05:6402:5194:b0:5e7:b02b:6430 with SMTP id
 4fb4d7f45d1cf-5f0b45001b9mr13069758a12.23.1744108719601; Tue, 08 Apr 2025
 03:38:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1743857160.git.princerichard17a@gmail.com>
 <2025040538-breeze-espionage-dc6e@gregkh> <CAMyr_bL4Qo_eeVSHhy-_z9_PwcQAvD6N4jfqBb+rtN-Lj+YdmA@mail.gmail.com>
 <CADYq+fY-twT=NruAmfb6EpmYJLM971aTu-CUi-We_Fd6JSP47Q@mail.gmail.com>
 <CAMyr_bLkvFBTpYehG4fs-tqVE18YBf53okddU2=i7+Rr-zbCsw@mail.gmail.com> <2025040711-refutable-monetary-f0c4@gregkh>
In-Reply-To: <2025040711-refutable-monetary-f0c4@gregkh>
From: Richard Akintola <princerichard17a@gmail.com>
Date: Tue, 8 Apr 2025 11:38:28 +0100
X-Gm-Features: ATxdqUED4mJO0oYd1IguyXKnR51UPXRuHJL-QRIDRwetTTWsHh880oNHQC9O1UU
Message-ID: <CAMyr_bKgveKkpRdOWw+VfZDWridLirHp4VoeG_F-wwgSY5jpgQ@mail.gmail.com>
Subject: Re: [PATCH 0/8] staging: sm750fb: change function naming style
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Samuel Abraham <abrahamadekunle50@gmail.com>, outreachy@lists.linux.dev, 
	sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 7:01=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Mon, Apr 07, 2025 at 06:57:38AM +0100, Richard Akintola wrote:
> > On Sat, Apr 5, 2025 at 3:16=E2=80=AFPM Samuel Abraham
> > <abrahamadekunle50@gmail.com> wrote:
> >
> > > This looks like a new version of a previously submitted patch, but yo=
u
> > >   did not list below the --- line any changes from the previous versi=
on.
> > >   Please read the section entitled "The canonical patch format" in th=
e
> > >   kernel file, Documentation/process/submitting-patches.rst for what
> > >   needs to be done here to properly describe this.
> >
> >
> > Hi Samuel,
> >
> > I sent the patches individually before, but I was instructed to send a
> > patch series.
> >
> > Given that I didn't change any code, should I still add version number
> > and sending
> > patch series as the difference?
>
> Yes.
>
> Think about it from our side, what would you want to see if you had to
> review hundreds of different patches a day?
>
> thanks,
>
> greg k-h

Hi Greg,

I have sent the new version, please do have a look at it.
Thank you.

Richard Akintola
