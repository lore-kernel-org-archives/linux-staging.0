Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC5D6D1B
	for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 23:14:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF36F61038;
	Thu, 12 Aug 2021 23:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628810043;
	bh=yG14bUeU1buiIIE2r2S/eD3JTfuifUtevK7unrjDIjI=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=U/Wt0xmpjxqZJQyQXnYcWuRXvKQaqPefRHygIJWvMH/UxrL7bwOqy4CU5NPfpBABf
	 UhDStXmfUGywu3YBftUk5bPkjs2VkhE2FdyWGhfK+3ik7wQkUI229/k1pEiV2PCM09
	 oOsJ5783uNGVOnPuoEnnGr3moZ7eHIvJwNafpEjudwFQ3SerERrwTn7cIJ7xApwrlK
	 h1mXM7n/wP5nSPvIXBPBnPeNXCHr8c0vPanNaoq/0kniDmyKNl/NtkwGYvq4hwoVva
	 bK75eYZu0hvn1HYndkTZVwAe71fmIZ2HzGSjiZZN0ox8BhQ651mSCB/h4zRE2Dktbb
	 2CqD46g8YVB0Q==
Subject: Re: [PATCH 3/3] staging: r8188eu: Reorganize error handling in
 rtw_drv_init()
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Phillip Potter <phil@philpotter.co.uk>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
References: <20210812204027.338872-1-nathan@kernel.org>
 <20210812204027.338872-4-nathan@kernel.org>
 <1651213.ETx7SW4KbR@localhost.localdomain>
From: Nathan Chancellor <nathan@kernel.org>
Message-ID: <24e15d45-40b8-b8a7-b633-9e538324a29b@kernel.org>
Date: Thu, 12 Aug 2021 16:14:01 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <1651213.ETx7SW4KbR@localhost.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/12/2021 4:11 PM, Fabio M. De Francesco wrote:
> On Thursday, August 12, 2021 10:40:27 PM CEST Nathan Chancellor wrote:
>> [...]
>> Looking at the error function as a whole, the error handling is odd
>> compared to the rest of the kernel, which prefers to set error codes on
>> goto paths, rather than a global "status" variable which determines the
>> error code at the end of the function and function calls in the case of
>> error.
>>
> "status" is not a global variable, instead it is a local variable with only
> in-function visibility and it has an automatic storage duration (i.e., it is
> allocated on the stack frame of the function and is destroyed when the stack
> is unwound at the return from the function).
> 
> According to the above definition there's no difference in storage classes
> between the old "status" and the new "ret" (the latter being a merely rename
> of the former). However, "ret" is a more appropriate name for that variable.
> Furthermore, your handling of errors and return value is more consistent with
> best practices.

Sorry, I meant "global" with regards to the function (as in "was there 
an error in the function"), rather than "global" as a storage class.

> Therefore, apart that minor misuse of the "global" class in your commit
> message, it's a nice work and so...

I am happy to redo the commit message if you and others so desire.

> Acked-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Thank you for the review and ack!

Cheers,
Nathan
