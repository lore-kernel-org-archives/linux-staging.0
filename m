Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7611E1FAEEA
	for <linux-staging@lists.linux.dev>; Mon, 21 Oct 2024 18:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.140.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729536670; cv=none; b=dVM64ctiM4LGlRhfeT49HnH9G8Q4H9V0h2jp06e7vlyOSm7ca0OeZk4gQTQ1kuFjqcgUYWRAGi0gEl52/3e5tAbcWjiuGFOYku0/LuyaYiVPg6kmoAZXYXoSpNcRl587R1DdjVlvl4W3Dy9XDlb5+Lcsue2wMK4wjgKl5Ah0QXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729536670; c=relaxed/simple;
	bh=/XFxw3bh00KhcHxU3GKkjBv3x/ednhf5e0yEAhHI+3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=loFx8r+kV3+XcwhFNx52Ibs0HT0X/lASQZt83E2XrsmhdkFpySeLdAqsIfvpUlytMJ7TtPiteiLA4m1Yi6rBjjjx4cqXFakChJAdvdGuj54VryXc9YlvnAMRdmRy7DX3sMsjue30CsyWh2z+2jF95bcxFdzsfSlAo+HR8+kMfqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl; spf=pass smtp.mailfrom=ijzerbout.nl; dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b=XGK+KfjB; arc=none smtp.client-ip=136.144.140.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="XGK+KfjB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1729536664; bh=/XFxw3bh00KhcHxU3GKkjBv3x/ednhf5e0yEAhHI+3A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XGK+KfjBf4zpXQsP6lolHIAIXQb5xtb2GQXB2fS/qQoLl8u58r9f16orGaYHkKaPH
	 bOU2ENbHZ0tlaT7k4dfz5y3X5BeT7/1ScTh2ld8xiI3X2zWIwD/UQyN1gBqIr6bZCc
	 dmw8BJPep8+TTvd5/htG7RMp7bBO9OV5Y36yLKHwTDjvKDlTLyPqieNc8zaFDtsMsi
	 AlviyTtdtwlq0j656JWqeUyJU5480HSa+ZzlFcY61vxMo+S6TmsB0GJMjJDbPEuht9
	 HbhtDUadg62clVRT0i4v+b83k8zWfHVm9YyS2wmEx7SBicilKXiDqKo8LRtAGzZIiZ
	 egWnFzPWzVsku/hJmAWHtu2pDr4LGdbkvVS8Ss5lqJe6d4zHDQDFAyj6Wyk1l3Cqt/
	 8ze38G409seKERvt/3xuRUHJD/vjedPT/m7+bSYNA2lPuKVKM0kOUun9wqhpbCT3u3
	 NMs5FuhppgTTbO1WrpFsGGkV1tk/NVm4ortRSLFBB0LxJlLtN/vz+zWpDzGwnzRZcN
	 yj7mShRi/iZnNdxM8v5e5n1fv6g5nNInFYlbezUKrQistZpPoHzpUTYZQ15vYsFlR1
	 SsffcFHwxCFsNCAwW2BAx1QOvECn8MqPX9gcJtDiUeQ6h8wRvJYdUWtA9QT7cAdDy0
	 Vb4RxQTQNFKBcjP44QeLll18=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
	by bout3.ijzerbout.nl (Postfix) with ESMTPSA id 6EC2B18DB7B;
	Mon, 21 Oct 2024 20:51:04 +0200 (CEST)
Message-ID: <95bf0807-5f99-47e3-b926-cdbe794016b6@ijzerbout.nl>
Date: Mon, 21 Oct 2024 20:51:01 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: gpib: Add missing check for NULL
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Dave Penkler <dpenkler@gmail.com>,
 Linux Staging <linux-staging@lists.linux.dev>
References: <20241020192243.C6A0F18DA7F@bout3.ijzerbout.nl>
 <4a049f7e-b852-4b69-bfd7-1a4ce3dccbe8@stanley.mountain>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <4a049f7e-b852-4b69-bfd7-1a4ce3dccbe8@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Op 21-10-2024 om 09:54 schreef Dan Carpenter:
> On Sun, Oct 20, 2024 at 09:21:43PM +0200, Kees Bakker wrote:
>> This was detected by Coverity, CID 1600787
>>
>> Signed-off-by: Kees Bakker <kees@ijzerbout.nl>
> This is how your patch looks like in lore.
> https://lore.kernel.org/all/20241020192243.C6A0F18DA7F@bout3.ijzerbout.nl/
> The subject and the body of the email are far apart.  It's like a book, right?
> The title of the book isn't the first sentence of the book.  Feel free to
> restate the subject if necessary.  The commit message should really say the
> impact of the bug, (how it looks like to the user) and you need a Fixes tag.
>
>> ---
>>   drivers/staging/gpib/common/gpib_os.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
>> index d5860a0a131f..57ff1ed30dac 100644
>> --- a/drivers/staging/gpib/common/gpib_os.c
>> +++ b/drivers/staging/gpib/common/gpib_os.c
>> @@ -1667,6 +1667,8 @@ static int autospoll_ioctl(gpib_board_t *board, gpib_file_private_t *file_priv,
>>   		return -EFAULT;
>>   
>>   	desc = handle_to_descriptor(file_priv, 0); /* board handle is 0 */
>> +	if (!desc)
>> +		return -EINVAL;
> There is always a board 0 so the check is unnecessary.  This kind of heuristic
> tends to have a lot of false positives.  It's better to just ignore static
> checkers when they are wrong.
Let me go ahead and disagree with you there.

Notice that we already have the following code in ibclose()
         desc = handle_to_descriptor(priv, 0);
         if (desc) {
So my change isn't that alien in this module.

If we really hate to add that check, then there can be two alternatives
1. add a comment

2. change the code as follows:
     /* There is always a board 0 */
     desc = file_priv->descriptors[0];
>
> regards,
> dan carpenter
>

