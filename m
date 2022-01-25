Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483BA2C82
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 14:03:58 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id u6so37636900uaq.0
        for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 06:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5RHTJ2uwJKNvUDoo3i/C2Yj528sdHCaQSA2P29J8IWQ=;
        b=c2nZLw/Vz7DW4+OrGMdP9eLIIq7m9y7mvaOSv/hfwPhxtLmGH8Xz5Esxj3FmyYKuDZ
         9IPyMpt+R4+HYkNOVxEfXp/l+bCEemg7P2oLqXOqo7zxGKq8k4fhj+KP9tAs8a+Dn1y0
         tIOhvVHZhfBim4OEktrpMKF9sAy+nZ5r1n0qjllx/36BxliPsic/+qhjIaoi8cD/W9Fv
         zW4w35jRmukSMLQztOnAh2n1HucmsmR9mp0f5rO+wyBE5wtBocKc3OAEfcipnGPZoXO5
         ude17BbEbYSxvUYAFk+L9Lgjs4psN7ZdKiyDNWj0CQOfa1IvFo9eGXchFS7uTRg9YptY
         FYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5RHTJ2uwJKNvUDoo3i/C2Yj528sdHCaQSA2P29J8IWQ=;
        b=plAcCJ4sxPplYpt+6DKwwLUvs8yy8KP/QW9HPcYMSPXfcaCk6//Il6lYt/rbH5cj+v
         0A8cdXjkWqQAXQ2UwgWQYIqzeotgB8czdCpR2CAHcBOyOWywEjUrWUnkTkcacvV5SGDI
         i1wRCm2Y5IH61tXbNJDINX833AT8Mh0ILP5OtOsL+jsu6VZvieEhnwzaBdBn6LkhV+zV
         FmLyO/IzEc3RuHNqfSETDgXz5wOG7KHMRErlKXFySqqQMki4o0KQbXl+Wshp4F+7kazb
         r6FFQszs4T41Dyo63+9udopIdU57JisiCjcfmzUsITsrDRhvHn+zFvdF2fob04HkFEp8
         bsLQ==
X-Gm-Message-State: AOAM530f5fkcY0j2HGs1Gd7Rusf+Qk5WecTXVWflQY2O9BLbQ4JQWWcl
	Ix9e7ltOVmfgKImT7xCZYQXTeFo7zHlOIXKwJas=
X-Google-Smtp-Source: ABdhPJzdPjSAgkuxTYXSXAjNUcCVmPR5snKR1kwpEVMjNTor+zlx/ihvndatfzaJzApYHp1Z6KVDB80Frs1fC3P05QE=
X-Received: by 2002:a67:fdce:: with SMTP id l14mr1859923vsq.70.1643119437214;
 Tue, 25 Jan 2022 06:03:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220124124351.4604-1-arinc.unal@arinc9.com>
In-Reply-To: <20220124124351.4604-1-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 25 Jan 2022 15:03:45 +0100
Message-ID: <CAMhs-H9qkd-uy75d=NPLc5Azt3ejyW5zstpq75=i-e8iR4Xaow@mail.gmail.com>
Subject: Re:
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, NeilBrown <neil@brown.name>, 
	DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arinc!

On Mon, Jan 24, 2022 at 1:45 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc=
9.com> wrote:
>
> Hey everyone,
>
> In preperation to mainline mt7621-dts; fix formatting, dtc warning on
> switch0@0 node and pinctrl properties for ethernet node on the mt7621.dts=
i.
> Move the GB-PC2 specific external phy configuration on the main dtsi to
> GB-PC2's devicetree, gbpc2.dts.
>
> Now that pinctrl properties are properly defined on the ethernet node,
> GMAC1 will start working.
>
> Traffic flow on GMAC1 was tested on a mt7621a board with these modes:
> External phy <-> GMAC1
> PHY 0/4 <-> GMAC1
>
> Cheers.
> Ar=C4=B1n=C3=A7

Nitpick: next time try to put also a subject like "staging:
mt7621-dts: cleanups (or whatever)" in the cover letter of the series.

>
> [0]: https://lore.kernel.org/netdev/83a35aa3-6cb8-2bc4-2ff4-64278bbcd8c8@=
arinc9.com/T/
>
> Ar=C4=B1n=C3=A7 =C3=9CNAL (4):
>       staging: mt7621-dts: fix formatting
>       staging: mt7621-dts: fix switch0@0 warnings
>       staging: mt7621-dts: use trgmii on gmac0 and enable flow control on=
 port@6
>       staging: mt7621-dts: fix pinctrl properties for ethernet
>
>  drivers/staging/mt7621-dts/gbpc2.dts   | 16 +++++++++++-----
>  drivers/staging/mt7621-dts/mt7621.dtsi | 32 ++++++++++++++++------------=
----
>  2 files changed, 27 insertions(+), 21 deletions(-)
>
>

Thanks for doing this!

Best regards,
    Sergio Paracuellos
