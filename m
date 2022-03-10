Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066C37A
	for <linux-staging@lists.linux.dev>; Thu, 10 Mar 2022 11:50:42 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id 10so1824038qtz.11
        for <linux-staging@lists.linux.dev>; Thu, 10 Mar 2022 03:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yGjXVnthc9FJJFEnU22SOyy8i58RQ0tF13uxKol0Exk=;
        b=Lt8c4WUEYWZ9Hs96hpq413Og4BpVPck2bwDwakC/JoJRVi0opX5Tt1ha/mFRybgsjT
         w69Fl2OyzEQrZemdxnLTwjsOflDYO3wZEO53UmN+M3RpFryW7E4Ixv5814jX1d3KEEUR
         2pIlsMRlF35y5ozTcOlx3c9SCrJ+sVmTOBo50QG8us0fBiguEVOAJIXXq+gCc4BV90RB
         6y/MYdTjRqJoVaFabCVQiMp8XhWgF13k0N4ZQyxhpSA/udDfyIies7fpdsJPJicFRDbO
         jqB8crZ+MnP80ZecMKJ/z09QKEmdCObcqT6lKfXR9v98AZLJKPEYycG3Loc1N5wnFWzp
         saFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yGjXVnthc9FJJFEnU22SOyy8i58RQ0tF13uxKol0Exk=;
        b=VQ4f+vufvvw+l7Y6kz7wijrXmEfvkyhoPeu7Ev9PSoQ0gf9qWFSKPUBKpQVpcfgNlI
         qtJNtNAjgJkRC05AFblvSIFhGulYoOCeluHv+uw7TonnDLxd/N72YlVJEwzKSdA8h04F
         +GKjsDzsbLUNDAO/U5i0ciyW8M9h4tNqvREbpQPh9LHb8YXDbc3valcTFoi2QjFjqe8W
         wY7BSVke8ej7J9l8J5g8BdnJITyLXezgzdEJs+XAU+dLvTF0WMUQgxBZ1verD9ILs9Lh
         YxKWU96oUrSxZ6wTRDGSEBh8C06rbjltgAAwVrNL2RjXxSte4qRowQH/TiNVdKUS+ymA
         Nj7Q==
X-Gm-Message-State: AOAM532QtTxn/3tcSAO6SquKGhVI/ngNLEopG1rXaKvZ9XJS7AeRaS4j
	jnKU3RSOIBnlju809yuzjrI5uNW0aCITuwpt2mk=
X-Google-Smtp-Source: ABdhPJyPkHU1sD6mff0L4J07qmZMTSCy4l3AibQ28eR3+e3X9+fHT9rRpbJDxNZqDZuqhc5AWDG4NwcpAWVzTemklTo=
X-Received: by 2002:a05:622a:1454:b0:2de:922e:3209 with SMTP id
 v20-20020a05622a145400b002de922e3209mr3412823qtx.471.1646913041840; Thu, 10
 Mar 2022 03:50:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220310113939.6601-1-arinc.unal@arinc9.com> <20220310113939.6601-2-arinc.unal@arinc9.com>
In-Reply-To: <20220310113939.6601-2-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 10 Mar 2022 12:50:30 +0100
Message-ID: <CAMhs-H-pUWadNi7ZhuVEh2uhvqkUJNmsS=uYZQi8yNoFTch3MQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] staging: mt7621-dts: fix GB-PC2 devicetree
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, NeilBrown <neil@brown.name>, 
	erkin.bozoglu@xeront.com, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arinc,

Overall it looks good. See below my concerns.

On Thu, Mar 10, 2022 at 12:41 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arin=
c9.com> wrote:
>
> Fix the GB-PC2 devicetree. Refer to the schematics of the device for more
> information.
>
> GB-PC2 devicetree fixes:
> - Include mt7621.dtsi instead of gbpc1.dts. Add the missing definitions.

There are pretty much the same definitions. Should we really include
mt7621 instead of gbpc1??

> - Remove gpio-leds node as the system LED is not wired to anywhere on
> the board and the power LED is directly wired to GND.
> - Remove uart3 pin group from gpio-pinmux node as it's not used as GPIO.
> - Use reg 7 for the external phy to be on par with
> Documentation/devicetree/bindings/net/dsa/mt7530.txt.
>
> Link: https://github.com/ngiger/GnuBee_Docs/blob/master/GB-PCx/Documents/=
GB-PC2_V1.1_schematic.pdf
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
>  drivers/staging/mt7621-dts/gbpc2.dts | 107 +++++++++++++++++++++++++--
>  1 file changed, 100 insertions(+), 7 deletions(-)

In any case, as I have said, looks good:

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos
