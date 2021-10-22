Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450AA72
	for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 08:54:30 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id w14so247133edv.11
        for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 01:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HrFPSVbaJCP8/VAvKJYHEZxALPWGOLisv+WT9WnEMzs=;
        b=CdOJsrCpWxgBJFhnkbEKydkOdlcMVmMZR2hgstaEGtJmlBe46Ty8tVVy0E8CqrdrCK
         JlgvD2RR93zRhol+NsTkOpdpX8CXDva+9RjV6C8CcBcok27KnLziOCISDzfjgJouyThw
         VGip+UFiHDGEBEB7SiJqfPm7A96YR9GFFSn2fhUqUcG0Oc0YHIZa12ClSpqLXAcxUjIW
         sml7wJfZXefx1aldFSbpFoJ9YeOx6ip6dIvWv9M2c9YZ8vQn21PehPiihhwYC+aOERcT
         1D2wrSjABkmIJznlfFErKXQ4qUrWbbR8qT0PvyCfeWlUmxFfgN6k4OiJnETUfp0ID1WY
         dLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HrFPSVbaJCP8/VAvKJYHEZxALPWGOLisv+WT9WnEMzs=;
        b=mVhkxbv89LU0+DbXFc8AEaGKPK+Vo216HkDukJncH5YKK3d3FlWDvssEGlhmH2/j95
         IDqfjJgM7yNxsF4ZI7FdI/DO7j3eDe8qpzxOxNWGRpCl1YptJ+WRvMb0yNTjdsjTw9y8
         B1bcu9y4RtR+c7GsdkAcTd/ne5PmwY0wVpHFw5/+DMZj7fQt781q07qqbFMZEd0vONiN
         bUaVvkRPEM/wPAqMrPBHRuv1TtD/L6kCEJBH8VNHlKt3wP7eVohVO05OQgFLw3yASOUa
         BhR0VGy9UaFapS9MS7zbq3w6e5jfPwVeCTqBZfElP+wOKeLAeOKAwIqS4XTCEb4KxE/+
         59QQ==
X-Gm-Message-State: AOAM533shjH7Pi6lB3OH3OCFBR5tkTtnH/nKZn6tdTWit/TxTor5S6ZD
	VDr5IC11vdbsWhgBJTJxfDo=
X-Google-Smtp-Source: ABdhPJwd3EAEeZYXCwIDn2/7h23nVuBVLhj8dulP37GOTibbGwUFEwDZusTLqbwrT6H/3/TwibRd9g==
X-Received: by 2002:a17:906:5a63:: with SMTP id my35mr2002043ejc.104.1634892868583;
        Fri, 22 Oct 2021 01:54:28 -0700 (PDT)
Received: from localhost.localdomain (host-80-181-148-119.retail.telecomitalia.it. [80.181.148.119])
        by smtp.gmail.com with ESMTPSA id c19sm4466759ede.16.2021.10.22.01.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 01:54:28 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Remove unused semaphores
Date: Fri, 22 Oct 2021 10:54:26 +0200
Message-ID: <1905861.9EeI4ENUQp@localhost.localdomain>
In-Reply-To: <20211022084727.28035-1-fmdefrancesco@gmail.com>
References: <20211022084727.28035-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, October 22, 2021 10:47:25 AM CEST Fabio M. De Francesco wrote:
> Remove two unused semaphores.
> 
> Fabio M. De Francesco (2):
>   staging: r8188eu: Remove initialized but unused semaphore
>   staging: r8188eu: Remove unused semaphore "io_retevt"
> 
>  drivers/staging/r8188eu/core/rtw_xmit.c      | 1 -
>  drivers/staging/r8188eu/include/osdep_intf.h | 1 -
>  drivers/staging/r8188eu/include/rtw_xmit.h   | 1 -
>  3 files changed, 3 deletions(-)
> 
> -- 
> 2.33.1

I'm sorry but I overlooked the name of the driver in this cover letter :(
Am I required to send a v2?

Fabio



