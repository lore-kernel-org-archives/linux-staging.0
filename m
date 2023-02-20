Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E210263D1
	for <linux-staging@lists.linux.dev>; Mon, 20 Feb 2023 15:04:00 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id l7-20020a05600c1d0700b003dc4050c94aso1159685wms.4
        for <linux-staging@lists.linux.dev>; Mon, 20 Feb 2023 07:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BNAlVSR8kU7GTnrIr0mJ68bBXk8C5rGAvpg1ZvtynWA=;
        b=Epn1QDfC0DOaV6xenHMvLvmub3s+pwqmg+Qs7rPLxDjIY/oulsSQgGtIV5u+ya2e1B
         4/oGULzf9PfsIfWcPrEox2uF/jQK+1ZAne+US/fkgjdvMUCHlKU1VQHzwEVszo9WxZUl
         UaKNeD4LjPzGy2saPoNGBz+O7GWRPbd6Rk903iZ6XSPWQfWxlsJBdi/+fF9Jvpx6bK23
         1QSB37WfLFsiqIJouNtjDnQG1yPN/OCDTRM9MWCany90Mm0A8lW9YQeRej1ai7B3fzyb
         TKCDzGQ3dcQsaDYLgLxzinmZ8iMQWYgesmnkIvpkLRqqg6hkx1f1ef4KoJRTcVVLKSQM
         NRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNAlVSR8kU7GTnrIr0mJ68bBXk8C5rGAvpg1ZvtynWA=;
        b=T8cWtlt2L5Ed7g1pk5aP2Br3WuCQ66M2lCnXBUraNNVDuh9GccMi6IQ2LjOKsD8GfM
         sO7ivqcx98BCNivZm6pBYXFMrwnXEFTNmhkXAKXdMDTPM+kShsLxa9eMOPHlfMx74aqh
         rzwUs0Q580G+dzzOPEO0ud/q+L6N18RCBlwmrD59lcg3n2yJ8QFNxCb5UaD1npx03qgc
         hMlarbSb5hMWme1NJlFhr55+fL9n0Tfc5IxHd89K4K4LQPzKEH0qfXD1Los89vodJjYA
         BtuoyD63ZG1wi6HwkProMRdTPT0up1fNs4daITBbhbdWtOwhoDWSA96tDyVKO/NWJHok
         Bi4Q==
X-Gm-Message-State: AO0yUKVpzWOF+w3iNvr2zLkuFO/TOBFT0NWuJikqBTIlNTlanyCcNRA2
	i6Us6Zz2tazRQ8ZkfTtE3O4bdN5Shro=
X-Google-Smtp-Source: AK7set+2D43SgKM0RcXcOmqH8qxrhArCUPRslbHI+gzRjKFF9zcV+RuPOZjC/G+PPLvIYblzQqLsCA==
X-Received: by 2002:a05:600c:16c5:b0:3df:94c3:4725 with SMTP id l5-20020a05600c16c500b003df94c34725mr7516673wmn.38.1676905439051;
        Mon, 20 Feb 2023 07:03:59 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o27-20020a05600c511b00b003e21dcccf9fsm1232096wms.16.2023.02.20.07.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 07:03:58 -0800 (PST)
Date: Mon, 20 Feb 2023 18:03:54 +0300
From: Dan Carpenter <error27@gmail.com>
To: Shibo Li <zzutcyha@163.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8712: Fix Sparse warnings in
 rtl871x_ioctl_linux.c
Message-ID: <Y/OL2i1Gt82fqPoO@kadam>
References: <20230220143758.4396-1-zzutcyha@163.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230220143758.4396-1-zzutcyha@163.com>

On Mon, Feb 20, 2023 at 02:37:58PM +0000, Shibo Li wrote:
> This patch fixes the following warning in rtl871x_ioctl_linux.c
> 
> WARNING: Avoid multiple line dereference - prefer 'pnetwork->network.InfrastructureMode'
> +                                       if (pnetwork->network.
> +                                               InfrastructureMode
> 
> WARNING: Avoid multiple line dereference - prefer 'padapter->mlmepriv.cur_network.network'
> +                                               padapter->mlmepriv.
> +                                               cur_network.network.
> 
> WARNING: Avoid multiple line dereference - prefer 'cur_network.network.InfrastructureMode'
> +                                               cur_network.network.
> +                                               InfrastructureMode)
> 
> Signed-off-by: Shibo Li <zzutcyha@163.com>
> ---
>  drivers/staging/rtl8712/rtl871x_ioctl_linux.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/rtl8712/rtl871x_ioctl_linux.c b/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
> index 36f6904d25ab..6673befeb2f0 100644
> --- a/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
> +++ b/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
> @@ -1268,14 +1268,11 @@ static int r8711_wx_set_essid(struct net_device *dev,
>  			if ((!memcmp(dst_ssid, src_ssid, ndis_ssid.SsidLength))
>  			    && (pnetwork->network.Ssid.SsidLength ==
>  			     ndis_ssid.SsidLength)) {
> -				if (check_fwstate(pmlmepriv,
> -							WIFI_ADHOC_STATE)) {
> -					if (pnetwork->network.
> -						InfrastructureMode
> +				if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
> +					if (pnetwork->network.configurationInfrastructureMode
>  						!=
> -						padapter->mlmepriv.
> -						cur_network.network.
> -						InfrastructureMode)
> +						padapter->mlmepriv.assoc_by_rssi.
> +						cur_network.network.InfrastructureMode)
>  						continue;

This one is not okay.  The indenting is still messed up.  There is still
a multi-line dereference.  The != is on the wrong line.  The parts of
the if statement should use space so they are aligned properly but
instead they're lined  up with the continue...

Look at the bigger picture.  Re-write the code to avoid so many tabs.
Reverse the outside if statement to return earlier for example.

regards,
dan carpenter

