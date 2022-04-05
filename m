Received: from out203-205-221-239.mail.qq.com (out203-205-221-239.mail.qq.com [203.205.221.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B1115A8
	for <linux-staging@lists.linux.dev>; Tue,  5 Apr 2022 01:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1649121025;
	bh=YJ4G6EfSMlc9a+RsjVXiyuZ8BgneqfFR+sZ3NViWAa8=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date;
	b=HxFpj3AAeNiHsWYoczo1aZvOMOrFJzxL4qJ0HTBn2rz5uYQFmzt7lMoKw0PHF0p69
	 ZmPYGBELDE3ZLbtzOx/gDYYLRPZqujwqVlJQjkfYLwHp4XEfWK9zS7juPaA7QmBcnC
	 UlVEqoIPK9cyQzmy2LVM2Ah4JnWTjwWyXF69bcBc=
Received: from helloworld ([59.172.176.225])
	by newxmesmtplogicsvrsza5.qq.com (NewEsmtp) with SMTP
	id 2973BC56; Tue, 05 Apr 2022 09:10:23 +0800
X-QQ-mid: xmsmtpt1649121023t61dqi5iw
Message-ID: <tencent_452951FCBB813C31CBE516716C537884D70A@qq.com>
X-QQ-XMAILINFO: OZZSS56D9fAjE4XxrPhxnzYSX90Lp1RulwJjuhj3Ad5DeArzICeNyT6fu7ejU8
	 EpiqbiEcoMIZz6o9SV3LKE6o6+gMPUjlc3wP6jH8zA6QAqCcAh4UgL3M83VB+YqEhTZu+3n5S8Kz
	 xFomaiy4AoHpOIv7HasvXysadnzVInm4N+9JEsnJgFzb9eTrQVsaxcU16MxQsWNdhVk+Ee1/DrkE
	 RLpNvJlBtnH0lLZs3o2XsjmnacJKkxbnn2b/4TnkJxTaR2s6sBZJuP0EgAwUf/FnmVO4nz84hDoD
	 GyxG6cUVi9JQ7KS2AGu1huDd/FqV1BkHJcFxYEyCdB/SFOjVvP/rEzv8yNjBZwH46VKMLVW5hODU
	 6quiF/NDMaZRVsDBUuSrEdpjQZosnqN8A1HpMVHj7QXCHrmL7i5yhujNDYYzDfScrWhbZM0MXJPC
	 7xU+slEAU9HAmdCLSWwExHxk9JJk2zHqsL5MMqu/Kic2Mi9qiLs7OootEky5IdJEkOdzA/YvQxF9
	 ZcaQyKdhWYXOafjtUGQdcLXbLL+TNltNfD2JDrV1wKaGj+7Medxt95jLGOnIksPwVKIkCPjAqJ7s
	 FMypTzcC6Wqpqa+OWeeEfUj0xfq6ip8ObX45IpjVj5yZyg5N2xaE3xLosvguRW69Bqx0Zz0o1FZH
	 CS2DedQQZUNcPBq46WmAaVOzDdJhX5bDkluA24naGPtgWhRJ26k1GhixgiWRsQRe5ONbfLVXskKM
	 GVOMQIrjE7q+xQ0ZD2QiGYbXmZRTwQ4T/bfFN7bG+yY+D8jWF92QsoJ7tIn0MembYie0G+CZZpyD
	 T+G+0zMBDXkdBUgXoP/exl4mUgvMiEPt0WGej9LbrH2RNlpofWHvu30UMh16GulTv410zkvrgUyJ
	 DHXLDc+dJH2TgjPVOSG0QQTh82MqVGnLo6uTx304Vu2dkqnznYGY/eqyyi1lxR2Q==
From: <xkernel.wang@foxmail.com>
To: "'Greg KH'" <gregkh@linuxfoundation.org>
Cc: <Larry.Finger@lwfinger.net>,
	<florian.c.schilhabel@googlemail.com>,
	<linux-staging@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
References: <tencent_0A1273526E1E87150578F8B752CF7F178806@qq.com> <tencent_3096E1464A73FF232014CC40B9001C551408@qq.com> <YksAzXHif7Usdfv9@kroah.com>
In-Reply-To: <YksAzXHif7Usdfv9@kroah.com>
Subject: Re: [PATCH 2/3] staging: rtl8712: add two validation check in r8712_init_drv_sw()
Date: Tue, 5 Apr 2022 09:10:24 +0800
X-OQ-MSGID: <000e01d84889$ee63d8b0$cb2b8a10$@foxmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQO0Uoy989zRJT7S4c8YGkbirmJg/AIqqt/GAmblFDABs2btQg==
Content-Language: zh-cn

On Monday, April 4, 2022 10:30 PM +0800, gregkh@linuxfoundation.org =
wrote:
> You just leaked memory :(
>
> please please please test these types of "fix up error handling"
> changes, as there are lots and lots of ways to get these wrong.
>

It seems that you missed the third email in this series.

In fact, I did not ignore the memory leak problem. But considering that =
there are other paths which can also lead to memory leak, I separated =
another patch to deal with them specifically.

In the next version, I will adjust the sequence of the patches and add =
some descriptions to explicitly show the relations.

--
Regards,
Xiaoke Wang

