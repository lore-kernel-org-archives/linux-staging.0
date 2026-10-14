Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6B655D89C
	for <linux-staging@lists.linux.dev>; Wed, 14 Oct 2026 16:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996236; cv=none; b=FFxwWWT5Y7eS3nLcirZLIACdaZbhKfAUx/khM4yYsLfSBNp6cdOsdhhZNr9+lHJ82KCOXBNIT8dcURSikbgyksmci35i6B0YQP6j2h9IdmjZN/THFqmkQYXd23DJSbiDwjleLIV746weXdb/d+eHpRcXSW+1/rAYyiq7CiSIRFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996236; c=relaxed/simple;
	bh=bMi/DEr46nCBK0Ri82lU6QRjtiZ7lCr+IIP2NY+jCtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jJ5z3OA2rRPrFYVd6HuWt7W0/pZw2bIxeuaWWEOkpj5+aj0Tua9af41xZveAFS6Fuh0/DyJcsphqhjZK4Wfg9/W8guLtEH9iS87X5SRwLFbkpb3yejkMLGwFg5+0DstDXjRl9C5/QPAuIcNswjF9posOQSlDp2uCRM2pjN/wRrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/w40c/J; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/w40c/J"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso31933715e9.0
        for <linux-staging@lists.linux.dev>; Wed, 14 Oct 2026 09:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791996233; x=1792601033; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3r2lwCTZGF+MXPZOewUY2omgQNLDPCVMfOb7+0VhAMI=;
        b=S/w40c/JJUmQtHPk94JNjBcdqwkwsboHL0lmji2fZuxq7EKp9anzMTsaaAzZXy+whk
         W1F2iU3IFTV/VtHiqEyBdTWYTqupBoCp1qHFTK86HPllv2UueqqpXaY+a2UTGoZlBGmu
         c1/lEmAT/zl0TDCH9EyiON/PivNnYtQzqRZ/r8W8Rx7+WZVAVem+UJZset1D41OD7VSm
         prrtmn90O/cp75m0rhA0rc2nuDUjoHKgbsqmgOdjRaJAx2VZdHCXLGsrrHjXo+NrG9Li
         9Lj0VN9d8meEQSeqeoAR/Q6kxC7F13F46wb5MDbJnWWZl2LqI3AZKCoyvqPPou5UCZbA
         RvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996233; x=1792601033;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3r2lwCTZGF+MXPZOewUY2omgQNLDPCVMfOb7+0VhAMI=;
        b=23uH8B9gBgNfKlTh+2W5yLYkLsgJ87pLjBveVWc1ELa5W9IVUqNvNySkFRHCQa/ji+
         547D//2a3NUEtZcrPDYZ12Sc2pJ4cLaU0kFtqKMN7nA6JvkK/Cgz2YR/PKd248K8v3dz
         JZVJ8hakyKco1YfZDP+4Y3jAypMWIcIPslzOc5gCJDZuk14fmdcJiCuAn5ZWyTFdQ0+z
         UmM4GsVcCFC+6+bAE6bePg4thpzfmgnp6ZyZp3oqmvP55s1rM42zygVcInj0IkguEAQv
         yoqXGB7WtDNJxC0B0Y6EsVCtEJbtjYrpztFfmQxklWCYur5/G/As5Oem4zaNdoY2YE0h
         /QBg==
X-Forwarded-Encrypted: i=1; AKwUvBz+LTU792C5stKMrXGMCI8fFN5Unex5U1KvfHPmbmWis6r2oHpg4aDkamBERSXKRwtBzYA9WgXxp23jLNhZ@lists.linux.dev
X-Gm-Message-State: AFq9FYInCDzzfoFdH0bXBuzHnlFRAhq+aZwT2JqLz/zO8BegWjLxCRuJ
	OIrB9vpzTrZzdtzUIGULNLrXQRS6CCNWMt3yu5TojKyXooLM68wLyg6x
X-Gm-Gg: AYBFou0OLX++1InldsQQNbKp5ugdOHBpAiVrIbuw0Fq8Z7gvBvP4zXuWkUYnLYuKRja
	ceiSk1vLY7aZhuafQ0uQZyLOj94tPLGmYvdWlhhiCWtsWLN7fK8PIlKqX0Vwh8zf+thdwOVQksP
	PH7C15WWN1d/D4ZgM/KZgJTX4pLjDIgYCTUHwdfVWxa6eC8A67qXa+WN3dBD0dYxCnu2Y3il5s9
	T1BTIwJ6OFaG2tTv4FG7cbwwhk8VqE+4jwnuYqZCq/mBZ1bFCJO9mLE2sy8LWBvIorFk8k04Vzl
	nUEPogs5g7BQ//rWI7ZxEZATHOKseSt6YQfYiCKdoUXkLl5hpIHJ48tdDM7Wo6qZwTm7IviE9jz
	Tzxu+fw1KdDrOxe2xRlKWmp05xvKLfG7+jQYPZcKGE1DhBxhbIK4JVbLyNJoSWPeyUj2A8GzO/+
	msqgS2AUk73lcOjAMkG8E1sAzsAYmDmMpJCJOky+uX9sNtU9gcRVBj7I7cy5BLVIeMypOk2ie6N
	uDcTnOTgLnHxF/Yb/kmpSs60jOiu7TbngEuIL0=
X-Received: by 2002:a05:600c:8b83:b0:4a1:811c:8064 with SMTP id 5b1f17b1804b1-4a18e4d5512mr318233085e9.26.1791996232493;
        Wed, 14 Oct 2026 09:43:52 -0700 (PDT)
Received: from [10.5.0.2] ([187.14.227.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b381fsm3544945e9.7.2026.10.14.09.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 09:43:49 -0700 (PDT)
Message-ID: <6d881c38-33f7-48e0-88d0-4d16170c24e6@gmail.com>
Date: Wed, 14 Oct 2026 10:43:46 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: greybus: replace PTR_ERR() with %pe in error
 messages
To: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
 Alex Elder <elder@ieee.org>
Cc: johan@kernel.org, gregkh@linuxfoundation.org, vireshk@kernel.org,
 elder@kernel.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev
References: <20261013022402.6322-1-pavankumaryalagada@gmail.com>
 <2fd23f9b-7eab-4afd-aa77-93a5b9ff0c75@ieee.org> <as6mC7sZnpqIKxN6@user>
Content-Language: en-US
From: Jeremy Dean Clifton <gservice341@gmail.com>
In-Reply-To: <as6mC7sZnpqIKxN6@user>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 3:43 PM, Yalagada Pavan Kumar wrote:
> On Tue, Oct 13, 2026 at 03:11:51PM -0500, Alex Elder wrote:
>> On 10/12/26 9:24 PM, pavankumaryalagada@gmail.com wrote:
>>> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>>>
>>> Use %pe to print error pointers directly and display their
>>> error names.
>>>
>>> Keep the other PTR_ERR() call because its return value is
>>> needed for ret.
>>>
>>> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>>
>>
>> Generally I think what you're doing is OK.  It looks
>> like %pe is better than just %d, because it prints
>> the error *name* for the pointer-coded error.
>>
>> But I have two general questions about this effort:
>>
>> - There are other places in the Greybus code (even in
>>    just the staging source files) where this exact same
>>    thing could be done.  Why limit this to "fw-core.c" only?
> 
> I initially limited the change to "fw-core.c" because I was
> focusing on the error messages in that file.
> 
>>
>> - Do you think that all Greybus error messages should be
>>    converted to use %pe (passing ERR_PTR() if necessary)
>>    instead of %d for showing the error number?
> 
> Using %pe prints the error name instead of just the
> error number, which makes the error messages easier
> to understand.
> 
> For example, the current message is:
> 
> 	failed to create download connection (-12)
> 
> with %pe, it becomes:
> 
> 	failed to create download connection (-ENOMEM)
> 
> I think the second message is easier to understand because
> it shows the error name instead of just error number.
> 
> I also found other PTR_ERR() calls in Greybus. some of them
> are used to return error codes and should remain unchanged.
> 
> For example, in fw-core.c:
> 
> 	if (IS_ERR(connection)) {
> 		ret = PTR_ERR(connection);
> 		dev_err(&bundle->dev,
> 			"failed to create management connection (%pe)\n",
> 			connection);
> 		goto err_destroy_connections;
> 	}
> 
> Here, PTR_ERR(connection) is needed to store the error code in ret
> for the error-handling path, while passing connection to %pe makes
> the error message more readable.
> 
>>
>> I think your suggested change is a net positive, but
>> doing it in some spots but not others means it is
>> adding a bit of inconsistency.
> 
> I agree that similar cases elsewhere in Greybus are worth
> checking to keep error reporting consistent. I will look
> at the other Greybus files for cases where using %pe would
> be appropriate.
> 
> Would you prefer me to extend this change to the other
> relevant Greybus files, or keep this patch focused on
> fw-core.c and submit a separate patch for the remaining
> changes?
Also, you could coordinate something with Julia to use Coccinelle for 
this. Using regular expressions, you could programmatically find all the 
places where %pe and connection can be in place of %d or %ld and the 
return from PTR_ERR().

Jeremy Clifton
