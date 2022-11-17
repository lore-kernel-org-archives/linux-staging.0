Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7565B8BE0
	for <linux-staging@lists.linux.dev>; Thu, 17 Nov 2022 18:25:45 +0000 (UTC)
Received: from [192.168.1.139] ([37.4.248.43]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MRBac-1oYYAc40d2-00N9JG; Thu, 17 Nov 2022 19:11:43 +0100
Message-ID: <dd05ca8a-c60c-a56f-66e6-9892cb933315@i2se.com>
Date: Thu, 17 Nov 2022 19:11:41 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 0/3] vc04_services: Promote bool usage
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: kieran.bingham@ideasonboard.com,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Umang Jain <umang.jain@ideasonboard.com>, Ray Jui <rjui@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Dan Carpenter <error27@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev
References: <20221117160015.344528-1-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20221117160015.344528-1-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:v+yHu1Uvt3QU9GBLdXtKiy5Gtp6DZtAd5x9kAsCbgZddr7sCpwW
 YgpqInjBN5e7Jg8gHXUNNDDAojqouRTvvRR8Ou1F8zfpf9QSp368awubWM2F1sxb1D7o+lG
 KxOXQVJ94H0QY73UzYeYAmRJT+dxCn4GJr0UpXWw+u0vxTZt6K9YRpP/Ek91socwXkNlwl1
 mc2rBrqoCUX1Kjzbkrk8A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8x0yV4F0e/8=:Kgdw7lOfOiJEAJAzUr2LtV
 /qoeh2DIfKtsqmVQP9F7FJB3RL6zEhQeWpmfosS454lC0CwxgsoKJfnaHdMnKsREx31UsWRtI
 F84wZYG/XQX2qCo/JklBGQXcHZVAiWHPq8ZOVHj8TILM7gXOr5bjUl+PH2Bhl1r8Bg1r22Sex
 rM4a9vwGx91OkO9emS7rBntElZBenPEuebev2BxVhs94cJSerZRSj1n5DYdnHJZ10y+yISKkF
 LwlWan0lYhpC8N12gIItnyarrKIrRDbxQWUD3FFXVkYxu1uEjbfXQbgq2sBm4hxwIcXFAxdga
 YZ7xa6VVqI8gXnbefgRfVfaqBhJAy97vQWK619d7EUdIeh1FjtrELfDmFrMn1IpyvpWasM/iq
 8dZLamrL8Pksib19YTtOGFgtyOR9x4egV0EfpbGjIpYQGGgg9QTKMNbcoo/ehvI4qsBhiSVRN
 WIv3Cwmc12OcpyW6ZS28qD7nr/G2EB40tW0wy3h8OZpohsDKsevMaoPWfeZNvaYxfXUzJQO+0
 grYp/vsvZxztoSahcDEh+7ySgk3zb5O7Fk/EEB0PFgHCd81Ak8j6MHmuRw30a1iFV/hX4yVmd
 +ptuNlDnByqXZeJV8knPcuF5TGRZnyVfxSZt+E3G2bCHGKWE3XcFSM+fQJR6MJpfV35BMAHei
 1OW5D1Qh1PUyOotlLwEWCrt75RcQiTyaIKBiDnZBMddM2mwO8uMeMBHo/9sEfSS5W6L8UwhkX
 3N+IBFo57KH/XDCjYU/eU3ixCp4tioV4TA56RaTR3TFg4pplWAEGQDbChreh827zXJyBkrVQ4
 aPDMbgtd57OwtHdsS7sDdnL81aK0Q==

Hi Dave,

Am 17.11.22 um 17:00 schrieb Umang Jain:
> In commit 7967656ffbfa ("coding-style: Clarify the expectations around
> bool") the check to dis-allow bool structure members was removed from
> checkpatch.pl. It promotes bool structure members to store boolean
> values. This enhances code readability.
>
> Umang Jain (3):
>    Revert "staging: mmal-vchiq: Avoid use of bool in structures"
>    vc04_services: mmal-vchiq: Use bool for vchiq_mmal_component.in_use
>    vc04_services: bcm2835-camera: Use bool values for
>      mmal_fmt.remove_padding
>
>   .../bcm2835-camera/bcm2835-camera.c           | 30 +++++++++----------
>   .../vc04_services/vchiq-mmal/mmal-vchiq.c     | 18 +++++------
>   .../vc04_services/vchiq-mmal/mmal-vchiq.h     |  6 ++--
could you please check these changes to be safe? I'm not sure that the 
affected declarations are really internal. I'm afraid this might affect 
firmware or userspace.
>   3 files changed, 27 insertions(+), 27 deletions(-)
>
