Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5570C7A
	for <linux-staging@lists.linux.dev>; Mon, 30 May 2022 20:19:31 +0000 (UTC)
Received: from [192.168.1.107] ([37.4.249.170]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MG9To-1o1G3D0NOG-00GcUg; Mon, 30 May 2022 22:19:15 +0200
Message-ID: <e9d2cf9a-c4f0-997f-72f5-1b10379dc126@i2se.com>
Date: Mon, 30 May 2022 22:19:14 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 0/9] staging: vchiq_arm: remove some unnecessary global
 variables
Content-Language: en-US
To: Adrien Thierry <athierry@redhat.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Florian Fainelli <f.fainelli@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-staging@lists.linux.dev
References: <20220518191126.60396-1-athierry@redhat.com>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20220518191126.60396-1-athierry@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:L94GrfvqtcCLd4FbKrBt3vo7XEvIun3e554ZNY1T0Gu2Afm9jQT
 JEHScpoBYu1ziKyPRlFJjKzbPf8R0B9LYzmR+LIzcpwokkJwYYSCVzGc8hcmGDZLkA+p57H
 EdvZbc7RYkoER6GBicmnHsj9S8Clplgtb+M/eky2VyLI0vTpINS27Kz7RV5Rax7+h35s0LW
 EXlQhk6GNBt6nfFMsVXNw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QsJrd3WJrb4=:SSseRzR301lR/QMOjMNoQP
 kqxVCAvC83TNsYJEAyd23AqaBFn24DO03gdYA+T5zpZVAdqQUqzgml87cc29n/aSrHwJ/Kq7t
 vKoKZjF3VEqj6AqmeLoSIj+zNOcriv3BhzM+HETGXhKAEdcs6PSHT2kMHbWeEWA1dlHsS6lc0
 s6rEhR9y2mw7+1QQQwTEJM48ckm3r9nHHBf2rgfngfERlLPKGmsARoqHIsY11xpHgbcMJZ3Ij
 QCMndHVRCOvePYbjmx7Jsp4zDMU9uVVBvCeHsiPjEb2jX2rZGqr6VAVqKdE/+sxprIu2XTJ5W
 FKQXjRFJsolCJK0jI29/h1+fnj4j/ualk9b/eLQEjN+1Csz4hgLoPX0LhR9YbG8CIDK8fq/iA
 vJ2RapxaGnVg3gYuDof5D/aeRSl5FCChMfBHpMFCnVNvldLewUEb+Aoe4mTVq/dE9ZIGJt83N
 i3dY23xGJYvLjV/fw7E5uXYCBL2OqKoM5GHgt0INyvnTfsyJWoFNY/D2QELGgdvUBUbruoiYG
 ObaFQBEpMLh9N0/2nxdyRDiChmWFfN70YV19ZpZbttHBQicZ968tF34CkRFliJNzg7iaRMUa3
 qhHwWSjbJDECw/ypzIp1PcCwIHMRnRdQxHJkvklL9m9IZzhm86DzvQVKch6ZcDeOOY5wDLRtW
 juHgRrH1hHE0pPbEdJh0kCbSQtNkhglAe+hoAlrmdQTjJRq3zCQSqg2IJKHYGyGyAIhbgYVLw
 N4DRKd67Si32TLplPmnFdx2MHddtKx66JqaZ+xEcmOcVfycrMt+4wXe09eg=

Hi Adrien,

Am 18.05.22 um 21:11 schrieb Adrien Thierry:
> This patch series aims at removing some unnecessary global structures
> (namely, 'g_dev' and 'vchiq_states'), in order to make the driver more
> robust. This is part of an effort to address TODO item "Get rid of all non
> essential global structures and create a proper per device structure".

sorry for the delay, but i was fighting with some platform regressions 
in Linux 5.18.

So except of my comments, this series is:

Tested-by: Stefan Wahren <stefan.wahren@i2se.com>

