Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4884F7A
	for <linux-staging@lists.linux.dev>; Thu, 10 Mar 2022 12:42:50 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id c7so4213120qka.7
        for <linux-staging@lists.linux.dev>; Thu, 10 Mar 2022 04:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=x8cvk9nXbf769IxgCb0SGvjzaFi8GDi3vukprk7g5Qk=;
        b=CFixbDvxzF/Ceh2VtmnIZxyk3RB4i+OxyI7NjHerjaxGWzYGn1RJTc4fJN1HtnkKZ+
         MZJiatZXAkyV4ft6w/HnZGdexzw8BzGb93CglzEw6hKa0+C0NuPPBvd0jgyg2uE+MA7U
         6JrEfYH+8QT7GGBW0TDbNqIADdehua/gFLkVBHTEpYXzfpu9EBm9YbAfNdQOWcrZWikk
         QT5pYXkttUv535BvKDhrTtgjf6kqCGv9tBupTJZkNBhr/mROpvILhzByOLFkPYE+ejPi
         nrWJ6ti57K3LRWO8RzEnLfUs/EVyhXuMNZtdfYls5qRVqC5u3hlRiaUDmE1AyVk5WEs6
         TaHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=x8cvk9nXbf769IxgCb0SGvjzaFi8GDi3vukprk7g5Qk=;
        b=GdM2vITJ4sFkMDeQ6nLLP7DC0IKW4Ad2oEECQ0Yjf1YNEJe53RVPGk/l42Q6RTIVY1
         2aw2YWDgu1ZmV7ZptaXstspk1zMUjL+JwzSvOjRvFy8dpbpR9aZMhyDIBO20ebLkbIVx
         pZ1LOPFmrzg8OephGa9CKSwUYXjTPfESOhilUgrE7BOBTd3Lew3J8PspVsD7u09Tqxdv
         IBLI9oollpMC1CUuimGvfg48LcEVifL5gnItHkW7cFFfh5FygbZ9HKkPKNb+owRZFs1e
         CdpWFFxgc3dtbq30zbt8mesF4ELnNgBcoyCGr49sKPYtg8VdQcCrCpFfH0z0EtSWOMvR
         GpvQ==
X-Gm-Message-State: AOAM533oyJ5+T5FlhuGLQtrTIcaTcTqguAc7HS8KLfRQVKrIxQLn2G5l
	eQSvm4UQuyf3blVs1ijRYy7IrwOSGD8D6nDgFn4kKyvb
X-Google-Smtp-Source: ABdhPJyaO4+zx72LbNC/kpw3J1tb1ReFT48ECdok3QyAIyMZNjnKlJES+48PGeMg7yAuu6S694CkyQmLwmiwqRmPNbM=
X-Received: by 2002:a05:620a:1448:b0:67d:4057:ec80 with SMTP id
 i8-20020a05620a144800b0067d4057ec80mr2779867qkl.563.1646916169221; Thu, 10
 Mar 2022 04:42:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220310113939.6601-1-arinc.unal@arinc9.com> <20220310113939.6601-2-arinc.unal@arinc9.com>
 <CAMhs-H-pUWadNi7ZhuVEh2uhvqkUJNmsS=uYZQi8yNoFTch3MQ@mail.gmail.com> <49f5cd24-62db-0d5d-bdf5-da23cb85befd@arinc9.com>
In-Reply-To: <49f5cd24-62db-0d5d-bdf5-da23cb85befd@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 10 Mar 2022 13:42:38 +0100
Message-ID: <CAMhs-H8Cj3xmwUe235YJjfJp03YQbDNir9DWqHFcOmFDF1M3Sw@mail.gmail.com>
Subject: Re: [PATCH 2/2] staging: mt7621-dts: fix GB-PC2 devicetree
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, NeilBrown <neil@brown.name>, 
	erkin.bozoglu@xeront.com, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 10, 2022 at 1:23 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc=
9.com> wrote:
>
> Hi Sergio,
>
> On 10/03/2022 14:50, Sergio Paracuellos wrote:
> > Hi Arinc,
> >
> > Overall it looks good. See below my concerns.
> >
> > On Thu, Mar 10, 2022 at 12:41 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@=
arinc9.com> wrote:
> >>
> >> Fix the GB-PC2 devicetree. Refer to the schematics of the device for m=
ore
> >> information.
> >>
> >> GB-PC2 devicetree fixes:
> >> - Include mt7621.dtsi instead of gbpc1.dts. Add the missing definition=
s.
> >
> > There are pretty much the same definitions. Should we really include
> > mt7621 instead of gbpc1??
>
> The DeviceTree Specification states that the name of include files
> should end with =E2=80=9C.dtsi=E2=80=9D.
>
> On top of that, we'd have to overwrite ethernet node's pinctrl-0
> property again since we use a different value for GB-PC2 than GB-PC1.
>
> Not to mention, GB-PC2 does not need gpio-leds node.

Fair enough :). Thanks for doing this.

Best regards,
    Sergio Paracuellos

>
> >
> >> - Remove gpio-leds node as the system LED is not wired to anywhere on
> >> the board and the power LED is directly wired to GND.
> >> - Remove uart3 pin group from gpio-pinmux node as it's not used as GPI=
O.
> >> - Use reg 7 for the external phy to be on par with
> >> Documentation/devicetree/bindings/net/dsa/mt7530.txt.
> >>
> >> Link: https://github.com/ngiger/GnuBee_Docs/blob/master/GB-PCx/Documen=
ts/GB-PC2_V1.1_schematic.pdf
> >> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> >> ---
> >>   drivers/staging/mt7621-dts/gbpc2.dts | 107 +++++++++++++++++++++++++=
--
> >>   1 file changed, 100 insertions(+), 7 deletions(-)
> >
> > In any case, as I have said, looks good:
> >
> > Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> >
> > Thanks,
> >      Sergio Paracuellos
