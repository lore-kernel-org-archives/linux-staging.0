Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B4A44D6BD
	for <linux-staging@lists.linux.dev>; Wed, 17 Jun 2026 14:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781707034; cv=none; b=J59Mtucp7HEQmTNHqTuqktjDSZzFhNP9GKuZqk2+dZYWcrsw2Dj2IoYDTq0H4+WqYEyYcrr7H8ZdYnvRJV+hcQ1llDbnJrp4bBKX2BWWg/hUJh0PVHamEi+RMyNL+bM+6nsP9sBKWKlQf6x008puZ2+Jm4352mC17GY/iR7oqfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781707034; c=relaxed/simple;
	bh=4gMx/gFP3ezYWwhAOqAB1Kje7kj3CrAvjE+qT8YPYSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7tabtnyZv2fj5jxyMvCU9ZII5FRJcD887Uszq4uz2mYeVSktFwlXLmHbpnUTMtNo4dlK/CUfHpb7bgA2sFWQYkaU0G0sqtzHIZMCOME5Ne14jhCNE7ebUQkPSBkG2V00CZT0ceg31bTstfRiy0XOVs21C0UDbNQ+VgViazybg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CbNZIAyM; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CbNZIAyM"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490b4a8e28bso44365595e9.1
        for <linux-staging@lists.linux.dev>; Wed, 17 Jun 2026 07:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781707032; x=1782311832; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f/U3pg1qQqmyIDqzsXJB2VsL6PWowCqDwJ+7vnlJ6Ro=;
        b=CbNZIAyM8OOTk7o/IM9Liro3ypp183JczMzIm42k9djxv4k64sVIN91o4/EY5iAl23
         PTRSsLiuHPPHVSi8LibfDSWkwEKq8HU/duKBZZFpNM1SjhXUys8aKVGtZyvqQU801U1g
         YUQdxQcNqVz/gGD8y+efv/R9a5AgNsu3C7Y0IMfxdh1WPb+KLPL5heVCShRfGDgG2YBG
         iKLMD5orqRFK9cUcrDdhvt6Uc5lTMzsX/hrFtTYhvXThmz67duLBPuIz6hGXwiWHIrIH
         NBSi9PhW2P9N0sq/O/9oGd8FJh2ADp/azvSrLQeQwjUnAqunbMrYEXTmD+PqWsTeRXxM
         RkZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781707032; x=1782311832;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/U3pg1qQqmyIDqzsXJB2VsL6PWowCqDwJ+7vnlJ6Ro=;
        b=UHjEcXCJxRhGWbv+UBWT9Ht81qBaQK46zVE2CzopA4Vz3YN2Jvr9vlS54C12dGdYos
         TVUvZdgqOmVSncfvoS8cpR9g9ffjcTDesQm9TYnSdiQjp7iWVlnzXAlAp9Y5JnEmzlWf
         kpaRPP2UF8Kecda9K0NVXGpzbSPLineLMC9Xs0xJ5LjieucWlNbH1DcwGPEuHr9jlFGv
         J7vnHgU/dVD94oezcHP0rH8ExoXZ7YQ3izyOtfgWcEGN4AGEs/AQWWrIy9eDehk8Fajs
         Bn9ON9TyOlDgfmbyZs8fubwRwRvcLZJQlORAuabrqoT47hUDKu7aMJpKT9EU3+LxkMJ9
         KP3A==
X-Forwarded-Encrypted: i=1; AFNElJ9XBJwVMzkzmBHehUiOiUbO6D28mpLRFV5MuRjRtYCAJkqiM/cUv9OkKOTQnAwR6/UJ5ZUXtUZTzP8OYICh@lists.linux.dev
X-Gm-Message-State: AOJu0YyZffx/OP8ij5SKN2CvwXvsi/GI29epOmIaUQUtGVO/5n0GVbcD
	z8T4EimM7i2WY3nGehKMm1rDYsuDfG20gZhOuh2mWPGZYLBilN2RdR9O
X-Gm-Gg: Acq92OGhz7uz38uEAEhhYE7X9BoIjosGGdnVCoJhDm+W/qYoQBcH1f8PqX81rk6kCq8
	17do/z+vBlOmndz3qlVDsmWPTeLzavKjCWtENAJJXn8BgZ2ejU1xCpg9BEO3U0ozFApTYvpK0rr
	g3TNmnvpGFMsgXPITXboPQYBk8fE3EUir5NxebhPzZionHSs5OdUGixMrvgQELhGm2d33pPRMtx
	ueQvQQyDOuVGwlx1qP/A9fB5MlJQ3mkSkTjSHc/ji1FoWUrbn+8xnv/rrFsQ3VcySXSlswlp+pt
	Bw0ShtOjwEYpD8wOwh8xnu4yiLYhiS3H9ePzYeI0cmr9n+PYtbdcAx0ylOAQBwXQNovnGNI/Hhb
	TL1virF2UL6MB0ITLOOW2T5aRwbPDOsY5o3wU5GtxGK4CvYTCEGsemYCBzQJ6oROREnVuoZZ9m7
	d+Z3rELU22
X-Received: by 2002:a05:600c:c3cf:20b0:490:bf1a:ed04 with SMTP id 5b1f17b1804b1-492333ea3f3mr55873575e9.1.1781707031467;
        Wed, 17 Jun 2026 07:37:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a96b47sm138337045e9.13.2026.06.17.07.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 07:37:10 -0700 (PDT)
Date: Wed, 17 Jun 2026 16:21:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: Devansh Soni <devanshsoni874@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: rtl8723bs: remove redundant rsp_allocated_buf
Message-ID: <ajKfXgdcYGVhT-0f@stanley.mountain>
References: <20260617123853.63022-1-devanshsoni874@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617123853.63022-1-devanshsoni874@gmail.com>

On Wed, Jun 17, 2026 at 06:08:53PM +0530, Devansh Soni wrote:
> The original code allocated extra memory and manually aligned the
> rsp_buf pointer to a 4-byte boundary, however kzalloc() guarantees a
> minimum of 8-byte alignment so this was unnecessary.
> 
> Also, because the pointer was shifted, the original pointer had to be
> stored in rsp_allocated_buf just so it could be passed to kfree() later.
> 
> Remove the redundant alignment math, remove the extra 4 bytes of padding
> from kzalloc() call, and assign memory directly to rsp_buf.
> 
> This allows us to remove the rsp_allocated_buf variable from cmd_priv
> struct.
> 
> Suggested-by: Dan Carpenter <error27@gmail.com>
> Signed-off-by: Devansh Soni <devanshsoni874@gmail.com>
> ---
> Changes in v4:
> - Dropped PTR_ALIGN() entirely as kzalloc() 8-byte alignment is sufficient.
> - Removed the +4 byte padding from kzalloc().
> - Completely removed the rsp_allocated_buf tracking variable and updated kfree().

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

