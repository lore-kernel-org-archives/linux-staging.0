Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96A83BA244
	for <linux-staging@lists.linux.dev>; Fri,  3 Jul 2026 10:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783074664; cv=none; b=Wr+fOMYhg6fsMlmxsb0bj8SCXFitM32zoBNuxqNMeySvBY4MRMpCqS+YGbxdBlxw3XAlDjUDCYOejKtnzfPCuxIyWpPhY0SdYikMjsNu97FNnFUb+x+LDWleKPqP1ly8ODfE4eAcHhSLzqTHUyHphlgdPffqjdjORW79jrtJCTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783074664; c=relaxed/simple;
	bh=OpuYdWhmyZAhNJiA5SH3z+eNa0tvgQ4u3LKATeqSu6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PuwuWoEI+BaSKZDD6Y6PMOnPsnRQ2dzayiiTtDofB/USTqAvTHt5CNSUFp5GFNjjYxdZ+7wz1oC6mnv+4ogq8mm2xDKo5qqQlZMj0Ok4pT/TmlYx4nHUCgEJu6KgL8weEUKhPrpfWe96pV8JiyjYnzvdrZQsU7inygsuyoCw7v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hcvfHncf; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcvfHncf"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aeb24c0807so358009e87.0
        for <linux-staging@lists.linux.dev>; Fri, 03 Jul 2026 03:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783074661; x=1783679461; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eCSEztyeSnYY7fS86dLtAIMVXOB4i2FzrNk+WcLpm7E=;
        b=hcvfHncfIL32f84xry432prChlDkrIidCvN38JhZvcH816g837RLR9dbYur2DHBD/b
         k71LghQfuo8KZAhznmEanJD/GFHQ9g/OByoALrObYysbM/wzihcAXh+ZSVIoJ8Z73/0R
         zG41vRVA8wJObTlQFKK1Ko9SW4RGkZ6lhNrc15OB3HGAbgwPvF51sEn1Hz9mQwntmvj1
         n4RbNVpvA3ilxiCzuT/0i96gpXM2lexO4Z/T97er4bsn2z05XiZ/xNA+e279AeFV8aMU
         fXcdHZ1po2OnjkD4ole9FZhvujd4/RfNmG+9B3RRD4UtGW0fkYd2IgXG32hh6cnk+kY0
         05aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783074661; x=1783679461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eCSEztyeSnYY7fS86dLtAIMVXOB4i2FzrNk+WcLpm7E=;
        b=nUeZU9wG8YC+IeS8bZoSViKBgxl+ouF9O47eQIWNwt9515Itz54a0qMbXr1IzdbAYp
         ew1Z7Tbg4v3RRehN+prdGrk+8gPRQu+8+Rx5pCid2+98+v8SUOw2i6gTzvUiMRfTKtV/
         weo7kYJtMN3vcaCIWnxsq0eqPZVCfX6N3Hm40QT1kWADGYjk8wyTbjS3Nt0wMQ/RH4FJ
         6GLtDLeYb4NSl8Xl8VKNXx5iyvakHjiZHYi15naPcIyoesuuLrr8Wg1NEbiDKBOQTUbC
         e3NiPTfODl9DOMwi8Sg7kpHRQFP0waB2m0MwqDlPVqMHvu/Gx/zcqLnhakZO1wkOWEWW
         +sQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp2J3kk5TYqf9mdWUA/l5SoDHfPDpdmulcw0AzAsoPik4DRGkqr1XKVREmhihzpfy+hMkeVWUsg+ESE8cGB@lists.linux.dev
X-Gm-Message-State: AOJu0YwNJh/79eDbmu30ZUg4h8cgGQpbmXdsoZnWgSvL4DFmF2VNNQJa
	RynEDomMqIlVgW9K60AHyj1+rabdCyIN/zC8IfHKJ0its7tMlq1tB9fq
X-Gm-Gg: AfdE7ckkT8AjbHQxrNVMXhdiLSdWVQK3nktH1V3X/2K8UtWhwAWV0UXlZ9RUIvn5kRV
	XnMxZPn1l6GtCovsymy2re8SqxlASnV5QxDGq+a2/yu/BZ8X1V+LcCJyDKwR6gz0le1sNdVW8hN
	F5L1XH2f+pgFJIrgZf0ZoUTWnNR+HXWnok8v1FBC2084SKORlAacUZ8VTyyawkqL/gArfgRhE3A
	gBwVbFZIThuNzLW0H8ESPSPlr+qTmyEBXvhyELCZu4ZJl6SHJN3lz2+KAP5zLASMQKg89G5gHQd
	2l3uLoUBMCkgV6p1o6hhMIyJ/ZyyEd/+vXO0qtG2GSwkhGT8lh8GdbUk6BlIs6MheVmMLMX74Mv
	AfP7RTX9E/+rFV/VcMexdqbMuIN45cBRPQaZqU+hPaz8POAPJQgIF/YCmC5CwmPKfX59AbjE8Qv
	sEq0K87QobxS4hV73fylD4AWUAhlY=
X-Received: by 2002:a05:6512:8354:b0:5ae:b4d5:6e5f with SMTP id 2adb3069b0e04-5aec67b87abmr1628901e87.40.1783074660853;
        Fri, 03 Jul 2026 03:31:00 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:7b92:9ac1:b9ef:5287])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed137708bsm379446e87.22.2026.07.03.03.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 03:31:00 -0700 (PDT)
Date: Fri, 3 Jul 2026 12:30:59 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Prashant Rahul <prashantrahul23@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] staging: octeon: Improve initialization error
 handling
Message-ID: <akePJ0yt9APAyCNX@soda.int.kasm.eu>
References: <20260702-staging-driver-octeon-panic-v2-0-2c2b6ae086dd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702-staging-driver-octeon-panic-v2-0-2c2b6ae086dd@gmail.com>

On 2026-07-02 12:36:13 +0530, Prashant Rahul wrote:
> Hi all,
> 
> The TX and RX initialization paths currently call panic() on some
> initialization failures. Instead, these failures should be reported back
> to the probe function so that it can unwind any resources acquired during
> initialization and fail gracefully.
> 
> This series replaces those panic() calls with proper error logging, propagates
> the errors to the probe function, and adds the necessary cleanup to avoid
> leaving the driver in a partially initialized state. I have not tested
> these changes as I do not own this hardware.
> 
> This is my first time working with drivers, so please let me know if I
> have made any mistakes.
> 
> Thank you! :3
> 
> Signed-off-by: Prashant Rahul <prashantrahul23@gmail.com>

Tested-by: Klara Modin <klarasomdin@gmail.com>

> ---
> Changes in v2:
> - ethernet.c: remove unnecessary curly braces around single line for-loop
> - ethernet.c: dont mark cvm_oct_remove_device as inline
> - ethernet.c: remove unnecessary call to cvmx_pko_disable as cvmx_pko_shutdown
> already does that.
> - cover: specify no testing
> 
> - Link to v1: https://lore.kernel.org/r/20260628-staging-driver-octeon-panic-v1-0-fe8c34989254@gmail.com
> 
> ---
> Prashant Rahul (4):
>       staging: octeon: factor out device removal into a helper
>       staging: octeon: Propagate rx initialization failures
>       staging: octeon: Propagate tx initialization failures
>       staging: octeon: handle rx/tx initialization failures in probe
> 
>  drivers/staging/octeon/ethernet-rx.c | 18 ++++++----
>  drivers/staging/octeon/ethernet-rx.h |  2 +-
>  drivers/staging/octeon/ethernet-tx.c | 17 +++++-----
>  drivers/staging/octeon/ethernet-tx.h |  2 +-
>  drivers/staging/octeon/ethernet.c    | 66 ++++++++++++++++++++++++++++--------
>  5 files changed, 74 insertions(+), 31 deletions(-)
> ---
> base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
> change-id: 20260625-staging-driver-octeon-panic-2602ed8d5d67
> 
> Best regards,
> -- 
> Prashant Rahul <prashantrahul23@gmail.com>
> 
