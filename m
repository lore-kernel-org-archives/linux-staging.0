Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7222C80
	for <linux-staging@lists.linux.dev>; Fri,  5 Nov 2021 04:35:15 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id l19so8446315ilk.0
        for <linux-staging@lists.linux.dev>; Thu, 04 Nov 2021 21:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=MDBbmi2eY2q0ZXWE+Ya451qYAOeNmxVtbLMAzBWO2Do=;
        b=YhEAaKXC5wK4Qg4ZfNr34PGjgASNGlyzmNs7DSqbC27uWN/eH5jXEisZMJMn/SCSMG
         pOQY3BFqsXIeLwNnFye57U+kZXTcBpZu88dPwu7LpKgQGFTW/0aTLSYGdH1sOMDNDE26
         mSpM5VNeQ9CoVwonBee1ArsuZWS5o5lqsgl1mRa1LUm+5qeRNr+Gt8tt9P/zzQpm0cwK
         3sqI8ujuH7dGhr3cwvkuyu+kldG8kRxEr4ztbfgSn+KnO9qaYenEQ8ccHlXKkaftYFQi
         m30C4sS8Ttcett+s8mPlFRhg6A/oogJXGffOWW2vtAzao7K23YDS4anjHWfS2YiLinSV
         tmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=MDBbmi2eY2q0ZXWE+Ya451qYAOeNmxVtbLMAzBWO2Do=;
        b=A4eJ1PMby7t7KPkdpzZ66H2wMpiAe2vKqJRVpjSTJ1yrTkN5pAWyePZlpFbEA3FJ2j
         NJXqUMdiC7gC10Iz+95Njy7HqkHsChajQIb4pXWbS34niMKWf12YJ2Ge8mnZfpLS8KWf
         6Bec01zsAUDzu1wTJOh7xfq5ZH7BmiiHb6QVKPVwmkzatAw4PnDBdQWJ5FtZWhfs6YKC
         WfExobYv+zT7BmpuE52e5KTef51uSz6RlqVsrNsLtnOwAtf9ITEnYfXzUjl18tap0HmJ
         uf0XZZmXn03YNA2iz/uwgsFZnDpJ+GVe79NwsiBk3cA2kmpfT2KluFTUg4Xrh5wPqu5W
         EszA==
X-Gm-Message-State: AOAM532i5QE/PmLOxOcFOVQsZElKKzwdLbwcQRqRON7oMobtF0ksYI+V
	V3KRk6gFfVrvGyFJKdI8tsLg+jBL7IuVbW+XhjUgGyB8rvA=
X-Google-Smtp-Source: ABdhPJyRb5S0VdqNPJC4jAMOUdF4SphKF2bJgT8udKKOvigSmskJdCAjoM0IlZEqk7anv/WNFMGHQKpDckDtOE+2A5o=
X-Received: by 2002:a05:6e02:12e6:: with SMTP id l6mr10792571iln.231.1636086914861;
 Thu, 04 Nov 2021 21:35:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Zameer Manji <zmanji@gmail.com>
Date: Fri, 5 Nov 2021 00:34:49 -0400
Message-ID: <CABtXzjTvsN8sCQq0tMG+VZ8Vu04a1zR20P-hbQf-Mnpmu2gTNg@mail.gmail.com>
Subject: r8188eu driver in 5.15 only shows wifi networks on channel 11
To: linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

I am reporting a regression in 5.15 in the r8188eu driver. Apologies
if this is not the right mailing list to report the issue, I am not
sure if reporting issues in staging drivers is appropriate for
linux-wireless list.

I have a TP Link TL-WN725N device [0]. With 5.14 it is able to connect
to my wifi network and operate as expected. With 5.15 it is not able
to, the root cause appears that the wifi network no longer shows up in
`iwlist wlan0 scanning`. Here is the entry that shows up in 5.14 but
not in 5.15:
```
          Cell 01 - Address: A0:40:A0:85:B9:FA
                    ESSID:"WIFI.-SLOW"
                    Protocol:IEEE 802.11bgn
                    Mode:Master
                    Frequency:2.447 GHz (Channel 8)
                    Encryption key:on
                    Bit Rates:144 Mb/s
                    Extra:rsn_ie=30140100000fac040100000fac040100000fac020c00
                    IE: IEEE 802.11i/WPA2 Version 1
                        Group Cipher : CCMP
                        Pairwise Ciphers (1) : CCMP
                        Authentication Suites (1) : PSK
                    IE: Unknown:
DD7D0050F204104A0001101044000102103B000103104700105AAA8B8AF2347DC2798F056F8BC933551021000D4E4554474541522C20496E632E10230006523730303050102400065237303030501042000233321054000800060050F204000110110006523730303050100800022008103C0001031049000600372A000120
                    Quality=100/100  Signal level=100/100
```

The only networks that show up in `iwlist wlan0 scanning` in 5.15 have
`Frequency:2.462 GHz (Channel 11)` networks on other channels do not
show up.

I don't have any kernel parameters set, and I am using the same
firmware for both kernels. If it matters, the kernels were taken from
Ubuntu's Mainline PPA [1].

Full output from lsusb for this device.

```
Bus 003 Device 002: ID 0bda:8179 Realtek Semiconductor Corp.
RTL8188EUS 802.11n Wireless Network Adapter
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0        64
  idVendor           0x0bda Realtek Semiconductor Corp.
  idProduct          0x8179 RTL8188EUS 802.11n Wireless Network Adapter
  bcdDevice            0.00
  iManufacturer           1 Realtek
  iProduct                2 802.11n NIC
  iSerial                 3 00E04C0001
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0027
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xa0
      (Bus Powered)
      Remote Wakeup
    MaxPower              500mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           3
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass    255 Vendor Specific Subclass
      bInterfaceProtocol    255 Vendor Specific Protocol
      iInterface              0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x02  EP 2 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x03  EP 3 OUT
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0200  1x 512 bytes
        bInterval               0
```

Related dmesg output in 5.15
```
[   13.542110] r8188eu: module is from the staging directory, the
quality is unknown, you have been warned.
[   13.570753] Chip Version Info:
CHIP_8188E_Normal_Chip_TSMC_D_CUT_1T1R_RomVer(0)
[   13.623399] EEPROM ID = 0x8129
[   13.646796] usbcore: registered new interface driver r8188eu
[   14.416673] R8188EU: Firmware Version 11, SubVersion 1, Signature 0x88e1
[   15.484020] R8188EU: INFO indicate disassoc
```

Please let me know if any other information is needed in root causing
this bug, or if this bug should
be directed elsewhere.

[0] Available here
https://www.amazon.com/TP-Link-wireless-network-Adapter-SoftAP/dp/B008IFXQFU/
[1] https://kernel.ubuntu.com/~kernel-ppa/mainline/
-- 
Zameer Manji
