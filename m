Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C97D52D;
	Wed, 16 Nov 2022 19:12:26 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id x102so12816753ede.0;
        Wed, 16 Nov 2022 11:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=08pM1gv30LggQjgAzS6y9T5V02Bhy022fNx+5dfUfno=;
        b=SUSxsEitWfVe4tH9Q7pGX+7jtGtMRPAExtgKfTJlvBym3hWJ5ofEVqcL10YP0E3F0q
         g6WQIePM3JEtstv6HqtRL2v6zOEenhj01tPjN0AUODwmHSFsfSvYmXKtE0vf5Uw5ngAn
         8hgiY1vd70Z3i6U9v1jdNDAR9PPaviEBuvRmGzlzWHD0NwcRlA5GsoYLrxHBc2swnluC
         Tui7ycTTxU+HDAgrBQ5oBevLWLW26ejI9kczEXZl96OcY6mm38is5Kp+pccXeWr40evr
         fxhzhN0OG9cuxmXIUMkoEQKFAtLOlBnKVU/tXMJm1U4xZHpXf1gnEoVfMymrjStG6sDv
         9Z9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=08pM1gv30LggQjgAzS6y9T5V02Bhy022fNx+5dfUfno=;
        b=E7PirYjodzYKB701rOuqsU3QMCumCIlPfi9Tk7otbhSNSva4LApM+0eyCIk4Wg+kdK
         Zqt/w/Mj8mBcWFMuQ46JrP5BibeQc+1vNB27puMxDqUrqXirGioy90WKxgFktt/MG//4
         Llqj/z7uy96afMTzZNQZjRno8aUy4aOBg+v3/hriZEwuTkcSEslE+13ssVaeFHk9eiXt
         sY9GB7T04Cw7ASBdUBjDk7OunmhndKSjgKd73iKR5EPubvA+hcjD6CubEX8XKFUjDxZv
         +kEz359PEA+dZWAKU/N5VQ+F/Wdu0sxO0P+NHqF/POD5Z4sRLYCcStAfCJTAbdvx/jFa
         FlPQ==
X-Gm-Message-State: ANoB5plkY8V+nzg2Xk89YcUy2pVtuNul6Jhgncz8XKXZdyDFmdd2VHXH
	seYMm2qike2p12zSnmbbDRI=
X-Google-Smtp-Source: AA0mqf6twgLt7WpKAE7GhWLHzHR36saOG0xnhjna/Df0Je/W9o97LehDrL3xS/bFmXTmSZqVJmO9NA==
X-Received: by 2002:aa7:d3c6:0:b0:463:c64e:bc75 with SMTP id o6-20020aa7d3c6000000b00463c64ebc75mr20540586edr.205.1668625945028;
        Wed, 16 Nov 2022 11:12:25 -0800 (PST)
Received: from ?IPV6:2003:c7:8f35:4b36:b14a:31a9:5cf4:bef4? (p200300c78f354b36b14a31a95cf4bef4.dip0.t-ipconnect.de. [2003:c7:8f35:4b36:b14a:31a9:5cf4:bef4])
        by smtp.gmail.com with ESMTPSA id i15-20020a05640200cf00b00463c5c32c6esm7843288edu.89.2022.11.16.11.12.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 11:12:24 -0800 (PST)
Message-ID: <d145c4f9-7bde-527c-03e9-b2784c3162f4@gmail.com>
Date: Wed, 16 Nov 2022 20:12:23 +0100
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
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev
References: <Y3KN+kVLZ8gRzccm@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
 <1a95a72e-85b9-a03c-51ad-d5ca4b5d0e0e@gmail.com>
In-Reply-To: <1a95a72e-85b9-a03c-51ad-d5ca4b5d0e0e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/14/22 21:16, Philipp Hortmann wrote:
> On 11/14/22 19:50, Tanjuate Brunostar wrote:
>> Remove the use of Hungarian notation, which is not used in the Linux
>> kernel. Reported by checkpatch
>> Add indentation to the affected function to follow the Linux kernel
>> coding style. This improves code visibility
>>
>> Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
>> ---
>>
>> v2: removed unnecessary function prototype
>>
>>   drivers/staging/vt6655/rxtx.c | 44 +++++++++++------------------------
>>   1 file changed, 14 insertions(+), 30 deletions(-)
>>
>> diff --git a/drivers/staging/vt6655/rxtx.c 
>> b/drivers/staging/vt6655/rxtx.c
>> index 715b323cd2a8..341e23054817 100644
>> --- a/drivers/staging/vt6655/rxtx.c
>> +++ b/drivers/staging/vt6655/rxtx.c
>> @@ -10,7 +10,7 @@
>>    * Date: May 20, 2003
>>    *
>>    * Functions:
>> - *      s_vGenerateTxParameter - Generate tx dma required parameter.
>> + *      generate_tx_parameter - Generate tx dma required parameter.
>>    *      vGenerateMACHeader - Translate 802.3 to 802.11 header
>>    *      cbGetFragCount - Calculate fragment number count
>>    *      csBeacon_xmit - beacon tx function
>> @@ -85,18 +85,6 @@ static const unsigned short fb_opt1[2][5] = {
>>   #define DATADUR_A_F1    13
>>   /*---------------------  Static Functions  --------------------------*/
>> -static void s_vGenerateTxParameter(struct vnt_private *pDevice,
>> -                   unsigned char byPktType,
>> -                   struct vnt_tx_fifo_head *,
>> -                   void *pvRrvTime,
>> -                   void *pvRTS,
>> -                   void *pvCTS,
>> -                   unsigned int    cbFrameSize,
>> -                   bool bNeedACK,
>> -                   unsigned int    uDMAIdx,
>> -                   void *psEthHeader,
>> -                   unsigned short wCurrentRate);
>> -
>>   static unsigned int
>>   s_cbFillTxBufHead(struct vnt_private *pDevice, unsigned char byPktType,
>>             unsigned char *pbyTxBufferAddr,
>> @@ -854,21 +842,17 @@ s_vFillCTSHead(
>>    -
>>    * unsigned int cbFrameSize, Hdr+Payload+FCS
>>    */
>> -static
>> -void
>> -s_vGenerateTxParameter(
>> -    struct vnt_private *pDevice,
>> -    unsigned char byPktType,
>> -    struct vnt_tx_fifo_head *tx_buffer_head,
>> -    void *pvRrvTime,
>> -    void *pvRTS,
>> -    void *pvCTS,
>> -    unsigned int cbFrameSize,
>> -    bool bNeedACK,
>> -    unsigned int uDMAIdx,
>> -    void *psEthHeader,
>> -    unsigned short wCurrentRate
>> -)
>> +static void generate_tx_parameter(struct vnt_private *pDevice,
>> +                  unsigned char byPktType,
>> +                  struct vnt_tx_fifo_head *tx_buffer_head,
>> +                  void *pvRrvTime,
>> +                  void *pvRTS,
>> +                  void *pvCTS,
>> +                  unsigned int cbFrameSize,
>> +                  bool bNeedACK,
>> +                  unsigned int uDMAIdx,
>> +                  void *psEthHeader,
>> +                  unsigned short wCurrentRate)
>>   {
>>       u16 fifo_ctl = le16_to_cpu(tx_buffer_head->fifo_ctl);
>>       bool bDisCRC = false;
>> @@ -1097,8 +1081,8 @@ s_cbFillTxBufHead(struct vnt_private *pDevice, 
>> unsigned char byPktType,
>>       memset((void *)(pbyTxBufferAddr + wTxBufSize), 0, 
>> (cbHeaderLength - wTxBufSize));
>>       /* Fill FIFO,RrvTime,RTS,and CTS */
>> -    s_vGenerateTxParameter(pDevice, byPktType, tx_buffer_head, 
>> pvRrvTime, pvRTS, pvCTS,
>> -                   cbFrameSize, bNeedACK, uDMAIdx, hdr, 
>> pDevice->wCurrentRate);
>> +    generate_tx_parameter(pDevice, byPktType, tx_buffer_head, 
>> pvRrvTime, pvRTS, pvCTS,
>> +                  cbFrameSize, bNeedACK, uDMAIdx, hdr, 
>> pDevice->wCurrentRate);
>>       /* Fill DataHead */
>>       uDuration = s_uFillDataHead(pDevice, byPktType, pvTxDataHd, 
>> cbFrameSize, uDMAIdx, bNeedACK,
>>                       0, 0, uMACfragNum, byFBOption, 
>> pDevice->wCurrentRate, is_pspoll);
> 
> I cannot apply your patch.
> 
> Bye Philipp

Hi

kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ git apply 
--reject --ignore-space-change --ignore-whitespace 
~/Downloads/20221114-\[PATCH\ v2\]\ staging_\ vt6655_\ change\ the\ 
function\ name\ s_vGenerateTxParameter-5399.txt
Checking patch drivers/staging/vt6655/rxtx.c...
error: while searching for:
#define DATADUR_A_F1    13

/*---------------------  Static Functions  --------------------------*/
static void s_vGenerateTxParameter(struct vnt_private *pDevice,
				   unsigned char byPktType,
				   struct vnt_tx_fifo_head *,
				   void *pvRrvTime,
				   void *pvRTS,
				   void *pvCTS,
				   unsigned int	cbFrameSize,
				   bool bNeedACK,
				   unsigned int	uDMAIdx,
				   void *psEthHeader,
				   unsigned short wCurrentRate);

static unsigned int
s_cbFillTxBufHead(struct vnt_private *pDevice, unsigned char byPktType,
		  unsigned char *pbyTxBufferAddr,

error: patch failed: drivers/staging/vt6655/rxtx.c:85
Hunk #3 succeeded at 880 (offset 38 lines).
Hunk #4 succeeded at 1119 (offset 38 lines).
Applying patch drivers/staging/vt6655/rxtx.c with 1 reject...
Hunk #1 applied cleanly.
Rejected hunk #2.
Hunk #3 applied cleanly.
Hunk #4 applied cleanly.


Bye Philipp
