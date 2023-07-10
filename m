Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A998D1844
	for <linux-staging@lists.linux.dev>; Mon, 10 Jul 2023 06:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1688970746; x=1689575546; i=markus.elfring@web.de;
 bh=cB/oHc+peNf7juyu8OD1O3uoYvniaUvNLHj1flnZevc=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=MIMCdrSIBIaFyvNb3G05Lf8AYQxA1Myln3jnXvwSVVACfXT0EzfZlcpuUcRpr9v2MWL2lwb
 KMi1VbxEtr2jtEIVV/kIxploQT08N/HRMbvYXoJxgjS/X3ak2fy1oMCUWff4HdEn7VXxDZ/zG
 1c59SA8NVfmxpBQnq/RAx1X4txs4Vz1q+Oqao9ycLWGHSQKbNXfjB9Hztr1AxRbk/qyy4Ju06
 UDax1oujOYTsMaNZ/syNXIPMiPPSanM68b0aOl092gHDiZ6O5L2UKGp1GHxFJsErgeB7M2ssT
 BcEXbdKyMYHGBC11VnTli8rQaXyWLf/k8slKOSdXrxlcDd2yeHzw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MKuKF-1qZ2m712kf-00LPo0; Mon, 10
 Jul 2023 08:32:26 +0200
Message-ID: <078e248e-6360-94b3-3357-c5a9e37f889e@web.de>
Date: Mon, 10 Jul 2023 08:32:25 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: staging: ks7010: potential buffer overflow in
 ks_wlan_set_encode_ext()
Content-Language: en-GB
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Zhang Shurong <zhang_shurong@foxmail.com>, linux-staging@lists.linux.dev,
 kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Dan Carpenter <error27@gmail.com>,
 Xu Panda <xu.panda@zte.com.cn>
References: <tencent_5153B668C0283CAA15AA518325346E026A09@qq.com>
 <2a41ca22-a0eb-df38-be43-7175e1230bd0@web.de>
 <2023070919-monetary-sleet-2f5c@gregkh>
 <e24f9c2c-1163-631a-f8c0-b6dcb445a858@web.de>
 <tencent_BB4124566E846A2FB6ECC0F63C5A15BE5009@qq.com>
 <2023071056-amused-yam-5e29@gregkh>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <2023071056-amused-yam-5e29@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GjeMyR+2Zrnyuxzx7A879LiDn5l3+1gfQlsw3nUi8zQj8ra1Q3V
 hcsmryEJKdnC8L2eFMjypfHX2beqktxIOtn1shq4vmLKZsj+sufGTuNMYWvLrUANhqvQzZP
 AeazoISnvI7dR8xuIQbyayDfiEXBs32Mk5nCf4qkU9SN1StZ/E19TgVrOPvFER6/Bw0JojH
 tONccLR6Az60iIF38RETQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:z2S1a9NOmuc=;2A5OPGJyDLJpU7tciuUgJcdM+Ei
 HudMv+ENhQgZzuylvC53dvRENZ8pqk/USI96/izOveAAqO381AMNUJl/v5P3BiDilMnmEwXCD
 4iOq49Fp8KVHzTI/MTqacUiTtibpEF7M8YU9KJY5kA5rfwl7w/xMdJcLEPDSweRJ4JKfzWs5z
 tHDRTN9r3Q21EavIjiCg5ZyvgOW0GwrM+PH/aKcTNMMiTGQ6vxAHqBd/Fhh9QCX3r78H8j807
 KCFSOVoNEh6R83NfV+uAo3S17LAFPwY4ab9/AkhUyx0utmYr8KY/MGFkP8uAy25pHzSC1lyy5
 YRXSnf6/FdBrbvWHVPdkTYz8Y7TEv3zYnJhxdBZHkRhoEW/p0Dc36ftHivYHK0Kfk+hY3vT3n
 wt4KX0fCFruu63YDfB9qKZtEYIgdY/cqUFQSsr/mKsNYxUZ2eFt1mh/+Cq3m2+HFEEwHOGgQm
 i3iopE/Dh3mciS8DDcRzvFWa170g4phGwU3NwO+2wbA+p59RGALmER0bIKhlUjvTVAuneCrTv
 5k5pQEwJoxfOe+NWbXDljq2SHTmA39NyE1r2dmxw746ZPUC0yZOQOI9qF1lXr1rRKcjmgkWYo
 nmmWUwyW9NnF0jvVJd2Ikie/fFbtT8MV2ZqS3ZIf/pN5NUMX9gnOa9GjtUjGu0iKmNGOIFc76
 SHhi++meC2LwliQxRUkt7rVSGkeS1FktUDaez43OgYyh5fEizTV36o0ogdGrm81i/dvZVKY4i
 Q5MLdFjcWSz2/H1ryzDpwQ58cdfVfICCm8ffc7MJwOryKs1Wf34bt71gY70vaQM+MUDge+HcB
 R1PwfpBt/SPRGF6YH19JYiMIIFQ3x03DrI+/IH/II6gZgrTtOXyYPbLwImd5ZljhBq2Kj1oDM
 OZDkUI/+xDZiRkZqi0hxQKO7N039mVF/QGg8q1z3zq0xy72mLa1PWKYuwUdrdH6oatJXGMeQJ
 GE1Y3g==

=E2=80=A6
>>> It seems that further contributors need to become more aware about
>>> (and finally adhere to) requirements from the Linux development docume=
ntation.
=E2=80=A6
>> I'm guilty of my incorrect patch format. And do I need to write another
>> patch to fix this format issue?
>
> One of the hardest things in kernel development is learning what
> reviews, and what reviewers, should be ignored.  This is one of them :)

Recurring communication difficulties triggered such a response.
Please reconsider it more!


> No need to change the patch yet, let me get to this change this week

The desired patch review may take more time.


> and I'll let you know.

Some contributors will be curious how corresponding messages will evolve.

Regards,
Markus
