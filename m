Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567C123A2
	for <linux-staging@lists.linux.dev>; Wed, 19 Apr 2023 15:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1681919453; i=markus.elfring@web.de;
	bh=mZXtJ6fNtvkIltdDYa8v3MhZsN0r27fPYvulUxn1iyQ=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=BFopDl9iB632j1+gM/dotHZV0G9rN8hgrNvLAi1MC2cZeJkoAVj5EdWy0hYDNebev
	 g9nTk2pfuRbQ3ZQh8PKpS6Ff3Z6PFb1KNG9MfWHGHvyweKOKBmkVWjKLVGZeMR3hBc
	 DO6EJEgmci3xBErMgrihsUpcs/hTlKu1P/HxbBwyGqGxkOoDLuZrESL/uBj5I/dR2I
	 ebJtFM2baKrEUf4TfYurFFocgX/PmqFazjh6WP1CXK2/GS4qz71xESL9VjzyMSslli
	 Vgkw7+ca/HJQCmZPKBhN0UkLsOzTEJG608fVVcxbq9WFeVVGfYbKEB/I3zE0FRQNrf
	 BAusb8Xl1p6Og==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MA4fW-1q0jsF1ugc-00C0xb; Wed, 19
 Apr 2023 17:50:53 +0200
Message-ID: <6089720a-574c-c607-c9d5-7bb026806feb@web.de>
Date: Wed, 19 Apr 2023 17:50:38 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] media: atomisp: Move a variable assignment behind a null
 pointer check in atomisp_cp_general_isp_parameters()
Content-Language: en-GB
To: Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>,
 kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Xiaomeng Tong <xiam0nd.tong@gmail.com>
Cc: cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <d8ed4e5d-49d4-ca7e-1283-1ec166bf643d@web.de>
 <ZDmJsemYldOsMMrH@smile.fi.intel.com>
 <9b243f3e-92ad-197f-f0a6-b22eaf71238a@redhat.com>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <9b243f3e-92ad-197f-f0a6-b22eaf71238a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DLjqWpg9bOFnVLWT6MWNo18Pxf59m4of0cfkZHDwBZLf39gjeUO
 RtU6KTgpcLLbiAc5IfxscYK2ykatgWJpF0k4spFWKuuX/Lkjo/eM60BWk22drFQiwza/ZDc
 twldF7/LN/ulMiEv+oI00I9P1yUYgwZiFoqsajYn9/+ZWas1dCj3qgIENn2BqqIY4KRNbdE
 8504T3y4QatdTyHS/C1FQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:87qkBYVd3W8=;sNHOOakk3oUaBOA4EY394fAKrCV
 ZdrY96O2K8VED16RqNxDgB6BDDkTf/oxSYq4YHjiCLJox6iNiDRzgVYbrHLv86Pz5dIfsdXPk
 S+C7ozw0vF57LIWxKAVh40OPpHz+RghLJRQzZ5dO/GwqsEZkooDkhHT4vHzPpxv0JMpnGDMnd
 zm8gBrTXFtydnVjTXzWiMT35/xduxDNY0u0+M2Dc9pD6y6G1VdD7oCrpo/hbrCTxDlSKYiuvG
 IcoBWoTp750dqdTrNealvrMqQzbUl/rUmnuI3EinivFZaheOqtNtK+d1ZA/1k3//bYqgdpzC1
 Od6XuKQHiN3kQjQS7K8TwFq1OTxBptlRj3t8xpQ6Z8Ayhp04f4Y9svJ/KE1YBC1ttSdTjcyLP
 meJFh4MLN9OB+AFRqISDbOn+p0UMcIdFHKa5bR7GAWGKWbhWgHEVqmJY7cjZ6hwexdzu4RUFM
 V10ejeH5Mnewi7IEOuWKCGeNPx/VGhH4xccyjgGrMkxV5BIY+2AzB7PIM02R46/f/E0BpbaY0
 RpSPoszbdbBQ+q1xiLEbjy3rt0Rwlx5PHcaKJZAiBIE4zEsT7Tmu5bHQyevQJT1TRPsLJYVHM
 QCHdsIwGm8AEl3fn69RRpS1u7lYNCQueHUqGB8DrTkQaCulw8KkxqB9f9p1fvGnAiNky2I/h/
 MCzX14Jd9GipEmsYCgTQc9g4jJXo9LI3DAbIldERzFJ1WIyGtK8jpf8ylbNgKYhXmVlWsXddJ
 0V65AmG+QDCUf+JNecbdyyOw3Y7RdRSD1zFnqnsBO0675HTeHjOEJfiKgDmSFxgcx0/3SB6Hk
 hE6Hj3xKvuF44gqeRhozsbvlMbU22SR4uJ2I4C7ClKuDFCw6Eifsi2xyauoODuuM8owjSVlhu
 lx7JbN4vSQKH+363t7oe6FqHPM+Sa3mkCyU5ukPQ0T21yw08r1WL8BDph

> Instead of this patch, can you please audit the callers of this function=
?

Would you like to add any advices for a similarly affected implementation
of the function =E2=80=9Catomisp_set_parameters=E2=80=9D?
https://elixir.bootlin.com/linux/v6.3-rc7/source/drivers/staging/media/ato=
misp/pci/atomisp_cmd.c#L3619

Regards,
Markus
