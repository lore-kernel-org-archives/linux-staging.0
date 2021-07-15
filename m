Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DB570
	for <linux-staging@lists.linux.dev>; Thu, 15 Jul 2021 10:08:52 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id q18-20020a1ce9120000b02901f259f3a250so3247579wmc.2
        for <linux-staging@lists.linux.dev>; Thu, 15 Jul 2021 03:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ijtb4G/hc385IfMsMOWiOrnQJxdpMd4D8+Ng3Od+NqY=;
        b=nWzuVxoMT4VHpZmeLo/Q7mlUv4y3HfNEyAMWJHyFUoEfnNtYSL8BiRcgbBa1D2CX36
         pN4sy0UnAIimZpctKZFLBfkk7Vty7B/YguVRWwkkLpD6/Eybqh/7TPPZf9wanvUlEKCY
         cZ4qDDDKZevVivJKaqZ3b0cCYTtGwPE6ymEOt30/gkr3/IHznyxskpxTtQDbJ3RnYdnz
         vZv42avJDJSH840BetqPwbG8n263PR45UjIz9UrwelC7n4FBlv224QXii3UKI2oWAYGH
         F6dbnwjuhij+Om051vLdJQUSCXripwOySTmKkO6nWAUoZOaie4N5Hsa/zZRCKshVjB4v
         4Ohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ijtb4G/hc385IfMsMOWiOrnQJxdpMd4D8+Ng3Od+NqY=;
        b=jl5PoyBBVdczyIxEGJHHoeBLi1tXqMcVN2LOpyIiQ62gwUfvV1Hi2QBVOB7ZTagD5e
         RglbouAfAEoi38rro4Cfovl+3io25izcVUUyK8IeZQ3Ww8axi9Gv2N199TQU37yVvpI+
         vsvaMtUfoY/lsEcdQKRFeO4aIkctHuD505o6rNGt1APuFhVX8IPafrAJzp1j+ChDbIGd
         ct87E8kQ5kzda9skOfSsJYCFhz/lZEPSMyHNEmSYh4JMEDrjJHQwCWn4GvBduyDDEyrU
         Y64tt4vB5YAPx+Y+Xqiblh9LnG+BAY+zCSVaGSaRFedt0A/BgWiJjR3OS9y7akf9XAFs
         UvtQ==
X-Gm-Message-State: AOAM532JybY2rGbIPospolcUxd8uzyA5mi6Zap30gSmfZisLLjHp4cdw
	RarNy0ieR4WgPQC9gTTZin8=
X-Google-Smtp-Source: ABdhPJzAamOVpXRifsiGGIubtfoku+yCSTTrFqsVPVd0CUWZsaW4V8dr7txB0XluBaZFNatPDevcmw==
X-Received: by 2002:a05:600c:1546:: with SMTP id f6mr3661109wmg.164.1626343730218;
        Thu, 15 Jul 2021 03:08:50 -0700 (PDT)
Received: from agape.jhs ([5.171.89.158])
        by smtp.gmail.com with ESMTPSA id k13sm6226074wrp.34.2021.07.15.03.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 03:08:50 -0700 (PDT)
Date: Thu, 15 Jul 2021 12:08:47 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Colin Ian King <colin.king@canonical.com>
Cc: Quytelda Kahja <quytelda@tamalin.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: staging: rtl8723bs mask values in wpa_set_auth_algs
Message-ID: <20210715100846.GA2271@agape.jhs>
References: <619462ca-e652-30f5-6ffa-3213175d8bbc@canonical.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <619462ca-e652-30f5-6ffa-3213175d8bbc@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hello Colin,

On Fri, Jul 09, 2021 at 03:53:39PM +0100, Colin Ian King wrote:
> Hi,
> 
> Static analysis with Coverity has found an issue introduced by the
> following commit:
> 
> commit 5befa937e8daaebcde81b9423eb93f3ff2e918f7
> Author: Quytelda Kahja <quytelda@tamalin.org>
> Date:   Tue Mar 27 01:41:02 2018 -0700
> 
>     staging: rtl8723bs: Fix IEEE80211 authentication algorithm constants.
> 
> The analysis is as follows:
> 
> 347 static int wpa_set_auth_algs(struct net_device *dev, u32 value)
> 348 {
> 349        struct adapter *padapter = rtw_netdev_priv(dev);
> 350        int ret = 0;
> 351
> 352        if ((value & WLAN_AUTH_SHARED_KEY) && (value & WLAN_AUTH_OPEN)) {
> 
> Logically dead code (DEADCODE)
> 
> 353                padapter->securitypriv.ndisencryptstatus =
> Ndis802_11Encryption1Enabled;
> 354                padapter->securitypriv.ndisauthtype =
> Ndis802_11AuthModeAutoSwitch;
> 355                padapter->securitypriv.dot11AuthAlgrthm =
> dot11AuthAlgrthm_Auto;
> 356        } else if (value & WLAN_AUTH_SHARED_KEY)        {
> 357                padapter->securitypriv.ndisencryptstatus =
> Ndis802_11Encryption1Enabled;
> 358
> 359                padapter->securitypriv.ndisauthtype =
> Ndis802_11AuthModeShared;
> 360                padapter->securitypriv.dot11AuthAlgrthm =
> dot11AuthAlgrthm_Shared;
>    dead_error_condition: The condition value & 0U cannot be true.
> 361        } else if (value & WLAN_AUTH_OPEN) {
> 362                /* padapter->securitypriv.ndisencryptstatus =
> Ndis802_11EncryptionDisabled; */
> 
> Logically dead code (DEADCODE)
> 
> 363                if (padapter->securitypriv.ndisauthtype <
> Ndis802_11AuthModeWPAPSK) {
> 364                        padapter->securitypriv.ndisauthtype =
> Ndis802_11AuthModeOpen;
> 365                        padapter->securitypriv.dot11AuthAlgrthm =
> dot11AuthAlgrthm_Open;
> 366                }
> 367        } else {
> 368                ret = -EINVAL;
> 369        }
> 370
> 371        return ret;
> 372
> 373 }
> 
> The deadcode warnings occur because the mask value of WLAN_AUTH_OPEN is
> defined in /include/linux/ieee80211.h as:
> 
> #define WLAN_AUTO_OPEN 0
> 
> and so any value masked with 0 is 0 and hence that part of the if
> statement is always false.
> 
> The original code was using the mask values:
> 
> AUTH_ALG_SHARED_KEY and also AUTH_ALG_OPEN_SYSTEM that are defined as:
> 
> #define AUTH_ALG_OPEN_SYSTEM                   0x1
> #define AUTH_ALG_SHARED_KEY                    0x2

I think that the correct macros are:

/* IW_AUTH_80211_AUTH_ALG values (bit field) */
#define IW_AUTH_ALG_OPEN_SYSTEM 0x00000001
#define IW_AUTH_ALG_SHARED_KEY  0x00000002
#define IW_AUTH_ALG_LEAP        0x00000004

defined in include/uapi/linux/wireless.h

> 
> So this appears to be a regression. I'm not sure the best approach for a
> suitable fix to use the intended macros in ieee80211.h
> 
> Colin
> 
> 
> 
> 

thank you,

fabio
