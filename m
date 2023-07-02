Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C0917D3
	for <linux-staging@lists.linux.dev>; Sun,  2 Jul 2023 10:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1688293208; x=1688898008; i=markus.elfring@web.de;
 bh=sBOY/Eb24bsDW2ZXVs3j0qMiJRHu4nR/iKGjjMlrrFo=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=iMxALdicrPSajXVoESif9pvZ96As3JiHgMjCltTvd4REgUskgafd/PcUGqt6UDkpuyy+VXi
 W7kA415XT+4xybccV7LXIrUOStaEBy9cwd1/z3/JeqqAKQW4fS1dMpmGnT/M4DMAFGFp9MKig
 +a+VT5W9ri+cScNYKAR1WkNaeSMAO5qHxhQtAtReDTQBm0j7ulmcTyAwVfFzatwpWiNfe7r+S
 rzr44yD/yvTB9iRpGAMOFn5AWxaET6XKGJt7PspSUooekFBiu0I/idm+gLdTDeWjFr/pf6PFX
 XUoQKQMkcjiMyeRwry/y7LZxJU1bB8Kb8lVQ7Az+WbRrLG0LgSVQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N30dV-1psca50Idp-013KX8; Sun, 02
 Jul 2023 12:20:08 +0200
Message-ID: <221f414c-3caa-53ab-76fb-f4c4f16f19cd@web.de>
Date: Sun, 2 Jul 2023 12:20:06 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel-janitors@vger.kernel.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Ming Qian <ming.qian@nxp.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Tomasz Figa <tfiga@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel@collabora.com
References: <20230622131349.144160-11-benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v3 10/11] media: v4l2: Add DELETE_BUF ioctl
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230622131349.144160-11-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:dzHl1TKsd30ARU+1wU3sPjJdmSMv9wz291O+95bJKtsF+YD1eHC
 b+Q/ty/cUdo/ImlY6/OW88hgs7LqDqnaLtGiWYvrt33PSMf5ZWlRlTyQDaAx4dgPHrBnLA0
 qs8kYbWhRoXVPenCdbWMKx+yFzoMLt3wR3yQeMTmlNYETVGlXfCVbSUDWc7uNttbtT3ghI5
 JhpEUF36ej0rr9asWnBQw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NAZRIHhF93Q=;0bddDCS8+zQAqaLB73VP7318fMc
 VANXbOo42UC/yy+quepupqSDSg9t7IVFp41mZIF6yt2I8i5Sppaaj576XuQ/0vgz6wJINmf55
 OUSSRnYrVt0wR6E8lhJKlcEKEIuXTz/YcrD4JGarFwOfBw8jHTGmWjd6qz4IG7JnA7m3hAM3T
 HgjbVSfYMI1kEX+tAp0SxWLhmgmxPB/mejfZTPZvEIpNoIJLjTCKuQQTrcbzPuj66e8s0V8Zx
 wTLY2UUWnBROOi6yMc1l/f/qf2dFaUapSLOaYHvEl38UhZeEsCE5C5YrCrfFIP73xn5Gv2MD9
 oh3yZpT4hgg8yVXdM2ozehMQnKtgD5das7ku1Y6M9ICVcWvR7FD3GXwbeq+pXubT49fnDxULr
 LN0PZRiCmE683xp8NVfIKaiBCi4szwwkOscZ1dLXhazMIGj/0VrMHpc1EfsRsDvVQrrnImkuf
 5JJ2FdjSkXjtRbP6zbN9T0ZZ4lG9eO1roNsdkzm5A9Q3X6a01ChcG/lSr3DWsmKDPly3qctAg
 luK2FU4S4+8mCfvoQw6ZC1AU1eA9CFnA2U/GaTwfQw5iateF4r0+vx3tmBTTxEgggmOthV8/G
 xJCDacggRUC+UgovloigI+nPRSk3vAC6Lmypm18aGKletuOTHOcCSnPVz0tqcPFp6TbT2i3f6
 dSpNG6pJPv9SSu17e4q2ZD3eupdfgXATfZoB64gcfnKvIDrlil7mTLoO0JNj8bmwE+gK/JmLj
 HcicXl+iLxmIhiXyj446CxQPD2uNa1LjxnLkC9tgVW9Gw6nPzO4xsuBnaz1tPMCFHKm/rXTwn
 AVU0pABw3OOieiV6oR8kC0T2qEqsSp3A3ASXwfV1RMVQfv1o//UAJfRrUlLEUoMHj/2F9OUO0
 JPiHRJo0z1GMxMMxcrolaCIEtlvTN+yRwyKY4MJENPcwGYpfNJ0oBiZedDuIiXOz1E09R1HqU
 K0IYQX7b7GlD3/G6MORgtEnIvzk=

> VIDIOC_DELETE_BUF ioctl allows to delete a buffer from a queue.

Please choose another imperative change suggestion.

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.4#n94

Regards,
Markus
