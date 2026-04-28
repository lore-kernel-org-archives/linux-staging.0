Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2AB372EF3
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 09:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777367696; cv=none; b=rK2hMmAbN6MtPt24G5fcAK3Ppd/C667/vgKDNn7Lyl6bph02lJRlsCC4DBv/dpqm2BgDE7+fiBkkyTP/R+f0mQJ7/9jPWHANnrfR5XjWZfp73ZitSOdMbsP0bwLQ5z1ou6Z6YiHi0FUA5sS11qIHnMwoRpIHpAIJmJdNS0Q2BBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777367696; c=relaxed/simple;
	bh=8AApnqTTa/y5FGl+Pf2GwXQp/b/aY7JipPnmTvGV824=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gd617Q0bmMOjvaQCrpGA7s78corB35oAbhJY6W9w0NwaUurr1PgqUfmytbBsX8cQShMUmWrRTEF3Sk8I9xCu/8gHVzhrvb0o/x3ek0DUHw0FOgFd5E+SNXq6cEee/vwQkV9Rx8wAu1y8YVr46ghiTeDMbOWwF+no690aJYZVCoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MICSvvi2; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MICSvvi2"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d7650202fso8393251f8f.2
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 02:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777367693; x=1777972493; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qNOsPKOzldEqNG1+DveJbYY2Z5WlvWIU1aJujOgzo5U=;
        b=MICSvvi2lRwPrUvJLHFMP884WfR2mDTy6qz7NXj9pFml7clcXrrZvyQVi0KGGCwheu
         KMxAerH1njH+1DmShPoZ50CDJDoP16sPUAjD0ccq8NmAoI3ceTBFU9qQ9n6397Ab1p2r
         b6KKeR9nRRdAPTtNc/WHYobxbmImREsqdlOK7IsLFwS+Pw9bfqt8OwuHKmn7x9TtgOFL
         j+t2TR9PmkRkFCwIzyY5wQtWupymx55EAY1JSCBfJBrCNPdv9YQyqE2krQDaAI6qqvEg
         qJctFHRASfbOQcecxhBX2sUuFJyB4R4I65P0gIHfsEaiIRjs9arQDcxulEL4c5VpqG59
         znNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777367693; x=1777972493;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNOsPKOzldEqNG1+DveJbYY2Z5WlvWIU1aJujOgzo5U=;
        b=oIX0HR4STHY5qeeuuF9GKCKVHImUyuNOgm241hNvc6ryXUbVNRcOJCf70txbeVKrxb
         KIqGErzQ7Z5XEhPcgkB/X2LbNuElNbjUd/0unicr92DN4KEHKb8q/6gclEnwTfB/F1bM
         QnSrgzKVXem3ZeT+jCS1Orv/5YdONBjAU1YXqZHTt57pA52ZPjZwJLsa2HV81osfXMvx
         gNplxqGCZftHeIa8/NTLTmRw84XjmPWy2Yzj6PYoXxpCAAdrfCjG9ifi+Ve78Kl+EVGf
         CM1U7QfkcNXkcKWWoKGUBtt5gVdwXAEI9I1rQfQDWH/ZZ6YvhaqqbNICJL45F9odyQYv
         90GA==
X-Forwarded-Encrypted: i=1; AFNElJ+Jox5PUu9zShw3ztGU+aM3ry2ANFwYdtAROFNA76JFvajA9KQV8IjIil5U1q+ADCsK9I0LmK9U8+0RzKpg@lists.linux.dev
X-Gm-Message-State: AOJu0YwzcsvwT2uZmV4dN7u1HiXin6/qgW9C/BhxRmcfT33kaE/s3u7l
	qTgCxUv4kMHHJcnypquKG5/ZwjBd/ZqYzv6L3yTu1iACVmkG9ShMq5yISQ0BhA==
X-Gm-Gg: AeBDieveEA9RUthoa1V4py3Bg5DDFi3VCc5X3Fkdenxkw77cdDGC7y86vjtYafqec7O
	tHrFmiCu90ZOWOkdXu/tbFlPCR7AbrDGCl9FTmInt9vBvD2Ja0UDhAH1lEY/Afoj0P4XqTeQX3V
	PgO7DMqAfnj6QCIPSLUlav3ePN4oZ8+/qfethfvw7GJuYfQDmIphOjZQ0MwxloE2+VIFGLjLgVr
	ObXtg2nJv+pcWQnJKarnPuvP6gPUTGogVcFfw/OYylPrF3rFABsoc7EJYXoLDhyGTJmnixkc9Sv
	PrnURPqs35qTbgPq1M0r6PVtyGVN50NVCHyWTApwGHSDTJu3/9giTDJxft/Em8VlXatwKBhbKeJ
	5qRhONjYfji/rTXmcs5DWEZG6FdtlXaTNg/NO5fP8uEX+y3BISLvEgMjrNaLcOx8B57Vh7Lu+KN
	wsnFWoqM6STleOVU28Ph++DXznNE+9WA==
X-Received: by 2002:a5d:5f51:0:b0:441:1df5:480c with SMTP id ffacd0b85a97d-4464a070032mr4187168f8f.42.1777367693356;
        Tue, 28 Apr 2026 02:14:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463cb59e5asm5190266f8f.5.2026.04.28.02.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 02:14:52 -0700 (PDT)
Date: Tue, 28 Apr 2026 12:14:49 +0300
From: Dan Carpenter <error27@gmail.com>
To: kernelcoredev <sonionwhat@gmail.com>
Cc: gregkh@linuxfoundation.org, vireshk@kernel.org, johan@kernel.org,
	elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: bootrom: replace dev_info with dev_dbg
 for firmware name
Message-ID: <afB6iSKiEy5V1mNR@stanley.mountain>
References: <20260428002448.4829-1-sonionwhat@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428002448.4829-1-sonionwhat@gmail.com>

On Mon, Apr 27, 2026 at 08:24:48PM -0400, kernelcoredev wrote:
> The original dev_info call was intentionally temporary, with a FIXME
> comment noting it should be downgraded to dev_dbg once modules with
> valid VID/PID values were common. Project Ara was cancelled in 2016,
> so that time has long passed.
> 
> Remove the FIXME comment and downgrade to dev_dbg as originally intended.
> 
> Tested via code inspection only, as Project Ara hardware is no longer
> available.

Put this meta commentary

> 
> Signed-off-by: Bentley Blacketer  <sonionwhat@gmail.com>
> ---
  ^^^
Under the --- cut off line.

>  drivers/staging/greybus/bootrom.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
> index 83921d90c..757460c8b 100644
> --- a/drivers/staging/greybus/bootrom.c
> +++ b/drivers/staging/greybus/bootrom.c
> @@ -168,12 +168,9 @@ static int find_firmware(struct gb_bootrom *bootrom, u8 stage)
>  		 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
>  		 intf->vendor_id, intf->product_id);
>  
> -	// FIXME:
> -	// Turn to dev_dbg later after everyone has valid bootloaders with good
> -	// ids, but leave this as dev_info for now to make it easier to track
> -	// down "empty" vid/pid modules.
> -	dev_info(&connection->bundle->dev, "Firmware file '%s' requested\n",
> -		 firmware_name);
> +
> +    dev_dbg(&connection->bundle->dev, "Firmware file '%s' requested\n",
> +	    firmware_name);

Please run your patches through checkpatch.pl.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

>  
>  	rc = request_firmware(&bootrom->fw, firmware_name,
>  			      &connection->bundle->dev);
> -- 
> 2.54.0
> 
