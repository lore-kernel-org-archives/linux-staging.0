Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D1D2E92BA
	for <linux-staging@lists.linux.dev>; Fri,  6 Mar 2026 13:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772802174; cv=none; b=jmfyAUS1bCriQ3paetJjnxMJzjXQ4APDfLwXRanMti7yE0wucqZF1Ybr5sLiAtDUgGOjnZxiVHRJ+a6GaClQ7QHZ+Bm5LlooZSGJPcR86LejrkqgecA0htCRm7Yr8T/BIvm1Q+d0WhKc7JaJXv3LfAwnJ3+a7f0uSy2MbVWNlKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772802174; c=relaxed/simple;
	bh=iVZ5wZb1aswb1Zi+n2j3lS0Ym4mLi0D4f00SVw5e36U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jXJ2XDdfpDCnKyyFS4LhrdBtR1mMzko387aJKv40kwgglFljMyGZN084kzqWU1uKR9W2qy2c61p574tNadO0GEc+lbGJBCBZaCzrIAHZunyxLdLwM3R+bdqYJaDFHJE5rJpo4I5yLAFg1xzNkpZ4hQHSS9n1+gcgxr3ju7dUPfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UaAI3LNW; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UaAI3LNW"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439b8a3f2bcso4381496f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 06 Mar 2026 05:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772802172; x=1773406972; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gct6C4Eht5wyc/ZmOWSkz/guh8IEwIRge1zzV0cuCzE=;
        b=UaAI3LNW/aPA2xdBRXXJ9MvD2/jtGzmQCC6Zx3vn/+gphh4sPJ05hqtrzmbPxPFWAh
         BhnIw8B8/m1ugMKVcQTaRUJzANXbDe+jAoy0dd1YRb/2IKEWcGNIhWgku7rDyMbNn3Uk
         7SxZ+jGKi1NTyEjjWRJKr/8NVGTjA9FbLp1ugkbqLXF/XUtdc19ec/M+9y0NJ/zDUAXe
         Pmf5akK4uJPhGyDoDJX4oZezrGWHRVekiTd0FmiTyG8xVTuK8SJ6LC7PTlAGB8tZXqrY
         zzfP/q4dxVuvyJNgWRO5vM56G/DT7gLGAuhrrnCqfNO8enq0P3nKYj56k7UEDb5yo+rB
         N28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772802172; x=1773406972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gct6C4Eht5wyc/ZmOWSkz/guh8IEwIRge1zzV0cuCzE=;
        b=SJ60RWwBXkMhh2YqQVEFfr4QusV9GYLAkytosFjzLKcU9cStnPuV7ZoGg2KlrPae3s
         mBmSD/JRm24DIOkfo2Q/hHfwM1pGFJJ/M9R+koLSin+gtbSlEu+hp6/0xRJkGXphn/kS
         Sb7KZVrJ+9NZWwBtVZjG6M9QIz93Q4X5dWRTNOG++Jfeawn2955UfFZ6HzLg9L5ZLQH4
         Qpuk3h977uX+9Y9NZ8pqtMP73Q56nndJew1ca1OJmWdP9Ttx4Yf5gEeXJeCKDNPNE/rD
         UuHgodeezziMaGnXSDSGhXlWErLE2EAQT6AgGkrdQg7CM3jT8fnDgjcr6nkvHdHXmFkZ
         pLXw==
X-Forwarded-Encrypted: i=1; AJvYcCUKhX+tVvSw9xVmfaewHxkZFxCYx4YwUii/1S5AVXE3dNgEyDCdEEoE7O9bQW99M8A7kujcbHVVo14HlqIJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzcZbgaufuuWaBCzUnU30cZE7uV1U9nZdVb9ZB4+qLBJYjvA/5x
	+yhmaBFNpI54kbjW8ZQuHOCoRrc6+nw+g7HwrtETwW2X1xvfI+eOeEwe4o3bICRnLNY=
X-Gm-Gg: ATEYQzwNGgUo7hKYdCtwO6l+Z13pB/CvkJgLrR8FpiWEzJ1/TjX2Ij3P7HJSAB5rgl3
	hFRZqJwjafug8myozGtqBZ+B/QfEH2dYOvAy2JS+2C/+u08m5K2+xXDUIOmb6OaBWk9r5YZRlNF
	+keUpJbNwqT/nitT/ZIefWlOvXrUmQoiJiGAOZa7DjjzYMcw93cwlU3n2k9HS8Jq2O7aH6u6K/Y
	A7su/Xc5kVQ/2rLC5BvObExszOp6jzVvHywdj2y4Vu4EH/xRsPTEFivhvacO/2ACbVVUU1AXBa7
	LVuGmNgGn+yqQqJ4v0/9cCzgx5yx3LoZ7Kmgw8S1kWJCnUt9tn4HJ4ujSeLbLVITUaWA6LRu7k2
	H8Zzv8VU8WPP4v/76tRfWrid09njNUm4iihrG8jwbheF383D/P3PMKba4LokLg6c8hl9Tset1l2
	bKynSmRGTwe+MvQhxYZALp+ULiuHjPSYscT+54b40=
X-Received: by 2002:a5d:64e7:0:b0:439:af81:1b21 with SMTP id ffacd0b85a97d-439da118cbamr3302588f8f.0.1772802171875;
        Fri, 06 Mar 2026 05:02:51 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2b9d8sm3776403f8f.21.2026.03.06.05.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 05:02:51 -0800 (PST)
Date: Fri, 6 Mar 2026 16:02:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Richard Lyu <richard.lyu@suse.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: staging: ipu3: img-mmu: fix sign-to-unsigned
 conversion
Message-ID: <aarQeHfQuq20gXH0@stanley.mountain>
References: <20260306104352.629177-1-richard.lyu@suse.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306104352.629177-1-richard.lyu@suse.com>

On Fri, Mar 06, 2026 at 06:43:59PM +0800, Richard Lyu wrote:
> imgu_mmu_unmap() returns size_t (unsigned), representing the number of
> bytes successfully unmapped. However, when the alignment check fails,
> it currently returns -EINVAL.
> 
> On 64-bit systems, this negative error code is implicitly converted
> to a very large unsigned value (18446744073709551594),

That happens on a 32bit also, although of course, the number would be
smaller.

> incorrectly
> indicating that memory was unmapped and potentially breaking the
> caller's logic.
> 

All the callers ignore the return value so it doesn't actually affect
anything.  The commit message needs to say this.

> Return 0 when the alignment check fails to correctly indicate that
> no bytes were unmapped while resolving the following
> -Wsign-conversion warning:
> 
> drivers/staging/media/ipu3/ipu3-mmu.c:393:24: warning: unsigned
> conversion from 'int' to 'size_t' {aka 'long unsigned int'} changes
> value from '-22' to '18446744073709551594' [-Wsign-conversion]
>   393 |         return -EINVAL;
> 
> Signed-off-by: Richard Lyu <richard.lyu@suse.com>

Please add a Fixes tag.

Otherwise, the fix looks okay to me.

regards,
dan carpenter

