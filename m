Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49745BA3C
	for <linux-staging@lists.linux.dev>; Thu, 12 Oct 2023 15:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-5a7af45084eso14232447b3.0
        for <linux-staging@lists.linux.dev>; Thu, 12 Oct 2023 08:12:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697123529; x=1697728329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=khfGRdh12F00jlibT3/fQRqCkfRRZuJbfBIrcarozTE=;
        b=EC9J6Ab/CW8FdK8wguJCprhffRIXRMrq4kHuM9NT2t8Wi8wI3FM+E0eQFyCx5awC1v
         gjee7UFflpJcam5vMDfbN1r2gTfmyWHN3BtkszJGuD2p0d6P07d3I4oJQDtXvDiU1qRy
         TMa7wj+veSrDrZc1aff1nzlRw8lDXCthZ6QbgmLeDCjx9oieL6R6IBzsPw2fzt5JQXL3
         u1WBeqi+OfWdy30W9RZGjQgCes14C6/Hb8NgfSnjx0LV0RNAAFRCnXfeTdFh8wXB++ta
         NP+Q0n3zFY/snJDBnOLL1VIDq8Eq0bcIpFNTftxhNVYxTNGaCeE3Ib4chOP++Tzp5IeN
         sfrQ==
X-Gm-Message-State: AOJu0YzRlSAKm8VqBYMzD2N1uFYTr5rzHw/EFmeXDqLtqLfGXZQgI81m
	o+Xc854lyG2uAiKswJEv9H0o09Umii7v1g==
X-Google-Smtp-Source: AGHT+IHc0MbEMBRurvFci9PDZYxYafIUDgsNG3lIQjptpbQIQuj2ITJT1xpoZocbsAWbIWygj7rzSQ==
X-Received: by 2002:a0d:d614:0:b0:5a7:dbf4:6a1e with SMTP id y20-20020a0dd614000000b005a7dbf46a1emr5912205ywd.33.1697123528852;
        Thu, 12 Oct 2023 08:12:08 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id k66-20020a0dc845000000b00570599de9a5sm18448ywd.88.2023.10.12.08.12.07
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 08:12:08 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5a7fb84f6ceso10503207b3.1
        for <linux-staging@lists.linux.dev>; Thu, 12 Oct 2023 08:12:07 -0700 (PDT)
X-Received: by 2002:a81:8246:0:b0:58d:f1fe:5954 with SMTP id
 s67-20020a818246000000b0058df1fe5954mr25609250ywf.32.1697123526926; Thu, 12
 Oct 2023 08:12:06 -0700 (PDT)
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
 <87fs2fgals.fsf@kernel.org>
In-Reply-To: <87fs2fgals.fsf@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Oct 2023 17:11:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU0P6H=pAGr_KtmecvNxwDLJXYPRbyyELXaCRhNHgzAzg@mail.gmail.com>
Message-ID: <CAMuHMdU0P6H=pAGr_KtmecvNxwDLJXYPRbyyELXaCRhNHgzAzg@mail.gmail.com>
Subject: Re: [PATCH] [RFC] wireless: move obsolete drivers to staging
To: Kalle Valo <kvalo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Jakub Kicinski <kuba@kernel.org>, 
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

CC geoff, ppc

On Thu, Oct 12, 2023 at 4:46=E2=80=AFPM Kalle Valo <kvalo@kernel.org> wrote=
:
> "Arnd Bergmann" <arnd@arndb.de> writes:
>
> > On Thu, Oct 12, 2023, at 13:47, Kalle Valo wrote:
> >>
> >> Is anyone willing to submit patches? Use wireless-next as the baseline
> >> for patches and one driver per commit, please. That way it's easy to
> >> revert later, if needed (hopefully not).
> >
> > I can do it, I've already done most of the work for moving the
> > drivers, so I just need to split up my existing patch and leave out
> > the bits that get added to drivers/staging.
>
> Awesome, thank you!
>
> > I'll also send Greg a patch to remove rtl8192u now that we know
> > that this has been broken for 7 years. Similarly, I'd include
> > another patch to remove PCMCIA support for libertas, as that
> > would otherwise be the only remaining 16-bit PCMCIA wlan card,
> > and I could find no indication of this one ever being popular,
> > unlike the USB/SDIO/SPI variants of the same device or the
> > other PCMCIA drivers.
> >
> > This would leave only a handful of wext implementations in the
> > tree: ipw2x00, ps3-gelic-wireless, staging/rtl8712, staging/rtl8192e
> > and staging/ks7010. Since ipw2x00 is apparently still supported
> > in theory and was rather popular on Pentium-M based systems 20
> > years ago, this may still need to be converted to cfg80211
> > before you can remove support for wext style drivers altogether.
> > ps3-gelic-wireless and rtl8712 are also still maintained but have
> > a much smaller user base I assume.
>
> Actually I would prefer to remove ipw2x00 and ps3-gelic-wireless as
> well. I have not seen any evidence that there would be users for those
> drivers. If we find out that there really are users I can easily add the
> drivers back. The faster we get rid of wext the better, it really needs
> to go away.
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpa=
tches
