Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0254E284B37
	for <linux-staging@lists.linux.dev>; Sat,  8 Nov 2025 05:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762581109; cv=none; b=G4ILZFIIk9fVog5WZltv47cTuyBiiunx+00aIqz3jODMg+YZ1CLdmFy6ZEAQXlBlO/0femqbTkQuZ5xCpE95o2gMVH+GalDZEdSzkx5ch1uYHK8jZZi5T6d/3+QF9w5az0U6WTpLFaNd/HjWo0PYyEL55Jw4dWEeJCkGgNiSCAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762581109; c=relaxed/simple;
	bh=XVJel/GC65JasbnZWN+s1dEMdQaYBj8pYLjdWWABm8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jQ2iu1AOegL3m1lVDWbRlb+53N5TzanCQ6cuBP9bX1LdjIvQOuwVccGHw8awDkhKmI1PvG9oRIm35NUT+PV94BSlcT1zyzK/3X0dIUySAhm1hpsIiD7Y6BeWYNKmclL6ZUqyoLB0TO7C41TE7sfqAjW9mM8N4Qdi7m3TFVB5tH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HLlEEkHQ; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HLlEEkHQ"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-640ca678745so2706539a12.2
        for <linux-staging@lists.linux.dev>; Fri, 07 Nov 2025 21:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762581106; x=1763185906; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XVJel/GC65JasbnZWN+s1dEMdQaYBj8pYLjdWWABm8c=;
        b=HLlEEkHQEJbjeh2jSeuj6hJG/DlVVoHr8lM8O3AJamAqbRMIYsj2F4W0r8q8MWWBN7
         S3yM0p/agezKR3gkPSW/bswMjVJ81NHOEdfXr3+Cy57no4nq4tJT1MehtaqbyrMkAJyh
         7nYU98SaAouRzbupzkvzHwHXT0cfTOyZS+dzhetx1xb+7dGkcA4D062iE8CB9mXWLr8Q
         hf/fz0rnqPwA+thkor7JfD+cDHRDHJdzjjSQ8qrrejPa3r1FBeIWC+2HfZKqMSUz2ZWb
         iiluOel9TwdM+6Mti1EXD3TZohABapxVRcwRLgOVU/PRgF090WI6OQIpzLt1wj1B+IkD
         DN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762581106; x=1763185906;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XVJel/GC65JasbnZWN+s1dEMdQaYBj8pYLjdWWABm8c=;
        b=A6dN+E444a07ozVMgQiPR2DJAxqe7fjp4/bIFsXaWUMDUEAS0bun2xdfpGy14R6px4
         kpTeeTDe1TS1oXrvDtpcJ4SbjxKIqwIfQXcDVPHR66qU1MUrFavsIy+/T5ioqpeHW3wP
         TdyGzukF0aSha3xX1Qy9nuFLnlylKapq/2lFTuMlZhRFbsoDbkx4PpLTVpjwX4VfTPcb
         Qgo8IpFqYPm7XPylU0kYdmzSX+9lKAprPwUJQ1oOlv2AREW9JBZS1E7TiQ5TI/x6E10B
         EHTkJU7El9grY7Ii6J55Gc+nyJVuYhnozJgFya9KhnIk+wbvoFrdCpPm1I8wpUAIDIR1
         09LA==
X-Forwarded-Encrypted: i=1; AJvYcCVabXJXXNeSXS4JzfuTSeEoiCzvYnOkIFFBD85FIlCAdeQnj2cLYC8n9UxVu6OVHDiNv4hCZn2wV7x19lNE@lists.linux.dev
X-Gm-Message-State: AOJu0YxEK/hqEedulF0/ODHEsks0nFuO+82/DZoXahtr81l1HAZV8Jza
	uW+Gzcw5pi5wH92S7UlelcKUw1yXBdwxDfLWgKrHxLIQkPpTol7Kuxvm
X-Gm-Gg: ASbGnctdDmGrcqfJNV+cW7SID1pRuwn85H4Y9HRZSTq7WkE3Wo4PMSheBqB4F8Drl+K
	vISGSDUreK4uJEEYnEbXPBLD0RjQqYLlDOA49nZ7F5sw0BnsddI1apuLgyNz6dqAwyoKY9czBM0
	EnSOa5BuRCJ2+MNKjxk7xy4JO8AP0fM8VPszUEIMmv0W7df0RBrP9qWoUGjvyf71untcbthsATs
	q8ZKaSlMWo0zLqGHTHtqOlrlLzMTN3rdPqExUf0V5TA6TjLU56nNoyF4NHSBRDeJ6IlpOwASunZ
	T7nmaBya8Qps/n+CrZHAjkvd9edA8AwuQQ8/vUH4EN1fmh3ADdhjWxq7Ke8uXXjkqbTMJveIPsp
	/0MlCT4y8KE0NWOnfWCwJYKS+wtQrI7AEP4mBKyjQR2sbeLHD+Aq3Qsq1AkCCxNs71sY22tp9QK
	/wADoVP34n
X-Google-Smtp-Source: AGHT+IH0Ma11e2l4b67D8Lr8TSDtfmbxdRsj2ctAmcUFYCbTXdZai9gzxybp4oIqw5DFwNoACkqzyw==
X-Received: by 2002:a17:907:7e8c:b0:b72:58b6:b276 with SMTP id a640c23a62f3a-b72e061a90cmr161041366b.54.1762581106194;
        Fri, 07 Nov 2025 21:51:46 -0800 (PST)
Received: from [192.168.0.101] ([95.90.185.18])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bdbca75bsm443256166b.14.2025.11.07.21.51.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 21:51:45 -0800 (PST)
Message-ID: <f367735d-e480-4eb1-a2a9-c6d311661fdd@gmail.com>
Date: Sat, 8 Nov 2025 06:51:45 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] staging: rtl8723bs: Rename camel case enumeration
To: Bryant Boatright <bryant.boatright@proton.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <cover.1762576396.git.bryant.boatright@proton.me>
 <38533b30dbcb39f370fd778ee2a6838ca7b962a1.1762576396.git.bryant.boatright@proton.me>
Content-Language: en-US
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <38533b30dbcb39f370fd778ee2a6838ca7b962a1.1762576396.git.bryant.boatright@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryant,

Am 08.11.25 um 05:54 schrieb Bryant Boatright:
> -enum ParseRes { ParseOK = 0, ParseUnknown = 1, ParseFailed = -1 };
> +enum parse_res { parse_ok = 0, parse_unknown = 1, parse_failed = -1 };

The constants in enums are usually named all upper case.
PARSE_OK, PARSE_UNKNOWN, PARSE_FAILED

Best regards,
Michael
