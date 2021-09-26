Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74D73FC7
	for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 08:39:01 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id s17so36530608edd.8
        for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 01:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FqZLHp6P5onDVzAVu1pnrTbH+41zot6j1xPu0nqk/aU=;
        b=qWszrahJmuxMdIv6Am1sSQgwKsHLYjmvSrd5tXh/U0y60WoCkaERe35A/GKooWTJ1a
         Fuo8wTKYwLAP80zpydWOx67sz0a3dv/LLAKd3GzOdm2qWjkjyX6mu0UfG0/H+krouamT
         ihGCjXPm9oZJ0Chr/ABaftLl+oqyJrRJTsKbwcDYG4qu5qniiQAvxNDueMiY3PyoL8UY
         mWYXUGYtqrNmKwabrmka0d7Jo3a6v7g+1mACK/8bAMjyg7Cfj6/uvD2S9vIVgPQBDxMz
         i42YNB1xx1gcFSa4SvPtWMvZ6nMylHbQdoNADG8eSkMWesmd5dViwFNlVc7YWOUvn0iT
         xbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FqZLHp6P5onDVzAVu1pnrTbH+41zot6j1xPu0nqk/aU=;
        b=sIBsdmSvUw5m1wJdPJzPUUkVud2EHrj2xrvGgJJ9Vc/6xXJvJsokzhWMwjbA8NtMMY
         AHl4Tb6DKu78oluQ1NSU952z+Yke16AyCW9OkoDDpv6m7+aWY73V1y7SXlyRLvHH66xK
         LLfMTFJtuI0eGWC2JPjpTVlDCifkeVHiqUDV7vMerttk7WLlFrPwH9tvk64xdvfsxVW9
         7AdLDDYqepmtnWI7xHz/9a5RkpTDvRxFmjHTXQyNBdsSBHIVy/lfHk8CbZ/+wa2GC9JZ
         FQSBvMlohgnRbCXb3A46MIyajnJ9t3D0EiKgExFkhbcAapbPmMU/DGQY3B/boFZprRZ7
         V0KA==
X-Gm-Message-State: AOAM531+MAs/XKJAdF4b7UUAu8hcSwnGaezRKIJyFCyzU/o5DeE5IJ5Y
	iLsB4OuYj54KhlHJ0g3v/Kc=
X-Google-Smtp-Source: ABdhPJzOKRUq/oNsXGrP3Z2Ivtj4lQMcgm0FHDN+WVD9K0bUezqU67bKccsmQYofOU7HCWpX7VmJ/Q==
X-Received: by 2002:a17:906:1fc1:: with SMTP id e1mr20069380ejt.515.1632645540166;
        Sun, 26 Sep 2021 01:39:00 -0700 (PDT)
Received: from localhost.localdomain (host-212-171-30-160.pool212171.interbusiness.it. [212.171.30.160])
        by smtp.gmail.com with ESMTPSA id dm8sm8502204edb.90.2021.09.26.01.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 01:38:59 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Estner <michaelestner@web.de>
Cc: michaelestner@web.de, Lee Jones <lee.jones@linaro.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] avoid crashing the kernel
Date: Sun, 26 Sep 2021 10:38:57 +0200
Message-ID: <7598246.TGqz6ispmn@localhost.localdomain>
In-Reply-To: <20210925200433.8329-1-michaelestner@web.de>
References: <20210925200433.8329-1-michaelestner@web.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday, September 25, 2021 10:04:30 PM CEST Michael Estner wrote:
> To avoid chrashing the kernel I use WARN_ON instead.

"[] I use WARN_ON instead". Instead of what? 

Changelogs must be self-contained. I had to look at the diff to complete that 
sentence in my mind.

Please don't ask reviewers to go back and forth commit messages and code in 
order to get the whole picture.

However, my suggestion is only about the formal aspects of proper patch 
construction. The actual top priority is to properly solve this problem using 
the tips provided by Greg K-H with his review.
Thanks,

Fabio

P.S.: "chrashing" => "crashing".

> 
> Signed-off-by: Michael Estner <michaelestner@web.de>
> ---
>  drivers/staging/most/i2c/i2c.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/most/i2c/i2c.c b/drivers/staging/most/i2c/
i2c.c
> index 7042f10887bb..e1edd892f9fd 100644
> --- a/drivers/staging/most/i2c/i2c.c
> +++ b/drivers/staging/most/i2c/i2c.c
> @@ -68,7 +68,7 @@ static int configure_channel(struct most_interface 
*most_iface,
>  	struct hdm_i2c *dev = to_hdm(most_iface);
>  	unsigned int delay, pr;
> 
> -	BUG_ON(ch_idx < 0 || ch_idx >= NUM_CHANNELS);
> +	WARN_ON(ch_idx < 0 || ch_idx >= NUM_CHANNELS);



