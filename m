Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FB76FDF
	for <linux-staging@lists.linux.dev>; Tue, 25 Oct 2022 22:21:59 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id fy4so16501907ejc.5
        for <linux-staging@lists.linux.dev>; Tue, 25 Oct 2022 15:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8y6RcNcqeipKdBc0KcpoWpoQGRSinTxo6WlCtAHVVFw=;
        b=lh0NRBFqQ37Pp2fRnoeAAM9cc7X8nP27UkZ1i/XKX98gMIpAuWUq5KWBlTtqlHiGeq
         x6ZUVZyTfxE60QHtbDFf1iaEJ1JKez+YvG7mQJOpKgOrDcKPZUhocxXh9mST2A1Sl9pS
         r0njkfhIIwycM7yO055a3feai4rOqXPvHneHE7E7dQQKKJ1EXFqRDXIC5mpU9vEwFK/a
         0efce3mBwTUymRzty/FhP9OhD8Jf5Q3vIhkjYFsNi805ptOa3ZGf/5+yqJTBinUPmsiP
         ZZeVmaWbMBtE5h9DRqCOxmlZWO9TEsB4eNGNeob4TWmijCb+PdiakLs0eQrr/FsCelZY
         19Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8y6RcNcqeipKdBc0KcpoWpoQGRSinTxo6WlCtAHVVFw=;
        b=guUL8EFPhEuglyTs0ORLQicEPxCdoGIKkU7XwXR0WAPrbfMWGUZP6FjcH4QNQVkjfu
         7th/AX8FR3uK8lFkTaXwweIbG7kJd0hUWowPR0wlJjRSPm0VNh86wKMIeGirhDXvpxBu
         y+F3gWOrQBHPvh3EHgesOzLV4Xj6FzDcG+i+UyxrJgm6mnXrKfb9U+Vx5XPLhA5paeQS
         +M2P4xl1ttmq0AseiU0q1Blb00kU8+J5I3E+IM+UcFaIrAkJkVOR5w/M49KaUgTjfcL3
         +PQv4si/t9Q7f79n1wkHtJqKlZtCNxPSehbWz+ThG/fB4wEYzUWhW65dwZHVRcgZTP2H
         8A6g==
X-Gm-Message-State: ACrzQf0Hq3F2KIOrJRTcDHfYji9NXmY+bcoMvybhLFLEavWJImsKlSgW
	AXYvJX0mTIagS/suN1sZFZnS9d/KclvHZPSCUj0=
X-Google-Smtp-Source: AMsMyM6QITyQ7lHAa6lVQOgcVckdNVw20OEmjkUIHcwCzj/lp0O4BWOPYfKxzljxsA4kVmMiP28cLm/yW8CevROpj8k=
X-Received: by 2002:a17:906:c14f:b0:793:30e1:96be with SMTP id
 dp15-20020a170906c14f00b0079330e196bemr29549937ejc.447.1666736518361; Tue, 25
 Oct 2022 15:21:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221019152947.3857217-1-arnd@kernel.org> <20221019152947.3857217-14-arnd@kernel.org>
In-Reply-To: <20221019152947.3857217-14-arnd@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 25 Oct 2022 23:21:31 +0100
Message-ID: <CA+V-a8vH+rD2aJWc-5sVhnhe0-VYUCQ27KfQRS2BsimqJheWqw@mail.gmail.com>
Subject: Re: [PATCH 13/14] staging: media: remove davinci vpfe_capture driver
To: Arnd Bergmann <arnd@kernel.org>
Cc: Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-kernel@lists.infradead.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 19, 2022 at 4:40 PM Arnd Bergmann <arnd@kernel.org> wrote:>
> From: Arnd Bergmann <arnd@arndb.de>
>
> This driver was for the davinci dm644x and dm3xx platforms that are
> now removed from the kernel, so there are no more users.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  MAINTAINERS                                   |    1 -
>  drivers/staging/media/Kconfig                 |    1 -
>  drivers/staging/media/Makefile                |    1 -
>  .../media/deprecated/vpfe_capture/Kconfig     |   58 -
>  .../media/deprecated/vpfe_capture/Makefile    |    4 -
>  .../media/deprecated/vpfe_capture/TODO        |    7 -
>  .../deprecated/vpfe_capture/ccdc_hw_device.h  |   80 -
>  .../deprecated/vpfe_capture/dm355_ccdc.c      |  934 --------
>  .../deprecated/vpfe_capture/dm355_ccdc.h      |  308 ---
>  .../deprecated/vpfe_capture/dm355_ccdc_regs.h |  297 ---
>  .../deprecated/vpfe_capture/dm644x_ccdc.c     |  879 --------
>  .../deprecated/vpfe_capture/dm644x_ccdc.h     |  171 --
>  .../vpfe_capture/dm644x_ccdc_regs.h           |  140 --
>  .../media/deprecated/vpfe_capture/isif.c      | 1127 ----------
>  .../media/deprecated/vpfe_capture/isif.h      |  518 -----
>  .../media/deprecated/vpfe_capture/isif_regs.h |  256 ---
>  .../deprecated/vpfe_capture/vpfe_capture.c    | 1902 -----------------
>  include/media/davinci/vpfe_capture.h          |  177 --
>  18 files changed, 6861 deletions(-)
>  delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/Kconfig
>  delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/Makefile
>  delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/TODO
>  delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/ccdc_hw_device.h
>  delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.c
>  delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.h
>  delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc_regs.h
>  delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc.c
>  delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc.h
>  delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc_regs.h
>  delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/isif.c
>  delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/isif.h
>  delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/isif_regs.h
>  delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/vpfe_capture.c
>  delete mode 100644 include/media/davinci/vpfe_capture.h
>
Acked-by: Lad Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
Prabhakar
