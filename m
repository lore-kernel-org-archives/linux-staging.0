Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F391C3FF0
	for <linux-staging@lists.linux.dev>; Thu,  9 Sep 2021 16:33:17 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id x10-20020a056830408a00b004f26cead745so3211603ott.10
        for <linux-staging@lists.linux.dev>; Thu, 09 Sep 2021 09:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nQ+eZTrNDDSnfAYVr8pmiY8X/uB61AXrHWwpE25AC5g=;
        b=JnPPjEpDcCEBivSWcdtwZiOHwywS1DD+YkK1Uke/BzuFxo+xTTNs52Ex7ICX/wwnR9
         rUJpKgIATXDirZRyUoZEzsoJq8RMGSMo/EJjBkyEi2Rz+47VBPGdsuRBYRJDTSTkYRiV
         0qlIgP293k9inNx7otbjTsWuACb5WUuVmIHKzjCEBtlMwopnj4dUcVWu/3Pfke8e+fBA
         ESS/9RXgaDFCBcr3HHt431Z6HpBpppWN++AwwxEg/Ao5hSfBP7+cpiJqou4ssVG5SmsD
         1pzEAE0bZijIWQuzna6PUkNyoyJgRVZnAdxHb6ndpZKXcA4fXcghOnk/v+OfurEXJmyr
         S2cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nQ+eZTrNDDSnfAYVr8pmiY8X/uB61AXrHWwpE25AC5g=;
        b=eIuakJDSsjPR4GCZ7yV1+0dcdR54l2RDRq9SBfas8OAKciZn0UMPOd41FA2nWhgPgx
         lptSj5uXMGU7ybj3LP2MH3LGMjKUqkGO/jlgsQK0DK65GYRXk7Q+DPW5X0oDkCbQLXmZ
         cvP56vze7J1iMaiHpi9HRjUGAWLO0xKaxvlf/nxOz5E8rbfTfTJKaLuglKDsK6pf/eh7
         CR9VUf/Gsu6bziTsnCEhWPsdLyXnEXfMSOyzrshTch8Z2GAQZWiY6Dtq4uWYBKqX8Irr
         7jM2jpKB1+bH3Z/JW8VQtMn8CC45FpaF457NVBl4ngYQaCpraAvuX6J8zltUB5BkhPtJ
         +3qg==
X-Gm-Message-State: AOAM533uc1DhiJWz2p1iOBubioc6YeukrIf43GRoOAq8MQmi3VIa5gcb
	ckMeAXds3fNE3pUX9FE0mQ8=
X-Google-Smtp-Source: ABdhPJz7xcq85MgZ7KgdE5J9VaH+ZUYq71wMkmQZtu9ts485Da0GCzXeWyRz+DDd0JrhUWgN65G5fA==
X-Received: by 2002:a9d:3e50:: with SMTP id h16mr707029otg.70.1631205197179;
        Thu, 09 Sep 2021 09:33:17 -0700 (PDT)
Received: from ?IPV6:2603:8090:2005:39b3::102d? (2603-8090-2005-39b3-0000-0000-0000-102d.res6.spectrum.com. [2603:8090:2005:39b3::102d])
        by smtp.gmail.com with ESMTPSA id a11sm534532oiw.36.2021.09.09.09.33.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Sep 2021 09:33:16 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <6dc3dc01-07b5-b269-f3c4-3cee4c64f540@lwfinger.net>
Date: Thu, 9 Sep 2021 11:33:15 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Subject: Re: [PATCH] staging: r8188eu: Remove conditionals
 CONFIG_88EU_{AP_MODE,P2P}
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
Cc: phil@philpotter.co.uk, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20210908050109.1279-1-Larry.Finger@lwfinger.net>
 <YTnbx2h10cgUeYmQ@kroah.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <YTnbx2h10cgUeYmQ@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/21 05:02, Greg KH wrote:
> On Wed, Sep 08, 2021 at 12:01:09AM -0500, Larry Finger wrote:
>> These two conditional compile symbols are explicitly defined.
>> As a result, their included code is always compiled. They could be
>> converted to Kconfig symbols; however, my experience with this driver
>> in a GitHub repo is that many users of the device have it built into
>> a SOC or SBC that they wish to use as an access point. As a result,
>> CONFIG_88EU_APMODE would need to be selected. Thus it should be built in.
>>
>> There have also been many users the wish to establish peer-to-peer
>> networks with this device. For this reason, I am also proposing that
>> CONFIG_88EU_P2P be automatically included.
>>
>> Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
>> ---
>>   drivers/staging/r8188eu/core/rtw_ap.c         |   8 -
>>   drivers/staging/r8188eu/core/rtw_cmd.c        |  13 --
>>   drivers/staging/r8188eu/core/rtw_debug.c      |   3 -
>>   drivers/staging/r8188eu/core/rtw_ieee80211.c  |   5 -
>>   drivers/staging/r8188eu/core/rtw_ioctl_set.c  |   5 -
>>   drivers/staging/r8188eu/core/rtw_mlme.c       |  20 +--
>>   drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 156 ++----------------
>>   drivers/staging/r8188eu/core/rtw_p2p.c        |  16 --
>>   drivers/staging/r8188eu/core/rtw_pwrctrl.c    |  19 ---
>>   drivers/staging/r8188eu/core/rtw_recv.c       |   9 -
>>   drivers/staging/r8188eu/core/rtw_sta_mgt.c    |  17 --
>>   drivers/staging/r8188eu/core/rtw_wlan_util.c  |   2 -
>>   drivers/staging/r8188eu/core/rtw_xmit.c       |   6 -
>>   drivers/staging/r8188eu/hal/hal_intf.c        |   2 -
>>   drivers/staging/r8188eu/hal/rtl8188e_cmd.c    |   3 -
>>   drivers/staging/r8188eu/hal/usb_halinit.c     |   2 -
>>   drivers/staging/r8188eu/include/drv_types.h   |   8 -
>>   drivers/staging/r8188eu/include/ieee80211.h   |  12 --
>>   .../staging/r8188eu/include/ioctl_cfg80211.h  |   2 -
>>   .../staging/r8188eu/include/rtl8188e_cmd.h    |   2 -
>>   .../staging/r8188eu/include/rtl8188e_hal.h    |   2 -
>>   drivers/staging/r8188eu/include/rtw_ap.h      |   5 -
>>   drivers/staging/r8188eu/include/rtw_cmd.h     |   4 -
>>   drivers/staging/r8188eu/include/rtw_debug.h   |   4 -
>>   drivers/staging/r8188eu/include/rtw_mlme.h    |   5 -
>>   .../staging/r8188eu/include/rtw_mlme_ext.h    |   4 -
>>   .../staging/r8188eu/include/rtw_security.h    |   2 -
>>   drivers/staging/r8188eu/include/rtw_xmit.h    |   2 -
>>   drivers/staging/r8188eu/include/sta_info.h    |   7 -
>>   drivers/staging/r8188eu/os_dep/ioctl_linux.c  |  38 -----
>>   drivers/staging/r8188eu/os_dep/mlme_linux.c   |   4 -
>>   drivers/staging/r8188eu/os_dep/os_intfs.c     |  13 --
>>   drivers/staging/r8188eu/os_dep/usb_intf.c     |   4 -
>>   .../staging/r8188eu/os_dep/usb_ops_linux.c    |   2 -
>>   34 files changed, 12 insertions(+), 394 deletions(-)
> 
> Wait, shouldn't you also remove it from the Kconfig file as part of this
> change?

Yes, it should. V2 coming soon.

Note that when the CFG80211 code is ready, the following selects can also be 
removed:

         select WIRELESS_EXT
         select WEXT_PRIV
         select LIB80211
         select LIB80211_CRYPT_WEP
         select LIB80211_CRYPT_CCMP

They will be replaced with 'select CONFIG_CFG80211'.

Larry


Larry


Larry

