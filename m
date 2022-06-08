Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DE97C
	for <linux-staging@lists.linux.dev>; Wed,  8 Jun 2022 06:50:08 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id bg6so19675775ejb.0
        for <linux-staging@lists.linux.dev>; Tue, 07 Jun 2022 23:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Q3uqwWR5TDfVq8mIE3XSiAy0XCktsNQOd1dNc8KMqlU=;
        b=qOACvBLytlSPu/voOY0sdKTL1YDDNSi0+JU81j2PcNE3DkvGLmP21vYDv2yz/58PUN
         gwG/QDqTwvIweE6bVAfiYbOTUgBBbB+ja+7nkZNN6hvU8qPkPRKqcM4yOe3h9QdCCMXt
         ufaXncTIRX3ZGLRuttTfRdEyraOLT5UI7HQp8cu6ohOJQkJ/PQkj8HgkfSHLiL7O2lq9
         1GNPngVI2GsSpiZR4ZSfsex65ECMVbsnuooxxyuRNd0sgagcW8OdWVrySgsLQCnag29S
         FNO92oUW1QvSS05d1rzZzPOSlOc6ykOw2MUXiaDuFZT/BJLCC8T0mNecvP87fNw4UFUN
         2FZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Q3uqwWR5TDfVq8mIE3XSiAy0XCktsNQOd1dNc8KMqlU=;
        b=7o2Svojqf3xe7XKxE94kJNxPMhRdQdi3q7rN29R0V1174g04ftJmduRg2b9ckUM70w
         Cfo2GUoVLKF6/yM85RzDwsQVJ6Ehx4aRmWuPu9c09gyrMlvHp5N3hL6kkvQXCyARnW0y
         CN5WMdYdHCaDXqyHG72XK3a9UgbyMpGdR5jVnCAyTcfi/aJk6RVVeOdwtuu62KzcKXW3
         HyLK9e6P7VHPfud/h7Xw05P93nrCwhpsGPwgPm4FrQtkkycXiRNhIMM0NEUjzfoH2Uva
         riOzvBnz931duUIoVaBxrtDCWyijRiIkTFJ88E+Bo5mmCWWjjbA0n04y5fmoGmZmUBhc
         X0eQ==
X-Gm-Message-State: AOAM530wlQfEs39Vg1tuBR+eRlwnHQw6DweZahltZomWRhPk107Vw/HR
	3DIRIeE79me0j830lWHok5I=
X-Google-Smtp-Source: ABdhPJx7gCFrR+QW3nkbkg/yiim77GsgeBcvxudU20b03iN266b+VCXaYZk8nUvYwtdIoj83yFX4Vg==
X-Received: by 2002:a17:907:60cc:b0:6f4:ffba:489 with SMTP id hv12-20020a17090760cc00b006f4ffba0489mr30434407ejc.666.1654671007136;
        Tue, 07 Jun 2022 23:50:07 -0700 (PDT)
Received: from [192.168.0.253] (ip5f5abb79.dynamic.kabel-deutschland.de. [95.90.187.121])
        by smtp.gmail.com with ESMTPSA id vj3-20020a170907130300b00705f6dab05bsm1691081ejb.183.2022.06.07.23.50.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 23:50:06 -0700 (PDT)
Message-ID: <ded4b3f5-a9bc-4612-33cc-68bd85cb92fe@gmail.com>
Date: Wed, 8 Jun 2022 08:50:05 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: [BUG] staging: r8188eu: driver stopped working with commit ("staging:
 r8188eu: add check for kzalloc")
Content-Language: en-US
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Michael Straube <straube.linux@gmail.com>
References: <20220606064055.12565-1-straube.linux@gmail.com>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20220606064055.12565-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

The driver does not work anymore on my system. In dmesg there is:

"r8188eu 1-4:1.0: _rtw_init_xmit_priv failed"

I bisected it to commit f94b47c6bde ("staging: r8188eu: add check for 
kzalloc").

~/kernels/staging> git bisect bad
f94b47c6bde624d6c07f43054087607c52054a95 is the first bad commit

At the moment I have no time to look further into it.

regards,
Michael


dmesg after plugging in the device:

[15075.514705] usb 1-4: new high-speed USB device number 4 using xhci_hcd
[15075.750717] usb 1-4: New USB device found, idVendor=0bda, 
idProduct=8179, bcdDevice= 0.00
[15075.750729] usb 1-4: New USB device strings: Mfr=1, Product=2, 
SerialNumber=3
[15075.750734] usb 1-4: Product: 802.11n NIC
[15075.750738] usb 1-4: Manufacturer: Realtek
[15075.750742] usb 1-4: SerialNumber: 200DB02CEF8F
[15075.767685] Chip Version Info: 
CHIP_8188E_Normal_Chip_TSMC_D_CUT_1T1R_RomVer(0)
[15076.121994] EEPROM ID = 0x8129
[15076.123218] r8188eu 1-4:1.0: _rtw_init_xmit_priv failed
[15076.321389] usb 1-4: reset high-speed USB device number 4 using xhci_hcd
