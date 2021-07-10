Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3155168
	for <linux-staging@lists.linux.dev>; Sat, 10 Jul 2021 14:38:51 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id eb14so18833279edb.0
        for <linux-staging@lists.linux.dev>; Sat, 10 Jul 2021 07:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZLoQmYLa1jX8pdeGvFrIDZUoXKb5O+vukZVoByivin0=;
        b=SabWOnhl8687BOXpyM3cqd6Rb0rmeMI5vq/Ac/d1HE9WsS4sZL3GLiZcgNr8arIftQ
         KlEjOYdz7RUMMzy78Zh1B3covmuxlvC5PKKHp2l5xssnnFjU/tha+8ESiNthXS2SjiBb
         +/68tRhZXLalBMDBB6T81h0QDZzCyUbOFI8rHaRvfKzKTw7PGWLway2P774mX++t8qp+
         jJSHWMN0wMK1Z34tNVYV6aoBh907htjF9r+zM0LOf7w63j5iS7lyjtGuV+Ip259+tAVn
         9LVolHmzG7BQrsKsX/YsAxKzDehVaCfw7yFEQFh/NuZ1MQVgIT1/8U5yH685rFYusZfg
         yR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZLoQmYLa1jX8pdeGvFrIDZUoXKb5O+vukZVoByivin0=;
        b=NE0eLaB1JAGKTEScQUDA91xLiGF4wLzM+8quTs90IF27kEpgvxh5ktMyNa4BL+dfd+
         xlwxeyqWy+kLfWx/870Z97gIfBDuiWLwnpIYTVOVGwUS967LSf9+fB72BvFNdV+e8JCQ
         OALzpxBhfY0PkmCm48SzL+VkaV0aRS03nMhaQjqIh1/avBjm7bJJNQoPfOFUUoTdmzE8
         1ots6BtFtPgEDwEwjIuqqUJiyU3yiC7xZ+brLKFeZnqSVsiDNrxftlCNZmxr/dCp6yoO
         xHbYGLgMUI8ORsKr6khTAlXFiyyOMG2wyK58gSXsUJmKVmqM1Ie10Zt6HyrLfh94kh2c
         CmDQ==
X-Gm-Message-State: AOAM533AjoJ9XIADxlfw4WgcR5N0LS7H0Ri0WpURc8PvHWinsBsybykE
	x0qd0Dl+ZsNe4GMs1hxkEm8=
X-Google-Smtp-Source: ABdhPJzNrmDpFePtHAb8Ut8Ciz2NTnJggSxrqI4C0Qnqs2RMadFKLr9pvePS5S3fKokf2TaF0hQ1GA==
X-Received: by 2002:aa7:dbc3:: with SMTP id v3mr54670139edt.63.1625927930041;
        Sat, 10 Jul 2021 07:38:50 -0700 (PDT)
Received: from linux.local (host-79-27-97-200.retail.telecomitalia.it. [79.27.97.200])
        by smtp.gmail.com with ESMTPSA id i6sm3849701ejr.68.2021.07.10.07.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jul 2021 07:38:49 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, fabioaiuto83@gmail.com
Subject: Re: [PATCH] staging: rtl8188eu: Replace a custom function with crc32_le()
Date: Sat, 10 Jul 2021 16:38:47 +0200
Message-ID: <1790135.9ZQ2ZFNHWj@linux.local>
In-Reply-To: <202107100829.RxcC1tei-lkp@intel.com>
References: <20210701133809.26534-1-fmdefrancesco@gmail.com> <202107100829.RxcC1tei-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="ISO-8859-1"

On Saturday, July 10, 2021 2:25:12 AM CEST kernel test robot wrote:
> Hi "Fabio,
> 
> Thank you for the patch! Perhaps something to improve:
> 
> [auto build test WARNING on staging/staging-testing]
> 
> url:   
> https://github.com/0day-ci/linux/commits/Fabio-M-De-Francesco/staging-rtl8188eu-Replace
> -a-custom-function-with-crc32_le/20210701-213922 base:  
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
> 77ad1f0e99bd00af024e650b862cfda3137af660 config: powerpc64-randconfig-
s032-20210709

[CUT]

> 
> sparse warnings: (new ones prefixed by >>)
> 
> >> drivers/staging/rtl8188eu/core/rtw_security.c:597:58: sparse: sparse: 
incorrect type
> >> in assignment (different base types) @@     expected restricted __le32 
[usertype] @@
> >>     got unsigned int @@
>    drivers/staging/rtl8188eu/core/rtw_security.c:597:58: sparse:     
expected restricted
> __le32 [usertype] drivers/staging/rtl8188eu/core/rtw_security.c:597:58: 
sparse:     got
> unsigned int drivers/staging/rtl8188eu/core/rtw_security.c:604:58: sparse: 
sparse:
> incorrect type in assignment (different base types) @@     expected 
restricted __le32
> [usertype] @@     got unsigned int @@
> drivers/staging/rtl8188eu/core/rtw_security.c:604:58: sparse:     expected 
restricted
> __le32 [usertype] drivers/staging/rtl8188eu/core/rtw_security.c:604:58: 
sparse:     got
> unsigned int drivers/staging/rtl8188eu/core/rtw_security.c:671:42: sparse: 
sparse:
> incorrect type in assignment (different base types) @@     expected 
restricted __le32
> [usertype] @@     got unsigned int @@
> drivers/staging/rtl8188eu/core/rtw_security.c:671:42: sparse:     expected 
restricted
> __le32 [usertype] drivers/staging/rtl8188eu/core/rtw_security.c:671:42: 
sparse:     got
> unsigned int

[CUT]

I suppose that these warnings are false positives for the reasons explained in 
my patch.

Furthermore, I found a commit by Fabio Aiuto <fabioaiuto83@gmail.com> that, as 
far as I understand, do the same changes and that has been accepted by Greg K-
H and merged in his tree: b97fad10de387c09ae46f607955c7237afa96654. So, I 
think there one reason more to suspect of false positives.

I'd appreciate comments on this topic.

Thanks,

Fabio



