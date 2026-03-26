Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0842DF12F
	for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 07:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774509606; cv=none; b=Cuf94EbdN2kMQ/jgWILP+QrY96MXB3hUTaX/541RfAy++bixDjT6dsz8Rb5RKQMJEikG+qaokyjl95KvUZNSjljsMI7z61gkGak8z7RtWyv9tovrIMv1QTEXkHMFd8ahnMq9ZO1AOV11DiE5QWbeu8XalBVbN5O8nRZjEaDhFD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774509606; c=relaxed/simple;
	bh=ExW1NIEHB+EiDlJzqanGe6xzLPWNW5fnfdAHXlZNKZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZwBxKAJvGCNtOhX41XZ0H0zMx7Nrl6s+A/ARfFst04TMenIkB1HSuUellUlFw6qCY5XhWt0N0kW6/7Pz59JUMxY72t7bTqWraLag5PFjH/Pb2BtX86UA+9XB0jMtrBvf8zjMsnuVw0DACgVfebwD5zBk6p1V9+s7j340QdA0Btk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AlAbFiVM; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AlAbFiVM"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486507134e4so7660005e9.0
        for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 00:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774509604; x=1775114404; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VHr554UwMya/RBBL/+B8JRf4OCCWjk70NfobapbtEoQ=;
        b=AlAbFiVMo3xlj74t+HyWB1P3FfpT1IcDneosH2F+4R2gYl6T9Zq9dke/8Apw0l421+
         umGxACIOmbsLXbVmPk8WAC7FAZOcicCyQh+ekqE97vSDJRHIgBy9PPjuBnSyAFQd037L
         wGf7YTbD45VwPTDhAKCanNGkZ2DTymUCSs0r5moz8YHbWMaffsrVWj3sm2IRDR7bUPuC
         SfGEhoQlKUZl1w+COgTJxXvgND/C7JzljE95gecHWj8v9HFWpFL7gcw6ClWWAx980Uem
         8OSfJdgV1ImtwXgFXGotIZ/Nz91nVaNeTBYltX2IlOkq/4Bs1i4v9hVPMtggASWZlL+y
         jGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774509604; x=1775114404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VHr554UwMya/RBBL/+B8JRf4OCCWjk70NfobapbtEoQ=;
        b=doPBZHopEDnn9QMpDNU/MhVtauC6J2MrNq/igpyetyapsLgoJ8davv8wDuuue19+JU
         pOZiA2i3193lLuWGmcaemHv2Vh6WRU4lfu1kcaKp/e1Q8jrRipXp8t21cryDrmEXtZ9J
         wLDpCjqyWcjDsNfCHeCiW9di/ZyfvRkg9q5Dzz6JUAjesIPVf6UWikLP7a6f0hj7gTrE
         LIq+kmEAWmUP7pHBLtASXTumbnvK4G4VUFLgDwrOEMZFTPSW1zON0oiITCAe5ZZhWtF6
         j063Ay1ly2NZV6GP141htNPnc6cK/2mGbkm72+u1INtwX6LC/w8yQQB5tzTmsAEXy4S+
         ejdA==
X-Forwarded-Encrypted: i=1; AJvYcCUkSnF2r7G8gi6NBsfJX1aMBf73NRCETPVSTpDTgQOAiRUeyQcuEXKgSzoaTTgVvpLpcyTdgGM2Nb4WhFAF@lists.linux.dev
X-Gm-Message-State: AOJu0YyJeYsRQS8riXvubY+yMeVm88ME6B5yuqUtbKolou+MuBxDu13u
	JGAXLDgfMSvBGcmQpKT3mwZ7UEC8xadB8dL5fUMnLfGg6ZgcMGTVII3ZnImADfXwijc=
X-Gm-Gg: ATEYQzwViZiO0vTDYsWkOKrbxW1MrnMK6jjzggGxporSfYi375DQZq3ExuXTOuy0aWY
	i7LOMuxMz7bVJSQGw2LeNMmc9d6qg0sQ0Hw3GPzAoyp0S15koSE0At1orIzMFMrRcMkDuwY7OMu
	s3c/PX8ek2JAnTaZZjzc6UXZKWr5Z7NPwkuH2ATLl6r6YFARPOMM+V7Uw2bM5l0KdnwrtAWPnFy
	uF/JzAYmQUxy1+B5A9VKlaBimdZwDkn4wBvfSCF0jN4gJnWdXRIzZmRQiLBzjoGUy8d6xOxiJi6
	zlAVFh8MmCwA/mINfcIe2ibDzJWJsrxWy52PhV6BlL1p3G/6fEdPIsDFElxNm2haYOyZEZT0dRt
	aacTOnmf4dn/qGAJMisJYSOgFE5I/dytpjokGKvi3XY7ms7eMvegN++bggnRM5yzNQZ7SxmoKar
	HehDhQ5bmuNc8fa96egP9KOCHuzB4=
X-Received: by 2002:a05:600c:1548:b0:486:fba7:b150 with SMTP id 5b1f17b1804b1-48715ff7432mr101933255e9.15.1774509603806;
        Thu, 26 Mar 2026 00:20:03 -0700 (PDT)
Received: from localhost ([41.210.147.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c9f0afsm19645375e9.10.2026.03.26.00.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 00:20:03 -0700 (PDT)
Date: Thu, 26 Mar 2026 10:19:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Omer <omer.e.idrissi@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: rtl8723bs: cleanup return in sdio_init()
Message-ID: <acTeHqD9QZnM4Ob2@stanley.mountain>
References: <20260324220453.47406-1-omer.e.idrissi@gmail.com>
 <20260324220453.47406-3-omer.e.idrissi@gmail.com>
 <acOQbjNdDwLAGduo@stanley.mountain>
 <CACx49NdDxFcsJayDz8ERbn04yq7g+JqvPAEf_-xojSH68uMJ5Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACx49NdDxFcsJayDz8ERbn04yq7g+JqvPAEf_-xojSH68uMJ5Q@mail.gmail.com>

On Wed, Mar 25, 2026 at 07:51:27PM +0100, Omer wrote:
> I will make a v2 patch for this series.
> My question is do I go back to returning error pointers for
> sdio_dvobj_init? I did that in my original commit so that
> the proper errno would be propagated back to the rtw_drv_init probe
> function in sdio_intf.c.

No, just keep it as return NULL.  But the check should be:

	ret = sdio_init(dvobj);
	if (ret) {

Because that's the standard way to do error handling.  It's slightly
more readable than the alternatives like:

	if (sdio_init(dvobj) < 0) {

> sdio_dvobj_init function can fail due to both allocation issues and
> sdio_init failure. So i thought it would be more
> descriptive to propagate an error pointer instead of NULL for both cases.

It's more descriptive but returning NULL is fine.  Every change
you make adds places where people can disagree with you.  We
want to change from _SUCCESS/_FAIL to standard error codes.  Fine
everyone agrees with that.  But then changing to error pointers?
Some people might agree and some might not.  And then it's like,
okay we have 99 functions which return NULL and 1 function which
returns error pointers.  And we get into a whole discussion about
it.  Forget it.  Just return NULL.

regards,
dan carpenter

