Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D761578
	for <linux-staging@lists.linux.dev>; Tue, 15 Feb 2022 15:16:20 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id g21so10288490vsp.6
        for <linux-staging@lists.linux.dev>; Tue, 15 Feb 2022 07:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6DuUgUuAADkU4oXGi/tM6KGgsSOIKVeZ/XvEc/blwmQ=;
        b=ABmY/wT2dB+V/EWZ66S78zXChm+Ma/ce4qHqqPamMQp/v2UxLCOKA8k3BAwUdYVt48
         KaSp6A2KhqpUg/FXz+drxhKPaJBlIZr9wXcrYW0XU2N14lbrpeZ3D9qLqLBgu/Elr20T
         xcdh5Ohp4Z9H6K3oV3PgFp5bniINwmfQ1mU3x/VSud6F1TlJkrohrelN8Z8SmsCE3PTV
         EpBtGhrALUIkTKLeMuUYRJ7AxSNXEtptozgdfwJ0vqcSz7zov4AopcOIDi9GuXbFExEF
         RI9M6VdKWMZeNyQdbDN3ZqGIqfFtMko9SanPnNW16xw/AahW75YB5vTlEqb5GUi1mrtS
         jWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6DuUgUuAADkU4oXGi/tM6KGgsSOIKVeZ/XvEc/blwmQ=;
        b=uOfi7TAYnlN8kJTECLwbWr21a4Z7WNIc2/H+YZH15nETqnQdsFuAJuAOvOXdIpIZq7
         qPkZIcTD+FhEsZ/22/+v5P7BARnYDse/LeBP57p+IlSHckRDMZ0A3CFjzZgite1U7eeF
         ZrvDV+bcwUxUQZy2MCRfytN99wq45wHUD5RtdziGnH9ABXI1bqRbJdLNg70FavGL91zl
         sCFqmaA+5+KRWsmnIwIbOT/Jz4wVLrF0bQjYAfSTESak7Elu3J8oTUg91JPIVPUezxLG
         i0K8elwa47J1fUPlNgjEG4ncJsO2MtcwUehOelCudj/49l2/Wzz5YorEYBgo8gGUw8dk
         zJ3Q==
X-Gm-Message-State: AOAM533ongSdFZsTmp9yjItyd5LI/G9fHeqfNNR8Iq/Ek3uexeL+pmfK
	X5Sf3phtMnSWcjPE4bi7FjrjaQHMMRxDahp4AP4=
X-Google-Smtp-Source: ABdhPJxxEaiQ59xMWPvSztC9eVnWPZKVi7wrhVoINAGQO4JEmV4TxL8kYLNF19QUwUHnRklen0f48xMjV1I2NBRd1mU=
X-Received: by 2002:a67:f890:: with SMTP id h16mr1688720vso.43.1644938179199;
 Tue, 15 Feb 2022 07:16:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220215081725.3463-1-arinc.unal@arinc9.com> <20220215081725.3463-2-arinc.unal@arinc9.com>
 <CAMhs-H-74bK3m975Dtmg2zPrGjmqzSd+Tb_qdUV14yJBAWRQbw@mail.gmail.com>
 <d9240058-68b4-cbd6-54b0-18f41ee5a98a@arinc9.com> <CAMhs-H_MvXOOmUDq97YyW7uaSfeNWcKE7F+J4182=MwH7yaOaw@mail.gmail.com>
 <6902e0b3-5bd3-185b-26f8-eab2e37f29cb@arinc9.com>
In-Reply-To: <6902e0b3-5bd3-185b-26f8-eab2e37f29cb@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 15 Feb 2022 16:16:07 +0100
Message-ID: <CAMhs-H-bMgsssuy-Rrygr0PCVkgDWDi=-=3vDVG_cnMX4L9vOA@mail.gmail.com>
Subject: Re: [PATCH 2/2] staging: mt7621-dts: do not use rgmii2_pins for
 ethernet on GB-PC1
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Sander Vanheule <sander@svanheule.net>, 
	NeilBrown <neil@brown.name>, DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	erkin.bozoglu@xeront.com, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arinc,

On Tue, Feb 15, 2022 at 3:11 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc=
9.com> wrote:
>
> On 15/02/2022 12:09, Sergio Paracuellos wrote:
> > Hi Arinc,
> >
> > On Tue, Feb 15, 2022 at 9:50 AM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@a=
rinc9.com> wrote:
> >>
> >> Hey Sergio,
> >>
> >> On 15/02/2022 11:35, Sergio Paracuellos wrote:
> >>> Hi Arinc,
> >>>
> >>> On Tue, Feb 15, 2022 at 9:18 AM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal=
@arinc9.com> wrote:
> >>>>
> >>>> GB-PC1 uses some of the rgmii2 pins (22 - 33) as GPIO. Therefore, th=
e
> >>>> rgmii2 bus cannot be used on this device.
> >>>> Overwrite pinctrl-0 property under the ethernet node without rgmii2_=
pins on
> >>>> the GB-PC1 devicetree.
> >>>>
> >>>> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> >>>> ---
> >>>>    drivers/staging/mt7621-dts/gbpc1.dts | 4 ++++
> >>>>    1 file changed, 4 insertions(+)
> >>>
> >>> No issues in GB-PC1. So:
> >>>
> >>> Tested-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> >>
> >> Thanks for testing it so quickly!
> >>
> >> I was wondering if you got pinctrl errors on the bootlog before applyi=
ng
> >> this patch series.
> >>
> >> rgmii2 pin group is given gpio function so calling it from ethernet no=
de
> >> would cause this on my TP-Link RE650 v1 which also uses the rgmii2_pin=
s
> >> as GPIO.
> >>
> >> [    1.177349] rt2880-pinmux pinctrl: pin io22 already requested by
> >> pinctrl; cannot claim for 1e100000.ethernet
> >> [    1.196966] rt2880-pinmux pinctrl: pin-22 (1e100000.ethernet) statu=
s -22
> >> [    1.210312] rt2880-pinmux pinctrl: could not request pin 22 (io22)
> >> from group rgmii2  on device rt2880-pinmux
> >> [    1.230058] mtk_soc_eth 1e100000.ethernet: Error applying setting,
> >> reverse things back
> >> [    1.245853] mtk_soc_eth: probe of 1e100000.ethernet failed with err=
or -22
> >
> > No, I was not getting any kind of error since when I test your last
> > patch series I was not experimenting any kind of regression. I don't
> > have any issues now also with your new patch series. Your new changes
> > make sense since as you have said "rgmii2" pins are requested as GPIO
> > but it seems are not really being requested? I don't have time to
> > check the datasheet now but will try to get time to see what is
> > happening there.
>
> I think this must have something to do with pinctrl on newer kernels as
> the TP-Link RE650 that I tested uses the OpenWrt master branch (Linux 5.1=
0).

I think is this commit which I did according to a review after moving
the driver from staging into 'drivers/pincrtl/ralink':

https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/commit/d=
rivers/pinctrl/ralink?h=3Dstaging-next&id=3D8a55d64c3336fc2ffd488a37d08ceab=
154c7b56b

You can also check other changes from where the driver was moved:

https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/log/driv=
ers/pinctrl/ralink?h=3Dstaging-next

>
> I hacked together something to run 5.17-rc1 for RE650 on OpenWrt. Here's
> what I found:
>
> When I still have rgmii2_pins on the ethernet node, I don't get any of
> the warnings above but this happens:
>
> - failsafe button lights_toggle was pressed -
> - failsafe -
>
> When I apply this patch and test again I don't get into failsafe anymore.
>
> The key for LIGHTS_TOGGLE is on GPIO 30 which is one of the rgmii2 pins.
> https://github.com/openwrt/openwrt/blob/master/target/linux/ramips/dts/mt=
7621_tplink_rexx0-v1.dtsi#L34
>
> What I make of this is, with newer kernels, pinctrl doesn't care and
> just claims the pin group for ethernet anyway. This would explain why
> the lights_toggle key GPIO goes from active low to high. So this patch
> is still a necessity.

Agreed, applying this patch is the correct thing to do.

Best regards,
    Sergio Paracuellos
>
> Ar=C4=B1n=C3=A7
