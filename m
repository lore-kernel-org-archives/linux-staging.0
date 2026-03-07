Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377C337186B
	for <linux-staging@lists.linux.dev>; Sat,  7 Mar 2026 18:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772907902; cv=none; b=cHqsZwX6/ghGsTdh82H7UJWsc3cC4kdKdKRf2SAULr7ixm/6BG+n9KS9QQbvnc5OyYHO8ygyBHiI70UfDn4rAjKFIGwZamPV9MlgJF4y51gCUIDSXvTrvWCO+rVOFIaRpxvxcxYVyPEsv5YlEEo+CiVl1qLnhewWJDkActoBiPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772907902; c=relaxed/simple;
	bh=h9uJf9PUNi2XPc6EbfAn6h7sJZIyikdlxOc3vZV3YB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TPOue2g2wjlH9eQrbOGNfx6rcfVnuHXaRrgUsSbaSTRH58+yoOR1xtPudj2LSh4DI7it+SDprksFYDyU/QAqhMJlX5L4QwqHM0PBUc+XcPSmwQ6wSk+j5TbpaSiWcpcvcwsj8L2RuLeL3yNqgjDY4e3zQgetPKiOBULBo/iySWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=W2nGzHtz; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="W2nGzHtz"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7d596ab0917so6437588a34.1
        for <linux-staging@lists.linux.dev>; Sat, 07 Mar 2026 10:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772907900; x=1773512700; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OdDS4EOWbwiasyyUq3N0HNoSimz3zaLn9xgLsbM1jRU=;
        b=W2nGzHtzhIXpW+oYM9MHslzKwnm0Lvsl/4ymc38wJ1dWkzDRoF3EqrbhM4aBJ449RO
         q+BdBxw9w+cNzk4ODhr1iQ+p9sYdoaG8nbJe5ESBzrfsIFTzsFzG/9Jlxh8SnMGJol+M
         s46l7QDS5tf6ChmB7hOc6O8UHjPVWEfuz2I5Om29DyiSnPzGT5rAoVqpQoZv0TiDt53w
         FCncZXUdZnL0BD9IFaDuyRc9Rhsbo5rlAz2TZUVw8MoPXJs5k3vTFjLxxcPJ0aF82vpU
         IJRLCb0z8slE7NpcVxe41P1Fzn5bN+lsxGIjUIm+Lhn/DdDKcwUQkJizKv4x/ulyuFh5
         KUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772907900; x=1773512700;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OdDS4EOWbwiasyyUq3N0HNoSimz3zaLn9xgLsbM1jRU=;
        b=iz39o9GHdwVnVhRso8F5oNNaa+uKkpGJeXHcdZA0mI9AYJ9CjYzoSJG9g8DsYyc5X0
         vbTq3nmyXC7cuOqiX+t+OdUZNJ/6VVD5cJnPwno/qRiKg1E1J1Ogd3Lg1MNaYzEPKNj/
         nA3GMEErvGkPPfySBCMrbIUUoyvpiJn+v4YTGEACv6D6gVLZWJ/uzihX4oadGU8Ct7UM
         SAiKE79sWXhwyJbjnybgrRy6NiIqPi6RjwLsCIhaTq2aFtVcZrfUKftIgDq6RUXLyQfe
         RKuZW3T+xnzSHIk2A0TY8wKjZDjA6PFJPIvlK4M4dLTplO3eQoTDGkCuUGHJiHw+WzL4
         UOSA==
X-Forwarded-Encrypted: i=1; AJvYcCWYiOkgJQDAOz5Viq5teXfwg5PSVPkk79F5HF5EeODdjJc0mFIv6tYTgV//AZ30hbr5kI+i0QCsCVht/xmu@lists.linux.dev
X-Gm-Message-State: AOJu0YxHENIhMPzqt8DgpQcbk17rOYiITGGXq5e2tfSKoF5ykpKJpkd1
	n4lGlP+8ZpBQ3vVS8s0e2ykVsqyAYsP00EFouGzvdcIXeQce4Nw8JylcfoBwiXtuMTE=
X-Gm-Gg: ATEYQzzVVbkcBK6YUspW9UkBw+bmZzt5T5CpQF8coDZwnx2xvEHqcvY4ckg1ORZnlor
	2fFecMBzo+Xc+9qewzRhbJs4DpGmCFbRe5UsNcOy9ogIeMbiAPf4zXqQrq7TIYztNCBTD5vXjrW
	DrPjouImDlDTJnwKtIUNIfv2wSnG1Pu48pFsZ7MCo8mW9i3Z1lhTI3L8+DTlZd+DZXdese+GAnn
	FSMIntVphevoemWGSlhxMDA9pv3J95MW7Xlx5U/CHksQaFl/vx7RcSiPcVB45wIdE0goh2uV+0M
	rJN1lgaCaGeXrpJFD2jacZVdLFPOrIzY4V9EFnmTB2nKiFYyr/fMXieb5eTDvVsnhJclFGyY/xl
	CMXBn9+GW/vfsY+z+zkgr6cIVpC/m2gI4QBOjDIFyXSr3jY53sXv8yAMV6jP/ifjPTgzZDG4vm0
	S53gXoxg+LCQve5ctQjHFhLUVwwHHB5rhxwNnYXGr09C4ZrSnk4nB8SHi9UezJKt9k0XS3XqLKA
	A==
X-Received: by 2002:a05:6830:4d84:20b0:7d4:8c9d:dd2b with SMTP id 46e09a7af769-7d71cfff8ecmr3738680a34.0.1772907900193;
        Sat, 07 Mar 2026 10:25:00 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:cccf:5174:fa72:c520? ([2600:8803:e7e4:500:cccf:5174:fa72:c520])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d74062da77sm509741a34.18.2026.03.07.10.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Mar 2026 10:24:59 -0800 (PST)
Message-ID: <97043046-0cf7-4762-9a3e-67f1f47a2694@baylibre.com>
Date: Sat, 7 Mar 2026 12:24:59 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] staging: iio: ad9832: modernize ABI and remove dds.h
 dependency
To: Bhargav Joshi <rougueprince47@gmail.com>, lars@metafoo.de,
 Michael.Hennerich@analog.com, jic23@kernel.org
Cc: nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20260305210347.120446-1-rougueprince47@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260305210347.120446-1-rougueprince47@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/5/26 3:03 PM, Bhargav Joshi wrote:
> The AD9832 driver currently relies on legacy custom IIO macros defined
> in dds.h. This triggers checkpatch.pl warnings (NON_OCTAL_PERMISSIONS)
> and, more importantly, exposes a non-standard sysfs ABI (e.g.,
> frequency0, frequency1, phase0-3) directly to user space.
> 
> This patch removes the custom macros and migrates the driver to standard
> IIO API mechanisms:
> - Standard attributes (frequency, phase) now use info_mask_separate.
> - Non standard specific toggles (frequencysymbol, phasesymbol,
>   pincontrol) have been migrated to an ext_info array.
> - Remove dds.h header dependency.
> - Pointless frequency_scale and phase_scale attributes are dropped as
>   suggested by Jonathan in
>   https://lore.kernel.org/linux-iio/20251231180939.422e9e62@jic23-huawei/
> 
> NOTE: This patch introduces an intentional ABI changes. The non-standard
> attributes (out_altvoltage0_frequency0, etc.) have been removed. They
> are replaced by standard attributes (out_altvoltage0_frequency and
> out_altvoltage0_phase). Routing to correct register while writing is
> handled by checking currently active frequencysymbol or phasesymbol.
> 
> Testing: This patch has been strictly compile-tested. I do not have
> access to physical AD9832 hardware. I am submitting this as an RFC to
> see if these changes are acceptable, and to ask if someone with physical
> hardware could test thisg and provide a Tested-by tag.
> 
Since this is changing ABI, I think it would best if someone who actually
has the hardware and plans to use it should be making the changes to
make sure they actually work as intended.

