Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A945417BC5
	for <linux-staging@lists.linux.dev>; Wed,  7 Feb 2024 10:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707303358; cv=none; b=Uj59EbUfTkoFlORB5uJgQcs6TLGX5ksNKzUy7T1Xdn0cyELCD11iXEVfnYVGUe6tnspsrWrkWsj9GRWC4NERff9PkO8HPBYqpALNv4JJKt4xotBx9YGgbi+PmPfuOtdOTO6B5FUqX/USZb0fUFUCagsEtD83eFwgCnYpPDJZ6yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707303358; c=relaxed/simple;
	bh=lItl1HgQctg0yGO3vQoW8No5gH2g/kKbqcRUSlAmvso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f0SLjAYWnZfxisEnVdQNW1nhkKUWCeKyzz+fGa8W8sXjuJnolW2aPB/LXZtTmvRh2CmkRzsL+btkWz/msO6Y3I6L6LS5Y0ZX1JPI1sWGu+3F+OYD2koY1p1GPepWS9QDFcvIaXfDepemI6dZMknABTii74RDfXkAl0FiPKsDksA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q5+j+kOy; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q5+j+kOy"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-55cca88b6a5so540782a12.1
        for <linux-staging@lists.linux.dev>; Wed, 07 Feb 2024 02:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707303355; x=1707908155; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qLCLXsc5fUpptpYla60epcYi7vijOWLdq8xCpov6J+E=;
        b=Q5+j+kOyXLms+JO7mZ3j9Kt7eLonfGPBOHP1gSM5CwlRHwDhZnR4i9zJME++9+nuo0
         kzNBUfjb0FR7ahBA7thPWLSV4/RJ/bn3b9sasWDq+D6+Gz0WSieXCE1xPt8onZQT0uDg
         Nt/KVoY7b8reYHyYd1P+rMAmdgOw/LR0DglEpfhVy8PcuGAu62rs1soa5AYmAeGAYqNY
         mmPjRR+U4n+oE19mS+exWJbsKkBYhWkoLW8u/KY+Tr4L9/Xhy7iIr0JvR0huLaCmbg0+
         2HQOkSIucQR/lIJiBrd8kUkaWZi/ISeTca6CzSEuH+O8rlq7MTSlfdFFEAnJTS63NLaf
         hz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707303355; x=1707908155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qLCLXsc5fUpptpYla60epcYi7vijOWLdq8xCpov6J+E=;
        b=E73gQl9qd/dnjYKDZUX8wJVh+/o8pnLV/65QQmEhjpwiP9fMrQ7HE8Eczhy3ESV1cz
         tC7IdSoEMPsW5728oDcx/2u/UW28k9fVi5Z8sCb8PMyGrA/+kKH8YFn8OiIgxwjJh0L9
         P+PeMu6vOYfItPg6sT8flTq/9lfFdZso7rPu+Uo655Jl9JxtZSjnGh5vkDq9aDFOwGZt
         oACAA+wsnfgLT0bqy+HVWolMy0xnYUpCOYA9nh7fTVtiH90NaUFxz6vexNyFxOp1Ob7D
         ju0mtyDdsE7VFnzpSncssyg6DNxPTd+0wY+YoAZPJjiqTQ5MbLWFSfgw5GxeWtiOzsxn
         cyrw==
X-Gm-Message-State: AOJu0YzN3gbQyAu0AlSswpHJcdr0BhAMmkvPxpr9DYjBMjHmmauRizGJ
	ikdrdifVGZC1RIMHXfIRHnJW7dIKPRvzKMYBFuwmRjdQ/2ahQ4vH
X-Google-Smtp-Source: AGHT+IG45p9GOrVYDWYexIC+i3WbKpGc8eD4wiqw2CDKsihG2jvG+xhWIxjCsdmid7rhutrQ0vEAqw==
X-Received: by 2002:a17:907:3c25:b0:a38:551d:ff1d with SMTP id gh37-20020a1709073c2500b00a38551dff1dmr1516680ejc.73.1707303354560;
        Wed, 07 Feb 2024 02:55:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVLoIXfY+ERKrpUa2c4Uedi7yheP7R34zr6Q0XQOpvQT/qv/PFI1XIpHYmRTfCqFbPI+9HOVMOcKzkCp7b+y7B8NHIr4K4pK0A11agu5ZBd2l7z2sZK6DyGHytottEKkvRDGNknz4MxzOxcKkwAu0etrc+ELfkCD0n/2OB7uxRxJA==
Received: from [192.168.0.101] ([95.90.186.51])
        by smtp.gmail.com with ESMTPSA id vb5-20020a170907d04500b00a388723b7a1sm314137ejc.50.2024.02.07.02.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Feb 2024 02:55:54 -0800 (PST)
Message-ID: <a7bb4065-6e78-459f-b280-caa0b922a317@gmail.com>
Date: Wed, 7 Feb 2024 11:55:53 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8192e: remove redundant braces from single
 line if-else blocks
To: Greg KH <gregkh@linuxfoundation.org>,
 Ahmet Sezgin Duran <sezgin.duran@linux.org.tr>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Michael Straube <straube.linux@gmail.com>
References: <b97e1f8927d81b9b72cdea7a30f300b35854c38d.camel@linux.org.tr>
 <2024020757-desktop-atlantic-749e@gregkh>
Content-Language: en-US
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <2024020757-desktop-atlantic-749e@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/7/24 11:13, Greg KH wrote:
> On Tue, Feb 06, 2024 at 11:53:38PM +0300, Ahmet Sezgin Duran wrote:
>> >From de5c5bb23c77fe62987b446c740b971e85105526 Mon Sep 17 00:00:00 2001
>> From: Ahmet Sezgin Duran <sezgin.duran@linux.org.tr>
>> Date: Tue, 6 Feb 2024 22:28:55 +0300
>> Subject: [PATCH] staging: rtl8192e: remove redundant braces from single line
>> if-else blocks
> 
> Why is all of this here in the changelog body?
> 
> Please fix up and send a v2.
> 

There is already a pending patch with these changes.

https://lore.kernel.org/lkml/20240201081824.6998-2-straube.linux@gmail.com/

regards,
Michael
