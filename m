Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF497214E8
	for <linux-staging@lists.linux.dev>; Thu, 13 Jul 2023 21:47:01 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3facc7a4e8aso2401885e9.0
        for <linux-staging@lists.linux.dev>; Thu, 13 Jul 2023 14:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689284820; x=1689889620;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bcefY1X0SEJeyGFbpnphfYhJuGzSUZJNnB/pOHxnr1M=;
        b=YQeeH9gfps3abtFe8Tr40m0Vd3JMakI3A7R1YLeGg+eVQDcOPpd9KLkPJK2QDcY2cD
         b1c9TC7DSZkEQA5/j3a6cwZxST1Nb5mm3ngnRWgx9GTWWxNqob9dr/xz9AaIG4Dx3t8f
         WkAgckJ8YMof6tjNz6nDGwL/ngpvng9KVmxJUxXfyMQKdC2kBSFnPlSw99aiLjhKuH8W
         bVBpafJiKngugZfogn+u1t/Dn2PNDRE7dGYA9H48N8u2QJl2QBEUDWyRMazw6eFT19IC
         1C3nfhSgoTCQEGXK5bE3nDoxZiq5MB3r/6auGx9Sx6SaWa5quZLT/My1wN3x3YKzIVwd
         N00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689284820; x=1689889620;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bcefY1X0SEJeyGFbpnphfYhJuGzSUZJNnB/pOHxnr1M=;
        b=c1qUEORsde/KmfLP5kEv2qC9HVIMszdhbxrcl5xGAXr9TNTqFDvxWCNsfvuA6go10g
         ob+LRYAoKw4fww+IXudPeu+RSYic4GDCHIbo2EBjLWnILDnJH58w0xK2HIJF99tkzjUS
         mKXSJWZkhXVpka2NnhgSI7GtZSt0spVDdxjAXkijatp5a/dnNp/IycPrF/wVbGWsxMq6
         Y8/2WD4YvdJfcKXzMseiYtb7yIpddlcdvjGxFF2OImqmJzZNPvc6QXxAsR9LU8FcuIFf
         iqoioPazUHCXRO8eUDqYFlkLbHyYFRixxjW3R5t4S3Enm23mTluEOS+5yBdNlr3DGyhx
         DERg==
X-Gm-Message-State: ABy/qLYyRN44q6Zl+o99aOtUDS0gwtW433/lcWNJV1KeOUaQ0BDxKdqX
	ApgaksH1/OEFrRJs470JKI8=
X-Google-Smtp-Source: APBJJlFG6OEYgfLkp1K8WaXCHczGAbzqahq8/Hh6eP8S1DJmeb8Zk4+MnX+Ad24amCku3Acnr/Jw8w==
X-Received: by 2002:a05:600c:5192:b0:3fb:3dd9:89c with SMTP id fa18-20020a05600c519200b003fb3dd9089cmr2617991wmb.0.1689284819428;
        Thu, 13 Jul 2023 14:46:59 -0700 (PDT)
Received: from [192.168.0.103] (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id s26-20020a7bc39a000000b003fa74bff02asm22989wmj.26.2023.07.13.14.46.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 14:46:58 -0700 (PDT)
Message-ID: <dd078125-8287-4d83-a9f7-4acf6435bd18@gmail.com>
Date: Thu, 13 Jul 2023 23:46:57 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 05/12] Staging: rtl8192e: Rename function TsInitDelBA
To: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org,
 anjan@momi.ca, error27@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <ZK83kk5tQWqdTvXz@basil>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <ZK83kk5tQWqdTvXz@basil>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/13/23 01:30, Tree Davies wrote:
> Rename function TsInitDelBA to ts_init_del_ba
> in order to Fix checkpatch warning: Avoid CamelCase
> 
> Signed-off-by: Tree Davies <tdavies@darkphysics.net>
> ---
>   drivers/staging/rtl8192e/rtl819x_BAProc.c | 2 +-
>   drivers/staging/rtl8192e/rtl819x_TSProc.c | 2 +-
>   drivers/staging/rtl8192e/rtllib.h         | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
> index 2e37f1e949ec..9a32528fe314 100644
> --- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
> @@ -484,7 +484,7 @@ void ts_init_add_ba(struct rtllib_device *ieee, struct tx_ts_record *pTS,
>   	rtllib_send_ADDBAReq(ieee, pTS->TsCommonInfo.Addr, pBA);
>   }
>   
> -void TsInitDelBA(struct rtllib_device *ieee,
> +void ts_init_del_ba(struct rtllib_device *ieee,
>   		 struct ts_common_info *pTsCommonInfo,
>   		 enum tr_select TxRxSelect)
>   {
> diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
> index 7841d9ce1a7f..8005f7462aca 100644
> --- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
> @@ -396,7 +396,7 @@ static void RemoveTsEntry(struct rtllib_device *ieee,
>   {
>   	del_timer_sync(&pTs->SetupTimer);
>   	del_timer_sync(&pTs->InactTimer);
> -	TsInitDelBA(ieee, pTs, TxRxSelect);
> +	ts_init_del_ba(ieee, pTs, TxRxSelect);
>   
>   	if (TxRxSelect == RX_DIR) {
>   		struct rx_reorder_entry *pRxReorderEntry;
> diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
> index de0dd48d0646..42a9b1dafc27 100644
> --- a/drivers/staging/rtl8192e/rtllib.h
> +++ b/drivers/staging/rtl8192e/rtllib.h
> @@ -2010,7 +2010,7 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb);
>   int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb);
>   void ts_init_add_ba(struct rtllib_device *ieee, struct tx_ts_record *pTS,
>   		 u8 Policy, u8 bOverwritePending);
> -void TsInitDelBA(struct rtllib_device *ieee,
> +void ts_init_del_ba(struct rtllib_device *ieee,
>   		 struct ts_common_info *pTsCommonInfo,
>   		 enum tr_select TxRxSelect);
>   void BaSetupTimeOut(struct timer_list *t);


Hi Tree,

we need to wait which patches are accepted. I cannot apply this patch on 
the top of the patches already send and I assume those are accepted. See 
below:


kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ git apply -v 
~/Downloads/20230713-\[PATCH\ 05*
Checking patch drivers/staging/rtl8192e/rtl819x_BAProc.c...
Checking patch drivers/staging/rtl8192e/rtl819x_TSProc.c...
error: while searching for:
{
	del_timer_sync(&pTs->SetupTimer);
	del_timer_sync(&pTs->InactTimer);
	TsInitDelBA(ieee, pTs, TxRxSelect);

	if (TxRxSelect == RX_DIR) {
		struct rx_reorder_entry *pRxReorderEntry;

error: patch failed: drivers/staging/rtl8192e/rtl819x_TSProc.c:396
error: drivers/staging/rtl8192e/rtl819x_TSProc.c: patch does not apply
Checking patch drivers/staging/rtl8192e/rtllib.h...
Hunk #1 succeeded at 2004 (offset -6 lines).
kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$

So better wait for Greg to choose which ones will be accepted.

Bye Philipp

