Received: from forward500d.mail.yandex.net (forward500d.mail.yandex.net [178.154.239.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7272434E75C
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 05:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779342319; cv=none; b=oG0DeihTgJRIMKn2Dg1hExr16N2fMW808RWBUP3YqoY6AcVfyPFjSsRYfShdSdDnCfxMt5ndmw8P4ko44DrT3W6FIZW1zOO0sT/oIn7fsCmZpIxtXMYOUFB9lGRmQNOq98J2rbQlI6aLY2Gp8euk/57/KRh6HztlM5NQxwpcZ3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779342319; c=relaxed/simple;
	bh=+miBJBX3jt1lkPQeUyjDtT2Tck1GLXjpFq7DFLF+QKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BFEu0tENaKm9+zmNYyWTyreUF3YUTq/5b1dEhhz8sXuBJzLnJ1fyCyOh+oNEFSI4RtT3tzmwmtmZjMO32/r0othg55h+0IEzRX41XrSBaLfwVbOVg1U3g14Qim0OuZV5G/bvmgJvyvTYQLJy2SWZL0SHwx7ps372v8udZ9RvQzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net; spf=pass smtp.mailfrom=sezginduran.net; dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b=kja4Ny1a; arc=none smtp.client-ip=178.154.239.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sezginduran.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sezginduran.net header.i=@sezginduran.net header.b="kja4Ny1a"
Received: from mail-nwsmtp-smtp-production-main-95.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-95.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:2a21:0:640:9c41:0])
	by forward500d.mail.yandex.net (Yandex) with ESMTPS id A4C88827E3;
	Thu, 21 May 2026 08:39:57 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-95.klg.yp-c.yandex.net (smtp) with ESMTPSA id rdLfVFGR2qM0-x6fGAYsV;
	Thu, 21 May 2026 08:39:56 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sezginduran.net;
	s=mail; t=1779341997;
	bh=CxyHJwO4fAhJn5uepluxn8jHO48b5omtP5401VdIGeg=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=kja4Ny1apd5b41kiCSuEryyODmVGUUotDsY4RBw1u99EpZ6ksdwyhfX258J/ESCOG
	 Qb7LtiV2D8cXMRy4/8sfwmNhieNcbbsFHTR32dT9RPnEmM5fhWRL4Dh2uvHe822aMF
	 OGRhRcmKwKwOAELFHrc3iEMJAEArQtmV+Z6rtcSM=
Authentication-Results: mail-nwsmtp-smtp-production-main-95.klg.yp-c.yandex.net; dkim=pass header.i=@sezginduran.net
Message-ID: <7380c354-1281-4bd3-9305-9e828d4a2cad@sezginduran.net>
Date: Thu, 21 May 2026 08:39:53 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10] staging: rtl8723bs: remove unnecessary braces in
 rtw_mlme.c
To: Ashwin Gundarapu <linuxuser509@zohomail.in>,
 gregkh <gregkh@linuxfoundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 linux-staging <linux-staging@lists.linux.dev>
References: <19e490038be.2220747069631.5983756933086873911@zohomail.in>
Content-Language: tr
From: Ahmet Sezgin Duran <ahmet@sezginduran.net>
In-Reply-To: <19e490038be.2220747069631.5983756933086873911@zohomail.in>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/21/26 8:26 AM, Ashwin Gundarapu wrote:
> From: Ashwin Gundarapu <linuxuser509@zohomail.in>
> Date: Tue, 12 May 2026 17:54:37 +0530
> Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces in rtw_mlme.c

This part is not supposed to be in the email. Better to use `git 
send-email` for sending patches.

> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> index 3d88a3a185d5..22776af126ca 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
> @@ -483,7 +483,6 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
>   			break;
>   		}
>   
> -
>   		if (rtw_roam_flags(adapter))
>   			/* TODO: don't select network in the same ess as oldest if it's new enough*/
>   

Commit message is about removing braces, but actual commit is not. You 
need to be consistent here.

Regards,
Ahmet Sezgin Duran
