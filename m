Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F83E3A35D9
	for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 15:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768490554; cv=none; b=s1ayRhRMXFb+rTrFX4mJenTaaslAjyJmRjCwpdj9/GHtymEf0x4grhUcBn2+0FQzCrsSUvPgU7OoIf90MeAZp1HzfHdogTEYdEXTVW3ijb1398xuWTwYGEDuYuerycvi2AqDLIPVuJTBEiQUlnJTdS4g0kJ0NW75CivKE4GK5Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768490554; c=relaxed/simple;
	bh=UZOVOZ/GMKBkP/ku1km8uOaHZJ/Bn7RSDnwQHBrnRpc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PAbGAt1LSW9BXXte64zoORNDnDlNVRi7EB6OcBsFWnnImx8V2aTjqxxWGeohW40ErhK2YfiVdgcW4uQAWc8kFHRtcMOLx7u1k1Oad5bXue48fZwVvR0Mv4RYlgAXDi6IAUWdeBml/t5CrXRU6ZEOy4QxdOPQgk1UJrq1ocCGpTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RTWzPFW5; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RTWzPFW5"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-790884840baso10859007b3.0
        for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 07:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768490546; x=1769095346; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UZOVOZ/GMKBkP/ku1km8uOaHZJ/Bn7RSDnwQHBrnRpc=;
        b=RTWzPFW5ww6PBgoLtavadLyCMB/jRagu3cfMfLryOz48KH59tlEL8UTJq58U33Rxwd
         7RLu61g+wOirBvOTlOJ6H3pt78FkjuSkqYbNvxNYPmtuCGM4A70NgfEExH8I/cCV2Cvd
         tpuZML7idhteZtOERvzVzYQNXGmnGxltZ91RDssbFigrPVQe/laAHBFdiGWvOuRrtNMG
         uRz4jpeDarL4kQ86++tkmzEh0GC2PXMaeH9YFEDNqjQUA4kwrlS58JjPUJcpYlQl1ju7
         sRWVyaP0diOheVbny1PXEKil0stM1XGBmkegVode/E309x0VmuOR1Dm3Am+R0G5CCUxU
         i6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768490546; x=1769095346;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZOVOZ/GMKBkP/ku1km8uOaHZJ/Bn7RSDnwQHBrnRpc=;
        b=WAlkUNNLYsXFkH57tk5e6uB1b80fQFPDNathhUskgh3Wwlnv0plWIjMpEWxRdsnxLJ
         lIU4bAN1Q5pPvVucC0Ehh1GLbvMKkynex5ujlHXeiOqGJebDUH895ZA07+UVjrDzvxuU
         6MzFCBxRbhkDtanysj1swF8iNkfQ1XQaw28sOQZl3MVkpp+WWb/mEuEA4IJW+OJUZBmd
         plz+PSJJOLrXMDcnnoMSUw7c8KVBDkl5kX3kOrtO5LR4IVby4nYLA7/TuMYzFxB/FVIu
         TCUKCMgKuWzj//lgg/Oor1k4KDndLa6VC6e0Uz5Hj7+JQbNrs1sgCypq+3ypvRs7vDdF
         cvrA==
X-Gm-Message-State: AOJu0YzdsEvK28Vh6Yd3/9yi749MEn+E3hAbejeYkSEKOPKxZqrVJq5u
	e5o6G/gZLNMs60xGFMnL9QqZLm5Nt5+CZIHIoiB6mrlCJ6ucgmo/vQqPcSI/t/PX5YEl9DuY2EM
	e2I5zSfcJRTE/ygv/YBjmv6jffJe7Yq564gjv
X-Gm-Gg: AY/fxX6V2Bpem7UcOMtnZzeryotdO1zcO+btdpKNV3/gwTUOSEkh0K0gYz2XFKqM5sO
	GcnKeE/ZF25H9T94Hfyii/ipQTnVgaNsh65QYjA0hBYQB8Dd+/PddjD3UaZu2aWYAhANMePCL5v
	xxV6UJ8IFV+btBoRbIvRHZKK+y4OpAe546mVPJV1KhV0wqKN9U6sbFzZmdutZfERMpl9Xing9EL
	/5DFrZrWrA5iRC2rOznGHIMnXwJsCjuECPRx87yq6cMUgT+efzOIcL+z0vDU9TptfGI6IszTQKf
	by0/fCU4
X-Received: by 2002:a53:eb83:0:b0:646:e33d:52ba with SMTP id
 956f58d0204a3-6491650f769mr49495d50.66.1768490546439; Thu, 15 Jan 2026
 07:22:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260115123942.83341-1-karthikey3608@gmail.com> <2026011550-grope-deeply-f17d@gregkh>
In-Reply-To: <2026011550-grope-deeply-f17d@gregkh>
From: Karthikey Kadati <karthikey3608@gmail.com>
Date: Thu, 15 Jan 2026 20:52:15 +0530
X-Gm-Features: AZwV_Qi4pXVR_wEp_jU04AZZOMkFT5h2GGaEaXnH3KSF_mw1VfEkpDydYvILov4
Message-ID: <CAPsOcukn8GhLyGbOCBWTzcUBU3=LFZb0QvWutMFtmVYGbV_veQ@mail.gmail.com>
Subject: Re: [PATCH v4] staging: octeon: Remove port status typedefs
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

Fair point. The robot only reported the build failure I caused in v3.
I guess I was just trying to share the credit (or blame) with the bot.

I've removed the tag in v5.

Thanks,
Karthikey
