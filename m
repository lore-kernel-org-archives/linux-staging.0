Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7999D29CA
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 15:50:27 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id f24so38029430uab.11
        for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 07:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BXICmb+K5gHsP99jbb/gVMS8+IxvQM3+maecEWPQCPo=;
        b=DD0QwWos02OKm6u58ksXETf33HlUUIUqbE8eKVW1grtFdMXFFZxxyA29YZ5ag+2Mca
         +TUCI4wT3djIESZEfOTVvh4NGN0HFk4ztLokx0JxMV0PFOdbkLucDJt5rYGAbZQRWfnG
         uFNkrkuR9KdsTrxxfWQIGODoCwWWvMxGpzn3Dq7c5bFqEX/G7hegg0eCCAcDOPYPVY6R
         yifAeqIlu8OtK5OGiAXKO2tPMqLfmL/4w79EARAr/RgnF/Q0BGkDAteTZcNvKT1otr/f
         kj2PBghnjC0k6Qvw4pnDEtwihmws2nI6/RN5RXdh45GTF8Bkwg/dmnWHULPzf654ebCR
         AgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BXICmb+K5gHsP99jbb/gVMS8+IxvQM3+maecEWPQCPo=;
        b=eDdkLzcvjiexVeOlwal+GiacJ4cTXV+6ySYsR2toei91aD5jtTRr6DsSDb7URNW4QS
         v3U7CTL/rlJgVqlwPf+LOUgc2ItZ0d1WL5rNJ2oo3CSY6tqnTOYNjpYxjN7mZGimxYLp
         lKny6OANZHSjkvuOlcm6QDAnUdsgyrNt3vf4CH5qYMuKsTDqpelIXGX8Ls5HivEbwKAF
         11HiaMDFaS+bEsbdr1QRTva+snLmOCh/MHyHHAJIyqekiH1h0pTWPnZwki+BA+qSvl4Z
         czVBbUJ8qRyQ4p7SCMuUFX303YZZyM951U+6Qmo8armD95Pd9cLp/bKXLwnxa7ZpjNgV
         P8zg==
X-Gm-Message-State: AOAM530JtFd/NR50YDMfTziW6NtJSpx04W4GECCtIujSWPFTqxLfRNHs
	K46iuEMfhuwQfMgjnGDdGtkwOgL4aqoL4smBr8A=
X-Google-Smtp-Source: ABdhPJz/DlMZfXK/aLSv/MvuefUZlIuXBT8YNJjvsXeC1VmCHWKT00hXXxaTI5jlctSIIz1rB1jaSxOeCyz3DEiTsBQ=
X-Received: by 2002:a67:ca03:: with SMTP id z3mr3722094vsk.1.1643125826417;
 Tue, 25 Jan 2022 07:50:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220124124351.4604-1-arinc.unal@arinc9.com> <CAMhs-H9qkd-uy75d=NPLc5Azt3ejyW5zstpq75=i-e8iR4Xaow@mail.gmail.com>
 <a4506b38-4ec8-d192-8579-79132c25969a@arinc9.com>
In-Reply-To: <a4506b38-4ec8-d192-8579-79132c25969a@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 25 Jan 2022 16:50:15 +0100
Message-ID: <CAMhs-H_zgas1b15w3S3Y4x9N9eaAqbMPxTXa6owPSEJThSGqvg@mail.gmail.com>
Subject: Re:
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, NeilBrown <neil@brown.name>, 
	DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2022 at 4:24 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc=
9.com> wrote:
>
> Hey Sergio,
>
> On 25/01/2022 17:03, Sergio Paracuellos wrote:
> > Hi Arinc!
> >
> > On Mon, Jan 24, 2022 at 1:45 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@a=
rinc9.com> wrote:
> >>
> >> Hey everyone,
> >>
> >> In preperation to mainline mt7621-dts; fix formatting, dtc warning on
> >> switch0@0 node and pinctrl properties for ethernet node on the mt7621.=
dtsi.
> >> Move the GB-PC2 specific external phy configuration on the main dtsi t=
o
> >> GB-PC2's devicetree, gbpc2.dts.
> >>
> >> Now that pinctrl properties are properly defined on the ethernet node,
> >> GMAC1 will start working.
> >>
> >> Traffic flow on GMAC1 was tested on a mt7621a board with these modes:
> >> External phy <-> GMAC1
> >> PHY 0/4 <-> GMAC1
> >>
> >> Cheers.
> >> Ar=C4=B1n=C3=A7
> >
> > Nitpick: next time try to put also a subject like "staging:
> > mt7621-dts: cleanups (or whatever)" in the cover letter of the series.
>
> I had already sent v2 with that. I'll send v3 with your input on the
> series, thanks!

True, sorry I missed that!

Thanks,
    Sergio Paracuellos
>
> >
> >>
> >> [0]: https://lore.kernel.org/netdev/83a35aa3-6cb8-2bc4-2ff4-64278bbcd8=
c8@arinc9.com/T/
> >>
> >> Ar=C4=B1n=C3=A7 =C3=9CNAL (4):
> >>        staging: mt7621-dts: fix formatting
> >>        staging: mt7621-dts: fix switch0@0 warnings
> >>        staging: mt7621-dts: use trgmii on gmac0 and enable flow contro=
l on port@6
> >>        staging: mt7621-dts: fix pinctrl properties for ethernet
> >>
> >>   drivers/staging/mt7621-dts/gbpc2.dts   | 16 +++++++++++-----
> >>   drivers/staging/mt7621-dts/mt7621.dtsi | 32 ++++++++++++++++--------=
--------
> >>   2 files changed, 27 insertions(+), 21 deletions(-)
> >>
> >>
> >
> > Thanks for doing this!
> >
> > Best regards,
> >      Sergio Paracuellos
