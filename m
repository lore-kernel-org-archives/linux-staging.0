Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43388249F0
	for <linux-staging@lists.linux.dev>; Thu, 12 Oct 2023 15:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-59e88a28b98so9213887b3.1
        for <linux-staging@lists.linux.dev>; Thu, 12 Oct 2023 08:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697125183; x=1697729983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T4kyj9ZjW+gYqmJqenBaJFDkWv6wTV1m+k4AYZcQP5U=;
        b=UOj/UdtBvkvrEG9SDBDb+pUUlhv1ajgxWhI7PfS25RxacknKC/vmOvsUpVOnwmn7H3
         c0l9Jl6aA93qlaKP+bSHiMiufNurs9IapDwZuerKm+fJlemHcm02NJdSSCb/gKXW3Qyq
         0RJFIsMV0matheTj6baa7lsqyh+4TMkqoTiu6U53N79ny7xI/P8QOJwAcIDfj8vdU/hH
         lQ7RCLRn2ib15MJgkS02M6II2jwRQG8be3kTtN1J3IkRz5ZSvmAFZVqWUnlUlZ/uSR9Q
         nX089ZgHrIwbpY5D1ot5pkhhAcC7iov82lNX9AYj0jHjRqyezGlBzhoZEgUtfiHJxiIB
         NIAw==
X-Gm-Message-State: AOJu0YxoY72ltQzdrvhdH0GQml/UMPCWone0loIGfReh6O3vF1OOSeSL
	9zcX203Hc3+mzmltjKCx/SlAhgylWL7WhA==
X-Google-Smtp-Source: AGHT+IG82HVR9H6o7dFdGtvwSGvKSbxxA30wJrlQ/RoOxfhJ4qJo50qT2PO7tgm6W5i7+c1JtwBn1g==
X-Received: by 2002:a81:6c0d:0:b0:5a7:dad3:cd21 with SMTP id h13-20020a816c0d000000b005a7dad3cd21mr4012970ywc.10.1697125183164;
        Thu, 12 Oct 2023 08:39:43 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id w83-20020a0dd456000000b005a1cc37aff1sm39129ywd.20.2023.10.12.08.39.40
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 08:39:41 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-5a4c073cc06so19269997b3.1
        for <linux-staging@lists.linux.dev>; Thu, 12 Oct 2023 08:39:40 -0700 (PDT)
X-Received: by 2002:a81:49d7:0:b0:59b:5255:4882 with SMTP id
 w206-20020a8149d7000000b0059b52554882mr12310427ywa.20.1697125180367; Thu, 12
 Oct 2023 08:39:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231010155444.858483-1-arnd@kernel.org> <2023101051-unmasked-cleaver-79b3@gregkh>
 <87y1g94szz.fsf@kernel.org> <2023101139-pyromania-game-2237@gregkh>
 <87r0m1fwg9.fsf@kernel.org> <20231011080955.1beeb010@kernel.org>
 <87sf6g2hc8.fsf@kernel.org> <63e57ef8-c9f2-489a-8df8-51dcffd437c6@app.fastmail.com>
 <b1c87f71abef5aba6b39893a417466bf9f65c2d5.camel@sipsolutions.net>
In-Reply-To: <b1c87f71abef5aba6b39893a417466bf9f65c2d5.camel@sipsolutions.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Oct 2023 17:39:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX3F9rvD3Fzbc1dwm7Vm73VW1x5ETbxkk-jJm3Bpr5i+A@mail.gmail.com>
Message-ID: <CAMuHMdX3F9rvD3Fzbc1dwm7Vm73VW1x5ETbxkk-jJm3Bpr5i+A@mail.gmail.com>
Subject: Re: [PATCH] [RFC] wireless: move obsolete drivers to staging
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Kalle Valo <kvalo@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Pavel Machek <pavel@ucw.cz>, "David S . Miller" <davem@davemloft.net>, 
	Larry Finger <Larry.Finger@lwfinger.net>, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, Geoff Levand <geoff@infradead.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Johannes,

On Thu, Oct 12, 2023 at 5:28=E2=80=AFPM Johannes Berg <johannes@sipsolution=
s.net> wrote:
> On Thu, 2023-10-12 at 16:36 +0200, Arnd Bergmann wrote:
> >
> > ps3-gelic-wireless
>
> Didn't Sony disable Linux on PS3 eventually? Though maybe someone still
> has some devices with old software.

If you didn't update the firmware, you could keep on using Linux.

And people may have found a vulnerability in more recent firmware
versions that allows them to run custom software.
I don't know, it's been +10 years ago I touched a PS3 ;-)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
