Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821AC72
	for <linux-staging@lists.linux.dev>; Wed, 24 Nov 2021 14:56:54 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id b5-20020a9d60c5000000b0055c6349ff22so4593692otk.13
        for <linux-staging@lists.linux.dev>; Wed, 24 Nov 2021 06:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LRNdgmKoGHd8G0IdZK2kJhuKe2APSp+LVa8VH3GbUIo=;
        b=ROINuAUVxy/ZbYmgWfHqBUzAuDwOQ6cqNQOfBVhy96Gry9ayUW0v2eAWocnQnqzx3v
         xgc65hVhfOFf2QyYOHtvwTkNw/gi7ENcARWpSUc8tTr1PgbR0vhK1mbBo7dmloWOedtW
         UEV/xNy8uprFwFS6gA4oIwhtzB0uMlUnBPPMIpu/w6ORmy8QrYL/n7wt6j3A80GfGrOw
         aGeIbUirqzK0slqUpZBhp9oUS8RL/fGa4ebYV8beZ3Si9FYiK4+2z4GZsVqQMSMw8AI2
         BcRuVz9lYpndNk5s+3smn0XoM4+Txn+jtQiDusTUa3GVwiYUH1hPVXmtuXdlQ0MJQneg
         SFBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LRNdgmKoGHd8G0IdZK2kJhuKe2APSp+LVa8VH3GbUIo=;
        b=FiTMhvX7One0TWAPmuSXL96Px7jHazWQoHaQF+P891UZT/dNhZnhw8k2nevxI5gkjg
         VwBhPKcCb30YWdtAczIpprZJww5QQk9RjbGFs8Wief4uyFD7czbqpJdCECVeXC3dLFxg
         qY4dhNbNiYGbpcmq/BGZrzbx6PH03FknFpowEYmrKIT/DRLDsXxoZao8mgsUopsdpcvV
         qifYKNXKO/zCZ+vB0p4ir8B12OkWmoRqQLwkc369FDniUUaHgrPUWwcI/g0bC0Ti15fk
         Vw7/XVsJ17/5VyJJ1nlEIMh9/GKVNawUmF7luB4lJqnEexecKyinT2JwvFuY9jB11bNH
         SiRw==
X-Gm-Message-State: AOAM532u4VlBiTlrGItFQ8o/Mubyvm+Y5/R5WmmQpGqDyzsAa21Jm7Hm
	n3EhB27BysTjiIL8BxRcbPta6tfBIcfNJPG0wO0=
X-Google-Smtp-Source: ABdhPJyqccrZCGcFmld4szOfDhBK9/E4Pq6QPLBGa5/rNNSCpHY0z5698ckRmlDMZ9GPhwZ2MvYxx3uekzO2OiCtwvA=
X-Received: by 2002:a9d:2486:: with SMTP id z6mr14024908ota.210.1637765813712;
 Wed, 24 Nov 2021 06:56:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211123232551.210016-1-makvihas@gmail.com> <20211124131414.GJ6514@kadam>
In-Reply-To: <20211124131414.GJ6514@kadam>
From: Vihas Mak <makvihas@gmail.com>
Date: Wed, 24 Nov 2021 20:26:41 +0530
Message-ID: <CAH1kMwRcEwc64XjPAXbJUPFsLTei2pmzP3r_6ZVWQ+NFkaa57g@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: use max() and min() macros
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Larry.Finger@lwfinger.net, Phillip Potter <phil@philpotter.co.uk>, 
	Greg KH <gregkh@linuxfoundation.org>, straube.linux@gmail.com, nathan@kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>> Please run scripts/checkpatch.pl on your patches.

>> CHECK: Alignment should match open parenthesis
>> #41: FILE: drivers/staging/r8188eu/core/rtw_wlan_util.c:723:

Ahh sorry, my bad. Will resend v2 after fixing that.

On Wed, Nov 24, 2021 at 6:44 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Wed, Nov 24, 2021 at 04:55:51AM +0530, Vihas Mak wrote:
>
> > +
> > +                     min_MPDU_spacing = max(pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para & 0x1c,
> > +                                                     pIE->data[i] & 0x1c);
>
> Please run scripts/checkpatch.pl on your patches.
>
> CHECK: Alignment should match open parenthesis
> #41: FILE: drivers/staging/r8188eu/core/rtw_wlan_util.c:723:
> +                       min_MPDU_spacing = max(pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para & 0x1c,
> +                                                       pIE->data[i] & 0x1c);
>
> regards,
> dan carpenter
>


-- 
Thanks,
Vihas
