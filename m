Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5691339A4
	for <linux-staging@lists.linux.dev>; Sat, 25 Apr 2026 12:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777119121; cv=none; b=kQtD3B0nrdapZuiS2Ar0K1jvQ8VDSkt5TWYeb8InG3O/cmm0xkUe6hIKAR4bYYfaZkIiXu3kpN7as1wrIRWL6PWIpJ2E8hU2i/p4JJ8aHwuQBP27fO/7bCF+l4ANQYbrAYPr8MSmU+Oqat7mULVB+H/nSLmhjaEgQg7etrPvH0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777119121; c=relaxed/simple;
	bh=6r7ZGIxUJ4oPtUDVKTUyb5Hr8A2W6tx5waz65gG1N3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D7UYN/B5kGBwFozuf9T0qNLePnUjGY5r6J9YC7eVT0ymxyTVbzmhhESeAvEaLzKXCSWlmx0iLxH5019Hi0CB4REVKMlNDSiVyCqDXVz7Xwshoi0tQ6Jm0j5jWwBvx5Wzghjwr54rZf+bUlW1G/kxm84P3qRpwykH83Ml/lrdCrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRid/lK3; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRid/lK3"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-89fc4147f2eso97342296d6.3
        for <linux-staging@lists.linux.dev>; Sat, 25 Apr 2026 05:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777119119; x=1777723919; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6gay/cokIr98J17MOhI34XsPatibDg3KPXl0AYIhu8k=;
        b=FRid/lK3a1wPfQEjjoSzQVCRukwhw4S6J74zXHW2lYcUzdKKW77gwDwiYwX+rAGVsy
         c3lLQ9u05Bd0vmGKHT5bV2t+QOR3vWjio5x1yPTDTCoKhjXuuRfFaJ42XviwUkoAlfp+
         VxssoWRC/UXuhR+0m20N2Wq9cgSU34TBJmeLm41IrYflg2JKlwYZKviGA+Kgo7Jo0+mV
         QXkX/scdrYlyDmg2qNq0sw/mRQ8Vwho/ekJexFzoixSwe26gPhXCCgOeasl8cfClwRr0
         QMmUgLQLz3Dph7Axob+HWtlQD0qdXRcdIEBk4JZ7k0h5U0c9iSGmqnZNOdXYlgluwemi
         vj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777119119; x=1777723919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6gay/cokIr98J17MOhI34XsPatibDg3KPXl0AYIhu8k=;
        b=VYjsuKEKJko7b1RIJZ/KkHG31hjweS4Hn00mh8v7oW1EtipCl4tflBneobpnd51lWb
         A8Tbizjhj8bRqN9P927uh8WyuvkmzZMIMkh6C6u7TzcL9xOcF3vDTa+AACaaAmDYMzdE
         MMxMUre9f2NSmXT3A97kiWAFN857HE1V8/ejE4bNQm2ykNs1MvnUaMBXfnD/mD7ln+72
         N2Zu69zI4zTs71R53L+hCggxpL9RhRTXZzrTyPWjJ7ztpEYUPrynSEqxznwby0QvTF27
         x4ibwYy9WGQGI7wvqLLRl6lJM82F/3pXt4TJJQeDLLCso3YISRyvb7EtwOQBl0lZYz9u
         p1Fg==
X-Forwarded-Encrypted: i=1; AFNElJ/YiZvmpsezY9OcRyGCpe5e35PDWOnRfuv9wbiKAaZwcDfmujL/b4htJmcZyDarz1n26CSNgNZI1zUDy6Np@lists.linux.dev
X-Gm-Message-State: AOJu0YxDgaWxs+SJBvq7jAfRIlxnPIygzWK8WivVIQz/Vg1JnSEcWWBI
	G6E4aDKL5Wdr2ronBsMSoukNDQ9q5sA6fR/8W+XrFui4RGShI7Z7wUXw
X-Gm-Gg: AeBDieuQUzH34+boc3b+57nYMyiI9udUFmTO/Qo4XHAQqKZnS9/CWwyhX9DMij8JLeU
	gBF9D+emmcqIqR7jUfAbizQXxOZrR4kGJEC+K7raz4m9SLPkETWXiUhRFEvVDJIF5qfdLKLcxqU
	3ijhtM1RI2o1tDA0NC35KKlyX1k6jQfl1S+KmjJ88mpxya8AyLSpts8uw4yPllO5toWdan0gnvx
	F9M7tHzvjF+t4PNpDGP8sftdg1CaQQ/z47HWbGzc2mTZimXOl863KE1MmHAvB4YoBAh9lcW1ooB
	Sb34AD4DNGvxVhH19XSGG4xmrONBXLadFh1O66MlCtfekvcs6hc0rylEvDlmwSHmbsKFEl206Fl
	IVxF0y2I1YReA751Kjmj9W9QkhvPO0U0XLIVjtYGORZb/FvNJ7Y9KbNF2jQ8lFKFrfHan6jSQ+w
	Me4c32chMIM975fevF5VvoMMF67zRFew==
X-Received: by 2002:a05:6214:4f14:b0:8ac:a6f7:8a71 with SMTP id 6a1803df08f44-8b0280ea565mr510769016d6.24.1777119119444;
        Sat, 25 Apr 2026 05:11:59 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02aea5ebcsm212277826d6.44.2026.04.25.05.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 05:11:58 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:11:54 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: greg@kroah.com, dan.carpenter@linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix OOB read in
 update_beacon_info() IE loop
Message-ID: <aeyvikR0uECYRY6X@stanley.mountain>
References: <20260425115936.2899314-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260425115936.2899314-1-hossu.alexandru@gmail.com>

On Sat, Apr 25, 2026 at 01:59:36PM +0200, Alexandru Hossu wrote:
> The IE parsing loop in update_beacon_info() advances by
> (pIE->length + 2) each iteration but only guards on i < len.
> When a malicious AP sends a Beacon whose last IE has only one byte
> remaining in the frame (the element_id byte lands at len-1), the loop
> reads pIE->length from one byte past the allocated receive buffer.
> 
> Additionally, even when the header bytes are in bounds, pIE->length
> itself can extend the data window beyond len, passing a truncated IE
> to the handler functions.
> 
> Add two guards at the top of the loop body:
>   1. Break if fewer than sizeof(*pIE) bytes remain (can't read header).
>   2. Break if the IE's declared data extends past len.
> 
> Also replace i += (pIE->length + 2) with i += sizeof(*pIE) + pIE->length
> for consistency with the sizeof(*pIE) guards added above.
> 
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---
> v2: Replace i += (pIE->length + 2) with i += sizeof(*pIE) + pIE->length
>     for consistency with the sizeof(*pIE) guards (Dan Carpenter).

Please wait a day between resends and resend the whole series.

regards,
dan carpenter

