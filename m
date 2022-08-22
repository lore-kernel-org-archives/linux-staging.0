Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA904A02
	for <linux-staging@lists.linux.dev>; Mon, 22 Aug 2022 17:59:02 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id a4so14208234wrq.1
        for <linux-staging@lists.linux.dev>; Mon, 22 Aug 2022 10:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=EUyd4jlEPdu2E04TX94+ZqkeQ1RHJEM/l4894KX+1RI=;
        b=MeWyHm0q0Pn5H7jy3Gnse1nLhND4hl4mLyG7HzOw33K2kgaEiF8NFPb4tdyrUGTPuB
         0ew++X1twb4M/yOw47i6pw+OKz4cNvoTkP5zqO3SxAsn5xaxWVJzERksDO32BESSvS8a
         zozxotAm4ztumR6A272Go9EwjmWuiHP7Nrb8X8vbVFQJk7yo4qYTCZIiBxGHb704g+uR
         9v8rgOGwVs2Naen2wB3HwNbatttZMVpTQtpnT8M2gC/vi+LAQx/jr1dMU6wY4BDEnE0C
         cM+/aL9QFt9HeMR9pHeHa7aCtJHMw+gp2vIlR9Ta0HQidUxNZ/xr9TcTEU+sLluXiKnR
         xd7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=EUyd4jlEPdu2E04TX94+ZqkeQ1RHJEM/l4894KX+1RI=;
        b=q3sOgODVjbCX9nvyKQ6RemMzaF1QweRPLlMp50Ni7uhLJbKBLVNWnYofM1xQRkDQ/I
         szpNYhWNnihK8+8E1lLYziRp+wXYjlmoZO4+863A30T0qDEAZtXFGG3mu6swYJz/k9Ue
         U6hfHoF51Tl3Jfyk+9SWErvW1T+LCzo1bEz8oEQiQW+VieEurTqLJIEKU4sizslvIYuf
         CWGtvt+DpJ3LmG/oZVhIkIgMPw5vrwvvfl5nTsiNNnh29aLhZ7U6VSxQgvfcURueB2sH
         SkfBW8Vl2dFPZmxxC+MUJmyGF7db4hUzE7pd4SqZdkkkpOizhT5c2cW0KA7Iy/BzKFPf
         iEAQ==
X-Gm-Message-State: ACgBeo2sovL9aqXCEHnN8Rt5LAHKHlkNgCwdnDQK3+rYU/e/mIOkJA+S
	J6iHaxlQtUJxhrbQhogSmno=
X-Google-Smtp-Source: AA6agR7oJPpSKqwQuz0jGvu+7KlQp7PRBXZYYJHNo0GN3dN0Nfsaf3r1bbt9xIdZgxuxWh/O1d1VUg==
X-Received: by 2002:adf:f982:0:b0:225:2dad:3ee8 with SMTP id f2-20020adff982000000b002252dad3ee8mr11252602wrr.226.1661191141086;
        Mon, 22 Aug 2022 10:59:01 -0700 (PDT)
Received: from [192.168.1.100] (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id h5-20020a05600c350500b003a6125562e1sm15377071wmq.46.2022.08.22.10.58.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 10:58:59 -0700 (PDT)
Message-ID: <76b7bb06-8eae-4340-4cf3-d4b39e366307@gmail.com>
Date: Mon, 22 Aug 2022 19:58:55 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 00/19] staging: r8188eu: migrate os_dep/xmit_linux.c
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220820181623.12497-1-straube.linux@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20220820181623.12497-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/20/22 20:16, Michael Straube wrote:
> This series moves the functions, or their functionality, from
> os_dep/xmit_linux.c to the core/* part of the driver and finally
> removes os_dep/xmit_linux.c and the xmit_osdep.h header.
> 
> Tested on x86_64 with Inter-Tech DMG-02.
> 
> Please apply this on top of:
> [PATCH] staging: r8188eu: remove rtw_endofpktfile()
> 
> Thanks,
> Michael
> 
> Michael Straube (19):
>    staging: r8188eu: make rtw_remainder_len() static
>    staging: r8188eu: make rtw_os_xmit_schedule() static
>    staging: r8188eu: rename rtw_os_xmit_schedule()
>    staging: r8188eu: make rtw_os_xmit_resource_alloc() static
>    staging: r8188eu: rename rtw_os_xmit_resource_alloc()
>    staging: r8188eu: make rtw_os_xmit_resource_free() static
>    staging: r8188eu: rename rtw_os_xmit_resource_free()
>    staging: r8188eu: make _rtw_open_pktfile() static
>    staging: r8188eu: rename _rtw_open_pktfile()
>    staging: r8188eu: make _rtw_pktfile_read() static
>    staging: r8188eu: rename _rtw_pktfile_read()
>    staging: r8188eu: remove unnecessary initialization to zero
>    staging: r8188eu: move struct pkt_file to rtw_xmit.h
>    staging: r8188eu: move rtw_os_xmit_complete() to rtw_xmit.c
>    staging: r8188eu: rename rtw_os_xmit_complete()
>    staging: r8188eu: make rtw_os_pkt_complete() static
>    staging: r8188eu: rename rtw_os_pkt_complete()
>    staging: r8188eu: remove os_dep/xmit_linux.c
>    staging: r8188eu: remove xmit_osdep.h
> 
>   drivers/staging/r8188eu/Makefile             |   1 -
>   drivers/staging/r8188eu/core/rtw_mlme.c      |  23 +-
>   drivers/staging/r8188eu/core/rtw_mlme_ext.c  |   2 +-
>   drivers/staging/r8188eu/core/rtw_sta_mgt.c   |   1 -
>   drivers/staging/r8188eu/core/rtw_xmit.c      | 232 +++++++++++++++++--
>   drivers/staging/r8188eu/hal/rtl8188eu_xmit.c |   4 +-
>   drivers/staging/r8188eu/include/rtw_xmit.h   |  16 +-
>   drivers/staging/r8188eu/include/xmit_osdep.h |  48 ----
>   drivers/staging/r8188eu/os_dep/os_intfs.c    |   7 +-
>   drivers/staging/r8188eu/os_dep/usb_intf.c    |   1 -
>   drivers/staging/r8188eu/os_dep/xmit_linux.c  | 226 ------------------
>   11 files changed, 251 insertions(+), 310 deletions(-)
>   delete mode 100644 drivers/staging/r8188eu/include/xmit_osdep.h
>   delete mode 100644 drivers/staging/r8188eu/os_dep/xmit_linux.c
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150

