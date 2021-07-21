Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E956172
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 13:35:21 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id dj21so2457203edb.0
        for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 06:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rt74SJc1ziCgCd5VLOhSKw+GlswyymwN54Jh9bcQ4kw=;
        b=fWY6NBokRCudI5ULeoiS3cfovK8pKF/bDHrtC301sYCD4p+o+AF29lpuM1JEUIbVNF
         ThxiCP0FkFh9XCsk2+nzft3AuLvyjlULaGhYovpSIGUDScQR52aJ3RKSGUavSMcQojYk
         xTEcakIoZFRU3H393Imbr2VrniBH3d4nY7Zb/dAaw7H8y0gnjVWoBg4qCHY3lyTkEvk+
         E+Zj10pnwH1Z8Slv72cjjgR/1KGEJzc4GPK5a7jZi7dIYduvh8/s3tpT4BJGjKsjR4EW
         WOtn20jkjc5F4dWBj8cRJdDj13XHYi4H7fdmOhzNqLoE5YtbTALdvSz4EvTZc3yzA8jB
         7XKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rt74SJc1ziCgCd5VLOhSKw+GlswyymwN54Jh9bcQ4kw=;
        b=URu/1H7NMqEvb94kfW+WEBVkzfhCqychML3Pzl4qHSzTbZg6A7Lx16Lw/Qjk68nJwT
         MR/W8HaQAuqD2M4DPuFBVIVd8ZDFCI4Y0HyPVTC+gMLe6qxhRya152MrIO1K9jcQAKep
         Vav8JRlmWXtdv3ejhmsvIOTwn4TXfN0qmk6PJk5lIoxOfqsfFPdQZwXZyyMpl9Cd3nBI
         fcT5mpS9u+3reoaC+CeXBYxiXYSidLb3P47BUdT8c75/wH3V62YOiBj1PCtDcrtJGes/
         Losoxg12gaRKHTcca8AfAtpvz6IiI9FHerf0e/h4RAhh2hZIyUToS5aWBRsJb9NAcbGY
         KUYQ==
X-Gm-Message-State: AOAM532JmzVkR1A0vflduJaCRIurQfFKmuFB5LEsHXmV1NaUZ3JaBHiL
	LlxIBL2R0JhrR631R4MHcE0=
X-Google-Smtp-Source: ABdhPJy5mVVzxsLrHfVNOnp1CVNTGrmz5RntatIhjxvTa4c3ldwnc7cAapOvISf8SXbQpJ5pcTWjOw==
X-Received: by 2002:aa7:ca05:: with SMTP id y5mr48408983eds.353.1626874520277;
        Wed, 21 Jul 2021 06:35:20 -0700 (PDT)
Received: from localhost.localdomain (host-79-27-97-200.retail.telecomitalia.it. [79.27.97.200])
        by smtp.gmail.com with ESMTPSA id f22sm10718991edr.16.2021.07.21.06.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 06:35:19 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8188eu: core: Remove set but unused variable
Date: Wed, 21 Jul 2021 15:35:18 +0200
Message-ID: <2206478.VjXv8tfObp@localhost.localdomain>
In-Reply-To: <YPfYWk5afrgGecDR@kroah.com>
References: <20210701154647.18975-1-fmdefrancesco@gmail.com> <YPfYWk5afrgGecDR@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, July 21, 2021 10:18:34 AM CEST Greg Kroah-Hartman wrote:
> On Thu, Jul 01, 2021 at 05:46:47PM +0200, Fabio M. De Francesco wrote:
> > Remove variable sec_idx because is set but unused. Issue detected by
> > GCC with -Wunused-variable.
> > 
> > Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
> > ---
> > 
> >  drivers/staging/rtl8188eu/core/rtw_ieee80211.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> Does not apply to my tree :(
>
Your tree changed while my patch was expecting your review. This happened 
because someone else worked on the same code while 
"the development tree you have sent a patch for is "closed"
due to the timing of the merge window".

Unfortunately,  I was unaware of a similar patch in your queue because I 
didn't notice that it was sent to the linux-staging list a few days before 
mine.

This is not the first time that something like this happens, so I think it's 
better to not work and send patches while you keep the development tree 
closed.

Sorry for wasting your time.

Thanks,

Fabio



