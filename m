Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57712C80
	for <linux-staging@lists.linux.dev>; Thu, 10 Feb 2022 22:14:16 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id x136so17840897ybe.11
        for <linux-staging@lists.linux.dev>; Thu, 10 Feb 2022 14:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HzTsCVg25jOEc/xpZYzmfEGfUf94ZVS3t/UZfGC+2lo=;
        b=KWkHpDLtazxt6v2gNisdLxNCR3V4u9TjeT/TQyQaw1v8TcBCtydORV69sbjWvAIn3f
         /3JNnbLrUOkgum+LUuQUAE24ojtws1LPibgwA+dDSVakatUgw0+PmHDgko8o/k4CH/jy
         snaAoLir6VxboHWgMsFcW6ONHkX7Gf0FqzFKXT+/aVbd4ukFb+XM4vZifbBHNoWX0qGv
         bQx+uHD3+XTqKDuIBk2rn2HEiq4XQOpbxKRdEOOKnIlNnm7jlNQVeeo1liiZuhmje+jo
         Yd+qe3Z8G2VfzSGRoj7FBn/9jERXb6rtByUU/kCQ72f0c/B6kk1NTB27eJQAs/VWbzUs
         w/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HzTsCVg25jOEc/xpZYzmfEGfUf94ZVS3t/UZfGC+2lo=;
        b=mVeUNTaVejo+N5RljI7cmQsQ64qOyqfpL82Xt/Y9ldk1+xy1fAsmTiFgedx0WyBQgH
         gS3HhURhdE0uM/eNU57sOY/sRB4Zp0d4Omf6YK7yvXsmJ+7ZJvlDqMbDKmUIbgCPGepL
         F+4A44qeaPppfONOKjIlmEltUgD7Cs+yqZoGfc7dsrMSRqw3qc1Em6Uuau4BHVXb4nV+
         G/d+8IiaWCubPkkNVAGdVKGqvv1ZpQjzfssmd3etprMzfNGii7Csl6ts4zWfawb13C4l
         5xkTgGGo0rMZlOllJ8MHCKRrdGg6uADnZAnXJ/U1Ta0gXuJKl1SmGIlRXon84uzjikwU
         YqgA==
X-Gm-Message-State: AOAM530hTF0D6lZsUehJtHCfz+JPYh+bMN8OBQ4gHWENs5QOcaQLOfUS
	9ioRl0ktfMYGssGL/Dq+AWue5p+EDccQdZlNY3s=
X-Google-Smtp-Source: ABdhPJz4F7WbPEr0F2YLkQmxbw7f5LqRfio13kMy4Rw8WvaOeqmmqBPWmhAf8DxRWfraaMPqQx8z9M6X4zA1zs7UPfs=
X-Received: by 2002:a81:bd12:: with SMTP id b18mr9687458ywi.136.1644531255734;
 Thu, 10 Feb 2022 14:14:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220209205740.9926-1-leonardo.aa88@gmail.com> <YgS2dAHofenuyVjg@kroah.com>
In-Reply-To: <YgS2dAHofenuyVjg@kroah.com>
From: Leonardo Araujo <leonardo.aa88@gmail.com>
Date: Thu, 10 Feb 2022 19:14:04 -0300
Message-ID: <CACytOSBrQQg6Zuy6jesmjrbqgTkEKcaCrp7aB+DEuAE917Ww2w@mail.gmail.com>
Subject: Re: [PATCH] Staging: r8188eu: core: Avoid CamelCase: <bEnterPS>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Mr. Greg,

first of all, thank you for your time and review. I am learning a lot
from your responses since I started contributing, after I came across
a YouTube video of one of your presentations on how to contribute to
the Linux kernel. I will study the documentation more in depth and
send a proper patch series as you requested.

Best regards,

Leonardo Araujo

Atenciosamente,

Eng. M.Sc. Leonardo A. de Araujo


On Thu, Feb 10, 2022 at 3:53 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Feb 09, 2022 at 05:57:40PM -0300, Leonardo Araujo wrote:
> > Fixed a coding style issue.
>
> Please read the kernel documentation for how to write better subject
> lines and changelog texts.  These need a lot of work, you can't just put
> the checkpatch message in the subject and then nothing in the changelog
> body.
>
> >
> > Signed-off-by: Leonardo Araujo <leonardo.aa88@gmail.com>
> > ---
> >  drivers/staging/r8188eu/core/rtw_cmd.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
> > index e42119e16284..4ec4da6d3078 100644
> > --- a/drivers/staging/r8188eu/core/rtw_cmd.c
> > +++ b/drivers/staging/r8188eu/core/rtw_cmd.c
> > @@ -880,7 +880,7 @@ u8 rtw_set_chplan_cmd(struct adapter *padapter, u8 chplan)
> >
> >  static void traffic_status_watchdog(struct adapter *padapter)
> >  {
> > -     u8      bEnterPS;
> > +     u8      b_enter_ps;
>
> No, think about what you are changing here.  Why keep the "b" at all?
> What does this variable name?  Why was there a "b" to start with?
>
>
> >       u8      bBusyTraffic = false, bTxBusyTraffic = false, bRxBusyTraffic = false;
>
>
> What about all of these other variables, why ignore them and not send a
> patch series to fix them all up?
>
> Remember where the "b" comes from, this is "hungarian notation" and is
> trying to describe the type of the variable, which makes no sense in
> this century.  Please do not keep it around for no reason at all.
>
> thanks,
>
> greg k-h
