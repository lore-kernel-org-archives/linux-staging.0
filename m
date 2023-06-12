Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8ACD11CAD
	for <linux-staging@lists.linux.dev>; Mon, 12 Jun 2023 10:53:11 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5149429c944so7344631a12.0
        for <linux-staging@lists.linux.dev>; Mon, 12 Jun 2023 03:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1686567190; x=1689159190;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8SLBrnwbHCvnK+EhlE8eJ/+pq9MyO6Q+aOHOn+73hw8=;
        b=I4Jo53AtXKUAWujuX6TPrsPzylsWLanXZel9thkXkSIXOVui0kQwzZh7YdgZmor2Jt
         tf80rFrTpAgnDS6xkg4Y4x6JU6myT/iURXuMuHmCcitBuH5EU/XswWhVMDm6BPH7P2nw
         YALTxnobGGv+uPJIXW5C/Hq8IwS3T/UAFliuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686567190; x=1689159190;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8SLBrnwbHCvnK+EhlE8eJ/+pq9MyO6Q+aOHOn+73hw8=;
        b=RxEPbf7i2DGnW8CJ9ocHevQmRaFxzLD1H7MdX2lfog2BTb5ab2v4w1RF9jEyK3BPc1
         HkGqStvRsUGpuNUnXC/MIcCHU7BwxuMjFtYKYsvT4iPJ1krpoYiGQ1KANWcepAuR2WEe
         7DowawLyv8qwOPYKw1s0ZRvEhZaaFJ8PbL2Ra9U4OKi54nCD3WZ1oU2SjSlGWufq3jjp
         kqZAYlspR5nRWfjdOAOeafW57hm3HavRxk+QzVG1mMomL0wn+Fc9k5UPNOOsQcmSRddP
         RpaVv6KpeZ5kmtPkiYyBc6WjQt0VSxDKFcloGIAVSKOzWVpX77Im/1eRz4yLlMyh11py
         3YZQ==
X-Gm-Message-State: AC+VfDyPo9fKFAH/+L306XwWGetHI48fiNyCBWN6A51KklLT3ggR3c0U
	x6H8vJ/V6oswcLJBrzlp9/z01w==
X-Google-Smtp-Source: ACHHUZ7U3uNm5on+y8jIMuDZ1cfGc9aiIN8XESopyRzBAdqMM/RLAE//onmpwNxNuERJC8T8wQeJ7A==
X-Received: by 2002:aa7:d40e:0:b0:510:8ee2:2b05 with SMTP id z14-20020aa7d40e000000b005108ee22b05mr5081219edq.38.1686567189783;
        Mon, 12 Jun 2023 03:53:09 -0700 (PDT)
Received: from [172.16.11.116] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id g20-20020aa7c854000000b005169cd0edffsm4876752edt.35.2023.06.12.03.53.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 03:53:09 -0700 (PDT)
Message-ID: <96b45245-bdd8-119d-e7a9-44eb36be0f97@rasmusvillemoes.dk>
Date: Mon, 12 Jun 2023 12:53:06 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/4] vsscanf(): Integer overflow is a conversion
 failure
Content-Language: en-US, da
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Lee Jones <lee@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Petr Mladek
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20230610204044.3653-1-demi@invisiblethingslab.com>
 <20230610204044.3653-3-demi@invisiblethingslab.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
In-Reply-To: <20230610204044.3653-3-demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/06/2023 22.40, Demi Marie Obenour wrote:
> sscanf() and friends currently ignore integer overflow, but this is a
> bad idea.  It is much better to detect integer overflow errors and
> consider this a conversion failure.

Perhaps. And maybe I even agree. But not like this:

>  	while (*fmt) {
>  		/* skip any white space in format */
> @@ -3464,6 +3474,9 @@ int vsscanf(const char *buf, const char *fmt, va_list args)
>  			break;
>  		++fmt;
>  
> +		allow_overflow = *fmt == '!';
> +		fmt += (int)allow_overflow;
> +

You can't do that. Or, at least, you won't be able to actually use %!d
anywhere, because the compiler will yell at you:

lib/vsprintf.c: In function ‘foobar’:
lib/vsprintf.c:3727:26: error: unknown conversion type character ‘!’ in
format [-Werror=format=]
 3727 |  ret = sscanf("12345", "%!d", &val);
      |                          ^

So NAK.

Also, when you make significant changes to the sscanf implementation,
I'd expect the diffstat for the patch series to contain lib/test_scanf.c.

Rasmus
