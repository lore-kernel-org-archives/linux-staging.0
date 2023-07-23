Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34045A29
	for <linux-staging@lists.linux.dev>; Sun, 23 Jul 2023 06:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1690093141; x=1690697941; i=markus.elfring@web.de;
 bh=9EoHi4ygE5158NGWmMqEqjMe71ZrQaDjehm/vTQ3wf8=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=M0+8ILe2TWE1LBJFP24P8A2AJNtZc/T3LAGG9ghu+Cjw4xKck7t6Y49uX6XlVNq9ZZ2zsIe
 DTdEDMMhZ4mY5ZIMBANCiB3JHxNGIlMdtSQCIoSxJv1B4Mddf+Ic6a+Rfffsdtd9NG05HqA22
 gSj8I3VW0NIsNZJJo3sleWfP1yYTAanoiauGU0d80J/YNR2LkQkJlZcLMlIOSZimOaCdaVK5I
 R9gZzxOjh+KOvVcXsyoiqclg9aCthbMVQ/Bl821saUCx8QP0q0NJd94L+Agd0N45njDRszvwX
 5NxoDEJhikofHYWPCarBHFcfWGtQTXaRLkIDd9o54kZxMiuVP0sg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MRW6L-1qZmDI1rV7-00NXv9; Sun, 23
 Jul 2023 08:19:01 +0200
Message-ID: <4b9fdaa7-bdcf-ef41-0d54-ba41520cde4c@web.de>
Date: Sun, 23 Jul 2023 08:18:47 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 1/3] staging: rtl8723bs: Fix space issues
Content-Language: en-GB
To: =?UTF-8?Q?Franziska_N=c3=a4pelt?= <franziska.naepelt@googlemail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Emily Peri
 <eperi1024@gmail.com>, Guo Zihua <guozihua@huawei.com>,
 Hans de Goede <hdegoede@redhat.com>, Kang Minchul <tegongkang@gmail.com>,
 Philipp Hortmann <philipp.g.hortmann@gmail.com>,
 Veerendranath Jakkam <quic_vjakkam@quicinc.com>,
 LKML <linux-kernel@vger.kernel.org>
References: <20230701102538.5359-1-franziska.naepelt@googlemail.com>
 <5ad04b3a-7c77-cadb-13b4-509a086cf04d@web.de>
 <2023070123-unburned-worsening-0713@gregkh>
 <CAAUT3iNqwgtFJz2Q1bRN+MsSna26KC1FJc3jchu=8B09A2SkvQ@mail.gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CAAUT3iNqwgtFJz2Q1bRN+MsSna26KC1FJc3jchu=8B09A2SkvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:vOw6/RIo4ETG1/9Da4Qv/khygrNPNZ1xFpryEUXnMFTPlpHMIFa
 GYzmULzf8MTOdEGceECv+ju2yfue9lg1CvbNNww/KVw4vI4ZqVB457dqykUYXVfsTdH9MAE
 U4mETGp5vkzNrW82PSQGIoVNFTkslXjbzSv+u995lIyF7H51JkghmvCb4BArV4MYba3Ghrd
 dxOmQmujQTFrcqWranTTQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:H37LoalsD04=;h3UEv0SZKIaJNW5txkAGYaP8RUb
 7PzATYQqQ4u3pFKslnTngsxKwIIDiTXeSaOKBpXFVPxlfeBCh2xv1YrsW+CTeR/Shqaf1lzVx
 KY4RZiIa5vnJysWrw2kWalMnQ0uAi3+gmMZak0lnBigDMvf/eB4zncDf4cSwnj3/fEAmCDrGi
 Mc6NEekkWqHK6R1GbnPtU8rSKaN4dKEUXKMBsTtyYaYxMM6KP2Gkqj2VzA4tVzhhLlF64Dle8
 9kflCCoxaRhn24tNNvSiR7vEeZTkOGFa0nTn67jB2DYZInpzTENNbsjGaZSJtFTpLbgXvMDAp
 fg9rILPyEm4lCfems+O1sw4KDfg6Rq1rgBu1nZEi39orXVGdKKjw5cOl6N3FQatIt4T8t4EpF
 pTGUg1a/6bwnlZMuOedeMLwftz3jJzSOV+oVBiEX6DHkBls25VlQkxGcI3sJd6nQs5fcB++0A
 QmPnU0ZLGs5hjCMAZ3Xdj4an+BBYRlEdfARTLbbIawJYNKifHM5B7jKk6Dp9uAFFENOeJzoSo
 E8jym+P/9DtIIybu4hOh9imVI9yQBI4uc2bwfp1i4t7aYjLrkf0xj3GrVt9GasGvn/XraTpwF
 vbYe9W6OSq3vcexA1Pte+I2UHf8BJ40m9ZRgVde0is/TrOMc3ThE/CGQbHTKw4FViFzuW7jVa
 V4J/6lku58Zw1HdaeSPGacfVq9ZXwniq800ItwS8CsRT9mnxsDqINLz7tV+R3Q8xS4q/rKsSf
 bYZpBc/Bo135ZxW+BKdchsgMX2dyuotFXJJVZ3F3wFggHZj40vaQrkwZh2o8oGzMYCB8B+ZnL
 bRlU7KyMidevqigH5i82ljAt59ACMokEYPoBF5nxAyoJxoqjYbFDzZm60vDf2Du2q+5PdxY9j
 Jr7v+edmA11bPftwAg9TWav2pw/97KBvLiLaASE6nc1JzEfonZptJMH8Vk2Iy6u5cKWZmFPZP
 2bQmEw==

> Am I supposed to adjust something here?

There are possibilities remaining to handle recurring communication difficulties
in more constructive ways for some hints.


> As far as I understood, I can ignore the comments from Markus, correct?

Would the provided technical information be taken better into account
if it would be presented by any other contributors?

Regards,
Markus
