Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E707CBE4F
	for <linux-staging@lists.linux.dev>; Mon, 17 Jul 2023 16:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1689611421; x=1690216221; i=markus.elfring@web.de;
 bh=SHFKQTx4I2uUre12oEx6R5/rWLKJfXW3dMwSe9V87+Y=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=k/oJTggyz+H/f8FYl46kzu7SGXhkfIIt6CT/9gIZhfNNEYkxdrLAa/Ffzos7sn3IVKWKNa5
 3TrKHcw1oBqFxDuL2joZXxj22sua0B5giBydkcwrpktfxfY6AQbC43AMGpbYN9292kK7mc0py
 YlPX8FlRt4vontnZoU7f5vLIGsv3hlflZfD+r3TrvyfBiEe20RM+nVBZvf9nOYBrNbVuOLF04
 ddl8LyHbn2x69A2yjJfwt9KIBi9KpFexN1q/xHg/yAyNHQ6IglYgyvaV37kml8ZDX/DfGfysX
 hqtO3fy0uwV4LqPZK1IgOfiddUf7d6fdDz/zEYp4LWRa0ECDf3ww==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MBB3s-1qEF3D1ZB0-00DAP0; Mon, 17
 Jul 2023 18:30:21 +0200
Message-ID: <46371c1c-c926-6b2c-16f6-0da812da2731@web.de>
Date: Mon, 17 Jul 2023 18:30:13 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 kernel-janitors@vger.kernel.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20230717150611.42832-1-benjamin.gaignard@collabora.com>
Subject: Re: [PATCH] media: rkvdec: increase max supported height for H.264
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20230717150611.42832-1-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:TziCv+vZnuOfHbr8j7j4EBa93tlN9hgveSo2W+a4H/HVKIOcc/J
 0PI5qVJDZDMq5OVSSfPG7BSTX0u9kk0g49EfYgiuIm1ZdVesVQ0ku4FLDx9C438vHkNQwN8
 IPdnUu8ajTByCd/lV04z5KT2QrjrnAIc5Mo5MFPtDvbEKwgUVm9bu5KBVyrX9caRL8G49mo
 lFUbFdg6XPMznOmQJFwfw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:oOQ9Qx4cIZU=;+3tACxPwPuKWltutcW/4SEkjtYP
 Z1+WVYJv44d8xa1Wl4jom/XRMRQvBUNTbhD8bFgy/sw7fzUlhJQyoFIa2phD0N/QM9GhGYITH
 41bdmueQ+gry7H8XQHPxraSPXb5WKNLzSgOoNYzrfn5iUzD+mq0hdC9oxWuGfzP4gkdKLYq+w
 AsNE5JByMKRT1c74ya682I82EF2uv+uS0nrlanYZs2NJbKsHrSPDOkoEmKA+Y6z8Pu1ifrvIM
 G35gRJMBbpBlRRWoGKF3wduPDFT+VN9gr4zhmYF0+S5OabRK9m1vCIXxa9tDUBtQdoyW+uiOT
 NO76ABXo5VhmGj/0hI8Dl1AFA3NC5Rg112GS4AovPCqlPWc+7PtspiU+G3SsU7boViMzqsmEt
 P++q7184f4hM190jO73i5DijasMSH3oup0p8C1IfPfD0n5M/B1ymtDZQ4wn+vjuZIRtqH0oJJ
 0YLrLZcNujSdlURbLdUXyo1V3fCuUDzGDcTd2DcnUef6hYmt0cYF7gYW2ZY/3puOfLAINtNrK
 yfGSPdqSUNG3pvqKValoH0GsjcQUHLiGObfsLvO9hVvjjd5ELTIMQ2xIsoebSkwdGARyOksu7
 C6YQewc/pg3SbeOdZJb5SJrGrQw1SgtulZmXvGFokU2e3ngQWm8TX5SKTqpBrWJ//SKeL9Wr+
 AW+nIT+xMR4vCqkq7DIU4jG9dqrcA9j0Kw0BfmAMgfge5UdJkEfiRbogZt+SBQ7VrjfQMbdhq
 I7V0DWjdHTSGr2ISE+Inye0O1GR29TIsLOO6NC6Dhxs2cExR5lL6HHzxbA2CdluL5NLP5LefO
 KN4FQA+rsdRJPJvIL36udMS0TQzIUW/KlJF4wWND35u8z1FktY4FBwjzDZmkhI2eWDPP2ama3
 UtuRrlmYVjiR4wo1p3HVDnmgtXHLxbGmJrmIU45Ggw5o3AbL190cp5mAXeALYgZs83rtyUpkW
 qBP9ew==

> After testing it is possible for the hardware to decode H264
> bistream with a height up to 2560.

Are imperative change descriptions still preferred?

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.5-rc2#n94

Regards,
Markus
