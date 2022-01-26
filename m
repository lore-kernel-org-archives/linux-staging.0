Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57E3168
	for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 10:05:26 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id m4so37894524ejb.9
        for <linux-staging@lists.linux.dev>; Wed, 26 Jan 2022 02:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZIBPG5KdggrxdxTcsYEqUFW4Fhlz+KszjlvwSs+5dP8=;
        b=GM+KII2Zv2mUcviteB7pgK0Y9FBFJP2nO//R8vEVHLFufcw/LNeiZV4JarZZlqsYkZ
         typFLgdqp25CkKGspN+0DHGeN5GNkW+3DjPd4XTCHNHBY/e/I6gkmEN3GhUWqlSyGSGj
         Z8B5WazAgU42xBefblCAiNrg3WVNpF3jLD+DvUzBktRcVvkcg6eC9RdHkCs5+8edRKum
         Zrw2I70CN9r2Xef0xxX81h5fp4hrMHnprwD6oxttKhgbvmAZP3/2lGv1TWeIGgPTqozd
         pUsR807hVsRKG2taCPOQU2lv7WJ33Gld6uqElywbeadjRO+VmwV+MOYBV3CETS9ESn/r
         oLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZIBPG5KdggrxdxTcsYEqUFW4Fhlz+KszjlvwSs+5dP8=;
        b=gTcEzsXt1dSnPBO56MuCKsEBRou2TbuXX3mLIFy0tvpw2jJxWW6HE80rwbVCItUH8r
         OeUwOUwZVaWJPWPAW4lELsVlK6HM+/y/0tcPwNJRHH6p5y2XRUWIRKPAu9kwUNDaaArR
         6EJNHlueMm5cdBg5Ph/BltH5uJrZ/DEIa9bmBbZ4z0p/y7VFK4IhCpuh9pwFVL5xpvok
         RsXO5HA4Ya22RF0KWqJBqVE6KhetVwUuWZQOjL0mL8V/9JUqIdxOCKCdnUSz1r9rn0Y2
         NH7PfntL6TU7cKvaH12jXvG9V2GUrs2ipUSUNl4t2noJ30CuQulo2FJ6O7RjOBuuQoFa
         MYSA==
X-Gm-Message-State: AOAM530ly9p/xcYdHgPFtka05OIjQz8SPe6MLg4XqWs0X1uT3V0SZCVq
	H0jo2F55baYMbPAX9pa5Cai1460EQ3MHnh8gI3A=
X-Google-Smtp-Source: ABdhPJxLTWUKmHtcOeib3twEwVqJGJ4TxCtjycPib6a85lcs7VMVl7shvXiH79nfAsy8Iir3ilNC+ATyz+6Lrri68Ok=
X-Received: by 2002:a17:907:60d6:: with SMTP id hv22mr3480319ejc.132.1643191525022;
 Wed, 26 Jan 2022 02:05:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220125202118.63362-1-andriy.shevchenko@linux.intel.com>
 <991e988b-7225-881b-a59a-33c3eae044be@suse.de> <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
In-Reply-To: <CAHp75Vc2cjHkJwNSiJ-HSWBG=DYy68uvD7QQzNdRp3mQxoY1nw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 26 Jan 2022 12:04:26 +0200
Message-ID: <CAHp75Vd7oaYPKx6bxjCqNnm6fieeQFrtq5K4YYrxYbXoXFy=+Q@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] fbtft: Unorphan the driver for maintenance
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Phillip Potter <phil@philpotter.co.uk>, 
	Lee Jones <lee.jones@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Carlis <zhangxuezhi1@yulong.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev, 
	"open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Michael Hennerich <michael.hennerich@analog.com>, Helge Deller <deller@gmx.de>, 
	Andy Shevchenko <andy@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 26, 2022 at 12:02 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Jan 26, 2022 at 10:52 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > Am 25.01.22 um 21:21 schrieb Andy Shevchenko:

...

> > But why? We already have DRM drivers for some of these devices.
>
> No, we do not (only a few are available).

Sorry, I missed your word 'some'. Some == almost none from the list (I
don't remember exact numbers but something like 2 out of 10 are
supported by tiny DRM and see about interfaces).

-- 
With Best Regards,
Andy Shevchenko
