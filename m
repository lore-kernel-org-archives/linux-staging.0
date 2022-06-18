Received: from smtp.smtpout.orange.fr (smtp03.smtpout.orange.fr [80.12.242.125])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C5857B
	for <linux-staging@lists.linux.dev>; Sat, 18 Jun 2022 07:59:15 +0000 (UTC)
Received: from [192.168.1.18] ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id 2TF2oh1xTJXxR2TF2oTUFy; Sat, 18 Jun 2022 09:51:37 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 18 Jun 2022 09:51:37 +0200
X-ME-IP: 90.11.190.129
Message-ID: <38d31460-f3e0-1260-05c5-406a05d9fb37@wanadoo.fr>
Date: Sat, 18 Jun 2022 09:51:36 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] staging: rtl8723bs: Allocate full pwep structure
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Fabio Aiuto <fabioaiuto83@gmail.com>, Hans de Goede
 <hdegoede@redhat.com>, linux-staging@lists.linux.dev,
 Michael Straube <straube.linux@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20220608215512.1070847-1-keescook@chromium.org>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20220608215512.1070847-1-keescook@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 08/06/2022 à 23:55, Kees Cook a écrit :
> The pwep allocation was always being allocated smaller than the true
> structure size. Avoid this by always allocating the full structure.
> Found with GCC 12 and -Warray-bounds:
> 
> ../drivers/staging/rtl8723bs/os_dep/ioctl_linux.c: In function 'rtw_set_encryption':
> ../drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:591:29: warning: array subscript 'struct ndis_802_11_wep[0]' is partly outside array bounds of 'void[25]' [-Warray-bounds]
>    591 |                         pwep->length = wep_total_len;
>        |                             ^~
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Fabio Aiuto <fabioaiuto83@gmail.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: linux-staging@lists.linux.dev
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>   drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
> index ece97e37ac91..30374a820496 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
> @@ -90,7 +90,8 @@ static int wpa_set_encryption(struct net_device *dev, struct ieee_param *param,
>   		if (wep_key_len > 0) {
>   			wep_key_len = wep_key_len <= 5 ? 5 : 13;
>   			wep_total_len = wep_key_len + FIELD_OFFSET(struct ndis_802_11_wep, key_material);
> -			pwep = kzalloc(wep_total_len, GFP_KERNEL);
> +			/* Allocate a full structure to avoid potentially running off the end. */
> +			pwep = kzalloc(sizeof(*pwep), GFP_KERNEL);
>   			if (!pwep) {
>   				ret = -ENOMEM;
>   				goto exit;
> @@ -582,7 +583,8 @@ static int rtw_set_encryption(struct net_device *dev, struct ieee_param *param,
>   		if (wep_key_len > 0) {
>   			wep_key_len = wep_key_len <= 5 ? 5 : 13;
>   			wep_total_len = wep_key_len + FIELD_OFFSET(struct ndis_802_11_wep, key_material);
> -			pwep = kzalloc(wep_total_len, GFP_KERNEL);
> +			/* Allocate a full structure to avoid potentially running off the end. */
> +			pwep = kzalloc(sizeof(*pwep), GFP_KERNEL);
>   			if (!pwep)

Hi,

while at it (and un-related tyo your patch), I think that 'ret' should 
also be updated here, otherwise we return 0.

CJ

>   				goto exit;
>   

