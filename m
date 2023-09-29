Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B94BC8CE
	for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 14:43:46 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-503f39d3236so22478630e87.0
        for <linux-staging@lists.linux.dev>; Fri, 29 Sep 2023 07:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695998624; x=1696603424; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWZEXqBEwKYX+GQWrMus5QxxGKvhA16X4eK3PAc1s1w=;
        b=yh3pn6qOW/BSGTdtdaxzmVQT9udWGaJVMduuTBV8w1jxqrL7ka1OiRvMgt6YcRQ0cc
         h8B3KQ5nDBza5Kt+MBJNXzE2rV9phRPJlYQO/LGrSK5hl7wlZSxSFkmnGgheo0xnZV55
         l0bf2qE+OapyaJNU5klxufhM+wp8fTS8J0xGORlMsQwyxEcS1ZpbanA9qJOtS3wsHs0g
         DJERd1kskRzac0oTPlh6L7oft7hMJHWt7z8HeHRITa+0Ol39d1k/iJIGMp0nLqFnP9TM
         ke6W/eGlAU2w7G3YR31iBHc4pWM5wFdCv3zxJxrHQvXJ5fTR8yZgIxsKXY3VFoZfv17N
         RAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695998624; x=1696603424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWZEXqBEwKYX+GQWrMus5QxxGKvhA16X4eK3PAc1s1w=;
        b=bU1t7LdnQKch6/S26Gro0DFbr1LbsyXU2fjr2W9J9IfLQ0t6ANWnfLyRlIyDe5C6kY
         bsDh/KuF3PjujMoUIP+wl2MYQnEy2qpqpUIQtxTFk+H2OQ5MOXajgRU0cYEoIPFWaqwf
         lWTlNAeb3wZmsO59p+v+cKMfwPFrdpRz5osiElUKyvTKj0UNOgAgYaKsdGBbHsx09lXC
         X5hSkfybmvlgtE8DH0JPkfNLRfVshi2jOzSjENuaD0Xje3i2DvUmhkzXXojC552pIPGd
         wn0cp+mRwASl7vVy54P1XPmB2OJ1oembcE0nQnap5/cDCjwZ2bgGwvFeNLJ3fmA+wjiQ
         bXDg==
X-Gm-Message-State: AOJu0YyMWMbgBnGQCVjfcRQE2KZJYAbATbburzm8zKbuczpzRFGFPMYW
	syoIPYnO0Oys8s76rET4K442gw==
X-Google-Smtp-Source: AGHT+IG7A0is/mCcSJ7Qj3MpBLPxF93Q9i37DM00Npe+atjV+GadUDqyw91BeF5V9llOySb8/nOeJg==
X-Received: by 2002:a05:6512:ea8:b0:500:780b:5bdc with SMTP id bi40-20020a0565120ea800b00500780b5bdcmr4042373lfb.49.1695998624293;
        Fri, 29 Sep 2023 07:43:44 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x13-20020a1c7c0d000000b0040472ad9a3dsm1559213wmc.14.2023.09.29.07.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 07:43:43 -0700 (PDT)
Date: Fri, 29 Sep 2023 17:43:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>,
	linux-mips@vger.kernel.org, linux-staging@lists.linux.dev,
	Oliver Crumrine <ozlinux@hotmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: next: mips: cavium_octeon_defconfig failed -
 drivers/staging/octeon/ethernet.c:204:37: error: storage size of 'rx_status'
 isn't known
Message-ID: <b2da789f-af96-4269-bd5c-54d4cb6f05eb@kadam.mountain>
References: <CA+G9fYvVETLEtiZ=MFRrxgXpmgirVHz-tDOxhU=7_9dtmx7o5g@mail.gmail.com>
 <ccc85f1b-e932-4aa1-81c2-185df391fe82@kadam.mountain>
 <511073d8-3292-4914-9bcc-8c9acefe3b9a@kadam.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <511073d8-3292-4914-9bcc-8c9acefe3b9a@kadam.mountain>

On Fri, Sep 29, 2023 at 05:39:46PM +0300, Dan Carpenter wrote:
> On Fri, Sep 29, 2023 at 05:18:31PM +0300, Dan Carpenter wrote:
> > This is weird.
> > 
> > I managed to reproduce this once but couldn't reproduce it again after
> > that.  It seems like an intermittent thing to me.
> 
> Nope.  I'm just dumb.
> 
> Commit b33a296d8311 ("staging: octeon: remove typedef in structs
> cvmx_pip_port_status_t and cvmx_pko_port_status_t") updated
> drivers/staging/octeon/octeon-stubs.h but didn't update
> arch/mips/include/asm/octeon/cvmx-pip.h.
> 
> I can send a patch for that.

Actually, perhaps we should just revert the patch?  Staging patches
aren't supposed to touch outside of the staging directory.

regards,
dan carpenter

