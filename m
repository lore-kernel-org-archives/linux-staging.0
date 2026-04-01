Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D724D32F740
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 08:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775031770; cv=none; b=unR8qO5+5ge7+HS+0T5q66sTlGm/G21fKSai9Nnw4vbpXiP143dP3EheCC7BbFqzvinP166aW0rlqNXXYFsfiNhhbWKMpEP6hQEziuHUNgXupjG5K5bkS8xC9weIUP1/kiz29ZxDL65hPR7mbjAffWXmXlK9+sZUER/4aMUGLkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775031770; c=relaxed/simple;
	bh=/0Z4629UDCRZzp8fP8YfqTrCpAyr5k2fwDgdkTCD4iQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SDapEtug8m4rFuPkRWndyaAo7Elre2K9KXVTBIvnV0sjiZ9RuQkylaDnsOOHMSihGonU54a+bLHAsytgT25wtBWSzamJJ6cHXfufu139MgfCdEc2eFLGyxjcbLw8xGe9+2aqguCZs7Y0BA2iF8XZpVQze0fQkeecn7aavZ/I8N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z89P/QFQ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z89P/QFQ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4887ca8e529so5091795e9.0
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 01:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775031767; x=1775636567; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gSyVu73k15K4ml9gVK1g7V87e0OK2hkfqrNu8j6gtks=;
        b=Z89P/QFQOvTIER+kjL+bF2QNZK5Sk/6ekV2a06NYBP2a4ADHNqGVcPEJQiZFh0PRCe
         6sVri6GvNhsr8hu8Bn/reJ7ItknwXjYqChTImfU4x5jKrvYMP5g0DaAh1LtBesReNRxI
         oyc6mRRUsJ+tUSJfog0J3SKKSknGTFgFDCRMYnZaiT9DJes+Uy30SjWsG7IZOlypecco
         d+VxTatgNEMXdNiS1VZBLYMnspx+19TNTiYlMAKSV6d9Hj/o3zXzOYb7oktg1bBoW0zi
         hW96Rtm8hV2vwbtr13YEHoaYjvFlhUaASKRXcqy9ZSy9G786zcNUxhon8FMhgWuWHg+G
         sQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775031767; x=1775636567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gSyVu73k15K4ml9gVK1g7V87e0OK2hkfqrNu8j6gtks=;
        b=LmeRuB1RJA0paCQbO6poP9jVrlslqLp4Dz2OeSJYRZpDLaqsRzknNvN33P61qA3AjQ
         CIYf0dzN4H52GYB08sjfSpzB9Q6weHNPm/jnSofTf11eESGV1Y7LeskmhkqtcMPsblBE
         SeSIzv99JxZBg3LNNt0jyuEOtrfuAGNIEP7+uu+gHWAFwpMxRKGgA/Rp2plyuPRchnSn
         OEZLXkCT/o7rXARxPrKj+gojV8EutQfT2uxgT/LFMY0NK0WWAquzdpxrUs6QQZkEkRsa
         sKNQzE8UXWS9CF9NlZ49CyGgFjaLBVbImo9DiGj3tvOTpXp7HewKuPH9vSbmR+JQ3wcA
         FNUg==
X-Forwarded-Encrypted: i=1; AJvYcCU3ALAbYICFdFi6qdtoyx0B8YdQ/yx+sg5M+huk0tIoR/pkPolBP1eMC8E0Bi+s5prwD+4N9+qZmozEZBea@lists.linux.dev
X-Gm-Message-State: AOJu0YzITlXWeExNQMs+K4jiyD1ZAlD/jsVEKaycVHrWRdO1OCkJFn62
	IAy57wmGFE8CVXY3WKBEriA3syjtIUUJJycC1IVAcYkfbeM3eznjBJSy
X-Gm-Gg: ATEYQzzVaYbIuqqSgIIdnsrAddMYoVdlCcAmx9HnnlUhqn/iZdoIMBHrYJtQw3KTs3f
	b1QmeHGJzkdODxU76IkXpf0GaVMHbMC0UO4sg2mu1NhsuYy2K4j+5/qsGbmKcmNOYVLDc57BqC0
	HIhouez4R/ns/6A9bP4T9h87LYai4EwyXMGDkOOs5EPC58YhMGm+31k4/AC+ITmfg8Dxkl24WFp
	EKzo9l+X/cuRF2OZmdutyGJF2JLQ+2SuEMwatyufYUFld4YvWqpKFM/WHuTLrJd1cLQsC2ogjlM
	Lo/ORZgIopxODf4Vlc18vOZaH530hUPbt18FmQCtVDM2W+I2WEKE4vAbwzWnaRsbjSCwCgk03W+
	CnspNzFmq6CQfvBWVvJgxp3mU2Mk8RhS5kZ8bAp7UuAuO0Y8LOlt7LfyqzSVPkhLTOUN5TusF+3
	eBRk1gjg+eMEm8a/eZGPo=
X-Received: by 2002:a05:600c:c059:20b0:486:fc4c:db72 with SMTP id 5b1f17b1804b1-4887828130fmr92023355e9.8.1775031766890;
        Wed, 01 Apr 2026 01:22:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf257b72dsm34314569f8f.34.2026.04.01.01.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 01:22:46 -0700 (PDT)
Date: Wed, 1 Apr 2026 11:22:43 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andrei Khomenkov <khomenkov@mailbox.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Luka Gejak <luka.gejak@linux.dev>, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 2/2] staging: rtl8723bs: cleanup code style and
 parentheses
Message-ID: <aczV0_IOAzbwIgHI@stanley.mountain>
References: <20260330184640.17795-1-khomenkov@mailbox.org>
 <20260330184640.17795-3-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330184640.17795-3-khomenkov@mailbox.org>

On Mon, Mar 30, 2026 at 09:46:39PM +0300, Andrei Khomenkov wrote:
> Cleanup the driver code to better match the kernel coding style.
> This patch includes:
>  - Removal of redundant parentheses in if-statements and expressions.
>  - Adding missing spaces around bitwise and logical operators.
>  - Reformatting multi-line conditions for better readability.
>  - Reformatting long conditions for better readability.
> 
> These changes are purely cosmetic and do not alter the driver logic.
> 
> Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
> ---
>  drivers/staging/rtl8723bs/core/rtw_btcoex.c   |  4 +--
>  .../staging/rtl8723bs/core/rtw_ieee80211.c    |  2 +-
>  .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  8 ++---
>  drivers/staging/rtl8723bs/core/rtw_mlme.c     |  6 ++--
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  4 +--
>  drivers/staging/rtl8723bs/core/rtw_recv.c     | 34 +++++++++----------
>  .../staging/rtl8723bs/core/rtw_wlan_util.c    |  2 +-
>  drivers/staging/rtl8723bs/core/rtw_xmit.c     | 23 +++++++------
>  drivers/staging/rtl8723bs/hal/odm.c           |  2 +-
>  drivers/staging/rtl8723bs/hal/odm_DIG.c       | 16 ++++-----
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  5 +--
>  drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  6 ++--
>  .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  9 ++---
>  drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 11 +++---
>  14 files changed, 64 insertions(+), 68 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
> index 9a7acabef409..f09510048b93 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
> @@ -10,8 +10,8 @@
>  
>  void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 media_status)
>  {
> -	if ((media_status == RT_MEDIA_CONNECT)

These parentheses, on the other hand, you should leave because
Greg is fine or even prefers parentheses around "(foo == bar)".
So when you're converting "(foo == false) ||" to "!foo ||" then
drop the parentheses.  In that situation the parens were because
of the == and then when you remove the == you need to remove the
parens as well.  But here the == is in the final condition so keep
the parens.

> -		&& (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE))) {
> +	if (media_status == RT_MEDIA_CONNECT &&
> +	    check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE)) {
>  		rtw_hal_set_hwreg(padapter, HW_VAR_DL_RSVD_PAGE, NULL);
>  	}
>  

regards,
dan carpenter

