Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7649272
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 17:27:57 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id k24so12423840pgh.8
        for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 10:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+NImfKj+1u2UZdWcEsXkC/vWqZt0WpdSDDZujdOQQU4=;
        b=f/9u1of0w2xloeK65yR0rLas6BnGbLJEoVFQtnEtRoXjiUYo8WJdTPdcCay6afX+M5
         V8RDBn6I6A2tTAPE7hsQZ49NLdcgwspzXd8FeWsv3BdH7dGYCQtORswJn/T4wtlONKzl
         TWWLpU1oASE5kxPWOKNc/2HWEIe2XMeLLXVam7eT+w4pCH4Rf3pcTsVoTaDZx1e9Dr+l
         71NwPRpnMNniOHA+McKqv6mBoRwwNl33/4GzMgN1YnYsDzewNIjvPh5ERiExhVmykGqX
         UXmQ4aelrI4PyRsQ3qGf59LZhZEuV+UwCiN8DfTF8imcXha6FbgacheGb+BBETaLh1XY
         Q6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+NImfKj+1u2UZdWcEsXkC/vWqZt0WpdSDDZujdOQQU4=;
        b=UySPHR3R1rCZxeObGw91wR3NW2kWU000e07naRAl5rvneThvOGJjKNGD816Cq5inRm
         sAw/3AhXmVLbVnolvbspHi6FFRtKaHxp6WKYSpNGgrqvpr4jpFZV0i7ZZjdOl/+OIiDj
         NTnCM67cEh3WeU1g7tKCtvRSikU6/FhMl3cXoMvx7NVyVu7NXeRlxo3JN0gVOBIViyPk
         2op+WFL2x1clWJX6ReuqSmOgDxF7OJ0A2ohmliTlDX4YCwHM4ECXdzYsOLwmxg/MS4bn
         e2nStd6U8TdUFfHmlIqetx1KAfMc53T5UhJ9SGnsxySCWVb3frwF+w9smqjJgfVqx5Oi
         g8IQ==
X-Gm-Message-State: AOAM5339bknbMziTPWfc+SL/Ez5qjhvnfRh1AwJKKpqNdy1riukXjq8d
	7khQKmQ3JBO1lUqpttUtlVQr3wyQSd5/3nInmcamBw==
X-Google-Smtp-Source: ABdhPJwNKKlNcmoftApiFlV0ypYj+vmHEDqxoXmfvGQIONgSHEPRBYmbiTcki8CiTVSCS5XNqks/io4enOGCDUdK4x8=
X-Received: by 2002:aa7:90d4:0:b029:3b3:2746:5449 with SMTP id
 k20-20020aa790d40000b02903b327465449mr25685318pfk.81.1629566877052; Sat, 21
 Aug 2021 10:27:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210821164859.4351-1-martin@kaiser.cx> <20210821164859.4351-2-martin@kaiser.cx>
In-Reply-To: <20210821164859.4351-2-martin@kaiser.cx>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Sat, 21 Aug 2021 18:27:46 +0100
Message-ID: <CAA=Fs0mB_9Uy5xSr=pin+oDOCN+J07Yzw1CNchQLHmLVN6wT1g@mail.gmail.com>
Subject: Re: [PATCH 02/10] staging: r8188eu: remove unused define
To: Martin Kaiser <martin@kaiser.cx>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Dan Carpenter <dan.carpenter@oracle.com>, Michael Straube <straube.linux@gmail.com>, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 21 Aug 2021 at 17:49, Martin Kaiser <martin@kaiser.cx> wrote:
>
> _HCI_OPS_OS_C_ is not used in the r8188eu driver. Remove it.
>
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  drivers/staging/r8188eu/hal/usb_ops_linux.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> index 953fa05dc30c..a11a0597e515 100644
> --- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
> +++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> @@ -1,8 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /* Copyright(c) 2007 - 2011 Realtek Corporation. */
>
> -#define _HCI_OPS_OS_C_
> -
>  #include "../include/osdep_service.h"
>  #include "../include/drv_types.h"
>  #include "../include/osdep_intf.h"
> --
> 2.20.1
>

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
