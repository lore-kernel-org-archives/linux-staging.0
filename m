Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F46F387379
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 06:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770187847; cv=none; b=SMpsUi8KrJwb8/Vj+SwrE3expY3YZNgtTDEC/2QQC1zQXPR4N7NYKhw57p5H609VRsrVtHjsEK3oD7bwLZvRewKlDV9Bd+CD1IssoOft1+sHaPWVZQVwWjQ0i5dAMPx9wz0BoftQ4z0ZYNlPftRxP/uinUE0dPxUJlSg1d5d8MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770187847; c=relaxed/simple;
	bh=xituSWbsEZ4BZweKSQvvFmEBU4zfBKmTq3kEYnOPHE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gncii5OpPOAcNqIv2UVs21gV4NYBUXCcwIJtgErXs5ijGO6BHtb0A07bIfgTDJNsIIy4lyJBRlF3/7ztJk6Och7cQL51yXEoJxLQkNklyXm7kOAfT7C0rG7+QZFdOVFGmt4/XqqhESLUE/xT9wyfxUmFh5SAAYIpFp+b15JXrbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hseLZlHW; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hseLZlHW"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1233b953bebso2155069c88.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Feb 2026 22:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770187846; x=1770792646; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CNOk3gWmx5xUW3I0EzgX1jSF7wnHgmCaeb7qz++DoEA=;
        b=hseLZlHWytX3Zt2dYyXikvG5WuMPnh1PT4oxL+DJ7ENZZqK9cHoE2PJFhbElQkV7eB
         SCtdMlv9QhcYQ7OYy93f/T4mLuG9yYbs5wjcnuIfwZWRcRBobnF1ivTSsp3kCJiM6OT3
         Qw/hO+XUrD+2VOU8arxdgeKo4KkP+mAb3B17yBU5GzJlpU6uF4RMrALPCOCLMmZB8CH5
         hTQqdkJVQzsCp8SzncXfygIQVEZGarwIEpZF2IZ3flOmULd7A+WUPtRd7nMY85T6Lh+m
         5Z3hRd34ZdeLXKIy8sjG0ZuKApjceHt5QJEii/iYav9cY+MnVdycxDw/Ezh/Qct1aAyL
         ARaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770187846; x=1770792646;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CNOk3gWmx5xUW3I0EzgX1jSF7wnHgmCaeb7qz++DoEA=;
        b=vxNaKMdJ9tGvL/EXPCK1QW+96xevB+vADSkW8NaMAW9tOwtgS5mjfbBeiZ0DzXXWFa
         LIbXp44rmA9CvOWNbVEZLs8hD/gABBsNq1MWfWw6BY6O1xBGoJrlnl3zx4ZEEe93Jq4C
         Lfulk+7DxPkVUqCoPviRSAZQ4ERb+C4DwtgfLielcwRtf26t0ABHN7+geHA5pYzAiOg+
         JgZOSaTKCOjAtvLJEkBzpS7nwaoKsNS7QBG4FnmcDb1InhiWP4zYwedUvNGEnPgd3g8u
         p2wYlz7aY8VPIaLKy88heC+s1L9e9ZUVI6+qZL/K2xVshVh8AZ7SB1BN+b165zMDPAZO
         OHtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLF2AvplFMkvNyr3+uMm3weqZfqopOLF/NezAgbwJyCvp1qQbEyiAijtlCJ/nXqI4en+xPzxrNA/EHCLaQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+USMI00R6pm9ZbE1rgJkRkPPKE8SdBI6PXz8GqKRoJQUypTSg
	qqHFfTsSpaJCmqZtiJQDXJveDsrCooTpn9I+1kq23O0Hyu+F3Qx+1ihy
X-Gm-Gg: AZuq6aIGiMebPZ6JOT1yFlrhu9gJbtN/6OOtt1TZvvcF+/MF5Q+zV4lGI25BXvoYBaz
	4nLd1x9m6nvw6pOl5IBGmt2HdPRLwKXpaa23fTA071F4BFxexr8v9LB7SvR2yokZurM8IdNguH7
	EgG3Om+yfzQf1b9ogbrV4K7q7fCv9UVt+4rU59p3Hkz8IOP4XkPaqIr5kOk3achSLtg315STJf/
	qK+d5vbaEdukWqJVtZmZRN+HUXZyfJ94kvY9eVfvyWtEGz61DJA8CNCCbqDNCmNHKNA1ds752nV
	CdH72gVG7lMojKWrkHy3ov8ArBX+lL1751ny96RtLjbKYKl3pkDQaEhymseo79cBxgDvUPcD+Jh
	f1X56Y4w0LJKCzFA/sPvVD0Xg3+11TuIA6SEqOjgMwLDCrRfvP/AfoMTHgIHqGcQZYPgKIoZgSN
	1sdijm10e5yJjmqQvUnWwZ9pAJDQ==
X-Received: by 2002:a05:7022:61b:b0:119:e56b:c745 with SMTP id a92af1059eb24-126f4770fc5mr967588c88.10.1770187845996;
        Tue, 03 Feb 2026 22:50:45 -0800 (PST)
Received: from [192.168.0.61] ([76.174.137.141])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-126f4e111efsm1223877c88.8.2026.02.03.22.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 22:50:45 -0800 (PST)
Message-ID: <2f6c6070-96d5-4fe7-a237-f3278e372036@gmail.com>
Date: Tue, 3 Feb 2026 22:50:44 -0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] staging: iio: adt7316: convert magic numbers to BIT()
 and GENMASK()
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Lechner <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260130-adt7316-correct-macros-v1-0-8a71df1e42f1@gmail.com>
 <20260130-adt7316-correct-macros-v1-2-8a71df1e42f1@gmail.com>
 <20260131162140.5abb833b@jic23-huawei>
Content-Language: en-US
From: Michael Harris <michaelharriscode@gmail.com>
In-Reply-To: <20260131162140.5abb833b@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/31/26 8:21 AM, Jonathan Cameron wrote:
> I've asked for a couple of different types of change in here. It is likely
> that some of them should be in separate patches.
> 
> Thanks,
> 
> Jonathan
Thank you for the detailed review. I am working on a v2 series to
address your feedback and will send it when ready.

Thanks,
Michael
