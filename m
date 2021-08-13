Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF266D19
	for <linux-staging@lists.linux.dev>; Fri, 13 Aug 2021 01:51:57 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id r19so9620212eds.13
        for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 18:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=64W0Rzrur5DnbHP4hOalW0KQb9n7hi068OYFKUZ/rMA=;
        b=a3OBnfSG1E1v3eOiKJUDUlDQVAufOTaVtSAqXF2WxNLIZgUGWGwtwDKFokVO87OwJ/
         woUexZdBe0fxBlnuK/XRDIyR0CTGYuR2Q526MR6km3Hpxm2Bwg3GQeT5Pgugfr/9d0jQ
         EN0+y7PgXlCQ1gDuGQcrf6Js5GvxB/ENCuj/Kjix48zoWrTxL59JGJGjWzKrFgR1M9dw
         K/CFzcHetyeZmGWdVcVYa0vmnYBoLfH2xgH2oHAaw1hrP1eJbDJvqUlyCiEBDtlRon15
         URuluZX1xSh6Yfb95+zBXJMj9wlzdhDDC7pQZwE9NgREMViLgV/U4aMMpUoKeQHTOHAp
         Dz2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=64W0Rzrur5DnbHP4hOalW0KQb9n7hi068OYFKUZ/rMA=;
        b=UEjuSyin4+Lrkss+wtsiJcfRrXMuSD1rCkRvWEnUFQnBrpe3z8Nnq7zz2GbUK5B8+Y
         weF6G66t2U6Vf89sRQCEpXGTsjRR0T+3lfpIhjg4Yl+0HreF8W8u8/eHmuZblxkxXZmq
         WWcsi/Rzw410MWl1GkL8YSOnTVCXZhd3FyKfiqsKrx24waJUxckS2uKXBHdtfsib/5wq
         LrQasEyKXY35O+tpa1f7w5QCrneQJ3/8ztj1bVBYL5HDBDC0f1vWbjo4/7vO9J7d7BpX
         ySB0Bekunfz/txZk6xrFozHZLBMxYetMLaBj6NMaTykqaaZq/nZYl+OEmzOaV4Kqgi/V
         tbnw==
X-Gm-Message-State: AOAM533k1U7fJ6OMDkRr+FaKQTh6KEoQCsQYLpjRCo2UadnSP/99ubf1
	ZLw0TDXGw07Kgc3dKpJMRxY=
X-Google-Smtp-Source: ABdhPJywOR3hB+4JheUjP0fa23pwj8BOxVC08FZvIhMDVBGCMWQxtuMXNIs4Dy8makWnc5tJ2wssdQ==
X-Received: by 2002:aa7:d3cc:: with SMTP id o12mr8971391edr.335.1628819516107;
        Thu, 12 Aug 2021 18:51:56 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
        by smtp.gmail.com with ESMTPSA id j27sm1402843ejk.18.2021.08.12.18.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 18:51:55 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Phillip Potter <phil@philpotter.co.uk>, Larry Finger <Larry.Finger@lwfinger.net>, Nick Desaulniers <ndesaulniers@google.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH 3/3] staging: r8188eu: Reorganize error handling in rtw_drv_init()
Date: Fri, 13 Aug 2021 03:51:54 +0200
Message-ID: <2890624.vKDRqAKio7@localhost.localdomain>
In-Reply-To: <24e15d45-40b8-b8a7-b633-9e538324a29b@kernel.org>
References: <20210812204027.338872-1-nathan@kernel.org> <1651213.ETx7SW4KbR@localhost.localdomain> <24e15d45-40b8-b8a7-b633-9e538324a29b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Friday, August 13, 2021 1:14:01 AM CEST Nathan Chancellor wrote:
> On 8/12/2021 4:11 PM, Fabio M. De Francesco wrote:
> > On Thursday, August 12, 2021 10:40:27 PM CEST Nathan Chancellor wrote:
> > [...]
> > Therefore, apart that minor misuse of the "global" class in your commit
> > message, it's a nice work and so...
> 
> I am happy to redo the commit message if you and others so desire.
> 
> > Acked-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> 
> Thank you for the review and ack!
> 
> Cheers,
> Nathan
>
Maybe that for that minor misuse of the definition of "global variable" it 
isn't worth to redo three patches. If I were you, I'd wait for feedback from 
Greg K-H and then I'd act accordingly. 

But, at my first read of your patch, I didn't notice that when you return the 
error from within the block starting at the "err:" label, "ret" is always set 
as "-ENODEV".

So, why not simply "return -ENODEV;" and get rid of the "ret" variable?

Thanks,

Fabio 



