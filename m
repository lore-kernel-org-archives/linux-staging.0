Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5959234448
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 14:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=s29768273; t=1686146910; x=1686751710; i=markus.elfring@web.de;
 bh=RQuo8dyog3mYW6in/LTmEgS3V88U2/IL0mn3Tu4TrUc=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=rXFZqmCrqnaxdyWMe1gP+A6tEt0YI2RCq/i1Gfbm6GB2M1Z+r66y+G7ZNyb/7bUmX2z6kN2
 VuDwdLfpGRJA60qFxb0kteAm4AyWzQ0bQnmdUAdvvBirQjpK4SsgUlm1fRJpDypnqi4m8NVni
 zqI363Q6gP8K/itl2TBO1HjS4zlzUBYVceyF23NDekMHgFb+PNwt/mhYrU6GTzgvjP38l+DRC
 IggDV8zFsG3JRVrLIHwiFzx6cOycE0d+6g53i1A5efD9kRoTaJfdsE2dS/V7LFjb0Ut7mkfb5
 0TBqRcJDl/1i64Mt90Yr+Y5MumxCfBFrKqxN37yV9OhEkw2aHmOg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M3Ez1-1qASbT06rV-003Sx5; Wed, 07
 Jun 2023 16:08:30 +0200
Message-ID: <64ec9964-c22c-f299-6d92-46050659be06@web.de>
Date: Wed, 7 Jun 2023 16:08:22 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 00/30] fbdev: Make userspace interfaces optional
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-staging@lists.linux.dev, Daniel Thompson <daniel.thompson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jingoo Han <jingoohan1@gmail.com>, Lee Jones <lee@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <16a8f34a-d4f9-2e1d-02cf-e4c53f89c006@web.de>
 <8c2db8a0-048c-af17-85f6-ac0946ce0f0f@suse.de>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <8c2db8a0-048c-af17-85f6-ac0946ce0f0f@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:fJm+G94cMiRl/h+VYW8PlU00Ki7hpzXkivVYmv8yENERx3uKp5K
 GaeSzOe8BlOFdIuvU3bSKI8NSbO7rv+gBdupT5CmsPPmxqjhinsZAeZZLDAoZehhoa8ensS
 QSDUJwMJpJAaJ3c5P8Z1FoE2wtvGjjJwoYoXkQPXmgMjiLm4eP6pJVgbCIc5EZmAWAMMkRn
 CQm/Ipz/C6erBejE4kJng==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pEeMF11ffUg=;reR+2WxpfhX7l14ubMI/BhmJ8B/
 TjQTBxwQeSQlJof5nujYo/ZWhNYAh5oQMddnqh8oKfz4H6v2L5cTYerVQQcIAPc+w+iZUZEbq
 to3q+EOMuAp6yK4LvB9X7yszVcbH4hVGDVXcjKqEzPp7vfnFiBCsBytUcj3S6sWfJZKU8mlJI
 Zsh0LR5YUjqmUBXObzONdTjW0TA7HH/c1U66LMV3Kr88yMKWNDiaNI+Hl531Yt0CAKMl58WPT
 3o8xiyTgENi61Kzv0AktMgNpmzxu1k8JMo9jWXrao8u/TSS0l6y+o8t2VGaBU2uNkAQS58lR/
 Npw+EURNMXbrgrlpSwraqKmzoqkfn0CA/1/3NP8X1mgXptiecZZ6q0dBim6YUcu2T49HKBAxB
 T1yuxr7Cg4ITTBEHRgYTmpnaimnNNUmIdm8CaxcvqpYp3r8ihA/LB/9Z2+nvbVuiaO+G2oQoM
 fsZUNQI65ZzxRZJh1ZJNqDzFTtwsGurgO+IHikWKgIZZulcAgiXB82tBkpE0WG+DWJhO75S/b
 h17qggkb3gSqjtbUQPc7UAuBRf4NZWFoeleE7wOo2iG6t0jCl+B9irTp2XfinUB5kIfU49nz3
 8tcYx6v/2ns0HjCX+cFUdkCTykV0Wmp85wxkebjjRDrj77ruhKm/D64AV6gqvwuj08VvSh7/O
 CxZM8Dw/IALAYkgy8yeXMUe5J+mhBDYgQRjKMMstNv/MzbBLi2Bpz7Bjfd184g4qnO5Puspim
 midRh8AQD7FyRGhAAQKk0CrivrKtPa/uqpUFAUq122nsN436uZ/yTiJSbBALA5bnqnTBHi6t1
 eZ55Yws2W4VlAJ14jL8rhRcMnm30wJAaUy5Ky4Lw6A5gAp9eVWSKLizRllskJcJNfvuDfJDxm
 n9jeFIcQkKcqp48fGvvkMj6rcQ78uk4OmiuSWR6cQ9ffFy2zLGhzRnVLeoyLWm/Persm6yAjq
 iSfdSQ==

> Ha! It says 'distrobutions'.

Do you tend to prefer any distributions?

Regards,
Markus
