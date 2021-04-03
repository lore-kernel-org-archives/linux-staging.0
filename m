Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1536259E
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 21:31:00 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id d13so12169963lfg.7
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 14:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wAwaa9LP0wQ209XA7qPfB41Svfic7ft68qPsbT5JtIM=;
        b=Oh55ya+pPEbtZQ9V4bd/ADzwbAatOuoslLhY3grU0ZF6RzeyXh4m+pLQS4sGLViUn5
         lexWhNpBBTNesiz5n+awTqXn140ClJm7RBaZasq6eJPEJuML9e6uKOZYRlMsaqEYql2q
         P/YsMcj39SRNPQQzosmP9VVnP4siJQNOqvbmJgtxuA+OWgbRWsmyFI4TXtYJuev3n7uz
         GvrDHJl+LnFi3L/Xo+LuUV/9w8VFInsCjMoP7492T4JrlqBx0KACo5xEI7+YeAdhfq+l
         nPNNxGlMSGd7asUKlnEiv+qO+ApnfQzEXkxe1r4MG9PnjrWNm8eeLN1zGAAAck1FJr/A
         VR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wAwaa9LP0wQ209XA7qPfB41Svfic7ft68qPsbT5JtIM=;
        b=BlapCStwFtnX0FIou7DhJnkw+/gU7wBAqHz/Qnb9wnxg0Y9A+285/BFEpgzonZz7Yx
         +4wPgMAx9+OQZoKB0Dfny6Lc4DavX9FqVmVIppiLXrggJVMG9AzJX5hlgWSwEWdW0NAU
         93cc1bz0pNmupkSYQUx7KmQ6yZFlFSiJmBzf8e1JXSTYCp1xUYNIPQsR0IBRnOz8/+n9
         cV6cXI12T1qOe0tUgQs9Ru8w+Or5mhcdJk3npkA29K08e2uBtR9M2syjsx2A9VMKEgdo
         YFRqzc1kJ03zc7RRb5RWElgtd5bV+OHfawgeOkF2nDZfr02LCdxuAB4PViwQUEw0fTae
         3pAw==
X-Gm-Message-State: AOAM53305iXqzxGwwmX09e2jnhbBcWbHY7qdgxdm3EU3/ZQsn1dPf+P7
	HRVH88cNGGpTEJc9T48Cuq4=
X-Google-Smtp-Source: ABdhPJxpSa3m+3fSh7iJM4XPELlxclT+nVjh5P3ZCQ4osmltScszpMNni9Z53zHpZCNjo0Z01Jkd2A==
X-Received: by 2002:a19:5e14:: with SMTP id s20mr13132692lfb.110.1617485459165;
        Sat, 03 Apr 2021 14:30:59 -0700 (PDT)
Received: from [192.168.0.160] (10.177.smarthome.spb.ru. [109.71.177.10])
        by smtp.gmail.com with ESMTPSA id h7sm1240676lfg.246.2021.04.03.14.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Apr 2021 14:30:58 -0700 (PDT)
Subject: Re: [PATCH 2/2] staging:r8188eu: remove dummy handlers from
 OnAction()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Michael Straube <straube.linux@gmail.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Peilin Ye <yepeilin.cs@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210328163323.53163-1-insafonov@gmail.com>
 <20210328163323.53163-2-insafonov@gmail.com> <YGcWTOUl8OtAHTT4@kroah.com>
From: Ivan Safonov <insafonov@gmail.com>
Message-ID: <8955077a-94b6-9ffb-d2f6-b611845b6cfc@gmail.com>
Date: Sun, 4 Apr 2021 00:30:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YGcWTOUl8OtAHTT4@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/2/21 4:04 PM, Greg Kroah-Hartman wrote:
> On Sun, Mar 28, 2021 at 07:33:25PM +0300, Ivan Safonov wrote:
>> on_action_spct() do nothing, because rtw_get_stainfo() has no side
>> effects. Other action handlers are trivial.
>>
>> Signed-off-by: Ivan Safonov <insafonov@gmail.com>
> 
> Same here, wrong driver name :(
> 

Driver name is "r8188eu"...

$ grep 'r8188eu' drivers/staging/rtl8188eu/include/drv_types.h
#define DRV_NAME "r8188eu"

$ grep 'r8188eu' drivers/staging/rtl8188eu/os_dep/usb_intf.c -B1 -A7
static struct usb_driver rtl8188e_usb_drv = {
         .name = "r8188eu",
         .probe = rtw_drv_init,
         .disconnect = rtw_dev_remove,
         .id_table = rtw_usb_id_tbl,
         .suspend =  rtw_suspend,
         .resume = rtw_resume,
         .reset_resume = rtw_resume,
};

$ cat drivers/staging/rtl8188eu/Kconfig
# SPDX-License-Identifier: GPL-2.0
config R8188EU
         tristate "Realtek RTL8188EU Wireless LAN NIC driver"
         depends on WLAN && USB && CFG80211
         depends on m
         select WIRELESS_EXT
         select WEXT_PRIV
         select LIB80211
         select LIB80211_CRYPT_WEP
         select LIB80211_CRYPT_CCMP
         help
         This option adds the Realtek RTL8188EU USB device such as 
TP-Link TL-WN725N.
         If built as a module, it will be called r8188eu.

if R8188EU

config 88EU_AP_MODE
         bool "Realtek RTL8188EU AP mode"
         default y
         help
         This option enables Access Point mode. Unless you know that 
your system
         will never be used as an AP, or the target system has limited 
memory,
         "Y" should be selected.

endif
