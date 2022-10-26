Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDC6EBF;
	Wed, 26 Oct 2022 02:56:56 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id u2so10785528ljl.3;
        Tue, 25 Oct 2022 19:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nTAZqUtLhmiMpbb70qihgMC4xkf4w+dcgm8EbwvIyt8=;
        b=XQ/vWp4/Jz9VPDjA+N8HCIO1IV6hO69bsw8Rzthlbz21WLX3TlQYTQ7h/DP2NoKlwO
         /0vuLUd1EXLWdROUK1rErehGhiWWyV2qTor4b7e8TZ9+TAXbWlQCAItjjcSQP/xDTAXq
         nV1zo1u3drFR1PyR2OQE5+rIsW+ZAqOXwoRoShjhbfPYsAD1h+jYWwjKBNHC9d6dR6fU
         d6+eM82yju/YVGruW3cv/xp/tSs5IYF1DtyIo9HIJJIOZlFBKOFz5EYAvlQ4hS33P8pY
         r3458cfpgGkvaAnbp4MbglHW+JXlTElpWubD3FVKUdxQ+FGjjwzta9aW/ornwmEJlYTr
         OPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nTAZqUtLhmiMpbb70qihgMC4xkf4w+dcgm8EbwvIyt8=;
        b=DSkRsemXoCnjW+ewqKYyEMxFr4HDdRLhMxtv5kpb+UB6smsy/M9qjKyDAE/1k641zu
         NDTLMJq4RS+cr9tzgm2iUQQ7UI1a1mZyxMsMP6/Wo1IQomB8s/7jmneyr/V7XWwDmHUP
         KSq7X5yQ6rWvB9vmZDEtlSqnUiDspro/2ogPLo6j05liwFEUkU/+BnprGM0TxZ8F6dWl
         591ER4QG3dR5hh8RqlTsh2Y0DDOGyKLSRyIAo+mZmsoFM+0+Kmlsb0gs8w9gGzBa3mqg
         xtaPJjQJDLqki2WGryvwqst/b6Xsq7xjgNqrS+mQGLsQxQCs56jgDr5k8a3TSuVrjtij
         Quzg==
X-Gm-Message-State: ACrzQf0LBRS2/Gd+KY4/Iu9+WtCmWFsNV4HbYDyvgZOWqiFfdZQnwht/
	34DY8AYfsNY8j6qAOQwzJfhKdImu44M=
X-Google-Smtp-Source: AMsMyM42r9F5RlHKkukGoJ1kbxQ5WT2AndiTC1Jjc6JHhVCgNcmSrLn4NRlyw2lEoovBZj1o6lJExw==
X-Received: by 2002:a17:906:8a64:b0:78d:b00d:fe with SMTP id hy4-20020a1709068a6400b0078db00d00femr36185406ejc.32.1666753004481;
        Tue, 25 Oct 2022 19:56:44 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:b844:c952:3daa:e0a:40ba? (p200300c78f2ab844c9523daa0e0a40ba.dip0.t-ipconnect.de. [2003:c7:8f2a:b844:c952:3daa:e0a:40ba])
        by smtp.gmail.com with ESMTPSA id kx7-20020a170907774700b0078d4ee47c82sm2224469ejc.129.2022.10.25.19.56.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 19:56:44 -0700 (PDT)
Message-ID: <6a180003-0ee2-cb6f-afa5-4144b29decb8@gmail.com>
Date: Wed, 26 Oct 2022 04:56:43 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 02/17] staging: vt6655: changed variable names:
 s_vFillRTSHead
Content-Language: en-US
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev
References: <cover.1666740522.git.tanjubrunostar0@gmail.com>
 <8afb904f9fb22a262b3563d5cfc5804863bfb5ea.1666740522.git.tanjubrunostar0@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <8afb904f9fb22a262b3563d5cfc5804863bfb5ea.1666740522.git.tanjubrunostar0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/22 01:36, Tanjuate Brunostar wrote:
>      change variable names s_vFillRTSHead and wTimeStampOff to meet the
>      linux coding standard, as it says to avoid using camelCase naming style.
>      Cought by checkpatch

WARNING: Possible unwrapped commit description (prefer a maximum 75 
chars per line)
#8:
     linux coding standard, as it says to avoid using camelCase naming 
style.

You need to use checkpatch on your patches before you send them in.

Bye Philipp


> 
> Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> ---
>   drivers/staging/vt6655/rxtx.c | 54 +++++++++++++++++------------------
>   1 file changed, 27 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> index ac9b3402be4f..8bb06b142748 100644
> --- a/drivers/staging/vt6655/rxtx.c
> +++ b/drivers/staging/vt6655/rxtx.c
> @@ -23,7 +23,7 @@
>    *      s_uGetTxRsvTime- get frame reserved time
>    *      s_vFillCTSHead- fulfill CTS ctl header
>    *      s_vFillFragParameter- Set fragment ctl parameter.
> - *      s_vFillRTSHead- fulfill RTS ctl header
> + *      s_v_fill_rts_head- fulfill RTS ctl header
>    *      s_vFillTxKey- fulfill tx encrypt key
>    *      s_vSWencryption- Software encrypt header
>    *      vDMA0_tx_80211- tx 802.11 frame via dma0
> @@ -54,7 +54,7 @@
>    */
>   #define CRITICAL_PACKET_LEN      256
>   
> -static const unsigned short wTimeStampOff[2][MAX_RATE] = {
> +static const unsigned short w_time_stamp_off[2][MAX_RATE] = {
>   	{384, 288, 226, 209, 54, 43, 37, 31, 28, 25, 24, 23}, /* Long Preamble */
>   	{384, 192, 130, 113, 54, 43, 37, 31, 28, 25, 24, 23}, /* Short Preamble */
>   };
> @@ -85,15 +85,15 @@ static const unsigned short w_fb_opt_1[2][5] = {
>   #define DATADUR_A_F1    13
>   
>   /*---------------------  Static Functions  --------------------------*/
> -static void s_vFillRTSHead(struct vnt_private *pDevice,
> -			   unsigned char byPktType,
> -			   void *pvRTS,
> -			   unsigned int	cbFrameLength,
> -			   bool bNeedAck,
> -			   bool bDisCRC,
> -			   struct ieee80211_hdr *hdr,
> -			   unsigned short wCurrentRate,
> -			   unsigned char byFBOption);
> +static void s_v_fill_rts_head(struct vnt_private *pDevice,
> +			      unsigned char byPktType,
> +			      void *pvRTS,
> +			      unsigned int	cbFrameLength,
> +			      bool bNeedAck,
> +			      bool bDisCRC,
> +			      struct ieee80211_hdr *hdr,
> +			      unsigned short wCurrentRate,
> +			      unsigned char byFBOption);
>   
>   static void s_vGenerateTxParameter(struct vnt_private *pDevice,
>   				   unsigned char byPktType,
> @@ -130,7 +130,7 @@ static __le16 s_uFillDataHead(struct vnt_private *pDevice,
>   
>   static __le16 vnt_time_stamp_off(struct vnt_private *priv, u16 rate)
>   {
> -	return cpu_to_le16(wTimeStampOff[priv->preamble_type % 2]
> +	return cpu_to_le16(w_time_stamp_off[priv->preamble_type % 2]
>   							[rate % MAX_RATE]);
>   }
>   
> @@ -620,15 +620,15 @@ static __le16 s_uFillDataHead(struct vnt_private *pDevice,
>   	return buf->duration;
>   }
>   
> -static void s_vFillRTSHead(struct vnt_private *pDevice,
> -			   unsigned char byPktType,
> -			   void *pvRTS,
> -			   unsigned int cbFrameLength,
> -			   bool bNeedAck,
> -			   bool bDisCRC,
> -			   struct ieee80211_hdr *hdr,
> -			   unsigned short wCurrentRate,
> -			   unsigned char byFBOption)
> +static void s_v_fill_rts_head(struct vnt_private *pDevice,
> +			      unsigned char byPktType,
> +			      void *pvRTS,
> +			      unsigned int cbFrameLength,
> +			      bool bNeedAck,
> +			      bool bDisCRC,
> +			      struct ieee80211_hdr *hdr,
> +			      unsigned short wCurrentRate,
> +			      unsigned char byFBOption)
>   {
>   	unsigned int uRTSFrameLen = 20;
>   
> @@ -977,8 +977,8 @@ static void s_vGenerateTxParameter(struct vnt_private *pDevice,
>   								pDevice->byTopCCKBasicRate,
>   								bNeedACK);
>   
> -			s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC,
> -				       psEthHeader, wCurrentRate, byFBOption);
> +			s_v_fill_rts_head(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC,
> +					  psEthHeader, wCurrentRate, byFBOption);
>   		} else {/* RTS_needless, PCF mode */
>   			struct vnt_rrv_time_cts *buf = pvRrvTime;
>   
> @@ -1004,8 +1004,8 @@ static void s_vGenerateTxParameter(struct vnt_private *pDevice,
>   							      wCurrentRate, bNeedACK);
>   
>   			/* Fill RTS */
> -			s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC,
> -				       psEthHeader, wCurrentRate, byFBOption);
> +			s_v_fill_rts_head(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC,
> +					  psEthHeader, wCurrentRate, byFBOption);
>   		} else if (!pvRTS) {/* RTS_needless, non PCF mode */
>   			struct vnt_rrv_time_ab *buf = pvRrvTime;
>   
> @@ -1022,8 +1022,8 @@ static void s_vGenerateTxParameter(struct vnt_private *pDevice,
>   							      wCurrentRate, bNeedACK);
>   
>   			/* Fill RTS */
> -			s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC,
> -				       psEthHeader, wCurrentRate, byFBOption);
> +			s_v_fill_rts_head(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC,
> +					  psEthHeader, wCurrentRate, byFBOption);
>   		} else { /* RTS_needless, non PCF mode */
>   			struct vnt_rrv_time_ab *buf = pvRrvTime;
>   

