Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76782F80
	for <linux-staging@lists.linux.dev>; Wed, 26 May 2021 06:15:02 +0000 (UTC)
Received: from dggems704-chm.china.huawei.com (unknown [172.30.72.60])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FqgYw70pCzQrYh;
	Wed, 26 May 2021 14:11:16 +0800 (CST)
Received: from dggpeml500023.china.huawei.com (7.185.36.114) by
 dggems704-chm.china.huawei.com (10.3.19.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 26 May 2021 14:14:54 +0800
Received: from [10.67.77.175] (10.67.77.175) by dggpeml500023.china.huawei.com
 (7.185.36.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 26 May
 2021 14:14:54 +0800
Subject: Re: [PATCH] staging: rtl8723bs: remove the repeated declaration
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <linux-staging@lists.linux.dev>, Hans de Goede <hdegoede@redhat.com>
References: <1621923531-21262-1-git-send-email-zhangshaokun@hisilicon.com>
 <YK0kIsNcPHDhvT8D@kroah.com>
From: Shaokun Zhang <zhangshaokun@hisilicon.com>
Message-ID: <fbeba5db-c55d-dcb1-92f7-63dc437f0c82@hisilicon.com>
Date: Wed, 26 May 2021 14:14:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YK0kIsNcPHDhvT8D@kroah.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.77.175]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected

Hi Greg,

On 2021/5/26 0:21, Greg Kroah-Hartman wrote:
> On Tue, May 25, 2021 at 02:18:51PM +0800, Shaokun Zhang wrote:
>> Function 'Hal_SetBandwidth' is declared twice, remove the
>> repeated declaration.
>>
>> Cc: Hans de Goede <hdegoede@redhat.com>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
>> ---
>>  drivers/staging/rtl8723bs/include/rtw_mp.h | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/staging/rtl8723bs/include/rtw_mp.h b/drivers/staging/rtl8723bs/include/rtw_mp.h
>> index 2788ad80b114..ea3abee325ef 100644
>> --- a/drivers/staging/rtl8723bs/include/rtw_mp.h
>> +++ b/drivers/staging/rtl8723bs/include/rtw_mp.h
>> @@ -348,7 +348,6 @@ void Hal_SetCarrierSuppressionTx(struct adapter *padapter, u8 bStart);
>>  void Hal_SetSingleToneTx(struct adapter *padapter, u8 bStart);
>>  void Hal_SetSingleCarrierTx(struct adapter *padapter, u8 bStart);
>>  void Hal_SetContinuousTx(struct adapter *padapter, u8 bStart);
>> -void Hal_SetBandwidth(struct adapter *padapter);
>>  
>>  void Hal_SetDataRate(struct adapter *padapter);
>>  void Hal_SetChannel(struct adapter *padapter);
>> -- 
>> 2.7.4
>>
>>
> 
> You sent 2 patches with identical subjects, yet they did different
> things :(
> 

Oops, my apologies that I didn't check it carefully.

> Please fix up and send a patch series that properly identifies what is

Since both are the trivial patch on rtl8723bs, shall I do a single patch
to cleanup this?

Thanks,
Shaokun

> happening here.
> 
> thanks,
> 
> greg k-h
> .
> 
