Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE41A46
	for <linux-staging@lists.linux.dev>; Sun, 13 Mar 2022 11:56:12 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id 10so8582196qtz.11
        for <linux-staging@lists.linux.dev>; Sun, 13 Mar 2022 04:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SaM5x3nRmGs5Nm9TIzUWYkM/6qv++M9jrBVto7YGwsU=;
        b=Zi4i3lmaQsyAbMe0ZggRFys4DpSPf+990g/yiJkm5W+h83QwaB2V5vDhiYfHc+HfcA
         p8OqNlvTRS5iWZN7XkHObViPPczfVutt0boKEKnlIsxOGkcm8NGCzQ8DdI4ifXA85MSO
         /uDOtyiyzetU8aIepmJjMMS6x/vuTYh9F1W6Nr0UZQi9ExE0ZfQV0oBpYUgxxkReRShC
         0KC4MpamvRlN67JOR3dALDNysT1VuQ5+7cNN7ghZI7dEbtoaG2VdIhey0QYg66Elf7zV
         Me9kkbazZbyLflWfiwZMVZeNEY4PZhIWBYs7DdzbDii7DIA/Gbu6QcWL9TtD2cPG2kHX
         HrLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SaM5x3nRmGs5Nm9TIzUWYkM/6qv++M9jrBVto7YGwsU=;
        b=Ji8l7JgZtycpZLvib+tkFq1/ouMWuOjVykGhnDwSPv9SNf8BhQu7aW7hsjR76O1n7I
         B02K43dvVvPQCowiSKyKolzNWq/fKKW4GWjpK/IwuNgTeaGkEyfT9dJV8rwMKMScu78g
         3dEZJT/2GYAD9NIQS6AVeA1/qick5tNcVu+0jBE5iK17bSYtqjFr9BMY8jUf09sWyDWT
         49k7LlYtTWhFuwH78X8k7U9uNVk6jVfPGRmIqiBTgyUcDtmphd05osEpSpvsrWOBWunt
         axVutNQI0sy7BCSfHrRpjV66ASYNVcqO0O1Rt3cQrLfhD/DPJcezNY0RTUSn12y/RwKF
         I2rA==
X-Gm-Message-State: AOAM533HslpIUT4eqkD6R4jVqG2Cv1OKp9jz1M2uLhldCGQcwu2TENE+
	zqVzT8XiX19/SHZ8Mc4wXCNJtD+HCftRbgI8pLbTdrNY
X-Google-Smtp-Source: ABdhPJzYNufxAREMECDAYlpNh398ub0dz/5lx4FIQ+/NZQ/q4wMewL+0mWq7FbpfbU+187+neFlc0IsFK3UA5dt9NhA=
X-Received: by 2002:ac8:7f51:0:b0:2dd:dbca:1f40 with SMTP id
 g17-20020ac87f51000000b002dddbca1f40mr14698162qtk.463.1647172571027; Sun, 13
 Mar 2022 04:56:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220312091832.6269-1-arinc.unal@arinc9.com>
In-Reply-To: <20220312091832.6269-1-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Sun, 13 Mar 2022 12:56:00 +0100
Message-ID: <CAMhs-H-VkeP5rZO0iQepxdWZn_ij0HDp-wScR7HQkSo0t6SmrA@mail.gmail.com>
Subject: Re: [PATCH] staging: mt7621-dts: fix cpuintc and fixedregulator dtc
 warnings, fix xhci
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, NeilBrown <neil@brown.name>, 
	erkin.bozoglu@xeront.com, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 12, 2022 at 10:22 AM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arin=
c9.com> wrote:
>
> Fix the cpuintc and fixedregulator dtc warnings:
>
> Warning (unit_address_vs_reg): /cpuintc@0: node has a unit name, but no r=
eg property
> Warning (unit_address_vs_reg): /fixedregulator@0: node has a unit name, b=
ut no reg property
> Warning (unit_address_vs_reg): /fixedregulator@1: node has a unit name, b=
ut no reg property
> Warning (unique_unit_address): /cpuintc@0: duplicate unit-address (also u=
sed in node /fixedregulator@0)
>
> Remove the unnecessary status =3D "okay" property from the xhci node.
>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
>  drivers/staging/mt7621-dts/mt7621.dtsi | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos
