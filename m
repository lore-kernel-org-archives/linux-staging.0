Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2206CEC0
	for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 10:53:05 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1aaff9c93a5so74746295ad.2
        for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 03:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683975184; x=1686567184;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rzFzuKHL70sf9cOT0w+52R5CvyI+BtqNEu3+iLD0/xM=;
        b=KiRutVUHBs5oUxLaT6583AIlvZ1wM62Gaibg6ABRHB+EHssWBsNvDmr3LmIXMEoH2N
         GVGjLZ7kpXcwictVoObqHKVXfmMChFRDZKcFopUdeDWXf+rqctX+fYXExdpK3BwtWNQE
         6hpIt8QKtWwJBCyna2FR6m1WiSSC1e5F32aLZoUMDZk3T7BaWRH9Ltr6OJmDEdMfWX9s
         e13QeD3phgr5WfRToH69Bl146cfQyz+4DWY+H9HbLZnjtnYwvns2nITozZ1JLqFg/xAm
         i/WzWpzEWAIlhXjh/j3xi4q7Ct4F5RD81VSYeF8KwsYRLGEzddH112GszCUM1lHzBxB5
         wnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683975184; x=1686567184;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rzFzuKHL70sf9cOT0w+52R5CvyI+BtqNEu3+iLD0/xM=;
        b=lhXINTVYNy1bKCIFxG+ZuucpVLO4aRVH0+ZJhf+cAj846t1GYesuTVwe65H7NtP9I3
         uKlZNDIR0sfHyx8DaXDKo5ZPShA46eY2hEXTPDv+AHw90nfkb78oB1rWLCbnNpxUarE2
         +rGcL3XA9FOE2VUNsSkFdIM6bn81O4MXE2Z/V7qWXEmx/7dJkDbfg372pRUtEc3T3X+G
         Vy/1Ty/U17Wd3/gBHMBTIFzb0V5o6j0rJVOHSE1Ml+Yhd95YFk6G8t+rb9NCdWrpFI+o
         N15XNkZOck0aZ+suSOqblATpsJGl92ehuQXLLQ8yci4KtTeOX+4QjG5ljLCPURsZcLA6
         g8jA==
X-Gm-Message-State: AC+VfDzn1p4oiY34ZyFJ5VMSlEBP9abIV0TxDWig2uQn+OyZ6hGjYEKX
	i2q8sAJ5ViNTmmJfRx7VkQ4=
X-Google-Smtp-Source: ACHHUZ5DBzqowpkp4ezU81PkyI2h2pcFK4NVjpo+XXCJnf4Zf6G4lAY1tlwtETFrSiB8n9wL7y9kbw==
X-Received: by 2002:a17:902:fa0f:b0:1a9:8ff5:af43 with SMTP id la15-20020a170902fa0f00b001a98ff5af43mr25437354plb.18.1683975184372;
        Sat, 13 May 2023 03:53:04 -0700 (PDT)
Received: from [192.168.43.80] (subs02-180-214-232-69.three.co.id. [180.214.232.69])
        by smtp.gmail.com with ESMTPSA id f12-20020a170902684c00b001ac69bdc9d1sm9637182pln.156.2023.05.13.03.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 May 2023 03:53:03 -0700 (PDT)
Message-ID: <ef31b33f-8e66-4194-37e3-916b53cf7088@gmail.com>
Date: Sat, 13 May 2023 17:52:51 +0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 08/10] drivers: watchdog: Replace GPL license notice
 with SPDX identifier
Content-Language: en-US
To: Richard Fontana <rfontana@redhat.com>
Cc: Linux SPDX Licenses <linux-spdx@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>,
 Linux Watchdog Devices <linux-watchdog@vger.kernel.org>,
 Linux Kernel Actions <linux-actions@lists.infradead.org>,
 Diederik de Haas <didi.debian@cknow.org>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 Thomas Gleixner <tglx@linutronix.de>, David Airlie <airlied@redhat.com>,
 Karsten Keil <isdn@linux-pingi.de>, Jay Vosburgh <j.vosburgh@gmail.com>,
 Andy Gospodarek <andy@greyhouse.net>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Sam Creasey <sammy@sammy.net>, Dominik Brodowski
 <linux@dominikbrodowski.net>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Jan Kara <jack@suse.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Ray Lehtiniemi <rayl@mail.com>,
 Alessandro Zummo <a.zummo@towertech.it>, Andrey Panin <pazke@donpac.ru>,
 Oleg Drokin <green@crimea.edu>, Marc Zyngier <maz@kernel.org>,
 Jonas Jensen <jonas.jensen@gmail.com>,
 Sylver Bruneau <sylver.bruneau@googlemail.com>,
 Andrew Sharp <andy.sharp@lsi.com>, Denis Turischev <denis@compulab.co.il>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Alan Cox <alan@linux.intel.com>, Simon Horman <simon.horman@corigine.com>
References: <20230512100620.36807-1-bagasdotme@gmail.com>
 <20230512100620.36807-9-bagasdotme@gmail.com>
 <CAC1cPGy=78yo2XcJPNZVvdjBr2-XzSq76JrAinSe42=sNdGv3w@mail.gmail.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <CAC1cPGy=78yo2XcJPNZVvdjBr2-XzSq76JrAinSe42=sNdGv3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/12/23 19:46, Richard Fontana wrote:
> On Fri, May 12, 2023 at 6:07 AM Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> 
> 
>> diff --git a/drivers/watchdog/sb_wdog.c b/drivers/watchdog/sb_wdog.c
>> index 504be461f992a9..822bf8905bf3ce 100644
>> --- a/drivers/watchdog/sb_wdog.c
>> +++ b/drivers/watchdog/sb_wdog.c
>> @@ -1,3 +1,4 @@
>> +// SPDX-License-Identifier: GPL-1.0+
>>  /*
>>   * Watchdog driver for SiByte SB1 SoCs
>>   *
>> @@ -38,10 +39,6 @@
>>   *     (c) Copyright 1996 Alan Cox <alan@lxorguk.ukuu.org.uk>,
>>   *                                             All Rights Reserved.
>>   *
>> - *     This program is free software; you can redistribute it and/or
>> - *     modify it under the terms of the GNU General Public License
>> - *     version 1 or 2 as published by the Free Software Foundation.
> 
> Shouldn't this be
> // SPDX-License-Identifier: GPL-1.0 OR GPL-2.0
> (or in current SPDX notation GPL-1.0-only OR GPL-2.0-only) ?
> 

Nope, as it will fail spdxcheck.py. Also, SPDX specification [1]
doesn't have negation operator (NOT), thus the licensing requirement
on the above notice can't be expressed reliably in SPDX here.

[1]: https://spdx.github.io/spdx-spec/v2.3/SPDX-license-expressions/

-- 
An old man doll... just what I always wanted! - Clara

