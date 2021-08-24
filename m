Received: from smtp.smtpout.orange.fr (smtp12.smtpout.orange.fr [80.12.242.134])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1EC172
	for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 17:11:03 +0000 (UTC)
Received: from [192.168.1.18] ([90.126.253.178])
	by mwinf5d47 with ME
	id lV3Q250033riaq203V3QUd; Tue, 24 Aug 2021 19:03:26 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 24 Aug 2021 19:03:26 +0200
X-ME-IP: 90.126.253.178
Subject: Re: [PATCH 1/2] staging: r8188eu: Use usb_control_msg_recv/send() in
 usbctrl_vendorreq()
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Phillip Potter <phil@philpotter.co.uk>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pavel Skripkin <paskripkin@gmail.com>
References: <20210823223751.25104-1-fmdefrancesco@gmail.com>
 <4118209.ZeClQeRtK1@localhost.localdomain>
 <50d40020-5b0e-4bb9-357b-3640a0f9e8c6@wanadoo.fr>
 <1751314.Y7PUP2lcel@localhost.localdomain>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <ab9548b5-34f0-68ab-4dba-0adb9b7bb9a1@wanadoo.fr>
Date: Tue, 24 Aug 2021 19:03:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <1751314.Y7PUP2lcel@localhost.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Le 24/08/2021 à 12:38, Fabio M. De Francesco a écrit :
> Not related to my patch... why Linux has u8 and __u8? What are the
> different use cases they are meant for?

Maybe:
 
https://elixir.bootlin.com/linux/v5.14-rc6/source/include/uapi/asm-generic/int-l64.h#L16
helps ?

> Your 2c are worth much more than how much you think :)
If you insist, I could send you my Paypal address, but knowing that it 
may help someone should already be enough for me :).

Let me know if it was the root cause of the issue.

CJ

> 
> Thanks very much,
> 
> Fabio
> 
>> just my 2c,
>> CJ
>>
> 
> 
> 
> 
> 

