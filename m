Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8844A3B
	for <linux-staging@lists.linux.dev>; Mon, 22 Aug 2022 21:28:49 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id y18so8993809qtv.5
        for <linux-staging@lists.linux.dev>; Mon, 22 Aug 2022 14:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=f34TFr5Ae5xpGEjfAgL6FehCM9KIFQVhi5IFiIsBdh8=;
        b=OiOyhJRV6GFFoPnofUHAq9baVlTaCIqEalEY0MaVIGmx+Q+Pb4LYp9PqeTBozMDrG+
         95EGF5nxc2sv6af8sC8z1EjUHlJ0EBr4Gj+qndOUfb61RWSRjgXh03GQKLKdjdpExS2g
         5hNkgp1ipofgSzyNmHXYJC06Vk/sem1V5AOde+asMHIHCwhvOcaEf0CZu407Ksz+1Cj7
         WKTuzaQ+X88Kse5zqXNgVEdjseIYNRl/wQw8DGJzMEajF7itYAyab6A1tCdNpG5smJC5
         FxWJcjC1SLWhrjChk93i+4b8Dz8BNuar9Xcv3MMixZ05CWu3FFDWcEBuf37rBpydeAwc
         1r9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=f34TFr5Ae5xpGEjfAgL6FehCM9KIFQVhi5IFiIsBdh8=;
        b=kiyVXPJSvG70ByiPF8IdjQIlLeEIE+COjsamc75AgYck/+xkcV1YtdlEfz5NQfpSnD
         fFlTKaa1R+dGLNlQMtvlYR3FPddoL48W85bKKIdYUdDtk4DrrOWjdZkDoGed3Xff4b4V
         BwEgDk/yfHaAU9vHhT67sYZpSdq/t0FOyxLx+47YNjXAsfFZ9FtVVgLeczUwY+SiWT/m
         Ukv1R3YiSVmOh2/O6hzyk0riHHq/gZ762KO250hyA2pXmXWTEvzNEq7HIuJW4zhkMg67
         7Or1vmPIvfhO25yG3X/DhF1aVXyjPHdoYamVrxLaPCMDW4Wvbr0sBHpdIMcwgKPB33Fr
         JU4Q==
X-Gm-Message-State: ACgBeo1xUDSu20pQv5DZWJ+OoI1RbE1yrkRpYTekJGN1sdAFmmOUZxbx
	wQqckYjyLuynbMkcyCXB8cCgRPlyfImqWu/Jogw=
X-Google-Smtp-Source: AA6agR6YMiuwli8fBoHyF3B7UP0b5x+qzSPFzq+lT+g3YpsAGBlPZegL+g/B8YwyvMYU+TjkM3Ytqz0btLPehuQh/dg=
X-Received: by 2002:ac8:7dd0:0:b0:344:afc1:b11d with SMTP id
 c16-20020ac87dd0000000b00344afc1b11dmr8568600qte.195.1661203728626; Mon, 22
 Aug 2022 14:28:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220822150610.45186-1-hdegoede@redhat.com>
In-Reply-To: <20220822150610.45186-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 23 Aug 2022 00:28:12 +0300
Message-ID: <CAHp75Vd2KPjKo1QXaZ4pHr4400Rw2yQFrWJuAOLge9=gbo=RqA@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] media: atomisp_gmin_platform: Switch to use acpi_evaluate_dsm_typed()
To: Hans de Goede <hdegoede@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Tsuchiya Yuto <kitakar@gmail.com>, Andy Shevchenko <andy@kernel.org>, Yury Luneff <yury.lunev@gmail.com>, 
	Nable <nable.maininbox@googlemail.com>, 
	"andrey.i.trufanov" <andrey.i.trufanov@gmail.com>, Fabio Aiuto <fabioaiuto83@gmail.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 22, 2022 at 6:06 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> The acpi_evaluate_dsm_typed() provides a way to check the type of the
> object evaluated by _DSM call. Use it instead of open coded variant.

of an open

...

Hmm... I thought I gave the Rb tag for patches 2-11.
In this version patches 12 and 13 also look good to me.

-- 
With Best Regards,
Andy Shevchenko
