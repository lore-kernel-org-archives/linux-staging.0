Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595EC2115
	for <linux-staging@lists.linux.dev>; Sun, 22 Jan 2023 14:21:18 +0000 (UTC)
Received: from [192.168.1.139] ([37.4.248.41]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MAfQk-1pQF462FnU-00B3OM; Sun, 22 Jan 2023 15:21:06 +0100
Message-ID: <d5363f85-44e1-eee1-f7a5-61102637ef53@i2se.com>
Date: Sun, 22 Jan 2023 15:21:05 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 0/4] Drop custom logging
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Adrien Thierry
 <athierry@redhat.com>, Dan Carpenter <error27@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
 Phil Elwell <phil@raspberrypi.com>
References: <20230118115810.21979-1-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20230118115810.21979-1-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:+K/hkG18/sgKmBAu93VyhrzGjSGV8+eUMDqkYyeM/O8q/ypb3jq
 G0J6OJ5W4OgwFC1Z3QH2Tq3deTqESekn8J17woustOqbuxJPAVauE12Go7VpPdjUhK2fug7
 SHFDwhJdOgFB0+r1mEI66LkQIP/71vVxRM5pE1oO9EiIi1zUuNNrFbtp54u6wPLC2N0aoig
 3KMX4IKC8uVH3qhLg28CA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hbB+ZQzF6Nc=;lB+wsRP/Dr1Bz0wrkgOWNIzZ96A
 +hU1/Cjq94oU+LzlPgo4zsytfFc//fq6YJ7guxwqQy6yH7tORbdPdjSjottAROjdlMo511Fds
 TGgQ3bxeSQx3EVfNgFBlMZ43auqimqXT/ZFe9W7tFot0Vz/qRMFemHKonZ/42gGAnUd/m6HNs
 V8VVwTRSrBP2x2Vz1IDE4MLYIBm89R//UHdYwF9Ozmukq5RYxXxGpW3E8UUb9rUMoMZCq9lQQ
 ENb+YQAf7HpWLH3/2B9edmukR16ATF5jFfkPfI0Q7JxdgRMj4KJ/wFBxcA0XXlli2cfIbScQi
 qioeCYSd6Fc9/bzy/nYqfc9tsosmKtRE39yhhfuaGYDHDe1hPHtbGS3aD7bVScUO3fUsqzSX3
 UjOlZLo3fFmg44jcQm+PP8ykpC8EYHoeUy3cnjv2iKG4pB/w0rby0ypLoL466IbTsDM5ZxhzD
 Wpdm6eCzMSb23Ta4gTKovx6CiAK/tg7KIK+SL0fPljiiA7E1+mY5QslERQCEmaFZ2ht+/cLCW
 0uR/potYtqPkRk1X2syj1tD6bhmnKfN0iGPjDk2/CbPkkvR8Zd4K12q2n97O5rvydh0/l9LKU
 TQSuGYw3n2IhvNcGOqXQqowA8OwVyKkThVnn59qFLgbN2TU4XsW19EzwAIRqDmZmJJTl+Jult
 82KmzEzv99IU/1ZmmS44e/ECUO2aX+uGAhI5S57DCA==

Hi Umang,

Am 18.01.23 um 12:58 schrieb Umang Jain:
> Drop custom logging from the vchiq interface.
> Mostly of them are replaced with dev_dbg and friends
> and/or pr_info and friends.
>
> The debugfs log levels (in 4/4) are mapped to kernel
> logs levels (coming from include/linux/kern_levels.h)
> Would like some thoughts on it as I am not sure (hence
> marking this is RFC)
>
>  From drivers/staging/vc04_services/interface/TODO:
>
> """
> * Cleanup logging mechanism
>
> The driver should probably be using the standard kernel logging mechanisms
> such as dev_info, dev_dbg, and friends.
> """

at first i want to thank you for the work on vchiq so far.

There is something which is not directly related to this series, but it 
is also about debugging. The driver has a buffer which is accessed by 
it's own DEBUG_* macros. The content of this debug buffer can be dumped 
via the /dev/vchiq which is also used by ioctl. I would appreciate to 
move this dump feature into a new debugfs entry.

Best regards

