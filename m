Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0088157C5
	for <linux-staging@lists.linux.dev>; Thu, 10 Mar 2022 11:46:25 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id j5so4244379qvs.13
        for <linux-staging@lists.linux.dev>; Thu, 10 Mar 2022 03:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=e8H4NZlGitWERpnrJB+gF8De5fWTQAOUqhIU4m1vOsQ=;
        b=X6t2JrBRp8pMNM9gpNdKqCUWs+MV0AmjiXIPzniKVNrSLn4Og8oEZTxi2z/ozKsBtc
         lFHxShE/1BAAyfPvmw3CB3dCRhDqcIcjSlmLfrVHNn6Svp1lwefQzBBy+UUvE/ih8Zy1
         2z3jpoMnlowRlKJYFfU/ju7K6j5ce2sqtn4s01tMv31/FsUrwwn/363c87npth8JHe7k
         VOpg5FuTrc0AYYCZ+B7GCRLfGom1FtbdxdERyVJpztJ8MlKC6vEk2yJvngi4Gk9BhuGN
         u9U2+G14/L9W4dSHnpxCguiGSqhIDj4IwQDCl06JK52CLfJY19rQa0mEEfJmyyazkiBD
         BD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=e8H4NZlGitWERpnrJB+gF8De5fWTQAOUqhIU4m1vOsQ=;
        b=Q4xTIb+VpyQQnqej+BJEZ9v0aXQOuJr5/zjOrz2iYtfEPebgbXVJsrPaUl8M+UjSsG
         XZQm9BrHyFOQII+0+pOMmYEM3P6yISwaDabMUJGqjuIRpNKMFgE2nbt4Ro9UCylJam6c
         ZN1zPdb0Y07+P+X6Q1u1yarAMGxkO3QhuRtAH6dCHyCTAqtE5VzDobn6BCkZIwQC58pW
         O2FN4gKpxd+q0uLqFK0NS8b71K2HFIvj3MVPUJSInP5U/CkIMA6WUS78UyuIYv9mopQl
         7HvjKBSkSTZPC8VSTnE7PUF64epewJTVPFr0Zvv8JlYLnaIvPRdNIWNpt9QrH6+kYy6o
         WAUg==
X-Gm-Message-State: AOAM5304kQTTpdUfhj5Ieh9YuLoxDoAi9sznH+4WlYri0mYYhZDh+asv
	rp9radjpzEaR1DGQhPWxfhYpeRvBRcP7J12AgCY=
X-Google-Smtp-Source: ABdhPJzZxWS8P9K2y4CcznXQgKyvVgkqE/HezXyum8gJ7+HSNRcjZdsFq2ahbKBwxOwYL7CssMd7D630cNww0S+YeO8=
X-Received: by 2002:a05:6214:519a:b0:435:4de5:c9dd with SMTP id
 kl26-20020a056214519a00b004354de5c9ddmr3484709qvb.118.1646912784923; Thu, 10
 Mar 2022 03:46:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220310113939.6601-1-arinc.unal@arinc9.com>
In-Reply-To: <20220310113939.6601-1-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 10 Mar 2022 12:46:14 +0100
Message-ID: <CAMhs-H-zcuoyK_7bVishVx-q26F-NnswAFa+RJCZ6CrGK9-WRg@mail.gmail.com>
Subject: Re: [PATCH 1/2] staging: mt7621-dts: fix LEDs and pinctrl on GB-PC1 devicetree
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, NeilBrown <neil@brown.name>, 
	erkin.bozoglu@xeront.com, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arinc,

On Thu, Mar 10, 2022 at 12:41 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arin=
c9.com> wrote:
>
> Fix LED and pinctrl definitions on the GB-PC1 devicetree. Refer to the
> schematics of the device for more information.
>
> LED fixes:
> - Change GPIO6 LED label from system to power as GPIO6 is connected to
> PLED.
> - Add default-on default-trigger to power LED.
> - Change GPIO8 LED label from status to system as GPIO8 is connected to
> SYS_LED.
> - Add disk-activity default-trigger to system LED.
> - Switch to the color:function naming scheme.
> - Remove lan1 and lan2 LEDs as they don't exist.
>
> Pinctrl fixes:
> - Claim state_default node under pinctrl node.
> - Change pinctrl0 node name to state-default.
> - Change gpio node name to gpio-pinmux to respect
> Documentation/devicetree/bindings/pinctrl/ralink,rt2880-pinmux.yaml.
> - Sort pin groups alphabetically.
>
> Misc fixes:
> - Fix formatting.
>
> Link: https://github.com/ngiger/GnuBee_Docs/blob/master/GB-PCx/Documents/=
GB-PC1_V1.0_Schematic.pdf
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
>  drivers/staging/mt7621-dts/gbpc1.dts | 31 ++++++++++++----------------
>  1 file changed, 13 insertions(+), 18 deletions(-)

Don't know if this needs to be splitted into separate patches, that's
up to Greg, but FWIW:

Tested-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos
