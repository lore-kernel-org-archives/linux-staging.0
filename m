Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3932817E
	for <linux-staging@lists.linux.dev>; Sun,  2 Jul 2023 09:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1688289268; x=1688894068; i=markus.elfring@web.de;
 bh=04iT+UnfwyDPFNO9j8bB4gtCjTRJDEn6nkaOWfmk9Ak=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=K0Gg5BBc16nMDxJbeztZdnZLJ0zNgerCb1gynfjqZBgSwfkKSFpuDXx9QxGjAkLuycFrOgr
 dGjwfYyG6YCreioKgtE7qyhXpex2n2RWewJCg1Gm3CZwIQ9UuBG91iuvGBOU+iLlp7pk92V+q
 mzZzwfxbHxbGoP+tq1PLOovQsN0W/+PR8X9gCGkF1LiZTuRTYVgsSTHmDrFDkF84jU8HI/R/l
 Iy5hbUJaoiKXEfok+aIIOgd+AG4sw1y/F39PFMG0FgKBNHRLPXwTfMwbyUog/Hxyc9H0TF7ja
 12ykN70YUqvw9QCrNSfTSz00Bfb5S26dUzrW1FrGjlFaQD4jt0+g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MqIFD-1pceFb33iN-00nRBU; Sun, 02
 Jul 2023 11:14:28 +0200
Message-ID: <83b5faec-7e7c-c73c-c510-903ad69051f1@web.de>
Date: Sun, 2 Jul 2023 11:14:26 +0200
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
References: <20230622131349.144160-8-benjamin.gaignard@collabora.com>
Subject: Re: [PATCH v3 07/11] media: verisilicon: vp9: Use destination buffer
 height to compute chroma offset
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230622131349.144160-8-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7kJlUJsja2lPREtJK+HuF7keC2n5Tx00nxUKQmSzGqmAP/g37LJ
 DOgyytD3Xc+gPUa9LcGlaxnWioRo89+mye0/FJg4yE/HqGtfFFRRs5yZpXqFaVtAJxC0xKA
 pi8D/tQcQj279Cpxw6pPnfyuLjnHp114YJiup9RLyRYZXixln8yFZPTH0NjGlFe+JEKOJnq
 syilA2sOvIBDDI8eWaBpw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2uaVJO373Zw=;h4bf8LWkfnrDJhoPYeovRW+snHL
 LUzSbcYBQNIAdx0jzYi9vOFIid4SFBM95TXAJ3l9G2PVfFL8mK9SeKKN6xbEfHFXmTZUQR1hr
 IXW5I9QnyD66SJgNlTny1k3mUWWv95HYq06xwv8f1BdWKzwYWl2NhbXPThiBXYTC8UCFEc+Te
 ROXE89wBqDjmAW1o7oA3dEY3kXYxjJusE5eXL09nQdGWE1vG058Qqvh3fE04bMSjLEawcu5Ko
 Opi0JNzvt/cMmpN82yUYcdR2S+nmEz18/6ULWmJg0bdxR6fMb+ZwS9WTYPM+XsLupSh3tl9Zl
 V6jgbm/fDEmOR1efXcEgFflych7sycwJtNG7hwmqIo+i2j3GapQJcFafHabGmT40q15MUDAiB
 PZrED3dMpIZgxltFHNRxkghGJjlvss6wgUDVge9ELv0teRTZZ9zmWXvjgHnWs3u9m8QXd5hxv
 KH4QY8ARY4rA31A3ZMT+cFdcnF7eIgjW0wuEJzoKWeMlbM7il2VLYK/MGpCLLY8uYhD3R2tBI
 tl4w4I1omUG26sPzS4A1QQjLDY73tLaPFur56fHE1mD5r+mC8YKq9m7I9PdE1tC8vTtFEf03t
 LN1KtpQAruc0beK9bZRm64/kUyVJn0lVNGRAxgvFDjkdubLXEjDgEXfYIkt0jY8gj4+/8FA35
 jRK5AyG6jTas2uUegS9FDm+onrmS8c1DC4353iCP0Gm4I2Wb9Ap89ycyZp6ZXiXDQdKNzTtUF
 fI2npsVUGWtv/wcPz9VPuDtaHqlzl5GfDYxuMyLDgzSJqDdEI5aOr/R4jQOIwoo4zfV5Fhq4Y
 ksKTo9gipCulTtODp6BhuElSsJG16nlOb8nTIWGM1UzOL8T1vCw3Zh4GqysHZ9okqZa4NOmGn
 sdl7fXu1DYHpwcYs5wAmMefRWbxCHRHvbbEWAkxYmej+kwbeuCeoxItz2oKQxXHbpH2GGfD20
 ENWTDA==

> Source and destination buffer height may not be the same because
> alignment constraint are different.

How do you think about to use the wording variant =E2=80=9Calignment const=
raints are different=E2=80=9D
in a subsequent change description?

Regards,
Markus
