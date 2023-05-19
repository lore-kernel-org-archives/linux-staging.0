Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667F06AA4
	for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 10:24:58 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-75773956860so162521385a.0
        for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 03:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684491897; x=1687083897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuquuX3LtEasIX2qqIvkyd90Zb16LALmdo13bhDY+xU=;
        b=aDZFf86QQofHPSc79fOTJkCGOsmjZh1FtaZdglob99OalEvQTr9IQCKKvefzzwDlIb
         VS1DV3aIJMCRqVmUs8WswN1WY5Y0laiQ1IOK1td1Om+l0H5Gf3EINRdV+uHYC1vWujUS
         EF5y9ZIIb7O5o1xgq8FUbnyokooexYyve8mjLBKT8YQFcqcLPUpbKv78TA4l8TfjyWbI
         q4pIT2l5SZ0qQGrvqlCmZuAGyBRAXXiFT1U5luKmeDnE65tj+fg0TDU0IcBEYWUmuNlV
         a/RW/3rHf3BFUUCvSoZO6ZOw3Sg7w7Tn4N7Jgu42NAUa3kgRVKIVtETAZO/SjUXGovEj
         OExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684491897; x=1687083897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IuquuX3LtEasIX2qqIvkyd90Zb16LALmdo13bhDY+xU=;
        b=HyKOPN1UkPj8IHHBzT43zrEUTELGjtPqTKNwm1RyaOB+eEuFwEQPHTnRkTzBSq8MQ0
         iuSEbZhXOf7pXFIRJRUDdOF650cFpdnz5xC0w/ITIxUpbncG11cg4GXgMC9zudbe677S
         owZQXEgowL1DsAqI8CYiygaFbhLAX9iotX7GiJE4VU3dSUHZsfXt901Hv5cSVqmxitqK
         taZYMuSQA3FZdj+Os3nSw23HLndYELmQa5rOwFxjI9Cy7oWcNBKdtprEXq4RqYjO4vfZ
         sdtfXmy85I5PEZNJflsLmxTUMkmIXPn1oapXA57Gsj7b4Z/mXS288RXtLf8zRE8uwxKI
         RQTQ==
X-Gm-Message-State: AC+VfDy9MWy+vnhuJJH8s89T/vU6CCvHcpLTqF/H8qNxObXKKsUlZ5PM
	3Vqvjdyf0HGa6xsYG9mSZ5PECxX4P5rOkBOysoA=
X-Google-Smtp-Source: ACHHUZ78RzUmOT1KDIhC3yUTBIeY7F8BI58+wpUbmD/LoR+rHf2qSugV4DwSVvxcBNaoCApiwmgUvI0SluECTW04ZNY=
X-Received: by 2002:a05:6214:e8f:b0:5ef:4446:22f1 with SMTP id
 hf15-20020a0562140e8f00b005ef444622f1mr3776197qvb.19.1684491897201; Fri, 19
 May 2023 03:24:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230518153214.194976-1-hdegoede@redhat.com> <20230518153214.194976-5-hdegoede@redhat.com>
In-Reply-To: <20230518153214.194976-5-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 19 May 2023 13:24:21 +0300
Message-ID: <CAHp75Vc3+JF+WW-nu4xPfdUszNb4Q-wbp37Wi7npWaTG-Jow5Q@mail.gmail.com>
Subject: Re: [PATCH 4/9] media: atomisp: gc0310: Drop XXGC0310 ACPI hardware-id
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
> The XXGC0310 ACPI hardware-id does not appear to be used in
> the DSDTs of any hardware out there, so drop it.

Yeah, I believe it's a leftover from preproduction firmwares before
real ACPI ID was allocated.

--=20
With Best Regards,
Andy Shevchenko
