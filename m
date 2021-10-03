Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDAD2F80
	for <linux-staging@lists.linux.dev>; Sun,  3 Oct 2021 23:25:06 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id l7so34099964edq.3
        for <linux-staging@lists.linux.dev>; Sun, 03 Oct 2021 16:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amikom.ac.id; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GSCXqxIA1o807PK6C5J2wuYzWvo/IRAhFGJYC3Av3vU=;
        b=Y/PSYvM7+k9cj4P4gwtvnHz+ZogB6+5zu/W4Av/04ZU9AcbOBuyF05JNsJL5NRsdog
         AraEq8Jyj7dpz+iYH5kc4Q8lh8QOq1Kr887D686efcFO4tVqYPqOyZwJcn4FlZF2SGs6
         3quETLnmkKbJn5ssxNmIDAm+lDx6OGfOF8dZayARYoCepwtxvQlUVcdB7lI8zG0pZeBF
         VqaDu8SYOt/m9iSUqb+HryyQ4lY3BmQtvMpz/AG7uuva/uAggGbqhlCoSlc0+woS+ZC+
         5sRNiczOWVr2tSy9yNL64DgyNBTBKNqg67T0R/MKw+ut8VHAyiogCOr8g/0tvb611std
         jfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GSCXqxIA1o807PK6C5J2wuYzWvo/IRAhFGJYC3Av3vU=;
        b=MDTvSsztnE2AIbQHZjPoVezkOyTu7atYt1sHOlyse1GiFcG5t9iyrCjuzVYMPtxayQ
         R4i9/FbBVmnIGYvvGBZYAj+WHgFah2WFP7IrFPuxVPYd3ImEuT5FHDihgW0fa2GXRSUv
         5pmPWSIfDCv62l4nS9ANHe/7aP3GRNWDOYPBCL01R8MSzhV0OJxqCeoVuSyHqrpVH3Am
         Gn8XpAAkjT8JV6hQriYu4bsrEiz0bC9byWYuKsmQC9tvqA13bc8aKSbQ5ONc8v2uQsyV
         4ZgaPMUmQqdtBwqTZh3CBoAKlxduhQAHsU9RIbMyZEMmx1PRAJiyhwXx0SlkFmE+Rnbk
         t6yA==
X-Gm-Message-State: AOAM530yOPpAL6Oo5VxGAIbXe+WJJ4Y8e+VfTZUSG5P3LlRCCj/1aCJ1
	CCokw8jVeVit3h/XJUtdu5Fip0KRPUdL8GWINws7iralAsXxYvB67iU=
X-Google-Smtp-Source: ABdhPJwlXghwRiHVLqNgde12Z99mmV7noD5vKOvj8fqS+t1n0MgWrz9xYYiT4DFgmZVqaxsnlqW7f0hZFg8M0ej9xNw=
X-Received: by 2002:a17:906:1757:: with SMTP id d23mr13761971eje.102.1633303504459;
 Sun, 03 Oct 2021 16:25:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211002231723.29019-1-ammar.faizi@students.amikom.ac.id> <1bad16dc-e11e-4096-2014-a0eae92686e8@gmail.com>
In-Reply-To: <1bad16dc-e11e-4096-2014-a0eae92686e8@gmail.com>
From: Ammar Faizi <ammar.faizi@students.amikom.ac.id>
Date: Mon, 4 Oct 2021 06:24:52 +0700
Message-ID: <CAGzmLMWehxhp7L7Ye+ERjZPRxAaVu=pYmV6Zr-Q78dzruu2qaA@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: fix `-Werror=return-type`
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Bedirhan KURT <windowz414@gnuweeb.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 3, 2021 at 11:19 PM Pavel Skripkin <paskripkin@gmail.com> wrote=
:
>
> On 10/3/21 02:17, Ammar Faizi wrote:
> > Bedirhan reported build error:
> > ```
> >    drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_sys=
tem.c: In function =E2=80=98input_system_configure_channel_sensor=E2=80=99:
> >    drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_sys=
tem.c:1649:1: error: control reaches end of non-void function [-Werror=3Dre=
turn-type]
> >     1649 | }
> >          | ^
> >    cc1: some warnings being treated as errors
> >    make[4]: *** [scripts/Makefile.build:277: drivers/staging/media/atom=
isp/pci/hive_isp_css_common/host/input_system.o] Error 1
> >    make[3]: *** [scripts/Makefile.build:540: drivers/staging/media/atom=
isp] Error 2
> >    make[2]: *** [scripts/Makefile.build:540: drivers/staging/media] Err=
or 2
> >    make[1]: *** [scripts/Makefile.build:540: drivers/staging] Error 2
> >    make: *** [Makefile:1868: drivers] Error 2
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
> > ---
> >   .../media/atomisp/pci/hive_isp_css_common/host/input_system.c    | 1 =
+
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host=
/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/hos=
t/input_system.c
> > index 8e085dda0c18..1bd917e81743 100644
> > --- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_=
system.c
> > +++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_=
system.c
> > @@ -1646,6 +1646,7 @@ static input_system_err_t input_system_configure_=
channel_sensor(
> >       default:
> >               return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
> >       }
> > +     return INPUT_SYSTEM_ERR_NO_ERROR;
> >   }
> >
> >   // Test flags and set structure.
> >
>
> Hi, Ammar!
>
>
> Thank you for fixing this, but it's already fixed in linux-next tree.
> See commit 05344a1d2ea7 ("media: atomisp: restore missing 'return'
> statement").
>
> Again, I am sorry for introducing this bug :(
>
>
>
>
> With regards,
> Pavel Skripkin

No worries, thanks for the update :D

--=20
Ammar Faizi
