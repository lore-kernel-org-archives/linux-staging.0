Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF452C12B
	for <linux-staging@lists.linux.dev>; Sun,  9 Jul 2023 19:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1688930506; x=1689535306; i=markus.elfring@web.de;
 bh=D7ZgwhEH1o8t6ZNyOqtqXa6GyOskUny/MxbasXBPrsk=;
 h=X-UI-Sender-Class:Date:To:Cc:References:Subject:From:In-Reply-To;
 b=ZRoIvFaL9NI1v0DrFilgfm9AJULoIPu375HG2nk46JP5tTcAV0vJM9KbgujqqNmKsPVxVe2
 u17HpJpHSO0cv4h62Auwb2yOqKzuYyNwGwj5y4oZqisDLQFFEs31TaWdJHbODjws6V185SAEA
 p6Z5qfAhTyQVBxk6UPc7PthYzDjFagNuYBqvV8dJ/9XMv/A9BZg8tQUuN+AcDV343+0OPAX+C
 VzL9fH8p8Ey67teeAszrM+FpU98ltCteYsPoxmUlrsaR4/RexkAQo4JpWYGk1DFTWUWmM3cFX
 bOggPOJeIcqmcpTIAgqslcDHqddRFG98IhnY3Uxij0Bko2h+Pv4Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.90.83]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MbkSI-1phrmO3RLa-00dZFz; Sun, 09
 Jul 2023 21:21:46 +0200
Message-ID: <2a41ca22-a0eb-df38-be43-7175e1230bd0@web.de>
Date: Sun, 9 Jul 2023 21:21:45 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Zhang Shurong <zhang_shurong@foxmail.com>, linux-staging@lists.linux.dev,
 kernel-janitors@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Dan Carpenter <error27@gmail.com>,
 Xu Panda <xu.panda@zte.com.cn>
References: <tencent_5153B668C0283CAA15AA518325346E026A09@qq.com>
Subject: Re: [PATCH] staging: ks7010: potential buffer overflow in
 ks_wlan_set_encode_ext()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <tencent_5153B668C0283CAA15AA518325346E026A09@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:EdtWWxXbwlcqYWzLltUIa9KOLnh2Jbqo7Rt4uS4oXQQ+DP9vcek
 dCiygAv5lreZL6NgehZSqKIfYRXk6UEtIyg2ZH1c2ddg5+hGC/OZ2eVXjhoz1rOm/9i4yyW
 ruK2hBfEZGEZESgSttD/otwRLMj2/Sds4rEC11lqJ5qYCUpGGZblef2ZzoyCjiENudEl02P
 WIaNI0/WjUjXn3X0ukSWw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VCpkI1KCuG8=;GuAeD+bxldkcQAvx5wEdFpklokp
 rlovcCf+uXGeO+zUnAVGlcR0bI0Oi7HfPePKMQuyLk5KnAXGyC9qAANZdVcllvM4szAVqxz5O
 2H8m0S9YZHqfHozTuL5/UEw5W0lLWUvpLyZh94DSLSXfrhzoRMcbzaEjuV2Fkjr1xhqJ/OZpQ
 z+HZjNpfdcWCpd4lLrpsGgA1cY5tItTz2jBBlYHH3gC3b9zBsvm2kwcSN8sc6AWDph/2BGucd
 Y7iR3OQGL4b/OPrQEJIJr3AYipdROpDKucZazka1BnCtMJifRnruzDAFGAlWMnRFTNAJamRKm
 yU17scND1t5Ka4uNHvO/43VXysGOdIHqzeoinyaLD5rmnpXvkJfr/ZvizfLqsCwcSR57cCN5Y
 pvLI1HsvjJrQGspyKJy4jcLPigZh+noSfMRqPH/i7LxQZ4x0BXiHPUM6ulC/yDt5RuAjET7xs
 MYhXCkxFqrAJ36QEUxyrHtvRvSIhKeoFg1siMa2p6Wp1aUTzDadWsJYRRTUf8z0/sdJMPeVKd
 Mh54ZDM+8FJgzUoVAp/qWTCER7jNfl0e8PXtjEoeIo0kMZ7ZKY87X3ojgzJ2wHj44/FvyBXEi
 JE7Yyfb8YyUpEd21jCjxz5On/Y+UkPMGIZ4FrsK+YnRN7bRgldXcItL2TEHpTz2SLG1Fzr80l
 2f2B8x0d9HiJf6Hp39AYJYc2Dd64+AFZ8sLl+8BmXXIEJkBcNj2qIyA2OG4E3qhDVykLD7Le1
 oEaNXdE3OknUIVFP00MVPB0cj8kT2J80WWtVwYEaw7RI7V2Weibx2QO9MMYHnp8Zb1yAt0Kvz
 AQf0e+/RVdpO8vRML1zrgfnKirszkfW/UoG2lrI/CXe63u06jQZcmnfhgW4kzWXqblpnZDpjl
 sJwFR2k6jPWgkNbpKf5MRMBUC8QpIniM5A48l4tNPS+Yj6zc3VbPjcqJW9JVlxKOScaTD31tt
 tz+IUg==

> The "exc->key_len" is a u16 that comes from the user.  If it's over
> IW_ENCODING_TOKEN_MAX (64) that could lead to memory corruption.

Please choose an imperative change suggestion.

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.4#n94

Regards,
Markus
