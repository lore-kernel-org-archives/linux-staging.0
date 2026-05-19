Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D6A4028CD
	for <linux-staging@lists.linux.dev>; Tue, 19 May 2026 14:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779199570; cv=none; b=tKvtTjX32ZMhQ8meLanHUSL+LJc7uGdF6KIyS6HQCo7r5ZTJVIOUkzJS5ZXrpyVjy+UbEdX+FoqRhj1f2BtqDJ7sgHKe+ORbNMWMYwHgRrCB1yZwTR5UOmPdjGVUgbOwNba9u0539v9JIgi5qs60G4h0GdkhpoRLD6skbJUVgm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779199570; c=relaxed/simple;
	bh=o+Q+vmvCMJI2JaJKKyxQuVALSNyi1mjv8KkhERwNL30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bsT9/ejZZfx1z+cPolFM+tfVUqHTF1DAizbZSIId4ojlvr6lqLPV9BwfjjIxzZ8F3W+YtvYgWgpKXC49BcE2FtChnvtYeSFfGm7yFD6MKo8tKfqmQ0pW8xTV/ljesb81ZGK8vjqnhxPIRq8hpabUSGND8LLTL9ild+KHCDX6iOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AC5sf8v+; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AC5sf8v+"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso30911145e9.2
        for <linux-staging@lists.linux.dev>; Tue, 19 May 2026 07:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779199565; x=1779804365; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pGtrp0IAf6lashkErUO9lfdTdCzLqP0NgVEXHzjtG90=;
        b=AC5sf8v+6oGN4QXWtHS+H7pXgQ5xW7sFiee/+fpjxQyGdeLRvmvHz5OLIL9yImLZQu
         Q8J5zTVbVh7By/KvcP7/2xJwZxGkGQIIurDS2WRN3uOlsBFQTAsxKimm8LQFqwaLuzp9
         iYmwK2LEnGQ/+0+yoMlindao+p8yL8dKG0Kd0AhApP05TB+q4DkpNGPev28ATxHvXH+B
         fWO83gVXJKyPUy3L81zuG66rKJsj+VWX9H/p2hkRyAAGkYqyJxAsZ0qtTJpY323t6L+N
         gSbOQTC45R3Z4kBAnUd7PSrhlQjhWgHaLONIIk/Tgvvbj4j021NnIegmVRviG3mvxKW8
         bMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779199565; x=1779804365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGtrp0IAf6lashkErUO9lfdTdCzLqP0NgVEXHzjtG90=;
        b=DmtiR/yrow2F5wKJ/ks9gV1WhuPnHnv2/kJtgCk+z8Dhs1rFnSPdIkTUGEICt7vPhm
         CPFZKhK1aLTYSSr8UHj/ZL4gHiwRZV+/kgVXv9M6QMMJxFUWPryZHgHLZoYoBiCvtN4p
         68m+Qqy1MC31JBXhmQScQCMBaGdIG/CSfW5OUBZuDgZkAQbl7UQiy1p3b0Do8WECiQzM
         P3vKp1s8/qtApgwX0Y/NO80Tizhi3hqwIh5AfV5tJAN6erP95VwIVT0FRKDRzHEizdUs
         48yKDx4S7tA3QFv2Op05YIRB+y/iciicYQBHmZlr9YHSuih3PQE0t7A0G6qDMaiAvdns
         yeqA==
X-Forwarded-Encrypted: i=1; AFNElJ8h2BAnp82p+pJzV+FtQb2QhLQnbhp+M6DVHUgBcoWmStDYdAInAB7UT+bwc+68UX8cUl8nq44CUSqvvmXf@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4QbqQ8RQL8EwiBzSex9suIAbGE4S+6rTInGIVPqZk35cvKq5s
	/7Xl2TG7VHcCjbaZkUMvbCpNVtie5COWRq6pTwmdpaYrBV+rTm647P0K
X-Gm-Gg: Acq92OG1nLl9Gson+4OJz9mmvl798ifa5kegQZH8k7bIPif7I94iB5SlnTgkH/sK2vo
	VywS3Y91CcaFGgBZlX92GUlIF0kli2sZDwifS/+miT3xzixaOsjcWjauY3ml7o/faWl1SzezM1X
	f52/S1A/naQYk+jmDV4Lt9/ZQcLPn+po9tT8ZhG6PwoGiItyHc2K80gMJVh+b7DuMiRBwI5SE/M
	tRG2IO9tGwff32scaatNAfbQLF6L4Md6HMaGGNps1N/ZAWZunmbkQUYzz70rZBWazC11J2zoRwL
	HaQCI3Af6ttSOAXVHbM5UYYLZc2jy/ney5dyr1xucvtVtQC6foIXIIhvI9RI9hNS34tTREDBJVv
	MCv/xw6Q4zyY1v7iL94A2LWqQTjNWqLN31hgrOs1j5FzisWmtkP1nPOYNJBDCD9pf0uQUfSSjor
	5MSyxDd+zyiQVnDC2M9/ISDPPf3tBRKlwEAA==
X-Received: by 2002:a05:600c:4fcb:b0:488:a797:f0ac with SMTP id 5b1f17b1804b1-48fe6613ab3mr293317915e9.28.1779199564532;
        Tue, 19 May 2026 07:06:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febf81970sm153801075e9.8.2026.05.19.07.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:06:03 -0700 (PDT)
Date: Tue, 19 May 2026 17:06:00 +0300
From: Dan Carpenter <error27@gmail.com>
To: lixinyu <xinyuili@126.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] staging: rtl8723bs: add missing spaces around
 operators in rtl8723b_hal_init.c
Message-ID: <agxuSN4ZIVKzF9zI@stanley.mountain>
References: <20260519090114.828918-1-xinyuili@126.com>
 <20260519094633.869233-1-xinyuili@126.com>
 <20260519094633.869233-3-xinyuili@126.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519094633.869233-3-xinyuili@126.com>

On Tue, May 19, 2026 at 05:46:33PM +0800, lixinyu wrote:
> Add missing spaces around binary operators (|, &, +, >>) to comply
> with kernel coding style. This includes spacing fixes for register
> offset patterns, bitwise operations on function arguments, array
> index arithmetic, and bit shift operations.
> 
> Assisted-by: Claude:claude-4-opus
> ---

Wait a day between resends.

Read the email I sent earlier again.  Use checkpatch etc.

regards,
dan carpenter

