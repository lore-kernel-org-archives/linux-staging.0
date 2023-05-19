Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424303D392
	for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 10:33:05 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6238cd06d5fso17313856d6.3
        for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 03:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684492384; x=1687084384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E3rL7BulhM5pWVN/MwQK8G26erANs0W0dCbfkg7a2gM=;
        b=E1cT5EhhC0et5CKM2hr7bE3qmcQxrxQXBHxcEE1vXJvWPl5f0PrbKXNIVW7vH2tmpN
         0oTcIZDHWvZZ3lBcAzItrC8/comMWGOM1h+2PihpAyo0k1pPqNZRHhrMR6+7BGPlTLKi
         5sSzd2odk1/wZrC76NHdpWu9w/bWWrNqAeikGYAIiQzUHMnauz1gz9JVViKrM8Jdwnez
         Okh+iKXMyPLDijeVohuBkiuoSm6J18/y7XTXkLfKxJg7M0mWKG5yXRqj33ZzntswOE1y
         YGYTgnURekbuOFXgpWO9hVB1orhnBcQRJbM2VHQIJZ+gJLrjoUb/fqWanQLYX3rze+pQ
         7vgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684492384; x=1687084384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E3rL7BulhM5pWVN/MwQK8G26erANs0W0dCbfkg7a2gM=;
        b=i/xJXUKlbTdxVQ2z1wZaBFIPLjdoZEbvm3eZB5lfXlXpdSz8AjiRA1KqBUPhza0d5A
         NWE0yICC4qQh6VWeC+M5Sefl+vXPlw5Jxm9T54V+Dd/hqCNORalZdQGeg7/sq//xaMW/
         VEfMCyUe3xYHPPvoBnArJk59VmBooMbQ7eoGPEjjeFQok9nPDq90jFKsADawqeJy6GXV
         BmwnyfufIOyS4Lton6DrCb0dOIZZ9iYnvEIvMU20r4Cr5p2B0ahSmLUyCoqcZwYbR54/
         P0DeQIhPjsCax4AtcFQ+H8CasFh/cToxDx3bYeqe6XC7kghYe6f+8l9z1QFW6q/LetME
         UcUQ==
X-Gm-Message-State: AC+VfDxb9Gf0FcqoEq+WSLdN0nX30TE4HGPjOHZlMz/DpZw2T9xcsNBx
	ssEHrHNMRAlvIDDiLnsYC3tJvz9Y+o+SzHm68+8=
X-Google-Smtp-Source: ACHHUZ79fk57WiN9IsKTbA5QWQYWE0tOwazGj1aGd3G1SO1So8vNiH+iKhRqGv/IkOWTOzTKHsThh8K2lne5W0rfosk=
X-Received: by 2002:ad4:5be5:0:b0:623:640d:2b30 with SMTP id
 k5-20020ad45be5000000b00623640d2b30mr3155718qvc.52.1684492384041; Fri, 19 May
 2023 03:33:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230518153214.194976-1-hdegoede@redhat.com> <20230518153214.194976-8-hdegoede@redhat.com>
In-Reply-To: <20230518153214.194976-8-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 19 May 2023 13:32:27 +0300
Message-ID: <CAHp75VcnXs3wmE0waf6oQM2-sax83RaEh5ESi-jN9f7FpQ0HXQ@mail.gmail.com>
Subject: Re: [PATCH 7/9] media: atomisp: gc0310: Remove gc0310_s_config() function
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 6:32=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> gc0310_s_config() used to call camera_sensor_platform_data.csi_cfg() back
> when the gc0310 driver was still using the atomisp_gmin_platform code
> for power-management.
>
> Now it is just a weirdly named wrapper around gc0310_detect(), drop
> gc0310_s_config() and make probe() call gc0310_detect() directly.

...

> -       ret =3D i2c_smbus_read_word_swapped(client, GC0310_SC_CMMN_CHIP_I=
D_H);
> +       ret =3D pm_runtime_get_sync(&client->dev);
> +       if (ret >=3D 0)
> +               ret =3D i2c_smbus_read_word_swapped(client, GC0310_SC_CMM=
N_CHIP_ID_H);
> +       pm_runtime_put(&client->dev);
>         if (ret < 0) {
>                 dev_err(&client->dev, "read sensor_id failed: %d\n", ret)=
;
>                 return -ENODEV;

Not sure if it's good to have in this patch, but above can be cleaned up to

      pm_runtime_get_sync(&client->dev);
      ret =3D i2c_smbus_read_word_swapped(client, GC0310_SC_CMMN_CHIP_ID_H)=
;
      pm_runtime_put(&client->dev);
      if (ret < 0) {
               dev_err(&client->dev, "read sensor_id failed: %d\n", ret);
               return ret;
      }

But I don't know what will be the response on the I2C bus if the
device is powered off.

--=20
With Best Regards,
Andy Shevchenko
