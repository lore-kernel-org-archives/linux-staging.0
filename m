Received: from smtp.smtpout.orange.fr (smtp04.smtpout.orange.fr [80.12.242.126])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FCD70
	for <linux-staging@lists.linux.dev>; Sun, 25 Jul 2021 16:45:41 +0000 (UTC)
Received: from [192.168.1.18] ([86.243.172.93])
	by mwinf5d27 with ME
	id ZUlf2500821Fzsu03Ulfxs; Sun, 25 Jul 2021 18:45:40 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 25 Jul 2021 18:45:40 +0200
X-ME-IP: 86.243.172.93
Subject: Re: [PATCH 09/18] staging: rtl8188eu: remove unused _HAL_INTF_C_
 define
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Martin Kaiser <martin@kaiser.cx>, linux-staging@lists.linux.dev,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210725155902.32433-1-martin@kaiser.cx>
 <20210725155902.32433-9-martin@kaiser.cx>
 <2bfef837-e8f6-0a89-b0ac-967de12ed067@wanadoo.fr>
 <YP2Te4es2Xa8ygp+@kroah.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <7353fbe5-ee02-dd89-6a8e-221ae4641279@wanadoo.fr>
Date: Sun, 25 Jul 2021 18:45:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YP2Te4es2Xa8ygp+@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Le 25/07/2021 à 18:38, Greg Kroah-Hartman a écrit :
> On Sun, Jul 25, 2021 at 06:32:10PM +0200, Christophe JAILLET wrote:
>> Le 25/07/2021 à 17:58, Martin Kaiser a écrit :
>>> This define can be removed.
>>>
>>> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
>>> ---
>>>    drivers/staging/rtl8188eu/hal/hal_intf.c | 1 -
>>>    1 file changed, 1 deletion(-)
>>>
>>> diff --git a/drivers/staging/rtl8188eu/hal/hal_intf.c b/drivers/staging/rtl8188eu/hal/hal_intf.c
>>> index f09620c54e69..3e132e00c81c 100644
>>> --- a/drivers/staging/rtl8188eu/hal/hal_intf.c
>>> +++ b/drivers/staging/rtl8188eu/hal/hal_intf.c
>>> @@ -5,7 +5,6 @@
>>>     *
>>>     ******************************************************************************/
>>> -#define _HAL_INTF_C_
>>>    #include <hal_intf.h>
>>>    uint rtw_hal_init(struct adapter *adapt)
>>>
>>
>> Hi,
>>
>> This one looks like an include guard.
>>
>> #ifndef _HAL_INTF_C_
>> #define _HAL_INTF_C_
>> ...
>> #endif /* _HAL_INTF_C_ */
>>
>> ?
> 
> But it really does not do anything, so should be dropped as the patch
> does.
> 
> Unless I am reading the code wrong?
> 
> greg k-h
> 

+1, I thought it was a .h file.

Sorry for the noise.

CJ
