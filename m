Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435DD3FCB
	for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 16:04:53 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id t19so7379348ejr.8
        for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 09:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DHporovZFmU9bKIyyJNWmrcH7b2P9x/EJE1cZCgvzmE=;
        b=ZKR3h+4OuOJBh6n6Czcd/iH6qvH4Nc351hAm6h8GVLk3BQatJDXXMCXVseyppIX/oJ
         BiHz4f+MzeBOEx+zSyAZN4Lqk30KxBosecXNMLPR4QbHEkg/veOBBJ/sTDFinL7HPGYl
         21OSiSit6q6n3Z1pbcLK3sYuf5MhONsxjkfnQfjMNxjgTfZ0wpwx76HJ16zO4Mm848VY
         Caen7T+8NvYRx0an7JLDe5NNEANck3QGxL3NBVSOCP8tnofQ6dw87QQlaFrB9naOjKnC
         c+rs37YHPJQjd6ywboYWR7ZfnC0RCUGw0mAfodR6FwEt6pTijQ+qXezOO8x2NccKzmH6
         r17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DHporovZFmU9bKIyyJNWmrcH7b2P9x/EJE1cZCgvzmE=;
        b=rNnBueVu0I0nUAZ8pVJGVPc0daP3ozKCGLoLHfFx0dWpSm02hcUR4tiLnXts4xhG8Z
         F/q/hN0Laz28zb/IxDRTVITmqGYJuGNWwIMQ48ICpsOIVmbFJldubIAhvPt7HW3XR+UV
         k1ZddpatQmCRhxyrjBDDx6yI0gZOP51CKlhDeQs4GUc8UmLS7jd9Ynsg7JtfrXC3NxiG
         YzKdAwPTJXYtt6C7wlgtJOmeVOwTNiHZ7XueLiU+VFEqPnps89Yoqa3KI9+dAoMv0J++
         HzBxxHBDD8MxY5X4hgVodcILHNS4IZr4pdtJb/7XHoObnIvDop/WOh4mFkZGs2YZUHPA
         PsTw==
X-Gm-Message-State: AOAM532fSp7VzzR5jmeU3GrSDd3TNE21s57ReozDAOohMkSvpj6qgwG8
	gzc5WdQQVEv7joZRx513Mxk=
X-Google-Smtp-Source: ABdhPJxm8FA85dZ0nT6zHXMTe3zlBCHLbl6lt6GGnhCEn+uuOpcKNVBPRg28wwyWHRySkNFQporPSA==
X-Received: by 2002:a17:906:8297:: with SMTP id h23mr5076951ejx.168.1629993891637;
        Thu, 26 Aug 2021 09:04:51 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id kk2sm153240ejc.114.2021.08.26.09.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 09:04:51 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, Larry.Finger@lwfinger.net, phil@philpotter.co.uk, Fabio Aiuto <fabioaiuto83@gmail.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: r8188eu: Provide a TODO file for this driver
Date: Thu, 26 Aug 2021 18:04:49 +0200
Message-ID: <1738388.hbRm42UXh6@localhost.localdomain>
In-Reply-To: <20210826135413.GA1931@kadam>
References: <20210826130342.9552-1-fmdefrancesco@gmail.com> <20210826135413.GA1931@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, August 26, 2021 3:54:13 PM CEST Dan Carpenter wrote:
> Another thing to fix are some of the sleeping in atomic bugs.
> 
> drivers/staging/r8188eu/core/rtw_ap.c:139 update_BCNTIM() warn: sleeping in atomic context
> drivers/staging/r8188eu/core/rtw_ap.c:1296 update_bcn_wps_ie() warn: sleeping in atomic context
> drivers/staging/r8188eu/core/rtw_ap.c:1361 update_beacon() warn: sleeping in atomic context
> drivers/staging/r8188eu/core/rtw_ap.c:1725 ap_free_sta() warn: sleeping in atomic context
> drivers/staging/r8188eu/core/rtw_pwrctrl.c:79 ips_leave() warn: sleeping in atomic context
> drivers/staging/r8188eu/core/rtw_pwrctrl.c:81 ips_leave() warn: sleeping in atomic context
> drivers/staging/r8188eu/core/rtw_mlme_ext.c:6764 receive_disconnect() warn: sleeping in atomic context
> drivers/staging/r8188eu/core/rtw_mlme_ext.c:7083 report_del_sta_event() warn: sleeping in atomic context
> drivers/staging/r8188eu/core/rtw_mlme_ext.c:8133 set_tx_beacon_cmd() warn: sleeping in atomic context
> drivers/staging/r8188eu/os_dep/mlme_linux.c:117 rtw_report_sec_ie() warn: sleeping in atomic context
> 
> There are a few in rtl8723bs as well since the code came from the same
> place.
> 
> drivers/staging/rtl8723bs/core/rtw_ap.c:1601 update_beacon() warn: sleeping in atomic context
> drivers/staging/rtl8723bs/core/rtw_ap.c:1919 ap_free_sta() warn: sleeping in atomic context
> drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:4270 receive_disconnect() warn: sleeping in atomic context
> drivers/staging/rtl8723bs/hal/hal_intf.c:100 rtw_hal_init() warn: sleeping in atomic context
> 
> regards,
> dan carpenter

Thanks for your suggestion, I'll add this too to next version.

However I prefer to wait until tomorrow because it is probable that someone else 
have think of more tasks to add to the list.

Regards,

Fabio


