Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C9B513D3
	for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 14:39:51 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4056ce55e7eso111260055e9.2
        for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 07:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695998389; x=1696603189; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g0n0edkpamdnggcIL12+CfmK30X8YtzkvBLd1C9oNcw=;
        b=yHvfDNOtO4Khqu9JvOGidhMw5N0J+QGT3A5hwJlQBla1vfxc7ZnhWquMwcjr4/8FvZ
         XyzrRvkfTon7/Xyzji1wTyqKJaxCJuRR+ueer3ZXw0OF/WclKugPCPPpB49S5t9XteCx
         RNV6+Z8Ubxavo6VU05sDybn9qaXIZwoXKhNBkDQ0XUD4mYper5ZHFVpTdX5RRomqwKpU
         B2sjWfhn6skiTz7fzr0xr8axuYnYaOZ7BfgHDI9VZsDw9CwzgkYu+Phi22l+6BNek80+
         l2rKgrf5MP5kMMEQMw8rxtAMnxvz32aUJBt7UFdxToKDBEKoOxUuAUsxekOp54j7fd0Q
         cSAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695998389; x=1696603189;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0n0edkpamdnggcIL12+CfmK30X8YtzkvBLd1C9oNcw=;
        b=JwDtXfWQGxrxrfuVR8wChUdUn+WYOf0dmA2ynNDXaVri7TOE0/4YsNWXMsg/A1ry69
         15y9tbsIem59REVUmnZMga8jSOdiThXBqRuIKcWGSk6rjREGuuwaZmW4GjWMhTTe8lWr
         qvuH3nPXavmh7MYxkzivaf8PjjrT1H/dZEK/cZXp0p6zht7w30H4+kE6/hgZvu4L4ST9
         EZrbfcRfF9om+vCqJR+FUMOW/LcYuv8L5aSqI/coRalDaakOMr5xgjxfWk8Ebx2LkDJs
         QudVPS/DuRYFoCu4ulR8Gb+X6gDzXkZtkK9Lk11A/NsaIt4uBERWX4LRtlC1xM0wAN2m
         11JQ==
X-Gm-Message-State: AOJu0Yza7q3rGKKXAHvWcQPMc9DLAeRyrBf9jkafCooRdz/ryHcCdLyy
	PXIMmbrad612r5x6QnU3ke4MDw==
X-Google-Smtp-Source: AGHT+IFoAUwDv0XK2dj73ZcFMz7DCZ16csYuvmZltRzNzDRjW81zJcU5aferUNM8qkUyXoNv8CSNJQ==
X-Received: by 2002:adf:e7d1:0:b0:324:885f:f7fd with SMTP id e17-20020adfe7d1000000b00324885ff7fdmr4221888wrn.15.1695998389377;
        Fri, 29 Sep 2023 07:39:49 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x11-20020a5d650b000000b00318147fd2d3sm21646483wru.41.2023.09.29.07.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 07:39:49 -0700 (PDT)
Date: Fri, 29 Sep 2023 17:39:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>,
	linux-mips@vger.kernel.org, linux-staging@lists.linux.dev,
	Oliver Crumrine <ozlinux@hotmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: next: mips: cavium_octeon_defconfig failed -
 drivers/staging/octeon/ethernet.c:204:37: error: storage size of 'rx_status'
 isn't known
Message-ID: <511073d8-3292-4914-9bcc-8c9acefe3b9a@kadam.mountain>
References: <CA+G9fYvVETLEtiZ=MFRrxgXpmgirVHz-tDOxhU=7_9dtmx7o5g@mail.gmail.com>
 <ccc85f1b-e932-4aa1-81c2-185df391fe82@kadam.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ccc85f1b-e932-4aa1-81c2-185df391fe82@kadam.mountain>

On Fri, Sep 29, 2023 at 05:18:31PM +0300, Dan Carpenter wrote:
> This is weird.
> 
> I managed to reproduce this once but couldn't reproduce it again after
> that.  It seems like an intermittent thing to me.

Nope.  I'm just dumb.

Commit b33a296d8311 ("staging: octeon: remove typedef in structs
cvmx_pip_port_status_t and cvmx_pko_port_status_t") updated
drivers/staging/octeon/octeon-stubs.h but didn't update
arch/mips/include/asm/octeon/cvmx-pip.h.

I can send a patch for that.

regards,
dan carpenter

