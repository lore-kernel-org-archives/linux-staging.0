Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994CF4315F;
	Tue, 13 May 2025 04:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747109611; cv=none; b=PshIRxF1EBOIrisVE8B7wBIOj4Q6YUvpJUdtFQqh9Zq6GnOZcAqrZus0A3E9fTeTfAxT/m/HGxu2hncAMYmH5IdkWo4VX2+cwb028CaKbx2OtApEq+ErlvePSVW5pMgQJ0wNlg410pQAhHVxeJ/QAp6dQByJECwMumArrk8jx20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747109611; c=relaxed/simple;
	bh=KHjKIBGHL4wjWHdIdm73DojxepCxwvz5ASk6vdDbV9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kswxfXBh9tS9YenTd6MkN8Q/BTWrj3IQ04mtddJPBxZ634AltZlMwsYkxEJNUZTTUavT9xA70QbWgvJH0A3HlX/F+D4EGGZac+a07tJlMFySlsSdQPSPokbS+dnfhtQsJFKa7qH6SIvYCJ9bwm4NCXdo7XL/cC2JvzxDElg8sbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J+yhXxjJ; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J+yhXxjJ"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b170c99aa49so3471605a12.1;
        Mon, 12 May 2025 21:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747109608; x=1747714408; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KHjKIBGHL4wjWHdIdm73DojxepCxwvz5ASk6vdDbV9Y=;
        b=J+yhXxjJeqT3FimwA4teQTSa6x9gMFANh0tzOF629ooFwTlqrvaQq8SMdZPs6fviTG
         znKjUKFo2E2/8KRfgxggWWnPbp0bhzPRpDNDGc7FTwlCrJN3XiSGiom4WIZ1xHimgEaq
         iCwlI0VY2VMFy+i2iPOE1ooffHU42JlTkDNGBii6/rPN3XLEacui+l6MGE2gny0OLTft
         hYwRJEMHoCzi9NEMjGgBP8kTQcNQBNMeWRxke0/Jq6DtGlKpn2BSxT4SxHn7v1yVZPGR
         fSfJIsEfTDQSvkFOHzCXs9hi3ejTqumEUVj05JI5CPaBmBwgf3xjtIJcG+CxNJy9n9L2
         OU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747109608; x=1747714408;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KHjKIBGHL4wjWHdIdm73DojxepCxwvz5ASk6vdDbV9Y=;
        b=s6eVpMSQ9cJLPaxjpvBbg6fL9MC5fRFJmzxg/n0jayv5jNAoOLfngT0P7MoQ8dlAN+
         4Z8/ivhLwGOUQuqFhU02lyn6lDKuJf86/UaqFGFyLnnjOhCjDGgqayXE2HvUh4YQHrHD
         Kym3GXjI0SmrVltIY/6yDsxUzLh3VqMo2bEGhRqwTFlrtJtGoRhfhwjsM/aVHCBUc2RS
         S+gHTmmHEnGaxMycVAWEaw9Yz30/fkM7ZZ1jXpz3AtqRkgZfyfIwWXa031hVR0XOOM+R
         ETXtQJdejD22qD+POpFr+Du97EbTWnqDA3YLtm6VkJC74fVO19LoORmbZO/kz0pI0AL1
         3U1A==
X-Forwarded-Encrypted: i=1; AJvYcCUhN8ValKL+TvaSX6hYTs0BSXj8M50HzULT52A4z3YSCj/5TSYKGkHpbtnuDawbudUBZlZG8vnOzyE9KP90hg==@lists.linux.dev, AJvYcCUjT5lHQ6mbhYr/7RJWVP0udLUnJjYlYIgrvh1mgHJZBNzR7EDYaCIoarQwNfFo3YcGLnkYVw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwT5fjVCkgbxWl1OEoTE7vs04Wb/EVQ87ZyZXn6sSz8Fa2JGVQ7
	A1imesJpHWFCWl6ODjD+UGJGkiu1OEddIGfJIr2T97BWmFvd2hM/
X-Gm-Gg: ASbGncv+8jrvCSgVuXqkGAsefqybPdgf26bFcInQrKXp2kLkSCQENNGoaq10hbSylNa
	IjFKeK+hFur//AdMfjXbSipxp28dumZO3ZnQ09VqCThumn/MNvHcYMHmhqF8C2rr3sTgdnA8XEW
	4UCKjAIafTos+ZyZBGBIJGbeFVtBTMOBmK7hR6r7Fu5a6oBvaL6Go7XbUhPJqJjr+a80Hlt1Ga/
	iL5X6R+MWOYzErOLk/MvAeRRf0Ib4Q2oVmfOfs2gkEfxTm0Tj8QIsaH3U6g+w963icG8KIdMaI+
	dl9slmlfnTv9TLNS7USELOSq9+QqeUR8y83FSf1C7ZWqCVxDX5G+3E16wc/oRLYjqBrKrP4zTOP
	+pB6J8Zs7iw==
X-Google-Smtp-Source: AGHT+IF//IySUWtF5x77D5Y817BbS9vkvkGU6if72KKsO3a3004HV8sEsb3ehsXq7IQ9p9jDXcxGeQ==
X-Received: by 2002:a17:902:ce92:b0:223:47d9:1964 with SMTP id d9443c01a7336-22fc918e49bmr261778865ad.34.1747109608308;
        Mon, 12 May 2025 21:13:28 -0700 (PDT)
Received: from [192.168.0.123] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7549112sm71143995ad.38.2025.05.12.21.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 21:13:27 -0700 (PDT)
Message-ID: <63eb2228-dcec-40a6-ba02-b4f3a6e13809@gmail.com>
Date: Tue, 13 May 2025 12:13:23 +0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Subject: [RFC PATCH v2 0/8] staging: apfs: init APFS filesystem
 support
To: =?UTF-8?Q?Ernesto_A=2E_Fern=C3=A1ndez?=
 <ernesto.mnd.fernandez@gmail.com>, Yangtao Li <frank.li@vivo.com>
Cc: ethan@ethancedwards.com, asahi@lists.linux.dev, brauner@kernel.org,
 dan.carpenter@linaro.org, ernesto@corellium.com, gargaditya08@live.com,
 gregkh@linuxfoundation.org, jack@suse.cz, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 sven@svenpeter.dev, tytso@mit.edu, viro@zeniv.linux.org.uk,
 willy@infradead.org, slava@dubeyko.com, glaubitz@physik.fu-berlin.de
References: <20250319-apfs-v2-0-475de2e25782@ethancedwards.com>
 <20250512101122.569476-1-frank.li@vivo.com> <20250512234024.GA19326@eaf>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250512234024.GA19326@eaf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Ernesto A. Fernández 於 2025/5/13 清晨7:40 寫道:
> Hi Yangtao,
>
> On Mon, May 12, 2025 at 04:11:22AM -0600, Yangtao Li wrote:
>> I'm interested in bringing apfs upstream to the community, and perhaps
>> slava and adrian too.
> Do you have any particular use case in mind here? I don't mind putting in
> the work to get the driver upstream, but I don't want to be fighting people
> to convince them that it's needed. I'm not even sure about it myself.

These are the use cases I can think of:


1. When running Linux on Apple Silicon Mac, accessing the xART APFS volume is required for enabling some SEP
functionalities.

2. When running Linux on iPhone, iPad, iPod touch, Apple TV (currently there are Apple A7-A11 SoC support in
upstream), resizing the main APFS volume is not feasible especially on A11 due to shenanigans with the encrypted
data volume. So the safe ish way to store a file system on the disk becomes a using linux-apfs-rw on a (possibly
fixed size) volume that only has one file and that file is used as a loopback device.

(do note that the main storage do not currently work upstream and I only have storage working on A11 downstream)

3. Obviously, accessing Mac files from Linux too, not sure how big of a use case that is but apparently it is
big enough for hfsplus to continue receive patches here and there.
>
> Ernesto
>
Nick Chan
