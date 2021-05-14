Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47F872
	for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 01:24:06 +0000 (UTC)
Received: from dggeml765-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Fh9G31MHPz61Nv;
	Fri, 14 May 2021 09:01:31 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggeml765-chm.china.huawei.com (10.1.199.175) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 14 May 2021 09:04:55 +0800
Received: from [127.0.0.1] (10.174.177.72) by dggpemm500006.china.huawei.com
 (7.185.36.236) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 14 May
 2021 09:04:54 +0800
Subject: Re: [PATCH 1/2] staging: rtl8723bs: core: remove three unused local
 variables
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Fabio Aiuto <fabioaiuto83@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
	linux-staging <linux-staging@lists.linux.dev>
References: <20210513094007.6435-1-thunder.leizhen@huawei.com>
 <20210513094007.6435-2-thunder.leizhen@huawei.com>
 <YJ1shU6dNDx6rLaF@kroah.com>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <2be317a7-7785-9381-7fe5-6db0363ba85d@huawei.com>
Date: Fri, 14 May 2021 09:04:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YJ1shU6dNDx6rLaF@kroah.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected



On 2021/5/14 2:14, Greg Kroah-Hartman wrote:
> On Thu, May 13, 2021 at 05:40:06PM +0800, Zhen Lei wrote:
>> Commit 968b15adb0ea ("staging: rtl8723bs: remove all DBG_871X logs")
>> removed all of the DBG_871X logs, so no one uses local variable 'reassoc',
>> 'reason_code' and 'psta' anymore.
>>
>> Fixes: 968b15adb0ea ("staging: rtl8723bs: remove all DBG_871X logs")
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>> ---
>>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 31 +++----------------
>>  1 file changed, 5 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
>> index 9031cf7657ae91c..acf5578863e17d7 100644
>> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
>> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
>> @@ -1021,7 +1021,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
>>  	u16 capab_info;
>>  	struct rtw_ieee802_11_elems elems;
>>  	struct sta_info *pstat;
>> -	unsigned char 	reassoc, *p, *pos, *wpa_ie;
>> +	unsigned char *p, *pos, *wpa_ie;
>>  	unsigned char WMM_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x00, 0x01};
>>  	int		i, ie_len, wpa_ie_len, left;
>>  	unsigned char 	supportRate[16];
>> @@ -1041,14 +1041,10 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
>>  		return _FAIL;
>>  
>>  	frame_type = GetFrameSubType(pframe);
>> -	if (frame_type == WIFI_ASSOCREQ) {
>> -		reassoc = 0;
>> +	if (frame_type == WIFI_ASSOCREQ)
>>  		ie_offset = _ASOCREQ_IE_OFFSET_;
>> -	} else { /*  WIFI_REASSOCREQ */
>> -		reassoc = 1;
>> +	else	/*  WIFI_REASSOCREQ */
>>  		ie_offset = _REASOCREQ_IE_OFFSET_;
>> -	}
>> -
>>  
>>  	if (pkt_len < sizeof(struct ieee80211_hdr_3addr) + ie_offset)
>>  		return _FAIL;
>> @@ -1726,7 +1722,7 @@ unsigned int OnAction_back(struct adapter *padapter, union recv_frame *precv_fra
>>  	struct recv_reorder_ctrl *preorder_ctrl;
>>  	unsigned char 	*frame_body;
>>  	unsigned char 	category, action;
>> -	unsigned short	tid, status, reason_code = 0;
>> +	unsigned short	tid, status;
>>  	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
>>  	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
>>  	u8 *pframe = precv_frame->u.hdr.rx_data;
>> @@ -1795,9 +1791,6 @@ unsigned int OnAction_back(struct adapter *padapter, union recv_frame *precv_fra
>>  					~BIT((frame_body[3] >> 4) & 0xf);
>>  				psta->htpriv.candidate_tid_bitmap &=
>>  					~BIT((frame_body[3] >> 4) & 0xf);
>> -
>> -				/* reason_code = frame_body[4] | (frame_body[5] << 8); */
>> -				reason_code = get_unaligned_le16(&frame_body[4]);
>>  			} else if ((frame_body[3] & BIT(3)) == BIT(3)) {
>>  				tid = (frame_body[3] >> 4) & 0x0F;
>>  
>> @@ -5127,22 +5120,8 @@ void _linked_info_dump(struct adapter *padapter)
>>  
>>  		if ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE) {
>>  			rtw_hal_get_def_var(padapter, HAL_DEF_UNDERCORATEDSMOOTHEDPWDB, &UndecoratedSmoothedPWDB);
>> -		} else if ((pmlmeinfo->state&0x03) == _HW_STATE_AP_) {
>> -			struct list_head	*phead, *plist;
>> -
>> -			struct sta_info *psta = NULL;
>> -			struct sta_priv *pstapriv = &padapter->stapriv;
>> -
>> -			spin_lock_bh(&pstapriv->asoc_list_lock);
>> -			phead = &pstapriv->asoc_list;
>> -			plist = get_next(phead);
>> -			while (phead != plist) {
>> -				psta = container_of(plist, struct sta_info, asoc_list);
>> -				plist = get_next(plist);
>> -			}
>> -			spin_unlock_bh(&pstapriv->asoc_list_lock);
>> -
>>  		}
>> +
>>  		for (i = 0; i < NUM_STA; i++) {
>>  			if (pdvobj->macid[i]) {
>>  				if (i != 1) /* skip bc/mc sta */
>> -- 
>> 2.26.0.106.g9fadedd
>>
>>
>>
> 
> Does not apply to my tree :(

Should I split it into three patches？It's like the 2/2 reason.

> 
> .
> 

