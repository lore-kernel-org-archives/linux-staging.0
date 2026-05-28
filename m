Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D102C2F691F
	for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 07:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779951801; cv=none; b=VNOUD65se1vdlol2btHGksvzdalRorddqJ05uxyFyM647n6IvR8e1GCUFICF/EhrdqSFaqHuDTCEgWe/xEq1rTD9L0f8rucKCI2ggOe+mMbn1HBEqP5/cCjY3IAY//7Nf1/U0MnbIyHXIsTuXck1qNgg77BOvDW6FYscUx8h0PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779951801; c=relaxed/simple;
	bh=5VNzfOEg6VGAdsyK/ZHVoomGoCKFoCKTmIynCeJnJEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGZtuOfJPc9F1CDhNbUoytWeh9/J1VY3Yk/n15hFX1ECwm7+DSHYaRQvKNBoAMWEUGXGcx2XVbgL6GiRzozjYXWtTHDNKs+Jdlm3bEd0a2FW5r21NSIhfIr3+wYmbIqr25UJcNWS1fPNnDWaPwDGhHCzfE+ystZsGa64hL0O6GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSApaT6n; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSApaT6n"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44ccbd3290aso10797238f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 00:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779951798; x=1780556598; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EBZrKhk74LrTBZh0oPM3op03SUutQvWVzqnUjcR5+OM=;
        b=DSApaT6nICDjlJ6CNuDmwgOMMfAofN1Nv7WMmL+WTPoRQ7HoSC/1gy05bMdNunR+iR
         khhkwWOnyz7CxaCCL2yNLaSCPG0lwifhpoIs2pbsKJ34fa/vIa6mIQUKVTWvAnd/IweP
         7EDFYOXZ75+sBuh/XYQeT0FHKuT154HWCSOvFKQSD9qpWlXTzgpRR33/2tQ83LVN2rM6
         a6142rOcV6TRzMQ6wMk/RJeN/9Qt0UzP/5nNvphI7Ux4dKIcCoDuzbCqzr0QR+VFXdz2
         DO3G/r2IwoXTb0D271FQr8WEqihuIqQ7FQ1zs9LpB0fpI6xiz7+CD5K92PkpRJSk3ryt
         L1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779951798; x=1780556598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EBZrKhk74LrTBZh0oPM3op03SUutQvWVzqnUjcR5+OM=;
        b=Fv+2blu+1h/7xs69pBM/iU7BVyZDAKRTDXvuTdxLfzdx43M7zK5tNwiHbLowrdsijq
         PcwqRo7iUPE4kVuPKVr6W/YsIe/qHuZt4OW4TS+CdvBSD5Vm5QCc9+hOsAseoB48M1jy
         4jme1tPcgpK5+8e2DOID3e4BvHrTkezCD8hNe0tGb1uEEzn2gRuM4mXwiCS0bIfSGhMJ
         1E3/D6sEqZB3WxgD9iW0nsoUK+KK4Y9JjHR6yHQ+XEBUJVlqI5M4WdwWNEFfTfozPX2f
         GWT2VFzPQDGWlcdJPXRJ6JQqPyZCHl0VbNBs9cRH1njQt5wN5MvlLY87QHklF0d2pBJ4
         lbwg==
X-Forwarded-Encrypted: i=1; AFNElJ/Rir3ePni/F1+5WCSOQJBi8hKpNbWHc7V/1jcvmKHGrQov7ZzLmrway9EUprDutOdC4H0hq8DZlOVkooON@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7sQG+AcqXsWB0jyZkrxE5OfWHbLzHqNDIOP7p2QZa+IgM+N3i
	Mr5i300r1oCcloK1YgGixFxHcNsz314i9hNm7kcEUnbwniYUZgYSjlJQ
X-Gm-Gg: Acq92OG9RCPJ7Y/NFp0JGugu6mvwsUz/z43ksCFZEPQ50uJe8TfcuVqWQqE9tjdQ9wO
	+guddCcI5MkjEVNTaHdqzYHKee5/pWqeKu2JeIaUm6hWRU3arG2ihyDCvAgm4g3VA52fz0gGiM6
	rAO+hLqT3vAe0qqWiRdZZ/fwWxfy/obo6KjnSAZ++o1UB/cIpZxuuHmjIpHysZb2n3RDmo6akxr
	MV6dZjw9O/4jywIgXDWArfg9xUivCD9KmQiUfF8LffV2THKWbBWf1V+Fu654msov5MMTwEoKNSK
	e49eZZwP/HB1ye8ru7nHUxqVN0O9uP03YSzUevmDAUU3j/oH+j9XM6OJ5dm7SEWVgC/scgeKEKG
	KweAHS9fGjeRnUD+TmItiJvKza5y7n7q6+ELx7Gkg8TIq03NDOPs+qi+Tf1h8tumboNfoo/rmUl
	WgIn2BbD5Lbp9Rcw7A+BRgg2g2TPPMoVtewQ==
X-Received: by 2002:a05:6000:41dd:b0:45e:ea68:523b with SMTP id ffacd0b85a97d-45eea6852a1mr1137165f8f.10.1779951798120;
        Thu, 28 May 2026 00:03:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ee5a84e92sm3060005f8f.35.2026.05.28.00.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 00:03:16 -0700 (PDT)
Date: Thu, 28 May 2026 10:03:12 +0300
From: Dan Carpenter <error27@gmail.com>
To: Bastien Cossette <bastiencossette29@icloud.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: rtl8723bs: remove unnecessary NULL check
 before vfree
Message-ID: <ahfosFfVG6O7xB6E@stanley.mountain>
References: <20260528070045.40135-1-bastiencossette29@icloud.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528070045.40135-1-bastiencossette29@icloud.com>

On Thu, May 28, 2026 at 03:00:45AM -0400, Bastien Cossette wrote:
> The vfree() function handles NULL pointers natively. Cleaning up the
> redundant if check simplifies the code and adheres to core kernel
> coding styles.
> 
> Signed-off-by: Bastien Cossette <bastiencossette29@icloud.com>
> ---

Please don't resend patches in the same day.  Also we need a note
about what changed.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter
