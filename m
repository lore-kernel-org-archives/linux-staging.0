Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD2D1C3A
	for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 13:42:41 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-757807cb299so405275985a.2
        for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 06:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683985361; x=1686577361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9n9OPZK/Iq5/AvEHwDdmPCSm1nxzOD7m50GKmpv90c=;
        b=RdExWfRSmwpY4uvQ0SpfaUKirnNAqdkW90kv/UMv754CQLbR4wVZHYDkcIQeAjJJOd
         oHu6r0ww0sa6Jh0KObFSmPelS+XDtkGl2Zc12LKtlEjMW/ON5AbGuEafSahPJryggHNm
         pSETN+EYkOjyHR0337iVphu/6N6lrF5FfIOpoVYETe/A1HhsckqdpPuHjBG6w1+2nVE+
         vjZrGc5d+Wr6OJ27MOrMpbZZXPPSTiGVAtJ9hlGcKGSY13uDqQ96HfCR40VujNHlw54n
         A8eVyYTej2WMfdTi29WG+GJfKgkr7WFwkJoyYyJ+ZLBd3gXQkM+T6BXSvQgMqba94xwG
         DTFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683985361; x=1686577361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9n9OPZK/Iq5/AvEHwDdmPCSm1nxzOD7m50GKmpv90c=;
        b=DcE9DYVl4i/CgIftIurkDW9orlfCZlvzFxKJ3k0TNIosEIQPreMVz3OM78TifIwgoM
         dPYkFTPZvoyOngeqfUG/Gf69cTZPQnJUDUIPuBGFPPXak4ralOQrId1mMzAMMahK1ZG5
         TdCaxNfdnrFhxcYUWW1NwGMaohRCUqOQwnoPMcmOOFGSPA+Jwa9kq1Mm53P3QXLNGmlc
         TIUSJio81q9P9asBm4aPd+XoMw6DNJeGl+WNVfgoOeHYcLmDHHSuy9CmJtc57+gTdh8a
         g1ZnddL/LCXoteiu1y3yQjxSVxg2sBxRLhqnSgI1O0ADdtevfeBBPDg1pcwGtQLUEw1s
         dBhA==
X-Gm-Message-State: AC+VfDxN0/KCBt9Wdosel6Eu+JjFAsUxPcMJXRN5fOvs68pLO4Jeeohi
	XRXT+YfXTMnP/IKza3XMm0uZGEfzsP7IOij5wmg=
X-Google-Smtp-Source: ACHHUZ607kcymJixsQMDAPOP3jvl4vp9y9glbZG2CpGrMTkvmfvfAGfmAJVfpBWzXijAeWwxXAzlPJDtP0UK8fBEjRk=
X-Received: by 2002:a05:6214:4104:b0:5a3:cbc6:8145 with SMTP id
 kc4-20020a056214410400b005a3cbc68145mr38088865qvb.19.1683985360821; Sat, 13
 May 2023 06:42:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230513123159.33234-1-hdegoede@redhat.com> <20230513123159.33234-8-hdegoede@redhat.com>
In-Reply-To: <20230513123159.33234-8-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 13 May 2023 16:42:04 +0300
Message-ID: <CAHp75Vf5kMrYarWCKr3SJ+5fFVtqVAnf7kQ0dGOnLB-_C7=5jQ@mail.gmail.com>
Subject: Re: [PATCH 07/30] media: atomisp: Drop atomisp_is_vf_pipe()
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 13, 2023 at 3:32=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Since there only is one /dev/video# node now (no more continuous mode),
> there are now no longer separate main capture + view-finder pipes.
>
> We are now always on the main pipe, so atomisp_is_vf_pipe() should
> always return false now. Drop any checks using it, replacing them
> with the code-path for a false return.

...

> +       if (arg->per_frame_setting) {
>                 /*
>                  * Per-frame setting enabled, we allocate a new parameter
>                  * buffer to cache the parameters and only when frame buf=
fers

...

> -       if (!(arg->per_frame_setting && !atomisp_is_vf_pipe(pipe))) {
> +       if (!arg->per_frame_setting) {

I'm wondering if we can make the conditional positive as in the above
chunk, so the below will go to the else branch. It might be that both
of them can be united (haven't checked the full context though).

>                 /* indicate to CSS that we have parameters to be updated =
*/
>                 asd->params.css_update_params_needed =3D true;
>         } else {

--=20
With Best Regards,
Andy Shevchenko
