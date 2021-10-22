Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED80772
	for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 17:52:36 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id g62-20020a9d2dc4000000b0054752cfbc59so5355721otb.1
        for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 10:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9vRoK9NkDaSIDvw/bJU45bxhOuhdHLOM+rxxkRdX9bg=;
        b=hykyvAVzLMHeyTkdLudPSVmsn69bZf3bAmyw69b0Zd/6Ajk0v5YzjT57QyODaDscc+
         bT26vtWej1qk6z7CvD1v+xpRtEHLmasJRcHNLWwIl9VUVRUuBKHRh7JNq03DUqlEanaN
         l8ANQXybBpnJfGU1vhzQWy8YSQgzGbXrLLbF3cTgu9aq+wB9ouud88r2lMr5K0KxNPP2
         ZGTOlUPVjZhYIvPFiYnopmPoUtUOeXKHIQ0BZPrz73QNv6KJ3HZeiYwMKoZBx1UQtddF
         0IN/ociWhrkdNTyYpB107hR2vAcouirqmtDoj1cdpClOBBathmjUyUoG4YHuLFyc0lI+
         ntOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9vRoK9NkDaSIDvw/bJU45bxhOuhdHLOM+rxxkRdX9bg=;
        b=MkiDOk261tn/ljjRTaNxTH7NMWykOBq1YNCZphnlKR2R4U9Es06Ypu2ZKAkw2zsNRI
         9zcQW6AfjpSVym7GMx3MWxoEJMfUDolJmjDqws/pm4z8cm7osRDpaykxKzbD73ti+KKy
         LVF9yQlTA8qUZpGATg/eD6qc4+uUOEXLOzrpIpL/G3XVxK5Zu+2cawHlunrVxVT0ehLw
         sORgjUaeZpcXqxLhzx/LMBG3GpYOIZGAhm7ERRLG2dFJ38B0hQhHB3w4nJ3Q2+HtP6Dn
         sKd6kQ7ER35omFDo5wDPkmppHdW+a2iFTY33xotWKMQt3krKMVgBujLF1M7Wl3xH+ERu
         0HWA==
X-Gm-Message-State: AOAM531FjMstlwYxxdxU9KVdHFk5F1OHMTSRTsXjMN7MbSis3Oo8Noje
	YY92C1Ex1vpN9HAZHR6uUXc=
X-Google-Smtp-Source: ABdhPJyHkkESposILbSCliuNV7iNvg11W4nD+u+AelReARLoAeDeu6FXHtF17BBqmTujq+Omv0jiBA==
X-Received: by 2002:a05:6830:4426:: with SMTP id q38mr1048193otv.303.1634925156046;
        Fri, 22 Oct 2021 10:52:36 -0700 (PDT)
Received: from ?IPV6:2603:8090:2005:39b3::101e? (2603-8090-2005-39b3-0000-0000-0000-101e.res6.spectrum.com. [2603:8090:2005:39b3::101e])
        by smtp.gmail.com with ESMTPSA id w141sm1980640oif.20.2021.10.22.10.52.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Oct 2021 10:52:35 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Message-ID: <0e327ca3-7caa-e904-c3f7-45ae28dea367@lwfinger.net>
Date: Fri, 22 Oct 2021 12:52:33 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] staging: r8188eu: Use a Mutex instead of a binary
 Semaphore
Content-Language: en-US
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Phillip Potter <phil@philpotter.co.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20211022171917.24363-1-fmdefrancesco@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
In-Reply-To: <20211022171917.24363-1-fmdefrancesco@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/21 12:19, Fabio M. De Francesco wrote:
> Use a Mutex instead of a binary Semaphore for the purpose of enforcing
> mutual exclusive access to the "pwrctrl_priv" structure.
> 
> Mutexes are sleeping locks similar to Semaphores with a 'count' of one
> (like binary Semaphores), however they have a simpler interface, more
> efficient performance, and additional constraints.
> 
> There is no change in the logic of the new code; however it is more
> simple because it gets rid of four unnecessary wrappers:
> _init_pwrlock(), _enter_pwrlock(),_exit_pwrlock(), _rtw_down_sema().
> 
> Actually, there is a change in the state in which the code waits for
> acquiring locks, because it makes it in an uninterruptible state
> (instead the old code used down_interruptibe()). Interruptible
> waits are neither required nor wanted in this driver.
> 
> Tested with ASUSTek Computer, Inc. Realtek 8188EUS [USB-N10 Nano].
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Well done.

Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

> ---
>   drivers/staging/r8188eu/core/rtw_pwrctrl.c      | 10 +++++-----
>   drivers/staging/r8188eu/include/osdep_service.h |  2 --
>   drivers/staging/r8188eu/include/rtw_pwrctrl.h   | 17 +----------------
>   drivers/staging/r8188eu/os_dep/osdep_service.c  |  8 --------
>   drivers/staging/r8188eu/os_dep/usb_intf.c       |  8 ++++----
>   5 files changed, 10 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
> index 19cac5814ea4..5d595cf2a47e 100644
> --- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
> +++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
> @@ -21,7 +21,7 @@ void ips_enter(struct adapter *padapter)
>   		return;
>   	}
>   
> -	_enter_pwrlock(&pwrpriv->lock);
> +	mutex_lock(&pwrpriv->lock);
>   
>   	pwrpriv->bips_processing = true;
>   
> @@ -42,7 +42,7 @@ void ips_enter(struct adapter *padapter)
>   	}
>   	pwrpriv->bips_processing = false;
>   
> -	_exit_pwrlock(&pwrpriv->lock);
> +	mutex_unlock(&pwrpriv->lock);
>   }
>   
>   int ips_leave(struct adapter *padapter)
> @@ -53,7 +53,7 @@ int ips_leave(struct adapter *padapter)
>   	int result = _SUCCESS;
>   	int keyid;
>   
> -	_enter_pwrlock(&pwrpriv->lock);
> +	mutex_lock(&pwrpriv->lock);
>   
>   	if ((pwrpriv->rf_pwrstate == rf_off) && (!pwrpriv->bips_processing)) {
>   		pwrpriv->bips_processing = true;
> @@ -87,7 +87,7 @@ int ips_leave(struct adapter *padapter)
>   		pwrpriv->bpower_saving = false;
>   	}
>   
> -	_exit_pwrlock(&pwrpriv->lock);
> +	mutex_unlock(&pwrpriv->lock);
>   
>   	return result;
>   }
> @@ -337,7 +337,7 @@ void rtw_init_pwrctrl_priv(struct adapter *padapter)
>   {
>   	struct pwrctrl_priv *pwrctrlpriv = &padapter->pwrctrlpriv;
>   
> -	_init_pwrlock(&pwrctrlpriv->lock);
> +	mutex_init(&pwrctrlpriv->lock);
>   	pwrctrlpriv->rf_pwrstate = rf_on;
>   	pwrctrlpriv->ips_enter_cnts = 0;
>   	pwrctrlpriv->ips_leave_cnts = 0;
> diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
> index 886a1b6f30b4..efab3a97eb46 100644
> --- a/drivers/staging/r8188eu/include/osdep_service.h
> +++ b/drivers/staging/r8188eu/include/osdep_service.h
> @@ -141,8 +141,6 @@ extern unsigned char RSN_TKIP_CIPHER[4];
>   
>   void *rtw_malloc2d(int h, int w, int size);
>   
> -u32  _rtw_down_sema(struct semaphore *sema);
> -
>   #define rtw_init_queue(q)					\
>   	do {							\
>   		INIT_LIST_HEAD(&((q)->queue));			\
> diff --git a/drivers/staging/r8188eu/include/rtw_pwrctrl.h b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
> index 04236e42fbf9..b19ef796ab54 100644
> --- a/drivers/staging/r8188eu/include/rtw_pwrctrl.h
> +++ b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
> @@ -27,21 +27,6 @@ enum power_mgnt {
>   	PS_MODE_NUM
>   };
>   
> -static inline void _init_pwrlock(struct semaphore  *plock)
> -{
> -	sema_init(plock, 1);
> -}
> -
> -static inline void _enter_pwrlock(struct semaphore  *plock)
> -{
> -	_rtw_down_sema(plock);
> -}
> -
> -static inline void _exit_pwrlock(struct semaphore  *plock)
> -{
> -	up(plock);
> -}
> -
>   #define LPS_DELAY_TIME	1*HZ /*  1 sec */
>   
>   /*  RF state. */
> @@ -60,7 +45,7 @@ enum { /*  for ips_mode */
>   };
>   
>   struct pwrctrl_priv {
> -	struct semaphore lock;
> +	struct mutex lock; /* Mutex used to protect struct pwrctrl_priv */
>   
>   	u8	pwr_mode;
>   	u8	smart_ps;
> diff --git a/drivers/staging/r8188eu/os_dep/osdep_service.c b/drivers/staging/r8188eu/os_dep/osdep_service.c
> index 6bee194fc35d..59bdd0abea7e 100644
> --- a/drivers/staging/r8188eu/os_dep/osdep_service.c
> +++ b/drivers/staging/r8188eu/os_dep/osdep_service.c
> @@ -42,14 +42,6 @@ Otherwise, there will be racing condition.
>   Caller must check if the list is empty before calling rtw_list_delete
>   */
>   
> -u32 _rtw_down_sema(struct semaphore *sema)
> -{
> -	if (down_interruptible(sema))
> -		return _FAIL;
> -	else
> -		return _SUCCESS;
> -}
> -
>   inline u32 rtw_systime_to_ms(u32 systime)
>   {
>   	return systime * 1000 / HZ;
> diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
> index 7ed9f5f54472..fc74c93272a8 100644
> --- a/drivers/staging/r8188eu/os_dep/usb_intf.c
> +++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
> @@ -233,7 +233,7 @@ static int rtw_suspend(struct usb_interface *pusb_intf, pm_message_t message)
>   	rtw_cancel_all_timer(padapter);
>   	LeaveAllPowerSaveMode(padapter);
>   
> -	_enter_pwrlock(&pwrpriv->lock);
> +	mutex_lock(&pwrpriv->lock);
>   	/* s1. */
>   	if (pnetdev) {
>   		netif_carrier_off(pnetdev);
> @@ -262,7 +262,7 @@ static int rtw_suspend(struct usb_interface *pusb_intf, pm_message_t message)
>   	rtw_free_network_queue(padapter, true);
>   
>   	rtw_dev_unload(padapter);
> -	_exit_pwrlock(&pwrpriv->lock);
> +	mutex_unlock(&pwrpriv->lock);
>   
>   	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY))
>   		rtw_indicate_scan_done(padapter, 1);
> @@ -291,7 +291,7 @@ static int rtw_resume(struct usb_interface *pusb_intf)
>   	pnetdev = padapter->pnetdev;
>   	pwrpriv = &padapter->pwrctrlpriv;
>   
> -	_enter_pwrlock(&pwrpriv->lock);
> +	mutex_lock(&pwrpriv->lock);
>   	rtw_reset_drv_sw(padapter);
>   	if (pwrpriv)
>   		pwrpriv->bkeepfwalive = false;
> @@ -303,7 +303,7 @@ static int rtw_resume(struct usb_interface *pusb_intf)
>   	netif_device_attach(pnetdev);
>   	netif_carrier_on(pnetdev);
>   
> -	_exit_pwrlock(&pwrpriv->lock);
> +	mutex_unlock(&pwrpriv->lock);
>   
>   	if (padapter->pid[1] != 0) {
>   		DBG_88E("pid[1]:%d\n", padapter->pid[1]);
> 

