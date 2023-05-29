Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26657C
	for <linux-staging@lists.linux.dev>; Mon, 29 May 2023 21:48:47 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6260a2522d9so16690356d6.3
        for <linux-staging@lists.linux.dev>; Mon, 29 May 2023 14:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685396926; x=1687988926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=08Mzl3olZrQOHABKKtfgvLwAuZZZ6d+NTExTD0DrCRg=;
        b=CdGg/JWqLN5soex3LMee0rfi1KAvv7fDyjKvUWXLx8/tYWHGOyTBfnjTZjSXM6jPnh
         /UO4wDAisB6fI5zKAXPXHXfU2414bWiao+qyNitZuORF9FbLWdarpn5ypGTyNrYCKKlZ
         p/YJDowiij9EU7V6+m64oim04QUUmoKjWkcpfMQNbNUtZhjXuDG60RAb2fWBm7mFIQUa
         5jT018NwCMJr6+rA1zOnSNXPzOTIxpQHKnKkTvSkTtbsZiJ+aozcxecMf/goKKQSFlT9
         Vx4UnpVpCs8Mj2SNHqEtH2EhyMPcPtnnyyZpMYBiovWfmWqlvKQ64wV49j628N5Ki/KJ
         wfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685396926; x=1687988926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=08Mzl3olZrQOHABKKtfgvLwAuZZZ6d+NTExTD0DrCRg=;
        b=TWBnJe+u4ZXYnZ1x2yQlpFp/1sI7TJmutdXIDXGEp/zotPyUpmY80D899uptR89p27
         gbN9kfvpzlZW0dzenjQUe//nIeXsh4K2pc5kTql/1Dd/a30saFlwIwcsA4HBql749yz+
         pxpux2m30nHvR1ctrNi0XMOGihUOf/bnBwDJrT10otscHl+PU/iH4VsS3nhVVdIcyedp
         wTrQX5tPHUDLKUhYnmDdUGqxq/Po264p7uBdvXnb91eMbazsVQlojhAdmQYKsg8qITFO
         KY4RGLeMqlojr02dDeZe9JLKgy8O7Nq8Htkj41Bo5d4+I0H8V//YNRUCFvexyHXStLxy
         0Wpw==
X-Gm-Message-State: AC+VfDwiHA69ZCwhWOA9d6bSDVBxov6yiS2jc2xRxfXfTwm8q35D3IET
	W6FPjzRxMo4jvaInSHFZvjyIixc7zoNIZVvWpu0=
X-Google-Smtp-Source: ACHHUZ4qkjaOHJeDDdowAZRL3hNcl8NFW+2Q4u4LVzHWZtUXnH+lGBz6KRxShWt2eILJ5Nv5hiEu8pC6Bo252MofWpc=
X-Received: by 2002:ad4:5cc1:0:b0:626:1ca6:5efe with SMTP id
 iu1-20020ad45cc1000000b006261ca65efemr132363qvb.9.1685396926541; Mon, 29 May
 2023 14:48:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230529103741.11904-1-hdegoede@redhat.com> <20230529103741.11904-22-hdegoede@redhat.com>
In-Reply-To: <20230529103741.11904-22-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 30 May 2023 00:48:10 +0300
Message-ID: <CAHp75Ve6rWtkDowBS7z1f=Ot7h8xmXTws8L+Z3eXEfFum2pBcA@mail.gmail.com>
Subject: Re: [PATCH 21/21] media: atomisp: csi2-bridge: Set PMC clk-rate for
 sensors to 19.2 MHz
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 29, 2023 at 1:39=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> The ACPI code takes care of enabling/disabling the PMC clk(s) for
> the sensors as necessary based on the runtime-pm state of the sensor.
>
> But the GMIN code this replaces also set the clk-rate of the PMC clk
> to 19.2 MHz. At least on BYT devices the PMC clks may come up running
> at 25 MHz instead of the expected 19.2 MHz.
>
> Ensure the sensor clk also runs at the expected 19.2 MHz for sensors
> using v4l2-async probing by explicitly setting it to 19.2 MHz when
> enumerating sensors in atomisp_csi2_bridge.c.

...

> +       ret =3D clk_prepare_enable(clk);
> +       if (!ret)
> +               clk_disable_unprepare(clk);

I'm wondering if _enable / _disable required.

--=20
With Best Regards,
Andy Shevchenko
