Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=93.77.172.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792672308;
	b=AxhZgcuxsvj7aQsWACQ0BKTpbwFi4fFcGtlaR4doMre3aOz8zJGLhx0EiqOV8P+ecijH
	 GZ0Y5TWvm3UeBtg98BNJY3OGZDvmNAQ+cRFDCoM73/SqzC/DE2aX4LC60cdkIjyHiJ9tS
	 gq/jShL3UgArcdhrtYMMUzs1XTvnQVZBIStRsF9dXpJ1mCN8y+NHi84F+KqXW5IgLv7mq
	 Xy/jRLhWTXOW0KUPtpcbA4w504FgqD4LiKfVRif40Vp/be+Xxa9WvrZxIRmF36Kf5nuJm
	 vIvTKD0pwiTXZoBBrMtlyliiSRTzuyxbfRdYeobupLxOjocMHpazcHlcC0vu4R2C0sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792672308;
	h=DMARC-Filter:Received:Received:X-Yandex-Fwd:DKIM-Signature:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=q3ZydI37OZ1HttKtAROplMoe1pmYAu4UxWQIezUQ4ds=;
	b=JNs+U85FnfbbnDKCXCoWXio/6dMN9yEBxooGsAqPPhKtKdYmTX+kL55b4+cOOSJ6ce/T
	 /rH9LnuywuuRoWHhOOuaxnbidUhg+UQF4HLWLUTbZ2ZfFqXUXi0uzNKyKCzCHPy+0/Yb7
	 fUeVl+h5YfTU/EOVYDol4yp7lZ15g+ma5bpnr804H05byQWRZMGS4kf7Zu18im/w6DIA8
	 A7amdBZe9EVPYDi1nBnbj/Vblw40R5k25icQL4fGzNEZq0bPW/PxTuBH0p4gyTniouTAD
	 E7YPS78D/enC2CstzDe0YZsVPKX564ThS/gYMED3T12svlCpZnfP/qGWGEpH5WI5skQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sezginduran.net;
	spf=pass smtp.mailfrom=sezginduran.net;
	arc=none smtp.remote-ip=93.77.172.89
Received: from forward504e.mail.yandex.net (forward504e.mail.yandex.net [93.77.172.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5779E606A32A
	for <linux-staging@lists.linux.dev>; Thu, 22 Oct 2026 12:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5779E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Received: from mail-nwsmtp-smtp-production-main-64.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-64.yp-c.yandex.net)
	by forward504e.mail.yandex.net (postfix) with ESMTPS id 4280BC0297;
	Thu, 22 Oct 2026 15:31:37 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-64 with ESMTPSA id XVbdv29gRKo0-p52WTBnr;
	Thu, 22 Oct 2026 15:31:36 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1792672296;
	bh=q3ZydI37OZ1HttKtAROplMoe1pmYAu4UxWQIezUQ4ds=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=oC1uG78peWml1zjKElT5ZbosVOTtZavm/eI0u1yAOxdsxXxX26SVdkFnqpW5eB9l0
	 rwq5X4kG6y/Lwd17sfJ9CvjswmgZHLTadjI/yLFS7ozUdFhBSXZlN+lS+sLe4Y17xM
	 HL+IA+bKyCnqsW9Ej1HzcGl9UHbMIhlCZPoM0I9s=
Authentication-Results: mail-nwsmtp-smtp-production-main-64; dkim=pass header.i=@sezginduran.net
Message-ID: <2fd90a2c-a2ab-41ab-bcd1-02831b4e01ca@sezginduran.net>
Date: Thu, 22 Oct 2026 15:31:32 +0300
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8723bs: rename
 rtw_setstaKey_cmdrsp_callback()
To: Linus Probert <linus.probert@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261022122234.443631-1-linus.probert@gmail.com>
Content-Language: tr
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
In-Reply-To: <20261022122234.443631-1-linus.probert@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 3:22 PM, Linus Probert wrote:
> Renames rtw_setstaKey_cmdrsp_callback to rtw_setstakey_cmdrsp_callback
> in order to conform to kernel code style.
> 
> Found using checkpatch.pl
> 
> Signed-off-by: Linus Probert <linus.probert@gmail.com>
> ---
>   drivers/staging/rtl8723bs/core/rtw_cmd.c    | 4 ++--
>   drivers/staging/rtl8723bs/include/rtw_cmd.h | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> index 9fc62cb1ae01..81aef5ffe685 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
> @@ -34,7 +34,7 @@ static struct _cmd_callback rtw_cmd_callback[] = {
>   	{SET_AUTH_CMD, NULL},
>   
>   	{SET_KEY_CMD, NULL},	/*20*/
> -	{SET_STA_KEY_CMD, &rtw_setstaKey_cmdrsp_callback},
> +	{SET_STA_KEY_CMD, &rtw_setstakey_cmdrsp_callback},
>   	{SET_ASSOC_STA_CMD, &rtw_setassocsta_cmdrsp_callback},
>   	{DEL_ASSOC_STA_CMD, NULL},
>   	{SET_STA_PWR_STATE_CMD, NULL},
> @@ -1876,7 +1876,7 @@ void rtw_createbss_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
>   	rtw_free_cmd_obj(pcmd);
>   }
>   
> -void rtw_setstaKey_cmdrsp_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
> +void rtw_setstakey_cmdrsp_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
>   {
>   	struct sta_priv *pstapriv = &padapter->stapriv;
>   	struct set_stakey_rsp *psetstakey_rsp = (struct set_stakey_rsp *)(pcmd->rsp);
> diff --git a/drivers/staging/rtl8723bs/include/rtw_cmd.h b/drivers/staging/rtl8723bs/include/rtw_cmd.h
> index 75a774f8c4f3..9b801a61b69b 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_cmd.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_cmd.h
> @@ -593,7 +593,7 @@ void rtw_joinbss_cmd_callback(struct adapter  *padapter, struct cmd_obj *pcmd);
>   void rtw_createbss_cmd_callback(struct adapter  *padapter, struct cmd_obj *pcmd);
>   void rtw_getbbrfreg_cmdrsp_callback(struct adapter  *padapter, struct cmd_obj *pcmd);
>   
> -void rtw_setstaKey_cmdrsp_callback(struct adapter  *padapter,  struct cmd_obj *pcmd);
> +void rtw_setstakey_cmdrsp_callback(struct adapter  *padapter,  struct cmd_obj *pcmd);
>   void rtw_setassocsta_cmdrsp_callback(struct adapter  *padapter,  struct cmd_obj *pcmd);
>   void rtw_getrttbl_cmdrsp_callback(struct adapter  *padapter,  struct cmd_obj *pcmd);
>   

This driver is going to be deleted in the next release, have a look:

https://lore.kernel.org/linux-staging/7e53bd59b7b146caabebeca4347674c7@realtek.com/

Regards,
Ahmet Sezgin Duran
