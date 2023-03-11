Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84EF4C62
	for <linux-staging@lists.linux.dev>; Sat, 11 Mar 2023 19:11:02 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id h5so881397ile.13
        for <linux-staging@lists.linux.dev>; Sat, 11 Mar 2023 11:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1678561861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZioCoGuL3YwXw+MF3EM2JL8+qTfBwtfLWGaTl6x5jLQ=;
        b=RSUbKjognkBRT7p3e1tVQPIGZl9arZtcDYGbJaoXy6BqceesIPes4j93Uv080aXPBu
         7FQlilSshBPQgh9IjPIHnv7FVhBS9UCO4DpR+0XrBwcAAmh+wKaY0pFNfmUcBeLQYtIx
         ahWPJlHDFdXuO8DpKxxi918MyEIGsAB6zGRDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678561861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZioCoGuL3YwXw+MF3EM2JL8+qTfBwtfLWGaTl6x5jLQ=;
        b=n7tXVeLdZ71iNxR4BE3VMe7BmCZ9KRP72B4yc+xoDCauI7MSxh1ycM1Qtgu3UsY0Ec
         p6R8L4hNKq1mUeULfRjqVQyfehYL5mlsUJEeq0pOApjvaKHDyZzrdVqUXZ1XRKs7L/79
         IFh82TQPQMubVzKPLbW9srCIlDDxw2FKA9Wuc9Nw6Y9fgCwksTnzZANJxABeS8ao3wMt
         pK3aRivuyTUyBxw22BzMjBTjakT47qojYxyEiE37yig6u65EkpnV5DVLetiMEfOJl/kX
         A1eW6KduDUV/1RgSmqLB3WVwtaOlocx/OqIfIBVBwphvIjvvDppBlIUeaZYKWmwWSsoz
         2fdw==
X-Gm-Message-State: AO0yUKWPJLuGzXru+4enHUB4D5Yh4R/rkPM2UvjcdnsiaydZC2h21aCQ
	FnZxrUzz9lV/ATB/7cNNJYHISQ==
X-Google-Smtp-Source: AK7set+hLSi+8GKGLrS7dhry3Tso3uhQ0yeYV59tBjqFsQ6XrMFobp350RtzrBzd6EJJQErg+COZ1A==
X-Received: by 2002:a92:d305:0:b0:322:fb69:e47f with SMTP id x5-20020a92d305000000b00322fb69e47fmr1071573ila.15.1678561861525;
        Sat, 11 Mar 2023 11:11:01 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id g13-20020a056e020d0d00b0031796c6d735sm1044391ilj.41.2023.03.11.11.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 11:11:01 -0800 (PST)
Message-ID: <e34f96c7-eee0-6dd6-7662-ffbf04034e27@ieee.org>
Date: Sat, 11 Mar 2023 13:10:59 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] staging: greybus: eclose macro in a do - while loop
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>, outreachy@lists.linux.dev
Cc: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230311135919.9129-1-eng.mennamahmoud.mm@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20230311135919.9129-1-eng.mennamahmoud.mm@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/11/23 7:59 AM, Menna Mahmoud wrote:
> " ERROR: Macros with multiple statements should be enclosed in a do -
> while loop"
> 
> Reported by checkpath.

This is also not an issue that should be "fixed."

If you look at where that macro is expanded, you see
that its purpose is simply to reduce the possibility
of some errors by enclosing some much-duplicated code
in this macro.  The expansion is at the top level of
the source file, so a "do...while" loop ends up being
an error.

When looking at the output of checkpatch, assume it's
giving you clues about problems that one *might* like to
fix.  Its suggestions are most often reasonable, but in
some cases (like this one) it's just not smart enough
to recognize the problem that comes from following its
advice.

Make sure you understand exactly what happens when
you make a change.  That means understanding the
code, and then it means ensuring that the fix passes
at least a compile test, and if possible an actual
execution test.

					-Alex

> 
> do loop with the conditional expression set to a constant
> value of zero (0).This creates a loop that
> will execute exactly one time.This is a coding idiom that
> allows a multi-line macro to be used anywhere
> that a single statement can be used.
> 
> So, enclose `gb_loopback_stats_attrs` macro in do - while (0) to
> fix checkpath error
> 
> Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
> ---
>   drivers/staging/greybus/loopback.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index 1a61fce98056..e86d50638cb5 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -162,10 +162,12 @@ static ssize_t name##_avg_show(struct device *dev,		\
>   }									\
>   static DEVICE_ATTR_RO(name##_avg)
>   
> -#define gb_loopback_stats_attrs(field)				\
> -	gb_loopback_ro_stats_attr(field, min, u);		\
> -	gb_loopback_ro_stats_attr(field, max, u);		\
> -	gb_loopback_ro_avg_attr(field)
> +#define gb_loopback_stats_attrs(field)					\
> +	do { \
> +		gb_loopback_ro_stats_attr(field, min, u);		\
> +		gb_loopback_ro_stats_attr(field, max, u);		\
> +		gb_loopback_ro_avg_attr(field);				\
> +	} while (0)
>   
>   #define gb_loopback_attr(field, type)					\
>   static ssize_t field##_show(struct device *dev,				\

