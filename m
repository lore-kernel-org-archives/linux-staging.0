Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9EF7471
	for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 10:22:24 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-62385a3106dso13819776d6.2
        for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 03:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684491743; x=1687083743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtpbF2tXZUjlQDCpCAkUtufwtzGeJXDTY4JTRH+Iw2M=;
        b=E/YwHjpl1qYGPpGxLSzw0wb2VqIy7VIX+wKx+ahQgZ8egNd3byKgpaulAKmKe2pcas
         +AhHbtPRpOAigd+9SrK48SeNLfYhX9LdHI8p/gF8FHM8Gr00I+XceSmIpN1z4UuyjCdF
         H/3Ly/GIeSj50sGVLp8S+asXWsUx4j7pvPNRwJlJVznL8E05801sQjH8BT9FF624xnc9
         rAbrsrQrA5Ovs5Prj9xbnQbQnm9uKvlwh53q+0v9oHD/BX6RlNQnzYdqSIKKbCHBfinU
         UimCASxpDRGEBpLog6NQ2wilRIrqu0D07JYEKzk+4tcLylSZ+MxGL06L/jZH1Pbaiomr
         mbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684491743; x=1687083743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GtpbF2tXZUjlQDCpCAkUtufwtzGeJXDTY4JTRH+Iw2M=;
        b=fGc0uSz6Lf+SCWCW52/LuyRQF3ZNvNTGxs0JmGT9BJyNUafuxpd85F3g5palqTe/xd
         duIJaofWabACyV+lN2RMp5UZyBl/BjTeC3z1tY/a7Da1dpHYouPHCDiYrKsNlqCZX5xx
         aApoC356KXu3rXFxTNdw2UATecB+jMrGCREeULjw4w4fV4zmg4+vzejrbwiZSNaR9vFx
         05qM7U+GBvqu7Pxk7CHLbMVrU/h8gaQfqRSTdaModG6OA4vTpbyZsWeM1sJ/JK943lH4
         g1G/XupfUIj2QvLEPjF052WECEoJ7yZOTIHP17dTU0pQ6LuP5YWqXGyqas7wR+0/Ye+x
         /uhQ==
X-Gm-Message-State: AC+VfDw5pB95mtETxnubrMW5uXSjZjz5asPBBhSVxUN/rm+t5H/PYsgH
	tYz43Xnwi93Yn4EHSIBidW8O1SIG7uig9GxayLg=
X-Google-Smtp-Source: ACHHUZ4t6E8dc6ID1cRXLGrV7UctxFtyj7367GxYtrr6TL81HddZiVacCWbw+MgjcB7tTQ5Of6u8+tpkOcxOwWMKN+M=
X-Received: by 2002:ad4:5ced:0:b0:5c8:403a:22f8 with SMTP id
 iv13-20020ad45ced000000b005c8403a22f8mr3500950qvb.5.1684491743577; Fri, 19
 May 2023 03:22:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230518153214.194976-1-hdegoede@redhat.com> <20230518153214.194976-2-hdegoede@redhat.com>
 <ZGcl7+cKu0/h43YC@kekkonen.localdomain> <cb4e56fd-0745-6040-6d93-bd8eb1d23ce1@redhat.com>
In-Reply-To: <cb4e56fd-0745-6040-6d93-bd8eb1d23ce1@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 19 May 2023 13:21:47 +0300
Message-ID: <CAHp75VddE8Z4KxuOVT2_YbNrzCz5_oVmVs6RaqjffJtaT6xabA@mail.gmail.com>
Subject: Re: [PATCH 1/9] media: v4l: Add v4l2_acpi_parse_sensor_gpios() helper function
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, 
	Tsuchiya Yuto <kitakar@gmail.com>, Yury Luneff <yury.lunev@gmail.com>, 
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com, 
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 19, 2023 at 11:55=E2=80=AFAM Hans de Goede <hdegoede@redhat.com=
> wrote:
> On 5/19/23 09:31, Sakari Ailus wrote:

...

> And if we need some changes anyways just adding the single line call
> to the new helper seems both the least invasive and the easiest.

I'm on Hans' side here. And yes, many drivers (mostly in the ASoC
area, i.e. audio codecs) nowadays have GPIO ACPI mapping tables due to
lack of _DSD in ACPI. It's a problem of firmware which we can't avoid
if we really want to support this hardware in Linux.

--=20
With Best Regards,
Andy Shevchenko
