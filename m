Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B30131A9B5E
	for <linux-staging@lists.linux.dev>; Fri,  8 Nov 2024 19:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.140.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731094695; cv=none; b=TkJttV5LeudbJuhUXjW9lDWgC2mte/FfTm3FGFA1f7TCgB7GUcDg7IdQsrl/aHdEzs52CQk7ZLgnjl37MtcaX2MdBo/eURljWzD8tt//YbeaA984igy0U5oS6VxReFeXf0RJpmCidc7z2L84hO+fdliIz6MXYCCwrR26HYYXCnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731094695; c=relaxed/simple;
	bh=FdbWkjQvOIEPqsf9pXhy25/qAypWmcGuHmr/SN5vxa0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DqpEAN2o3mlFLuctOWjzUhOj+VdHNhY0XSbqA99Ooao4QvoOlobmVYxZndCNwnO0upOngg+SsEaKwhW3QNZx56kZ2oMk3QyDNlZvt6D0535VH6Rgc68vuUJRiFJCPCYQHch9XzPyjS+spGwL5prXG8cV+W6POYDCD2j8AGSPirE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl; spf=pass smtp.mailfrom=ijzerbout.nl; dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b=Zu3h0Ckb; arc=none smtp.client-ip=136.144.140.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="Zu3h0Ckb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1731094682; bh=FdbWkjQvOIEPqsf9pXhy25/qAypWmcGuHmr/SN5vxa0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Zu3h0Ckb4hmC0dJ2zfS/ZUCf35/eK/Tiwvr2pLaVuc6j2wIVR0lBcFS0LqaxaBOLP
	 onnVgDriVgROyp2cdr6mrGIn+2Y9GU+zm3pTfsd5VOoSALcXp/ntaKENaZzx8jYnxa
	 FDk6e6CSMEJEpC8Dan0Xzo/FwbHCpr/WqwdHMwH1n252pCZ4OJriDfwPX1OaxBWwQ7
	 93NDEjjZRYLcWiBZShkp5uxV3K/LoYaPo2OSq3+XhiZ8a9NFi4lNFJmDdUWblv/nFS
	 xDOh93YDLmwOy6VfK/s5Gu3Hyq8BxW67Ip/F7Ul8yUhgIGeh9afaRvo4xwPZ5L5cLU
	 Lkavjna4ReV1yhBnnG96cQDsXgoyZ+ANHSM/k9+lrX3FNRfjTlCacRT/jr9iwP3Poo
	 yIfdxpr0qUc7HfnNm4p7gIuEJpS7888Gz5unNUDiujMxQeaTaaV3HyzA6YXuujrpJ/
	 ZIBXe5bBatIVCpnbVr2Pbgi9YJOjMJnxW9iYrzueTXf2FOjA5CC+e+HEYRWeLv+eNc
	 oOqtxLZ8Z2DAtjaOZZnUGkmmxDFVCJjdRnY3o7k59ppLQvO0lYx/3VM7V+VgKqULVM
	 lhvvxnSU6VuYqIYE/KlwHGsmfYmK1uUS2bYZ3AighkyrUlNI8bnyaLMNQzM3qpK3X+
	 ABD40zxnWyhqsEDqpbHNe4K8=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
	by bout3.ijzerbout.nl (Postfix) with ESMTPSA id 65B3718DE31;
	Fri,  8 Nov 2024 20:38:02 +0100 (CET)
Message-ID: <6a97acbc-b4b3-472e-a999-fb4acae0e633@ijzerbout.nl>
Date: Fri, 8 Nov 2024 20:37:59 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] staging: gpib: Change return type of
 fluke_get_dma_residue
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Dave Penkler <dpenkler@gmail.com>,
 Linux Staging <linux-staging@lists.linux.dev>
References: <20241104193347.A0B5A18DD37@bout3.ijzerbout.nl>
 <2024110714-scanner-apple-0792@gregkh>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <2024110714-scanner-apple-0792@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Op 07-11-2024 om 09:25 schreef Greg KH:
> On Tue, Oct 15, 2024 at 10:33:30PM +0200, Kees Bakker wrote:
>> The function fluke_get_dma_residue returns an error as a negative value.
>> So the return type must not be unsigned.
>>
>> This was detected by Coverity, CID 1600782
>>
>> Signed-off-by: Kees Bakker <kees@ijzerbout.nl>
>> ---
>>   v1 -> v2: change type of `residue` var; add note about Coverity CID in commit message
>>   v2 -> v3: add version in the subject (sorry Greg)
>>
>>   drivers/staging/gpib/eastwood/fluke_gpib.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
>> index f9f149db222d..3843e986f104 100644
>> --- a/drivers/staging/gpib/eastwood/fluke_gpib.c
>> +++ b/drivers/staging/gpib/eastwood/fluke_gpib.c
>> @@ -536,7 +536,7 @@ static int fluke_accel_write(gpib_board_t *board, uint8_t *buffer, size_t length
>>   	return 0;
>>   }
>>   
>> -static unsigned int fluke_get_dma_residue(struct dma_chan *chan, dma_cookie_t cookie)
>> +static int fluke_get_dma_residue(struct dma_chan *chan, dma_cookie_t cookie)
>>   {
>>   	struct dma_tx_state state;
>>   	int result;
>> @@ -549,7 +549,7 @@ static unsigned int fluke_get_dma_residue(struct dma_chan *chan, dma_cookie_t co
>>   	dmaengine_tx_status(chan, cookie, &state);
>>   	// hardware doesn't support resume, so dont call this
>>   	// method unless the dma transfer is done.
>> -	return state.residue;
>> +	return (int)state.residue;
> Shouldn't you be checking the result of dmaengine_tx_status instead?
> residue is a u32 and is NOT an error here so I think the unsigned value
> here is correct as that's not going to give you what you expect it to
> give you.
I'm not the author, so I leave that up to David.

However, in the mean time you have already signed off on a similar
change in commit 14bcf831f0d [1], so my patch won't apply anymore.

Note that there is a function fmh_gpib_get_dma_residue which is
identical to fluke_get_dma_residue.
That one was changed in the same way, commit 039beaa5ace1 [2]

[1] 
https://lore.kernel.org/r/20241017092511.17621-1-everestkc@everestkc.com.np
[2] 
https://lore.kernel.org/r/20241017220740.30370-1-everestkc@everestkc.com.np
>
> thanks,
>
> greg k-h

