Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E0CD320E
	for <linux-staging@lists.linux.dev>; Sat, 19 Oct 2024 18:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.140.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729362663; cv=none; b=MTvZu/wZcIMqVD/jwHkkVpaUjFAVX01xJQz8XCL+0yVcDiBIcQrdLoVH3dIZNwJc4o/Id9uAx1VNoic31ehPapDYM5e5nYrq0bXx8A+AN7okW6NhsWuNIFLUQ9y9PTZ8lDsyc8GfYsThcayj+Ed1lN4hnPhWYF1mBdkHQZSy3h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729362663; c=relaxed/simple;
	bh=Dy4v/bNWWwtKbZy+/3xRhnQynKvK9YZ5huXIY4FHqgc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gcXW5lK5WBZ3ryFJFkTUuAnDse/5Ty/pIHgecmKvgXu8Rjr/ud46NpQL8BWOFC714mSj/vm4e6DlVMu9R0dLtng5Z/QUFMR4YM0NbTmNfN32fgjQP/IBRk8kdNqjr+2UKZoh5PtYgXMUUW42+bWGBqmX755QBzpHhO72MChHmuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl; spf=pass smtp.mailfrom=ijzerbout.nl; dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b=NSzypzqq; arc=none smtp.client-ip=136.144.140.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="NSzypzqq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1729362657; bh=Dy4v/bNWWwtKbZy+/3xRhnQynKvK9YZ5huXIY4FHqgc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NSzypzqq1klr7zPQYeTey11kmJWCsy6H5nBVCvFKHcw9HgccVgXggthU30RnH6FN3
	 h3IJMOLQoBQj3PgAj1oV8XKSUrOJCZngvKIfUA59ljowds7+z/fHhgNZYkpIfH7iTi
	 I1UVlZAbbxfsBotYU0aFzO9YRug/0vztr+WA7Y3dUWJt1pYGjhMU3PfepqeGKISSt3
	 9/psyU/tWshcbapRTuQ6tCGLokF/Zoz+jbnbBpkTnTpH0noF8ihQXV7Pi0Wq3aRY0b
	 GaVio1TaHc7yJ9p5C0f+H8lJ+iyjVTqHvTyxyYfilKuFe50gpoDN/dCtxUKdNnwLdw
	 qPcfdgPjTAiUBgEVMFSkNWO1QWKZg5mTu1tIuNqTpeUPflRc4tKL+XzsAEQ99B8qoN
	 OVo4lYav2awRkqnd6iExEtC5CnRIzGI8DHFQdJdw5yvAk21vw0a8dy9V9WchaePzep
	 Q9vDAip1Ntpr19CjjzbttI0rvO7JqqVl9sIIcIzhzSLr56Ft0IaT1dxfh9DJWaeJLi
	 B0CAexGh6vCgQp+ajw/TvAlrQeMMhN+hyC8rowPsEAbhN2K4C5aP5pOpYuIY2fxyv8
	 RB/G0bGmvfXhcvAUu5B67E1fa3USArx+aKAMGK70iGFNPZdfbHQH5dAh2iJZJ9h4jl
	 AiLilTPPjL0+cJ3cVU2htrPk=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
	by bout3.ijzerbout.nl (Postfix) with ESMTPSA id E3B5C18D8BE;
	Sat, 19 Oct 2024 20:30:57 +0200 (CEST)
Message-ID: <1c222b0a-a79f-402e-9d82-6160d95b1365@ijzerbout.nl>
Date: Sat, 19 Oct 2024 20:30:55 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: gpib: ni_usb: Move kfree after last use of
 in_data
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Dave Penkler <dpenkler@gmail.com>,
 Linux Staging <linux-staging@lists.linux.dev>
References: <20241017181522.7798918DAF2@bout3.ijzerbout.nl>
 <2024101925-comprised-letter-e970@gregkh>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <2024101925-comprised-letter-e970@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Op 19-10-2024 om 10:00 schreef Greg KH:
> On Tue, Oct 15, 2024 at 10:45:58PM +0200, Kees Bakker wrote:
>> In ni_usb_read() there was a kfree before the last use of in_data.
>>
>> Signed-off-by: Kees Bakker <kees@ijzerbout.nl>
>> ---
>>   drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
>> index 1da263676f2a..75f39e1f3ed1 100644
>> --- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
>> +++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
>> @@ -690,12 +690,12 @@ static int ni_usb_read(gpib_board_t *board, uint8_t *buffer, size_t length,
>>   		kfree(in_data);
>>   		return parse_retval;
>>   	}
>> -	kfree(in_data);
>>   	if (actual_length != length - status.count) {
>>   		pr_err("%s: actual_length=%i expected=%li\n",
>>   		       __func__, actual_length, (long)(length - status.count));
>>   		ni_usb_dump_raw_block(in_data, usb_bytes_read);
>>   	}
>> +	kfree(in_data);
>>   	switch (status.error_code) {
>>   	case NIUSB_NO_ERROR:
>>   		retval = 0;
> Does not apply to my tree, what branch did you make this against?
It was already done in commit b0a7dfeb7df ("staging: gpib: Move free 
after the variable use has been completed")
>
> thanks,
>
> greg k-h

