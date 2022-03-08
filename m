Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B42B323F
	for <linux-staging@lists.linux.dev>; Tue,  8 Mar 2022 12:52:18 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id q194so942533qke.5
        for <linux-staging@lists.linux.dev>; Tue, 08 Mar 2022 04:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EVSVhjQw3/L13daqdZbEzIGn0ntH9Fvi8wjCFmBvZHY=;
        b=co7uN1SKrGJyy8GdcV5kG6bc8hmppD6Q+FJRU+U5MBDepGPijaqdK32o1QnZSHoHc8
         pfZQfIUb1tRPykwAU0IsPYvxBTqfitOBR/vaAK6BjkDsYAG5+w11kycmDcn9pbHSRT8i
         rLc6l7/j+dL34wleb57nxzP05fsrcDJ0rLPt3bfr5WOP2xA6gaYJ4gf7y1+vGgdnr0hr
         TfpxBeCeGUC0WyKPyyr6MicWtXxrmUgWWWh+225RoyRqKuv+SvIOb99Drd81DFN7ISzO
         zSKiojCgMigZWxPYTBQtGlVfd2OwE1i0sEULEKj14kAkeZ1E8q2QYiDAWnMB25y8WghM
         I+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EVSVhjQw3/L13daqdZbEzIGn0ntH9Fvi8wjCFmBvZHY=;
        b=3NanSG6ZOoIYOz4BdhGg6XdZnbwpywK/GNKP/sH6h5EPHrz3VsmxnYb/2DUT33IjLv
         tCIpItH0IEbrLrJcAJVg4n/ASOgK/FXbsnzGJV/D42qz5M6Ji5r2W9gsV4/S/aLm1WLb
         B0t0OaKX47mrFr5yyZMRN0y8BdzFZmFYnCDx10W5BkeLrODuTHWNXkaSTVjZ3TFgrLZz
         DsCE+HYmdh/3xDiQVfp+ulg2yRWiD+Hj7yITF99dimFljok5ryuI7Izstsqj/zml/qYg
         CybcxfrDMnED0/32nkY/RzARmxYEkRGe8aV9VNLNolQIR7npw71ZhrnKDuY96rpR5jnW
         /o/g==
X-Gm-Message-State: AOAM530u9wScduwPUrt8yeloVK1VYQUDu2/9VdIk+BdWL06L6YQ2ZvQD
	kjtL+t+1ZsPRSK00FOqoZx2y+cAmfgIkhPKe1MA=
X-Google-Smtp-Source: ABdhPJyJ5XKNB4Fnv7OXEwbwIP4EpglsnI/GRR8IJM5nF1wN8qTOQDuULBEEmBY7e4B6mLmlBK1O76/0+FVWLHKIEps=
X-Received: by 2002:a05:620a:2588:b0:67a:f44c:b9ac with SMTP id
 x8-20020a05620a258800b0067af44cb9acmr9098884qko.554.1646743937248; Tue, 08
 Mar 2022 04:52:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220215081725.3463-1-arinc.unal@arinc9.com> <20220215081725.3463-2-arinc.unal@arinc9.com>
 <CAMhs-H-74bK3m975Dtmg2zPrGjmqzSd+Tb_qdUV14yJBAWRQbw@mail.gmail.com>
 <d9240058-68b4-cbd6-54b0-18f41ee5a98a@arinc9.com> <CAMhs-H_MvXOOmUDq97YyW7uaSfeNWcKE7F+J4182=MwH7yaOaw@mail.gmail.com>
 <6902e0b3-5bd3-185b-26f8-eab2e37f29cb@arinc9.com> <CAMhs-H-bMgsssuy-Rrygr0PCVkgDWDi=-=3vDVG_cnMX4L9vOA@mail.gmail.com>
 <bffc9641-ec69-f88e-b877-65d12305b928@arinc9.com> <CAMhs-H-dHY_+gTOmGXYFyVLK69D7y0bw5s2=e6gDh5yFtp6HzQ@mail.gmail.com>
 <e26eae35-8207-b8c7-7af0-0fb4bd7a69c9@arinc9.com> <CAMhs-H-JtkHzjUkNTdJ0OUsZqNYHYAi6gDp2SYc8yJbPpx9=zw@mail.gmail.com>
 <18f43289-516c-3b07-d8cf-f173491aa6bb@arinc9.com> <b0b5ce7b-4fed-ff4e-9329-33948942a16f@arinc9.com>
In-Reply-To: <b0b5ce7b-4fed-ff4e-9329-33948942a16f@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 8 Mar 2022 13:52:05 +0100
Message-ID: <CAMhs-H944qv9T3qFaLLRtvsUsS2tcykLQuyhz6hwtFhwDPSwXQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] staging: mt7621-dts: do not use rgmii2_pins for
 ethernet on GB-PC1
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Sander Vanheule <sander@svanheule.net>, 
	NeilBrown <neil@brown.name>, DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	erkin.bozoglu@xeront.com, Rob Herring <robh@kernel.org>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 7, 2022 at 11:25 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc=
9.com> wrote:
>
> On 03/03/2022 18:16, Ar=C4=B1n=C3=A7 =C3=9CNAL wrote:
> > On 28/02/2022 18:11, Sergio Paracuellos wrote:
> >> On Mon, Feb 28, 2022 at 3:53 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@=
arinc9.com> wrote:
> >>>
> >>> On 28/02/2022 10:01, Sergio Paracuellos wrote:
> >>>> Hi Arinc,
> >>>>
> >>>> On Sun, Feb 27, 2022 at 4:12 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.una=
l@arinc9.com>
> >>>> wrote:
> >>>>>
> >>>>> On 15/02/2022 18:16, Sergio Paracuellos wrote:
> >>>>>> Hi Arinc,
> >>>>>>
> >>>>>> On Tue, Feb 15, 2022 at 3:11 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.u=
nal@arinc9.com>
> >>>>>> wrote:
> >>>>>>>
> >>>>>>> On 15/02/2022 12:09, Sergio Paracuellos wrote:
> >>>>>>>> Hi Arinc,
> >>>>>>>>
> >>>>>>>> On Tue, Feb 15, 2022 at 9:50 AM Ar=C4=B1n=C3=A7 =C3=9CNAL
> >>>>>>>> <arinc.unal@arinc9.com> wrote:
> >>>>>>>>>
> >>>>>>>>> Hey Sergio,
> >>>>>>>>>
> >>>>>>>>> On 15/02/2022 11:35, Sergio Paracuellos wrote:
> >>>>>>>>>> Hi Arinc,
> >>>>>>>>>>
> >>>>>>>>>> On Tue, Feb 15, 2022 at 9:18 AM Ar=C4=B1n=C3=A7 =C3=9CNAL
> >>>>>>>>>> <arinc.unal@arinc9.com> wrote:
> >>>>>>>>>>>
> >>>>>>>>>>> GB-PC1 uses some of the rgmii2 pins (22 - 33) as GPIO.
> >>>>>>>>>>> Therefore, the
> >>>>>>>>>>> rgmii2 bus cannot be used on this device.
> >>>>>>>>>>> Overwrite pinctrl-0 property under the ethernet node without
> >>>>>>>>>>> rgmii2_pins on
> >>>>>>>>>>> the GB-PC1 devicetree.
> >>>>>>>>>>>
> >>>>>>>>>>> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.c=
om>
> >>>>>>>>>>> ---
> >>>>>>>>>>>       drivers/staging/mt7621-dts/gbpc1.dts | 4 ++++
> >>>>>>>>>>>       1 file changed, 4 insertions(+)
> >>>>>>>>>>
> >>>>>>>>>> No issues in GB-PC1. So:
> >>>>>>>>>>
> >>>>>>>>>> Tested-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> >>>>>>>>>
> >>>>>>>>> Thanks for testing it so quickly!
> >>>>>>>>>
> >>>>>>>>> I was wondering if you got pinctrl errors on the bootlog before
> >>>>>>>>> applying
> >>>>>>>>> this patch series.
> >>>>>>>>>
> >>>>>>>>> rgmii2 pin group is given gpio function so calling it from
> >>>>>>>>> ethernet node
> >>>>>>>>> would cause this on my TP-Link RE650 v1 which also uses the
> >>>>>>>>> rgmii2_pins
> >>>>>>>>> as GPIO.
> >>>>>>>>>
> >>>>>>>>> [    1.177349] rt2880-pinmux pinctrl: pin io22 already
> >>>>>>>>> requested by
> >>>>>>>>> pinctrl; cannot claim for 1e100000.ethernet
> >>>>>>>>> [    1.196966] rt2880-pinmux pinctrl: pin-22
> >>>>>>>>> (1e100000.ethernet) status -22
> >>>>>>>>> [    1.210312] rt2880-pinmux pinctrl: could not request pin 22
> >>>>>>>>> (io22)
> >>>>>>>>> from group rgmii2  on device rt2880-pinmux
> >>>>>>>>> [    1.230058] mtk_soc_eth 1e100000.ethernet: Error applying
> >>>>>>>>> setting,
> >>>>>>>>> reverse things back
> >>>>>>>>> [    1.245853] mtk_soc_eth: probe of 1e100000.ethernet failed
> >>>>>>>>> with error -22
> >>>>>>>>
> >>>>>>>> No, I was not getting any kind of error since when I test your l=
ast
> >>>>>>>> patch series I was not experimenting any kind of regression. I
> >>>>>>>> don't
> >>>>>>>> have any issues now also with your new patch series. Your new
> >>>>>>>> changes
> >>>>>>>> make sense since as you have said "rgmii2" pins are requested as
> >>>>>>>> GPIO
> >>>>>>>> but it seems are not really being requested? I don't have time t=
o
> >>>>>>>> check the datasheet now but will try to get time to see what is
> >>>>>>>> happening there.
> >>>>>>>
> >>>>>>> I think this must have something to do with pinctrl on newer
> >>>>>>> kernels as
> >>>>>>> the TP-Link RE650 that I tested uses the OpenWrt master branch
> >>>>>>> (Linux 5.10).
> >>>>>>
> >>>>>> I think is this commit which I did according to a review after mov=
ing
> >>>>>> the driver from staging into 'drivers/pincrtl/ralink':
> >>>>>>
> >>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git=
/commit/drivers/pinctrl/ralink?h=3Dstaging-next&id=3D8a55d64c3336fc2ffd488a=
37d08ceab154c7b56b
> >>>>>>
> >>>>>>
> >>>>>> You can also check other changes from where the driver was moved:
> >>>>>>
> >>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git=
/log/drivers/pinctrl/ralink?h=3Dstaging-next
> >>>>>>
> >>>>>
> >>>>> I realised current mt7621.dtsi does not apply the functions we spec=
ify
> >>>>> for the pin groups on device-specific devicetrees. I believe we
> >>>>> need to
> >>>>> add this like on OpenWrt's mt7621.dtsi.
> >>>>>
> >>>>> https://github.com/openwrt/openwrt/blob/master/target/linux/ramips/=
dts/mt7621.dtsi#L249-L253
> >>>>>
> >>>>>
> >>>>> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/=
tree/drivers/staging/mt7621-dts/mt7621.dtsi?h=3Dstaging-testing#n153
> >>>>>
> >>>>>
> >>>>> Can you apply the patch below to see if you get the error like abov=
e?
> >>>>> I also put it in attachments in case of space characters replacing =
tab
> >>>>> on the mail.
> >>>>>
> >>>>> Ar=C4=B1n=C3=A7
> >>>>>
> >>>>> ---
> >>>>> diff --git a/drivers/staging/mt7621-dts/gbpc1.dts
> >>>>> b/drivers/staging/mt7621-dts/gbpc1.dts
> >>>>> index 1b5175e6ccf3..e38a083811e5 100644
> >>>>> --- a/drivers/staging/mt7621-dts/gbpc1.dts
> >>>>> +++ b/drivers/staging/mt7621-dts/gbpc1.dts
> >>>>> @@ -114,10 +114,6 @@ default_gpio: gpio {
> >>>>>           };
> >>>>>     };
> >>>>>
> >>>>> -&ethernet {
> >>>>> -       pinctrl-0 =3D <&mdio_pins>, <&rgmii1_pins>;
> >>>>> -};
> >>>>> -
> >>>>>     &switch0 {
> >>>>>           ports {
> >>>>>                   port@0 {
> >>>>> diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi
> >>>>> b/drivers/staging/mt7621-dts/mt7621.dtsi
> >>>>> index 4da20da243e6..8e181d6f70ae 100644
> >>>>> --- a/drivers/staging/mt7621-dts/mt7621.dtsi
> >>>>> +++ b/drivers/staging/mt7621-dts/mt7621.dtsi
> >>>>> @@ -152,6 +152,11 @@ spi0: spi@b00 {
> >>>>>
> >>>>>           pinctrl: pinctrl {
> >>>>>                   compatible =3D "ralink,rt2880-pinmux";
> >>>>> +               pinctrl-names =3D "default";
> >>>>> +               pinctrl-0 =3D <&state_default>;
> >>>>> +
> >>>>> +               state_default: pinctrl0 {
> >>>>> +               };
> >>>>
> >>>> This should not be in the pinctrl node. I was told to remove it when
> >>>> bindings were reviewed since these properties must be in consumer
> >>>> nodes [0]. See binding documentation [1]:
> >>>>
> >>>> [0]:
> >>>> https://www.mail-archive.com/driverdev-devel@linuxdriverproject.org/=
msg102634.html
> >>>>
> >>>> [1]:
> >>>> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/t=
ree/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml?h=
=3Dstaging-linus&id=3Db6821b0d9b56386d2bf14806f90ec401468c799f
> >>>>
> >>>
> >>> I'm not sure what a consumer node would be in this context so we can
> >>> claim the pin groups with the given function under it.
> >>>
> >>> Is the ethernet node a consumer node since I claim the rgmii2_pins pi=
n
> >>> group under it for example?
> >>
> >> That is my understanding, yes.
> >
> > Adding Rob on Cc.
> >
> > Solutions that come to my mind:
> >
> > We can overwrite the pin group node with the function we want to set it=
.
> > Then claim it under a node where pins from the pin group is used.
> >
> > Example:
> >
> > diff --git a/drivers/staging/mt7621-dts/gbpc1.dts
> > b/drivers/staging/mt7621-dts/gbpc1.dts
> > index 360ac98de3f1..709105b2822b 100644
> > --- a/drivers/staging/mt7621-dts/gbpc1.dts
> > +++ b/drivers/staging/mt7621-dts/gbpc1.dts
> > @@ -38,6 +38,9 @@ reset {
> >       gpio-leds {
> >           compatible =3D "gpio-leds";
> >
> > +        pinctrl-names =3D "default";
> > +        pinctrl-0 =3D <&uart3_pins>;
> > +
> >           power {
> >               label =3D "green:power";
> >               gpios =3D <&gpio 6 GPIO_ACTIVE_LOW>;
> > @@ -103,6 +106,12 @@ gpio {
> >       };
> >   };
> >
> > +&uart3_pins {
> > +    pinmux {
> > +        function =3D "gpio";
> > +    };
> > +};
> > +
> >   &ethernet {
> >       pinctrl-0 =3D <&mdio_pins>, <&rgmii1_pins>;
> >   };
> >
> > A few issues with this:
> >
> > - Some used pins might not be defined on the devicetree. We cannot clai=
m
> > these pin groups because the consumer node doesn't exist.
> >
> > For example, check JTAG pins of GB-PC2 on page 15:
> > https://github.com/ngiger/GnuBee_Docs/blob/master/GB-PCx/Documents/GB-P=
C2_V1.1_schematic.pdf
> >
> >
> > - Pins on the same pin group can be used under different nodes. We
> > cannot claim a pin group under multiple nodes.
> >
> > So we can get back to this:
> >
> > Treat pinctrl node as a consumer node. We might not need to refer to th=
e
> > pinctrl-0 & pinctrl-names properties on the rt2880-pinmux documentation
> > since they're generic pinctrl properties.
> >
> > Example:
> >
> > diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi
> > b/drivers/staging/mt7621-dts/mt7621.dtsi
> > index 4da20da243e6..8e181d6f70ae 100644
> > --- a/drivers/staging/mt7621-dts/mt7621.dtsi
> > +++ b/drivers/staging/mt7621-dts/mt7621.dtsi
> > @@ -152,6 +152,12 @@ spi0: spi@b00 {
> >
> >        pinctrl: pinctrl {
> >            compatible =3D "ralink,rt2880-pinmux";
> > +        pinctrl-names =3D "default";
> > +        pinctrl-0 =3D <&state_default>;
> > +
> > +        state_default: state-default {
> > +
> > +        };
> >
> >            i2c_pins: i2c0-pins {
> >                pinmux {
> >
> > On any mt7621 devicetree:
> >
> > &state_default {
> >      gpio-pinmux {
> >          groups =3D "rgmii2", "uart3", "wdt";
> >          function =3D "gpio";
> >      };
> > };
>
> I think a better solution would be to claim default_state under a device
> specific devicetree so we don't touch mt7621.dtsi at all. An mt7621
> device might not need to use any pin groups as gpio so putting a
> state_default node under mt7621.dtsi doesn't make sense.
>
> I'll send patches for GB-PC1 & GB-PC2 for you to comment on.

Please, do. Thanks,
    Sergio Paracuellos

>
> Ar=C4=B1n=C3=A7
