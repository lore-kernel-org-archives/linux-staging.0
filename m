Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA6453BF
	for <linux-staging@lists.linux.dev>; Thu, 20 Apr 2023 10:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1681988069; i=markus.elfring@web.de;
	bh=5Hd0u5JOugHNMhUh8SCnU+ikBmTrD5in2V/ZBCXNYm4=;
	h=X-UI-Sender-Class:Date:Subject:From:To:References:Cc:In-Reply-To;
	b=kLeYlNIxfBwU8DyHbUoEKDvCBFgZPk0V4JC9O8e+7m7Nw7bfHyamFWxablhHNIlG8
	 z8Dm7LXgiMyEd9HIZ1th5qZk9h2VINd4MuZVqz+24gHgs4kdYp+OV0UNalOenznpTM
	 r9BHDw22Gu+kCU0/5SAyFW0Z8TpgmYy7WUyKr4lpjW96EaXtEoufr10QZq7dLD3m9N
	 woflFsMAUaUoUCYKuZOO4SaEJ11GcJpkvIvupin2bL3Oo7pt6hUZgwOCm+nb85Gch5
	 NNO9DR3VvDE8+xUpZbrXXOTIssWieqMJOiL9tseg3y15n5nXHVd9M+VJez9jA+W1bs
	 OQP0/kkus8WpA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MT7aV-1pkKAk0iqd-00UaU9; Thu, 20
 Apr 2023 12:54:29 +0200
Message-ID: <93913f0c-4699-cf9a-0f10-8edd478fd2b3@web.de>
Date: Thu, 20 Apr 2023 12:54:20 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH 0/4] staging: rtl8712: Adjustments for process_link_qual()
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, linux-staging@lists.linux.dev,
 Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Larry Finger <Larry.Finger@lwfinger.net>, Nam Cao <namcaov@gmail.com>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
Content-Language: en-GB
Cc: cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:m0x13uBkifOdccciCosExyWr/uBZXNH8rt7g/Wu4MO1yifXH0Fz
 1enfkvRlYt2jXnVwkUrXaRym6InblfePcSybRazqk8mhlHbu2vSVToPqM1IZLheWmC5RbiW
 Ak0UlEbuaLxyor+u3PiUOKZwj0G8PEylvXL8Pa0sj7pzx8Nb0IOxOk53BkiBY2L92VGGpyt
 2CALgLeTvUOunOO0sItIA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+jsE5C7a9oc=;oKiJu5EXKhvMxJDWVjXRlYD1mq/
 30gksJr/qibHbUijVGadV9uIHnmEOuhAL9T3WUi26i7J3SPbnZQoao6hE1gnB1Pz8kjDGpW1Y
 KyTg7Qf40R/dzWsX5KC9u202Svexmhy/pvxo7pUfpbZ2KksgYQ9EQbc+D7SZIt6qk/EItVIwE
 9Ps4WIokrNhB7+XeC5zlKo6vflkjslVZEPysIGUxCC0y1anacP3F4898BlzCpmv7uaGnEmkqv
 B96kZeYxBal2iQub7GpHEKCdey56lDA4NhExK0WPPHIgMgF7K+WI0yzd9w877Jr7HdG7NVTCT
 hLx5nUVIccaHYPqxKKyMPnwcroG4yqkDiA43C3UMngKqH+uEUsQJjPRa8c6Zyev3OKmC7mvzb
 hWKD93mI0QjZXwC6viS1HGDf1Hq5WkOs8tCoKnrzmySSPmbKcOFN6+zEQXBC4Vssgz2kvxW/G
 mKLty/k/JCZ0y+96qFKzR24e5qeFEqpMJnaFFCu3FPIEFSf3C0FG/0CFTjWH7oFwzBssk/Ubh
 qUa91CIzOAMA7pxS4892hM9esCrCgQQFNVG7VRkgdIrU4YEgNivSHD/Y2o7yAivQpaBsK8Vlp
 BqQ/VymCTOfR6f50AQQfbgwIpwGZldoJcNHYHgVOB2Lug1dMpLfLPAwzu0thtv+4pcSDD4XVC
 OEF2zkWFJjEsJ13fBk8UrgA23Hs6QaR7yQ2ys+mDuVO8CE6l6l87adWNLddWTw5I2qsuKZxfj
 ITKmU4t5I767PmFdF4G/7J+g5SiNxtGMGhRZ9jjlfg4wsI2cY/tgADK9Y05d0xNDYAhv5XdRb
 5jl3QaoVB75RB/W+I8/0UbKLvUJQQYvMoz03zNhJbeMF/Xag6Jr7+H+K6g5H7D1eDfe2+5zRS
 96X4b/yqX0Cz06UVea4RmPQNc3W/TAUxUlzkNTI2jhshDDfrJBjX4yA1Z

Date: Thu, 20 Apr 2023 12:05:12 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Delete null pointer checks
  Delete two variables
  Reduce scope for the variable =E2=80=9Csqd=E2=80=9D
  Simplify the usage of an expression

 drivers/staging/rtl8712/rtl8712_recv.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

=2D-
2.40.0

