Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F169C2F56
	for <linux-staging@lists.linux.dev>; Sun,  9 Oct 2022 15:25:42 +0000 (UTC)
Received: from [192.168.1.18] ([86.243.100.34])
	by smtp.orange.fr with ESMTPA
	id hY42oBgzsPMmahY42osAN0; Sun, 09 Oct 2022 17:18:04 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 09 Oct 2022 17:18:04 +0200
X-ME-IP: 86.243.100.34
Message-ID: <a5ce79f2-2027-24d9-9636-330471cfcf6a@wanadoo.fr>
Date: Sun, 9 Oct 2022 17:18:02 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2] staging: rtl8192e: remove necessary braces for single
 statement blocks
Content-Language: fr, en-US
To: Rui Li <me@lirui.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <166532561205.8.1223417525390189864.67805880@lirui.org>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <166532561205.8.1223417525390189864.67805880@lirui.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 09/10/2022 à 16:26, Rui Li a écrit :
> This commit cleans up checkpatch warning as follows:
> braces {} are not necessary for single statement blocks
> 
> Signed-off-by: Rui Li <me@lirui.org>
> ---
>   drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c |  3 +--
>   drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c |  9 +++------
>   drivers/staging/rtl8192e/rtl8192e/rtl_dm.c     | 12 ++++--------
>   3 files changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> index 18e4e5d84878..8d20b0deca37 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> @@ -1112,9 +1112,8 @@ void  rtl92e_fill_tx_desc(struct net_device *dev, struct tx_desc *pdesc,
>   	if (cb_desc->bHwSec) {
>   		static u8 tmp;
>   
> -		if (!tmp) {
> +		if (!tmp)
>   			tmp = 1;
> -		}

Hi, unrelated to this patch, but 'tmp' and the 'if' block' can be 
removed as well.
Is is just dead code.

CJ


>   		switch (priv->rtllib->pairwise_key_type) {
>   		case KEY_TYPE_WEP40:
>   		case KEY_TYPE_WEP104:

[...]

