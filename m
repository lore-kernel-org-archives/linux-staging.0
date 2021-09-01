Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4443FD6
	for <linux-staging@lists.linux.dev>; Wed,  1 Sep 2021 16:50:08 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id w4so55645ljh.13
        for <linux-staging@lists.linux.dev>; Wed, 01 Sep 2021 09:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w6CphMFgf5XtmkIUIZdS3zg3lS0CLaheDoiUHPnX0Fk=;
        b=XWORPcX4JUiWNYhys31DRm5lPzmQ8u3sh4J6BqTmpr0mg4ugdlAnpEPUP/nDyLFoi4
         LXOKc1TEP4Rcp3WKfC9pWuacs8HoE5v93ke7gWjPkYyZRbmnql6lTS3lcu+Nee5S2CQs
         4KLUoQY7eshWi4Uj/Y8cdKSRMXIp/YYbL9Ypo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w6CphMFgf5XtmkIUIZdS3zg3lS0CLaheDoiUHPnX0Fk=;
        b=Sj2O4iYDePaNMJG3Kf8PPotROHsE6Psc42ld5suA1lo8Dv8LbGrB0sweFqOEfKSgBL
         5zuwGbWEZHkTS5irH2pIfugg0z1/RC6ljK+IEeiXIU7VUAZu+ksnQbWeO4D5YCCoiMXO
         pVfTvsqT7U6Xk4lMI2wkvsr6xk7QP9xKERWrhTtcx8LntmW+0xB1THiuOzNAxoOt8+y9
         FXzobKJrLjlWS0MI45xHfNu7V4ymQ7hGEgd+OdrlKew6SlqzBMRcp4+8s2319J42aV2y
         IN7Vi6Cbm7X8b0zsTU4wOCztskoXJh7DTCItMG+ia2Yzu1bPu5M6r8JiThSuKULzVkP8
         eY/g==
X-Gm-Message-State: AOAM531vXa+ly6zyoeBs0ZJNlifl5QpV+/7q2HFRsXvUrYOTkcmwYlrO
	Xi2DBwo+JeJdusv4ZnAe/72TizVNSL3aOeQ4
X-Google-Smtp-Source: ABdhPJxLY9IDvMnk00FeTsXXwRX0krVcyF+0Ctd/BX/6iGuyQ+djFTJwX2gyi80l0RTZIrOZ9ILsfg==
X-Received: by 2002:a2e:8553:: with SMTP id u19mr549859ljj.158.1630515004889;
        Wed, 01 Sep 2021 09:50:04 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id u2sm21655lji.82.2021.09.01.09.50.03
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Sep 2021 09:50:04 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id p38so421343lfa.0
        for <linux-staging@lists.linux.dev>; Wed, 01 Sep 2021 09:50:03 -0700 (PDT)
X-Received: by 2002:a05:6512:1053:: with SMTP id c19mr273608lfb.201.1630515003669;
 Wed, 01 Sep 2021 09:50:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YS+LXqoDGk0CqU1Q@kroah.com>
In-Reply-To: <YS+LXqoDGk0CqU1Q@kroah.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 1 Sep 2021 09:49:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=whqN1gAZk0ZD_4JxGemdbpnQkDaNFY9MjW==v-kb1J-fw@mail.gmail.com>
Message-ID: <CAHk-=whqN1gAZk0ZD_4JxGemdbpnQkDaNFY9MjW==v-kb1J-fw@mail.gmail.com>
Subject: Re: [GIT PULL] Staging / IIO driver changes for 5.15-rc1
To: Greg KH <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Phillip Potter <phil@philpotter.co.uk>, Larry Finger <Larry.Finger@lwfinger.net>
Cc: Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 1, 2021 at 7:17 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> Lots of churn in some staging drivers, we dropped the "old" rtl8188eu
> driver and replaced it with a newer version of the driver that had been
> maintained out-of-tree by Larry with the end goal of actually being able
> to get this driver out of staging eventually.  Despite that driver being
> "newer" the line count of this pull request is going up.

Ugh.

So this had a conflict with the networking tree, and commit
89939e890605 ("staging: rtlwifi: use siocdevprivate") in particular.

Ok, so that conflict looked annoying but harmless - git saw the new
driver as a rename of the old one, and tried to actually apply the
changes from that commit to the new one.

And git actually did a reasonable job, everything considered. There
were enough similarities that it wasn't entirely crazy, and enough
differences that it caused conflicts.

HOWEVER.

Actually then looking at the root causes of the conflicts, as part of
just trying to finish what git had started, I notice that a lot of the
code in the new driver was just completely dead.

As of commit ae7471cae00a ("staging: r8188eu: remove rtw_ioctl
function") the only caller of rtw_android_priv_cmd() is entirely gone.

But rtw_android_priv_cmd() was kept around, and was in fact the only
reason that the files

    drivers/staging/r8188eu/include/rtw_android.h
    drivers/staging/r8188eu/os_dep/rtw_android.c

existed at all.

End result: instead of trying to fix up the conflict in dead code, I
just ripped out the code completely.

So my merge actually looks simple and clean: when you look at the
conflict diff of my merge, all you see is that I removed
'os_dep/rtw_android.o' from drivers/staging/r8188eu/Makefile.

What you don't actually see as a conflict, is that I removed those
files entirely. That removal doesn't show up as "conflicts", because
that filename didn't exist in my HEAD commit before the merge at all
(because my tree had that old "rtl8188eu" driver).

So this email is just a long explanation for what I did, to make
people aware that maybe I screwed up. It builds for me, and honestly,
it makes sense to me in ways that your git tree did not, but I can't
test any of it.

Added Arnd (for the siocdevprivate conversion) and Phillip/Larry (for
the r8188eu driver side) - can you please double-check what I did.

                   Linus
