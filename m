Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2A16D0D
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 08:49:29 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id ba6so12336096edb.1
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 01:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r5UsSxaaK+FDwSAXWjuCQvloPacd0EBmWVUVnUcFHrE=;
        b=JxkqP+cayQVT7C52b1NL4UK3Dd9Urenq8MX3dz7m/xVGY67JK3QMWWSrpDxtZdyzil
         T0X6PZQgAWXUPlSvT6jmhekP4VjYD4WNHWbeaoc2E1nojyAUiluDl0IlHmJ9TnTnUUNW
         9qYzbrOd2C2gw+M/bLXct9YZuOxqqnsBnSkMAROUYVgZU2qE6H6MnIhww1B4y3KsOnXX
         qG10e0oNb7wzfHVx3CkT93yfeqRz7uL/R72HeuGmIZ7xxLAogHESVGleBQLJVZ2VVsqp
         NXvh8y/866Q7keWNasIV9SihRNdlsY1McP/mRUvAECiV/wPe4G6/kL9ACuFleq3bLMgQ
         LU7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r5UsSxaaK+FDwSAXWjuCQvloPacd0EBmWVUVnUcFHrE=;
        b=g2i9xgcjTh/VsNLrJM38ipmUgtW5S1C27a5Xw970TE6+P5NSkGIg7walN/z/2COQ9X
         7mLMTFsYkTbvIVutoIUpW60W26vVyV8h9iZUUdTB0YDnzWsDJpNbO/ljdw68l8KvtqMM
         QtHxq7rJpbKVANdTQEq7Hfx7M5H1e8i8HiiqaMk9FFzxiOD6gGzUGOpyA4/gLGkC5uiC
         Agq7BBCbX4TdRmcVNE6DeuhV+FGiJrWmvujqY8/ZaxR/KdEyxeyOQzXZYRd8g4nmdMYh
         Wh4x/wqg4FPm+twxSZmWfE05/YUPPfDtSiEbsxCjjFiBnisz2xxXZVDs4+mGLmsdbNid
         fW9A==
X-Gm-Message-State: AOAM532nRXF7TPfEY/1wzfY3zWmr9Rgjl7MwbkA9H1WRbxFNsCFYMWhe
	wMMcPq97P2H6xUskMn/F3no=
X-Google-Smtp-Source: ABdhPJzTlUgNDH8eHapV4xSjZLAyuH4rKl1yH/Ww6aXTVgQyi+HCAPg/jcou5nT3HsozxMT4qZx8wg==
X-Received: by 2002:a05:6402:145:: with SMTP id s5mr3019760edu.221.1617785367839;
        Wed, 07 Apr 2021 01:49:27 -0700 (PDT)
Received: from localhost.localdomain (host-79-42-91-147.retail.telecomitalia.it. [79.42.91.147])
        by smtp.gmail.com with ESMTPSA id s12sm10127014edx.18.2021.04.07.01.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 01:49:27 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: outreachy-kernel@googlegroups.com, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Outreachy kernel] [PATCH v3] staging: rtl8723bs: hal: Remove camelcase in Hal8723BReg.h
Date: Wed, 07 Apr 2021 10:49:25 +0200
Message-ID: <3526833.TqPzfDAv2q@localhost.localdomain>
In-Reply-To: <YG1qxdRtNIIVK3fX@kroah.com>
References: <20210406160037.27225-1-fmdefrancesco@gmail.com> <YG1qxdRtNIIVK3fX@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, April 7, 2021 10:18:13 AM CEST Greg KH wrote:
> On Tue, Apr 06, 2021 at 06:00:37PM +0200, Fabio M. De Francesco wrote:
> > Remove camelcase in some symbols defined in Hal8723BReg.h. These symbols
> > are not used anywhere else, therefore this patch does not break the driver.
> > 
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> > 
> > Patch v3 changes nothing with respect to v2 and v1. It exists only to cc some recipients that were missing in the header of the previous email.
> > 
> >  drivers/staging/rtl8723bs/hal/Hal8723BReg.h | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> This patch does not apply to my tree right now.  Can you refresh and
> rebase your copy of my branch and rebase it and resend?
>
Sure. I'm about to submit that patch again in a few minutes.

Thanks,

Fabio
> 
> thanks,
> 
> greg k-h
> 




