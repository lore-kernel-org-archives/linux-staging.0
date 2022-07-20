Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F06C1FD7
	for <linux-staging@lists.linux.dev>; Wed, 20 Jul 2022 06:31:00 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id c131so29825410ybf.9
        for <linux-staging@lists.linux.dev>; Tue, 19 Jul 2022 23:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/wu4C6QcCj60VfOL6dkncI/oyQ/H4gMRE1dIKUM12W8=;
        b=f9pJ6NEqZBcH5rqQnwrqLRxnLBKteRuGArh8Ft6O+0ArHG4dEiWSygm2xQX5PKJXjl
         ksCfD4B7bMKGlACstFtGLKQP+d5nMSpZxSLpeoJjXXLC2CtG8+BzfYNCNX6TTEnvKjHm
         sPiuf2ZCeo493OeD1NBHloRtXThVbbDlJSV2ZFzkEFPAKTvDIaOcyKGIpAK+TnmEiFSl
         sCTDowVxFgjI6ZVXPOTt0y7hOyt2/4dvxwkibVWar75emQSGCWU7X0icgNgps/q7ibmD
         sN7fTIUSHXACCKLUAfawZ03IVlWpeHoreaSLmIeL35O0L5ukrsvCvkMii1tb5+1KhwUe
         eogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/wu4C6QcCj60VfOL6dkncI/oyQ/H4gMRE1dIKUM12W8=;
        b=Yedj0YRddqGINi+5d96MW/+w3bOwgd4w+xSGafZwsr/p3ZSmdEIpX5S206GPc+vx+/
         0RhVVkJjz7QVpwfedm3SUTCTPuONSGyMpu3i5dcTgAchUq8ww66DS/2mD9mjb6meIcdP
         mtOSunLkBaiWykhileX9WYA+Y7gp+lEHr2R6C0W6/DzrLZyQXbckijCj6A0e7+DfPp7g
         BNfNKQkt4uDItpw5cf4YlkP8LyyhfR6Aqupm8Wci6DrSIArqg0/vgxnyu6CmjYEvgO+O
         xE4pDK9w7a2XSC+SzY5RRfIVKy1drYNhAHWjnWYkZdrTab1163q65BaG+NzH7DrAxJ4E
         9uow==
X-Gm-Message-State: AJIora+MZxbuFuW/ACmtI6bQueKd502imymKS1YWo4Th1SBB1VR2GLWm
	gzoal+0/7aQBZtxVussb7s0yj8iDket5ui2NbeU=
X-Google-Smtp-Source: AGRyM1u/N/6mRAofjMoMK/JBAPR4BKD6WXojeePKJ6koGlKmzlcWLd4i4G1AWWs0BpIBPv3SkU96R0rfUifvE52VJCg=
X-Received: by 2002:a25:2e50:0:b0:669:9a76:beb with SMTP id
 b16-20020a252e50000000b006699a760bebmr35952935ybn.597.1658298659037; Tue, 19
 Jul 2022 23:30:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220718120149.GD2338@kadam> <20220719055047.322355-3-ztong0001@gmail.com>
 <YtalnN70xXy3PNNN@kroah.com>
In-Reply-To: <YtalnN70xXy3PNNN@kroah.com>
From: Tong Zhang <ztong0001@gmail.com>
Date: Tue, 19 Jul 2022 23:30:48 -0700
Message-ID: <CAA5qM4A7-hCf8hZq4M8O5havY29PYqym1_TNrWJvcc-LWbLnmA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] staging: rtl8192u: move debug files to debugfs
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Colin Ian King <colin.king@intel.com>, 
	Saurav Girepunje <saurav.girepunje@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Johan Hovold <johan@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-staging@lists.linux.dev, Dan Carpenter <dan.carpenter@oracle.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 19, 2022 at 5:53 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jul 18, 2022 at 10:50:37PM -0700, Tong Zhang wrote:
> > There are 4 debug files created under /proc/net/[Devname]. Devname could
> > Due to this is purely for debuging as files are created read only,
> > move this to debugfs like other NIC drivers do instead of using procfs.
> > This is also to prepare for address rmmod warn issue.
>
> Minor comments based on good debugfs usage:
>
> > --- a/drivers/staging/rtl8192u/r8192U.h
> > +++ b/drivers/staging/rtl8192u/r8192U.h
> > @@ -1061,6 +1061,9 @@ typedef struct r8192_priv {
> >       struct delayed_work gpio_change_rf_wq;
> >       struct delayed_work initialgain_operate_wq;
> >       struct workqueue_struct *priv_wq;
> > +
> > +     /* debugfs */
> > +     struct dentry *debugfs_dir;
>
> Why do you need to save this dentry?  Can't you just look it up when you
> want to remove the files?
>
> > +void rtl8192_debugfs_init(struct net_device *dev)
> >  {
> > -     struct proc_dir_entry *dir;
> > +     struct dentry *dir;
> > +     struct r8192_priv *priv = (struct r8192_priv *)ieee80211_priv(dev);
>
> No need to cast this.  Same for later on in this file.
>
> > -     if (!rtl8192_proc)
> > +     dir = debugfs_create_dir(dev->name, NULL);
> > +     if (IS_ERR(dir))
> >               return;
>

I'm reading this code and your comment again.
Adding this check will avoid calling into debugfs_create_file() and 4
function calls and doing checks from there, probably will save a
couple of CPU cycles and avoid branch prediction penalty if there is
any.
I don't think the compiler can optimize for this case though it's not
performance critical. Anyho I personally feel it is better to keep
this.

> No need to check, just keep moving on.
>
> >
> > -     dir = proc_mkdir_data(dev->name, 0, rtl8192_proc, dev);
> > -     if (!dir)
> > -             return;
> > +     debugfs_create_file("stats-rx", 0444, dir, dev, &rtl8192_usb_stats_rx_fops);
> > +     debugfs_create_file("stats-tx", 0444, dir, dev, &rtl8192_usb_stats_tx_fops);
> > +     debugfs_create_file("stats-ap", 0444, dir, dev, &rtl8192_usb_stats_ap_fops);
> > +     debugfs_create_file("registers", 0444, dir, dev, &rtl8192_usb_registers_fops);
> >
> > -     proc_create_single("stats-rx", S_IFREG | 0444, dir,
> > -                        proc_get_stats_rx);
> > -     proc_create_single("stats-tx", S_IFREG | 0444, dir,
> > -                        proc_get_stats_tx);
> > -     proc_create_single("stats-ap", S_IFREG | 0444, dir,
> > -                        proc_get_stats_ap);
> > -     proc_create_single("registers", S_IFREG | 0444, dir,
> > -                        proc_get_registers);
> > +     priv->debugfs_dir = dir;

Please correct me if I am wrong (yes probably).
As I mentioned in another email, I am not sure if there is another way
to look up the old entry so I'm saving the old entry here.
I cheated a little bit by using similar routine as in

net/mac80211/debugfs_netdev.c:865 void
ieee80211_debugfs_rename_netdev(struct ieee80211_sub_if_data *sdata)
drivers/net/ethernet/amd/xgbe/xgbe-debugfs.c: 520 void
xgbe_debugfs_rename(struct xgbe_prv_data *pdata)

>
> Again, no need to save this, just look it up when removing the
> directory.
>
> thanks,
>
> greg k-h


Thanks and have a good one!
- Tong
