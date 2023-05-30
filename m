Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434831774B
	for <linux-staging@lists.linux.dev>; Tue, 30 May 2023 11:29:34 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6263b2526a0so1072546d6.2
        for <linux-staging@lists.linux.dev>; Tue, 30 May 2023 04:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685446173; x=1688038173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmPUYnc2FtqL3JwQ/ssh0K8SaGGEZjxLd4q7zPcJvCs=;
        b=rZ7D6eugfTtxFTVcUgTDyC0m1D3tbiGocFZNUYq2MeS70/O9MCYWsLWlr6esVrcQXI
         aL9n9LCV024EgcM2uncy4+NLsf4J5G9wyjiRRS0LKQHI/XbTz2l/EHGSJnCHkZIbG0Vh
         pD/40VW7CBfKyEELT5aq1KEkZmO5MsiKWj7tzb7TNhGqqhJqKdTdNTH6PrHmihw3PQxg
         XPSVs5d5s3e6G9J96CLEdD0VGv8QN6eKGXRHgQZAY9fWy26YHsMJDz61gp5Wo5CP/zkS
         PDeyJVXltsnzxnYhNp3T1WWzDCj1CrFk6f6+fKDoPV0kIkI+MUm+BhOcqUs5c4VZvPHQ
         xfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685446173; x=1688038173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jmPUYnc2FtqL3JwQ/ssh0K8SaGGEZjxLd4q7zPcJvCs=;
        b=KNiqWeCEnQT1+uM/oSHIflZKhiBfp/uUGcpwnoJPcIAxeKM5yw6ZfZlMfyz+59WCdH
         kEQt4nNpY/Vj05iXJ+EGMNOpeeESzJezLQYBs5ZcZ/2/1NNcPqEXp2f+BSabhMrcM1hH
         CP2hVIRkDNULMt17XGMuq1+GQ1FWURClbuwaNswombf/eTKqwOQIbv+0stJzH4v52DvU
         mQ4f8oID6pxUOwm6biqhO2kCDkcDrestrVmc5IffNAdrBdkD9wDt7HebpLJlDDuBLTBF
         4NJbitjN4v1Olt42rjPwumNlD7bLe+N42/Ce4MWcVJUreQc3TsFhQ9uBiRGoVG64Face
         G9Vg==
X-Gm-Message-State: AC+VfDxEX7aJWHzaMQ6+rKwDjffpn5f41Q/YNQwkdDHCXbkmHXI1nU8E
	Cl0E/wCGSZIlaSEWh+b59CO3HTJZXWaO6OXlS/Y=
X-Google-Smtp-Source: ACHHUZ7l8I/u99ITUyO9KaG4BGtsk5Ahu9fGzyKzO/GHPdO7/f6V6c1qV6rir/MSNA3JAKz4Q+RQya15XVS1yLirLs4=
X-Received: by 2002:a05:6214:2247:b0:626:2415:843 with SMTP id
 c7-20020a056214224700b0062624150843mr2098221qvc.43.1685446173079; Tue, 30 May
 2023 04:29:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230529103741.11904-1-hdegoede@redhat.com> <20230529103741.11904-7-hdegoede@redhat.com>
 <CAHp75Vd0n8HHv2nguQFHvoRuqjwAAj=YdmgMGckg+1q-NLptFw@mail.gmail.com> <b8059e0a-8a95-ce5e-ccd5-786ac9ee6abc@redhat.com>
In-Reply-To: <b8059e0a-8a95-ce5e-ccd5-786ac9ee6abc@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 30 May 2023 14:28:57 +0300
Message-ID: <CAHp75VdwCV0PMWqiTunnc3wrvYs7Q=-yGDb++CobhsgwS0EoRw@mail.gmail.com>
Subject: Re: [PATCH 06/21] media: atomisp: ov2680: Implement selection support
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Yury Luneff <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>, 
	andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 30, 2023 at 1:36=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
> On 5/29/23 22:31, Andy Shevchenko wrote:
> > On Mon, May 29, 2023 at 1:38=E2=80=AFPM Hans de Goede <hdegoede@redhat.=
com> wrote:

...

> >> +       switch (which) {
> >> +       case V4L2_SUBDEV_FORMAT_TRY:
> >> +               return v4l2_subdev_get_try_crop(&sensor->sd, state, pa=
d);
> >> +       case V4L2_SUBDEV_FORMAT_ACTIVE:
> >> +               return &sensor->mode.crop;
> >> +       }
> >> +
> >> +       return NULL;
> >
> > I would move this to default: case.
>
> That may cause the reader of the code to think that there are other cases=
,
> which there are not. All possible values of enum v4l2_subdev_format_whenc=
e
> are already handled, otherwise the compiler would also complain.

Why do we care about that?
What is the common practice in the v4l2 subsystem?

> The "return NULL" is there to shut up other compiler warnings.

Can you elaborate (I mean if the default will be present)?

> I'll add a /* never reached */ to it to make this clear.

--=20
With Best Regards,
Andy Shevchenko
