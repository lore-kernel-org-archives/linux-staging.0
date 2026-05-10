Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0543B19A8
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 16:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778431489; cv=none; b=p8sexmDFjkUfZFM/6n2nENadf7zklANTh4MKCD+VtVU3XXOTox7G1D8iDU4ONw2YL0Ap97WLJUqXGkM1wbOixz2c9nD0mx0EReu8zc/RHTPiAbtNfuAElFNZ5VBQCur3SyIOGhCzPSJ2K9DbcDIIF9BgBGxYk5pusRD8oTrctNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778431489; c=relaxed/simple;
	bh=dYKrQF+N1v3Cd5HeGNllxMa2wQM2dx0edgGP8ZKA30o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NVx2N3rdACjUGjYLiYvQLgoq1yIzxmgvaDiSOHV9LIyzFLdKPejonnrfQJha0/nBG1Nz9S+E8admS+hUlvtXJsRCoFnb5l029TKE8LLSRIDt2z0FxWI7p1+47dm4HaP5J89xd6Ac0enymGG9yLTFu5q74/TD3zh97zQu5A+oVb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKoqdLJe; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKoqdLJe"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a860667fabso3213923e87.0
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 09:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778431486; x=1779036286; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jDQWQwFu24zmOpbWnzIvl08SCzutEyqQDeQc7huu9hg=;
        b=AKoqdLJenPD20kk5jBUBlImtvYV0Sro9jbu2DUjHzATZM7DAnNNpTgjx5y8p0ockhG
         22S1RWWvKupweDuVFRtv5kNBVTDkKHkbCFXF1nFkH3UuqaKj7dS+jl7INxjIF8jkOgpg
         LGdKGUFYXgOntssspkPsLDFJjS8Hid2KZvr2uqFws7slQlq+wxBmo8tGuULuYKuqZ3F7
         d2izU/YUXKw8YINsQQFNmhZvRfA6EmW3gdnf8DrfRU22fhpNwRo1igiQ6C+mY44JN55M
         3xHWFW+7dTt/YQ98i5L+SGRqPC3Dk0zJ7yVRA4fTprmQc9hPnV2UwG0pen/XIE1fqrQq
         yuZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778431486; x=1779036286;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jDQWQwFu24zmOpbWnzIvl08SCzutEyqQDeQc7huu9hg=;
        b=kmlgQutVvFaVh7R+9o03WUNphAri7x4nFe13m3FwU2Y1rjDMopqSSyR/upJdZgRHs8
         XuUySnV/LWrTjP1yFW8fRuugBVwbh5xMzSBV1ZovF5JE0wGPUxvrbROkYIGD97VBexU4
         8SojE4Ii4IvFmnxAoPwyeugoT+LpEDuSrqFM98zEgQpleByEUHwG/9EMFODraiORLy73
         j6N9ragOa9dQvGAdACggYgg++v6pRGuD6YpXg6PSzVJZEEGXxVoBC/LsO15KFBjRf1X6
         XPsqsggFlcFDYAtv4TZmGz0mPnZ8WIR1kycfZRpHZxCaZcM692YTCzuIYYtSEJKyDEoA
         Iiwg==
X-Forwarded-Encrypted: i=1; AFNElJ9JUWsk5tIqEI6/z9k1/zx4dPtTAoYY3HHmy8sbf5BrkLkl6246kkrhBYWEiixpmMMRTVakrmVqE+zy7ndl@lists.linux.dev
X-Gm-Message-State: AOJu0YxOVVP8y0MGJs8V+fQz4MYivmfUWm+LDg9hzPZlNXnt/iZO1Ooc
	nzQRFuns4jUt+UIEfGSzpEQTFsg/fUCk0Dw0BJEH2xScg6HsALNVeGR7
X-Gm-Gg: Acq92OE0vmUqNOzLS8SjDXyvuhmfbPmX6cDpZxhLXZc5eTkZS+bGC2A7v7fv8Heyo/V
	gjBoeHK0jrmOqn1C7A5xERgZbLT+VfHRxqoIu3INNn79ElPQa3fJPay/kphWZlwA/nSQ3Tid+gN
	axLsAoyk7UktjveNMBwkQOoIOCdwdZJUyXobnE6zafAx+JGZXx8ngiV2PITpAZHFjh3+ZA8/RTY
	XVvqQVzO5mUDbC5MKnStJAVapPo23nt2w9GlyPa+l/D62FILH0Sr9ppIiLdFrqeKBT0NqSndwus
	CfaJqPuAUbHlE1b5ljBJT428fBZmfcw6/LsHzlwfKZKChYBQp9tc4o9PRIeJpuF9MsvzoGsAQra
	LlRs3FQlxnMgcM7TaICgZ+NjtfQNV2YmuHvGONngnFUpUiTWrjJ2mOiThvHOnlvoEG+tHu5jKEa
	Uvw1dh30iKj6a3Zc/AYNJhhwjE
X-Received: by 2002:a05:6512:3d9e:b0:5a2:bedb:2119 with SMTP id 2adb3069b0e04-5a8a94bc40fmr3949752e87.26.1778431485491;
        Sun, 10 May 2026 09:44:45 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f18f13sm18646101fa.1.2026.05.10.09.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 09:44:45 -0700 (PDT)
Date: Sun, 10 May 2026 19:44:42 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Pramod Maurya <pramod.nexgen@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	Bryant Boatright <bryant.boatright@proton.me>
Subject: Re: [PATCH] staging: rtl8723bs: Fix coding style in ieee80211.h
Message-ID: <agC1-rqon7nRUdvM@archlinux>
References: <20260510110228.96612-1-pramod.nexgen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260510110228.96612-1-pramod.nexgen@gmail.com>

On Sun, May 10, 2026 at 07:02:24AM -0400, Pramod Maurya wrote:
> Fix the following coding style issues:
> - Replace __attribute__((packed)) with __packed
> - Fix comparisons to place constants on the right side
> - Fix block comment style: move trailing */ to its own line
> - Add * on subsequent lines in block comments
> - Enclose CHAN_ARG macro value in parentheses
> - Wrap long IS_CCK_RATE and IS_OFDM_RATE macro lines

You're making too many different logical changes in one patch.
Please, one patch per change.

And how did you get such a Cc: list?


Thanks,
Nikolay



> 
> Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
> ---
>  drivers/staging/rtl8723bs/include/ieee80211.h | 60 ++++++++++---------
>  1 file changed, 31 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
> index fbb12fe31a6c..739d3f142ce2 100644
> --- a/drivers/staging/rtl8723bs/include/ieee80211.h
> +++ b/drivers/staging/rtl8723bs/include/ieee80211.h
> @@ -231,7 +231,7 @@ struct eapol {
>  	u8 version;
>  	u8 type;
>  	u16 length;
> -} __attribute__ ((packed));
> +} __packed;
>  
>  #define IEEE80211_FCS_LEN    4
>  
> @@ -274,7 +274,7 @@ struct ieee80211_snap_hdr {
>  	u8    ssap;   /* always 0xAA */
>  	u8    ctrl;   /* always 0x03 */
>  	u8    oui[P80211_OUI_LEN];    /* organizational universal id */
> -} __attribute__ ((packed));
> +} __packed;
>  
>  #define SNAP_SIZE sizeof(struct ieee80211_snap_hdr)
>  
> @@ -394,18 +394,22 @@ enum {
>  };
>  
>  #define IS_HT_RATE(_rate)				(_rate >= MGN_MCS0 && _rate <= MGN_MCS31)
> -#define IS_CCK_RATE(_rate)				(MGN_1M == _rate || _rate == MGN_2M || _rate == MGN_5_5M || _rate == MGN_11M)
> -#define IS_OFDM_RATE(_rate)				(MGN_6M <= _rate && _rate <= MGN_54M  && _rate != MGN_11M)
> +#define IS_CCK_RATE(_rate)				\
> +	(_rate == MGN_1M || _rate == MGN_2M || _rate == MGN_5_5M || _rate == MGN_11M)
> +#define IS_OFDM_RATE(_rate)				\
> +	(_rate >= MGN_6M && _rate <= MGN_54M && _rate != MGN_11M)
>  
>  
>  /* NOTE: This data is for statistical purposes; not all hardware provides this
>   *       information for frames received.  Not setting these will not cause
> - *       any adverse affects. */
> + *       any adverse affects.
> + */
>  
>  /* IEEE 802.11 requires that STA supports concurrent reception of at least
>   * three fragmented frames. This define can be increased to support more
>   * concurrent frames, but it should be noted that each entry can consume about
> - * 2 kB of RAM and increasing cache size will slow down frame reassembly. */
> + * 2 kB of RAM and increasing cache size will slow down frame reassembly.
> + */
>  #define IEEE80211_FRAG_CACHE_LEN 4
>  
>  #define SEC_KEY_1         (1<<0)
> @@ -431,19 +435,17 @@ enum {
>  #define BIP_AAD_SIZE  20
>  
>  /*
> -
> - 802.11 data frame from AP
> -
> -      ,-------------------------------------------------------------------.
> -Bytes |  2   |  2   |    6    |    6    |    6    |  2   | 0..2312 |   4  |
> -      |------|------|---------|---------|---------|------|---------|------|
> -Desc. | ctrl | dura |  DA/RA  |   TA    |    SA   | Sequ |  frame  |  fcs |
> -      |      | tion | (BSSID) |         |         | ence |  data   |      |
> -      `-------------------------------------------------------------------'
> -
> -Total: 28-2340 bytes
> -
> -*/
> + * 802.11 data frame from AP
> + *
> + *      ,-------------------------------------------------------------------.
> + * Bytes |  2   |  2   |    6    |    6    |    6    |  2   | 0..2312 |   4  |
> + *       |------|------|---------|---------|---------|------|---------|------|
> + * Desc. | ctrl | dura |  DA/RA  |   TA    |    SA   | Sequ |  frame  |  fcs |
> + *       |      | tion | (BSSID) |         |         | ence |  data   |      |
> + *       `-------------------------------------------------------------------'
> + *
> + * Total: 28-2340 bytes
> + */
>  
>  #define BEACON_PROBE_SSID_ID_POSITION 12
>  
> @@ -467,7 +469,8 @@ Total: 28-2340 bytes
>  /* MAX_RATES_LENGTH needs to be 12.  The spec says 8, and many APs
>   * only use 8, and then use extended rates for the remaining supported
>   * rates.  Other APs, however, stick all of their supported rates on the
> - * main rates information element... */
> + * main rates information element...
> + */
>  #define MAX_RATES_LENGTH                  ((u8)12)
>  #define MAX_RATES_EX_LENGTH               ((u8)16)
>  #define MAX_NETWORK_COUNT                  128
> @@ -497,11 +500,11 @@ Total: 28-2340 bytes
>  #define IEEE80211_PS_MBCAST IEEE80211_DTIM_MBCAST
>  #define IW_ESSID_MAX_SIZE 32
>  /*
> -join_res:
> --1: authentication fail
> --2: association fail
> -> 0: TID
> -*/
> + * join_res:
> + * -1: authentication fail
> + * -2: association fail
> + * > 0: TID
> + */
>  
>  #define DEFAULT_MAX_SCAN_AGE (15 * HZ)
>  #define DEFAULT_FTS 2346
> @@ -555,8 +558,7 @@ enum {
>  	ACT_PUBLIC_MAX
>  };
>  
> -#define OUI_MICROSOFT 0x0050f2 /* Microsoft (also used in Wi-Fi specs)
> -				* 00:50:F2 */
> +#define OUI_MICROSOFT 0x0050f2 /* Microsoft (also used in Wi-Fi specs); 00:50:F2 */
>  #define WME_OUI_TYPE 2
>  #define WME_OUI_SUBTYPE_INFORMATION_ELEMENT 0
>  #define WME_OUI_SUBTYPE_PARAMETER_ELEMENT 1
> @@ -637,7 +639,7 @@ struct rtw_ieee80211_channel {
>  	/*"orig_mpwr:%d\n"*/
>  
>  #define CHAN_ARG(channel) \
> -	/*(channel)->band*/ \
> +	(/*(channel)->band*/ \
>  	/*, (channel)->center_freq*/ \
>  	(channel)->hw_value \
>  	, (channel)->flags \
> @@ -647,7 +649,7 @@ struct rtw_ieee80211_channel {
>  	/*, (channel)->beacon_found*/ \
>  	/*, (channel)->orig_flags*/ \
>  	/*, (channel)->orig_mag*/ \
> -	/*, (channel)->orig_mpwr*/ \
> +	/*, (channel)->orig_mpwr*/)
>  
>  /* Parsed Information Elements */
>  struct rtw_ieee802_11_elems {
> -- 
> 2.52.0
> 
