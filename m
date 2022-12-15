Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E1128E3
	for <linux-staging@lists.linux.dev>; Thu, 15 Dec 2022 11:30:51 +0000 (UTC)
Received: from [192.168.1.139] ([37.4.248.22]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MY60L-1pQWl52yyL-00YPIy; Thu, 15 Dec 2022 12:30:34 +0100
Message-ID: <5c963fd9-97c9-d513-a8ae-5d3f22ef57cc@i2se.com>
Date: Thu, 15 Dec 2022 12:30:29 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/7] staging: vc04_services: Drop VCHIQ_ERROR usage
To: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Adrien Thierry
 <athierry@redhat.com>, Dan Carpenter <error27@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20221215065853.34477-1-umang.jain@ideasonboard.com>
 <20221215065853.34477-4-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20221215065853.34477-4-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:bGkgykONBpPpX1R6OdAO5MPBl5f1JNTz1nwaYLWn+4fGLciBgMJ
 /VWt6LyeTaZqwsut1MJb45AMkanBWgqGCiXI3rLFdZ06TpnQioP008UhAdv4WGxsE6/MwuU
 7vjMPdFST0lsoaPLMalwQhij3wl9/IC/qHO/f4DJ29jUJZflQfzwq57FkCZSIG9DR7qEA6p
 X4HebJUgEyzx5ogRYFstw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:W22YIdGPMrU=;ikY1hcWHU8ljv+qcgDl+GdXzPAN
 /+1f8M2BpjQ+wQb/Rt1ODf8EjIpBI5CRybs6o+Trc97jKin9sa0PcdSF6gqTnw0SdNuXgmypO
 J42M6vN2PO+hxvI6qrb5Q39MedmBr4GsGSt9xVPfUu7PIefzQS8kbcis6GSkl4B1JDLlR6fSE
 9iwLZtxzNuK94tWaTbq0bZsWo69mQdU33z0522cDT1et0aCWMBvKYMmCc62Ns1tN+3pelAiyA
 WPlpTNUhAbtx32QSTu86ro6PzQg3JpYIazv9Mdix3gj2lGZCOr62qAFZiehtrb80hihHRpJmu
 lzllpUUWGoZtekyj4s0bWdQycrFSSLQtIpekGeqYnV6LmXi0pgFXPw9zKWQcdxdAnHoNVdfPe
 uqNywTDxFak0DidNiiugS/Iw+1cM3YiLtfPodOMD1Ddo5om20HI5MkN4IJZZFPkuFdYKzDhyV
 beBHIbjPSc1rgxZDUJAdOOSPbQz7YRef5z2SI5F8LwLSgFy0Gg2+rj6F7b6ia19draRdzXh06
 dxueXb+8yhK9Ak7Ak4ZXiJkrZc2So7MoHlCvFg5eKIuoilh7+KBPDmADo7FpU+VvIk6QqU+h8
 eqx5UrTvQEDt29fAharEH2cKyh1oebZMjignoYulKBt2Oq1Mg2hK9Fm5M2rSph3d0oUQeVG10
 ToGjLMX/bV+3KI/4L/aPJtsaV4n5XIMdIKpzdsj5wA==

Hi Umang,

thanks for taking care of this.

Am 15.12.22 um 07:58 schrieb Umang Jain:
> Drop the usage of VCHIQ_ERROR vchiq_status enum type. Replace it with
> -EINVAL to report the error.

I would prefer to use adequate error codes like ENOMEM and so on. I 
agree simply replacing all VCHIQ_ERROR with -EINVAL is easier, but 
wasn't the real intention of the TODO item.

The rest of the series looks good to me.

Best regards

