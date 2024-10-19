Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A6F2772A
	for <linux-staging@lists.linux.dev>; Sat, 19 Oct 2024 18:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.140.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729361954; cv=none; b=hP/KhoJodyIn78iD1B8ajHTt/rQurdaQc4nYlLEhyFevKcPpQtUtBJ839FU1W2FvN1M2VhwCBWEz3HY9JkglzXthi0ujoU8drAedu3ImFu2Gc+l4rUHawZZdT/wdDSNHx3mwrpKv2wYs1yJWR45q8dg17LVBAvasnQaMuceNX1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729361954; c=relaxed/simple;
	bh=+4ObqmDP6taYedHn8FKxlMWQkvKNAGdbZHiI4MZgFhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BV6+NcFT77e6CTu2sp7pMomcsX6MSZwJe+zBI6eBr7jIovAoNKnQCBOhmMv8D+C5/ejyLE/A6bZavpD9fwpfED086GebmhmQQ84iBgbc1yI1wYqoTc9EWnpES6QYWbVxIChOGdS+kZvoFNS+0BU1J3m1/735IeLQidUwbHqaJ90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl; spf=pass smtp.mailfrom=ijzerbout.nl; dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b=ZfgVmctH; arc=none smtp.client-ip=136.144.140.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="ZfgVmctH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1729361946; bh=+4ObqmDP6taYedHn8FKxlMWQkvKNAGdbZHiI4MZgFhE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZfgVmctHwIw7P7UZ7yCmazFF1e8HwUIm3aWyxCcGdjZ8+ZzctB7o343bH522WXVCF
	 XepCIh42CCMpiwrnnU7ff3J51kwT1M+8tKA7811n+GoMRwO8REVrVsCOgYqsqLxh6N
	 cfhlBjOA7/ULS1Rd14Z3hr5AMPgpSFnktNBlBNJnT9AbpnodCyxoMCV79K0WzvSGb2
	 qF/ja8SvxFFAaBkItxwAY9ESXDzWQS8tE4Gv3wMrM01g9uXgQ7C92JBVT5FRSK5vIg
	 WOkez2OenSHadcOagxCbaFXDVFVeasRSTBAxXLJpZwOpRKYplFKRNNjJCxRj7xb+u6
	 S2wXb7kavEpIhZoldQPkh/IpvASTcItgByUnSN7NTF429P6bBuSu1nnKh937LndCCz
	 /qHYzNAZB876+zq7t1YOmadz+cUgoZUaw2MCddlUZ2dLh6+CPkbgQgpgPFEnxkQhmm
	 SQOWZ5Rv5MmWx0msLxwmdBr9Qaa0xryyS/Do9S9QUeUCMUMjUd8zGPtpsViwAZWDhe
	 W+MRSy65yIPCCe2j5DjMfYIjpJ5fmzLTF8cW/iHBtueyuUrqFz1tIsgwOQQvmm28PF
	 erfQhKq6eqr6/Il9nQl3qyTLcHeoPSn36O5tFG+pNI95BCOcF9sgg51FYVzYDrP3RF
	 hexsE2Sfenqyqhjpc5oi78sQ=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
	by bout3.ijzerbout.nl (Postfix) with ESMTPSA id 18CF018D8CD;
	Sat, 19 Oct 2024 20:19:05 +0200 (CEST)
Message-ID: <c918a67f-c361-4ddc-b462-2bc630eb1df9@ijzerbout.nl>
Date: Sat, 19 Oct 2024 20:19:03 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: gpib: Change return type of
 fluke_get_dma_residue
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Dave Penkler <dpenkler@gmail.com>,
 Linux Staging <linux-staging@lists.linux.dev>
References: <20241017181504.1346F18DAF2@bout3.ijzerbout.nl>
 <2024101940-elective-aviator-baf6@gregkh>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <2024101940-elective-aviator-baf6@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Op 19-10-2024 om 09:59 schreef Greg KH:
> On Tue, Oct 15, 2024 at 10:33:30PM +0200, Kees Bakker wrote:
>> The function fluke_get_dma_residue returns an error as a negative value.
>> So the return type must not be unsigned.
>>
>> Signed-off-by: Kees Bakker <kees@ijzerbout.nl>
>> ---
>>   drivers/staging/gpib/eastwood/fluke_gpib.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.c b/drivers/staging/gpib/eastwood/fluke_gpib.c
>> index f9f149db222d..77bbe2b587b1 100644
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
> Then why isn't residue an int?  Shouldn't that be also changed?
Good catch. I need to resend a patch.

>
> thanks,
>
> greg k-h

