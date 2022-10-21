Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DF13FF9;
	Fri, 21 Oct 2022 17:05:11 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id t16so8272150edd.2;
        Fri, 21 Oct 2022 10:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GdzuOhOEDnhogdt2xT3mV0ivSFs+fA5l/e0d5HS1oA8=;
        b=b6xgLPDoBt3PhdbfKHSCRk6AerYKtG5tABOU0jANNkfpC1cyawgo44nLA1dB9lHmBW
         E2YevGu83krHSpeqZjgijkPCY1xpkIMDj9IiSQikIO7mQCqAFoYiTs3FcWzRx0yQXv29
         iYcNhWkpMv0LU3z4f/B5J6ppR0okx85za6h2OLogUUdQuvf5WLIkN/M/PYNSk4EM9T3m
         xhUCWb/Og9Y8FLPcqDBDJwhYgU2xK+URNBwEl0LqFmyGaxrwNw8gytEbdFAf4MSnuVYn
         lGUF2t0esfWUT3jq9QfO3K/zMO2pHi2BSfUp/5M87tYVE5TFHKK1G/iFa/LwQxipwmTW
         QFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GdzuOhOEDnhogdt2xT3mV0ivSFs+fA5l/e0d5HS1oA8=;
        b=RKB9mFixHVSN3erYFGnHYpVdgd94oD//DUI0Me1VGa7J/b+wsXztrmW36VS/tQdQIt
         1LmW0XwDxtOllYGTFys+AS2w4mPhbU+Yi4bRATMYpy+oAjvN7OO057bh9hB41oI0Y2Pw
         aamAn8FNUClRe8B3u6ccRuNATUdr2VB7bzRD/DgR8ri4BMzsKVu9ugYH2ker4H20wKnD
         CIM2WutlN+lk1azT9g8VgvmCiGy+/1JggD+CsBb4jNxkkEVDRiZ7EqQOCnjcufywV6No
         rE279kn1eWqPn0We6Tk6XC4IJ66zOits2vXu5KZZcK9Al4bdUgqgBEYDvyYJpyfQ42+8
         nDZA==
X-Gm-Message-State: ACrzQf1Md5dhmLTdmKBpK1MI2Ke2wt6d7K+8WJ1n4PgD4b4oo+cJq0fB
	rVctINpu+IRNLP/KYBVKGZa4aevV0VU=
X-Google-Smtp-Source: AMsMyM7ETgiBE2YpB7J5C0yYyKxPBky8LfFtJmy983B00YuIOuyR0rEFue1oZlzKDxZV4zdOCsuejw==
X-Received: by 2002:a05:6402:1cc1:b0:45c:3a90:9499 with SMTP id ds1-20020a0564021cc100b0045c3a909499mr18623207edb.61.1666371909625;
        Fri, 21 Oct 2022 10:05:09 -0700 (PDT)
Received: from [192.168.1.100] (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id ku16-20020a170907789000b0078cb06c2ef9sm11923224ejc.8.2022.10.21.10.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Oct 2022 10:05:09 -0700 (PDT)
Message-ID: <797fefa6-9a57-a773-7d0a-4e15533ee664@gmail.com>
Date: Fri, 21 Oct 2022 19:04:57 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4] staging: vt6655: Fix Lines should not end with a '('
Content-Language: en-US
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>,
 gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
References: <Y1JlnJ/UpBgm9XEC@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <Y1JlnJ/UpBgm9XEC@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/22 11:25, Tanjuate Brunostar wrote:
> Code style warnings reported by checkpatch.
> Improve the layout of a function header:
> Put the first parameter immediately after the '(' and align the other
> parameters underneath it.
> 
> Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> 
> ---
> v2: put static and void on the same line and adjusted the indentation as
> suggested by Greg KH
> ---
> v3: Reformat the code by inserting tabs and white space as recommended
> by Nam Cao and Julia Lawall
> ---
> v4: final version of this patch
> 
>   drivers/staging/vt6655/rxtx.c | 78 +++++++++++++++--------------------
>   1 file changed, 33 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> index 5bdb5176772c..1e5036121665 100644
> --- a/drivers/staging/vt6655/rxtx.c
> +++ b/drivers/staging/vt6655/rxtx.c
> @@ -85,35 +85,27 @@ static const unsigned short wFB_Opt1[2][5] = {
>   #define DATADUR_A_F1    13
>   
>   /*---------------------  Static Functions  --------------------------*/
> -static
> -void
> -s_vFillRTSHead(
> -	struct vnt_private *pDevice,
> -	unsigned char byPktType,
> -	void *pvRTS,
> -	unsigned int	cbFrameLength,
> -	bool bNeedAck,
> -	bool bDisCRC,
> -	struct ieee80211_hdr *hdr,
> -	unsigned short wCurrentRate,
> -	unsigned char byFBOption
> -);
> -
> -static
> -void
> -s_vGenerateTxParameter(
> -	struct vnt_private *pDevice,
> -	unsigned char byPktType,
> -	struct vnt_tx_fifo_head *,
> -	void *pvRrvTime,
> -	void *pvRTS,
> -	void *pvCTS,
> -	unsigned int	cbFrameSize,
> -	bool bNeedACK,
> -	unsigned int	uDMAIdx,
> -	void *psEthHeader,
> -	unsigned short wCurrentRate
> -);
> +static void s_vFillRTSHead(struct vnt_private *pDevice,
> +			   unsigned char byPktType,
> +			   void *pvRTS,
> +			   unsigned int	cbFrameLength,
> +			   bool bNeedAck,
> +			   bool bDisCRC,
> +			   struct ieee80211_hdr *hdr,
> +			   unsigned short wCurrentRate,
> +			   unsigned char byFBOption);
> +
> +static void s_vGenerateTxParameter(struct vnt_private *pDevice,
> +				   unsigned char byPktType,
> +				   struct vnt_tx_fifo_head *,
> +				   void *pvRrvTime,
> +				   void *pvRTS,
> +				   void *pvCTS,
> +				   unsigned int	cbFrameSize,
> +				   bool bNeedACK,
> +				   unsigned int	uDMAIdx,
> +				   void *psEthHeader,
> +				   unsigned short wCurrentRate);
>   
>   static unsigned int
>   s_cbFillTxBufHead(struct vnt_private *pDevice, unsigned char byPktType,
> @@ -121,22 +113,18 @@ s_cbFillTxBufHead(struct vnt_private *pDevice, unsigned char byPktType,
>   		  unsigned int uDMAIdx, struct vnt_tx_desc *pHeadTD,
>   		  unsigned int uNodeIndex);
>   
> -static
> -__le16
> -s_uFillDataHead(
> -	struct vnt_private *pDevice,
> -	unsigned char byPktType,
> -	void *pTxDataHead,
> -	unsigned int cbFrameLength,
> -	unsigned int uDMAIdx,
> -	bool bNeedAck,
> -	unsigned int uFragIdx,
> -	unsigned int cbLastFragmentSize,
> -	unsigned int uMACfragNum,
> -	unsigned char byFBOption,
> -	unsigned short wCurrentRate,
> -	bool is_pspoll
> -);
> +static __le16 s_uFillDataHead(struct vnt_private *pDevice,
> +			      unsigned char byPktType,
> +			      void *pTxDataHead,
> +			      unsigned int cbFrameLength,
> +			      unsigned int uDMAIdx,
> +			      bool bNeedAck,
> +			      unsigned int uFragIdx,
> +			      unsigned int cbLastFragmentSize,
> +			      unsigned int uMACfragNum,
> +			      unsigned char byFBOption,
> +			      unsigned short wCurrentRate,
> +			      bool is_pspoll);
>   
>   /*---------------------  Export Variables  --------------------------*/
>   

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
