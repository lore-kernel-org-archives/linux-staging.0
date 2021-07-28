Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AB270
	for <linux-staging@lists.linux.dev>; Wed, 28 Jul 2021 11:24:04 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id f12so2670021ljn.1
        for <linux-staging@lists.linux.dev>; Wed, 28 Jul 2021 04:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Wg+3/RRWhlXAdTdGrz6ZDOoqwDjAalfDgSMGfZRFy7c=;
        b=MqB2oQJrWErl4M3jysGVniDJ4xARTYUEk892vt+CXTsOghQBHfw+ROqpA+FWeMfNAw
         99HiHQl9pgCodpNZVcjBeusKVj1g8kcdEIy/ZsV7LY738G0Iid6EaBW2zhaAmZdiUtKc
         pOnrw2np1M0KCLNrhvFVpkrx8b6JNzJx5ukHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Wg+3/RRWhlXAdTdGrz6ZDOoqwDjAalfDgSMGfZRFy7c=;
        b=NlGmY+2yy4G/TjGnqcfaauwE3J43H9iMvx86AQNiXol+TMA67S2pjklKkIlJxpJRjt
         1QVJ8pkzB1bT5nK0gKTo6QoURKvRrUkjL3rsei1sKUeY9nw5WskWw7Amd3ErTIXHWArV
         GD10XMGsp1ra5qoPhvqSYVxExYmtq61uuCsDFxw530/2umS0VTuVVbyY6E5tenMC139a
         yzjILbWMIkHtoxQKqZgiFsVpzW+N/RFApih800lNHRAQB9xNcSAzv8R7OR06XkD7QcW/
         2HUz7DwLeH3XY7KNvf0BaHnjFbA7Zk4iq7vGCrVW6QYEVmg6xQsehbUUS07UwQfoXN9t
         U3xw==
X-Gm-Message-State: AOAM533D0C3ryWXZZx7Q2wxoT6hkAUNoB7gRBJjd5kTIt1mJpyGjiq0Y
	a0uewgdRhIRpU5ksKRdgIoJkEA==
X-Google-Smtp-Source: ABdhPJzbJpuLwTQcj/uhUJ1FDab/S8wsNFZGfZq+HhHIgh+eTtqaebX9Ee+tEB7aFHczhnUT7I/eLg==
X-Received: by 2002:a05:651c:124f:: with SMTP id h15mr18566268ljh.4.1627471443108;
        Wed, 28 Jul 2021 04:24:03 -0700 (PDT)
Received: from [172.16.11.1] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id f14sm494569ljj.116.2021.07.28.04.24.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jul 2021 04:24:02 -0700 (PDT)
Subject: Re: [PATCH 62/64] netlink: Avoid false-positive memcpy() warning
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kees Cook <keescook@chromium.org>
Cc: linux-hardening@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Keith Packard <keithpac@amazon.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev,
 linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org,
 clang-built-linux@googlegroups.com
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-63-keescook@chromium.org> <YQDv+oG7ok0T1L+r@kroah.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <d7251d92-150b-5346-6237-52afc154bb00@rasmusvillemoes.dk>
Date: Wed, 28 Jul 2021 13:24:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YQDv+oG7ok0T1L+r@kroah.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 28/07/2021 07.49, Greg Kroah-Hartman wrote:
> On Tue, Jul 27, 2021 at 01:58:53PM -0700, Kees Cook wrote:
>> In preparation for FORTIFY_SOURCE performing compile-time and run-time
>> field bounds checking for memcpy(), memmove(), and memset(), avoid
>> intentionally writing across neighboring fields.
>>
>> Add a flexible array member to mark the end of struct nlmsghdr, and
>> split the memcpy() to avoid false positive memcpy() warning:
>>
>> memcpy: detected field-spanning write (size 32) of single field (size 16)
>>
>> Signed-off-by: Kees Cook <keescook@chromium.org>
>> ---
>>  include/uapi/linux/netlink.h | 1 +
>>  net/netlink/af_netlink.c     | 4 +++-
>>  2 files changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/uapi/linux/netlink.h b/include/uapi/linux/netlink.h
>> index 4c0cde075c27..ddeaa748df5e 100644
>> --- a/include/uapi/linux/netlink.h
>> +++ b/include/uapi/linux/netlink.h
>> @@ -47,6 +47,7 @@ struct nlmsghdr {
>>  	__u16		nlmsg_flags;	/* Additional flags */
>>  	__u32		nlmsg_seq;	/* Sequence number */
>>  	__u32		nlmsg_pid;	/* Sending process port ID */
>> +	__u8		contents[];
> 
> Is this ok to change a public, userspace visable, structure?

At least it should keep using a nlmsg_ prefix for consistency and reduce
risk of collision with somebody having defined an object-like contents
macro. But there's no guarantees in any case, of course.

Rasmus
