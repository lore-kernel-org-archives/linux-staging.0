Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A91B23A4
	for <linux-staging@lists.linux.dev>; Wed, 21 Dec 2022 11:39:52 +0000 (UTC)
Received: from [192.168.1.139] ([37.4.248.22]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MYvLi-1pL4Nx2RGq-00Uqh4; Wed, 21 Dec 2022 12:34:13 +0100
Message-ID: <2b9c0f42-94f8-d2b7-6be6-ab699f8114d9@i2se.com>
Date: Wed, 21 Dec 2022 12:34:12 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] staging: vchiq_arm: Remove extra struct vchiq_instance
 declaration
To: Umang Jain <umang.jain@ideasonboard.com>, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Adrien Thierry <athierry@redhat.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20221221074047.233473-1-umang.jain@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20221221074047.233473-1-umang.jain@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:kiBeU43GXecUiKrJ5RXjnkBJvCO8Fs+MA/242np8vA6T412pMmf
 L1MYaAo7E6KuqwaE2mELdly4Pq3wktU/26TOEeAEpIgaEU1/qzzyJgxmxCTdQ4HU/UvKX6e
 KYY1DkiCfP3Mxq5zgsVYJRasiR7LK/Xlge9mQXkVuo0ykBhxn+JqSbbRNZPNZLGTQ9U53bT
 51Uo54OC4Dm9ROMUOmQfQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fKXeNMGt72Y=;e4bW1qbnpiFl3oEhMQWa2UKkgcf
 PHvdla4qKp9smTIP5WmYBefKbvqppwq4sFVyIKhi7kHfs4o3RBQt/O5hRDOvi7VngbjXl1flO
 SH/eReOcgCh896FtdeWF2QfBsBj1BzHgoHfSYt+JcsbG20yK+IafsaY9ISHBQ41ZZ6zL6H3HN
 sSML1k3KqH7yM+vlwZlfvXdI77Vocj7cUIFLE4VNyiwoJdw4hZRllNduAiZBa6uDnJWYD6v4t
 firEWV4bD+6VFScg5lHk35r2gN4+wfstzcFvk8gEmZAvff+kKlvYuzepBx4RgUNOyQp9Hs14S
 ocJemNuj45wY823yXQpg2dBylFcxv7cN5GS1FwpZNHyfRtawxRAdGMkVSmHgfV4HppzTg2TUT
 kZhG4xOvzgARJl0I2789clZsgAws5uBDlsZwAaHvAFrLIFHsDwPFZfKjuMUZkIpSHvWj/fjZC
 zecsRkY2/an/Ypyr6Qci2AyQC3LRJyKOnekAh1VD97iE1LmERmNrevpgfkUZVvZBmm6/2L0Xn
 W58m/GicZBBuquWJk2pcluoRO02USL2TFU09ZekvJQe3SKi3ySrvA1TL6TgZjFVk2kB3ypjw6
 DHD2C290M9716fX1bNKOXtEcrdSHeb1fSLua/RF0nFi+QpgW9ZQtgt1PltSTbovvWly5NR7o7
 NjfVb1P8qKtdLkJjJbw5ziZWv2VaEVeIl+CiV91hUw==

Am 21.12.22 um 08:40 schrieb Umang Jain:
> Additional declaration of struct vchiq_instance was introduced in the
> commit 726e79f8a648 ("staging: vchiq_arm: pass vchiq instance to
> service callbacks"). Drop the extra declaration.
>
> Fixes: 726e79f8a648 ("staging: vchiq_arm: pass vchiq instance to service callbacks")
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
Reviewed-by: Stefan Wahren <stefan.wahren@i2se.com>
