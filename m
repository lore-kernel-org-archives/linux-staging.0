Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACDD70
	for <linux-staging@lists.linux.dev>; Thu, 29 Jul 2021 01:59:11 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d1so5067465pll.1
        for <linux-staging@lists.linux.dev>; Wed, 28 Jul 2021 18:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/EMnvbg1lkcKUNHoTGAUlLRl80RwVqD1WDQs78+Ryng=;
        b=tts5OVeDAlioaCuUnNaxkd3+7TDtOFTCcvGYA3fcmNmziKsDumzofOfiUDUwj2BhQI
         05v+o7i/rY1F75stXvrNpNBc8+NsbqAWm9yhKV/qAb9oIOS6SF45rSIf0kluDmctmcvz
         MHjTsS61mgXKynXRMOosH9wEIkJAD70e3W5FY8TSGY1ao8sTiYDHAhqOW1MN/QLCnGR9
         2E6Mw3W44zmeaX9InQ0MAtzx0L7IJlpWzhUwW0GBBYRwDRTyVX8cPYhRyt9XI+m6E4Bo
         ZIJy56qqgHmDYgrkL+hIoeGHIe54nFKYR+tQoB6ZtpTa9PsGXRx0x0msWt7K84wjhVsN
         K0CA==
X-Gm-Message-State: AOAM531sAMhix0nC/JXqiVBsx5n3qALF4VMDMrkoXqtrfr2rsno+eFqF
	6Z69+d5CXTDMwsZuX+Iy11U=
X-Google-Smtp-Source: ABdhPJwy46rGfGzBPHT0dDc2OF3JHAeIdHBXsVA3/Hjfoi4OURPDSpbVi+xEgy37JuU2Z3C+YFQFpw==
X-Received: by 2002:aa7:93dc:0:b029:328:d6c9:cae7 with SMTP id y28-20020aa793dc0000b0290328d6c9cae7mr2579458pff.53.1627523950822;
        Wed, 28 Jul 2021 18:59:10 -0700 (PDT)
Received: from ?IPv6:2601:647:4000:d7:9eeb:60dc:7a3c:6558? ([2601:647:4000:d7:9eeb:60dc:7a3c:6558])
        by smtp.gmail.com with ESMTPSA id z16sm1344383pgu.21.2021.07.28.18.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jul 2021 18:59:10 -0700 (PDT)
Subject: Re: [PATCH 19/64] ip: Use struct_group() for memcpy() regions
To: Kees Cook <keescook@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-hardening@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Keith Packard <keithpac@amazon.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev,
 linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org,
 clang-built-linux@googlegroups.com
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-20-keescook@chromium.org> <YQDxaYrHu0PeBIuX@kroah.com>
 <202107281358.8E12638@keescook>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <45855f4f-f7cf-b7b3-bcd6-c9ebc3a55c64@acm.org>
Date: Wed, 28 Jul 2021 18:59:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202107281358.8E12638@keescook>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/28/21 2:01 PM, Kees Cook wrote:
> On Wed, Jul 28, 2021 at 07:55:53AM +0200, Greg Kroah-Hartman wrote:
>>>  struct ethhdr {
>>> -	unsigned char	h_dest[ETH_ALEN];	/* destination eth addr	*/
>>> -	unsigned char	h_source[ETH_ALEN];	/* source ether addr	*/
>>> +	union {
>>> +		struct {
>>> +			unsigned char h_dest[ETH_ALEN];	  /* destination eth addr */
>>> +			unsigned char h_source[ETH_ALEN]; /* source ether addr	  */
>>> +		};
>>> +		struct {
>>> +			unsigned char h_dest[ETH_ALEN];	  /* destination eth addr */
>>> +			unsigned char h_source[ETH_ALEN]; /* source ether addr	  */
>>> +		} addrs;
>>
>> A union of the same fields in the same structure in the same way?
>>
>> Ah, because struct_group() can not be used here?  Still feels odd to see
>> in a userspace-visible header.
> 
> Yeah, there is some inconsistency here. I will clean this up for v2.
> 
> Is there a place we can put kernel-specific macros for use in UAPI
> headers? (I need to figure out where things like __kernel_size_t get
> defined...)

How about using two memset() calls to clear h_dest[] and h_source[]
instead of modifying the uapi header?

Thanks,

Bart.


