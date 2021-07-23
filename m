Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF4272
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 07:29:40 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id gn11so2454397ejc.0
        for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 00:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RyKdhfhM2ozADzjoi9snqvshlMAKUsPQuXC9VR1R4bY=;
        b=SuDfJj3oDKJDiz7MT1FAYF4FSwDuxSs2g5RcA4xt64rTeUBtstcti2DpV2dXup53uX
         ojjkF0eiIYXwP7lS3dhnPiFQzNNPTMvAdTfl2dXLCcmsdnrAq4qimMsmWm308ByoL7dj
         RWjnPcX1z4Isr0Bf69Bvxc5shPAmUQi2mPCglcz3nfeHjaI6XCWPkHpW/ppgMabTpXy/
         +UqxwCVOzzCmIsfYhTGApAj1aP8NRCH1o56vXQ7FkX9Yh7uLG2YGJGjHUbZ48twuPseT
         vs+4tR+7exVJSzyweNNJMypsMBSpgUdStwMiller3U5I8D1NE8Z3LOtRZG37i1VNpXQQ
         fvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RyKdhfhM2ozADzjoi9snqvshlMAKUsPQuXC9VR1R4bY=;
        b=Ia9RS96nOhKQqFn5ABWwYDpcNLPD7GKbBv83nkLvTHD4+RzRaQUd1ycRwY7s7jl0HG
         3IYaLxj/KTdRWAaKxvuuX1gEgd3Hb+Qk7LEr+5881v/bcnMzN+RDdefhD1B403IudZgI
         6zc9q3MyRsB3+kyFxvgw6moK0aN4HTiCERFtmTRZG3KA+MtYL5szrz9RCIZ7YSDFhRrt
         uY0hLG/tkvkg848iJrbrN6hUHCVH0hNfNLqqEH4BjlLwbKtgNDTm8hK5rbkubecGDRT8
         9LPeVAhhJndxqsSk5EA+N0sOUoAiHgOGjx90GQVHRS23tQ4aIE8aC3fHipLOf8eZYogp
         PS6Q==
X-Gm-Message-State: AOAM533smcV9wd25n2y4emtelkh3bkIX0BvTSf13ATBAC49dIxh3ApUZ
	bY30xpN/eG4YCc8thkotrTQ=
X-Google-Smtp-Source: ABdhPJy4X5MML4d5I6wlTr50QNM0NZRXqSCt/g6LMOLVd0QxCeG3+clvdMjt92GD7rPFhBfH2+mNQQ==
X-Received: by 2002:a17:906:38ce:: with SMTP id r14mr3375484ejd.268.1627025379124;
        Fri, 23 Jul 2021 00:29:39 -0700 (PDT)
Received: from agape.jhs ([5.171.81.31])
        by smtp.gmail.com with ESMTPSA id da23sm13571604edb.34.2021.07.23.00.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 00:29:38 -0700 (PDT)
Date: Fri, 23 Jul 2021 09:29:36 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Phillip Potter <phil@philpotter.co.uk>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 6/7] staging: rtl8188eu: introduce new supporting files
 for RTL8188eu driver
Message-ID: <20210723072936.GA1613@agape.jhs>
References: <20210723004214.912295-1-phil@philpotter.co.uk>
 <20210723004214.912295-7-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723004214.912295-7-phil@philpotter.co.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hello Phillip,

On Fri, Jul 23, 2021 at 01:42:13AM +0100, Phillip Potter wrote:
> This patchset is split in order to keep the file sizes down. These
> supporting files are part of the newer/better driver from GitHub modified by
> Larry Finger. Import this as the basis for all future work going
> forward. Also, modify Makefile so that driver has same module filename
> as original rtl8188eu driver from staging.
> 
> Suggested-by: Larry Finger <Larry.Finger@lwfinger.net>
> Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> ---
>  drivers/staging/rtl8188eu/COPYING  | 356 ++++++++++++++++++++
>  drivers/staging/rtl8188eu/Kconfig  |  25 ++
>  drivers/staging/rtl8188eu/Makefile | 509 +++++++++++++++++++++++++++++
>  3 files changed, 890 insertions(+)
>  create mode 100644 drivers/staging/rtl8188eu/COPYING
>  create mode 100644 drivers/staging/rtl8188eu/Kconfig
>  create mode 100755 drivers/staging/rtl8188eu/Makefile

Nice work...

a new TODO file is needed.

@Larry, maybe you can help us telling what's needed
to mainline this new rtl8188eu.

thank you,

fabio
