Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E813481
	for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 23:31:06 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id a4-20020a17090aa504b0290176a0d2b67aso7186775pjq.2
        for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 16:31:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cfNumURh2GjYDfPowtmTPayG3eiC6vg99u71kmeqTyM=;
        b=gnHqPiBR1K7CKD8gGEEhXC+Cyim1KWSDs3LAfckz9l7TYSHcE5xl2B++ZNvs5IRfca
         oP1VDOhgtiVUVCJ1mer1xmGWe3JvQmLg4htu5/RUhT06YKkBQ1JeE4v/4ZEaimJV1RZ1
         /ffZSPykJteckviXl/bsgM/4wDngXavrOgkvp6g8xnNUR5fK1ARPxaaKCvwjS3WnDZpl
         r6kjd4ADx5ugfnKjHGFmaW2huHelbQ73zEx75r4kPvNbt1US9scIDTbhjgd3iUglrX0W
         BvRu8IxqaYVIkZbvjeFp/08C8+MXJQTHY11MCMovGqsMfQL1+tKc8QT0h1e/PWy+aMnm
         7mPA==
X-Gm-Message-State: AOAM532KVazmEuKqgYGuZgbm13WTaXzA1kO4NehvhaVcu36J0OHIbDge
	glWrPlt0eFUoArORd1EqQU0=
X-Google-Smtp-Source: ABdhPJxjlXDVaN8+tg1bxudbyKmetnxeWdVqGkL064ebMKIBrwhnuUBgPMqLVVo86W/q+KmaVUhOyQ==
X-Received: by 2002:a17:902:8493:b029:12c:552f:1fb1 with SMTP id c19-20020a1709028493b029012c552f1fb1mr2088759plo.26.1627428666440;
        Tue, 27 Jul 2021 16:31:06 -0700 (PDT)
Received: from ?IPv6:2620:0:1000:2004:f8ef:f6a:11cc:887d? ([2620:0:1000:2004:f8ef:f6a:11cc:887d])
        by smtp.gmail.com with ESMTPSA id j12sm4695249pfj.208.2021.07.27.16.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jul 2021 16:31:05 -0700 (PDT)
Subject: Re: [PATCH 33/64] lib: Introduce CONFIG_TEST_MEMCPY
To: Kees Cook <keescook@chromium.org>, linux-hardening@vger.kernel.org
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Keith Packard <keithpac@amazon.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev,
 linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org,
 clang-built-linux@googlegroups.com
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-34-keescook@chromium.org>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <9827144a-dacf-61dc-d554-6c69434708de@acm.org>
Date: Tue, 27 Jul 2021 16:31:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210727205855.411487-34-keescook@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/27/21 1:58 PM, Kees Cook wrote:
> +static int __init test_memcpy_init(void)
> +{
> +	int err = 0;
> +
> +	err |= test_memcpy();
> +	err |= test_memmove();
> +	err |= test_memset();
> +
> +	if (err) {
> +		pr_warn("FAIL!\n");
> +		err = -EINVAL;
> +	} else {
> +		pr_info("all tests passed\n");
> +	}
> +
> +	return err;
> +}
> +
> +static void __exit test_memcpy_exit(void)
> +{ }
> +
> +module_init(test_memcpy_init);
> +module_exit(test_memcpy_exit);
> +MODULE_LICENSE("GPL");

Has it been considered to implement this test using the Kunit framework?

Thanks,

Bart.


