Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A9F1383
	for <linux-staging@lists.linux.dev>; Tue, 17 May 2022 13:51:59 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id w123so22338686oiw.5
        for <linux-staging@lists.linux.dev>; Tue, 17 May 2022 06:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dqs07Jep3liZKF0qlg72VGmG+rgWTVuefUqFlS6fV4E=;
        b=DiyJpaLtLiYYlr+WkATrplEODo5bpr5osxh2vS/3wvBAVDg1+JkKE+BoRb/ttsfyxR
         oyGcWzpr8/ipWcCIG1yqypp3VD5SCK5bpCmQ8+b0t/LwlQQ1LRSzngujpNhBVwqW0qlN
         yI4eubrQloteLw4cIuZ4Uvom4nlBVe0o8aM4W6lG/RTxYc/HFY1yvowv9/qGN4I09tEk
         4aeEaBU3bCgsrByt+TIHgA6Ig/WKhID3AuRuRmrK9FzIHkZKm8p4s0osfPr9hwLfegpm
         QfzFD8+BNwyg+FWKLL3TAH6bEtftK+2esD3jqnRtviYJ/lZTlhvbJFLu7JTZxUN+dBKY
         vnmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dqs07Jep3liZKF0qlg72VGmG+rgWTVuefUqFlS6fV4E=;
        b=NMao3C9YC68DoNbc8lC/TGvYtjAmhgA10jjCYy/zpjrLpBP8JePd15CS00Ue6huSn4
         Eu41zv/RlcdQiWJESObqxcaVlmrl0egdwFdsaR1uVij5uYsrNpJ2dnIGFI2qwR7Dwjbl
         mcrtGfAoQVDDveSUerASW4aqULmhmoA0UAwocKa5gjtbq3A++50vjNpyU5Jm47pXoP+l
         BJyFfg8uY9BmO7M/WWbFl+IcRasg0PmVARZDKNamwDr7pc/A2AzecEz9MLOvxRNkepey
         73abzFmEbNGlnLUryyGzC0LqPBDMupZGPa2puQZhxdhFC7+dSJVfJ7szQ+Fzw13sGjUb
         H2HQ==
X-Gm-Message-State: AOAM5318CMEcXaK00YkE4GQOBhrvKqSWD+l5q7rLwR+vHPAUPw2RU3ST
	BVhkMpInPVcNjN44F9yZyIpBHvpa4/b5VF2iapU=
X-Google-Smtp-Source: ABdhPJwryDf71vdU031pJAEI8zXEOUflzmYA497rKIyES5J2JKlDPPLwnq9rb0Qv4oal9+7ZDUMhhtoygFYY1XXmzsY=
X-Received: by 2002:aca:39d5:0:b0:326:b279:592 with SMTP id
 g204-20020aca39d5000000b00326b2790592mr16218328oia.276.1652795518396; Tue, 17
 May 2022 06:51:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220516170306.6008-1-makvihas@gmail.com> <20220516170306.6008-3-makvihas@gmail.com>
 <7b926f43-8c6b-6eae-edc6-02dc16376eb0@gmail.com>
In-Reply-To: <7b926f43-8c6b-6eae-edc6-02dc16376eb0@gmail.com>
From: Vihas Makwana <makvihas@gmail.com>
Date: Tue, 17 May 2022 19:21:47 +0530
Message-ID: <CAH1kMwTM9oT+wr7D7km68LXYWxs1TvsjhsFizq9Bm2juvQpJyg@mail.gmail.com>
Subject: Re: [PATCH 2/3] staging: r8188eu: fix checkpatch.pl warnings in rtw_pwrctrl
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Straube <straube.linux@gmail.com>, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 17, 2022 at 1:15 AM Pavel Skripkin <paskripkin@gmail.com> wrote:
>
> Hi Vihas,
>
> On 5/16/22 20:03, Vihas Makwana wrote:
> > Refactor the code to fix following warnings:
> >      WARNING: Comparisons should place the constant on the right side of the test
> >
> > Signed-off-by: Vihas Makwana <makvihas@gmail.com>
> > ---
>
> [code snip]
>
> >               if ((pwrpriv->smart_ps == smart_ps) &&
> > @@ -356,7 +356,7 @@ void rtw_init_pwrctrl_priv(struct adapter *padapter)
> >
> >       pwrctrlpriv->LpsIdleCount = 0;
> >       pwrctrlpriv->power_mgnt = padapter->registrypriv.power_mgnt;/*  PS_MODE_MIN; */
> > -     pwrctrlpriv->bLeisurePs = PS_MODE_ACTIVE != pwrctrlpriv->power_mgnt;
> > +     pwrctrlpriv->bLeisurePs =  pwrctrlpriv->power_mgnt != PS_MODE_ACTIVE;
> >
>
> Please remove extra space
>
Oh sorry, my bad. Will submit a v2.
>
>
> With regards,
> Pavel Skripkin



-- 
Thanks,
Vihas
