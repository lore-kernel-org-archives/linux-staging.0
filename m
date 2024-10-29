Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885F74400
	for <linux-staging@lists.linux.dev>; Tue, 29 Oct 2024 02:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730170720; cv=none; b=LuBVu7eYcqTMXjIPi8rwm3iYdK1FSu+ZxKGzbQB+EQ9/l4P8DM94BobGddEuA+jC/qUOevizNWnbc52Wftq8gp7HU3ILUJNOg1bgIxd8zMuiHA5WPDGJF6kgr/04HWkeAcd9goD6+wWFbD2yNg/odAD+rkaiz9Lkrsbqm4kxhBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730170720; c=relaxed/simple;
	bh=VAh+/kNuWLTsBEbxpcWAPXK0O3PvoN0bbd67rjXQETU=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=iG4kPUlqhEHQ8qttl1NI5iX7oiCwPCKQ+6lQmi5SftG3n+PFkhmrz2jjFiwgXNIbYfXXd4C4PQDz58wg9AjUDXCN/NO49y3OolTKymeD/TnA8lYWux6shyEIMtXbu+CrvCdI3nLSMzfq3ojifet+pc1EKX/zdhFIl43V16eNcek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Xcvzp13nGzyTwM;
	Tue, 29 Oct 2024 10:56:54 +0800 (CST)
Received: from kwepemk200016.china.huawei.com (unknown [7.202.194.82])
	by mail.maildlp.com (Postfix) with ESMTPS id C5CF6180064;
	Tue, 29 Oct 2024 10:58:31 +0800 (CST)
Received: from [10.67.108.122] (10.67.108.122) by
 kwepemk200016.china.huawei.com (7.202.194.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 29 Oct 2024 10:58:31 +0800
Subject: Re: [PATCH] staging: greybus: fix possible null-ptr-deref in
 gb_audio_manager_get_module()
To: Alex Elder <elder@ieee.org>, Dan Carpenter <dan.carpenter@linaro.org>
CC: <vaibhav.sr@gmail.com>, <mgreer@animalcreek.com>, <johan@kernel.org>,
	<elder@kernel.org>, <gregkh@linuxfoundation.org>,
	<ankov_svetlin@projectara.com>, <greybus-dev@lists.linaro.org>,
	<linux-staging@lists.linux.dev>, <wangweiyang2@huawei.com>
References: <20241026081153.2649890-1-yiyang13@huawei.com>
 <9ada17f8-7b3a-4bf7-8fc8-f40bf67adb33@stanley.mountain>
 <a9cfb5e6-33f4-495c-b329-7e97f626d1a1@ieee.org>
From: "yiyang (D)" <yiyang13@huawei.com>
Message-ID: <541d16d3-ea2e-d956-5dd9-613ede430fe5@huawei.com>
Date: Tue, 29 Oct 2024 10:58:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <a9cfb5e6-33f4-495c-b329-7e97f626d1a1@ieee.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemk200016.china.huawei.com (7.202.194.82)


On 2024/10/28 20:46, Alex Elder wrote:
> On 10/26/24 5:50 AM, Dan Carpenter wrote:
>> On Sat, Oct 26, 2024 at 08:11:53AM +0000, Yi Yang wrote:
>>> The gb_audio_manager_get_module() is EXPORT_SYMBOL, and will return NULL
>>> when incoming parameter id < 0, fix possible null-ptr-deref by add check
>>> for return value.
>>>
>>> Fixes: 8db00736d365 ("greybus: audio: Add Audio Manager")
>>> Signed-off-by: Yi Yang <yiyang13@huawei.com>
>>
>> Where is gb_audio_manager_get_module() called from?  So far as I can 
>> see it's
>> never used.  Why not just delete it?
>>
>> regards,
>> dan carpenter
> 
> I agree with this.  I suspected all callers might have guaranteed
> that the "id" value passed would be always valid, but... there are
> no callers.
> 
> It is a simple function, and could be added back again if it is
> needed in the future (possibly even by reverting the commit that
> removes it).
> 
> If you do this, please remove gb_audio_put_module() in the same
> patch.  It too has no callers.
> 
> Thank you.
> 
>                      -Alex
> 
> .

I tried to find the caller before I modified it, but unfortunately I 
didn't find the caller, so I suspect some non-kernel driver code will 
try to call this functions.

I just found this problem while reading the code and I'm not sure if I 
should remove the function.

regards,
Yiyang
-- 
