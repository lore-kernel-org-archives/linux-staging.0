Received: from tmailer.gwdg.de (tmailer.gwdg.de [134.76.10.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC9A29CA
	for <linux-staging@lists.linux.dev>; Sat,  1 Jan 2022 12:00:59 +0000 (UTC)
Received: from excmbx-03.um.gwdg.de ([134.76.9.218] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtp (GWDG Mailer)
	(envelope-from <michael.straube@stud.uni-goettingen.de>)
	id 1n3c5a-000KM3-3w; Sat, 01 Jan 2022 11:58:18 +0100
Received: from excmbx-18.um.gwdg.de (134.76.9.229) by EXCMBX-03.um.gwdg.de
 (134.76.9.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P521) id 15.1.2375.17; Sat, 1
 Jan 2022 11:58:17 +0100
Received: from [192.168.0.151] (10.250.9.199) by excmbx-18.um.gwdg.de
 (134.76.9.229) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P521) id 15.1.2375.17; Sat, 1
 Jan 2022 09:32:45 +0100
Message-ID: <49705204-bfce-d28d-fedb-bc07aeb57fc6@stud.uni-goettingen.de>
Date: Sat, 1 Jan 2022 09:32:45 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v2 6/7] staging: r8188eu: IntArray and C2hArray are set
 but never used
Content-Language: en-US
To: <gregkh@linuxfoundation.org>
CC: <Larry.Finger@lwfinger.net>, <phil@philpotter.co.uk>,
	<linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <20220101081758.9716-1-straube.linux@gmail.com>
 <20220101081758.9716-7-straube.linux@gmail.com>
From: Michael Straube <michael.straube@stud.uni-goettingen.de>
In-Reply-To: <20220101081758.9716-7-straube.linux@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.250.9.199]
X-ClientProxiedBy: excmbx-25.um.gwdg.de (134.76.9.235) To excmbx-18.um.gwdg.de
 (134.76.9.229)
X-Virus-Scanned: (clean) by clamav

On 1/1/22 09:17, Michael Straube wrote:
> The fields IntArray and C2hArray of struct hal_data_8188e are set but
> never used. Remove them and remove interrupt_handler_8188eu() since it
> does nothing now.
> 
> While at it, remove the unsed defines USB_INTR_CONTENT_CPWM1_OFFSET
> and USB_INTR_CONTENT_CPWM2_OFFSET as well.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
> v2: Remove interrupt_handler_8188eu() since it does nothing now.
> 
>   drivers/staging/r8188eu/hal/usb_ops_linux.c   | 20 -------------------
>   .../staging/r8188eu/include/rtl8188e_hal.h    |  3 ---
>   .../staging/r8188eu/include/rtl8188e_spec.h   |  7 -------
>   3 files changed, 30 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> index 9ec55a77dccd..4a0ab4053e90 100644
> --- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
> +++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> @@ -183,24 +183,6 @@ int rtw_writeN(struct adapter *adapter, u32 addr, u32 length, u8 *data)
>   	return RTW_STATUS_CODE(ret);
>   }
>   
> -static void interrupt_handler_8188eu(struct adapter *adapt, u16 pkt_len, u8 *pbuf)
> -{
> -	struct hal_data_8188e *haldata = &adapt->haldata;
> -
> -	if (pkt_len != INTERRUPT_MSG_FORMAT_LEN) {
> -		DBG_88E("%s Invalid interrupt content length (%d)!\n", __func__, pkt_len);
> -		return;
> -	}

I just noticed that INTERRUPT_MSG_FORMAT_LEN can be removed from
rtl8188e_recv.h now too. I'll send v3 soon.

Sorry,
Michael
