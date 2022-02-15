Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF38AEB8
	for <linux-staging@lists.linux.dev>; Tue, 15 Feb 2022 09:09:47 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id 103so9496955uag.4
        for <linux-staging@lists.linux.dev>; Tue, 15 Feb 2022 01:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=j6XJQT+caIH3mSxQb+BQmHR4ZADuzn1Rs9gRoDuheiI=;
        b=ILtSvtf8L+AANntDNUK+6zulOvn0Cs/ZFLTxGor0wwT1sametpcpps4kAW3g9IFZQU
         PHut0M7/7kRVh4Or/9ONNjWUnrlbbcrdZvERexgQSmwbQBXfNYMnM71whgzbe3bgzzgO
         SnX10Wr+68xYX7MmqFmM6/2imFdvs2QKh89KgKw4IiV9P9TWTyOBwlawRkY/iR6iIXif
         VjW/OUfXDf7f0FJnh0TcA38r6veeTeJefojG6CDH3dnzRgGfHFar5ROXCWhI20ibq45q
         htJaDgmJ1EJFSOy1Spn9UBJqX+nE6Mn2Z2wPgHoVaRz8S2hXgw9zhe0Z3h7jAGBYjJiX
         7B1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=j6XJQT+caIH3mSxQb+BQmHR4ZADuzn1Rs9gRoDuheiI=;
        b=PtN/emFFd00k0IGtdvKoMU65ZIuaaBFdgNIH2+xyApqYiU0+VZoF8uxm3UPQoG3Sbw
         KBb0bXNdQw+4Wf362K3LnGEZBBCeWxVS0y5vo5/JfQxeTh+Lm8CEKCE4duFL6gEPkw3H
         E0JGg3g0jHEfSCa+/iBP/D/TbizXZzJOJHyeH4xA/FZoiwGjOR+TgqcyxIxoQe7sJZc+
         eYpbcr0eAZ2Zw9GU6Rmh/IlPZEUqCYQ9NuOjeqfxZd98XsRimyhov3SSBaq5W1gBER3c
         g/PUSebIN3MZynmg7fe1IxOVoXpIHZfzJNGbpN+zDcvAJXLwVEGVjfvtNy8ey1YLQ5KG
         oqIQ==
X-Gm-Message-State: AOAM532r+1Zbe3JKFO4k7bdJK72nc8B7krNbTnAdroec6+2z6MIQ7Yf8
	5OiH55P9g4jXUlpxNGveR/2yRK5fCXNb9ICgaiQ=
X-Google-Smtp-Source: ABdhPJwo+LIJ+lQMTH5mXHhQ7uoGTxskF5INXhwEtavh/S4UDO7dw7gCpq5iD6Yz7i3sOueLbmsjWfriLVsa3bPXvhQ=
X-Received: by 2002:a05:6130:92:: with SMTP id x18mr1118083uaf.66.1644916186915;
 Tue, 15 Feb 2022 01:09:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220215081725.3463-1-arinc.unal@arinc9.com> <20220215081725.3463-2-arinc.unal@arinc9.com>
 <CAMhs-H-74bK3m975Dtmg2zPrGjmqzSd+Tb_qdUV14yJBAWRQbw@mail.gmail.com> <d9240058-68b4-cbd6-54b0-18f41ee5a98a@arinc9.com>
In-Reply-To: <d9240058-68b4-cbd6-54b0-18f41ee5a98a@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 15 Feb 2022 10:09:35 +0100
Message-ID: <CAMhs-H_MvXOOmUDq97YyW7uaSfeNWcKE7F+J4182=MwH7yaOaw@mail.gmail.com>
Subject: Re: [PATCH 2/2] staging: mt7621-dts: do not use rgmii2_pins for
 ethernet on GB-PC1
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Sander Vanheule <sander@svanheule.net>, 
	NeilBrown <neil@brown.name>, DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	erkin.bozoglu@xeront.com, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arinc,

On Tue, Feb 15, 2022 at 9:50 AM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc=
9.com> wrote:
>
> Hey Sergio,
>
> On 15/02/2022 11:35, Sergio Paracuellos wrote:
> > Hi Arinc,
> >
> > On Tue, Feb 15, 2022 at 9:18 AM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@a=
rinc9.com> wrote:
> >>
> >> GB-PC1 uses some of the rgmii2 pins (22 - 33) as GPIO. Therefore, the
> >> rgmii2 bus cannot be used on this device.
> >> Overwrite pinctrl-0 property under the ethernet node without rgmii2_pi=
ns on
> >> the GB-PC1 devicetree.
> >>
> >> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> >> ---
> >>   drivers/staging/mt7621-dts/gbpc1.dts | 4 ++++
> >>   1 file changed, 4 insertions(+)
> >
> > No issues in GB-PC1. So:
> >
> > Tested-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
>
> Thanks for testing it so quickly!
>
> I was wondering if you got pinctrl errors on the bootlog before applying
> this patch series.
>
> rgmii2 pin group is given gpio function so calling it from ethernet node
> would cause this on my TP-Link RE650 v1 which also uses the rgmii2_pins
> as GPIO.
>
> [    1.177349] rt2880-pinmux pinctrl: pin io22 already requested by
> pinctrl; cannot claim for 1e100000.ethernet
> [    1.196966] rt2880-pinmux pinctrl: pin-22 (1e100000.ethernet) status -=
22
> [    1.210312] rt2880-pinmux pinctrl: could not request pin 22 (io22)
> from group rgmii2  on device rt2880-pinmux
> [    1.230058] mtk_soc_eth 1e100000.ethernet: Error applying setting,
> reverse things back
> [    1.245853] mtk_soc_eth: probe of 1e100000.ethernet failed with error =
-22

No, I was not getting any kind of error since when I test your last
patch series I was not experimenting any kind of regression. I don't
have any issues now also with your new patch series. Your new changes
make sense since as you have said "rgmii2" pins are requested as GPIO
but it seems are not really being requested? I don't have time to
check the datasheet now but will try to get time to see what is
happening there.

Best regards,
   Sergio Paracuellos
>
> Ar=C4=B1n=C3=A7
