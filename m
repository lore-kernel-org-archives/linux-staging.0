Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99D32FAF
	for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 02:08:25 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id b10so9245457eju.9
        for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 19:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ykAJKci/Ufpr9vdJPp2MKR5L112cjDKYK64qjGt7RFM=;
        b=QpmgD5+6dl44V7U+a2cgGKaBiufDL2vuOuEZMspqZ2hNP4fc8LPaYjs88srSM8SmRW
         01lAF4RCAf1SWOTf7SFGtUNuRi/lImrIkiyeG8ksexESiy/hmg4vehaJpfQnCM3CxFGc
         fAUQ2KVHSLXTTDXJjJz9whLBHw3ADjV6ZD7myny668cFA1HpAkYplUTlw9ZORYq0T4I/
         w7xKJdXTRI6GbaOjX1+my+UKnq8J1/vJYcIJv4GOxqVr3ILjB3waFtbn+dpYgWLJSnZC
         AZYlOCVVSNJaeuSifMFQIJ2FOlR2rmiiuQ/3y2AeUXazk+nqBXEsGR97eQff3V12ELtX
         1ZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ykAJKci/Ufpr9vdJPp2MKR5L112cjDKYK64qjGt7RFM=;
        b=Qrsv72qlLKC1+b9nOZ+slFhmDrct/REKwL5cnZ7MC/QHdpWDwiEzTTBreeNVzxMpmI
         KcaQwYdyuuGhiEKcQMNeTTi3HAR/23+ycPtoaaRVSyB/UuHYEHAHh3DZ5r5Mi4rDLh9N
         8y09JwlmhvBoTthB7RFiOQRJ57Gy3rhypDpoZe+4002zL1a/Cj6RhYyNFShucOpCiJDa
         /5KAgm157dkMIxFCV9TzQFwKNhEUpcgvBY3GNFGXp1IzsQVjGgAD16Sx72ceynOXxqBz
         xQlEYS5ECx+OicEOt4XPbgimVGD85PI7j2mFH6U87yctQGCxujgwK5p2DX7K000qLXxH
         GFzA==
X-Gm-Message-State: AOAM531XUC4s048iPUpN4RX595ms2pQH+m9ZDGBdODgMuecoqJEVBrRJ
	jDDZGkr+BKQE8L6faAqIMTk=
X-Google-Smtp-Source: ABdhPJxxMPQ+Guy8yPOnGxOUTKb+QAbUFpCqFVriswiJC31+367k7CtB1FJ7Hs3s5CgrWYqtFc/9Ow==
X-Received: by 2002:a17:906:5045:: with SMTP id e5mr13212652ejk.239.1629338904218;
        Wed, 18 Aug 2021 19:08:24 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
        by smtp.gmail.com with ESMTPSA id b5sm584925ejq.56.2021.08.18.19.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 19:08:23 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org, Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, martin@kaiser.cx, straube.linux@gmail.com, Larry.Finger@lwfinger.net
Subject: Re: [PATCH 5/6] staging: r8188eu: remove function rtw_hal_free_xmit_priv
Date: Thu, 19 Aug 2021 04:08:22 +0200
Message-ID: <3499069.ykxA73u1ES@localhost.localdomain>
In-Reply-To: <20210818234253.208271-6-phil@philpotter.co.uk>
References: <20210818234253.208271-1-phil@philpotter.co.uk> <20210818234253.208271-6-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, August 19, 2021 1:42:52 AM CEST Phillip Potter wrote:
> Remove function rtw_hal_free_xmit_priv in hal/hal_intf.c and its
> declaration in include/hal_intf.h, as well as the single call line in
> core/rtw_xmit.c. This function now essentially checks a function
> pointer which will always be NULL (due to previous patches) and
> therefore will never be called.
> 
> Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> ---
>  drivers/staging/r8188eu/core/rtw_xmit.c    | 2 --
>  drivers/staging/r8188eu/hal/hal_intf.c     | 6 ------
>  drivers/staging/r8188eu/include/hal_intf.h | 1 -
>  3 files changed, 9 deletions(-)

It looks good. 

Built with "make C=2 -j8 drivers/staging/r8188eu/ W=1"
on x86-64, it does not introduce errors or new warnings, so...

Acked-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Thanks,

Fabio



