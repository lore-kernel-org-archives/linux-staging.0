Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2BC3484
	for <linux-staging@lists.linux.dev>; Wed, 28 Jul 2021 21:37:23 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id k1so4332204plt.12
        for <linux-staging@lists.linux.dev>; Wed, 28 Jul 2021 14:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CSb4kSgsWGnwPSdmUAsGp2plOhe3boBZns6CpvCX17k=;
        b=UD7b+k0QnpbEqBrwR7RmKyAPL+LX2efPXEE8xAEPOaROxpa74DphlMeRfq0kK5A18a
         R3RgQCdfbdW51nC5X3gt63QHFdThGyjiUZPIKZH2fFeYVRH6n2G/NQuwmy/O1jbFLuwH
         DldDZR4AYWg93UqKQOSFRHlCuWA3Y9B3p6jQV+tdqBjDwu+dDlVoIlFwbI/zKGpcTD7M
         41dj4NxJYwX/tj2rfIw60rnQ9X9JawYtsQMPV4zBg7zsQOJ5mKVfMsQpkwpsZFCuru03
         +U/2hvSTHRx/DyHpW5mxhE7z/WJ3QAZiIERcE5J0zvo9Nx0nJIYgFDGRgUD+zwwPKTpO
         jvCQ==
X-Gm-Message-State: AOAM5302S0q9vHMICxKYVLVD+0YJpCy9OS1WHIk93H0RF5+4h4JYbx5l
	yVy83YIJTqjV3jXjHyfj0QY=
X-Google-Smtp-Source: ABdhPJw5p0QU1/9DXFQwrCf2YgZJ7XS/yKllnPERsr0mo2UWH2izSH7CfbWZ1Hd6mKMjMAT0LRhzDA==
X-Received: by 2002:a63:1926:: with SMTP id z38mr816981pgl.451.1627508243326;
        Wed, 28 Jul 2021 14:37:23 -0700 (PDT)
Received: from bvanassche-linux.mtv.corp.google.com ([2620:15c:211:1:3328:5f8d:f6e2:85ea])
        by smtp.gmail.com with ESMTPSA id o8sm693212pjm.21.2021.07.28.14.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jul 2021 14:37:22 -0700 (PDT)
Subject: Re: [PATCH 01/64] media: omap3isp: Extract struct group for memcpy()
 region
To: Dan Carpenter <dan.carpenter@oracle.com>, dsterba@suse.cz,
 Kees Cook <keescook@chromium.org>, linux-hardening@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Keith Packard <keithpac@amazon.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev,
 linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org,
 clang-built-linux@googlegroups.com, nborisov@suse.com
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-2-keescook@chromium.org>
 <20210728085921.GV5047@twin.jikos.cz> <20210728091434.GQ1931@kadam>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <c52a52d9-a9e0-5020-80fe-4aada39035d3@acm.org>
Date: Wed, 28 Jul 2021 14:37:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210728091434.GQ1931@kadam>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 7/28/21 2:14 AM, Dan Carpenter wrote:
> On Wed, Jul 28, 2021 at 10:59:22AM +0200, David Sterba wrote:
>>>   drivers/media/platform/omap3isp/ispstat.c |  5 +--
>>>   include/uapi/linux/omap3isp.h             | 44 +++++++++++++++++------
>>>   2 files changed, 36 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/omap3isp/ispstat.c b/drivers/media/platform/omap3isp/ispstat.c
>>> index 5b9b57f4d9bf..ea8222fed38e 100644
>>> --- a/drivers/media/platform/omap3isp/ispstat.c
>>> +++ b/drivers/media/platform/omap3isp/ispstat.c
>>> @@ -512,7 +512,7 @@ int omap3isp_stat_request_statistics(struct ispstat *stat,
>>>   int omap3isp_stat_request_statistics_time32(struct ispstat *stat,
>>>   					struct omap3isp_stat_data_time32 *data)
>>>   {
>>> -	struct omap3isp_stat_data data64;
>>> +	struct omap3isp_stat_data data64 = { };
>>
>> Should this be { 0 } ?
>>
>> We've seen patches trying to switch from { 0 } to {  } but the answer
>> was that { 0 } is supposed to be used,
>> http://www.ex-parrot.com/~chris/random/initialise.html
>>
>> (from https://lore.kernel.org/lkml/fbddb15a-6e46-3f21-23ba-b18f66e3448a@suse.com/)
> 
> In the kernel we don't care about portability so much.  Use the = { }
> GCC extension.  If the first member of the struct is a pointer then
> Sparse will complain about = { 0 }.

+1 for { }. BTW, my understanding is that neither the C standard nor the 
C++ standard guarantee anything about initialization of padding bytes 
nor about the initialization of unnamed bitfields for stack variables 
when using aggregate initialization.

Bart.
