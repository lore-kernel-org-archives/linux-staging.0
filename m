Received: from mail.meizu.com (edge01.meizu.com [14.29.68.187])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0D4366
	for <linux-staging@lists.linux.dev>; Wed, 30 Mar 2022 01:42:40 +0000 (UTC)
Received: from IT-EXMB-1-125.meizu.com (172.16.1.125) by mz-mail04.meizu.com
 (172.16.1.16) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 30 Mar
 2022 09:42:38 +0800
Received: from [172.16.137.70] (172.16.137.70) by IT-EXMB-1-125.meizu.com
 (172.16.1.125) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 30 Mar
 2022 09:42:37 +0800
Message-ID: <fe624454-a530-3361-76d9-b4aeb89eba71@meizu.com>
Date: Wed, 30 Mar 2022 09:42:36 +0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] staging: r8188eu: Fix misspelling in comment
To: Greg KH <gregkh@linuxfoundation.org>
CC: <Larry.Finger@lwfinger.net>, <phil@philpotter.co.uk>,
	<straube.linux@gmail.com>, <linux@roeck-us.net>,
	<linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
References: <1647831314-25511-1-git-send-email-baihaowen@meizu.com>
 <YkMdEIMHrYBPGYzK@kroah.com>
From: baihaowen <baihaowen@meizu.com>
In-Reply-To: <YkMdEIMHrYBPGYzK@kroah.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.16.137.70]
X-ClientProxiedBy: IT-EXMB-1-125.meizu.com (172.16.1.125) To
 IT-EXMB-1-125.meizu.com (172.16.1.125)

在 3/29/22 10:52 PM, Greg KH 写道:
> On Mon, Mar 21, 2022 at 10:55:14AM +0800, Haowen Bai wrote:
>> The original error is as below shows:
>>
>> CHECK: 'associcated' may be misspelled - perhaps 'associated'?
>>
>> Signed-off-by: Haowen Bai <baihaowen@meizu.com>
>> ---
>>  drivers/staging/r8188eu/core/rtw_ap.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/staging/r8188eu/core/rtw_ap.c b/drivers/staging/r8188eu/core/rtw_ap.c
>> index 1675e2e..e02dd8e 100644
>> --- a/drivers/staging/r8188eu/core/rtw_ap.c
>> +++ b/drivers/staging/r8188eu/core/rtw_ap.c
>> @@ -819,7 +819,7 @@ static int rtw_ht_operation_update(struct adapter *padapter)
>>  
>>  void associated_clients_update(struct adapter *padapter, u8 updated)
>>  {
>> -	/* update associcated stations cap. */
>> +	/* update associated stations cap. */
>>  	if (updated) {
>>  		struct list_head *phead, *plist;
>>  		struct sta_info *psta = NULL;
>> @@ -972,7 +972,7 @@ void bss_cap_update_on_sta_join(struct adapter *padapter, struct sta_info *psta)
>>  		update_beacon(padapter, _HT_ADD_INFO_IE_, NULL, true);
>>  	}
>>  
>> -	/* update associcated stations cap. */
>> +	/* update associated stations cap. */
>>  	associated_clients_update(padapter,  beacon_updated);
>>  
>>  	DBG_88E("%s, updated =%d\n", __func__, beacon_updated);
>> @@ -1036,7 +1036,7 @@ u8 bss_cap_update_on_sta_leave(struct adapter *padapter, struct sta_info *psta)
>>  		update_beacon(padapter, _HT_ADD_INFO_IE_, NULL, true);
>>  	}
>>  
>> -	/* update associcated stations cap. */
>> +	/* update associated stations cap. */
>>  
>>  	DBG_88E("%s, updated =%d\n", __func__, beacon_updated);
>>  
>> -- 
>> 2.7.4
>>
>>
> Does not apply to my tree :(
yes, I need to develop on the next branch, but not before.

-- 
Haowen Bai

