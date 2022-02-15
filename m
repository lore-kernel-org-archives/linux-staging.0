Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EE8A2C
	for <linux-staging@lists.linux.dev>; Tue, 15 Feb 2022 08:36:02 +0000 (UTC)
Received: by mail-ua1-f50.google.com with SMTP id b37so9471077uad.12
        for <linux-staging@lists.linux.dev>; Tue, 15 Feb 2022 00:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=awPMUppyrjTgfFAxbw1NqETtN/eKCYvA5Xo4+XxINKI=;
        b=mVf5w2e3/Jjrt/n0/eg6OmjAf68YchxW3xFK/WQTCrcLiYMigj33voEOIQsaI+UvbE
         OrOTi/bzRXtSxqwAJXHnnfO0d4ZDBbkUcg8ccTNDAxjzsFGvGI9H7DqGYU0vWVmsjtku
         /wFQ0ll5jndKOx7kHcL1VqM2BPJv/9Suyq6fgQssfAwGe3165cf0SMB8bW9T5xhfkdSy
         ApHSVqExQTQmyxxdqQVIvUlOZlPlccrodlJh/vxG2n1BOFlPhy+JooLOmo1hVsVCyT1n
         o22TeTbMxR+wiROPfwyMsFxtU6uG0Sj2Iq5AJ+W19CGGb+wGnv947QJ71M/jK56Of9xk
         KIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=awPMUppyrjTgfFAxbw1NqETtN/eKCYvA5Xo4+XxINKI=;
        b=flGgiEhm3dhNJ6mHL4++urCCEyQ1Jy7i0M2c107PnCKoaO+LhiCCF/bVGzE2cL0pg7
         HoZWFcBfoJOOaZy8o9rxuJs8WU8+JVI3n/Yk5GdJKtdRmrL/JnegfQqsx7acyUWcuqeq
         jq/5RKxQo7pTinFa9N0/UPSV1zSKllenOalhvriNMWdbgNTJhJ7D8KFBjhBRYS31E6sc
         UO3M1VP9kgLD/M4lj3rZkYENMh+6fgNd5aLsnvZkp8p3GbrdH6gB9Myq2hJxRM6qG33q
         EzZdfkltjQO41/tIIVIS+fBvD5M8K8MZhkHsC9KgauPtAf5naoUzhZlCfGYPlawGKP8Q
         XJww==
X-Gm-Message-State: AOAM533Ix2FtXhexxKDI2S7Xw+ljiyeYV9i3fxfJ9+tmlHACREsma4Gn
	hJA9JIJdwILGTIkF42+GU+LN+f1qbFbPI88kzE0=
X-Google-Smtp-Source: ABdhPJxeCKliV+TFPRRCNJ6FefD9XrG0XkDBDC9cjTegdg8G1eoPB49c9RAJpgqyThCkp785YPwsNM+LIfGoGmvo71k=
X-Received: by 2002:a05:6130:92:: with SMTP id x18mr1080192uaf.66.1644914161878;
 Tue, 15 Feb 2022 00:36:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220215081725.3463-1-arinc.unal@arinc9.com> <20220215081725.3463-2-arinc.unal@arinc9.com>
In-Reply-To: <20220215081725.3463-2-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 15 Feb 2022 09:35:50 +0100
Message-ID: <CAMhs-H-74bK3m975Dtmg2zPrGjmqzSd+Tb_qdUV14yJBAWRQbw@mail.gmail.com>
Subject: Re: [PATCH 2/2] staging: mt7621-dts: do not use rgmii2_pins for
 ethernet on GB-PC1
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Sander Vanheule <sander@svanheule.net>, 
	NeilBrown <neil@brown.name>, DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	erkin.bozoglu@xeront.com, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Arinc,

On Tue, Feb 15, 2022 at 9:18 AM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc=
9.com> wrote:
>
> GB-PC1 uses some of the rgmii2 pins (22 - 33) as GPIO. Therefore, the
> rgmii2 bus cannot be used on this device.
> Overwrite pinctrl-0 property under the ethernet node without rgmii2_pins =
on
> the GB-PC1 devicetree.
>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
>  drivers/staging/mt7621-dts/gbpc1.dts | 4 ++++
>  1 file changed, 4 insertions(+)

No issues in GB-PC1. So:

Tested-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos
