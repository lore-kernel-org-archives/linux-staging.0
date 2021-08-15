Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DE6168
	for <linux-staging@lists.linux.dev>; Sun, 15 Aug 2021 22:23:41 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id c17so13405300plz.2
        for <linux-staging@lists.linux.dev>; Sun, 15 Aug 2021 15:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Eaxtvou0xYei2dqm2n+mzKVC5V2adFMvFFZ8zHYCYN8=;
        b=wOwCsIpn0AsNBULWzbgLUQR+GJE8LRrIXQHjb2FTLACeCDETSQLjgkw/xqS7ht+pbp
         csGGtDr9i8ILYX7Anxh8XeGoMaHA13Ce+UOkaZS1hv/QaRsWi/RQ0VsqGP57HX2kf43r
         BpUfTzAuivna6Fg8e6QRpnWmDOR4W9rMxBoJYkcKXHg2AOF2L1iWETM4kRX1/MAkRPBu
         exqSRDAISEOPFXR8fXtPG/dezLDkskzKCbwCjtbv+YnU8ZglfVV3VUoYRn2MBa6Jfuqc
         W7QTkzazwU1TloDQmScl2EE+p+SUSXrxfFrR70wXW78EmclM40yVdUDuQ4rEIgPRIbQY
         L0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Eaxtvou0xYei2dqm2n+mzKVC5V2adFMvFFZ8zHYCYN8=;
        b=M2e5c/wRNFA1zoxULvCVlIXk3Dnis2ymon90OJw3GXjczgOdf44KAUg7wh9BNSv/Ug
         6CodOzSmCnc7NjxGE9daGwcnAeUkXbSAul/UAKU2zxlBTUfw689Swh5qcxL6B5CGvFy5
         25TtKVxCb3fABIV2/LCC/C/+i4iIUPo2Uk5cM1JzF1ftRGDSEI/+V1j6xzYbW/bFannb
         mfYcQZrbTVISqHE76M74ZcTCcX02cEDokOmq57jNSVmJgu9bvR6f4kZ7J3X5ODk6am3q
         snETlscCnOpYz4if9beKtXSIhJD1/SmxA0ZO4twRF+3HYI4AKJjzUcHPY2r5SWDaU0Qz
         anfw==
X-Gm-Message-State: AOAM530r2d1+uEKSRnwxXr3KqlFFWLycu/PyOUIChqX12jx7W7aiTFEA
	xXibP5pUg084IaJ/bmZ0LWpOnAOhwuqfiGWZQkBSPw==
X-Google-Smtp-Source: ABdhPJyoo3JKewrGp4uz7Mrr/O2nLpSJQsvQemItdnUC440duJi2MhGE83Xt9B1ck4vGoCXzHCOPBcMBpqYgAlBydC0=
X-Received: by 2002:a17:902:8c81:b029:12c:ee37:3f58 with SMTP id
 t1-20020a1709028c81b029012cee373f58mr10634696plo.45.1629066221244; Sun, 15
 Aug 2021 15:23:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210815102406.3707-1-straube.linux@gmail.com>
In-Reply-To: <20210815102406.3707-1-straube.linux@gmail.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Sun, 15 Aug 2021 23:23:30 +0100
Message-ID: <CAA=Fs0kVZ2zndY7cGmx9MNV+0smfqcn_rgxUcRc7wCJ+BYQOCg@mail.gmail.com>
Subject: Re: [PATCH] staging: r8188eu: remove kernel version depended code paths
To: Michael Straube <straube.linux@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Martin Kaiser <martin@kaiser.cx>, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 15 Aug 2021 at 11:25, Michael Straube <straube.linux@gmail.com> wrote:
>
> Remove kernel version depended code paths from the driver.
> Reported by checkpatch.
>
> WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
>
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_mlme.c      |  4 ----
>  drivers/staging/r8188eu/os_dep/os_intfs.c    | 24 +-------------------
>  drivers/staging/r8188eu/os_dep/rtw_android.c |  9 --------
>  drivers/staging/r8188eu/os_dep/xmit_linux.c  |  5 ----
>  4 files changed, 1 insertion(+), 41 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
> index 9189f5c845f3..d5ef5783f4ad 100644
> --- a/drivers/staging/r8188eu/core/rtw_mlme.c
> +++ b/drivers/staging/r8188eu/core/rtw_mlme.c
> @@ -1499,11 +1499,7 @@ void rtw_dynamic_check_timer_handlder(struct adapter *adapter)
>
>         rcu_read_lock();
>
> -#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,36)
>         if (rcu_dereference(adapter->pnetdev->rx_handler_data) &&
> -#else
> -       if (rcu_dereference(adapter->pnetdev->br_port) &&
> -#endif
>             (check_fwstate(pmlmepriv, WIFI_STATION_STATE|WIFI_ADHOC_STATE) == true)) {
>                 /*  expire NAT2.5 entry */
>                 nat25_db_expire(adapter);
> diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
> index cc7e54170948..f4bf4732578a 100644
> --- a/drivers/staging/r8188eu/os_dep/os_intfs.c
> +++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
> @@ -637,19 +637,7 @@ static unsigned int rtw_classify8021d(struct sk_buff *skb)
>         return dscp >> 5;
>  }
>
> -static u16 rtw_select_queue(struct net_device *dev, struct sk_buff *skb
> -#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5, 2, 0))
> -                           ,struct net_device *sb_dev
> -#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 19, 0))
> -                           ,struct net_device *sb_dev
> -                            ,select_queue_fallback_t fallback
> -#elif (LINUX_VERSION_CODE >= KERNEL_VERSION(3, 14, 0))
> -                           ,void *unused
> -                            ,select_queue_fallback_t fallback
> -#elif (LINUX_VERSION_CODE == KERNEL_VERSION(3, 13, 0))
> -                           , void *accel
> -#endif
> -)
> +static u16 rtw_select_queue(struct net_device *dev, struct sk_buff *skb, struct net_device *sb_dev)
>  {
>         struct adapter  *padapter = rtw_netdev_priv(dev);
>         struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
> @@ -706,15 +694,9 @@ int rtw_init_netdev_name(struct net_device *pnetdev, const char *ifname)
>         return 0;
>  }
>
> -#if LINUX_VERSION_CODE > KERNEL_VERSION(2,6,39)
>  static const struct device_type wlan_type = {
>         .name = "wlan",
>  };
> -#else
> -static struct device_type wlan_type = {
> -       .name = "wlan",
> -};
> -#endif
>
>  struct net_device *rtw_init_netdev(struct adapter *old_padapter)
>  {
> @@ -992,11 +974,7 @@ void netdev_br_init(struct net_device *netdev)
>
>         rcu_read_lock();
>
> -#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,36)
>         if (rcu_dereference(adapter->pnetdev->rx_handler_data)) {
> -#else
> -       if (rcu_dereference(adapter->pnetdev->br_port)) {
> -#endif
>                 struct net_device *br_netdev;
>                 struct net *devnet = NULL;
>
> diff --git a/drivers/staging/r8188eu/os_dep/rtw_android.c b/drivers/staging/r8188eu/os_dep/rtw_android.c
> index d666feb87a7a..bdd381606ba6 100644
> --- a/drivers/staging/r8188eu/os_dep/rtw_android.c
> +++ b/drivers/staging/r8188eu/os_dep/rtw_android.c
> @@ -63,13 +63,8 @@ int rtw_android_cmdstr_to_num(char *cmdstr)
>  {
>         int cmd_num;
>         for (cmd_num=0; cmd_num < ANDROID_WIFI_CMD_MAX; cmd_num++)
> -#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 0, 0))
>                 if (!strncasecmp(cmdstr, android_wifi_cmd_str[cmd_num],
>                     strlen(android_wifi_cmd_str[cmd_num])))
> -#else
> -               if (0 == strnicmp(cmdstr, android_wifi_cmd_str[cmd_num],
> -                  strlen(android_wifi_cmd_str[cmd_num])))
> -#endif
>                         break;
>         return cmd_num;
>  }
> @@ -162,11 +157,7 @@ int rtw_android_priv_cmd(struct net_device *net, struct ifreq *ifr, int cmd)
>                 ret = -ENOMEM;
>                 goto exit;
>         }
> -#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5, 0, 0))
>         if (!access_ok(priv_cmd.buf, priv_cmd.total_len)) {
> -#else
> -       if (!access_ok(VERIFY_READ, priv_cmd.buf, priv_cmd.total_len)) {
> -#endif
>                 DBG_88E("%s: failed to access memory\n", __func__);
>                 ret = -EFAULT;
>                 goto exit;
> diff --git a/drivers/staging/r8188eu/os_dep/xmit_linux.c b/drivers/staging/r8188eu/os_dep/xmit_linux.c
> index 3a1b9d8988f2..4f1ce346b3a5 100644
> --- a/drivers/staging/r8188eu/os_dep/xmit_linux.c
> +++ b/drivers/staging/r8188eu/os_dep/xmit_linux.c
> @@ -108,7 +108,6 @@ void rtw_os_xmit_resource_free(struct adapter *padapter,
>
>  void rtw_os_pkt_complete(struct adapter *padapter, struct sk_buff *pkt)
>  {
> -#if (LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 35))
>         u16     queue;
>         struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
>
> @@ -121,10 +120,6 @@ void rtw_os_pkt_complete(struct adapter *padapter, struct sk_buff *pkt)
>                 if (__netif_subqueue_stopped(padapter->pnetdev, queue))
>                         netif_wake_subqueue(padapter->pnetdev, queue);
>         }
> -#else
> -       if (netif_queue_stopped(padapter->pnetdev))
> -               netif_wake_queue(padapter->pnetdev);
> -#endif
>
>         dev_kfree_skb_any(pkt);
>  }
> --
> 2.32.0
>

Looks good to me, thanks.

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
