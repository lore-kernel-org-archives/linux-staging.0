Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79A229BDBF
	for <linux-staging@lists.linux.dev>; Fri,  7 Aug 2026 16:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786120880; cv=none; b=B7atgBfWKylRkLg6KvTxYGJTIh494+B4aV35uCpYpQCaj9EOow7Qtm/sGvnndYy0uUG+0Qg9jVPYN1Qj9yr5VyrUwz5dMmlPxH++Km/+aEWOGSav8dTsZUXxFCmIwiJxNbjCdA/u5yWrBo8lxpcAq2/GyYjQUs76LgPJMNXq2Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786120880; c=relaxed/simple;
	bh=5dIqpadMbEk+y91y1iRNf6AuBQ+eubdCVgyrzqMMx7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gJbicbP10uLCc7yHKxA7SKWRLpber1nTIHnLOyz8nc0n8hfoPOfmURgTHygTSgQoXSfUbJi5+a5a/cXnFAkl3tXmiAyZCv5dzd6jjsGf3Uv7uRU0TKtHeER9Pw5naNO/3rKwS3IR0S/MC58dsL51AqkroPKHSLaLnI6lY6cWzCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gHhFdN5G; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gHhFdN5G"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b0f19bea2fso3693869e87.1
        for <linux-staging@lists.linux.dev>; Fri, 07 Aug 2026 09:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786120877; x=1786725677; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RDWNsbn8AaiOnT73If9FoLX/GoxxLjSClflI4U9QaJA=;
        b=gHhFdN5GQ/2bCVY6/8DACwBu25YtGqIdoeW5xGdj7KeS4xWkqgteM70iLb9k1PwOSC
         o6Uy2+LjCa6ZTFaH87u4IsopuPDX1I8Q1VV/TxLBr5Qk5TKb26TENby3Bm+tOT2msDmt
         DarUu+L0AZdkgMWcO/c2zQTSZc2HTvVZTp9qzMAjU0A2AH9EUzb8ZmKZUTtXNmiV5VZi
         a580y0lhEoXUDrmG3uvz14igkw8CqZsgWamP0PKI+shPYyVP7iTBm40oLNO+/+Kkoela
         jwZUFR2DHwHB3Ti+C7kLV6hrZbkg7Q3eY1ns+RKPjd85B2eVU7SOnyEOS9fFSYaU1dsf
         ZGWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786120877; x=1786725677;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RDWNsbn8AaiOnT73If9FoLX/GoxxLjSClflI4U9QaJA=;
        b=YgfyGN5OIzAQak86eg2MMYT3EBQjn0M57QUvIZU+jf0ojP8OrectP9JnNCNfY90Vfe
         HWCqOWpaapwsKMJP64mOuUY6klZIMDLEj1yfSqrKTGFEr1A1RuHm2tsBH3hot1I4/DDk
         xg9xpn8C6J6OJODdciKD83pHRgmubUTGPyKVsl2xVkr+ytrEYpZpozmvKyI5AlVSQvHp
         M+25DbmIryyfrXDvf4liTiJd7xWdDoxC20fiLhhlTgBgfm4+5r5AMhBpA7td+qI0BvVe
         QaaZCmmlF0MkCcHQOrQO3btELqa4AKKaspAeL+td7yRy9xBrJYkbpMw1DowrYoDXuimI
         +V6w==
X-Forwarded-Encrypted: i=1; AHgh+Rpa8a27cdAAc1AWOZG4sqGwP9fyr97aTQDpFsIfh65YwyJJmLhgLyKdWlJ96rX6nnmdVpQ6BojWQ3Z7/WkY@lists.linux.dev
X-Gm-Message-State: AOJu0YwBbdPi1Kv1CxmVD80zj0zihWuAPiPjCcliQHtGuJsTPORoc3EC
	PSt7DuNWM3Ahw/Z0EDtGqdYnXp/GJp21oGdop2+GhZdAjxwGWxukQTfM
X-Gm-Gg: AR+sD13loNLfRK/BEm/EKOMy57J9KvBS5pjPlpzvn/YleoxOAb8zQNzLqdhnnUw/Gxp
	7x60tLP/VNSTxFOlG+wGWvGnMQt5jSIpgCXZEll7hpG3px4PTIUoa7ZD0Kt15pt4T9BbFzRHW5V
	n11Vh22dkLoc0eIPlfy3YX4C5DxmHIiu8S9c9FxMESR51fG3UeMF9AnWfNMqypDqetcwhfzzScR
	91ZTcagK4aK8gjtIp/gRGPt7PznqzsXOogRANmzyHqMdePHsYC65tdhKhNRFp/X2XAPWAxeKqz0
	+q+g8QnRuOgp9RAkzuajQZSeSNIo/AQQWHUEGWSwisx/WrRuECLsdRixrb+vHuFn/QN9EJsCogs
	nIqEfO6qjL4wgl1hTP/QoBYNypPOXRU4uYT+YGxAWd/yHU0V+/u1hQJV16HcRtDyzp+hbjdtBPX
	I1NAJ3WjCswJ3xp1CnRxRZkjaXV4DSWQVnMy0NNd7OsYVuZBSQciEpTgr8vlI=
X-Received: by 2002:a05:6512:3990:b0:5b0:eda:de1b with SMTP id 2adb3069b0e04-5b30919f542mr842704e87.16.1786120876629;
        Fri, 07 Aug 2026 09:41:16 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3050d0147sm568681e87.27.2026.08.07.09.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 09:41:16 -0700 (PDT)
Date: Fri, 7 Aug 2026 19:41:12 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove static HalDetectPwrDownMode()
 function
Message-ID: <anYKqAZjl08i_Iws@archlinux>
References: <20260806-rtl8723bs_efuse-v1-1-fedb8b91f346@gmail.com>
 <anWO7VdAafRvku1S@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anWO7VdAafRvku1S@stanley.mountain>

On Fri, Aug 07, 2026 at 10:53:17AM +0300, Dan Carpenter wrote:
> On Thu, Aug 06, 2026 at 10:34:48PM +0300, Nikolay Kulikov wrote:
> > The return value of this function is ignored at the call site, and since
> > the function has no side effects (except for the assignment to
> > pHalData->pwrdown, which is not used anywhere else), it can be removed.
> > 
> 
> The patch needs to get rid of pwrdown from include/hal_data.h.  There
> are two reasons for this.
> 
> 1) For correctness and cleanliness.
> 2) It makes the patch easier to review because as the patch is written
>    now we need to check the kernel source to see if what you're saying
>    is true.  But if we delete it and it is actually used somewhere then
>    we can rely on the kbuild-bot to find the mistake.

Thanks for the review, I'll do this in v2.


Thanks,
Nikolay
