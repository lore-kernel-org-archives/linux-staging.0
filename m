Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C0F9443
	for <linux-staging@lists.linux.dev>; Sun, 13 Aug 2023 20:13:07 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-56c96982829so2876234eaf.0
        for <linux-staging@lists.linux.dev>; Sun, 13 Aug 2023 13:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691957586; x=1692562386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXhA9VRypepdUYlLq8uxDNx03e0EEVDPrRCX89Gek+Q=;
        b=avjWWF+CYtAUxIPOADKviSekp/KNT7LY5C4A145WF5cFRdYA6xlaUHy16HCrvKK8OW
         KQH4V4G2RXbS3+D+JaSBD8s9bhDaD1MSrFaSqcCi948CJiHr81aZI4jLiQicPXMfsZQ4
         bn5aWuUA4PsKPIsgDjOBVsMRqbzYvNnBnGn1F0glYZ0e6mWyB+tfAkZo+PIROcbDm1UU
         A8Zvfy99aKzR+VGJAR9ujIifAJk7IHh0O8lyzIZvddiB8IUqiGRxuPKB6Z8Ru5VmWBgf
         dMTUyajRgWjPF39/HW46B7dc5+pgXiMhe+1I+ie6JWSSMiHHiCj3GF9nKcrBiTsVxX1j
         jA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691957586; x=1692562386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rXhA9VRypepdUYlLq8uxDNx03e0EEVDPrRCX89Gek+Q=;
        b=eKgg8CvP8WNMOvR9KGdyFMy+dMxmxO8vHFSRpJMitQZB0LfTVsUaV+7RIigJSZD1C3
         cUD+3OB5Xl737vD0OABXIYWZJoT+s4h2+BRl0JMSsRGVY6iKhmZkXFZDbs/HOrfYe8HZ
         1k5T86Tmw1q0//8fQRPAHc5gWCrP3Im4us68ezeeCBOBNyPoEw0WQeJaWMWADw1pdCsp
         cUifjL68NWHpH5C4CzVTAsSYJlY2RVr54zSazOLl2K48x4pVE+MU0aJSBUW292It1wYP
         f1ZHu0SINJZiEdYmOy39IrwmccPm3YP88Wyzh579n8Sc2pS3qt9GPwyZWtrltrG0XqGk
         u0iQ==
X-Gm-Message-State: AOJu0YxxNNi84orGOwImtVUtaySF2bP3CnswHICjZBZ3K5ATr8PKcjrZ
	i02WNlpp+G8T/HDtBqZudEHCkn8vfcbPRW1dxNM=
X-Google-Smtp-Source: AGHT+IGYWJNDAzwfNOhWGVkDMzwo2Wl0/fRXN16lRNd+1y1bkDOswhTde9q5Z9pka+YtmXHDLv1VPUPEIjmf/x93JuA=
X-Received: by 2002:a4a:2a1d:0:b0:55a:f44b:43cd with SMTP id
 k29-20020a4a2a1d000000b0055af44b43cdmr5301262oof.7.1691957586149; Sun, 13 Aug
 2023 13:13:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230812133628.355812-1-hdegoede@redhat.com>
In-Reply-To: <20230812133628.355812-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 13 Aug 2023 23:12:30 +0300
Message-ID: <CAHp75VcrjE1dBCrJ-=orACQaMNsm5i3qw-6s2Z0YLdKV0_eXvg@mail.gmail.com>
Subject: Re: [PATCH] media: gc0310: Stop setting v4l2_subdev.fwnode to the
 endpoint fwnode
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 12, 2023 at 4:36=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Endpoint matching is now handled by the v4l2-core and drivers no longer
> should set v4l2_subdev.fwnode to the endpoint fwnode.

...

>         dev->reset =3D devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HI=
GH);
>         if (IS_ERR(dev->reset)) {
> -               fwnode_handle_put(dev->ep_fwnode);
>                 return dev_err_probe(&client->dev, PTR_ERR(dev->reset),
>                                      "getting reset GPIO\n");
>         }

Now {} can be dropped.

...

>         dev->powerdown =3D devm_gpiod_get(&client->dev, "powerdown", GPIO=
D_OUT_HIGH);
>         if (IS_ERR(dev->powerdown)) {
> -               fwnode_handle_put(dev->ep_fwnode);
>                 return dev_err_probe(&client->dev, PTR_ERR(dev->powerdown=
),
>                                      "getting powerdown GPIO\n");
>         }

Ditto.

However, no strong opinion here as it is more style thingy. FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

--=20
With Best Regards,
Andy Shevchenko
