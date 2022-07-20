Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E131FBC
	for <linux-staging@lists.linux.dev>; Wed, 20 Jul 2022 04:58:36 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id i14so30268249yba.1
        for <linux-staging@lists.linux.dev>; Tue, 19 Jul 2022 21:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=stifYgjPiXX5R5s0ZOM3DpqxQIeJzktWgHSqB2KhGqM=;
        b=Dv8loitxSXzMABsjf/4tvOhHU6ejHC+jmnTlMvQLZBBPhzBML7pgy/r6N7WmPUKidp
         qn/3hr7s/ggW+ZW3aKblO/WjUMkTxGMIO0QycEkjU6b9WHb1LCpkia/qRQK0An88ZplM
         uYdTE3eJYqGBrlKLJYkYK1CEsmZQocNYEm9M/oyTAfFN9NZZgxx9yCH2MTmW6CUcQ7h7
         s1T+4sAnJdJk+DsI6xtpJreuwmL3v79oqN+u3mDYVQh9+tpmFTTASzmaDJb23H8P4lpS
         ZXyRwf4aLKNHAb0BZQQ/T+qXE27x80SesXSTdz3PfbSyRUpL1T/Q13TDVSCpXaPOKoqL
         YdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=stifYgjPiXX5R5s0ZOM3DpqxQIeJzktWgHSqB2KhGqM=;
        b=wWAIeF+e+tbb1vKV8h5COb6W2rt1iTzx6jnubjeqirJ+bO4la6ArtqdZMLw80+BGZZ
         ACiEo1qtc1xBpyHJcGCiOK6tlYZaxgxPQkeHYOaB0ikW/9vi7sUddm069JYQttHum970
         CNx48JFPzcRWYdyDt+N3bLjPdbT0Ss7x5E8EGja7tSV0qCUrZDgdcZaYFHE/a5qqBOKy
         obhmVnTww9lkOkAVpWHY1A1dYgc9VWgAHPsbErnji15UsvWz/2SHuXDVidRAyFuT9sX4
         AOodl+gOynVcnwc3JAnRWNV0coUxm1ygzRCvkU5q+whpu2N72b9DNO1++JhRuZzhLR9I
         LrlQ==
X-Gm-Message-State: AJIora+2rE3rSDlFQnASG+pwToxHliZG8buQRZGA2s3Gx/xafHU8xCvj
	yfgDWcT7H40uTILu8G3Rw5owLtzfqJbzWBS0e+g=
X-Google-Smtp-Source: AGRyM1tGEjYhSaThOF4X0nOhA5/UtufoRT6JiFvqkbtDzGYWlPczQb/qGN4zK8KJCiSTK1X5uq2c+/ITIu5WLO5bWgc=
X-Received: by 2002:a05:6902:728:b0:66e:8f7b:a252 with SMTP id
 l8-20020a056902072800b0066e8f7ba252mr33553859ybt.584.1658293115034; Tue, 19
 Jul 2022 21:58:35 -0700 (PDT)
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
Date: Tue, 19 Jul 2022 21:58:24 -0700
Message-ID: <CAA5qM4B9p05KLFhsmcbYud65dUHPXqETc7rFqer0pNLjH_mJpA@mail.gmail.com>
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

Hi Greg,
Thanks for the comments.

I am thinking whether it is possible to rename the device and run
rmmod to remove something it shouldn't.
If we are using debugfs_lookup(dev->name, NULL), say, the existing
directories/files are

  /sys/kernel/debug/DIRA
  /sys/kernel/debug/wlan0

I then rename device wlan0 to DIRA, after that I remove the module by
doing rmmod.
Apparently either the wlan0 directory will not be renamed successfully
due to collision or DIRA directory might be overwritten? (this part I
haven't checked yet)
Either Way,  later on if we do rmmod, the driver will try to do
debugfs_lookup("fileA", NULL) and remove /sys/kernel/debug/DIRA which
it shouldn't.
Or if it is possible to rename the device to some wacky string
containing wildcard or .. to launch an attack.

Maybe I am being naive but please correct me if I am wrong.

Or maybe we should put those debug files under the module's own
directory and do lookup from there instead. like the following dir
structure

/sys/kernel/debug/r8192u_usb/wlan0/stats-rx
/sys/kernel/debug/r8192u_usb/wlan0/stats-rx
/sys/kernel/debug/r8192u_usb/wlan0/stats-ap
/sys/kernel/debug/r8192u_usb/wlan0/registers


> > +void rtl8192_debugfs_init(struct net_device *dev)
> >  {
> > -     struct proc_dir_entry *dir;
> > +     struct dentry *dir;
> > +     struct r8192_priv *priv = (struct r8192_priv *)ieee80211_priv(dev);
>
> No need to cast this.  Same for later on in this file.
>

agreed, will remove those redundant checks.

> > -     if (!rtl8192_proc)
> > +     dir = debugfs_create_dir(dev->name, NULL);
> > +     if (IS_ERR(dir))
> >               return;
>
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
>
> Again, no need to save this, just look it up when removing the
> directory.
>
> thanks,
>
> greg k-h

Thanks and have a good one!
- Tong
