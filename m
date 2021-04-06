Received: from smtp59.i.mail.ru (smtp59.i.mail.ru [217.69.128.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B980B5F
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 05:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bk.ru; s=mail3;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc; bh=DU+yJ/nNcCPqEgTf+W2Py69EhFSSYq3lqTEdmxykt/M=;
	b=mnjaJjXWye1oDym3uiynrrLiIu7WmsH5VTUwMgKos1Y525E8wnzBexZ7jriWQkiewo9P5yEEGWHxK90ews1zhmClHiSwzXpCI0H2pE51Eg6DPqz1AD8HKeSO0kbwJeSub3EynAG5+sbhYDSshIHsE7j13D1WcVD3vdU3zk2ZxA8=;
Received: by smtp59.i.mail.ru with esmtpa (envelope-from <dev.dragon@bk.ru>)
	id 1lTeNG-0002j3-Kn; Tue, 06 Apr 2021 08:35:39 +0300
Subject: Re: [PATCH] Staging: rtl8192u: ieee80211: fixed a trailing statements
 of condition.
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210404132613.5464-1-dev.dragon@bk.ru>
 <YGrjKEjr9GJtJlO5@kroah.com>
From: "dev.dragon" <dev.dragon@bk.ru>
Message-ID: <4cba0693-2dd1-4a90-b6de-509910593d87@bk.ru>
Date: Tue, 6 Apr 2021 08:35:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YGrjKEjr9GJtJlO5@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp59.i.mail.ru; auth=pass smtp.auth=dev.dragon@bk.ru smtp.mailfrom=dev.dragon@bk.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD9ED7173E37F4E32947427BE79D20CABD433B5E0F054050395182A05F53808504099931C5E6C69272D7F5E68EC9755089264524172C275AAE0670C749C5E13AFF9
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE77BF46084C0059042EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637317AD06F2A8D0AEF8638F802B75D45FF914D58D5BE9E6BC131B5C99E7648C95C16EE06F5A270FE6AA3F259946646B846AA3B1D15B1ABDB2CA471835C12D1D9774AD6D5ED66289B5278DA827A17800CE77E7E81EEA8A9722B8941B15DA834481FCF19DD082D7633A0EF3E4896CB9E6436389733CBF5DBD5E9D5E8D9A59859A8B6197FFA0EFC27E0ACA471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC9E07643B1679F57A3AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F79006379FAE9817E08B75D7D81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F8A95B0C53A59341F57739F23D657EF2BB5C8C57E37DE458BEDA766A37F9254B7
X-B7AD71C0: AC4F5C86D027EB782CDD5689AFBDA7A24A6D60772A99906F8E1CD14B953EB46D915FB19991592FC7355D89D7DBCDD132
X-C1DE0DAB: 0D63561A33F958A5DA9E023F7D9FB5E9FCB5246E2C3C8F8A71E1E69FD0E68C1CD59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75ADE5BB8891CD3BFC410CA545F18667F91A7EA1CDA0B5A7A0
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D34AB80C45F81B80D63997B409C95A09DE55B7671491295A031087EAD74D3554C5B456DC5020DD7659D1D7E09C32AA3244C76A2B2FBA87A7A48977AFE4E91B44C0E4DBEAD0ED6C55A80FACE5A9C96DEB163
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojM00ve/f+0okbd5MdrZGfxQ==
X-Mailru-Sender: 3A338A78718AEC5AA85B3E7661095C1EA3C92153EDB79A6AC04CDE494A0E054479ECB9C90B2EBC743833C6AC539110AEA432B8CD90067B65A6C5C4E98768B51D7AA22088860DD9FF5CDEF9E650933936342CD0BA774DB6A9AE208404248635DF
X-Mras: Ok



On 4/5/21 1:15 PM, Greg KH wrote:
> On Sun, Apr 04, 2021 at 04:26:14PM +0300, dev.dragon@bk.ru wrote:
>> From: Dmitrii Wolf <dev.dragon@bk.ru>
>>
>> Fixed a coding style issue.
> 
> Really?
> 
>>
>> Signed-off-by: Dmitrii Wolf <dev.dragon@bk.ru>
>> ---
>>  drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
>> index 690b664df8fa..29a6ce20e2bd 100644
>> --- a/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
>> +++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_softmac.c
>> @@ -2048,12 +2048,12 @@ void ieee80211_softmac_xmit(struct ieee80211_txb *txb, struct ieee80211_device *
>>  	/* if xmit available, just xmit it immediately, else just insert it to the wait queue */
>>  	for (i = 0; i < txb->nr_frags; i++) {
>>  #ifdef USB_TX_DRIVER_AGGREGATION_ENABLE
>> -		if ((skb_queue_len(&ieee->skb_drv_aggQ[queue_index]) != 0) ||
>> +		if ((skb_queue_len(&ieee->skb_drv_aggQ[queue_index]) != 0)
>>  #else
>> -		if ((skb_queue_len(&ieee->skb_waitQ[queue_index]) != 0) ||
>> +		if ((skb_queue_len(&ieee->skb_waitQ[queue_index]) != 0)
>>  #endif
>> -		    (!ieee->check_nic_enough_desc(ieee->dev, queue_index)) || \
>> -		    (ieee->queue_stop)) {
>> +		 || (!ieee->check_nic_enough_desc(ieee->dev, queue_index)) \
>> +		 || (ieee->queue_stop)) {
> 
> This feels really wrong.
Reread coding style - agree with you.
> 
> The || should be on the end of the line, why is checkpatch complaining
> about this?
Looks like it was confused by preprocessor directives - excluding it by comments gave me positive checkpatch respond.
> 
> And that '\' is not needed at all :(
Can i fix it in my next patch?:)
> 
> thanks,
> 
> greg k-h
> 
