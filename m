Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B1F17EA
	for <linux-staging@lists.linux.dev>; Wed, 11 Jan 2023 22:10:28 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id i15so24432491edf.2
        for <linux-staging@lists.linux.dev>; Wed, 11 Jan 2023 14:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PWAq+7S4bzaL37NGYrLUy7knGvmGRAEXn1QIsa1PQRY=;
        b=CUgRp903UFFuaWLUn/a+60HLECCzdq1iDRPTEpWvFFjT0tXI1/zyesxolB+LcIHSTo
         J6aSm2JzR3ttzgLugbarxFvkaNTNrFupFeQu4rDh21lBwOya+ntguVCspgbnWclC+5dy
         sX24s9v5InG7okISzbL9eXULQ+oFTWKfve+eCDx1eIzmdo2wCk//aqTtc5Mfit9fJDnw
         KUGTgscm/iAof31wWPe+g6F5o+1YHQuJ0S9r+ytTI1fD3m67oGi2kwllx9MPBrZeRvdg
         OEOo+MT8Mfq5YYS5l4UxvF93G3FCh0kYJorRwzu8JGwOXbX0WdLqmiCpobQ/qgW1K7qd
         9Q4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PWAq+7S4bzaL37NGYrLUy7knGvmGRAEXn1QIsa1PQRY=;
        b=SqrD+QJEWKdxRin7zt0wYiAkgQdk1G9qjPIXrDLdMn2/6/piRjVsjI5Jt32Q5DbBAP
         SEDDYyhN1bOXyoSW1VMDAb290WmwPdG52rLQwcCxEacekVAwzc6z4XhghJvlnq2hRlfZ
         7W59KU8n2E/dIgalYUAdElkzzsB86K7v5//H9PquU5HbQqTbOffjrjIsNurcy8Qo0Y4+
         8MDsSkWhPsdFjbEhZF1aeE3Yf8niQZqmKZylEyxcgmVJlsEi9CA5//UOAKj1CvAW9ddU
         JS+68KCpRczr2xXkyflt9zAwYH122KiAvZwJ53tL6Ye33SZHPLYRuoD5YxspMkdMoC59
         eaIQ==
X-Gm-Message-State: AFqh2kq4HEDugO/Vob6Lh1JT+foQFV49E6soA/TFeh+cssRTTMk9IgDe
	yob5JBb2hFzZ+zXvsUaVZqc=
X-Google-Smtp-Source: AMrXdXtvAef1hBS+dF8hlp7VXYkoK3dcpD1BulUM0G4eYmx9a5qBzf1ZttEk5UUGOUwYFYsT95Cl6w==
X-Received: by 2002:a05:6402:207c:b0:490:ff75:7aa with SMTP id bd28-20020a056402207c00b00490ff7507aamr5274351edb.1.1673475027314;
        Wed, 11 Jan 2023 14:10:27 -0800 (PST)
Received: from [192.168.1.102] (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id b20-20020aa7c6d4000000b004610899742asm6539866eds.13.2023.01.11.14.10.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 14:10:26 -0800 (PST)
Message-ID: <8c0502f6-700a-e2f7-5b11-21cb647d6da4@gmail.com>
Date: Wed, 11 Jan 2023 23:10:25 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 00/20] staging: r8188eu: io cleanup
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 Pavel Skripkin <paskripkin@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20230111195640.306748-1-martin@kaiser.cx>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230111195640.306748-1-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/11/23 20:56, Martin Kaiser wrote:
> Clean up structs and function prototypes related to hardware access.
> 
> There's a number of definitions which are not used for usb devices such as
> the r8188eu.
> 
> As usual, this is based on all the previous patches I sent. (I promise to
> send no more patches until the pending ones are merged ;-)
> 
> Martin Kaiser (20):
>    staging: r8188eu: remove struct io_priv
>    staging: r8188eu: remove io function prototypes
>    staging: r8188eu: remove ioreq function prototypes
>    staging: r8188eu: remove async read function prototypes
>    staging: r8188eu: remove async write function prototypes
>    staging: r8188eu: remove struct io_queue
>    staging: r8188eu: remove attrib function prototypes
>    staging: r8188eu: remove rtw_write_scsi function prototype
>    staging: r8188eu: remove dev_power_down function prototype
>    staging: r8188eu: remove struct reg_protocol_rd
>    staging: r8188eu: remove struct reg_protocol_wt
>    staging: r8188eu: remove interface handler prototypes
>    staging: r8188eu: remove readmem and writemem prototypes
>    staging: r8188eu: remove IO defines
>    staging: r8188eu: remove struct io_req
>    staging: r8188eu: remove usb buffer macros
>    staging: r8188eu: pass struct adapter to usb_read
>    staging: r8188eu: pass struct adapter to usb_write
>    staging: r8188eu: remove struct intf_hdl
>    staging: r8188eu: remove struct intf_priv
> 
>   drivers/staging/r8188eu/hal/usb_ops_linux.c  |  34 +--
>   drivers/staging/r8188eu/include/drv_types.h  |   1 -
>   drivers/staging/r8188eu/include/osdep_intf.h |  32 ---
>   drivers/staging/r8188eu/include/rtw_io.h     | 255 -------------------
>   drivers/staging/r8188eu/os_dep/usb_intf.c    |   9 -
>   5 files changed, 9 insertions(+), 322 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> # Edimax N150

