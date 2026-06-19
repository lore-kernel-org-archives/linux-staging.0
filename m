Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CA73563F6
	for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 08:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781856427; cv=none; b=EteXaGv005MNNHrQWF5jQa7kfSC2vcKHSvWvzz4SYS0kIIDgUaSEUG0Hy6bHHYA87ya55ACah+T5QTwtfy1L0tjMsVZx3mDFNlSfPHcUneNdhJNhVEfOGPO29A6Igf86rGaMDcITXkduBojhvjTn14g0bj8QLlwEhTvs07lyY30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781856427; c=relaxed/simple;
	bh=GWTSouYBdfyDGKEtqPkuomq7EPOKsF1frZSH2QbHTTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DcpwLP8KjV7ctFTVd8ACLYc6LNZaFX7rN8uAPq45ywfvKZu/wXGn9n4vREWSdxXWPDfktpkMFjSth2UEcYYvOA8qyK+J2MdJgjqMqZoT+q3YQ0pZB5Z43566HdSTB0QD5bU4zzNkZeBj9GUVnfI6+OvUb0YM030niJ0IoEMhg14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9EkEepc; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9EkEepc"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-69d7cdd3b8eso839590eaf.2
        for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 01:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781856425; x=1782461225; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Izhn3GqRsfJAXx1ZEXBD8uf75chTGB0EKNO2ktWPV/M=;
        b=L9EkEepc5UA3hJvF1nGIJMufaJ/WDzb/a502g/QIj7MxklklUqNheCvqgZjwTVIUt0
         sKGTj3YH+GayGqmyLL6Labs7OG82BAMOmGNauCX4IX/dVp/BNHKBVBmJRBb+NS0W0OB8
         O/l4YCV+qQU/kpmj4C6RyAv43eHbQ0mMGLVMlJldqFDA7ftMRFuHNqPANLS/RiJUjW++
         YxC+A4NposfAczwAt5s81HqKmIyVRogqwL9Jna12SKBWS6VAfLf93nmykuvQsXeXeUUq
         DdbcPgQc3uE8pCWyhKNnE3XRNoZoQTIfe4wkvc9CNxdbjojNLC2BdvUxMZlBGyCqsWDz
         uDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781856425; x=1782461225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Izhn3GqRsfJAXx1ZEXBD8uf75chTGB0EKNO2ktWPV/M=;
        b=VhuocR+ZkAaZKJzcE+IYxsA1fDBd0AnNqeuGgKjxWoDp+jtzVvy1PleuM1g2UEW1lh
         bB2Xiv4V4+WB14OYf6b1cQ4iE4cHcUgW5Zre7wmscUyWpMDrK8gjkDW/DyQynPgZgFaN
         Zu/OuBrLVO6gV7IcHEMDzovWiUhzTM6EFPMLfS9zRQmVhQ/pMDsjjoyER77Kqz50uLQu
         DKxj5qTye70qEtg05g3kMrdmwWhDeOJNGNIEHr4tvtijB8+jIU4d452t3l+5yfLOi4yZ
         he8/Wx7HyGkla9bVZi03cGxOQVHfcRfLSm4WeUO6f2WHsOtRXQxA+R4aZvyOhC1/QQ/s
         Oy9g==
X-Forwarded-Encrypted: i=1; AFNElJ8DE3clCmUJOAn0y0B7mDvA7V3z8q8gfHpfzRUk09FpoqrhEZehkovpRAfNE75ijmxQ1/iZGvwpG7u8tEim@lists.linux.dev
X-Gm-Message-State: AOJu0Ywmcsfzc4amZE1D+qv5JM4wtL2NcDLiUwyDt2oCGAuNpD814UVh
	PV34tQr4KUe2S3FhmdHg+upHsVbv8tcdSWt5wDuVF6/ijf7yoYLxarQoisXckMTd
X-Gm-Gg: AfdE7clkPWTEuVrWmUlVLs2i9hJhh3m0mm2UdoIkMl7pQ1Xcr5W0eR9Afykjvhs6f1j
	fMwhLtSIQ4Nsqa0tyHiKOr470BWFQd7Tq+e2sQUuc4NeKI532fc4hO990l+v2Zk99F9rm99FzoC
	BhylS3ciQMu8cHxrhib3tRXYz1jPZ+H8mlRacUJbfYnZv++kkGghUhuwqFOdqDCmEmLBihm37zP
	zVmFxwKdsbOE4qTaue5GO9P8bcevwhPY4FB59d5hwrtRVkGmq15B9xT2hgRacTfv8cxS5JyoA5Q
	CQA+2juAX961Ps6o4CiELqEIIu0NNPDmRD8wRL8csaSf+xP2SObFwEIOSSH4OH3YEGOUK6SmhjM
	ohMt74BjWbBGbx0Xqza1JZ2+3hvSZtZ2nbl7Jt1WjlZ+a1lr/fo/J6t88bEml2pO4zudOMRgqui
	b8sbaWoI0=
X-Received: by 2002:a05:6820:81d5:b0:69e:d53d:121a with SMTP id 006d021491bc7-6a0d8881096mr2124831eaf.20.1781856425210;
        Fri, 19 Jun 2026 01:07:05 -0700 (PDT)
Received: from localhost ([45.136.154.250])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4470a43756asm1858578fac.18.2026.06.19.01.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 01:07:04 -0700 (PDT)
Date: Fri, 19 Jun 2026 11:06:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: Kai Cheng Jin <kj@kylejin.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix coding style issues in
 rtl8723b_cmd.c
Message-ID: <ajT4n4p7CKiApCPF@stanley.mountain>
References: <20260619002543.992270-1-kj@kylejin.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619002543.992270-1-kj@kylejin.com>

On Thu, Jun 18, 2026 at 05:25:43PM -0700, Kai Cheng Jin wrote:
> Add missing spaces around arithmetic and bitwise operators,
> remove unnecessary parentheses after address-of operators, and
> clean up extra blank lines, as reported by checkpatch.pl.
> 

Split this into a patchset that fixes one type of warning per
patch.

regards,
dan carpenter

