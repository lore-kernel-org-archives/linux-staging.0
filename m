Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B834B6D28
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 14:35:16 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id c15so17314702ilj.1
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 07:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2rbXicCAr8vD+feC/9JhEPaSLkL44d68CS0R7zJKVxY=;
        b=hEUjns1QGUe9hO2hoejJrRwZPEIjpifBEJDMGjE71lvLMG3wCP4ayf8yeetHwOrBLn
         SZFrt0tVnp6XeO2vmAN20wXb/LfZEFZH5t62jn/mYvVPBf55tw4UixdpuI4TjimH9QiW
         THDaF4uAun6+vww12gQSxvamWIYPqGhQzq4Ko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2rbXicCAr8vD+feC/9JhEPaSLkL44d68CS0R7zJKVxY=;
        b=Cnj+kiR3std/1zS78FZu1BNHvCfflIWVor5JIZhCyhNjAYCt0k8Ss+z366dKJRcdd7
         E2Ur157Yfu4FjEsalZ6vx3uTEHU15mpQT1OCHXtu7n7+/aalZqeBiFnE3Frr5AdFKCAh
         tydMbWNS/Ozb/OQmsPBSMiwp5AQH2wgTQBLeS0Jbdj9nJXUmyoQOuuYyU+5thBNSkLwn
         l/yCqscvPMCPa5iSQnnK+H0hTjNoRQ+esq1WanjSHl6xFOz+3/XUDpjOkKMPaZ/7xKKv
         A+fQsjAUXY1ZfqJp4Md4ol5PpiHa/dJ81TlEOGwQhGkjmDwCfMqKV5FNdcElAGZ+hEw4
         BBOw==
X-Gm-Message-State: AOAM533oBlAMfloZPqnvazBlMFo26VQtEGWMtsazH8CMFySjVNNchvGl
	gXQhMGk+WxWH6UjRVYUcxhVuqg==
X-Google-Smtp-Source: ABdhPJxgAKwab2DYZQHYvNRaf7til72OiIr8070gbCI5ZDj1UeVcKG4GIweVUT0I9E7hmkBo64gmkw==
X-Received: by 2002:a92:ab01:: with SMTP id v1mr29484106ilh.230.1618410915925;
        Wed, 14 Apr 2021 07:35:15 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id o6sm8257245ioa.21.2021.04.14.07.35.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Apr 2021 07:35:15 -0700 (PDT)
Subject: Re: [PATCH] staging: greybus: Match parentheses alignment
To: Joe Perches <joe@perches.com>, Greg KH <gregkh@linuxfoundation.org>,
 Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
Cc: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy-kernel@googlegroups.com, Dwaipayan Ray <dwaipayanray1@gmail.com>
References: <20210406124259.GA96537@zhans> <YGxhrLZPIPjILWUH@kroah.com>
 <7d7be8bcc0e80d826083890ed7791070ad25e603.camel@perches.com>
 <1607b040-6bc4-9a58-ae81-4ea0adf5885d@ieee.org>
 <b22ffa716ee871f7e09ad7321213a897156edab0.camel@perches.com>
From: Alex Elder <elder@ieee.org>
Message-ID: <78c88472-9ed9-bade-407c-23bd557f19bb@ieee.org>
Date: Wed, 14 Apr 2021 09:35:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <b22ffa716ee871f7e09ad7321213a897156edab0.camel@perches.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/14/21 9:29 AM, Joe Perches wrote:
> On Wed, 2021-04-14 at 08:17 -0500, Alex Elder wrote:
>> Perhaps (like the -W options for GCC) there
>> could be a way to specify in a Makefile which checkpatch
>> messages are reported/not reported?  I don't claim that's
>> a good suggestion, but if I could optionally indicate
>> somewhere that "two consecutive blank lines is OK for
>> Greybus" (one example that comes to mind) I might do so.
> 
> checkpatch already has --ignore=<list> and --types=<list>
> for the various classes of messages it emits.
> 
> see: $ ./scripts/checkpatch.pl --list-types --verbose
> 
> Dwaipayan Ray (cc'd) is supposedly working on expanding
> the verbose descriptions of each type.
> 

That's awesome, I wasn't aware of that.

Any suggestions on a standardized way to say "in this
subtree, please provide these arguments to checkpatch.pl"?

I can probably stick it in a README file or something,
but is there an existing best practice?

Thanks.

					-Alex
