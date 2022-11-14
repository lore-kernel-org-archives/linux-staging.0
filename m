Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77CE847C;
	Mon, 14 Nov 2022 20:16:05 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id s5so2740254edc.12;
        Mon, 14 Nov 2022 12:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ayX5aus8Qib+D+2MKrpRvM0X9XTvNaRwPjPBDhpP9Y=;
        b=a73JV+5UjKY8XE9O/5gFQ561cnrFK4OWe7wpT3HXrcpsuBwdmW2UIkPsV9hEAXGme9
         LPsjW6KF+9/y/XWltLywDaczMj1W/Dunn8qS66ofyfjlIjiZsM83xoDCjZ9j0JFjDG1e
         AZ478DJDVB9bCyh7/DCmIc6y+x0gb2kohoDF2fRiVc5msSPT63Us2kOS4iexgpXrsEPQ
         3ligYIBqTu6aBa09ac6FHAVA4as1877NqcnSrI5UWc3Cbuw0tkOcQJ248vl4lUnpp3M5
         z8Kkoim+jGWhbAZOrPV9Upscy9/8rkFC7sGSjAcCVl/oYAyUCSULW9t1nb5ELLNItjLF
         xWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ayX5aus8Qib+D+2MKrpRvM0X9XTvNaRwPjPBDhpP9Y=;
        b=lOaEboJWkQk4Rq2Kt1syrmfgwuK3QcRQIjQQxi1kfu5f8bS6CHsMBlA/qzQnxiEawH
         xGCTXoFea4eqkSxDyKrA68LfvRBSzQ+0uj1UlbcRmWs/uX1OHf38S8EyTnzlv0QVXSnG
         a/C5+10LfBwgO4EsbJ+r9diRJ+XuJgxyYpmUu4yEF2Pqn9Gymjk1BgXTxB+HGJc0g7PC
         iGM/U3eJtDEy6x0WIuIqrL/iT7bNs2HqL5WdazSdLouR6kViRsVUHmJhaLdquBEY3ndP
         a52XcMR5DwO/Xxew2Ue5cM5Bdvj0qw+bH4A5zxmIe3ZUuJcHXT7OrYsE7GsF7SAqozz4
         OSIg==
X-Gm-Message-State: ANoB5pl2pA8vabYj4BuSIfTGr6NGGCQ+J9BNqlp2RsB/yXoWS6GX4ixM
	TD0PXX0JPGc31jm0aTby42U=
X-Google-Smtp-Source: AA0mqf6GJsG1zGJPfS7H1GC1IxuXAlw38EaODlieMZb4TEC1Ne03cwzrzZd8W4Mz0i6GrcWBRDUdLA==
X-Received: by 2002:a50:9e43:0:b0:461:8dc1:10b with SMTP id z61-20020a509e43000000b004618dc1010bmr12561959ede.113.1668456964075;
        Mon, 14 Nov 2022 12:16:04 -0800 (PST)
Received: from ?IPV6:2003:c7:8f35:4b62:6623:1f88:59ad:8b23? (p200300c78f354b6266231f8859ad8b23.dip0.t-ipconnect.de. [2003:c7:8f35:4b62:6623:1f88:59ad:8b23])
        by smtp.gmail.com with ESMTPSA id f7-20020a1709063f4700b0078d0981516esm4652283ejj.38.2022.11.14.12.16.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 12:16:03 -0800 (PST)
Message-ID: <1a95a72e-85b9-a03c-51ad-d5ca4b5d0e0e@gmail.com>
Date: Mon, 14 Nov 2022 21:16:02 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] staging: vt6655: change the function name
 s_vGenerateTxParameter
Content-Language: en-US
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev
References: <Y3KN+kVLZ8gRzccm@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <Y3KN+kVLZ8gRzccm@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/22 19:50, Tanjuate Brunostar wrote:
> Remove the use of Hungarian notation, which is not used in the Linux
> kernel. Reported by checkpatch
> Add indentation to the affected function to follow the Linux kernel
> coding style. This improves code visibility
> 
> Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> ---
> 
> v2: removed unnecessary function prototype
> 
>   drivers/staging/vt6655/rxtx.c | 44 +++++++++++------------------------
>   1 file changed, 14 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> index 715b323cd2a8..341e23054817 100644
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
> @@ -85,18 +85,6 @@ static const unsigned short fb_opt1[2][5] = {
>   #define DATADUR_A_F1    13
>   
>   /*---------------------  Static Functions  --------------------------*/
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
> -
>   static unsigned int
>   s_cbFillTxBufHead(struct vnt_private *pDevice, unsigned char byPktType,
>   		  unsigned char *pbyTxBufferAddr,
> @@ -854,21 +842,17 @@ s_vFillCTSHead(
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
> @@ -1097,8 +1081,8 @@ s_cbFillTxBufHead(struct vnt_private *pDevice, unsigned char byPktType,
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
