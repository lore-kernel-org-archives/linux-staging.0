Received: from smtp.smtpout.orange.fr (smtp-29.smtpout.orange.fr [80.12.242.29])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B9C23A2
	for <linux-staging@lists.linux.dev>; Sat, 26 Nov 2022 16:02:12 +0000 (UTC)
Received: from [192.168.1.18] ([86.243.100.34])
	by smtp.orange.fr with ESMTPA
	id yx9loZaHtNKuIyx9loXs3F; Sat, 26 Nov 2022 16:31:57 +0100
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 26 Nov 2022 16:31:57 +0100
X-ME-IP: 86.243.100.34
Message-ID: <7bf2977b-b3a9-0543-0a41-dd4ad03e1594@wanadoo.fr>
Date: Sat, 26 Nov 2022 16:31:53 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/2] staging: vme_user: add list_del in the error handling
 of tsi148_dma_list_add
Content-Language: fr, en-US
To: Dongliang Mu <dzm91@hust.edu.cn>, Martyn Welch <martyn@welchs.me.uk>,
 Manohar Vanga <manohar.vanga@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Mingyi Kang <jerrykang026@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20221126125642.16358-1-dzm91@hust.edu.cn>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20221126125642.16358-1-dzm91@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 26/11/2022 à 13:56, Dongliang Mu a écrit :
> Smatch reports the following issue:
> drivers/staging/vme_user/vme_tsi148.c:1757 tsi148_dma_list_add()
> warn: '&entry->list' not removed from list
> 

Hi,

Not tested with smatch, but I think that moving the list_add_tail() call 
just a few lines below, when all lights are green, would also fix the issue.

Just my 2c,

CJ


> Fix this by adding list_del in the error handling code.
> 
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
> ---
>   drivers/staging/vme_user/vme_tsi148.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
> index 020e0b3bce64..0171f46d1848 100644
> --- a/drivers/staging/vme_user/vme_tsi148.c
> +++ b/drivers/staging/vme_user/vme_tsi148.c
> @@ -1751,6 +1751,7 @@ static int tsi148_dma_list_add(struct vme_dma_list *list,
>   	return 0;
>   
>   err_dma:
> +	list_del(&entry->list);
>   err_dest:
>   err_source:
>   err_align:

