Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A17C8C0
	for <linux-staging@lists.linux.dev>; Sat,  1 Jul 2023 14:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1688222590; x=1688827390; i=markus.elfring@web.de;
 bh=kOMm9LAu2etu/HGwfPU+YqT7UOaRaKStEwhuzAp+zo4=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=h8PHoPoW0L4ibqeZB/sLHGZZ2PAIcEdTicMQS6GtBqMiRup+5VN3ntEhBPW3lH1wPylUJWq
 sAuNFb/S2xD3uAdbO0+00Ba/E8GREGe6eQFLV5ltDq2em3mAyEIuaDxuVdhsx6IOnAAr/qiG8
 1eCaLGGoauDTajQI8O24xhyvd525JDLGPyBqeB+ASY+4SRjCi6OjfrveplXUQRBzYVfgPkvOq
 Ioyvw7X8C2LD7BL+EvUVhxYfkfxZaNepiG7a/6sN+rqCKZUdFXw/PsvIGVgvQBYwccbuO4BS7
 744oLBrS+p70dJiQDvRTgN809Ylx5dsH09YsPLnRQLHIZY0DhOIg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N1d3a-1prZdm25SS-012C9V; Sat, 01
 Jul 2023 16:43:10 +0200
Message-ID: <5ad04b3a-7c77-cadb-13b4-509a086cf04d@web.de>
Date: Sat, 1 Jul 2023 16:43:09 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: =?UTF-8?Q?Franziska_N=c3=a4pelt?= <franziska.naepelt@googlemail.com>,
 linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org,
 Dan Carpenter <dan.carpenter@linaro.org>, Emily Peri <eperi1024@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guo Zihua <guozihua@huawei.com>, Hans de Goede <hdegoede@redhat.com>,
 Kang Minchul <tegongkang@gmail.com>,
 Philipp Hortmann <philipp.g.hortmann@gmail.com>,
 Veerendranath Jakkam <quic_vjakkam@quicinc.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20230701102538.5359-1-franziska.naepelt@googlemail.com>
Subject: Re: [PATCH v4 1/3] staging: rtl8723bs: Fix space issues
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230701102538.5359-1-franziska.naepelt@googlemail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SxjAVWEP2ninnyb++Xo3XahliJjgrXt/KojjJDniONjIRk7uPUi
 HXne3vq1Kmzn8FGLjsX0uNHjYqWALIGsvTzWDB9Zfj6nkUhAmTsSPHNPXwMT5k8Hn6WBp1L
 d1reBAynWQ3gDkbus3xnRmnKuL5PUPuKkgk99ktn7s2L7tq+rO3QOCk7QcHpXJdGx/mHz3p
 yGaJqR2UZkR7dv35GhavA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+bB3GWqjRvE=;E/Fpgm+q3V/7AlOymz55D3R6Opl
 A5xK53aFnSkrrQz7hcRo/smz2skjgK3ipbzDCme0uNbQIBe4Cyt/GiY7PQ8RaGjyS6rIP0GLE
 XQznd9vPCwxlE59A/5HxYwbmkICFW8lmLQf8qZGMqhGQxPLVjfVf05wpWXyodhUuJ3nYIuE3+
 +eSLHXPOcCxDphwwY/jv8t2tZD+TsvoMR07ycJISTD/IYZZYCvaLRobSE4szDlIc1oxtZPHnM
 sOpgIzkTSaBBzAER4Bd0ghFniLRQDq66Q2JPvhMhpxA4+KfyHOE+8lSWmEi6PSxEYJIKRmt4X
 M80i24IDTRyWG6dnVd3Xq2oYgHUDdMiyJz7o1SAj/4LSPQ1IeO6PO6aSiQjVPzJAGkJVYckJr
 mKu9q1Df29iHkp6EZE9OIOuXPRFhhB6j4q1aicAa51AqKcZemEgmdmuSxVXyIblHmdChTPEM4
 v0z0HE+C3lnFFOciJGScxMuoTvmDU5Hx3Qa94wKiwNqeXqYVI2hWr9J10vTEiFKVPjvXpQz65
 2Yv0U5gn0FidxZZPfq+RogzJI2f0lpXIRFTKyk7gBzkc5UTZ3kvh6F4ovW9/+oxYV1eBRRRkv
 1cf5cDC++rgrZoy3VMMG8gzG8uVLgw+sk6kLEWBTaWCERE4fqlLIUnxKzvBmrc8+xCNhUMNuj
 z+LCpUzLK0SlqO2yH2Feb/gJffp4Zuj1B5eT1txffDpcON9q/ZHPc4KPlwVsImUk4e9KoUALK
 Vw8TTSO8Y6yDuEVkNSiNH5kN23WK6KBUuCTUuopIcZ8xafYuslh9S+mpr7FEcNg27eNjUG6Fa
 uC09WQzlzTqsBxSqyV0wvXVEcrgjRInjQ2TWPjcfyFpM/6Wam4OQxw9ubGtmlkdPeUGttiQ4e
 ZS8QvOl7WBbP9M2TGTH/LAc0YQaF8WKYx+ra2a7cGoWSgJPCnJw6PsuPW42hasv5nPv5JRKLX
 CU771w==

You should not put only your own email address into the field =E2=80=9CTo=
=E2=80=9D.
Please reconsider the distribution of addresses between message header fie=
lds once more.


> Fix the following checkpatch space issues:
> - CHECK: spaces preferred around that '*' (ctx:VxV)
> - CHECK: spaces preferred around that '+' (ctx:VxV)
> - CHECK: spaces preferred around that '-' (ctx:VxV)
> - CHECK: spaces preferred around that '|' (ctx:VxV)
> - CHECK: No space is necessary after a cast
> - WARNING: please, no spaces at the start of a line

How good does such a change combination fit to the known requirement
=E2=80=9CSolve only one problem per patch.=E2=80=9D?

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.4#n81


Will it be a bit safer to provide corresponding source code adjustments se=
parately
according to their message types?


=E2=80=A6
> v4: Fix sign-off email address
> ---
=E2=80=A6

I guess that this misplaced marker line should be deleted at this place
for all update steps in your small patch series.

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.4#n686

Regards,
Markus
