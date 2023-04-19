Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D27D2FD
	for <linux-staging@lists.linux.dev>; Wed, 19 Apr 2023 21:48:30 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-52019617020so224075a12.3
        for <linux-staging@lists.linux.dev>; Wed, 19 Apr 2023 14:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681940910; x=1684532910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3umHbQ49oYLkecPTCD3JSlHIMiNfIqcecI+C874KcLU=;
        b=57b1kFmCr0701sHULhDh6hJvbcA/JCF8T9BfMwXm6gNKjpoFgqkiRNbbSCJ4usngpL
         DKoGEALP4T49ns+mn9Gjv4wAwMsxJXX2CEhhTwvjiI9gSUad8Xf6JwRPGb/31lPG8QXt
         k9LnwFASj/5ONaJ3FyRZZ7Jw6CRyA8Kfb/FtlTr3dCsIMd6gxEXqr9vnxM756KUQjIyW
         1vIED6gatAIMxxqosz2P5t1Ftk7rQ1zIiTjX2GU3joytTkiefDxjc4cApJWVgXQ4kQQV
         E9Kyj2dEfkawcnBtSLuq4vJ3lTHiSMyVhXtmT47lT2Sk4GoMX+MRU7WkNiSgCJGCzFgh
         Z/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681940910; x=1684532910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3umHbQ49oYLkecPTCD3JSlHIMiNfIqcecI+C874KcLU=;
        b=PJn2dOuWSiOz3t+f4OijARuaMtrMIOwPfFj7t1ATJxfAJZb9TuZUdn79BAmdk0HLeD
         VaOMFwSSHdYLYOytjcYbXoFo62jIiVcU/OklICxMSJzKAgC87nZKTShWH6I2f1gENQQB
         Vhrg/p1Ici1Y/Ao4SeaE5FULGqg/18cmNwzyY523hWurn9IRKdwmJh9jZx/rpAjs5Btf
         AfZ6LjXwcPgoLuiT2ky6sfkxkJ2LaGAaPEK5KhNY1L9CvynY7a+RyYFIaaJJ4FQnXzt0
         FK5wpfH+uO7vA9hCwizkX2YL4OT8L/wDlfOlYBGe2hDv90jgcJ5fnn7dKCYhIskR2g58
         J+aw==
X-Gm-Message-State: AAQBX9eCLbTjd703RNkMSPjNLwwvCLnIkre/HjV1fbMtcj3TlD7NOuOc
	wYhIVbS9PKigAWwLy78fIqiFoGWKQp9WNDYo0EHdxg==
X-Google-Smtp-Source: AKy350aYZAOdqbv0OVmtpCPAntPobWMY0GOLA+cGXP3stu82EOGCdTmpnZBPzc3tJVfo/0nrqABBLXLtnhTK11hhUxg=
X-Received: by 2002:a17:90b:33c7:b0:23e:f855:79ed with SMTP id
 lk7-20020a17090b33c700b0023ef85579edmr4217873pjb.28.1681940909903; Wed, 19
 Apr 2023 14:48:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230418-vchiq_platform_init-static-v1-1-3c38ba81bc66@kernel.org>
 <e1fed875-059d-bf98-f9da-09c51f362be8@i2se.com> <ZD+rethobzN+rONr@kernel.org>
 <CAKwvOdkKACfOvZ4BcG9NcO1Kh97vqSx0y7ZBc+BOJnHUpq8qWw@mail.gmail.com>
 <20ac24d6-4d94-4003-9203-d852714e1a46@app.fastmail.com> <CAKwvOd=kShNVxFvjODEghrHGXK7Gekwcwb3cEFUgEBhZcOHC_Q@mail.gmail.com>
 <8d070a27-fa53-4965-95b0-e0bf8bb90609@app.fastmail.com>
In-Reply-To: <8d070a27-fa53-4965-95b0-e0bf8bb90609@app.fastmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 19 Apr 2023 14:48:17 -0700
Message-ID: <CAKwvOdkCPy7XQS4dZ0=Ka8TNEStwqLhaW7idPJ+fA9d+A0Sjxg@mail.gmail.com>
Subject: Re: [PATCH] staging: vchiq_arm: Make vchiq_platform_init() static
To: Arnd Bergmann <arnd@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	llvm@lists.linux.dev, Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2023 at 2:42=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> On Wed, Apr 19, 2023, at 23:38, Nick Desaulniers wrote:
> > On Wed, Apr 19, 2023 at 2:35=E2=80=AFPM Arnd Bergmann <arnd@kernel.org>=
 wrote:
> >>
> >> On Wed, Apr 19, 2023, at 23:21, Nick Desaulniers wrote:
> >> > On Wed, Apr 19, 2023 at 1:51=E2=80=AFAM Simon Horman <horms@kernel.o=
rg> wrote:
> >>
> >> > Marking something as `depends on OF_DYNAMIC`. (Not sure whether Arnd
> >> > meant that for BCM2835_VCHIQ or BCM_VIDEOCORE).
> >> > Perhaps try that?
> >> >
> >> >>
> >> >> I'm a bit surprised as I didn't observe such a thing.
> >> >> But I also don't dispute it - clearly my testing was inadequate.
> >> >>
> >> >> I'll try and dig a bit deeper into this one.
> >> >> Perhaps starting with the report from the kernel test robot [3]
> >>
> >> I have this in my randconfig build tree, but it looks like I never
> >> sent it out.
> >
> > What else have you got hidden up in there? ;)
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> Actually, I have fixes for all missing-prototype warnings
> in my tree, just remembered that this one is part of my
> longer series. I have about 150 patches that are already split
> up and just need to be sent out, plus more that are currently
> sitting in a combined changeset.

All? Wanna bet we can introduce new instances of that warning faster
than you can fix all of them? Actually, no I would not take that bet.

I'm just having fun, thanks for all of that cleanup work!
--=20
Thanks,
~Nick Desaulniers
