Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FD079C1;
	Thu,  3 Nov 2022 21:40:29 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id m29-20020a05600c3b1d00b003c6bf423c71so4273522wms.0;
        Thu, 03 Nov 2022 14:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lK/sYl/t+usvH7PYKp5IZLuNHd2jdEZGuR2yQw1ZU94=;
        b=HFkuKLMv1o5ba5n82oMGGQbMAMkvBnUS9oaqLMbEBQjO4py/hCntOPIpDBnnW1OXXw
         KILlzAwUc8eL8QnkdKURwv6Npv8kO6H3POFYsCfnDEj/GNa8GG9OzE8w5j3czPek8Q9J
         rugBPcq6S3OCtguZoO/zOTvh1Wo/X2ntkjOlp6wzuWuAa0sWE//izwYKrJNVFWs6/HtC
         E2VQsyRbLslKARPcN+yaZwYd/hH0FDfP78U5iL654h9DS3bVbcKWthMKb1Ayur5UqpEL
         YG2ClZ4Joxqn0H8aWabwp27W+Vl6u8euEmFsUKCrdFimjk8MdylKD41rFPowja4USXfW
         fzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lK/sYl/t+usvH7PYKp5IZLuNHd2jdEZGuR2yQw1ZU94=;
        b=T/ICOilrBZg/VuQzLo4CPk5Db1Riqr/DQD79IT7i96xrr4dj3ww2eHErD60yMk7r6m
         n98y0/aqsUvkVRBMd86/czou2a/yX/hM3cPIhVxEmrW+JEihTdvEsqAg1hRCCnuOBjsO
         mpNHHANBVOMrPrm5eTJOdJ1NyXyBunMszmedla/Ilz3HMhOUb4dQz9RUcmRU3y1qPDXI
         Tum9wGX1LCHpz+X3xLnT11/Gf3u8Cq/hGixuY6y0xKMityMzFuJisvj4YX2tOFPfsuTW
         cZ6bMVu0ZJwZPO09as6EU1ec4863tvhallLaMdTgnFQOu4FBeWhWgQ91ZcyCYxvRDIxj
         1uZQ==
X-Gm-Message-State: ACrzQf0bqSHnTps/r3yt6NOya5UKdu2iO4SoAafUQ4eGtWHv+yCod+ef
	D9mW6glg1N7e+xsVuBkKKWA=
X-Google-Smtp-Source: AMsMyM6GZ/cFT+PnKi4JPhIABZUzn0IfTNpGpX2FzHqT3v9vXF8vfxZ/YPLfzppIvVPSqZcV8CVk/g==
X-Received: by 2002:a05:600c:548c:b0:3c6:d8dd:2a72 with SMTP id iv12-20020a05600c548c00b003c6d8dd2a72mr30696671wmb.179.1667511627468;
        Thu, 03 Nov 2022 14:40:27 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f35:4b87:d1d7:d30e:756e:79c7? (p200300c78f354b87d1d7d30e756e79c7.dip0.t-ipconnect.de. [2003:c7:8f35:4b87:d1d7:d30e:756e:79c7])
        by smtp.gmail.com with ESMTPSA id j15-20020a05600c1c0f00b003c21ba7d7d6sm1044020wms.44.2022.11.03.14.40.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 14:40:27 -0700 (PDT)
Message-ID: <043a9ecb-ea8f-1d33-cb6e-cdbd5701d5bb@gmail.com>
Date: Thu, 3 Nov 2022 22:40:25 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] staging: vt6655: change the function name
 s_vGenerateTxParameter
Content-Language: en-US
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>,
 gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
References: <Y2OmAuBswNbWFWRd@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <Y2OmAuBswNbWFWRd@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/22 12:29, Tanjuate Brunostar wrote:
> Remove the use of Hongarian notation which is not used in Linux kernel.
> Join some lines of code to avoid a line ending in a '('
> Reported by Checkpatch
> 
> Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> ---
>   drivers/staging/vt6655/rxtx.c | 54 ++++++++++++++++-------------------
>   1 file changed, 25 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> index debc5d5daede..793a63b2ff46 100644
> --- a/drivers/staging/vt6655/rxtx.c
> +++ b/drivers/staging/vt6655/rxtx.c
> @@ -10,7 +10,7 @@
>    * Date: May 20, 2003
>    *
>    * Functions:
> - *      s_vGenerateTxParameter - Generate tx dma required parameter.
> + *      generate_tx_parameter - Generate tx dma required parameter.
>    *      vGenerateMACHeader - Translate 802.3 to 802.11 header
>    *      cbGetFragCount - Calculate fragment number count
>    *      csBeacon_xmit - beacon tx function
> @@ -95,17 +95,17 @@ static void fill_rts_header(struct vnt_private *pDevice,
>   			    unsigned short wCurrentRate,
>   			    unsigned char byFBOption);
>   
> -static void s_vGenerateTxParameter(struct vnt_private *pDevice,
> -				   unsigned char byPktType,
> -				   struct vnt_tx_fifo_head *,
> -				   void *pvRrvTime,
> -				   void *pvRTS,
> -				   void *pvCTS,
> -				   unsigned int	cbFrameSize,
> -				   bool bNeedACK,
> -				   unsigned int	uDMAIdx,
> -				   void *psEthHeader,
> -				   unsigned short wCurrentRate);
> +static void generate_tx_parameter(struct vnt_private *pDevice,
> +				  unsigned char byPktType,
> +				  struct vnt_tx_fifo_head *,
> +				  void *pvRrvTime,
> +				  void *pvRTS,
> +				  void *pvCTS,
> +				  unsigned int	cbFrameSize,
> +				  bool bNeedACK,
> +				  unsigned int	uDMAIdx,
> +				  void *psEthHeader,
> +				  unsigned short wCurrentRate);
>   
>   static unsigned int
>   s_cbFillTxBufHead(struct vnt_private *pDevice, unsigned char byPktType,
> @@ -864,21 +864,17 @@ s_vFillCTSHead(
>    -
>    * unsigned int cbFrameSize, Hdr+Payload+FCS
>    */
> -static
> -void
> -s_vGenerateTxParameter(
> -	struct vnt_private *pDevice,
> -	unsigned char byPktType,
> -	struct vnt_tx_fifo_head *tx_buffer_head,
> -	void *pvRrvTime,
> -	void *pvRTS,
> -	void *pvCTS,
> -	unsigned int cbFrameSize,
> -	bool bNeedACK,
> -	unsigned int uDMAIdx,
> -	void *psEthHeader,
> -	unsigned short wCurrentRate
> -)
> +static void generate_tx_parameter(struct vnt_private *pDevice,
> +				  unsigned char byPktType,
> +				  struct vnt_tx_fifo_head *tx_buffer_head,
> +				  void *pvRrvTime,
> +				  void *pvRTS,
> +				  void *pvCTS,
> +				  unsigned int cbFrameSize,
> +				  bool bNeedACK,
> +				  unsigned int uDMAIdx,
> +				  void *psEthHeader,
> +				  unsigned short wCurrentRate)
>   {
>   	u16 fifo_ctl = le16_to_cpu(tx_buffer_head->fifo_ctl);
>   	bool bDisCRC = false;
> @@ -1107,8 +1103,8 @@ s_cbFillTxBufHead(struct vnt_private *pDevice, unsigned char byPktType,
>   	memset((void *)(pbyTxBufferAddr + wTxBufSize), 0, (cbHeaderLength - wTxBufSize));
>   
>   	/* Fill FIFO,RrvTime,RTS,and CTS */
> -	s_vGenerateTxParameter(pDevice, byPktType, tx_buffer_head, pvRrvTime, pvRTS, pvCTS,
> -			       cbFrameSize, bNeedACK, uDMAIdx, hdr, pDevice->wCurrentRate);
> +	generate_tx_parameter(pDevice, byPktType, tx_buffer_head, pvRrvTime, pvRTS, pvCTS,
> +			      cbFrameSize, bNeedACK, uDMAIdx, hdr, pDevice->wCurrentRate);
>   	/* Fill DataHead */
>   	uDuration = s_uFillDataHead(pDevice, byPktType, pvTxDataHd, cbFrameSize, uDMAIdx, bNeedACK,
>   				    0, 0, uMACfragNum, byFBOption, pDevice->wCurrentRate, is_pspoll);

I cannot apply your patch.

Bye Philipp
