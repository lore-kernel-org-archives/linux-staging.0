Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B35672
	for <linux-staging@lists.linux.dev>; Tue, 13 Jul 2021 09:04:56 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id k27so8561111edk.9
        for <linux-staging@lists.linux.dev>; Tue, 13 Jul 2021 02:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bUaDGJFiyNbYhtmiV63zVjpYrC0s92kN0RMEpGrY9Fg=;
        b=dbDxvu7BGayQ0GtMJ7B1OgY1/zXQxntVEiBiGbutiCtzQTXArjgTS4akUN8BUcYlqh
         ARr0Qx//jVQ/aOY/byUBnB5845FNcBDC8/kI36a8F72CQXMuJCFbkcdUR+YV6/mJS2/3
         xZUhI4lOczf+tcyLqEqLbnEAr2VRvpeGigrYUbig2VuwvcmVRRY2jlF1PAJXqx64StNZ
         mDCAcu6OFN+NOWOFvJJGpi3Lv5GEsdPt6hoR4HLfSbNU8v4j0Xk6w4sgZ4UIJDlL74pB
         ALPNzuQ9eCNumraRoDTxbJmmlx76FaAZ51h86P02+HJe64voiD+uh4is8Yq5k8qRb3E8
         WoMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bUaDGJFiyNbYhtmiV63zVjpYrC0s92kN0RMEpGrY9Fg=;
        b=PWO6uBxrp4KV7kUc38kmT7wDzkDBbcF0y5m1EHi1j8jBnhDhP3nVoa/CHUfUC4EGKd
         +k0NVcGfL9UQR2lDEhpYMxVQZPhq9nL/XotZr5iR4/v3iBYLdtA8pZH0dIqKBD0FqPNM
         UcuQSCz7DpQh/i2d4QsX9nnJEuOXlZH31XfSZTaSqAAiNJBT+lsxe3pqeTnwzyWh5BQn
         fNmDF91v2OFLutdyhPbJeNIecZS0Zmn4HIhiJXCXCVqdad311UQ1m55+V+VUPhI6P4hB
         PnWX5H83f7U7XDBz+AUT9sefzDFbbfSkUCss2pOy/abAZFybUytX48Kjv8spSp/LIDPL
         rUWg==
X-Gm-Message-State: AOAM530V6NmimSM/23mBJe3tRBj+wpcs2x1surjETiSYzZYFqi6K6aDm
	QtNeSiNjh1GXGWQagAdzp3Ejrkk2VUyOrTRBbyA=
X-Google-Smtp-Source: ABdhPJz2HwKOgkx6OjxSuuiPVxgyqsmKe++OmxjcZrMFHInsQFK67OFqNjU1b6f0hMyd1OVg4fIMDn/ZvVXBMxICCfQ=
X-Received: by 2002:a05:6402:270d:: with SMTP id y13mr4424427edd.66.1626167094585;
 Tue, 13 Jul 2021 02:04:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <00000000000087b4c305c6f8a243@google.com> <20210713115546.34c99ea8@gmail.com>
In-Reply-To: <20210713115546.34c99ea8@gmail.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Tue, 13 Jul 2021 17:04:28 +0800
Message-ID: <CAD-N9QU3jHw_gOiwduF+eATJ_sxcUcMiiBDESBYmZ8NdGH5RCQ@mail.gmail.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in r871xu_dev_remove
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: syzbot <syzbot+5872a520e0ce0a7c7230@syzkaller.appspotmail.com>, 
	Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com, 
	Greg KH <gregkh@linuxfoundation.org>, hridayhegde1999@gmail.com, 
	linux-kernel <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev, 
	rkovhaev@gmail.com, straube.linux@gmail.com, 
	syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 13, 2021 at 4:55 PM Pavel Skripkin <paskripkin@gmail.com> wrote:
>
> On Mon, 12 Jul 2021 20:14:24 -0700
> syzbot <syzbot+5872a520e0ce0a7c7230@syzkaller.appspotmail.com> wrote:
>
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    92510a7f Add linux-next specific files for 20210709
> > git tree:       linux-next
> > console output:
> > https://syzkaller.appspot.com/x/log.txt?x=16c50180300000 kernel
> > config:  https://syzkaller.appspot.com/x/.config?x=505de2716f052686
> > dashboard link:
> > https://syzkaller.appspot.com/bug?extid=5872a520e0ce0a7c7230 syz
> > repro:
> > https://syzkaller.appspot.com/x/repro.syz?x=1639a73c300000 C
> > reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15fcd5e4300000
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the
> > commit: Reported-by:
> > syzbot+5872a520e0ce0a7c7230@syzkaller.appspotmail.com
> >
>
> Hmm, bisection is wrong this time. It should be
> e02a3b945816 ("staging: rtl8712: fix memory leak in rtl871x_load_fw_cb")

Hi Paval,

can you share more details about why the patch e02a3b945816 causes
this UAF problem?

>
> #syz test:
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>
>
> I guess, this should work
>
>
> With regards,
> Pavel Skripkin
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/20210713115546.34c99ea8%40gmail.com.
