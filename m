Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792523824;
	b=ieTwQanSyJAcP41VOTuXbgMutrPAZMGa0R8FJOYwMlngLlKSvnB1JGuusPU5i9MtJZ2u
	 YYN+DYayAllprzAsivHZvK23aNDG/XDGuJgJySEt7kSVjxNaMaLpiD5zYcXG3F3aJBNz/
	 DUPzHCA3EJb7eHoAKwDC0U1j0JEOa5SGIqGSjylr1ZBNRQ/rkHlk5yulywbGsPqDA2COu
	 0mDgugH8N/vgnFTkdHuMolfXEss+FCrw3J5KgdKDjoAYwdbjJR2qiWcDF831WJdDLT2z7
	 f7D7HWbC0zDeWPSgPtlwIBdG9bbwm+DtNGKS5lGWG14xHKioThq4j2vCtPIDdreJIkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792523824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=SWQgkR3Fjde1WyXhbg8hl8+vmi9aICLhiAaiA94/m88=;
	b=bRa4xyY3mamw/uZGOpl7Ni14Lg0Fu3/JQVo0xqfu6RDP8cBZRmvB2S3vfDvSiSSlbkoZ
	 z3eif6O8rI6ktQl11WhZITK8Em1W5gaStt0FbflVEm3u+23a+eOyTSpXZGeaXxDgPdYVw
	 ImrYzSMP9MI8BaNCz4bjuFN4tFQUhOWy9fa+9kQVXiJZFSiG7s8+U7RptZUxMfVhESqAK
	 jswIHLwVomYjaxoYacd4DKBUWvOUh9/TSrR7pm0F1fBfgjoF/GqBkmOvVs/we4azld5Ze
	 iCFyNMYI/N6Z3gzat7RJipas0lBM3eRi4nxzWl889fzZHIZH3XD+pDZCbWyPv8wdb+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="D/sVlb84";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034C5606A31F
	for <linux-staging@lists.linux.dev>; Tue, 20 Oct 2026 19:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 034C5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D/sVlb84
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35159e0092aso441401eec.2
        for <linux-staging@lists.linux.dev>; Tue, 20 Oct 2026 12:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792523823; x=1793128623; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SWQgkR3Fjde1WyXhbg8hl8+vmi9aICLhiAaiA94/m88=;
        b=D/sVlb84QjWhhyq5gXPb3X9Ha6CPoa1ZjZoAyGhGYqi93VxSNFCtj5HvIpEVHBzWvB
         dYs1gkLJjhedanHqu6rIw5/CgjoDWp/VBUhvjzXlM/axsUi6vMSRza30X9kAyr4LNipT
         ObxHEwovWHtTlIP0bw453ul9xv038wsLMEuMoES7My2HTUEP8Nal4pM7OmF5WPP2sHJs
         JRF3kUDiVq4XCN7SlJfEjhHDJKeKsVSET8wzYe9X63biEma20apBWRZynMsa+qSe4s3B
         YXSzWev0q9I3XOsjgXQKV3S8fWyvH73i6fW9YE9IObD215nBUc6cB18kNvUUxjApY6UB
         xZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792523823; x=1793128623;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SWQgkR3Fjde1WyXhbg8hl8+vmi9aICLhiAaiA94/m88=;
        b=onQtQIxNpIKJw9TlmGENYKLku/RTRh8S+UM0c/7JZsNt98XbUP+0AAV68CpRNlXbOu
         58UtScFNPSha+M0mGm98GMxthrMD87lLbEryZP94y7VD9w5EjWOV2eQ0vjAQdaKHwN7N
         9MUfLd4kv3HZu2qy+/QgeOkWOrdV2gsoBS6nwm4tKPf7Jl54G6RtmH0g75E3qSqqdpdC
         RW0yEQPjMb+kpsz4X3ZuSCvz07MkalkzbgYwCLdKSoAV+wCKRi9h3CtdWkXLBSY6tXaD
         JoasmmpmP+1tCs27alouf75bPDsrr4lnTDpxVEjU5ASgFVknSMtBshJmzibKasnK5lCd
         nCiQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9mvfhV1StvQjPd+YKycrZi9JPWQVcf7ptxMGju2+92HKl6HyOtPRgYi80A4PpyJwfj39HVNFyZ1/mHCpt@lists.linux.dev
X-Gm-Message-State: AFq9FYJX7z7lwznv93uRTdWX/2xQjSGyw4bww4zDxcfl47bLCpwAOuqc
	gwnmlRJJPw6ntEt9GZ5vjoRuaILWeV86XWYB57cpN7yYkWMjca2WwC2H
X-Gm-Gg: AYBFou2BYZOnjRvQbTy/j1CK/BoDt3j0oWnn2cMgjizegJfcesHUJPph/Q2UXyVf2cz
	mqPdts93XdkIiA4KSEAdH8y6hLCWvRl2wr6lFaFKkI0F2Mu3OVBFQiYz8hWa6UqU+h+NWxTQLxi
	Qnjo/GqTeoSgeivr06dzhuf6tMt+0b/esTs5D0ZW7oMGr1SFkK/t6+PUbwSURsAcZC7ajDo5x8Q
	rTRdwDML01R1mKmNUFfnuj4A+FxQLhYhjWe89gOheK0EEaDvzA05ptkG1AtLtNLLEeH22A3OC+3
	F9VmtHX5DXLM5tELzbYX4yuEudsKxZRQeYDwHClDd3H8AX7jaH9of2DHxnI2/QF3d4xcsnKIuUT
	x0uPqgShLt9rh6mXiVpTeLB2O+6ldGaKEZVjXF/obdfxLRsaWaezMlO0GtZLzEhmsr/LDyjWSTL
	MYzUqGsbyIc2q6ocIPDKYpbdOKyTxERPlXOpOhYjHmNqH74Sym3hg2lKINsK8DvrIR8A==
X-Received: by 2002:a05:701b:280f:b0:17f:641e:7f6b with SMTP id a92af1059eb24-1850fa07d82mr20915641c88.1.1792523822861;
        Tue, 20 Oct 2026 12:17:02 -0700 (PDT)
Received: from localhost ([200.10.125.114])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035926035sm587423c88.1.2026.10.20.12.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 12:17:02 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 16:16:58 -0300
Message-Id: <DM9WNTXQM9N8.2G10WSI71TL88@gmail.com>
Cc: "Florian Fainelli" <florian.fainelli@broadcom.com>, "Broadcom internal
 kernel review list" <bcm-kernel-feedback-list@broadcom.com>, "Jai Luthra"
 <jai.luthra@ideasonboard.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Stefan Wahren" <wahrenst@gmx.net>, "Phil
 Elwell" <phil@raspberrypi.com>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Umang Jain" <uajain@igalia.com>,
 "Kees Cook" <kees@kernel.org>, <linux-rpi-kernel@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <regressions@lists.linux.dev>
Subject: Re: [PATCH] platform/raspberrypi: vchiq: register bus at
 subsys_initcall
From: "Gaston Gonzalez" <gascoar@gmail.com>
To: "Martin Wetterwald" <martin@wetterwald.eu>
X-Mailer: aerc 0.20.0
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com> <20261013131435.1454019-1-martin@wetterwald.eu> <DM5Q9NKRO89O.22R04QM8YBKWM@gmail.com> <CAFERDQ12QwtC6cCVWQGU1b5KCv988kAvahNKwosxG2z8Mzm4sw@mail.gmail.com> <DM8869QP3IID.1I1KT6A7M2UNB@gmail.com> <CAFERDQ3DWBnkSok_SiVZGx+GTmYKP=Q46yFYkNt9YQkKxxQxyw@mail.gmail.com>
In-Reply-To: <CAFERDQ3DWBnkSok_SiVZGx+GTmYKP=Q46yFYkNt9YQkKxxQxyw@mail.gmail.com>

On Mon Oct 19, 2026 at 9:26 AM -03, Martin Wetterwald wrote:
> On Sun, Oct 18, 2026 at 9:53=E2=80=AFPM Gaston Gonzalez <gascoar@gmail.co=
m> wrote:
>
>> Running 'speaker-test -t wav -D plughw:1,0 -c 2' crash the system, so
>> thinks seem not to be working with that interface.
>>
>> Im trying to debug what happens in that condition; I will need a couple
>> of days I guess. So far, this is what I could check.
>>
>> Any feedback on the test or debugging would be appreciated.
>
> Hi Gaston,
> Thanks for digging into this.
>

Hi Martin,


> The patch only changes when the VCHIQ bus and driver are registered durin=
g
> boot. So it's enough to check these two cases to validate the patch:
> - without my patch: dmesg shows the "unable to register with bus_type
>   'vchiq-bus'" error, and bcm2835_hdmi is absent from /proc/asound/cards.
> - with my patch: the error is gone and bcm2835_hdmi is present in
>   /proc/asound/cards.
>

Understood. Of the two cases, the second one is already tested if I'm not
mistaken. I will check the 'without your patch' case first, and then
I'll rerun the test with your patch.

> (Since the Pi Zero has no Headphones jack, you need to test both cases wi=
th
> snd_bcm2835.enable_hdmi=3D1 in the command line. Otherwise the card never=
 shows
> up, even when everything works.)
>
> Could you check these two cases?
>

Yes, will do.

>
> Testing that you can hear the sound going through bcm2835-audio is a full
> functional test that goes even further than the patch: it does not only t=
est
> bus registration but also that the audio driver is working.
>
> On my side, without vc4-drm, I can successfully hear sound through both b=
cm2835
> Headphones and bcm2835 HDMI:
>
>   # aplay -l
>   **** List of PLAYBACK Hardware Devices ****
>   card 0: HDMI [bcm2835 HDMI], device 0: bcm2835 HDMI [bcm2835 HDMI]
>   [...]
>   card 0: HDMI [bcm2835 HDMI], device 1: IEC958 [IEC958]
>   [...]
>   card 1: Headphones [bcm2835 Headphones], device 0: bcm2835
> Headphones [bcm2835 Headphones]
>   [...]
>
>   # speaker-test -D plughw:0,0 # (HDMI)
>
>   # speaker-test -D plughw:1,0 # (Headphones, not on the Pi Zero)
>
>
> If you still want to output sound through bcm2835_hdmi (optional):
>
> There can only be one owner of the HDMI port: either the firmware or the
> kernel.
> When the Raspberry Pi boots, the firmware first owns the HDMI and display=
s a
> rainbow splash. Then it launches Linux.
>
> There are 2 ways for the kernel to deal with the video output:
>
> 1) With vc4-drm (CONFIG_DRM_VC4), the kernel takes over the HDMI controll=
er
>    from the firmware and handles everything itself (this is your case).
> 2) With simple-framebuffer (CONFIG_DRM_SIMPLEDRM or CONFIG_FB_SIMPLE), th=
e
>    kernel leaves the HDMI to the firmware and just writes pixels to a
> memory area
>    (the framebuffer) set up by the firmware.
>
> I get a similar problem on my side when sending sound through bcm2835_hdm=
i with
> vc4-drm loaded: my screen shuts down (but the kernel is still alive).
> It most likely comes from the firmware and the kernel both trying to driv=
e the
> same HDMI port: with vc4-drm, the kernel owns the HDMI controller, and th=
e
> firmware (which bcm2835-audio talks to through VCHIQ) is not supposed to =
touch
> it.
>

Ah ok, I did not know that. Thank you for the explanation.

> A simple way to output sound through bcm2835_hdmi is to not use the vc4-d=
rm
> driver at all, and use simple-framebuffer if you still want a display.
>
> To remove vc4-drm:
> - Do not compile the driver into the kernel (CONFIG_DRM_VC4=3Dn) or black=
list the
>   module.
> - Remove any vc4 overlay in config.txt file (e.g. remove dtoverlay=3Dvc4-=
kms-v3d).
>
> To enable simple-framebuffer, use one of the two configs:
>
>   CONFIG_DRM=3Dy
>   CONFIG_DRM_SIMPLEDRM=3Dy
>   CONFIG_DRM_FBDEV_EMULATION=3Dy
>   CONFIG_FRAMEBUFFER_CONSOLE=3Dy
>
> or, the older way:
>
>   CONFIG_FB=3Dy
>   CONFIG_FB_SIMPLE=3Dy
>   CONFIG_FRAMEBUFFER_CONSOLE=3Dy
>
> (FRAMEBUFFER_CONSOLE=3Dy, and DRM_FBDEV_EMULATION in the DRM case, are on=
ly
> needed to see the boot messages on the screen, with console=3Dtty1 on the=
 command
> line.)
>
> If you have remote access to your Pi Zero (either through network+SSH or
> through serial console), you actually don't even need the simple-framebuf=
fer:
> you can just remove vc4-drm, and let the firmware display its rainbow spl=
ash on
> the HDMI port.
> Then you can login to your Pi Zero through SSH for example and launch
> speaker-test.
> As long as the HDMI video output is active, it's enough for the sound to =
be
> able to go through, even if the image was not drawn by Linux.
>
> But again, this full functional test is optional.
>

Ok, I=E2=80=99ll test the patch first with the current configuration, then
with simple-framebuffer enabled in a second step.

Regards,

Gaston

> Regards,
> Martin

