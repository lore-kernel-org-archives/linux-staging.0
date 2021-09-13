Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486983FC5
	for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 17:40:30 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id g14so9560112pfm.1
        for <linux-staging@lists.linux.dev>; Mon, 13 Sep 2021 10:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CSOkfsibILtVOPEWTt+WszgZsXrlN9GKs6HqkiYI+W4=;
        b=hMoSbCOVq4KSoEckLUAp2oX3HeaMZyVCo6Ek6hXfmFg4O5gFJVf3AzLgbA6xW8HsJp
         UvzHuC+OeF4tIDBtqcM3kFFbupYhqf0dTkFdpsONYeNELPai9o6XRayPnRp3hJUSDbtn
         GrS+HDgeSyNZOf+dFnanauH0JHsFB/AWBkyKPMlaJBZCiUDHFvi2vTcQe2q7G32Tdvl4
         UA3OAD22wh4NtkalzeZOhyCI+WvglFlRZyAITdfATINvIxX4EbAInHfhl1XMr54dlFhw
         6aaZB19eXtYcKfod6evRDp61Zf8w5lQ9IfnAScC8C5J7kyKGQlVtekaci5SCpHDIYooj
         wW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CSOkfsibILtVOPEWTt+WszgZsXrlN9GKs6HqkiYI+W4=;
        b=nf+pie9t4qE3MNF27EpyI3APEdpOuf1k5HvIGskbo4oBq5A9ZQmqYGlkX6dgtpPnRC
         FYq9F6DsjAobjKDilPcQKzQt2auU5RNk4gHZhR9MBBHVvq1DyImeOUEN+SjGIPd3Ziej
         LaHTss41K252asf4pzJAtjYeeKCLiFOh7xQ+SyXOwfY4k/K8AVCNzD5fBQPT7nI3o1ER
         F/nl2rBlUzjy7XYEZ37lugLyfeb1P+rGXb9pKMcSz74EYePiF2ZlcmpjmDD0F6cvMiGj
         b1ySVd+RyIt8BYewWZmuAIafKtK8fINsX94oqksnKD/QFqfb/w0VMA/Z/zju5LEERVfB
         5WuA==
X-Gm-Message-State: AOAM533ZAmBJ/PVich0PfUPsdgYgBFomM57oWv8NtWQumMQ6SziKoLPm
	E/xi5Xe3PPj2soRqh5OzghPY6zIKhAYh69Dr8oYGEg==
X-Google-Smtp-Source: ABdhPJyM5whXt3fWxtwzUoF7k9FgfBZcI/XqMx+AxgpKFoCOEqXrbxCbO0Q47i6uNgfTtR6pXE0x5/IyQyhQJRomVSY=
X-Received: by 2002:a63:dd46:: with SMTP id g6mr12154246pgj.347.1631554829739;
 Mon, 13 Sep 2021 10:40:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YT413EaBXqIqMttS@user> <YT97MRziXoUFhvXh@kroah.com>
In-Reply-To: <YT97MRziXoUFhvXh@kroah.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Mon, 13 Sep 2021 18:40:18 +0100
Message-ID: <CAA=Fs0n5xt5CtkyVcissVfJpP4_QBpCSUStUy=pT1DwXmsyMMg@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: os_dep: remove unused function rtw_android_priv_cmd
To: Saurav Girepunje <saurav.girepunje@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>, Martin Kaiser <martin@kaiser.cx>, 
	Greg KH <gregkh@linuxfoundation.org>, Michael Straube <straube.linux@gmail.com>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, saurav.girepunje@hotmail.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 13 Sept 2021 at 17:24, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Sun, Sep 12, 2021 at 10:46:12PM +0530, Saurav Girepunje wrote:
> > Remove unused function rtw_android_priv_cmd.
> >
> > Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
> > ---
> >  drivers/staging/r8188eu/include/rtw_android.h |   1 -
> >  drivers/staging/r8188eu/os_dep/rtw_android.c  | 138 ------------------
> >  2 files changed, 139 deletions(-)
> >
> > diff --git a/drivers/staging/r8188eu/include/rtw_android.h b/drivers/staging/r8188eu/include/rtw_android.h
> > index f60cf1c82984..86e3ac5f7955 100644
> > --- a/drivers/staging/r8188eu/include/rtw_android.h
> > +++ b/drivers/staging/r8188eu/include/rtw_android.h
> > @@ -42,6 +42,5 @@ enum ANDROID_WIFI_CMD {
> >  };
> >
> >  int rtw_android_cmdstr_to_num(char *cmdstr);
> > -int rtw_android_priv_cmd(struct net_device *net, struct ifreq *ifr, int cmd);
> >
> >  #endif /* __RTW_ANDROID_H__ */
> > diff --git a/drivers/staging/r8188eu/os_dep/rtw_android.c b/drivers/staging/r8188eu/os_dep/rtw_android.c
> > index 010d529c8982..bd76177d60f9 100644
> > --- a/drivers/staging/r8188eu/os_dep/rtw_android.c
> > +++ b/drivers/staging/r8188eu/os_dep/rtw_android.c
> > @@ -133,141 +133,3 @@ static int rtw_android_set_block(struct net_device *net, char *command,
> >       return 0;
> >  }
> >
> > -int rtw_android_priv_cmd(struct net_device *net, struct ifreq *ifr, int cmd)
> > -{
> > -     int ret = 0;
> > -     char *command = NULL;
> > -     int cmd_num;
> > -     int bytes_written = 0;
> > -     struct android_wifi_priv_cmd priv_cmd;
> > -
> > -     if (!ifr->ifr_data) {
> > -             ret = -EINVAL;
> > -             goto exit;
> > -     }
> > -     if (copy_from_user(&priv_cmd, ifr->ifr_data,
> > -                        sizeof(struct android_wifi_priv_cmd))) {
> > -             ret = -EFAULT;
> > -             goto exit;
> > -     }
> > -     command = kmalloc(priv_cmd.total_len, GFP_KERNEL);
> > -     if (!command) {
> > -             DBG_88E("%s: failed to allocate memory\n", __func__);
> > -             ret = -ENOMEM;
> > -             goto exit;
> > -     }
> > -     if (!access_ok(priv_cmd.buf, priv_cmd.total_len)) {
> > -             DBG_88E("%s: failed to access memory\n", __func__);
> > -             ret = -EFAULT;
> > -             goto exit;
> > -     }
> > -     if (copy_from_user(command, (char __user *)priv_cmd.buf,
> > -                        priv_cmd.total_len)) {
> > -             ret = -EFAULT;
> > -             goto exit;
> > -     }
> > -     DBG_88E("%s: Android private cmd \"%s\" on %s\n",
> > -             __func__, command, ifr->ifr_name);
> > -     cmd_num = rtw_android_cmdstr_to_num(command);
> > -     switch (cmd_num) {
> > -     case ANDROID_WIFI_CMD_START:
> > -             goto response;
> > -     case ANDROID_WIFI_CMD_SETFWPATH:
> > -             goto response;
> > -     }
> > -     if (!g_wifi_on) {
> > -             DBG_88E("%s: Ignore private cmd \"%s\" - iface %s is down\n",
> > -                     __func__, command, ifr->ifr_name);
> > -             ret = 0;
> > -             goto exit;
> > -     }
> > -     switch (cmd_num) {
> > -     case ANDROID_WIFI_CMD_STOP:
> > -             break;
> > -     case ANDROID_WIFI_CMD_SCAN_ACTIVE:
> > -             break;
> > -     case ANDROID_WIFI_CMD_SCAN_PASSIVE:
> > -             break;
> > -     case ANDROID_WIFI_CMD_RSSI:
> > -             bytes_written = rtw_android_get_rssi(net, command,
> > -                                                  priv_cmd.total_len);
> > -             break;
> > -     case ANDROID_WIFI_CMD_LINKSPEED:
> > -             bytes_written = rtw_android_get_link_speed(net, command,
> > -                                                        priv_cmd.total_len);
> > -             break;
> > -     case ANDROID_WIFI_CMD_MACADDR:
> > -             bytes_written = rtw_android_get_macaddr(net, command,
> > -                                                     priv_cmd.total_len);
> > -             break;
> > -     case ANDROID_WIFI_CMD_BLOCK:
> > -             bytes_written = rtw_android_set_block(net, command,
> > -                                                   priv_cmd.total_len);
> > -             break;
> > -     case ANDROID_WIFI_CMD_RXFILTER_START:
> > -             break;
> > -     case ANDROID_WIFI_CMD_RXFILTER_STOP:
> > -             break;
> > -     case ANDROID_WIFI_CMD_RXFILTER_ADD:
> > -             break;
> > -     case ANDROID_WIFI_CMD_RXFILTER_REMOVE:
> > -             break;
> > -     case ANDROID_WIFI_CMD_BTCOEXSCAN_START:
> > -             /* TBD: BTCOEXSCAN-START */
> > -             break;
> > -     case ANDROID_WIFI_CMD_BTCOEXSCAN_STOP:
> > -             /* TBD: BTCOEXSCAN-STOP */
> > -             break;
> > -     case ANDROID_WIFI_CMD_BTCOEXMODE:
> > -             break;
> > -     case ANDROID_WIFI_CMD_SETSUSPENDOPT:
> > -             break;
> > -     case ANDROID_WIFI_CMD_SETBAND:
> > -             break;
> > -     case ANDROID_WIFI_CMD_GETBAND:
> > -             break;
> > -     case ANDROID_WIFI_CMD_COUNTRY:
> > -             bytes_written = android_set_cntry(net, command,
> > -                                               priv_cmd.total_len);
> > -             break;
> > -     case ANDROID_WIFI_CMD_P2P_DEV_ADDR:
> > -             bytes_written = android_get_p2p_addr(net, command,
> > -                                                  priv_cmd.total_len);
> > -             break;
> > -     case ANDROID_WIFI_CMD_P2P_SET_NOA:
> > -             break;
> > -     case ANDROID_WIFI_CMD_P2P_GET_NOA:
> > -             break;
> > -     case ANDROID_WIFI_CMD_P2P_SET_PS:
> > -             break;
> > -     default:
> > -             DBG_88E("Unknown PRIVATE command %s - ignored\n", command);
> > -             snprintf(command, 3, "OK");
> > -             bytes_written = strlen("OK");
> > -     }
> > -
> > -response:
> > -     if (bytes_written >= 0) {
> > -             if ((bytes_written == 0) && (priv_cmd.total_len > 0))
> > -                     command[0] = '\0';
> > -             if (bytes_written >= priv_cmd.total_len) {
> > -                     DBG_88E("%s: bytes_written = %d\n", __func__,
> > -                             bytes_written);
> > -                     bytes_written = priv_cmd.total_len;
> > -             } else {
> > -                     bytes_written++;
> > -             }
> > -             priv_cmd.used_len = bytes_written;
> > -             if (copy_to_user((char __user *)priv_cmd.buf, command,
> > -                              bytes_written)) {
> > -                     DBG_88E("%s: failed to copy data to user buffer\n",
> > -                             __func__);
> > -                     ret = -EFAULT;
> > -             }
> > -     } else {
> > -             ret = bytes_written;
> > -     }
> > -exit:
> > -     kfree(command);
> > -     return ret;
> > -}
> > --
> > 2.32.0
> >
> >
>
> Does not apply to my tree :(

Dear Saurav,

This code is already gone - Linus deleted it during a merge
conflict resolution. I am planning to add it back soon though
and reconnect with the newer siocdevprivate approach.

Regards,
Phil
