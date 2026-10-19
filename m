Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15664F3939
	for <linux-staging@lists.linux.dev>; Mon, 19 Oct 2026 12:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412799; cv=pass; b=Cjqtp/5EzGg4HJ7GdeRFZdmTrjc4HvWYIxekxFCfEf+ZgePTKDceU+CwTj+fC0MiwbajwVmAWZRxE8fKTUnTqjhBCuTBr3BFdCeWh1M3A+dRtoGu69PLacduwYec9r/Fds70HM/K6PLUvZybFUhhEES7PWslr2aV6oTucBfk5+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412799; c=relaxed/simple;
	bh=Qyaw4WaZyQRRV/Cc2XdlJP27n/ju5hKMwRZCMx1IgrY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eLV6tnJ6EuSTJHqY1A1iC39DoRQ5qJIs8xHQXOBQBPW+4I/3LNTAyCW2vQmJaGeTpkUT694/+PO+up/hhGICoCBvErJMmy3JYcaBfu9ortictmwiOs8XQuI6WM3UYY68AZUNU9hDdvIPVk/5gqnMSNls6qEtyqhN8AQ1UVzcp9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu; spf=pass smtp.mailfrom=wetterwald.eu; dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.b=FrGT12T1; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wetterwald.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wetterwald.eu header.i=@wetterwald.eu header.b="FrGT12T1"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be4fea434bso648613e87.1
        for <linux-staging@lists.linux.dev>; Mon, 19 Oct 2026 05:26:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792412787; cv=none;
        d=google.com; s=arc-20260327;
        b=gJq06z/AbaUSNk3KhrJ+JBmMEZ+JL9MnUFPTBMV3Srddwbc6UUHgcIz2/tLTBZAAPM
         Hkyz6LHUannZQLS8XLW54sF/eeyTaIG72qqyDA38qE6nHkKzFvj8TmN6F+sXOq1Qq89a
         ZT2YoidSNZTh6vkIggnGP2aQ80FRA7l064e3ZvGqa6OHs2NOny8cCaIHQr2yJboGQZ0E
         nLqkloG+iKbypQ91J2ARNIwHLHXsn08fW1Rn/diTi8PIKmet3deNkucm8B3pcoWlI7hD
         bTpBGwP703T2PGkr9EAgKL73b1ioMfs+ukKjpbtE1krWyG9zaeCS0og1L+Jo/SMxNvA8
         +gqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PNE/h2ESkoSNRC++cgLzYuUYgKGhlzmmCNhasBPr9xM=;
        fh=nbK6MedH+AOhOSpOvsD03DDQx443CspdmBjBM3dizXQ=;
        b=naHKTEnYHHjti/JazoQWkyHc2OZQfx/FgEea37Y4FxurbNbgF251w1PJBEMyCNyQyd
         qO6ybFIN40P+Yi53ZdGCsnGddNte7d0PHlKSCAgYoRkn7RmcqKqSRmBQjlyqdoXXzso1
         +W80hfiWI497duQg3umn9Hvb5aLKS4WGhhc99zEmvX0BhoWO4Z0dutd6hiARO3qRZIgA
         VunPYcDXI9piJEvX1Z1Nesnn0kVYEZjJytuRoPAVclyw+E7fZM/03mWptE9lW3xIdOFe
         IRJSFT1nQ+NwW/sV9OlDPCD3Br1a9EH+bE5mvpFEYJqmAKJdEH2W0zan5TV2LQqmSagb
         hCag==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1792412787; x=1793017587; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PNE/h2ESkoSNRC++cgLzYuUYgKGhlzmmCNhasBPr9xM=;
        b=FrGT12T19mdCCRmYxVODJeY9UKMrMVajQCyFrmXRqJUbzQlmVs6grvxeDOXNQH6tdv
         0dNo077yNdASEUZ4tHVQ2vmEHLSfgiP+yvjxiCtEX7V/zesghpJlF7exXlXeZBInQ/sM
         X6X5pbKPAYanpL/3xEpEroxLvWQWe2rBamkxU/IRB13ldk2FnHpanI+OkiJfXTTh8iz3
         ibZ2BYsrkkU45oD2Kx7E277EqMWdMEPZoeA53HmzTcCskRohjvsrjEaVWeCnZbRn5Ik0
         WgiISo61cGMgANN7GOcuuGAqYH93sYf+FQ0fm5V1Df/5AkD9XZpql34yCU6+aY5UqcGx
         Qkow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792412787; x=1793017587;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PNE/h2ESkoSNRC++cgLzYuUYgKGhlzmmCNhasBPr9xM=;
        b=Lu+KnlpiVQTTzSYJWRlygqx0JE0YLit0iBiuZpuIYfMbZgmNNOGlE77DtnkfrxfuC7
         en2kLBkyRUuD4W/zGMz6L16AiuiAgm5aW00G481paQfnizjKkFbuAqoEzgNKf4xdxyqv
         AAowRf+MU9LLQtv8lt56jU875X3xeknZkElMt3wnnvhw2K3V6TnmAi+6uE0JGtw76wsq
         VhXeLI+PQYE8/H21BnRIEXKqdEvhxZxdO1oV8tfmY27idxNJisZX+804lEHBTxoPRe4i
         u1f+/97tHI0TwkcIDSKArunkHcLpaJ6J9X1SXFTOqyOrWr3rRWYa0Lsfl67zRv3LDoue
         OGXA==
X-Forwarded-Encrypted: i=1; AKwUvBxsSst+CHlhGLfqJUhnkCK4xLiSj9bU8BvPqAxk+sM6HhVG7qZauRLnMojsN19In9gIooUWaOZuCAmDWVZ1@lists.linux.dev
X-Gm-Message-State: AFq9FYJHCHjjj3ju/MEQh1Cx+HH8uWwWYhzguEksqPw7frK7yyF5/r8q
	6ilo8SxDrHV3nykQoukZehlUFY+BZwPH3bNh770cpdrO+HXuu53yQDLdVCBPuJDGP2VbJn+Xkg0
	H8F2nkb0Xi9dEerxjK4SA4dwzK4jdzNWGsCR4+X8OrQ==
X-Gm-Gg: AYBFou1eqfj5/C3a5Vxri58w20MXmWFpKEj8UuDlJT1eP0w5Q2MsNOM4u1IUHhMjhGg
	jiI17Z47rk9hZP+gWBzAzOADbfVHhY5FNpyYL0e7vGSinj79tc+geKbQ7qZByN6c65NN7tsbGXs
	Q4vDbBWu1KgaYHtzpvH8cCkkDqsU81NpDwc0U5Jzmn/O/5iBqpQV5j2J2xd3HKtr92JV/RBKzjW
	iihB41lVpY9+RahY74fBRBYpWNeB0ozt1uJ+mZH1gKWwY8Z7HpjckNCbdUdLP7yjZY6OnUh12Tk
	X8R81wV7rBlyRmXEj0/Lh4lHQW4rpakSmFmpfA4JnAjrvLZWkxzq8bZaTclnXANWMf73BTsQoL1
	AHTmgTtC96A==
X-Received: by 2002:a05:6512:3d17:b0:5be:41a5:d9ed with SMTP id
 2adb3069b0e04-5be47936d9dmr3010694e87.37.1792412786489; Mon, 19 Oct 2026
 05:26:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
 <20261013131435.1454019-1-martin@wetterwald.eu> <DM5Q9NKRO89O.22R04QM8YBKWM@gmail.com>
 <CAFERDQ12QwtC6cCVWQGU1b5KCv988kAvahNKwosxG2z8Mzm4sw@mail.gmail.com> <DM8869QP3IID.1I1KT6A7M2UNB@gmail.com>
In-Reply-To: <DM8869QP3IID.1I1KT6A7M2UNB@gmail.com>
From: Martin Wetterwald <martin@wetterwald.eu>
Date: Mon, 19 Oct 2026 14:26:15 +0200
X-Gm-Features: AclHuK93P2jPD4PyUwT4dOLVOgxbBF4VVZAqE1H94JjIS4xMMkZCEQTzudX9ZIs
Message-ID: <CAFERDQ3DWBnkSok_SiVZGx+GTmYKP=Q46yFYkNt9YQkKxxQxyw@mail.gmail.com>
Subject: Re: [PATCH] platform/raspberrypi: vchiq: register bus at subsys_initcall
To: Gaston Gonzalez <gascoar@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stefan Wahren <wahrenst@gmx.net>, 
	Phil Elwell <phil@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Umang Jain <uajain@igalia.com>, Kees Cook <kees@kernel.org>, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 9:53=E2=80=AFPM Gaston Gonzalez <gascoar@gmail.com>=
 wrote:

> Running 'speaker-test -t wav -D plughw:1,0 -c 2' crash the system, so
> thinks seem not to be working with that interface.
>
> Im trying to debug what happens in that condition; I will need a couple
> of days I guess. So far, this is what I could check.
>
> Any feedback on the test or debugging would be appreciated.

Hi Gaston,
Thanks for digging into this.

The patch only changes when the VCHIQ bus and driver are registered during
boot. So it's enough to check these two cases to validate the patch:
- without my patch: dmesg shows the "unable to register with bus_type
  'vchiq-bus'" error, and bcm2835_hdmi is absent from /proc/asound/cards.
- with my patch: the error is gone and bcm2835_hdmi is present in
  /proc/asound/cards.

(Since the Pi Zero has no Headphones jack, you need to test both cases with
snd_bcm2835.enable_hdmi=3D1 in the command line. Otherwise the card never s=
hows
up, even when everything works.)

Could you check these two cases?


Testing that you can hear the sound going through bcm2835-audio is a full
functional test that goes even further than the patch: it does not only tes=
t
bus registration but also that the audio driver is working.

On my side, without vc4-drm, I can successfully hear sound through both bcm=
2835
Headphones and bcm2835 HDMI:

  # aplay -l
  **** List of PLAYBACK Hardware Devices ****
  card 0: HDMI [bcm2835 HDMI], device 0: bcm2835 HDMI [bcm2835 HDMI]
  [...]
  card 0: HDMI [bcm2835 HDMI], device 1: IEC958 [IEC958]
  [...]
  card 1: Headphones [bcm2835 Headphones], device 0: bcm2835
Headphones [bcm2835 Headphones]
  [...]

  # speaker-test -D plughw:0,0 # (HDMI)

  # speaker-test -D plughw:1,0 # (Headphones, not on the Pi Zero)


If you still want to output sound through bcm2835_hdmi (optional):

There can only be one owner of the HDMI port: either the firmware or the
kernel.
When the Raspberry Pi boots, the firmware first owns the HDMI and displays =
a
rainbow splash. Then it launches Linux.

There are 2 ways for the kernel to deal with the video output:

1) With vc4-drm (CONFIG_DRM_VC4), the kernel takes over the HDMI controller
   from the firmware and handles everything itself (this is your case).
2) With simple-framebuffer (CONFIG_DRM_SIMPLEDRM or CONFIG_FB_SIMPLE), the
   kernel leaves the HDMI to the firmware and just writes pixels to a
memory area
   (the framebuffer) set up by the firmware.

I get a similar problem on my side when sending sound through bcm2835_hdmi =
with
vc4-drm loaded: my screen shuts down (but the kernel is still alive).
It most likely comes from the firmware and the kernel both trying to drive =
the
same HDMI port: with vc4-drm, the kernel owns the HDMI controller, and the
firmware (which bcm2835-audio talks to through VCHIQ) is not supposed to to=
uch
it.

A simple way to output sound through bcm2835_hdmi is to not use the vc4-drm
driver at all, and use simple-framebuffer if you still want a display.

To remove vc4-drm:
- Do not compile the driver into the kernel (CONFIG_DRM_VC4=3Dn) or blackli=
st the
  module.
- Remove any vc4 overlay in config.txt file (e.g. remove dtoverlay=3Dvc4-km=
s-v3d).

To enable simple-framebuffer, use one of the two configs:

  CONFIG_DRM=3Dy
  CONFIG_DRM_SIMPLEDRM=3Dy
  CONFIG_DRM_FBDEV_EMULATION=3Dy
  CONFIG_FRAMEBUFFER_CONSOLE=3Dy

or, the older way:

  CONFIG_FB=3Dy
  CONFIG_FB_SIMPLE=3Dy
  CONFIG_FRAMEBUFFER_CONSOLE=3Dy

(FRAMEBUFFER_CONSOLE=3Dy, and DRM_FBDEV_EMULATION in the DRM case, are only
needed to see the boot messages on the screen, with console=3Dtty1 on the c=
ommand
line.)

If you have remote access to your Pi Zero (either through network+SSH or
through serial console), you actually don't even need the simple-framebuffe=
r:
you can just remove vc4-drm, and let the firmware display its rainbow splas=
h on
the HDMI port.
Then you can login to your Pi Zero through SSH for example and launch
speaker-test.
As long as the HDMI video output is active, it's enough for the sound to be
able to go through, even if the image was not drawn by Linux.

But again, this full functional test is optional.

Regards,
Martin
