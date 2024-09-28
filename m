Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941904A08
	for <linux-staging@lists.linux.dev>; Sat, 28 Sep 2024 06:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727505716; cv=none; b=dVN0HDWWOYMKcQJhQp7D72RR0uLzRSlI+uD2bNnc/7GrMyOPtRFc/srruyxBLHuaieU3pKz/lNF4t3PbDq59uEt5vMfKOB5Ov/WwlMX1ZNcs00e2VLyZUqpX0vz35/1S9H9rRS24CiC1fhMuFVAltvO9pCaSz8jyv9vA67URXfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727505716; c=relaxed/simple;
	bh=hohxMTxQethsIWRoiB14dLQnbLIuOcR2yQ5yh+PcjpI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=IN8AtXqQxwT63TA/FMiDvZKHOQV9midB2lCRhIlFo1Li6CH+JmN2BOJYA4Z7Ro2A+qhUdZ71Gad4HQ04b/Bb9jveaq0yC0s17vFF28cMkqZjniSWHHMwI+1s/c4DOoCFPKkEM1/fVr3f9xtPpsngkEKaLBBFND98pKcgR9oqlsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EClg8Anf; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EClg8Anf"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8d6ac24a3bso511261166b.1
        for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 23:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727505713; x=1728110513; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uH7S6Xq2sV29pgWZbyWfpT8hYgZEypeg62JQ0Swnw+E=;
        b=EClg8AnfOH0xZzIzSbX1J8j0MkZscvxsBanFplB2F8WJfZUC09s9qmALotEEv0z9Kx
         gsb3QNPQ8tg7ZAw2ZmudVUVyEmvHlUy+9kKGYG2lWkCuk7jZFaLcvM490aGaaBDpoOEl
         RyYlXShz5ZgEPb1rWFhM6eKCScxcOg7g31v/iPniSO9AJ6cQSN71kAF8dPzKXIhul+yi
         5NK4kOoxr8mnHFXakDhGIIybD9fAg0DuhXmIdIZq6XckVVavZbZpe17ndcPMp/54tuO0
         i+5AVU44Rv+ntXhQr4I5eMxGzr6wUmLLjOezSucVctOf+3ZgOuCu7ld5rgOPIwXE6y7K
         AtSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727505713; x=1728110513;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uH7S6Xq2sV29pgWZbyWfpT8hYgZEypeg62JQ0Swnw+E=;
        b=S4ovgKbQxt55mKLvf13bcqvpU6fBgLJaMfykU2vwEAAVacgIBnj48xR4ZspCNIvfp0
         04J6rd3VWJjKX4caJQwjyDuuuDL/MtiB2WOY/2f37lKzCIpuU3JjKxE6/CmmjbFmAUvi
         JeG6ZD7kWHSkmna/V1aVT9g/kKnW3ycD5dHuVm45eUxGOKvrn6SBcaz37LHfxLPA4MU8
         V7kmJ5jo0UPQiPVDqjwBgUFREtvNgNnRY8hpiVuHGaZWRyT0o8qHzESctJ2SdDFsCXpo
         b9kKbcnlydazargmzJLudDImucufVAqto+l0bwQrXvkR/xo+EsvjU10QgYN8C9JzUH8t
         TK+g==
X-Forwarded-Encrypted: i=1; AJvYcCXU/4W/X+vZhNFWwIXAKtkqQbzkCc3I7eRsJ5QpMHhx1l9MkizvJRjL2pXH14ovgYA5oj2r/t2Vzav29+BV@lists.linux.dev
X-Gm-Message-State: AOJu0Yxn7rp7jpJQy5EKAZ9Lvedu/QV5MkjnMvBPzIH1kEwZGmGZyQX6
	AHy2NZYeKTZkRdZ2vtn/4M3V6oiDqgbHh2WTUgKnDvApbkphx14m
X-Google-Smtp-Source: AGHT+IGSkht1tn1jLB/bKu9698R5E8LZ6ZFAYrtcsOOHtTHhh8tTP/LMcVxcQugV8y8x/7R0Mn2r/w==
X-Received: by 2002:a17:907:1ca7:b0:a8d:3ee9:12fd with SMTP id a640c23a62f3a-a93b12d43f1mr1030948966b.0.1727505712619;
        Fri, 27 Sep 2024 23:41:52 -0700 (PDT)
Received: from [192.168.2.105] (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2979e00sm214526466b.158.2024.09.27.23.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Sep 2024 23:41:52 -0700 (PDT)
Message-ID: <50020db0-3bad-41f5-8da3-c66bc0a90fe6@gmail.com>
Date: Sat, 28 Sep 2024 08:41:51 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [RFC] staging: gdm724x: Proposal to delete drivers gdmtty and gdmulte
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Jonathan Kim <jonathankim@gctsemi.com>, Dean ahn <deanahn@gctsemi.com>,
 Won Kang <wonkang@gctsemi.com>, support@gctsemi.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 Nathan Chancellor <nathan@kernel.org>,
 Larry Finger <Larry.Finger@lwfinger.net>
References: <f82fffbf-a983-4ab4-897b-b5a810426f04@gmail.com>
 <igi27iwrzg3ovgj3sym4gsi45timpkt4vkl5ss5dbftdzat6p4@ctxcjocvunpt>
 <78b521eb-4e89-4c01-8dfc-1fb990e6887d@gmail.com>
Content-Language: en-US
In-Reply-To: <78b521eb-4e89-4c01-8dfc-1fb990e6887d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Sirs,

Won Kang from gct contributed the driver gdm724x to the Linux kernel 
staging subsystem in 2013.

The following points let me propose to delete the driver:
- This driver generates maintenance workload (for example  CVE)
- The manufacturer is not interested and does not care as Emails or 
inquiries, to support or involved persons of gct, got unanswered.
- Did not find a possibility to buy the chips.
- Did not find minimal documentation on the web.
- Did not find a device where it is build in and the user is able to 
install any Linux. Therefore it is not possible to do any testing of the 
driver from the community.
- No blog entries about anyone using the gdmtty and gdmulte.
- No response about usage of this drivers to the Email from April 2024
https://lore.kernel.org/all/78b521eb-4e89-4c01-8dfc-1fb990e6887d@gmail.com/

Thanks for any response about your thoughts.

Bye Philipp
