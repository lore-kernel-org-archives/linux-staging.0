Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8267D7C
	for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 12:46:32 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-623839d5c19so23318856d6.1
        for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 05:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684500391; x=1687092391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/GLmaVR3Sdxyev/JwDRfkQfggguIZgdB2qIEZx/Yzy8=;
        b=EB3Kz5VgUeMrtEWvmIosg6DQAveumRKYGPncMCOP2R6Glu9uGVtIA5Z/cMzEW8OMHX
         i3lOGpo4keCaUxlq93z2/EZ1HVmfK2ZlUW7MSDQbaiB2MP5lpi+05NGfiPb5b8PZIyiQ
         VzVdMZxUKLPe3Vk8AiZQuae7eo3sGR3HCdKSRgGCpq188RkAefsxSOKmGoKURDUIp9eJ
         PnEDhci8OLNafRFfnRLkK0+N7QDDWYwij7fKb2c/vpTQtUy6GFyle0KSKzwjOwwYrX19
         CZes/Lpa5vthqFhvti7DZ2nqmEzCSQuqjBGNlJfGcfehlPzJOb4FCCH/2lNtljhqqc6Y
         2UhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684500391; x=1687092391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/GLmaVR3Sdxyev/JwDRfkQfggguIZgdB2qIEZx/Yzy8=;
        b=PLvbrlVshE+lMMpFCovfUrC6/MPMWBN7dIyJu+ODIY7Zs1Sve2qcytLq4cxYa4gUxb
         vu8rlL7vD9xyLhftjDYN1P5uRCZr9CzeefjY2BTsVtrM7BbtcCSR0kxaYxeIfJv5nBav
         ygtmwc7HC0jn/c7FW3vlx/IWHmjVLiicqo4+bnAoKFqH5Pv9m+miL7whH/R5l778vsjQ
         x9jh97TEFtlEgzG8hSrGAR2M1/d9tGU/ERhfQRH/HlHusmsNMikFIlRSvmPDhvGxWxCX
         2q3QEswHjb03L1MnhcPa41aEaxx7PSpy+l7lYT2TR9fD16ecb5blCpIrzzze/3J5oSmv
         mI0g==
X-Gm-Message-State: AC+VfDy7pZBrDr6FFh/vtUf2+ImUtYHeA5JJ0Du5V39bK/d+IXX906Oj
	ufZwCgJPH/w+O+3Ar9NDKUCA9kKjfEcuuSvH9fFMH8kZA1xyUw==
X-Google-Smtp-Source: ACHHUZ6I+UUOdkdVJvKhGZVtwc0hAPCAFH+a2+QPHsdRtjV6iFz6gzz95KY6FEKWbEvYeZTc69Fl9NjDdu/GwmOUcTQ=
X-Received: by 2002:a05:6214:29e7:b0:620:a6b6:e862 with SMTP id
 jv7-20020a05621429e700b00620a6b6e862mr3972341qvb.23.1684500391197; Fri, 19
 May 2023 05:46:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230518153733.195306-1-hdegoede@redhat.com> <20230518153733.195306-10-hdegoede@redhat.com>
In-Reply-To: <20230518153733.195306-10-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 19 May 2023 15:45:54 +0300
Message-ID: <CAHp75Vf2CjdtchvOAYFpCdsqDxMy8d2CB5O6ApeqJsx98+gyXQ@mail.gmail.com>
Subject: Re: [PATCH 9/9] media: atomisp: Add support for v4l2-async sensor registration
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 6:38=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:

...

> +static const guid_t atomisp_dsm_guid =3D GUID_INIT(0xdc2f6c4f, 0x045b, 0=
x4f1d,
> +                                                0x97, 0xb9, 0x88, 0x2a,
> +                                                0x68, 0x60, 0xa4, 0xbe);

Can we use the de facto pattern for this kind of assignments?

... guid_t foo =3D
 <TAB>GUID_INIT(...first 3 parameters...
<TAB><TAB>[spaces if needed)...last 8 parameters...);
?

Also would be nice to have a comment where the GUID is represented in
text format so it can be easily googled/searched for in
internet/documentation.

...

> +       for (i =3D 0; i < obj->package.count - 1; i +=3D 2) {
> +               /* The package should only contain strings */

> +               if (obj->package.elements[i].type !=3D ACPI_TYPE_STRING |=
|

i + 0 ?

> +                   obj->package.elements[i + 1].type !=3D ACPI_TYPE_STRI=
NG)
> +                       break;
> +
> +               if (!strcmp(obj->package.elements[i].string.pointer, key)=
) {

Ditto?

> +                       val =3D kstrdup(obj->package.elements[i + 1].stri=
ng.pointer, GFP_KERNEL);
> +                       dev_info(&adev->dev, "Using DSM entry %s=3D%s\n",=
 key, val);
> +                       break;
> +               }

I would even go for temporary for element pointer

... *elem0 =3D &[i + 0];
... *elem1 =3D &[i + 1];

> +       }

...

> +use_default:

out_use_default:

...

> +       status =3D acpi_evaluate_object(adev->handle, "_PR0", NULL, &buff=
er);

acpi_evaluate_object_typed()

> +       if (!ACPI_SUCCESS(status))
> +               return -ENOENT;

...

> +       if (!buffer.length || !package || package->type !=3D ACPI_TYPE_PA=
CKAGE)

See above.

> +               goto fail;

...

> +               if (strlen(name) =3D=3D 4 && !strncmp(name, "CLK", 3) &&

strlen() assumes that name is NUL-terminated, hence it can be simply
replaced with name[5] =3D=3D '\0' check which can go at the end of
conditional, so that it's also implied in strncmp() for the start of
the string, but why not using str_has_prefix()?

> +                   name[3] >=3D '0' && name[3] <=3D '4') {

It's also possible to have it done via kstrtou8() that does almost all
checks along with conversion. You will only need to check for > 4.

> +                       clock_num =3D name[3] - '0';
> +                       break;
> +               }
> +       }

Altogether

 if (str_has_prefix()) {
   ret =3D kstrto...(&clock_num);
   if (ret)
     ...
   check for clock_num range if needed.
 }

Yes it's longer in code.

...

> +fail:

err_free_pointer:
(It will be also in align with the rest of the code AFAICS)

> +       ACPI_FREE(buffer.pointer);
> +
> +       return clock_num;

...

> +       /* Intel DSM or DMI quirk overrides PR0 derived default */
> +       port =3D gmin_cfg_get_int(adev, "CsiPort", port);
> +
> +       return port;

return gmin_...;

...

> +       if (dev->fwnode && dev->fwnode->secondary)

Please, use dev_fwnode() instead of direct access to the fwnode in
struct device.

> +               return 0;

...

> +               struct v4l2_fwnode_endpoint vep =3D {
> +                       .bus_type =3D V4L2_MBUS_CSI2_DPHY

I would add a trailing comma here.

> +               };

--=20
With Best Regards,
Andy Shevchenko
