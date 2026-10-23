Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792747662;
	b=2LDerGsh7ENDu9+8lBSPZpAkeWmDQpKgPr+5lobJQWLiy9yh+EB11/gUa/1mWi1Sg4hC
	 AzjBwEQ3aAfQ5X9FeB9qf/LT+E+YP6wMa3+MEiJv5InKqZoIvbYW8OHZscF2VFL2q68Zf
	 SffMHrEye11PtKv0keDoUsyBJ+8kf9W6tuAL9pK0MEV694xmlXdkXuhcpp7DBH1DKLyNQ
	 vh4A0cBhUG1yhimhUgkpQ99BLKDzpB75Kcq6x92f8oXnSuOoLW0T51hJi4S7ZILsydHfo
	 c2l/QqFZVEmUvwPUaTjdiIPYe9i75eJGac4OykSHp0pjiJHaxa+rs59tfFhC/Ts65hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+fUXMnJyYBF3E1oHzRTsHF3mKjU41vSGgO+ygbzsi24=;
	b=M7JeofvRWmG9VCbdKUst1Fsjyd7ZQl5TFqNOryLSNK+6O8nIr+OYB/gQ1P01dq7kCDXj
	 vo6wrL0IW4sS6UPSbGpp7pb2zofR/k1Hig82jok18lBC8c21F2kDjiRYZ24HzdtKdEWXs
	 FZHoPauhZU4t6hL7LLUt1dvZq9s6SHNeTpaPnAZAcdzW1wZL8bkOySh68nkXKCc/9lx6J
	 ysf0Xu8UckFsUKTNOqtRLDkhGWDRIYcrJojIXzPs327XsSVOVDhyPJG779LRp41ksRfix
	 0pNL7dIoEWvWACUcNO4go72tpWUzMLuBJpFDnq32jlFiaSP8H6tfYO8VnA7NqB+EUSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R+R+UA49;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07064606A31A
	for <linux-staging@lists.linux.dev>; Fri, 23 Oct 2026 09:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07064606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R+R+UA49
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso462281f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 23 Oct 2026 02:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792747660; x=1793352460; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+fUXMnJyYBF3E1oHzRTsHF3mKjU41vSGgO+ygbzsi24=;
        b=R+R+UA49lCUNlKLb6xbTjvTZRLaK1s5rimELVQ4n7SNhBgh6b/BkGiZBpjZ/wDJchJ
         UaLDYp6znbwJwWWCTnuZMZsTDvqL28mC6CDC9hdFWllI8skioq+FCAaD7j/S7d25Uxdt
         bew/e4YU2TwS7BiPg5rP36mEm7OWdOtlSTH25nEmvoU0AZoGSnS1i+DgyUYsc0lczmmb
         g5IxIS2/sx1+CS/fIMTJkoQy4EeStUXfoyySpQcr/GqlFmrgs4VO3YHP3CrofA/FibZx
         0Nm6JHXiHY65fK9b9U9de0A9wAIRzzKOflqvRYrfGCjMCsV35n8YhmDyIGq8pTD8ebDs
         aUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792747660; x=1793352460;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+fUXMnJyYBF3E1oHzRTsHF3mKjU41vSGgO+ygbzsi24=;
        b=CwNa3g+AbtgEJMavLqr1xIEu5S3lsCsaMXqzCvS0zNQRzRtHrS5fteESv6zjfV68S1
         TzwTMaRu1KhoJc0BrLy4KgeOCTwp9P7RT/QRZzeU5w761M3fuI+ZcidQonYykhg/7NNG
         /IwYqDeo2rx6Yffm6iZpxvQqX0OERaxkUjovrylEypFr1j/hlZOb+/epvUyNR1NYn58O
         +7oD2W9t36Fb3o/Q+faiaLlbQtbSarEMRU6MvHaMiGJZXxwXqAk0fgIGBXd0+qsBL0w/
         RuAIHkIjrQYg2+Y4hJXXmcpW6V2579C2zCuwq+jWJInDL5ahJmEglF1XoGu0DyMqo4hk
         HdyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGuCoHwzHgdvCHIy2ecdKHo5KT5Q8l0V0ZnGKJ2OykM4L/W97VQJqD5b5Z6yodX/Hsknz2eHFmBVlCfOsn@lists.linux.dev
X-Gm-Message-State: AFq9FYL4vcBAXWTj2Oxx91Orq53QRTvYYsWr3BOEO9hl/Cf+k68cKELo
	A2XEyGtcbW6jdwXVox20nfYE3N8s8jTx0T0YcgU0fCBMraJx3uu7jzg0
X-Gm-Gg: AYBFou2ptMdjZlrQjrwJxwlEO2TntTqlNAu1C782+SmxfnEDnNbFE5Q7xhNQPa0xzOi
	gBfJ/WArfYoUP0YMOls1yYEpAZYhYxBAO/JV0YhjfJf8gffVgJPmBXxLIs4tXp34BrckTz6SN9f
	Xhzheubo8DSCn8NUHP4ifyYbtIXpo+jJYImrWMJN707t2e7Fy61ym0dx9OoAZa/OkaXs7TOnb3D
	KCn0TTERfMWDrbXijMo9T26SW/4yBldvupggLmeT6sdwkjGZ326ohOC3QHjXWy1dZcPH41AoEf6
	xSdzUcdoo7DPgcA5TrWSvcfgtQZ78AZ2+Pk6KkgsipQ0G8ckS2nUWLYLJLw3CMesmLF1i1QQR5J
	VH0qAbNmkYfHAmJYHaA+s56ho7m/Ws2gTvTYNfrWtucoSR89YAj25s0x7+nSX2IMdsg1Zb/MGZj
	+VvHtP281GSId0LIXbggnwSmW7BVUj17yctLja3jgVei3qzSsIPaMu4gJOEW33skzHpIpPhzeST
	cOGSfhzIVmeQPmEKy1/F7ZTCeXqq8eT11QdkTMzBUUlTYbAV0TG0ycx+RMuNwS9ICjWXCdoJw==
X-Received: by 2002:a5d:4bcb:0:b0:48e:bf0:321 with SMTP id ffacd0b85a97d-48e385a363emr1882446f8f.40.1792747660171;
        Fri, 23 Oct 2026 02:27:40 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38026a7fsm3576709f8f.15.2026.10.23.02.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:27:39 -0700 (PDT)
Date: Fri, 23 Oct 2026 12:27:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: Breno Rodrigues Alves <breno3011alves@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: Fix three real issues
Message-ID: <atsoh8iUsUET-zLA@stanley.mountain>
References: <20261022215349.87471-1-breno3011alves@gmail.com>
 <2026102337-headroom-shun-9d45@gregkh>
 <20261023085200.5206-1-breno3011alves@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023085200.5206-1-breno3011alves@gmail.com>

On Fri, Oct 23, 2026 at 05:52:00AM -0300, Breno Rodrigues Alves wrote:
> Hi Greg,
> 
> You are right, and I apologize for the noise.  No tool told me this -
> it was my own reasoning.  I had the (outdated) impression that passing
> an ERR_PTR parent from debugfs_create_dir() to debugfs_create_file()
> would trigger a WARN in the debugfs core.  That was true years ago, but
> modern debugfs handles ERR_PTR parents gracefully, and I should have
> verified the claim on a CONFIG_DEBUG_FS=n kernel before sending the
> patch.

It's been quite that way for quite a while.  Since Jan 2019.

> 
> The other two changes are independent of that assumption:
> 
>   - the -EINVAL -> -ENOBUFS change in axis_fifo_read(), which changes
>     the errno returned when the user buffer is smaller than the
>     available data;

I would argue that -EINVAL is the most common error code in this
situation.  I would accept other returns as well.  As a reviewer I
would probably leave this up to the author.

> 
>   - the removal of the unused 'struct resource *r_mem' local.

This is fine as a cleanup.

regards,
dan carpenter

