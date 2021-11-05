Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B633E2C96
	for <linux-staging@lists.linux.dev>; Fri,  5 Nov 2021 09:20:32 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id bi35so17397002lfb.9
        for <linux-staging@lists.linux.dev>; Fri, 05 Nov 2021 02:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:cc:from:in-reply-to:content-transfer-encoding;
        bh=FeZmmcd4rwspIO+mtLRKz54Py4NbbNEstTuM41+Lv1U=;
        b=kfsPm/1i7B9yi+RrqNNgD7PqiSFwaDRgEQFSWRuD/S0VrvtNyJtQhVAPInQu0boDdL
         xAGepa5PVfjxqO1idMBP8J61DUF76YUi3vsbL1iM8bqE4OwRCUssPKWTpqD7fkfEJDes
         Tsdq9k5Tu5G2LHa3IJZD7Vls41KG7yBXRhtlGrgWTGta72weJlDbDJU5GsM6jcrPA1oK
         qja97sndcI1l0Y3jWpcgXKxeyxS2rW9Ku6VQvSoDQRVAHjLD1olDx7JW6QNA93ODhWhn
         sk5UK0bW4WfRIpOAhTfsp2qRWL3iebIPszXyzrtW/5lekGS9UWffLzPQNPqTXR2QR/Hk
         0WtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:cc:from:in-reply-to
         :content-transfer-encoding;
        bh=FeZmmcd4rwspIO+mtLRKz54Py4NbbNEstTuM41+Lv1U=;
        b=S8RKxsdGpFxozhUb4+8edkfWyqcdwPlWycnYtranooaL71xtCh6Ypes6BHnDnIjIQG
         1rbFDxryKp8bvP856/FO2Z5RC5hYyzkafF7QmDqnADDzSkBq6ZpY3SZA7F1qw3OXKW6L
         JlDTxD7bMB4kaESNsGCHazfs1sukUFk5oONP0Y+VlIbgRBM8HtJVxDGs5v6Q4mQ+cqbs
         NWnJ4QVQiziTh37kxB5nWvdwiMwgnpwYQyLFOnskOaSd2vKiYd4tBWm00jz9KUdx+p6D
         MOGIclOwnmaCZPVLnUJQdQ86Dd1wFy/+XmQJywGS4RIgBYDqZaiFa3C5NU3eM8WP4YhH
         btOg==
X-Gm-Message-State: AOAM531GbLSAcySSfc20vC19EG4bmevwwTbDPnuZlZqif7Fj050VLNy/
	MdGy2O9524TuTFVx4oPt0yNpECH+TSc=
X-Google-Smtp-Source: ABdhPJzUg7SbL6xN++stG1xq6Snk5GQs1ROj4zUQTq3MiPKYHdJPQ6Qk3LMGXVkzkoEVKFXWMNBxww==
X-Received: by 2002:a05:6512:4024:: with SMTP id br36mr6100655lfb.137.1636104030607;
        Fri, 05 Nov 2021 02:20:30 -0700 (PDT)
Received: from [192.168.1.11] ([217.117.245.207])
        by smtp.gmail.com with ESMTPSA id 68sm642394ljf.80.2021.11.05.02.20.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Nov 2021 02:20:29 -0700 (PDT)
Message-ID: <2d7b9450-159b-f244-f4c3-e9db753f83eb@gmail.com>
Date: Fri, 5 Nov 2021 12:20:28 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: r8188eu driver in 5.15 only shows wifi networks on channel 11
Content-Language: en-US
To: Zameer Manji <zmanji@gmail.com>, linux-staging@lists.linux.dev
References: <CABtXzjTvsN8sCQq0tMG+VZ8Vu04a1zR20P-hbQf-Mnpmu2gTNg@mail.gmail.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Phillip Potter <phil@philpotter.co.uk>,
 Larry Finger <Larry.Finger@lwfinger.net>, Martin Kaiser <martin@kaiser.cx>,
 Michael Straube <straube.linux@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <CABtXzjTvsN8sCQq0tMG+VZ8Vu04a1zR20P-hbQf-Mnpmu2gTNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/21 07:34, Zameer Manji wrote:

[ +CC other guys related to r8188eu ]

> Hello,
> 
> I am reporting a regression in 5.15 in the r8188eu driver. Apologies
> if this is not the right mailing list to report the issue, I am not
> sure if reporting issues in staging drivers is appropriate for
> linux-wireless list.
> 
> I have a TP Link TL-WN725N device [0]. With 5.14 it is able to connect
> to my wifi network and operate as expected. With 5.15 it is not able
> to, the root cause appears that the wifi network no longer shows up in
> `iwlist wlan0 scanning`. Here is the entry that shows up in 5.14 but
> not in 5.15:
> ```
>            Cell 01 - Address: A0:40:A0:85:B9:FA
>                      ESSID:"WIFI.-SLOW"
>                      Protocol:IEEE 802.11bgn
>                      Mode:Master
>                      Frequency:2.447 GHz (Channel 8)
>                      Encryption key:on
>                      Bit Rates:144 Mb/s
>                      Extra:rsn_ie=30140100000fac040100000fac040100000fac020c00
>                      IE: IEEE 802.11i/WPA2 Version 1
>                          Group Cipher : CCMP
>                          Pairwise Ciphers (1) : CCMP
>                          Authentication Suites (1) : PSK
>                      IE: Unknown:
> DD7D0050F204104A0001101044000102103B000103104700105AAA8B8AF2347DC2798F056F8BC933551021000D4E4554474541522C20496E632E10230006523730303050102400065237303030501042000233321054000800060050F204000110110006523730303050100800022008103C0001031049000600372A000120
>                      Quality=100/100  Signal level=100/100
> ```
> 
> The only networks that show up in `iwlist wlan0 scanning` in 5.15 have
> `Frequency:2.462 GHz (Channel 11)` networks on other channels do not
> show up.
> 

Can you try to bisect to offending commit? I've just tested v5.15 kernel 
on my test vm and I see following output:

```

root@syzkaller:~# iwlist wlx28ee5214eeb6 scanning | grep "Channel"
                     Frequency:2.412 GHz (Channel 1)
                     Frequency:2.412 GHz (Channel 1)
                     Frequency:2.417 GHz (Channel 2)
                     Frequency:2.417 GHz (Channel 2)
                     Frequency:2.427 GHz (Channel 4)
                     Frequency:2.422 GHz (Channel 3)
                     Frequency:2.417 GHz (Channel 2)
                     Frequency:2.437 GHz (Channel 6)
                     Frequency:2.427 GHz (Channel 4)
                     Frequency:2.442 GHz (Channel 7)
                     Frequency:2.462 GHz (Channel 11)
                     Frequency:2.462 GHz (Channel 11)
                     Frequency:2.457 GHz (Channel 10)
                     Frequency:2.467 GHz (Channel 12)
                     Frequency:2.472 GHz (Channel 13)
                     Frequency:2.412 GHz (Channel 1)
                     Frequency:2.412 GHz (Channel 1)
                     Frequency:2.442 GHz (Channel 7)
                     Frequency:2.472 GHz (Channel 13)
root@syzkaller:~# uname -r
5.15.0
root@syzkaller:~#

```

And I am able to connect to my Wi-Fi.

I see only weird slab-out-of-bounce bug with debug=9, but, I think, it's 
unrelated to your problem. Bisection would be really great :)




With regards,
Pavel Skripkin


> I don't have any kernel parameters set, and I am using the same
> firmware for both kernels. If it matters, the kernels were taken from
> Ubuntu's Mainline PPA [1].
> 
> Full output from lsusb for this device.
> 
> ```
> Bus 003 Device 002: ID 0bda:8179 Realtek Semiconductor Corp.
> RTL8188EUS 802.11n Wireless Network Adapter
> Device Descriptor:
>    bLength                18
>    bDescriptorType         1
>    bcdUSB               2.00
>    bDeviceClass            0
>    bDeviceSubClass         0
>    bDeviceProtocol         0
>    bMaxPacketSize0        64
>    idVendor           0x0bda Realtek Semiconductor Corp.
>    idProduct          0x8179 RTL8188EUS 802.11n Wireless Network Adapter
>    bcdDevice            0.00
>    iManufacturer           1 Realtek
>    iProduct                2 802.11n NIC
>    iSerial                 3 00E04C0001
>    bNumConfigurations      1
>    Configuration Descriptor:
>      bLength                 9
>      bDescriptorType         2
>      wTotalLength       0x0027
>      bNumInterfaces          1
>      bConfigurationValue     1
>      iConfiguration          0
>      bmAttributes         0xa0
>        (Bus Powered)
>        Remote Wakeup
>      MaxPower              500mA
>      Interface Descriptor:
>        bLength                 9
>        bDescriptorType         4
>        bInterfaceNumber        0
>        bAlternateSetting       0
>        bNumEndpoints           3
>        bInterfaceClass       255 Vendor Specific Class
>        bInterfaceSubClass    255 Vendor Specific Subclass
>        bInterfaceProtocol    255 Vendor Specific Protocol
>        iInterface              0
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x81  EP 1 IN
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0200  1x 512 bytes
>          bInterval               0
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x02  EP 2 OUT
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0200  1x 512 bytes
>          bInterval               0
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x03  EP 3 OUT
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0200  1x 512 bytes
>          bInterval               0
> ```
> 
> Related dmesg output in 5.15
> ```
> [   13.542110] r8188eu: module is from the staging directory, the
> quality is unknown, you have been warned.
> [   13.570753] Chip Version Info:
> CHIP_8188E_Normal_Chip_TSMC_D_CUT_1T1R_RomVer(0)
> [   13.623399] EEPROM ID = 0x8129
> [   13.646796] usbcore: registered new interface driver r8188eu
> [   14.416673] R8188EU: Firmware Version 11, SubVersion 1, Signature 0x88e1
> [   15.484020] R8188EU: INFO indicate disassoc
> ```
> 
> Please let me know if any other information is needed in root causing
> this bug, or if this bug should
> be directed elsewhere.
> 

