Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BDA3CAA52
	for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 14:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075563; cv=none; b=OC+SM8wLdnO0k9MT0zlVdTplqY2PjYt+GFQb2Nhi1e4Bxy9eXiHZ9K7yi0IhLd4+l+YkhmKSuCWVz7+1v1SDEM0kK7S5VbtxRBZucJYaYObVgJ3q/m6cXdXj5sVYNoYqpv3F2AKesWdsrTFMppnIPHTQ6sA7MB6RKIYdraWx+FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075563; c=relaxed/simple;
	bh=J1DmfvQ3bSlmu/fY22Cf1h8mrdFixKrrTxBkC8vPwI0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lA998UanInRiTzIvZGhcsoBlUnHxqfsIa43WUbJcFnHEp9FOk9eNlEC5+lgFnunYkkYwzgtbNcZWl9q+nh3ApS7cSpq3zInxpHalFKalbPjsMqyYR7LnsnCzQOfVZL9nvIsFbTPJ4RzZIL/ckpuF4R9BGMdcqlGEedcEtT5s8rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rXVPA6Pf; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rXVPA6Pf"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8ad98c3fb15so44733307b3.2
        for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 07:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792075561; x=1792680361; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nY8bEQTDRiBiqLeVmhJUy+oN+INRLBn8jSuVjWbtsUo=;
        b=rXVPA6PfvMMoM7etyyymEHjtjqwgMB8WLX0HOKixSV6kzPoprnaH+zWdZSwrCcO/2u
         dr698VdaYNCzCrCYB0PhSHGEPd3WScnEL2kvasQXQ9i953fWDTeyUZHtRzEA9Ep36js+
         Yvq1b4ZeVZVLnCYsuULaiPn9o0V6SwQbo1XTJa3f+ul6M0a7f9f7+UtvDqkQU77KQGNI
         Su6eSksDOqbkv+f7Tuw4asfyQ4OTPqjasLAsFK5KoNZBDg+8YN6W4zW+PUgSW/tg6rwq
         RMBkGFfzeBtc0uMxivsDjge5ssE+army3Nh/0GhSUJIDxTmLoxfhEZql+sftI3tWG1is
         zpFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075561; x=1792680361;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nY8bEQTDRiBiqLeVmhJUy+oN+INRLBn8jSuVjWbtsUo=;
        b=0OjtyzOgDIvrpzpgYcR3DIXrgegZvmAUN3J8TkSqgW3E3zCDLCbArpLov9DwIX93M0
         djKp03/HaK6sbo0ryYttRQiqVtJd9+Wf6OqqwN3a+BiqN/Q9XZuGGKaAXetohpl3vIPE
         QwbOsHtF9HLc174nSG8bUiritJSvJbd0rtVd7Vh/dPSh3ct6rdgYnX60fYQnYJqkoZoy
         21kQZsnhs8Jg2L1T+vaiMNWFygrouWYDeP+f7lfIEc5D8ZY2Mu40/qGewWjLaAbCm0yE
         qZ+xk3868RFhwhRhL3TDUHZR8ymd/Wc56rv8ayX9Ux11zyTCWj3hfUK/u/eqV8TV50+X
         Harw==
X-Forwarded-Encrypted: i=1; AKwUvBxCZa55m+IDZiNLJYcVZ8O5optKYd1/eLJFKh42SvpP12spF13iWb2MweI2fqDBIwkXisM/2Snqzr2drhpN@lists.linux.dev
X-Gm-Message-State: AFq9FYImDE0oIMlt3P5ueGVaWPqFHCbhvkp+JmehtA9g3rVQf9lfmvwT
	9onZhBlXNwR8rJczQ5njFxFgoTgdtsJHrsPG0Qg2fx++9d+wGxAqJyUp
X-Gm-Gg: AYBFou3380L+VYa5l4JAJH0Lj+jP1G/j2G2NDbK7TmSMgBcgg3GA3CK3cZzYz1JgxDZ
	ybX81dFddFtXuPBIsBe6lCFqTY9ahaFIHx8H20pV8W8435LIroNDEm7FRZPK5J5ISBclJX26Y9e
	38ujiPTgDB6GHG5xegjSyE5EgUa5AMcj5lNosn3orVFL7cV2XgspUtjZzSIKohfEjOIyoNbAXJW
	8Ccb1xWwSEafap18XMSgcpqjj23oa5HIzcsvU5wyEytdumyeUSetivsms0K5YzMHj7ZCUqftkbV
	W5obr6atNIqSiwTQ18arH3EA2g/0rYOy856XKj1n/B7XthHIk6HfTs74UFO8qM433BU1mzGDaJE
	2p2EkNWVEi9WTYnOBqzakxf9iEj4xj5vMZ/CE6pLVUDU0lSxLZNHKTDAxHg2i1uMCTcjn24RCHj
	CN5OTjTiX1jyeIMR8WMwGFKFRltNf7uU3NLkbdLEm+8lmuGWISWFyL6KiKipC1wcud/Nbm+sWAA
	4y39S3ALQs0+hPprbifJS5nw65j+oKcTcPoVCMn9mQazMvp9Fce
X-Received: by 2002:a05:690c:402f:b0:8ae:c015:3e36 with SMTP id 00721157ae682-8b07eebfba0mr45173167b3.50.1792075555970;
        Thu, 15 Oct 2026 07:45:55 -0700 (PDT)
Received: from [10.5.0.2] ([186.247.181.208])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f1ea845sm67908267b3.24.2026.10.15.07.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:45:55 -0700 (PDT)
Message-ID: <de94c8cd-0afc-4a35-bf81-019a8e4cc8e8@gmail.com>
Date: Thu, 15 Oct 2026 08:45:54 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: nvec: use guard(mutex) in nvec_write_sync()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeremy Dean Clifton <deaner92@yahoo.com>
Cc: Marc Dietrich <marvin24@gmx.de>, ac100@lists.launchpad.net,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@inria.fr>
References: <20261012222926.7754-1-deaner92.ref@yahoo.com>
 <20261012222926.7754-1-deaner92@yahoo.com>
 <2026101335-expansive-veteran-c4d6@gregkh>
Content-Language: en-US
From: Jeremy Dean Clifton <gservice341@gmail.com>
In-Reply-To: <2026101335-expansive-veteran-c4d6@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/26 12:15 AM, Greg Kroah-Hartman wrote:
> On Mon, Oct 12, 2026 at 10:29:26PM +0000, Jeremy Dean Clifton wrote:
>> The three return paths of nvec_write_sync() each release
>> sync_write_mutex with explicit unlock calls.
>>
>> Use guard(mutex) to unlock the lock automatically on any return
>> path.
>>
>> This removes the three mutex_unlock() calls.
>>
>> No functional change.
>>
>> Signed-off-by: Jeremy Dean Clifton <deaner92@yahoo.com>
>> ---
>> v2:
>>   - Reword the commit message to state the motivation and to make
>>     clear that removing the mutex_unlock() calls is the result of
>>     the change (Julia Lawall).
>> v1: https://lore.kernel.org/all/20261012171312.5998-1-deaner92@yahoo.com/
> 
> Please read the archives for why I will not take guard() rewrites of
> staging drivers (nor do I want to see you use a LLM in here either.)
> 
> sorry,
> 
> greg k-h

Hello Greg + Everyone,


It turns out that I was unknowingly subscribed to this list and started 
creating patches for the Outreachy group without ever having submitted 
an application to Outreachy. I just wanted to learn how to contribute to 
the Linux Kernel and I saw https://kernelnewbies.org/ as a direct 
connection to Outreachy.

While I am technically not part of this cohort, I can still review 
patches. What is preferred?

I assume that the same rules apply outside of Outreachy? No LLMs and no 
guard() rewrites.

Jeremy


