Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F503FC1
	for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 23:52:08 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id m24-20020a17090a7f98b0290178b1a81700so8356573pjl.4
        for <linux-staging@lists.linux.dev>; Fri, 20 Aug 2021 16:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7a7pr5fcERkUw6OUxCu6Pi6Dvka3zNiGFTz7cgPMCq4=;
        b=Jhuhy1hiJYwkPASf5kx5v9//OFHdZH3ukTgAqvjXPa0cbrH0YLNSZxdWo33VLN6Y8E
         cmpoJoplP0cba+qV16kp+yvU5qSJzik8AICpXI33WjiQHHSHkqcjZeNDn8fpPa9JKWmW
         zeWBgTOz6uS6GbFAlSe4j5OcTaWDYvAazg96UfU+UJ4dxH9vN0JqY2eo+xxG9lmSRk4G
         QxVKwyQ8xTRJ6baahEPMt19dYtdGJsxB53LYeqA5AgreSAKwL+QxX7XVX6JMA2IxVo6O
         jKJShSHjErWSZKV0oiY6tQ/c33zkTvHJlyPZ7cKsdjWXW/3sfmMAwUYmL+PM1EqDT9wD
         SGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7a7pr5fcERkUw6OUxCu6Pi6Dvka3zNiGFTz7cgPMCq4=;
        b=hQQit2IoNljdaZ2meGFQDiRqchhvTjRMXJiFXzR3rI1c2c1Z/+/KnnJl5jRR5YX6w3
         dZh+yIIrtEx/E+KKuYc3tXo1sXJGueZKuv8QCD8XWWTbBMN3aFZwQOLnksYyRSRiG2Qq
         AuXsUTY/n+zPiYR2n3sOxAjrDKZTqYlh8BIFWnwcZ3YPnUgd152kL5j2fRkachr4ItET
         joXKr2tO15xo9fT/MYjFCAnOuwzP+1/zwXe+TQm2AhW3qePx3Xg5lXLcrRGysUg4FW4G
         W29h6rMBf1k8mynKuSdVdt3Ai8iJJm4mBHGIc9svw5h6QvaQqCg8PuVTKIUURXz8xSjT
         C5FA==
X-Gm-Message-State: AOAM5331cuNi/zOq4YHcG16qzITPbu3snAfsM4xYzYBKUvVk5Qxb/GBj
	yFuM5yiI6atYC5lb1Fk/FnRN8ijiRRB1Gkzts8CVqsDcSag=
X-Google-Smtp-Source: ABdhPJykm1WZbuaKnzPgpoWymSbBAfEjvJasZps8xZocpTe0mKrTl0kVWZOm2C43IMr+90baGNlU3BPHqAWy60VT4dc=
X-Received: by 2002:a17:90a:6906:: with SMTP id r6mr7106659pjj.162.1629503528537;
 Fri, 20 Aug 2021 16:52:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1629479152.git.paskripkin@gmail.com> <0e2df1ac9e1031824a1cdb7b24594d2d1b99e382.1629479152.git.paskripkin@gmail.com>
In-Reply-To: <0e2df1ac9e1031824a1cdb7b24594d2d1b99e382.1629479152.git.paskripkin@gmail.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Sat, 21 Aug 2021 00:51:57 +0100
Message-ID: <CAA=Fs0=xVqe=QqRwyNGzR7y03na+GF0ktrE3GNhOiD-oObse8A@mail.gmail.com>
Subject: Re: [PATCH RFC 2/3] staging: r8188eu: add error handling to ReadFuse
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Greg KH <gregkh@linuxfoundation.org>, 
	Michael Straube <straube.linux@gmail.com>, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Aug 2021 at 18:07, Pavel Skripkin <paskripkin@gmail.com> wrote:
>
> ReadEFuseByte() internally calls rtw_read8() which can fail. To avoid
> uninit value bugs we should properly handle error sutiation and deliver
> the error to caller.
>
> To achieve it, some functions now return an int, and the error
> which could occur in ReadEFuseByte() is handled on the top level.
>
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_efuse.c      | 46 +++++++++-----
>  drivers/staging/r8188eu/hal/hal_intf.c        |  6 +-
>  .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 62 +++++++++++++------
>  drivers/staging/r8188eu/hal/usb_halinit.c     | 20 ++++--
>  drivers/staging/r8188eu/hal/usb_ops_linux.c   | 43 +++++++++++--
>  drivers/staging/r8188eu/include/hal_intf.h    |  6 +-
>  .../staging/r8188eu/include/rtl8188e_hal.h    |  2 +-
>  drivers/staging/r8188eu/include/rtw_efuse.h   |  4 +-
>  drivers/staging/r8188eu/os_dep/usb_intf.c     |  4 +-
>  9 files changed, 138 insertions(+), 55 deletions(-)
>

Dear Pavel,

I like the code, just a few things though:
(1) the comments I made in the previous e-mail r.e. what we actually
do with the errors, and grouping logically related changes (the rest
of the usb_read*() changes being in this patch for example).
(2) I got trailing whitespace errors from this patch and the last one.
For a v2 I would say stripping the whitespace is a good idea too - I
have submitted many patches myself to this driver that had whitespace
in - indeed, the original version of my patch series to import the
driver still had a load as well :-)

Regards,
Phil
