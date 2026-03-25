Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43513264C7
	for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 22:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774477347; cv=none; b=mZgoz6/WvazwRAcN3U7D76/dnh3r0zzVoChaSBezPE5oZSw/ANsrIq0LyeR2HYgUq+mo0Tg1h0ZZ0ZaTvjxB9kgE0NJX3Pa52/Nhg4xFJPzQ98k0OC/fl8nQHvmbhzGWKHgypAAlXW3Q/iZPER9ijRocTuLLfsld7qWqJVEbmIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774477347; c=relaxed/simple;
	bh=oIZxwS7DyaKrQvzESHSMKLgpw8mQelWUJVu14lPeFVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T4SkGc1jJaTtfh8BpVkn6XQVfVXLbiG95JiiyULqOESlqo5++D8qzrioLnD+YlFQTwpkzO0oE2f7O+6UpNp8RO/D2WUe2zqG3NEBZ1lzJ3CUQnGUADqjfyMl9GsbD+sftYl5wyOYvwD+WYJd/fviIbYbZ1vKEqaXXcb+bWGvqNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DW5VNLPx; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DW5VNLPx"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7d7fdb922a5so254770a34.3
        for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 15:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774477344; x=1775082144; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jMVBUq76We5OmSgDu+kPUK+rLvGUIFxCal3rZvl7YbA=;
        b=DW5VNLPxFI27pJjnuwaDCCJDiLiRV6qani74M0fAuMbskWu8t6RYZSLGpckui/WN+e
         mZuQYBAmkWg8ZB4XZl7ONcggNbLX5hr8P5fXO/OC0OkJO+p/ZxVD/bEeMURB0mPaQzZh
         DRDtdRTOIU+jyVqEolWVOHQxSTcq//n0shMe4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774477344; x=1775082144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jMVBUq76We5OmSgDu+kPUK+rLvGUIFxCal3rZvl7YbA=;
        b=EYq3qMITKtL2bqPnpF8IIoUe/+XlkWYLwp5iilT/qWAB8TyMsBr/amzRhn3+Zmvw1W
         DJeD+8aw/IonYIGvqNzt8exD0dXGzQqA9keOxzyun5Zap5CVNq/FvHKLhC4LWejNkWbD
         OYpWfBJybf8pTavFMpnOtRiNzs0o1KKvx2j6JkqdDE14OInD/Pswl467RBG62IWLxRbh
         Cs9QCgSRetbW1dwFLiAaNZYutZwFJUGbRVzjAG/cj82kSjh9nQw6TlSnoCYc83LDmKwO
         3X2rO7F2ZXFZs0O0zQbaob/Jk0Y330e0syI5k9uJdfkgxn+YxwYzBfspTmWAEwYsfqM7
         VbTw==
X-Forwarded-Encrypted: i=1; AJvYcCWEzsmqFPBBbBMSnrIYwYSQeWY3skTv3+3jVSG2o2uqWUc3G7bIAQ+R3CAPEOBNvYO9W2T948qTZ0K6rUqb@lists.linux.dev
X-Gm-Message-State: AOJu0YwsXgg9gX5NhcpLqRLcD6PAf2KRbjEFdR0lkmuijA+OxCqWOAER
	1BTfF7dy+Knfm58vup687HbYOGYCNXWS9KerB3OluzAeN7DMpsYbgDX6w8r3Qqi7o2g=
X-Gm-Gg: ATEYQzwJP7MyLjcPgykH5iOMKlBNFQeK0fThOWvAUve6ze2U8L3HRJ6qA6owhIPRVIp
	1SHfR1oZuEdxo4NKXpmb02eWM/C2f6HjB31HWWF0mvN2lnjWJ2v24NS+M0ggw5ukfcC47qWk8Er
	jrCiXxRW30p5yz/JvC6esEged7xlQ6yOgcOa0QOTFOGblk9c24pAylRcerBtzI8WVKTHCVBfFEY
	FH9phv5URXA8AyTI4u9KIKHQ+pJ/dBxT82EZ5/wdv41Pc7dFoByOdSovycF/G84+GdMklUjN5R+
	EKsIJ1TmxsofE367E8l2XwYcnUa7jQPIIseH8/QJVqQwC27O8Jv2+/XZ46kDQXMPIrXTY9tWs8e
	zK3IY/+HCRPQ4LpPp6sBBCaidLie0TV2ak6xmE/d7qQgxfxLkq18EakghmwpZ9tEOEDbxt98YOH
	dpKFqt0I1ihrHNgNisLgR9XMjbvb/n7yZQxzxmICx7+X6kMw==
X-Received: by 2002:a05:6830:6f45:b0:7d7:fcdd:3f8c with SMTP id 46e09a7af769-7d9d6b1ac8amr3142144a34.34.1774477344605;
        Wed, 25 Mar 2026 15:22:24 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d9e680456bsm1004206a34.0.2026.03.25.15.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 15:22:24 -0700 (PDT)
Message-ID: <730559e1-aea5-492e-8e5d-9a7ed3b38323@linuxfoundation.org>
Date: Wed, 25 Mar 2026 16:22:22 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: rtl8723bs: fix constant on left side of test
 checkpatch warnings
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Prithvi <activprithvi@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 gregkh@linuxfoundation.org, abrahamadekunle50@gmail.com,
 straube.linux@gmail.com, b9788213@gmail.com, ethantidmore06@gmail.com,
 weibu@redadmin.org, knavaneeth786@gmail.com, ignacio.pena87@gmail.com,
 dharanitharan725@gmail.com, lukagejak5@gmail.com,
 samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
 s9430939@naver.com, suunj1331@gmail.com, ysinghcin@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, david.hunter.linux@gmail.com,
 khalid@kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20260323162901.121947-1-activprithvi@gmail.com>
 <acFtiaXTp7bwl604@ashevche-desk.local>
 <20260324130234.3776tp4ykuerffcg@inspiron>
 <acKU7JjW3OFugHXY@ashevche-desk.local>
 <20260324135551.grth7jfjyoh5krzr@inspiron>
 <acKaP0Jz-VqfmEqj@ashevche-desk.local>
 <20260324160229.f46h25ebd2mxcfiq@inspiron>
 <656d3bf5-8d97-454e-9691-540cdb79dab4@linuxfoundation.org>
 <acONUF2nLAk6uhQs@stanley.mountain>
 <ea43143b-a880-4d15-9fd6-1a4a25abf187@linuxfoundation.org>
 <acRU-NKBqLe4-e3E@stanley.mountain>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <acRU-NKBqLe4-e3E@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/25/26 15:34, Dan Carpenter wrote:
> On Wed, Mar 25, 2026 at 11:57:38AM -0600, Shuah Khan wrote:
>> My primary concern with this change is that it 10 files changed, with
>> 26 insertions(+), 32 deletions(-)
>>
>> It can be difficult to find any regressions unless the changes are
>> tested. I understand it is staging repo, but if we relax the rules
>> for staging irrespective of the scope of change, it becomes lot
>> harder to find regressions later. We are essentially leaving the
>> job of testing to users. Also if ans when the driver is pulled into
>> mainline, it will inherit the regressions that crept in.
>>
> 
> To me this is a mechanical patch (basically automatic, flip the
> if statement) from a newbie.  These kinds of patches are seldom a
> problem.
> 
> I took a sample of the patches for five years from 2021 to the end of
> 2025.  We merged 54406 commits in staging.  We had 401 Fixes tags.  But
> then I decided I don't care about Kconfig problems so I cut it down to
> 380 bugs.  Half of those (189 commits) were from when the driver was
> merged.  We tend to not review code very much when it is first merged
> to staging.  The other half (191 commits) were from us missing bugs
> during review.  191 bugs over five years is 40 bugs per year.
> 
> I hand reviewed a bunch of the 191 commits.  It's mostly senior
> developers and maintainers who introduce bugs.  They are normally doing
> complicated things like adding features or re-working core parts of the
> driver.  Quite a few of these patches were tested.
> 
> The fallout from newbie patches is pretty rare and often really
> minor.  A common thing is "We deleted code but we didn't delete
> everything."  The number of serious mess ups is probably just a
> couple times per year out of the 40 total bugs per year.
> 
> I've attached my script so you can check yourself.  NEW means the
> bug was introduced by a new driver.  OLD means, ideally it would
> have been caught in review.
> 

I am not the maintainer for this driver, so it is really up to the
maintainer(s) to accept mechanical patches such as this one.

As for the mentorship, I like to use a consistent rule that testing
for regressions is important and that author needs to disclose how
the patch is tested or not tested in the version 1 of the patch and
add RFT tag. That way maintainers can make an informed decision on
whether to accept the patch or not.

thanks,
-- Shuah


