Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05D62F80
	for <linux-staging@lists.linux.dev>; Mon,  4 Oct 2021 14:12:13 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id r18so65301915edv.12
        for <linux-staging@lists.linux.dev>; Mon, 04 Oct 2021 07:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amikom.ac.id; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/uBO/PTl4ZkWnhTh7LICzUGbZ+4dMRmzs+4ecs0mqcA=;
        b=LDptbEVP5pFmLEdU34ZsM22XxcRi9XQIp+8hF3Lo7nIEQZEihrVdehyMRi7lhK77/M
         ecf0kvjrQ59UvMnfwSBbdqhB5AgwnPYicQ7YvMuJNfjmgVacLoipGwkjnpYB3TkLttHX
         SYZibZT3MdDvBspanMqTDTC6Jfu1R1ZvZjvAs6O1Andpe+qmVJszK2YKCU5XH76ZYa9b
         NSA6suL9tzqbLOQyaDVlpDo7oxt+spmLGfkRPRYP1iw6G4Xl1yMjqNoJe6sf5/dXviJF
         6scN5l05mgT2FJC1xsI2hbv1P3A+QMckdfOxrz2Vb/50850O3jb+Cv4XeHT60LSoAv/h
         5Pjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/uBO/PTl4ZkWnhTh7LICzUGbZ+4dMRmzs+4ecs0mqcA=;
        b=cvb/l/Ippi2P9zZ8hToRlaPoJtTeUkU9gk0D09tVbbKtxvd8xkQ7FiIpet/lVtZycx
         aSnE+MZsRoY0hQGVraV+lK6mA4jdv2/NcxgOG7u7Yl6ZNUzuA+YeBf4UN4EiWOhhfZod
         C/Sf2xmytYErAbWPV9bR3Urw46zr6h+52yOt8Mv1PjZp+uyrbpxbQMqqUBzLUEmFlj3A
         nAxbTqLg4CZMjoRoglzV4gAENtxZRiBELEPbisg0uyWPVZe0IgJfwClmFwlWhEp5xXHa
         +c3TDgwe/4O+aps/LLd4Yi5D52lLzVXzMmztJ+viv9YsV5V9kbz8pKxdgr73UsQnQVgg
         Llzw==
X-Gm-Message-State: AOAM530to062W2F9BwzN2ho8nfthkQ0WgfMXs/5lSrNWX901bWolIjlp
	6dj0FyBIku48GiWqnFU95BwwcX7aLaG/aw00gQ/h9g==
X-Google-Smtp-Source: ABdhPJwzRJgYW9Wzyb7NdLDHgOTWL/HLhrOplEvZqqHgDK2YTEhWBMJt3Cu0L+OFXfj/dIGcgcPBXEPsgBwq0jLOduY=
X-Received: by 2002:a17:907:3e03:: with SMTP id hp3mr17158492ejc.183.1633356673544;
 Mon, 04 Oct 2021 07:11:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211002231723.29019-1-ammar.faizi@students.amikom.ac.id> <20211004090524.GS2048@kadam>
In-Reply-To: <20211004090524.GS2048@kadam>
From: Ammar Faizi <ammar.faizi@students.amikom.ac.id>
Date: Mon, 4 Oct 2021 21:11:00 +0700
Message-ID: <CAGzmLMVMmzcP3ih33QhxOBbiqBZRgfiz6ke5K6UMcSeope8Jag@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: fix `-Werror=return-type`
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Pavel Skripkin <paskripkin@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Bedirhan KURT <windowz414@gnuweeb.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 4, 2021 at 4:06 PM Dan Carpenter <dan.carpenter@oracle.com> wro=
te:
>
> On Sun, Oct 03, 2021 at 06:17:23AM +0700, Ammar Faizi wrote:
> > Bedirhan reported build error:
> > ```
> >   drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_syst=
em.c: In function =E2=80=98input_system_configure_channel_sensor=E2=80=99:
> >   drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_syst=
em.c:1649:1: error: control reaches end of non-void function [-Werror=3Dret=
urn-type]
> >    1649 | }
> >         | ^
> >   cc1: some warnings being treated as errors
> >   make[4]: *** [scripts/Makefile.build:277: drivers/staging/media/atomi=
sp/pci/hive_isp_css_common/host/input_system.o] Error 1
> >   make[3]: *** [scripts/Makefile.build:540: drivers/staging/media/atomi=
sp] Error 2
> >   make[2]: *** [scripts/Makefile.build:540: drivers/staging/media] Erro=
r 2
> >   make[1]: *** [scripts/Makefile.build:540: drivers/staging] Error 2
> >   make: *** [Makefile:1868: drivers] Error 2
> > ```
> >
> > Commit 264f590899146baa19e0ab5689e55fadbc292333 ("media: atomisp:
> > remove useless returns") incorrectly removed a required return results
> > in the above build error. Reinstate it.
> >
> > Cc: Pavel Skripkin <paskripkin@gmail.com>
> > Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: linux-staging@lists.linux.dev
> > Cc: linux-kernel@vger.kernel.org
> > Reported-by: Bedirhan KURT <windowz414@gnuweeb.org>
> > Fixes: 264f590899146baa19e0ab5689e55fadbc292333 ("media: atomisp: remov=
e useless returns")
> > Signed-off-by: Ammar Faizi <ammar.faizi@students.amikom.ac.id>
>
> What's going on with this?  It's like the seventh time people have sent
> a fix for it?  Why are you not using against a current tree?
>
> regards,
> dan carpenter
>

Sorry for the duplicate. It broke my build. I am using Linus' tree
5.15-rc4, the error still lives here. My mistake, I didn't check the
linux-next tree before sending this fix.

--=20
Ammar Faizi
