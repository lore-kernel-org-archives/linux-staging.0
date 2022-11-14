Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AB7847C;
	Mon, 14 Nov 2022 20:19:45 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id s12so18951520edd.5;
        Mon, 14 Nov 2022 12:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sQzqbyft4iPMYkgJwXfvCqwNgbrQqe1lCD4jJDJZADQ=;
        b=dE8jYcGBcnKicXkp24y7WzOAabIk5bf0+RqUHcnUJcg9ya39nXCN288OTVfl5/FCvI
         OHqyDpMEQL+uws1fUXaZqyTb/0CgVS4KraGEx1PvEhiPd1850dGHSNpgzTG4k0CRgP7J
         dWws3z3AqSbPEtkLn6Sg4cOrp/QqDCWLz1t0lIwdYVOS6NW14vAuiUHuKrgVZbonV+EQ
         N7BpoyJ9Ligzjdj804ZN1oTVTrHf/o563qnzdTN7qrESoPcjgryC/NYGscbDmt7Mu6mn
         /avm8INepykeZ1K5xxHf0ig1OzGy/S3/SN4Rd1Mj4ycmY+mv6hlIJPjNZ0AiPR0k86Sc
         s8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sQzqbyft4iPMYkgJwXfvCqwNgbrQqe1lCD4jJDJZADQ=;
        b=gWHR4CBwRIMW1VVMtk8TXqgscaSIxFvcTO7pfAhV42By89gGzVC9BekJfi7gLLtObW
         XuUS9G682OZ3Lieeme0eUZTkRGZ4I0eDe8dW9NHhnq4fAGKl6vikWFCuQQmEXz/ar52S
         16F3vC3wuDi/aMn4+CpKhIfW0Lc3yHhxngHj+ipjWtsAI1xnxJDYpNMOs1InGTLyy221
         kRtUlmoaniVFyGA3+VdTFPlgaF1T309kInLIzbhmVo0pDAk8VLsKNqcJovn1VBEO81ec
         mIv4Rx3BdHW1OBV8e2a6T3BUASzK29dDZ226ZDKdxtaQLVhVtuqdAUgimMYDYcnkZ+F5
         JYRQ==
X-Gm-Message-State: ANoB5pneS9wYH1QC94gmFLNU2A29IMU7dA4IB9MGarcqyE+ArNzT+FNI
	CBYTHsHbxksHxyiGgJjye8o=
X-Google-Smtp-Source: AA0mqf7rsgOSHy/GtN5CZ8eDL5FkKZG1I/T6scjFAcQ9JQ9k+FX9kjzmREmTEnTa69++YROid16UUA==
X-Received: by 2002:a05:6402:284:b0:467:481f:df2a with SMTP id l4-20020a056402028400b00467481fdf2amr11980860edv.324.1668457183747;
        Mon, 14 Nov 2022 12:19:43 -0800 (PST)
Received: from ?IPV6:2003:c7:8f35:4b62:6623:1f88:59ad:8b23? (p200300c78f354b6266231f8859ad8b23.dip0.t-ipconnect.de. [2003:c7:8f35:4b62:6623:1f88:59ad:8b23])
        by smtp.gmail.com with ESMTPSA id fg15-20020a1709069c4f00b0078d4ee47c82sm4530880ejc.129.2022.11.14.12.19.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 12:19:43 -0800 (PST)
Message-ID: <480340b3-c1c1-74b5-1889-f49dcb644469@gmail.com>
Date: Mon, 14 Nov 2022 21:19:42 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] staging: vt6655: change the function name
 s_vFillRTSHead
Content-Language: en-US
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev
References: <Y3KJBdUue5otWgOT@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <Y3KJBdUue5otWgOT@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/22 19:29, Tanjuate Brunostar wrote:
> Remove the use of Hungarian notation, which is not used in the Linux
> kernel. Reported by checkpatch
> Add indentation to the affected function to follow the Linux kernel
> coding style. This improves visibility
> 
> Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> ---
> v2: corrected confusing changlog message on this patch
> v3: removed unnecessary function prototype
> 
>   drivers/staging/vt6655/rxtx.c | 40 ++++++++++++-----------------------
>   1 file changed, 13 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> index 31ae99b3cb35..715b323cd2a8 100644
> --- a/drivers/staging/vt6655/rxtx.c
> +++ b/drivers/staging/vt6655/rxtx.c
> @@ -23,7 +23,7 @@
>    *      s_uGetTxRsvTime- get frame reserved time
>    *      s_vFillCTSHead- fulfill CTS ctl header
>    *      s_vFillFragParameter- Set fragment ctl parameter.
> - *      s_vFillRTSHead- fulfill RTS ctl header
> + *      fill_rts_header- fulfill RTS ctl header
>    *      s_vFillTxKey- fulfill tx encrypt key
>    *      s_vSWencryption- Software encrypt header
>    *      vDMA0_tx_80211- tx 802.11 frame via dma0
> @@ -85,16 +85,6 @@ static const unsigned short fb_opt1[2][5] = {
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
> -
>   static void s_vGenerateTxParameter(struct vnt_private *pDevice,
>   				   unsigned char byPktType,
>   				   struct vnt_tx_fifo_head *,
> @@ -555,19 +545,15 @@ s_uFillDataHead(
>   	return buf->duration;
>   }
>   
> -static
> -void
> -s_vFillRTSHead(
> -	struct vnt_private *pDevice,
> -	unsigned char byPktType,
> -	void *pvRTS,
> -	unsigned int cbFrameLength,
> -	bool bNeedAck,
> -	bool bDisCRC,
> -	struct ieee80211_hdr *hdr,
> -	unsigned short wCurrentRate,
> -	unsigned char byFBOption
> -)
> +static void fill_rts_header(struct vnt_private *pDevice,
> +			    unsigned char byPktType,
> +			    void *pvRTS,
> +			    unsigned int cbFrameLength,
> +			    bool bNeedAck,
> +			    bool bDisCRC,
> +			    struct ieee80211_hdr *hdr,
> +			    unsigned short wCurrentRate,
> +			    unsigned char byFBOption)
>   {
>   	unsigned int uRTSFrameLen = 20;
>   
> @@ -912,7 +898,7 @@ s_vGenerateTxParameter(
>   			buf->rrv_time_a = vnt_rxtx_rsvtime_le16(pDevice, byPktType, cbFrameSize, wCurrentRate, bNeedACK);
>   			buf->rrv_time_b = vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11B, cbFrameSize, pDevice->byTopCCKBasicRate, bNeedACK);
>   
> -			s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
> +			fill_rts_header(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
>   		} else {/* RTS_needless, PCF mode */
>   			struct vnt_rrv_time_cts *buf = pvRrvTime;
>   
> @@ -931,7 +917,7 @@ s_vGenerateTxParameter(
>   			buf->rrv_time = vnt_rxtx_rsvtime_le16(pDevice, byPktType, cbFrameSize, wCurrentRate, bNeedACK);
>   
>   			/* Fill RTS */
> -			s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
> +			fill_rts_header(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
>   		} else if (!pvRTS) {/* RTS_needless, non PCF mode */
>   			struct vnt_rrv_time_ab *buf = pvRrvTime;
>   
> @@ -945,7 +931,7 @@ s_vGenerateTxParameter(
>   			buf->rrv_time = vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11B, cbFrameSize, wCurrentRate, bNeedACK);
>   
>   			/* Fill RTS */
> -			s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
> +			fill_rts_header(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
>   		} else { /* RTS_needless, non PCF mode */
>   			struct vnt_rrv_time_ab *buf = pvRrvTime;
>   

Hi,

I cannot apply your patch.

Here my git infos:
git remote show origin
* remote origin
   Fetch URL: 
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
...
git branch -a
my branch: staging-testing

Bye Philipp
