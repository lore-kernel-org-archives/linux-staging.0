Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1197E70
	for <linux-staging@lists.linux.dev>; Wed, 11 Aug 2021 23:30:54 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id q2so4788787plr.11
        for <linux-staging@lists.linux.dev>; Wed, 11 Aug 2021 16:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oGjft6uK2qjPni3rYs2xkfv9Qr3hWhHlCu61Lfg9dwo=;
        b=KGF7OvjM6xpm2dcnV4TZt94/0PP/6rryAn51TQtMI8PMyNstZiqpR4o4M6dhTamRWs
         g9EOZxb5D89XEfktvUEHHhPkpXy+Hmi05VOWRgwTVd9OLvFSv4xWFXhNWjEyIN09KyKs
         4fyqkWNdWLKgAPlcPDpAcmVW8lSwcX6cLZVgTZo6u78f/aDCPj+/UighVkaCNH/VsJGQ
         7hZeajrWOtjCr0mUDPSGbr2zvZ/0e2Z3s/NNdhwxHuoGSZq50liLutTN/XQtkRapPCgV
         FF6Bcix3tq/Al/ufi1oP33g4e6gANYimhDTdAXfmGgi4fPZkt9KFhhdzxGEY6dDmG5KC
         +BNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oGjft6uK2qjPni3rYs2xkfv9Qr3hWhHlCu61Lfg9dwo=;
        b=Lf2iCTt4hQjSD5NU3cE/D6FC70VGqBYVtTYsW3qs78CkHimj3x09j85v87NBSVAuFM
         30QE0B5wjZNv/N65Fwn/ZbkhytF8Hid8y4zjJN6dmaMBWNfw3yciCLwM3KsKO/UpQkwY
         N3azmlRBkYQdc0v2YXbhENDI/eUzx6D/AtyX7cK/lqBrEKS+HNpNDV22b7q5Qryzjk/E
         B8hewSGpmKrE6vchqtdfDMjz+ISpMIabqSriT7vXOyG7juU1N4EP9paI4N8ZMAwlpkbS
         1M9TiOur/GGHoDcak53vQHdFUSt6+9KD5euEXylH1t5lxX5+CaFyFeKXjPMqSbDT8QjM
         19OA==
X-Gm-Message-State: AOAM533TuzNbPKNbbNEzbxYbHayaRW80AQUP07icPZ1ZmZ5jc3Tm108e
	w447sMcc94etshn4QrqV+plHfc8jOaGgkg5Njb1CnA==
X-Google-Smtp-Source: ABdhPJxlna/Ynzwk5Dff6Ys7vZddkj55PSC1UknedewCBNdz+1n2p06B5wLltjn/hQhKtMBQvZDWD+WnZ2/JP5T0TSs=
X-Received: by 2002:a17:90a:1b2e:: with SMTP id q43mr1054428pjq.217.1628724653564;
 Wed, 11 Aug 2021 16:30:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210810235047.177883-1-phil@philpotter.co.uk> <37fc4e87-3131-eb54-d47d-8ed4dc85e983@gmail.com>
In-Reply-To: <37fc4e87-3131-eb54-d47d-8ed4dc85e983@gmail.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Thu, 12 Aug 2021 00:30:42 +0100
Message-ID: <CAA=Fs0nkmsnewA8z_XKB--0bcxOoPnxZgn-_1fD3CccfN4nt3A@mail.gmail.com>
Subject: Re: [PATCH 0/8] staging: r8188eu: cleanup several warnings
To: Michael Straube <straube.linux@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Aug 2021 at 07:39, Michael Straube <straube.linux@gmail.com> wrote:
>
> On 8/11/21 1:50 AM, Phillip Potter wrote:
> > This series does a lot of cleanup, and came about due to me noticing
> > that the Makefile contains several lines that silence build warnings
> > about unused variables, functions and so on.
> >
> > It accomplishes does three things therefore:
> > (1) Removes the unused functions no longer called by rtw_ioctl, which
> >      was deleted in a previous patch (with the exception of the android
> >      code, which I will add back in once ndo_siocdevprivate is merged in).
> > (2) Cleanup all build warnings resulting from removing the offending
> >      Makefile lines.
> > (3) Remove the offending Makefile lines so that future build warnings
> >      can be caught locally before submission as well.
> >
> > Phillip Potter (8):
> >    staging: r8188eu: remove unused functions from os_dep/ioctl_linux.c
> >    staging: r8188eu: remove unused oid_null_function function
> >    staging: r8188eu: remove unused label from recv_indicatepkt_reorder
> >    staging: r8188eu: remove rtw_mfree_sta_priv_lock function
> >    staging: r8188eu: remove unused variable from rtl8188e_init_dm_priv
> >    staging: r8188eu: remove unused variable from rtw_init_drv_sw
> >    staging: r8188eu: remove unused variable from rtw_init_recv_timer
> >    staging: r8188eu: remove lines from Makefile that silence build
> >      warnings
> >
> >   drivers/staging/r8188eu/Makefile             |    9 -
> >   drivers/staging/r8188eu/core/rtw_recv.c      |    2 -
> >   drivers/staging/r8188eu/core/rtw_sta_mgt.c   |    9 -
> >   drivers/staging/r8188eu/hal/rtl8188e_dm.c    |    1 -
> >   drivers/staging/r8188eu/include/rtw_ioctl.h  |    6 -
> >   drivers/staging/r8188eu/os_dep/ioctl_linux.c | 1538 ++----------------
> >   drivers/staging/r8188eu/os_dep/os_intfs.c    |    1 -
> >   drivers/staging/r8188eu/os_dep/recv_linux.c  |    2 -
> >   8 files changed, 127 insertions(+), 1441 deletions(-)
> >
>
> Acked-by: Michael Straube <straube.linux@gmail.com>
>
> Michael

Thank you Michael :-)

Regards,
Phil
