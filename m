Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF25C7C
	for <linux-staging@lists.linux.dev>; Mon, 28 Feb 2022 15:12:11 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id j11so13046134qvy.0
        for <linux-staging@lists.linux.dev>; Mon, 28 Feb 2022 07:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=eyAAPzF4VwKueNJipK29Xl1CKMdut61O8p7Nk3ZVdII=;
        b=mJufOOk/+Swa19CzqnSx+ei5FT+/ob54HIqqD/cwOtYZZ7tRIQ8SGNB7ZrFhyoZlVz
         AE9BIPwofZWd2CDEdjXr++fWd/Ne8cmxiNcK8lpr8CGpOrGLLzaPcORxaXp21lNov4R3
         n8NOnagTfzsv47c5+g+6glM6Ng8dUHN+GIvNl7tcXT2Rc81ECU9ogfY2cegdx2g1nk4C
         WSerhFGLP0JNCGPy+3xQf0gEq+vjnGnAqZbuZgDq4OonYUmbpRo9hQ92ppV/Xqrc1Sjg
         JV69AwYSxTp4C74lj4NXMZO9W7gu/Lg7ZhtsnCSB6de06ey4PzEFoL9MJpWn1uyWm7X+
         dlvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=eyAAPzF4VwKueNJipK29Xl1CKMdut61O8p7Nk3ZVdII=;
        b=joCvayBBN7luq7AxPtUCKqjNX0b765177uyqk4PJUmoSla1dtF/uG/akW+1bGNLmeT
         lNGR/PWZ4Uq9GuAs3x7GKy/nWqQyniDxU5zaxnD3oNG29e2E7ZBXTJhMtEYSyOucobZ5
         7QsWGdNLScU+4sqDI2X95PVR2ECWSYK1+SNrMuqQ1kpMCKAA6Pxez5d1eIPosmVgOUKD
         ASnpYEnFqK+JPgwsGDT50vxiknnZGOLdTUJPc0LWfmaPTPUDXhzuZXjJoQxTZvZvsSHx
         Hzff+EU9iaNR8wiFzwDlwmangT7HHzlCRG/hJNBA+YfppmIqvnevcfcnF2nrqc9covLz
         8H4Q==
X-Gm-Message-State: AOAM532ZTpg+exIPVERIc3bZv1vaq64SuSbiaaUjELiPiIRb8cw4gdq6
	yBDY2HzjJkHdgPf+x0XErtt32R2bTlDomjpbqqk=
X-Google-Smtp-Source: ABdhPJwD24jW0KY3hXhu9kb6+q8u0EPpVxW/1dK8RXhb+kOp84PKVYm2+xy4o16hPGPJi9tkbwArDe4pxthnel0UD2U=
X-Received: by 2002:a05:6214:2482:b0:432:4bf6:47b7 with SMTP id
 gi2-20020a056214248200b004324bf647b7mr14431239qvb.38.1646061130616; Mon, 28
 Feb 2022 07:12:10 -0800 (PST)
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
 <e26eae35-8207-b8c7-7af0-0fb4bd7a69c9@arinc9.com>
In-Reply-To: <e26eae35-8207-b8c7-7af0-0fb4bd7a69c9@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 28 Feb 2022 16:11:59 +0100
Message-ID: <CAMhs-H-JtkHzjUkNTdJ0OUsZqNYHYAi6gDp2SYc8yJbPpx9=zw@mail.gmail.com>
Subject: Re: [PATCH 2/2] staging: mt7621-dts: do not use rgmii2_pins for
 ethernet on GB-PC1
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Sander Vanheule <sander@svanheule.net>, 
	NeilBrown <neil@brown.name>, DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	erkin.bozoglu@xeront.com, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2022 at 3:53 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc=
9.com> wrote:
>
> On 28/02/2022 10:01, Sergio Paracuellos wrote:
> > Hi Arinc,
> >
> > On Sun, Feb 27, 2022 at 4:12 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@a=
rinc9.com> wrote:
> >>
> >> On 15/02/2022 18:16, Sergio Paracuellos wrote:
> >>> Hi Arinc,
> >>>
> >>> On Tue, Feb 15, 2022 at 3:11 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal=
@arinc9.com> wrote:
> >>>>
> >>>> On 15/02/2022 12:09, Sergio Paracuellos wrote:
> >>>>> Hi Arinc,
> >>>>>
> >>>>> On Tue, Feb 15, 2022 at 9:50 AM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.un=
al@arinc9.com> wrote:
> >>>>>>
> >>>>>> Hey Sergio,
> >>>>>>
> >>>>>> On 15/02/2022 11:35, Sergio Paracuellos wrote:
> >>>>>>> Hi Arinc,
> >>>>>>>
> >>>>>>> On Tue, Feb 15, 2022 at 9:18 AM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.=
unal@arinc9.com> wrote:
> >>>>>>>>
> >>>>>>>> GB-PC1 uses some of the rgmii2 pins (22 - 33) as GPIO. Therefore=
, the
> >>>>>>>> rgmii2 bus cannot be used on this device.
> >>>>>>>> Overwrite pinctrl-0 property under the ethernet node without rgm=
ii2_pins on
> >>>>>>>> the GB-PC1 devicetree.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> >>>>>>>> ---
> >>>>>>>>      drivers/staging/mt7621-dts/gbpc1.dts | 4 ++++
> >>>>>>>>      1 file changed, 4 insertions(+)
> >>>>>>>
> >>>>>>> No issues in GB-PC1. So:
> >>>>>>>
> >>>>>>> Tested-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> >>>>>>
> >>>>>> Thanks for testing it so quickly!
> >>>>>>
> >>>>>> I was wondering if you got pinctrl errors on the bootlog before ap=
plying
> >>>>>> this patch series.
> >>>>>>
> >>>>>> rgmii2 pin group is given gpio function so calling it from etherne=
t node
> >>>>>> would cause this on my TP-Link RE650 v1 which also uses the rgmii2=
_pins
> >>>>>> as GPIO.
> >>>>>>
> >>>>>> [    1.177349] rt2880-pinmux pinctrl: pin io22 already requested b=
y
> >>>>>> pinctrl; cannot claim for 1e100000.ethernet
> >>>>>> [    1.196966] rt2880-pinmux pinctrl: pin-22 (1e100000.ethernet) s=
tatus -22
> >>>>>> [    1.210312] rt2880-pinmux pinctrl: could not request pin 22 (io=
22)
> >>>>>> from group rgmii2  on device rt2880-pinmux
> >>>>>> [    1.230058] mtk_soc_eth 1e100000.ethernet: Error applying setti=
ng,
> >>>>>> reverse things back
> >>>>>> [    1.245853] mtk_soc_eth: probe of 1e100000.ethernet failed with=
 error -22
> >>>>>
> >>>>> No, I was not getting any kind of error since when I test your last
> >>>>> patch series I was not experimenting any kind of regression. I don'=
t
> >>>>> have any issues now also with your new patch series. Your new chang=
es
> >>>>> make sense since as you have said "rgmii2" pins are requested as GP=
IO
> >>>>> but it seems are not really being requested? I don't have time to
> >>>>> check the datasheet now but will try to get time to see what is
> >>>>> happening there.
> >>>>
> >>>> I think this must have something to do with pinctrl on newer kernels=
 as
> >>>> the TP-Link RE650 that I tested uses the OpenWrt master branch (Linu=
x 5.10).
> >>>
> >>> I think is this commit which I did according to a review after moving
> >>> the driver from staging into 'drivers/pincrtl/ralink':
> >>>
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/co=
mmit/drivers/pinctrl/ralink?h=3Dstaging-next&id=3D8a55d64c3336fc2ffd488a37d=
08ceab154c7b56b
> >>>
> >>> You can also check other changes from where the driver was moved:
> >>>
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/lo=
g/drivers/pinctrl/ralink?h=3Dstaging-next
> >>
> >> I realised current mt7621.dtsi does not apply the functions we specify
> >> for the pin groups on device-specific devicetrees. I believe we need t=
o
> >> add this like on OpenWrt's mt7621.dtsi.
> >>
> >> https://github.com/openwrt/openwrt/blob/master/target/linux/ramips/dts=
/mt7621.dtsi#L249-L253
> >>
> >> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/tre=
e/drivers/staging/mt7621-dts/mt7621.dtsi?h=3Dstaging-testing#n153
> >>
> >> Can you apply the patch below to see if you get the error like above?
> >> I also put it in attachments in case of space characters replacing tab
> >> on the mail.
> >>
> >> Ar=C4=B1n=C3=A7
> >>
> >> ---
> >> diff --git a/drivers/staging/mt7621-dts/gbpc1.dts
> >> b/drivers/staging/mt7621-dts/gbpc1.dts
> >> index 1b5175e6ccf3..e38a083811e5 100644
> >> --- a/drivers/staging/mt7621-dts/gbpc1.dts
> >> +++ b/drivers/staging/mt7621-dts/gbpc1.dts
> >> @@ -114,10 +114,6 @@ default_gpio: gpio {
> >>          };
> >>    };
> >>
> >> -&ethernet {
> >> -       pinctrl-0 =3D <&mdio_pins>, <&rgmii1_pins>;
> >> -};
> >> -
> >>    &switch0 {
> >>          ports {
> >>                  port@0 {
> >> diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi
> >> b/drivers/staging/mt7621-dts/mt7621.dtsi
> >> index 4da20da243e6..8e181d6f70ae 100644
> >> --- a/drivers/staging/mt7621-dts/mt7621.dtsi
> >> +++ b/drivers/staging/mt7621-dts/mt7621.dtsi
> >> @@ -152,6 +152,11 @@ spi0: spi@b00 {
> >>
> >>          pinctrl: pinctrl {
> >>                  compatible =3D "ralink,rt2880-pinmux";
> >> +               pinctrl-names =3D "default";
> >> +               pinctrl-0 =3D <&state_default>;
> >> +
> >> +               state_default: pinctrl0 {
> >> +               };
> >
> > This should not be in the pinctrl node. I was told to remove it when
> > bindings were reviewed since these properties must be in consumer
> > nodes [0]. See binding documentation [1]:
> >
> > [0]: https://www.mail-archive.com/driverdev-devel@linuxdriverproject.or=
g/msg102634.html
> > [1]: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git=
/tree/Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml?h=
=3Dstaging-linus&id=3Db6821b0d9b56386d2bf14806f90ec401468c799f
>
> I'm not sure what a consumer node would be in this context so we can
> claim the pin groups with the given function under it.
>
> Is the ethernet node a consumer node since I claim the rgmii2_pins pin
> group under it for example?

That is my understanding, yes.

Best regards,
    Sergio Paracuellos
>
> Ar=C4=B1n=C3=A7
