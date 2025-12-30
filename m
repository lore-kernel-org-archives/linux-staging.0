Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C623419E819
	for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 17:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767117578; cv=none; b=m91jo4+M+irsONy2vzYkzZT5A8qnbWKllXgrTWLbA8rGX7+MN8x5tif40ruNAdIGl+25ZGZK5UJYB3xn3XeXpUht46Hn+n5AdiK7EMTj468W1Ge/OyYgaSL0WIDKeqyDR+W4J3xJelvnMNscAh9DB3HkvG2MnY6ya9IBiNCde7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767117578; c=relaxed/simple;
	bh=Svf6CW8WgH/scy3ZDCbvYCOLQqor3XFA6TUVq8BoF9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sUifnKRE1GOYqKMOJacQQETLv7rjoLaltu7OqSTQYuvrpZlumwbM3D7n+P3GuREbqhKvl69V4q5frc/jA69699yFHLDBD24I+X4HouMEIgFRKVv5SvH+IGSJTLJV7TaNt3LdPTyhS1ugTPm8b+sq9Zv03BvTQaCe5WKEx7DJyTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHFNeYmg; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHFNeYmg"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a0eaf55d58so64465485ad.1
        for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 09:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767117576; x=1767722376; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/CHIgKSfibsVDyynvS5htdSQz4K+hlBg8dyDuvjuAZc=;
        b=BHFNeYmgZRrdDRX/ZxvgHYsWnaO32t0FeN4Yw3SSXGW3kAhX1dJnhGJZOiCytgeI4O
         OSksoTs3FuXm4sKUFTiwP7H+tsoOg6xUuQtK3voEMEYg8maFd3JE8TkIMo8exYTNh1TZ
         LZ0QvYNFcK9eJ37QPvMxIjNQM99b7ao73uyjpTx2RptB/O038o2l0b8FBGDt93krlJC3
         9KouapxWCqLjW0Xd2F008mXJMT6zelnCHB7vZDv314QWohCZCZPa89HvwSuSGFERSStE
         aNiM//bid65niKy4D4yOGXh5rG37A8GvCHXT8F7xtGbHLABjA8DVMnMEpzhvDTLbx7k+
         mJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767117576; x=1767722376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/CHIgKSfibsVDyynvS5htdSQz4K+hlBg8dyDuvjuAZc=;
        b=e638uPehtbfbmBbkCzr2oxjAin+OsiIGpq4pxFmhOG7yIFd6PKc/eq5u8eSzZvh4DP
         VrX6krEv/m1eaggfYEDDbbTXHnaHkt3o5z1NirQzzdtIDGqjD7V3ASlJMeOyXttCIcAi
         NRJE5dpyPzLnDE800WQBYcg/czaESIQknTT4bz8+R19U7WOdARfZSvB59K2b50FqgQTz
         Bz1Q2RmudSVOlepwNEiONxqW6T+85xRcxz3XU1aQ9f2zwEQGOQeCR+DWQfrKgn69RRoB
         zoo6NcaKhAbpkyzZNYD2G40e7Zv1uKc8lJE5yklktLiBe4gytfKHmGrda/4Dy6Zxcaeu
         clOw==
X-Forwarded-Encrypted: i=1; AJvYcCVnS+HP8NqvTUjBBJqwbDqQqlUJi+JaKLr+eQxzEH5MztkUef6YhmPolUp5OpY7FH4zuSQ+0LlKpwkw+nyr@lists.linux.dev
X-Gm-Message-State: AOJu0YzNMmz1+6lRZ3a8H+5Uu28bfwQGUNrojH++bz5hAe00jQXsQj05
	C2TfGZbRArUZBlNhCI8FEB6DtTk/X/4JopKM5q/JS9wnR1fA3bsszbxcLMx82Jes
X-Gm-Gg: AY/fxX4qDb3oAqIq8wbhu0E36Ug37sr9WQC17SeQGHEGiZMpagjQ/3OUz5bYD8WaZme
	78yDFATgt0rRa5izcgpd4ZzJI4gqzcns+tgZ44fXTIi+s1ajLgc/CoS9F3lcl5U5vZxDgfDq0TN
	qjhkoeDgTITh7T3HQst6q6XyqMHiZgejmyGSGx1DUBuyi9eQQQmjiUKhwgNZ4kmICXjAOSve+yJ
	yADTtZb3Gv1s/MTwLpAGsNkf63jozDtDAcegM4FG4SjqBKPb1ZiiITsYv6z7AqNGZkRWQ8WztK/
	/fqCr6/Q+JF/pjY8ulXpiFC7yajqr8pSDvfYFiMFqPZBwGhClopO0ww/5X3ngV7Ri56FXgksmgH
	11/3NaU+7H9jyTCNUX3zMoLX8mjEe9zb1dNtDhtyoqx9KE5Ay1WV0ys3mkgwqdRiW+1gOnuuPFs
	4ImXlgA+vfNpTwxHuFeDttrEVkfvEPLn+6XhBt7sp+0GKQRdewn+8hzMDTUwq2
X-Google-Smtp-Source: AGHT+IHFngs68Viy0QIud4OyKUMML0W7Abh6BiK0CuBqkEfCHrIFWmwGVVieu+bTWVJ/P4u+tamC4Q==
X-Received: by 2002:a17:903:4b30:b0:2a0:de67:9704 with SMTP id d9443c01a7336-2a2f0d2daa8mr301443375ad.19.1767117576143;
        Tue, 30 Dec 2025 09:59:36 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:d742:b62c:dcc9:47cd? ([2601:1c0:5780:9200:d742:b62c:dcc9:47cd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb48sm308258165ad.64.2025.12.30.09.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 09:59:35 -0800 (PST)
Message-ID: <7ded1cc9-71bb-4ad3-8804-477b4317a6b3@gmail.com>
Date: Tue, 30 Dec 2025 09:59:35 -0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] fbdev: Make CONFIG_FB_DEVICE optional for drivers
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, andy@kernel.org,
 deller@gmx.de, gregkh@linuxfoundation.org
References: <20251230052827.4676-1-chintanlike@gmail.com>
 <aVO4pslXIvnc00J3@smile.fi.intel.com>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <aVO4pslXIvnc00J3@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 12/30/25 03:33, Andy Shevchenko wrote:
> On Mon, Dec 29, 2025 at 09:28:18PM -0800, Chintan Patel wrote:
>> This series makes CONFIG_FB_DEVICE optional for fbdev drivers that use
>> it only for sysfs interfaces, addressing Thomas Zimmermann’s TODO to
>> remove hard FB_DEVICE dependencies.
>>
>> The series introduces a small helper, dev_of_fbinfo(), which returns
>> NULL when CONFIG_FB_DEVICE=n. This allows sysfs code paths to be skipped
>> via runtime checks, avoids #ifdef CONFIG_FB_DEVICE clutter, and keeps
>> full compile-time syntax checking.
> 
>> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
>> ---
>> Changes in v3:
>> - Use PTR_IF() to conditionally include overlay_sysfs_group in
>>    overlay_sysfs_groups
>> - Decouple variable definition and assignment in fbtft_sysfs_init/exit
> 
> Any particular reasons you ignored my tag from v2?
> 
Ah.. This is typo. I see what happened now. Looks like my script picked 
wrong or old patches instead of new updated one. Should I send v4 or v4 
is fine?
