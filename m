Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4470A27979A
	for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 04:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768449904; cv=none; b=XYotd5yo8pMTh/l3olZ0lZvSm4Ob6vnYwLvUduy9F8firEv9ApdYdRm3e4Nh0ctIPgs4LzldwygfShStlzELRFsWXBcTi2ymOlSWFdZHHkLzFKf49VDcMsyEUTiBkeXGd3grHQUHpKrEwZYNLT2SZhEkB2rfkQADLqFnDi4Srk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768449904; c=relaxed/simple;
	bh=iaWwaYwF+Z56LvJlOQ3qTsiq6EK6HcVBvHQn6iq9Yjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=izg/ildRD6rUzSNTxk1nP0Gxeyj5z76IkdnJ0C0zU9AxHaQ7u/Iz7NeVqqP1okVwRZHkhklt2Q0NOISzTX/Kp9KRMMGlI6IeyGi+laMrF7I3bz7TmacHtEQTV15uCrj2EibIISC9drVKz8VlKplDa0XVn/AEs4lbO6nhtL3W7gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hBSVcvIV; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBSVcvIV"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a0d67f1877so3402405ad.2
        for <linux-staging@lists.linux.dev>; Wed, 14 Jan 2026 20:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768449902; x=1769054702; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UKefXX9KTkiQnQU4SrQGPHAT+zK2SvRI2HKryej3vYE=;
        b=hBSVcvIVP1zFrJj155L8q16N7lpTH8osIUc7zRO3BwCfzn/ovNnZ0XWZn0eV7+249M
         nbcyUaAd+xgh7gWcPgDSJSS9BcJNTEDwGxbuiTuTAFErMn1bcdjdcfbn7MaSiY8ICA6H
         Rl6qmpXHTOW+EKfphmnOJLc9zWkP7qAvYkVfrhiYTCpNi661ygE6KXVwp+4GLN0ftRlX
         J4a6Mfjx3BXxjDZHIxcsSrAzBwFOAKlSR2I+yGROVZj3YwypGKpiT8MeaW0F8f604rl8
         Ulo5fgJSsFObSgu9qyDZuWSpEbZzPZeZFUvyUHVFQvPZP/itkvjs8JYjacpMYcZl76qg
         60yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768449902; x=1769054702;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UKefXX9KTkiQnQU4SrQGPHAT+zK2SvRI2HKryej3vYE=;
        b=BglZG11Tb2k6p3bXHcgWsqTQgO0xnf4O+qctUfxYETN5C1qP7m6z2Kh4d5xYN23x8V
         T4u4Vqjv4e3a3vGbivdtN8ngNaj88eRoIK/vwA6YyiuP4FurfgSyxle0CiyMbwPE0ePh
         nn3/Ir7Eio9zAfJTjlzclopCzZqrnJv8ql/RHMhZXUnA7WGYJlkI0VDUtUBB6a/Mktkt
         2m93OpFh+LaVvYIAaQhlmK5pBF3lUjgwUU2nJi4bwhJ3BH02awhh99nxrk5YOjlNHNdJ
         k09UJZxgbhem9t6rp61CWDrMPOFlGyHK4oLC6yBHVeCb46QV6vONmgcmJeeVKihvG0yf
         491w==
X-Forwarded-Encrypted: i=1; AJvYcCWOtiDPQBHC+lrWqz0IrZpXwkxgvn/37d8FfkL6PTckzqZzEeYwAAlHBR4HCpEshV2eFSvrouxJgOuFea1m@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5SRoAiEkX1E8LC/APQO0qfmau18TTCx9W180Iek+wqlZIYMtM
	CoB2xRuGo6UoHYvH74I2xQwsSsmbOmtA7oW5bXvwXQP4mzu98UXPVpJQ
X-Gm-Gg: AY/fxX60MRwbCKSYe4D0zbwmMjxnwmiPWbGOcWf1DWZQZw76d78ZGfb1gNDHhkG/XaH
	zVfqZS68ccJ7UqpFQxcYucofi3Nc57QJXukvWOVK52PdpYmgbBIrY1o+TTGGEjqf4WPCccUwFRP
	yqpZcpqEJxb7qo7uNaN5FTAtlU3A6HrNQfTFpQ3j6/+99ra7Bg3XjxzIO5c5T8hnM2d1s8gwYhH
	Ao3DZWsDRPbj0hijvhwk9ZEq/h4nj2l0b1pkyzD5sbVE+opJzF5XT9LKXf7N0jfZdkAZ1HJZcht
	Su9MPO1GR+mTTAf2ic475d0O06RtseELjw2vte8FlVN6PhmtlAHs81FjrgLKH5jBOzzVCUcCyzf
	r4SY/DjQVYPYhyv6xXr96bw3V92BilR4c3XwXc4PnuqQj3hXyYegKp+LT0y2FhVfSzOoBAYH/+/
	zj+TNBHV3LFo9k2O3ak75E+pvvP5kjZqkEXz4RWL2rJlMcBN9s8WTC0d1wePPu
X-Received: by 2002:a17:902:da82:b0:298:55c8:eb8d with SMTP id d9443c01a7336-2a599e2411bmr51391755ad.35.1768449902516;
        Wed, 14 Jan 2026 20:05:02 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:e9f3:c6f4:5dd4:2565? ([2601:1c0:5780:9200:e9f3:c6f4:5dd4:2565])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2d79sm244924275ad.56.2026.01.14.20.05.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 20:05:01 -0800 (PST)
Message-ID: <ed199efe-f6b2-426e-b679-ef1f019e6433@gmail.com>
Date: Wed, 14 Jan 2026 20:05:01 -0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] staging: fbtft: Use fbdev logging helpers when
 FB_DEVICE is disabled
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, andy@kernel.org, deller@gmx.de,
 kernel test robot <lkp@intel.com>
References: <20260113045909.336931-1-chintanlike@gmail.com>
 <2026011341-chomp-protegee-6be5@gregkh>
 <a2d5cc20-5160-4294-bda1-3d5b645ec787@suse.de>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <a2d5cc20-5160-4294-bda1-3d5b645ec787@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1/14/26 03:38, Thomas Zimmermann wrote:
> Hi
> 
> Am 13.01.26 um 07:16 schrieb Greg KH:
>> On Mon, Jan 12, 2026 at 08:59:09PM -0800, Chintan Patel wrote:
>>> Replace direct accesses to info->dev with fb_dbg() and fb_info()
>>> helpers to avoid build failures when CONFIG_FB_DEVICE=n.
>> Why is there a fb_* specific logging helper?  dev_info() and dev_dbg()
>> should be used instead.
> 
> Fbdev is entirely inconsistent about its logging. There's dev_*(), 
> there's pr_*(), and even printk(). The problem with dev_*() logging is 
> that devices are not always available. The HW device can be NULL and 
> might not be all that useful in practice. The Fbdev software device is 
> often not even compiled in nowadays. (This patch is about that problem.) 
> Hence the next best option is to make fb_*() logging helpers that 
> address these problems. They are based on pr_*() and print the 
> framebuffer index, which should always be available after 
> register_framebuffer().
> 
>>

Thanks Andy and Thomas.

I’ll update the commit message to clearly describe the underlying issue.

I’ll also split the changes as suggested in 2 patches and send v7:
1) a patch focused purely on fixing the compilation issue by avoiding
    info->dev dereferences (using fb_dbg() where logging remains), and
2) a follow-up cleanup that removes or downgrades the framebuffer
    registration message to debug level.

I’ll rework the series accordingly and resend.

Thanks for the guidance.


