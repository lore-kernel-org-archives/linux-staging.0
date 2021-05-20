Received: from smtp120.iad3b.emailsrvr.com (smtp120.iad3b.emailsrvr.com [146.20.161.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09EB71
	for <linux-staging@lists.linux.dev>; Thu, 20 May 2021 13:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20190130-41we5z8j; t=1621516926;
	bh=N2TMvpRHww+NI7PhUZYY30bfmqvJ7baNd0nZEvc4dNk=;
	h=Subject:To:From:Date:From;
	b=gtXo7nqCajpCgdH9VJ8q9fcDOBSIaGefPlu4XZFGZIq0f3iMHL6j/Y3JvPnZYD56E
	 MqeZ8isN6Mmc6iETjU/9pifdw0y1u2lbJi3gt8tsPxz6q7cOgeLhHp+vxQmhsoNXZB
	 FtiJjeejflK6GD0oJG5JB7s22mevhk1kHiP0UJpE=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp8.relay.iad3b.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 22B8340074;
	Thu, 20 May 2021 09:22:04 -0400 (EDT)
Subject: Re: [PATCH 2/6] comedi: drivers: jr3_pci: Remove set but unused
 variable 'min_full_scale'
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Alexander A. Klimov" <grandmaster@al2klimov.de>,
 Anders Blomdell <anders.blomdell@control.lth.se>,
 linux-staging@lists.linux.dev
References: <20210520122538.3470259-1-lee.jones@linaro.org>
 <20210520122538.3470259-3-lee.jones@linaro.org>
From: Ian Abbott <abbotti@mev.co.uk>
Organization: MEV Ltd.
Message-ID: <9d0ac108-7256-be1a-fdd9-f48f52aaa38e@mev.co.uk>
Date: Thu, 20 May 2021 14:22:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210520122538.3470259-3-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Classification-ID: 9f95dd61-1342-41fb-af1c-c84f47d499e7-1-1

On 20/05/2021 13:25, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>   drivers/staging/comedi/drivers/jr3_pci.c: In function ‘jr3_pci_poll_subdevice’:
>   drivers/staging/comedi/drivers/jr3_pci.c:507:22: warning: variable ‘min_full_scale’ set but not used [-Wunused-but-set-variable]
> 
> Cc: Ian Abbott <abbotti@mev.co.uk>
> Cc: H Hartley Sweeten <hsweeten@visionengravers.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
> Cc: Anders Blomdell <anders.blomdell@control.lth.se>
> Cc: linux-staging@lists.linux.dev
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>   drivers/comedi/drivers/jr3_pci.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Actually, that one is stale now (or will be when Greg's staging-next 
branch gets merged into linux-next soon):

https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/commit/?h=staging-next&id=b9f38e913a926b455e5048a95f53a993b515509f

| staging: comedi: Remove unused variable ‘min_full_scale’ and function 
'get_min_full_scales'
|
| The variable ‘min_full_scale’ and function 'get_min_full_scales' are
| not used, So delete them.

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
-=( registered in England & Wales.  Regd. number: 02862268.  )=-
-=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
-=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-
