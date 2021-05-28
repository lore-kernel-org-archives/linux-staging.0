Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987F72FB1
	for <linux-staging@lists.linux.dev>; Fri, 28 May 2021 01:27:19 +0000 (UTC)
Received: from dggeml707-chm.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Frn4065XnzWnNy;
	Fri, 28 May 2021 09:22:40 +0800 (CST)
Received: from dggpemm500004.china.huawei.com (7.185.36.219) by
 dggeml707-chm.china.huawei.com (10.3.17.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 28 May 2021 09:27:16 +0800
Received: from [10.174.177.91] (10.174.177.91) by
 dggpemm500004.china.huawei.com (7.185.36.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 28 May 2021 09:27:16 +0800
Subject: Re: [PATCH next] staging: rtl8723bs: HalBtc8723b1Ant.c: Remove unused
 variables
To: Greg KH <gregkh@linuxfoundation.org>
CC: <dan.carpenter@oracle.com>, <desmondcheongzx@gmail.com>,
	<marcocesati@gmail.com>, <fabioaiuto83@gmail.com>,
	<linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <20210526074537.46259-1-cuibixuan@huawei.com>
 <YK98CL3+Gg5hGH9g@kroah.com>
From: Bixuan Cui <cuibixuan@huawei.com>
Message-ID: <d8401186-585f-deec-5eea-869b896b0ab1@huawei.com>
Date: Fri, 28 May 2021 09:27:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YK98CL3+Gg5hGH9g@kroah.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500004.china.huawei.com (7.185.36.219)
X-CFilter-Loop: Reflected



On 2021/5/27 19:01, Greg KH wrote:
>>  		halbtc8723b1ant_PsTdma(pBtCoexist, FORCE_EXEC, false, 8);  /* Force antenna setup for no scan result issue */
>> -		u4Tmp = pBtCoexist->fBtcRead4Byte(pBtCoexist, 0x948);
>> -		u1Tmpa = pBtCoexist->fBtcRead1Byte(pBtCoexist, 0x765);
>> -		u1Tmpb = pBtCoexist->fBtcRead1Byte(pBtCoexist, 0x67);
>> +		pBtCoexist->fBtcRead4Byte(pBtCoexist, 0x948);
>> +		pBtCoexist->fBtcRead1Byte(pBtCoexist, 0x765);
>> +		pBtCoexist->fBtcRead1Byte(pBtCoexist, 0x67);
>>  	} else {
>>  		pCoexSta->bWiFiIsHighPriTask = false;
>>  
>> -- 
>> 2.17.1
>>
>>
> Does not apply to my tree :(
Hi,
This warning has been fixed by commit db52e8f48067. Please ignore my patch.

Thanks
Bixuan Cui


> .
