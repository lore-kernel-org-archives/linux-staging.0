Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72FA12E48
	for <linux-staging@lists.linux.dev>; Tue, 10 Sep 2024 05:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725944702; cv=none; b=tEEj4MAjhTHunz2cIbId9CkfGYJht0JHvSQXVA15OAyZ3ncYdL8MEgLuHksPA6C8VwdxVbTzLjATMNesdpIBrpWuINn3DJq371jiOzeKvYsBJkVeyUTDoNty2Y1LCNgS7lRvrfqPPkMUH/xgp2TVu4KhQ9RQhgXz5XyIySRIhGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725944702; c=relaxed/simple;
	bh=Suc20FRgOMNXHNNiIchSC+TwSIUu481t0POauYFBTww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PUJ/bZ0PwcU6Z+/dIT6P7RmynLwWqcA8mCT9nyKmf/sXEcdg83VWhPyRHxohk4oHtk/2FJUb2/ibVjI0hfLC/KS1YF4Ag9OiUFv30ah42c6ZjFOXosd+CjPjhGfLOta/DNThyrtQroso0U40zr5TXyauN6a0fxOnzRPw0ux3VyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=imenmLSp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="imenmLSp"
Received: from [IPV6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f] (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 12A6C63D;
	Tue, 10 Sep 2024 07:03:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1725944607;
	bh=Suc20FRgOMNXHNNiIchSC+TwSIUu481t0POauYFBTww=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=imenmLSpUxeShNY8Oq3HHaAHAbOnmzWrX8E1C/dgdpYF8t59M9z70VOrWZ6y4zBSK
	 irrPZ9pXE85zX4BhcPxBKlGy2annAYpaLZJbaFpbB+/PjV0IHB2WrWFV6HGZuPrv6W
	 ToFRXfftS2v99zKk/ogf00iNfCcxE80ETDEHaJ3k=
Message-ID: <32c47d9a-523a-4a17-9aa6-a9f5a36a1e60@ideasonboard.com>
Date: Tue, 10 Sep 2024 10:34:39 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] staging: vchiq_core: Refactor
 vchiq_bulk_transfer() logic
To: Stefan Wahren <wahrenst@gmx.net>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20240909061457.255452-1-umang.jain@ideasonboard.com>
 <58767847-e2d9-4e9f-8d8a-7c6f14d270fc@gmx.net>
Content-Language: en-US
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <58767847-e2d9-4e9f-8d8a-7c6f14d270fc@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 09/09/24 11:38 pm, Stefan Wahren wrote:
> Am 09.09.24 um 08:14 schrieb Umang Jain:
>> Series mostly refactors vchiq_bulk_transfer() code according
>> to Arnd's review comment from [1]:
>>
>>> You can also wrap vchiq_bulk_transfer() in order to have
>>> four separate functions based on the different 'mode'
>>> values and have them only take the arguments they actually
>>> need.
>> I didn't wrap vchiq_bulk_transfer(), instead created four
>> differnet function, one for each mode.
>> This will pave the way to address his second comment:
>>
>>> Ideally this should be cleaned up in a way that completely
>>> avoids passing both user and kernel data at the same time.
>> which is not part of this series and will be done on top as
>> arguments shuffling will have to fix the sparse warnings
>> that exists currently.
>>
>> Patch 1/7 first moves the VCHIQ_BULK_MODE_WAITING logic out
>> of vchiq_bulk_transfer
>>
>> Patch 2/7 then moves the core logic to vchiq_bulk_transfer()
>> which can be shared in subsequent patches
>>
>> Patch 3/7 and 4/7 refactors remaining bulk transfer modes
>>
>> Patch 5/7 finally drops the vchiq_bulk_transfer() as not needed
>>
>> patch 6/7 and 7/7 are drive by patches, noticed during development.
>>
>> [1]: 
>> https://lore.kernel.org/linux-staging/3d3b7368-93b2-4c0d-845e-4099c2de9dc1@app.fastmail.com/
>>
>> changes in v5:
>> - Fix regression for VCHIQ_BULK_MODE_BLOCKING in 3/7
>>    (Fixes strange hang from v4 with 'vchiq_test -p')
>
> The whole series is
>
> Tested-by: Stefan Wahren <wahrenst@gmx.net>

Thanks for testing and especially catching the strange hang!

The 2/7 review comment will be addressed in v6 (shortly)

