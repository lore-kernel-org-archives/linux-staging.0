Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD79723CD
	for <linux-staging@lists.linux.dev>; Mon, 10 Jul 2023 06:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1688970110; x=1689574910; i=markus.elfring@web.de;
 bh=42kO++UW1qAfJ9DX+6wgsp1asYnY3UofIPxyTDLeN3g=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=eXIDxS04tWgyg4HPQVVNoDA/W53FZxVrRrm+cs2Dz28/VmTg72x8uE5c0OYNjp6SCYsoYlT
 iS9q9mhqqDb5y8b+QSMsmUGu3Nxr9edzmON25qFojMn7LF/kGE59NG9AqZj+YLOJHKPYUcf7H
 OvMIP9vnt7hcMSRhMqsAAXqrcmO3AFSusrAvJF+kYdYxDD11WLBeTI4KRoPPChVDOykQSFqxW
 iV4h0AbVQKjIP3P1vwUG0QvnF4NF68rdbBnyv4S4DF8EDaxk7VzsUAj7EAOFXhWORInqlfkWq
 deqnxKHsG1XJgyht/vwSvEmwX5OF9RbfPR8ozE55FsrCpp/zOpww==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MtyA2-1pzzVK30rE-00uCjI; Mon, 10
 Jul 2023 08:21:50 +0200
Message-ID: <c8d9a151-67d0-a5eb-dd3c-12aaa85b5178@web.de>
Date: Mon, 10 Jul 2023 08:21:40 +0200
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
To: Zhang Shurong <zhang_shurong@foxmail.com>, linux-staging@lists.linux.dev,
 kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Dan Carpenter <error27@gmail.com>,
 Xu Panda <xu.panda@zte.com.cn>
References: <tencent_5153B668C0283CAA15AA518325346E026A09@qq.com>
 <2a41ca22-a0eb-df38-be43-7175e1230bd0@web.de>
 <2023070919-monetary-sleet-2f5c@gregkh>
 <e24f9c2c-1163-631a-f8c0-b6dcb445a858@web.de>
 <tencent_BB4124566E846A2FB6ECC0F63C5A15BE5009@qq.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <tencent_BB4124566E846A2FB6ECC0F63C5A15BE5009@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pOeD+L3/BnthGHA9Vld9+QP7fJGlaEpvV/QVAxypiD1/FPb3IsB
 XPHddMza6tVsu0u2MAiSCnHQIKJq0kBVH1x08no7qUF/5/+VCvl7BFmRT/iQA68KvVe/3q+
 yljHue2qKpd7jnaaeHCM+LB41NjwTNf2s9ddHx0T7BjW/r0HMMFRpKUJbVnQc6w2VOuwPlD
 cjJY6XWraj7xZVR3wrzmQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ELTMD5khHWc=;Q9XsD9yjgt1lDogx03o9jAZBcWM
 9ldTFzddsFj+YmaMu0JWE0xK1tcwhsDOij+Y+GrGuN0xCNL17V3BB4oYLc5IigR4cSEF4RKPz
 7tjmhCLv+ZTOXrVGLmNrAye9zGv/vZwqeuW0sX7leSm3NKjvJ9oA8+D2meG56+RBjZ+uy+Y6G
 eHlBF25n+EEo5FfCarUaxkz/MDGyXqJwDCjR4q8yzRy9rvCwNGpgFBHLbtP+wzHgylJuA6KnS
 Zfb+pfivfEnOU4sxw00ubBfA1Hxre2vGd8vSAyMN+jZH4tBJ55d7wkVS1rafJq9NkB48hQ36W
 b0Rd0pv0ypMQfxzAujL13Ai4gKJhgDBzj6rTzvXKP1lX+WJ5TIdFyniG67CBlBhRWx4IqxE1T
 a00Z0T0wfwxGGHDAE4NO44zn02+0VTBBSgRn1nyIGgalP2YYHJzXIw5NllwQdLuP8FfCMehbg
 cFZhm3DoGddW0yZyt82eshGFugwEh+0i8XOIjYcSoh6VceNr7tFIhL1eL/VPOUzJFPzW5/8aL
 YY/PRxAUxUwV3TY3ptAqlwr/Wff2By/cTalikYMdm5B99rSPc2t0w60J0cPIQd9cAg/dWVXxU
 GLw8rTwsF2eUK41lwKGwSnsNzl5UlVOvY+7RXm4uDKeHDOuXru9QMGL6xQynvuBJKhoQrZqHV
 qGrhabeDtnnOKKlPpVfSag69GXPVtFd9Qp3uJDWDDHWcISeYd0H9wzvL4pwbqWUaC+nR4K5vu
 uF4LA/llcKNMEh8wDhKlaNGqM91ZUnAnseuKmWsCv68JFTDdgJzM6LJ90S7mzgI9dHvtFISE2
 a2BGLvh2Lj3izFfHcqAfXyUWW7EX7ZjMJaTYJmpoKkYU8N/QecnbdfC+kMyr7ZXHzuOW5dRQe
 YOx1aDOB2VAQ5JnPCzE5XgdrCfY2GMX0HkTGzSSQIw+SkF9+ZrX/pwCfIbU5+HgubYl6fzpwP
 3kAH/A==

=E2=80=A6
>> It seems that further contributors need to become more aware about
>> (and finally adhere to) requirements from the Linux development documen=
tation.
=E2=80=A6
> I'm guilty of my incorrect patch format. And do I need to write another
> patch to fix this format issue?

This can be an usual consequence for the current change review
if you would really like to take provided information and advices
better into account.
Some communication parameters influence if further development ideas
will actually be picked up for desirable improvements
(also for your change suggestions).

Regards,
Markus
