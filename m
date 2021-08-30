Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110EB3FC2
	for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 00:16:28 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id ot2-20020a17090b3b4200b0019127f8ed87so11026519pjb.1
        for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 17:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lfvUPoqcsdtWp2xQNM0SN6X8Hkd9bKLbzzZB8u6GYqA=;
        b=s1RBr2BDjIqmSADqZJM0821Es4cznWSVszRMOTWsNkxJj1SaG2/cZK89mot5U7lcE6
         e5wI0RQVsYWB6V3cYeiepqfpDyM9VZ9EpT/FeszNQA3wrnbAi1yJo1m0EFCdrEd0ODw4
         on21sa3P4CgPLO8d5wNjFzhCZYD66ZooEYqe1voTzIUdj/PiUG4BIDz/MuIv7N+RJCCh
         2KtiiCMGIpVem6XMVY34j2+aCBIj1NzXS69DcYlnsaUgBBYTCiuOVcAD1JyPgmP4oCi4
         9YcxJDvuDAJkSU/FbbYyf7Y+2GD8MT9f+pHn/36VtjLNp6kiWKli8cAqsRhA1Xfo9Nhp
         0B1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lfvUPoqcsdtWp2xQNM0SN6X8Hkd9bKLbzzZB8u6GYqA=;
        b=ja7jPPvWSBp2bw/4AqepzPkYRJ4ABzf86ivCi06LsKocvVXgtkM/5m873GIZPI55Yx
         XIOF8k4jSIl98f1drBhI350ly1DQe2Tz/isI0qzW1afBh7JL0cmTofCATer8dzjkOAsT
         JxsDEXqxD2NNtF+Pif7rZdDWini9PEXfeiyJBjhq8gTyHSKYjMz93u8+nVZDkyohVz0m
         I574I+qUFvLcvVtxvHhxAZMCkTNRVRHRyRW+Ei2y3jVhjSwKozltgqvKEtBrlcjOvWgi
         ZSdFWDqcTqZez5+H2U+OZhc/4ZjnJOunn9cRGhMXuK7iYyGHSdaZNid2Jxu6YPZh/sM0
         mchA==
X-Gm-Message-State: AOAM533q+Q8FwrcXCFNwjOsjzm5ZP20OGluMhuPDOteX5YxtcrXUR5Lk
	1HNH6ySCTqdSbCP7dvUzDm1bRXQfH82tKYk7HMe7gQ==
X-Google-Smtp-Source: ABdhPJzPA7ddCc4MfwJdTsKB2/CaMhpr98rYQhnXm4B9fIZpU/+zj9PvJZh5uu8BMvhtLbl5SiBY6MEX6ZSr56XuT6w=
X-Received: by 2002:a17:902:f704:b029:11a:cdee:490 with SMTP id
 h4-20020a170902f704b029011acdee0490mr19290977plo.37.1630282588598; Sun, 29
 Aug 2021 17:16:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210829112555.8726-1-straube.linux@gmail.com>
In-Reply-To: <20210829112555.8726-1-straube.linux@gmail.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Mon, 30 Aug 2021 01:16:17 +0100
Message-ID: <CAA=Fs0==H6_Jne-hRoQWFedPE02zaoL=Mov0mJam52+YQtEHKQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] staging: r8188eu: clean up unnecessary type casts
To: Michael Straube <straube.linux@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Martin Kaiser <martin@kaiser.cx>, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 29 Aug 2021 at 12:26, Michael Straube <straube.linux@gmail.com> wrote:
>
> This series removes unnecessary type casts from de/encrypt functions
> in core/rtw_security.c.
>
> Tested with Inter-Tech DMG-02 adapter connected to a CCMP network.
>
> Michael Straube (3):
>   staging: r8188eu: convert type of second parameter of rtw_*_encrypt()
>   staging: r8188eu: convert type of second parameter of rtw_*_decrypt()
>   staging: r8188eu: remove unnecessary type casts
>
>  drivers/staging/r8188eu/core/rtw_mlme_ext.c   |  2 +-
>  drivers/staging/r8188eu/core/rtw_recv.c       |  6 +-
>  drivers/staging/r8188eu/core/rtw_security.c   | 61 +++++++++----------
>  drivers/staging/r8188eu/core/rtw_xmit.c       |  6 +-
>  .../staging/r8188eu/include/rtw_security.h    | 12 ++--
>  5 files changed, 42 insertions(+), 45 deletions(-)
>
> --
> 2.32.0
>

Dear Michael,

Looks good to me, built/run fine again, for whole series:

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil Potter
