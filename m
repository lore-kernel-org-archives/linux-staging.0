Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BAB2C85
	for <linux-staging@lists.linux.dev>; Tue,  2 Nov 2021 14:44:59 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id f8so55335048edy.4
        for <linux-staging@lists.linux.dev>; Tue, 02 Nov 2021 07:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IGpA0l/guxcjGElfIHSIdtmCKC4GUcHmk6UoLJ28NjY=;
        b=PY3YWvGI8aGwzSGlAZFZinGNujL/HX9RWkWzatjVR7IklhoSKkgOJc4hDR8WpPXwza
         QNgjpRP2CQDZg/0/lm1e1np6HonfdL7sbczLeKIGX5sdR17yRwH9wH7xUTHx0gK2CD1i
         WlEaJIXrsWZFDfK3r/dgEU58AB0pa5E7r1qwu86hkWC0Yq/+f6s/Ccm4jiFIVdJGFFuB
         lIrxX5mi/tcDOykdQictIFk9nK6IUNrSnDUUxcujwHvWBKC5fQvxrK/69JH5Jo26c8An
         f8fJbmGzIvWe9cH5gMOoq0W73qGoyWI4UFeUSfQDUA25RQ52AG28Wvr+TZrcdWMjj51R
         YZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IGpA0l/guxcjGElfIHSIdtmCKC4GUcHmk6UoLJ28NjY=;
        b=qU3M3ONqTCM4TjqRHuMswnxZWMbQFFhnnpCN2+wMGaZ3PMMSBz2J0i3t81htnSKrMu
         wrBWTcNeZnmSiGYJbBWo4UWGl2WEmgdkqIkL0uzGrhfh9XNmiZGBUkJohfhS9KQhCZF0
         tjFGt/HCFVejOsGQjj+Xack2gvO/lDzPYV+zePbNqRuTbbqgyMiBOPQqKRNeuv3IsAci
         /Z5yFAW43md/9aDKVziLG6ewQeF4IU+MsFoKZgTAw9iqgH9DJKPsa3zkpmjs0aogRaOo
         TdHbsXE6KCUeF4tXTxspqrO64/tHcMyjmvxqrYYF6m29q5TleyLpxdShj9eDE1Q0el96
         0Fcg==
X-Gm-Message-State: AOAM533cl4M6+mo8PfsHWyJUlOvbkHhNGFuaVglLxjMpuKzK4fD+f/Gh
	8VNoRzK5Q+ldlYY/qCZbA39DIFQhTJrbRDu3Pp8=
X-Google-Smtp-Source: ABdhPJy/tB8lxZRFDOwRPpbKQu8fZ4y+m8XO40U23cDbGR4mnXDC7HAMwVCourQlr3P5r279E3+PkjTqokWYSyDwFC0=
X-Received: by 2002:a05:6402:1801:: with SMTP id g1mr24872630edy.107.1635864298428;
 Tue, 02 Nov 2021 07:44:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211017162337.44860-1-kitakar@gmail.com> <20211017162337.44860-4-kitakar@gmail.com>
 <20211102130245.GE2794@kadam>
In-Reply-To: <20211102130245.GE2794@kadam>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Nov 2021 16:44:09 +0200
Message-ID: <CAHp75VeThcCywYZsrUNYSA3Yc3MjJwfiCBCGep1DpWFFUg71cw@mail.gmail.com>
Subject: Re: [BUG/RFC PATCH 3/5] [BUG][RFC] media: atomisp: pci: add NULL
 check for asd obtained from atomisp_video_pipe
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Tsuchiya Yuto <kitakar@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
	Patrik Gfeller <patrik.gfeller@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Kaixu Xia <kaixuxia@tencent.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Yang Li <abaci-bugfix@linux.alibaba.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Alex Dewar <alex.dewar90@gmail.com>, 
	Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Alan <alan@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 2, 2021 at 3:10 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> On Mon, Oct 18, 2021 at 01:23:34AM +0900, Tsuchiya Yuto wrote:

> > +     if(!pipe->asd) {
>
> Run your patches through scripts/checkpatch.pl.

While it's good advice, we are dealing with quite a bad code under
staging, so the requirements may be relaxed.

> > +             dev_err(pipe->isp->dev, "%s(): asd is NULL, device is %s\n",
> > +                     __func__, pipe->vdev.name);
> > +             return;
> > +     }

-- 
With Best Regards,
Andy Shevchenko
