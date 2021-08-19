Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B6772
	for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 17:24:51 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id c17so6541013pgc.0
        for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 10:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UYd2dapw2LMwvOwjrvllB89XLpc87giCIS2NMpFO4KE=;
        b=c60+UAjN01E/MyS6qz7JtawFf1HTe4XNk03E930VEgOBPRVjBDqBVsklwYJuniYGs1
         LGe9Fo/Kv+y7utUO1bkuePODvr28k5c0B7ThjmTWITZ0yjKvazUzVvjc63g8y7PO0KJX
         z2Q6s9b91XIlSkvT4TFBoV4hCfk7XQNOyCyDoOjMeOgJFoSXToxHGl2zf3ZglwXNHILA
         5nBX9cKXyOadqOmLtqSJwqYV05VbMa04EIULWevIDHDlifn5mbnvs1dWl40gadZ4xbM2
         6a7eoSJwbBNdl0qdG8FUhC1/pAIuyY1GF34qEcVjx1qmi6IJ7IuG+LTd+ftkXYv/zakr
         fe6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UYd2dapw2LMwvOwjrvllB89XLpc87giCIS2NMpFO4KE=;
        b=QzBstZMnLd67aslOJifN2+jNQXiNd8XpifbzR1a1cGnGH3C0PEasBHsb8Unm2FF+pm
         u6mhG8ryI/ucgO1sYQTj3Uo0z7eHFoZj4PpDY7hLhHNnlrGBW/tPzl9fa+oCwAMWnRWg
         RzAnB7RFtH1/dRU+M918YB+m+Gopp/0QuRmEG4QDucsiOefy+u4zUgL3Lce+k+B2sJXV
         iWtcQVDFZX/NSuCmOYfogHmt9OzB53IFp4M96FR4VfCTVhtQ/NLxsykGS9ckZJEIO7Fu
         +MxUrDXA3UI1zPxVKOus17EzGooQrjFhn4F6pc3OU1yNAuR+BgNzn4Sd2M+N594uZIF6
         4/FA==
X-Gm-Message-State: AOAM532oxtN8YcyCxPge2Ds/9aHurt0P7H+ZM0mZni8go8ZTdHnnLYzG
	9E/6u0C7mvBkX58nTanU+veadOLr38kRz7ty4Pc=
X-Google-Smtp-Source: ABdhPJysYPrZmoa4UFLdVe+0TKMVAoZZGvmIcU6EffmYwkLJhVyd3WbKXreA9JSgPXu/YBIo/JraQJfnWgEJoSnO5CY=
X-Received: by 2002:aa7:9618:0:b0:3e2:1bc3:aa93 with SMTP id
 q24-20020aa79618000000b003e21bc3aa93mr15746883pfg.73.1629393890934; Thu, 19
 Aug 2021 10:24:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210802143820.1150099-1-arnd@kernel.org> <202108130937.7848F6B318@keescook>
In-Reply-To: <202108130937.7848F6B318@keescook>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 19 Aug 2021 20:24:11 +0300
Message-ID: <CAHp75VdkAO+fiiCVs=dyc2C83mZuLCQCvqs9C+6PF6JnhKDxCA@mail.gmail.com>
Subject: Re: [PATCH] media: atomisp: restore missing 'return' statement
To: Kees Cook <keescook@chromium.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pavel Skripkin <paskripkin@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 13, 2021 at 7:39 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Mon, Aug 02, 2021 at 04:38:14PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The input_system_configure_channel_sensor() function lost its final
> > return code in a previous patch:
> >
> > drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c: In function 'input_system_configure_channel_sensor':
> > drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1649:1: error: control reaches end of non-void function [-Werror=return-type]
> >
> > Restore what was there originally.
> >
> > Fixes: 728a5c64ae5f ("media: atomisp: remove dublicate code")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> I hit this too. Thanks!
>
> Reviewed-by: Kees Cook <keescook@chromium.org>

Me too,
Tested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Pavel, how have you tested it?

-- 
With Best Regards,
Andy Shevchenko
