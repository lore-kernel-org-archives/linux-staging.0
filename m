Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BF7320F
	for <linux-staging@lists.linux.dev>; Mon, 28 Feb 2022 07:02:03 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id z66so9642649qke.10
        for <linux-staging@lists.linux.dev>; Sun, 27 Feb 2022 23:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=H65AQ6f47kbD1KCrrOsvYJm+0aXgSzNol0DY3REsG7I=;
        b=AViFaHbYaxyJXYwNGaOAW+mN0pR3+Ygtn+x86w7pop8YJXdTTb8CfRYMqcFeJw22ay
         hJPO9eqsthcOgHrpJ28kXwr1gQe5YlN4+6a33XQL6+n3FvOdC/4/wW2OKFVtn64o8v5H
         F39EyshJC+qcpqQG4ZOZz79W1KyHdwgDdTQg7qZSL7brSeKuqnkLbvfB3lpKrLxpZpdG
         reltrIHypJmCb92gfj09KuLj1GOkl6NfQX25lMWnof/jnneRUDUQY9x+3uL2q+UJh/tD
         WfFqt74B7WM22iXckSxomHjTXFr2B/vcx4K8OGtZEeX7hJnKYStIcfgwmacleJETvfku
         gVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=H65AQ6f47kbD1KCrrOsvYJm+0aXgSzNol0DY3REsG7I=;
        b=ACdi7veixc/rltCNuL1PGQIJlu8uHvG5PFvHXNEGL6Bepih7mJ1+osCll5q5B2h8lN
         fVeWmUxiyxeUqcvro2aPgQFwRZ4/kdZdsIHHKRopB/UobuNdIkrZO7Nktex8XTwUh8IW
         04Dw3kPoIlPZKIbyHsgeQP88RtKho9cIHGyu9eTLC9gG4vw/iHxJjfCMaL99bEFZklea
         kQervzWAvcndy/wl7mJofnDODK95rehkddrgoDluwfK2ePa8e4PTD767VzLSjOU0WWG8
         eE9znX05UDslrkaGLg3M1E4K0xC1kQoHrxltrlb8JDXGXfts7IxQ0YZ0xuODggIuxhb+
         vqng==
X-Gm-Message-State: AOAM530Tw0N+DTdXRM7pvjDAGZbymU5REhOnCsHoeHyURMU4amhtvRXy
	TrLZ534nlcKaHjL+NZiDJTyEQBEx59whZLW/rBPgiBcIikk=
X-Google-Smtp-Source: ABdhPJwLYd2feO52t2xqjHeCbcvUKvZ7YSE4ZnC5Ray4TKyDyWDztl+x28zNde731IOpI7XbAtRq4/oM0aZkkSQvcJE=
X-Received: by 2002:a05:620a:1206:b0:662:d04d:4512 with SMTP id
 u6-20020a05620a120600b00662d04d4512mr3780162qkj.696.1646031722144; Sun, 27
 Feb 2022 23:02:02 -0800 (PST)
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
 <bffc9641-ec69-f88e-b877-65d12305b928@arinc9.com>
In-Reply-To: <bffc9641-ec69-f88e-b877-65d12305b928@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 28 Feb 2022 08:01:50 +0100
Message-ID: <CAMhs-H-dHY_+gTOmGXYFyVLK69D7y0bw5s2=e6gDh5yFtp6HzQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] staging: mt7621-dts: do not use rgmii2_pins for
 ethernet on GB-PC1
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Sander Vanheule <sander@svanheule.net>, 
	NeilBrown <neil@brown.name>, DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	erkin.bozoglu@xeront.com, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arinc,

On Sun, Feb 27, 2022 at 4:12 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc=
9.com> wrote:
>
> On 15/02/2022 18:16, Sergio Paracuellos wrote:
> > Hi Arinc,
> >
> > On Tue, Feb 15, 2022 at 3:11 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@a=
rinc9.com> wrote:
> >>
> >> On 15/02/2022 12:09, Sergio Paracuellos wrote:
> >>> Hi Arinc,
> >>>
> >>> On Tue, Feb 15, 2022 at 9:50 AM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal=
@arinc9.com> wrote:
> >>>>
> >>>> Hey Sergio,
> >>>>
> >>>> On 15/02/2022 11:35, Sergio Paracuellos wrote:
> >>>>> Hi Arinc,
> >>>>>
> >>>>> On Tue, Feb 15, 2022 at 9:18 AM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.un=
al@arinc9.com> wrote:
> >>>>>>
> >>>>>> GB-PC1 uses some of the rgmii2 pins (22 - 33) as GPIO. Therefore, =
the
> >>>>>> rgmii2 bus cannot be used on this device.
> >>>>>> Overwrite pinctrl-0 property under the ethernet node without rgmii=
2_pins on
> >>>>>> the GB-PC1 devicetree.
> >>>>>>
> >>>>>> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> >>>>>> ---
> >>>>>>     drivers/staging/mt7621-dts/gbpc1.dts | 4 ++++
> >>>>>>     1 file changed, 4 insertions(+)
> >>>>>
> >>>>> No issues in GB-PC1. So:
> >>>>>
> >>>>> Tested-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> >>>>
> >>>> Thanks for testing it so quickly!
> >>>>
> >>>> I was wondering if you got pinctrl errors on the bootlog before appl=
ying
> >>>> this patch series.
> >>>>
> >>>> rgmii2 pin group is given gpio function so calling it from ethernet =
node
> >>>> would cause this on my TP-Link RE650 v1 which also uses the rgmii2_p=
ins
> >>>> as GPIO.
> >>>>
> >>>> [    1.177349] rt2880-pinmux pinctrl: pin io22 already requested by
> >>>> pinctrl; cannot claim for 1e100000.ethernet
> >>>> [    1.196966] rt2880-pinmux pinctrl: pin-22 (1e100000.ethernet) sta=
tus -22
> >>>> [    1.210312] rt2880-pinmux pinctrl: could not request pin 22 (io22=
)
> >>>> from group rgmii2  on device rt2880-pinmux
> >>>> [    1.230058] mtk_soc_eth 1e100000.ethernet: Error applying setting=
,
> >>>> reverse things back
> >>>> [    1.245853] mtk_soc_eth: probe of 1e100000.ethernet failed with e=
rror -22
> >>>
> >>> No, I was not getting any kind of error since when I test your last
> >>> patch series I was not experimenting any kind of regression. I don't
> >>> have any issues now also with your new patch series. Your new changes
> >>> make sense since as you have said "rgmii2" pins are requested as GPIO
> >>> but it seems are not really being requested? I don't have time to
> >>> check the datasheet now but will try to get time to see what is
> >>> happening there.
> >>
> >> I think this must have something to do with pinctrl on newer kernels a=
s
> >> the TP-Link RE650 that I tested uses the OpenWrt master branch (Linux =
5.10).
> >
> > I think is this commit which I did according to a review after moving
> > the driver from staging into 'drivers/pincrtl/ralink':
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/comm=
it/drivers/pinctrl/ralink?h=3Dstaging-next&id=3D8a55d64c3336fc2ffd488a37d08=
ceab154c7b56b
> >
> > You can also check other changes from where the driver was moved:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/log/=
drivers/pinctrl/ralink?h=3Dstaging-next
>
> I realised current mt7621.dtsi does not apply the functions we specify
> for the pin groups on device-specific devicetrees. I believe we need to
> add this like on OpenWrt's mt7621.dtsi.
>
> https://github.com/openwrt/openwrt/blob/master/target/linux/ramips/dts/mt=
7621.dtsi#L249-L253
>
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/tree/d=
rivers/staging/mt7621-dts/mt7621.dtsi?h=3Dstaging-testing#n153
>
> Can you apply the patch below to see if you get the error like above?
> I also put it in attachments in case of space characters replacing tab
> on the mail.
>
> Ar=C4=B1n=C3=A7
>
> ---
> diff --git a/drivers/staging/mt7621-dts/gbpc1.dts
> b/drivers/staging/mt7621-dts/gbpc1.dts
> index 1b5175e6ccf3..e38a083811e5 100644
> --- a/drivers/staging/mt7621-dts/gbpc1.dts
> +++ b/drivers/staging/mt7621-dts/gbpc1.dts
> @@ -114,10 +114,6 @@ default_gpio: gpio {
>         };
>   };
>
> -&ethernet {
> -       pinctrl-0 =3D <&mdio_pins>, <&rgmii1_pins>;
> -};
> -
>   &switch0 {
>         ports {
>                 port@0 {
> diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi
> b/drivers/staging/mt7621-dts/mt7621.dtsi
> index 4da20da243e6..8e181d6f70ae 100644
> --- a/drivers/staging/mt7621-dts/mt7621.dtsi
> +++ b/drivers/staging/mt7621-dts/mt7621.dtsi
> @@ -152,6 +152,11 @@ spi0: spi@b00 {
>
>         pinctrl: pinctrl {
>                 compatible =3D "ralink,rt2880-pinmux";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&state_default>;
> +
> +               state_default: pinctrl0 {
> +               };

This should not be in the pinctrl node. I was told to remove it when
bindings were reviewed since these properties must be in consumer
nodes [0]. See binding documentation [1]:

[0]: https://www.mail-archive.com/driverdev-devel@linuxdriverproject.org/ms=
g102634.html
[1]: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/tre=
e/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml?h=3Ds=
taging-linus&id=3Db6821b0d9b56386d2bf14806f90ec401468c799f

Best regards,
    Sergio Paracuellos

>
>                 i2c_pins: i2c0-pins {
>                         pinmux {
