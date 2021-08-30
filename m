Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971943FC2
	for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 00:21:38 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id fs6so8302683pjb.4
        for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 17:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ke0tls+7+LPLJsimfwRuyYvi3NKswNkWCJ4p4i2engI=;
        b=HghffSYgTGHoFgrjY4yWMmNA9fDowsajh8hWyAGMVlZJ9w0HEcN8XwuLOLV7ENkvHF
         UAcj62DlXLOWWCGM4Dtb1hpKm8CdaCIiYDZT+FsH2PSI6RCM3jwpvD6L/EHQzDP6MPPU
         A2qzMS4hIm5sfqj2+dcBv6oVAfmcdLzCRg78YyxEacySFReT0yS6jBMQ/7A4879x/dM6
         YCDzTvwy2ZNPZW62UvRmAQ6Kswc/Q/iWZD0nWeEiJuqSbWK81pMtUi8Mh82WnFk74EUx
         OdAbYpwmRlKmR4BkorEebap0+5eNc9hLPxD39bs5wqCRVAK6YGKtp2Gfz7mn6+/d4gh3
         SYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ke0tls+7+LPLJsimfwRuyYvi3NKswNkWCJ4p4i2engI=;
        b=qSQZbdFRrm94E7HyjPFTWeReo2fol69xAdCs9gQRto7TVKlA4+09L4+fLGGz+SGS8g
         TFI3l3835U9NDUuuN4wcLc00lO+PUFM94GT1qV7kpx0b1CeMNXTj5OMtmhLvgfiOISEY
         gNCavsE9eev+kgiB4nKOJRCBQ02zYa4me4tZ3rPRKM/I8eGqfKaoGxma3KRo/04TQ011
         vpaOxE0v3cSwK0YlK9oAB+wdbxszW7JsvZqvVCsq/Vmwo3VKWY6E31VTHY2OmSIeCIbj
         wZGqVAqrmBM6yCvJgPW1iv+ubaJkJSdkn4LKwzzHZcc9Pzd15RUILHCvc645YfhKVHtg
         Tf/Q==
X-Gm-Message-State: AOAM530M2tJME9dhModYgQin9Pf4GUEcSo0zlUBhJzeyxcbfeG4Oga+N
	hYKHkxxX+50sqmdUs64kx1FFT2Lw4zXbC7Lz8bzTOg==
X-Google-Smtp-Source: ABdhPJzQ9pUbyzNzCIuIzs40Pa1q8XCu1tinyUikd4Jssccim1V4FNauBFjBPNqQIDqkByVuXb81Lt9jzTymBFrjdgk=
X-Received: by 2002:a17:90b:691:: with SMTP id m17mr4125982pjz.217.1630282898122;
 Sun, 29 Aug 2021 17:21:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210829180717.15393-1-straube.linux@gmail.com> <20210829180717.15393-2-straube.linux@gmail.com>
In-Reply-To: <20210829180717.15393-2-straube.linux@gmail.com>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Mon, 30 Aug 2021 01:21:27 +0100
Message-ID: <CAA=Fs0mnaBKbw0ZWg-fgRZ0a6vZCHO-U9cL+D5_a2WpROtWKYA@mail.gmail.com>
Subject: Re: [PATCH 2/2] staging: r8188eu: remove commented constants from wifi.h
To: Michael Straube <straube.linux@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Martin Kaiser <martin@kaiser.cx>, "Fabio M. De Francesco" <fmdefrancesco@gmail.com>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 29 Aug 2021 at 19:07, Michael Straube <straube.linux@gmail.com> wrote:
>
> Remove commented constants from wifi.h.
>
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>  drivers/staging/r8188eu/include/wifi.h | 50 --------------------------
>  1 file changed, 50 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
> index eb07ac9b8943..193a557f0f47 100644
> --- a/drivers/staging/r8188eu/include/wifi.h
> +++ b/drivers/staging/r8188eu/include/wifi.h
> @@ -114,33 +114,6 @@ enum WIFI_REASON_CODE      {
>         _RSON_TDLS_TEAR_UN_RSN_         = 26,
>  };
>
> -/* Reason codes (IEEE 802.11-2007, 7.3.1.7, Table 7-22)
> -
> -#define WLAN_REASON_UNSPECIFIED 1
> -#define WLAN_REASON_PREV_AUTH_NOT_VALID 2
> -#define WLAN_REASON_DEAUTH_LEAVING 3
> -#define WLAN_REASON_DISASSOC_DUE_TO_INACTIVITY 4
> -#define WLAN_REASON_DISASSOC_AP_BUSY 5
> -#define WLAN_REASON_CLASS2_FRAME_FROM_NONAUTH_STA 6
> -#define WLAN_REASON_CLASS3_FRAME_FROM_NONASSOC_STA 7
> -#define WLAN_REASON_DISASSOC_STA_HAS_LEFT 8
> -#define WLAN_REASON_STA_REQ_ASSOC_WITHOUT_AUTH 9 */
> -/* IEEE 802.11h */
> -
> -/* IEEE 802.11i
> -#define WLAN_REASON_INVALID_IE 13
> -#define WLAN_REASON_MICHAEL_MIC_FAILURE 14
> -#define WLAN_REASON_4WAY_HANDSHAKE_TIMEOUT 15
> -#define WLAN_REASON_GROUP_KEY_UPDATE_TIMEOUT 16
> -#define WLAN_REASON_IE_IN_4WAY_DIFFERS 17
> -#define WLAN_REASON_GROUP_CIPHER_NOT_VALID 18
> -#define WLAN_REASON_PAIRWISE_CIPHER_NOT_VALID 19
> -#define WLAN_REASON_AKMP_NOT_VALID 20
> -#define WLAN_REASON_UNSUPPORTED_RSN_IE_VERSION 21
> -#define WLAN_REASON_INVALID_RSN_IE_CAPAB 22
> -#define WLAN_REASON_IEEE_802_1X_AUTH_FAILED 23
> -#define WLAN_REASON_CIPHER_SUITE_REJECTED 24 */
> -
>  enum WIFI_STATUS_CODE {
>         _STATS_SUCCESSFUL_              = 0,
>         _STATS_FAILURE_                 = 1,
> @@ -155,19 +128,6 @@ enum WIFI_STATUS_CODE {
>         _STATS_RATE_FAIL_               = 18,
>  };
>
> -/* Status codes (IEEE 802.11-2007, 7.3.1.9, Table 7-23)
> -#define WLAN_STATUS_SUCCESS 0
> -#define WLAN_STATUS_UNSPECIFIED_FAILURE 1
> -#define WLAN_STATUS_CAPS_UNSUPPORTED 10
> -#define WLAN_STATUS_REASSOC_NO_ASSOC 11
> -#define WLAN_STATUS_ASSOC_DENIED_UNSPEC 12
> -#define WLAN_STATUS_NOT_SUPPORTED_AUTH_ALG 13
> -#define WLAN_STATUS_UNKNOWN_AUTH_TRANSACTION 14
> -#define WLAN_STATUS_CHALLENGE_FAIL 15
> -#define WLAN_STATUS_AUTH_TIMEOUT 16
> -#define WLAN_STATUS_AP_UNABLE_TO_HANDLE_NEW_STA 17
> -#define WLAN_STATUS_ASSOC_DENIED_RATES 18 */
> -
>  /* entended */
>  /* IEEE 802.11b */
>  #define WLAN_STATUS_ASSOC_DENIED_NOSHORT 19
> @@ -552,16 +512,6 @@ static inline int IsFrameTypeCtrl(unsigned char *pframe)
>  #define _IEEE8021X_MGT_                        1       /*  WPA */
>  #define _IEEE8021X_PSK_                        2       /*  WPA with pre-shared key */
>
> -/*
> -#define _NO_PRIVACY_                   0
> -#define _WEP_40_PRIVACY_               1
> -#define _TKIP_PRIVACY_                 2
> -#define _WRAP_PRIVACY_                 3
> -#define _CCMP_PRIVACY_                 4
> -#define _WEP_104_PRIVACY_              5
> -#define _WEP_WPA_MIXED_PRIVACY_ 6      WEP + WPA
> -*/
> -
>  /*-----------------------------------------------------------------------------
>                                 Below is the definition for WMM
>  ------------------------------------------------------------------------------*/
> --
> 2.33.0
>

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
