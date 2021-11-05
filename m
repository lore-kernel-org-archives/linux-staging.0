Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA432C96
	for <linux-staging@lists.linux.dev>; Fri,  5 Nov 2021 21:04:13 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id f9so12037298ioo.11
        for <linux-staging@lists.linux.dev>; Fri, 05 Nov 2021 14:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VqieXMd22Ix/dP2HAwT4d2t3A5EHyDUjlfRxW+gwDhQ=;
        b=WQOVats92MvsjjlhQVVhmBjRPlw6oeKd9t8q9c6CQvCkNMPFXdoD6kh3OYM/514rZb
         ViiNLSsMSHvghYJYhA9MbTpiC8xsccFGvC7g0kdCLiNaQ/x5Q2WPKUBUjr7AGLdeabpf
         TPX34zTGvgzJvQ2WNUIadX3uTBXdVKtQ3mwz8yLPO8WgdEQesbcHkESdXCgCud2t1+MQ
         iq6kNM1bd0QsZi7A7kkrTN+DKcXdLqKS4tvYH7Qjam22ExHDbtMkynpObYFiu/MQq7Rk
         Uz+wCg6c/VjAgnDog6SdmVpZm0uOlfyt6inl2oeA7oaDBZo4P1NFXpR/tyk/NkJgYTpt
         bwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VqieXMd22Ix/dP2HAwT4d2t3A5EHyDUjlfRxW+gwDhQ=;
        b=6hmoezDmXlXMmFhLS2aZgHzeTfp+T41JQGF3fDN8ph2H+KYSSeKZ3SThTgznq2oGAP
         IwWgrNY+YFi3f5z/wYHYAoXYAojWAcYwQ8E9781qBuCxgUULO/+p7ofcbPhw8M2gbZ0F
         GYyNnXb677rs07aEI8u5olsGRlvk5Fr7BrnhqszcjKVZO2/6hMrxSe7eLd2Cgyq7L5kX
         JUy7PFeyqS26e5dgYd+NtJKGVFMmhc50mm/4P8L034egpkLlqiUl8zs01yKmSw72kWUa
         +wBPps8BEJRlii8fX+pEAx/QZ/KCkhnFG3dMQRrQhG5lj55aPDpHv2Fbf5fEhmKkphZZ
         8lwQ==
X-Gm-Message-State: AOAM5310IDz7GDsuHyDgV6k1WWIKjC91nEnsJ0pC9IMn8XjbujVsX564
	z6HRYd8sakXSq6UeS8jqbAXNDjgjZ6eCX/DsAKc=
X-Google-Smtp-Source: ABdhPJx3BdMUvUHuaz8nj3Ts+i+xR3BAfgc/8flmkZroSevORVfzrnSOX1VA9UtiYMV9Dbi7sxs2GIB7NSw7vbDM+mo=
X-Received: by 2002:a05:6602:2ccf:: with SMTP id j15mr1255256iow.77.1636146252849;
 Fri, 05 Nov 2021 14:04:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABtXzjTvsN8sCQq0tMG+VZ8Vu04a1zR20P-hbQf-Mnpmu2gTNg@mail.gmail.com>
 <2d7b9450-159b-f244-f4c3-e9db753f83eb@gmail.com>
In-Reply-To: <2d7b9450-159b-f244-f4c3-e9db753f83eb@gmail.com>
From: Zameer Manji <zmanji@gmail.com>
Date: Fri, 5 Nov 2021 17:03:46 -0400
Message-ID: <CABtXzjSjkQTMmrA_PmbLaMUFR9X7xUMx+VG=v1jsdLQAdg+rJg@mail.gmail.com>
Subject: Re: r8188eu driver in 5.15 only shows wifi networks on channel 11
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: linux-staging@lists.linux.dev, 
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>, Phillip Potter <phil@philpotter.co.uk>, 
	Larry Finger <Larry.Finger@lwfinger.net>, Martin Kaiser <martin@kaiser.cx>, 
	Michael Straube <straube.linux@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Pavel,

I will attempt to bisect the issue.

So far I can confirm it occurs in 5.15-rc1.

I also forgot to mention that this issue occurs on an arm64 platform
if it matters. Would you be able to test this issue out in an arm64
VM?


On Fri, Nov 5, 2021 at 5:20 AM Pavel Skripkin <paskripkin@gmail.com> wrote:
>
> On 11/5/21 07:34, Zameer Manji wrote:
>
> [ +CC other guys related to r8188eu ]
>
> > Hello,
> >
> > I am reporting a regression in 5.15 in the r8188eu driver. Apologies
> > if this is not the right mailing list to report the issue, I am not
> > sure if reporting issues in staging drivers is appropriate for
> > linux-wireless list.
> >
> > I have a TP Link TL-WN725N device [0]. With 5.14 it is able to connect
> > to my wifi network and operate as expected. With 5.15 it is not able
> > to, the root cause appears that the wifi network no longer shows up in
> > `iwlist wlan0 scanning`. Here is the entry that shows up in 5.14 but
> > not in 5.15:
> > ```
> >            Cell 01 - Address: A0:40:A0:85:B9:FA
> >                      ESSID:"WIFI.-SLOW"
> >                      Protocol:IEEE 802.11bgn
> >                      Mode:Master
> >                      Frequency:2.447 GHz (Channel 8)
> >                      Encryption key:on
> >                      Bit Rates:144 Mb/s
> >                      Extra:rsn_ie=3D30140100000fac040100000fac040100000=
fac020c00
> >                      IE: IEEE 802.11i/WPA2 Version 1
> >                          Group Cipher : CCMP
> >                          Pairwise Ciphers (1) : CCMP
> >                          Authentication Suites (1) : PSK
> >                      IE: Unknown:
> > DD7D0050F204104A0001101044000102103B000103104700105AAA8B8AF2347DC2798F0=
56F8BC933551021000D4E4554474541522C20496E632E102300065237303030501024000652=
37303030501042000233321054000800060050F204000110110006523730303050100800022=
008103C0001031049000600372A000120
> >                      Quality=3D100/100  Signal level=3D100/100
> > ```
> >
> > The only networks that show up in `iwlist wlan0 scanning` in 5.15 have
> > `Frequency:2.462 GHz (Channel 11)` networks on other channels do not
> > show up.
> >
>
> Can you try to bisect to offending commit? I've just tested v5.15 kernel
> on my test vm and I see following output:
>
> ```
>
> root@syzkaller:~# iwlist wlx28ee5214eeb6 scanning | grep "Channel"
>                      Frequency:2.412 GHz (Channel 1)
>                      Frequency:2.412 GHz (Channel 1)
>                      Frequency:2.417 GHz (Channel 2)
>                      Frequency:2.417 GHz (Channel 2)
>                      Frequency:2.427 GHz (Channel 4)
>                      Frequency:2.422 GHz (Channel 3)
>                      Frequency:2.417 GHz (Channel 2)
>                      Frequency:2.437 GHz (Channel 6)
>                      Frequency:2.427 GHz (Channel 4)
>                      Frequency:2.442 GHz (Channel 7)
>                      Frequency:2.462 GHz (Channel 11)
>                      Frequency:2.462 GHz (Channel 11)
>                      Frequency:2.457 GHz (Channel 10)
>                      Frequency:2.467 GHz (Channel 12)
>                      Frequency:2.472 GHz (Channel 13)
>                      Frequency:2.412 GHz (Channel 1)
>                      Frequency:2.412 GHz (Channel 1)
>                      Frequency:2.442 GHz (Channel 7)
>                      Frequency:2.472 GHz (Channel 13)
> root@syzkaller:~# uname -r
> 5.15.0
> root@syzkaller:~#
>
> ```
>
> And I am able to connect to my Wi-Fi.
>
> I see only weird slab-out-of-bounce bug with debug=3D9, but, I think, it'=
s
> unrelated to your problem. Bisection would be really great :)
>
>
>
>
> With regards,
> Pavel Skripkin
>
>
> > I don't have any kernel parameters set, and I am using the same
> > firmware for both kernels. If it matters, the kernels were taken from
> > Ubuntu's Mainline PPA [1].
> >
> > Full output from lsusb for this device.
> >
> > ```
> > Bus 003 Device 002: ID 0bda:8179 Realtek Semiconductor Corp.
> > RTL8188EUS 802.11n Wireless Network Adapter
> > Device Descriptor:
> >    bLength                18
> >    bDescriptorType         1
> >    bcdUSB               2.00
> >    bDeviceClass            0
> >    bDeviceSubClass         0
> >    bDeviceProtocol         0
> >    bMaxPacketSize0        64
> >    idVendor           0x0bda Realtek Semiconductor Corp.
> >    idProduct          0x8179 RTL8188EUS 802.11n Wireless Network Adapte=
r
> >    bcdDevice            0.00
> >    iManufacturer           1 Realtek
> >    iProduct                2 802.11n NIC
> >    iSerial                 3 00E04C0001
> >    bNumConfigurations      1
> >    Configuration Descriptor:
> >      bLength                 9
> >      bDescriptorType         2
> >      wTotalLength       0x0027
> >      bNumInterfaces          1
> >      bConfigurationValue     1
> >      iConfiguration          0
> >      bmAttributes         0xa0
> >        (Bus Powered)
> >        Remote Wakeup
> >      MaxPower              500mA
> >      Interface Descriptor:
> >        bLength                 9
> >        bDescriptorType         4
> >        bInterfaceNumber        0
> >        bAlternateSetting       0
> >        bNumEndpoints           3
> >        bInterfaceClass       255 Vendor Specific Class
> >        bInterfaceSubClass    255 Vendor Specific Subclass
> >        bInterfaceProtocol    255 Vendor Specific Protocol
> >        iInterface              0
> >        Endpoint Descriptor:
> >          bLength                 7
> >          bDescriptorType         5
> >          bEndpointAddress     0x81  EP 1 IN
> >          bmAttributes            2
> >            Transfer Type            Bulk
> >            Synch Type               None
> >            Usage Type               Data
> >          wMaxPacketSize     0x0200  1x 512 bytes
> >          bInterval               0
> >        Endpoint Descriptor:
> >          bLength                 7
> >          bDescriptorType         5
> >          bEndpointAddress     0x02  EP 2 OUT
> >          bmAttributes            2
> >            Transfer Type            Bulk
> >            Synch Type               None
> >            Usage Type               Data
> >          wMaxPacketSize     0x0200  1x 512 bytes
> >          bInterval               0
> >        Endpoint Descriptor:
> >          bLength                 7
> >          bDescriptorType         5
> >          bEndpointAddress     0x03  EP 3 OUT
> >          bmAttributes            2
> >            Transfer Type            Bulk
> >            Synch Type               None
> >            Usage Type               Data
> >          wMaxPacketSize     0x0200  1x 512 bytes
> >          bInterval               0
> > ```
> >
> > Related dmesg output in 5.15
> > ```
> > [   13.542110] r8188eu: module is from the staging directory, the
> > quality is unknown, you have been warned.
> > [   13.570753] Chip Version Info:
> > CHIP_8188E_Normal_Chip_TSMC_D_CUT_1T1R_RomVer(0)
> > [   13.623399] EEPROM ID =3D 0x8129
> > [   13.646796] usbcore: registered new interface driver r8188eu
> > [   14.416673] R8188EU: Firmware Version 11, SubVersion 1, Signature 0x=
88e1
> > [   15.484020] R8188EU: INFO indicate disassoc
> > ```
> >
> > Please let me know if any other information is needed in root causing
> > this bug, or if this bug should
> > be directed elsewhere.
> >
>


--=20
Zameer Manji
