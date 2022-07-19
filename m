Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A70D10FA
	for <linux-staging@lists.linux.dev>; Tue, 19 Jul 2022 05:53:09 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-31e0d4ad6caso69265547b3.10
        for <linux-staging@lists.linux.dev>; Mon, 18 Jul 2022 22:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ddwaIIn58piVSVlYeufxyiAUkUWa6BS/x3DMTO6B49o=;
        b=aVUONajDby8ZEmMd1cWOFu0veJxSidQ8m1I11oHdW9wXYB73fyK91ezbJp5wPlQVJ2
         sE+sHqozuUvdvu9PohAxGxhZAzfxpevvCpBbbvKp02N4ZSWuA3sxkUq2GjEDeKJ6ERhp
         x+joz9KXOyTxkI5WkUt63zsxSoHIzEsxMwhQmKyxWRgcYUG5MiMRD4x0w7gpaVDRF7w4
         SnJA8Es2GHWvjbpVFJ9M40eJy3i0w/aq8R3pOs1OVYASH7Vb3YVt+3V9yc9tqqcoQ4sd
         Ujc0v0MBrDQE1ZQA6nG+/B1lxAHiuGTMBRrv2rFyL6sJaL1QIp39ABRXmanIotYmvs51
         WpYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ddwaIIn58piVSVlYeufxyiAUkUWa6BS/x3DMTO6B49o=;
        b=tlJdk7UmFIjTsZxY/R4H3aY/aFcWErM2ohmD2AZuBKrJ4Wlp5aE2nGjyrmtyRdxKWR
         5CkWlgw4tCJ2v0at/+U6RhUKNPoWIicWyHp/5uePaRSrplozz7gZNRUtF19KyqZ0nBJb
         XgrZg2mdrkOGUCSGFTC0mwpPjMVVbtFmzCfdljyNGb2Bc2Wl/GNoZtxH98ZcJ3Xbo5/p
         nNwOeZiOkDFSjYX1D3SMcpmHBGKzjFjNsvatdY5rLXIdLooCVeWV6HO+LRs1vIkyCItG
         4EFS7qKeioFHWPmtiSVmgJEM4RuZyWber49g521s+revvjJj7sNhIM+akN6D5JqEORde
         oKWA==
X-Gm-Message-State: AJIora9rb4vbsQNahyq195m4r/I+KN2uZIrXDYsvbC5rrQeUV/Y5xQkI
	p5MixYmAjcxHQt5ebs7PsLz08LwIvdd3UH5q4I0=
X-Google-Smtp-Source: AGRyM1voiLA+Jnkzd6JrEEDR31unWn3tsBQx1ZcSZOM73aSF4usz60SOtIuSERmQ7z6cJay/BQKXbbYczl1pWtYUOmY=
X-Received: by 2002:a81:12d8:0:b0:31c:ab66:4693 with SMTP id
 207-20020a8112d8000000b0031cab664693mr34526341yws.452.1658209988175; Mon, 18
 Jul 2022 22:53:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAMhUBjmX0BDh-35GQxf3-fXFa8_EKfh2fwYKZDgH4NzGGQHiSg@mail.gmail.com>
 <20220717070204.705878-1-ztong0001@gmail.com> <20220718120149.GD2338@kadam>
In-Reply-To: <20220718120149.GD2338@kadam>
From: Tong Zhang <ztong0001@gmail.com>
Date: Mon, 18 Jul 2022 22:52:57 -0700
Message-ID: <CAA5qM4DWdtx6rndL5SGo=MacHYH8L2FVhmO_F07EDppkTnKbHA@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8192u: fix rmmod warn when wlan0 is renamed
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jakub Kicinski <kuba@kernel.org>, 
	Colin Ian King <colin.king@intel.com>, Saurav Girepunje <saurav.girepunje@gmail.com>, 
	Johan Hovold <johan@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-staging@lists.linux.dev, Zheyu Ma <zheyuma97@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 18, 2022 at 5:02 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Sun, Jul 17, 2022 at 12:01:57AM -0700, Tong Zhang wrote:
> > +static int rtl8192_usb_netdev_event(struct notifier_block *nb, unsigned long event,
> > +             void *data)
> > +{
> > +     struct net_device *netdev = netdev_notifier_info_to_dev(data);
> > +
> > +     if (netdev->netdev_ops != &rtl8192_netdev_ops)
> > +             goto out;
> > +
> > +     switch (event) {
> > +             case NETDEV_CHANGENAME:
> > +                     rtl8192_debugfs_rename(netdev);
> > +                     break;
> > +
> > +             default:
> > +                     break;
> > +     }
>
> This isn't indented properly.  Don't forget to run ./scripts/checkpatch.pl
> on your patch.
>
> > +
> > +out:
> > +     return NOTIFY_DONE;
> > +}
> > +
> > +static struct notifier_block rtl8192_usb_netdev_notifier = {
> > +     .notifier_call = rtl8192_usb_netdev_event,
> > +};
> > +
> > +
>
> Here too.
>
> >  static int __init rtl8192_usb_module_init(void)
> >  {
> >       int ret;
> > @@ -4788,10 +4638,14 @@ static int __init rtl8192_usb_module_init(void)
>
> [ snip ]
>
> > +void rtl8192_debugfs_init(struct net_device *dev)
> > +{
> > +     struct dentry *dir;
> > +     struct r8192_priv *priv = (struct r8192_priv *)ieee80211_priv(dev);
> > +
> > +     dir = debugfs_create_dir(dev->name, NULL);
> > +     if (IS_ERR_OR_NULL(dir))
> > +             return;
>
> In olden times the debugfs_create_dir() function used to return a mix
> of error pointers and NULL.  But the idea with that function is that
> most people are not supposed to check for errors.  But instead of that
> they added all kind of *buggy* checks.  So then we made it just return
> error pointers.
>
> This code *does* care about it because it uses the
> priv->debugfs_dir->d_name.name in rtl8192_debugfs_rename().
>
> But caring about the debugfs dir and creating a rtl8192_debugfs_rename()
> function is really unusual.  And normally when we have to do something
> unusual that means we are doing something wrong...  :/
>
> Anyway, just check for if (IS_ERR(dir)) {
>
> > +
> > +     debugfs_create_file("stats-rx", 0444, dir, dev, &rtl8192_usb_stats_rx_fops);
> > +     debugfs_create_file("stats-tx", 0444, dir, dev, &rtl8192_usb_stats_tx_fops);
> > +     debugfs_create_file("stats-ap", 0444, dir, dev, &rtl8192_usb_stats_ap_fops);
> > +     debugfs_create_file("registers", 0444, dir, dev, &rtl8192_usb_registers_fops);
> > +
> > +     priv->debugfs_dir = dir;
> > +}
> > +
> > +void rtl8192_debugfs_exit(struct net_device *dev)
> > +{
> > +     struct r8192_priv *priv = (struct r8192_priv *)ieee80211_priv(dev);
> > +     if (!priv->debugfs_dir)
> > +             return;
> > +     debugfs_remove_recursive(priv->debugfs_dir);
> > +     priv->debugfs_dir = NULL;
> > +}
> > +
> > +void rtl8192_debugfs_rename(struct net_device *dev)
> > +{
> > +     struct r8192_priv *priv = (struct r8192_priv *)ieee80211_priv(dev);
> > +
> > +     if (!priv->debugfs_dir)
> > +             return;
> > +
> > +     if (!strcmp(priv->debugfs_dir->d_name.name, dev->name))
> > +             return;
> > +
> > +     debugfs_rename(priv->debugfs_dir->d_parent, priv->debugfs_dir,
> > +                     priv->debugfs_dir->d_parent, dev->name);
> > +}
> > +
>
> regards,
> dan carpenter

I modified the patch and sent it as v2.
Thanks and have a good one!
- Tong
