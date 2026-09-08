Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4365517BA8
	for <linux-staging@lists.linux.dev>; Tue,  8 Sep 2026 10:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788863713; cv=none; b=hFdF8Z5xj766jCmHfCgHJTT+pysiAfQor7hJDETlIdcbLT4kWqY49pRZrSb9l1JVGoNQzzS0kKfAleS0qCDopZC2y6wd6NRd34yoi7PQ9mYLLMRZuAUDIp43FTELrT2VAtAnco3uLDWJ58OpLDQ2MrDTX/ol5mxr/5g/SYhzk2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788863713; c=relaxed/simple;
	bh=7Cog2nkDO+lKZqVVRGnvxVjru8LcS09xNUgvu87wQA0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AyYX2z5bjV/OoQ/dpx7R4IDMV4E1EVNbrz8qFoUnKVMCYR/uBcylVN4dfaVdpQqU2u3nFye3qa/txAYqRCTp6fdPt99AhAkZfkzcTuWKIuUK+BHMuj2bqtFsjEJ5qYeehQ+9vjK0uKMWHfVpQR3zEhSYgczon7JFHvCv+ktYLvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sKp0z50+; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sKp0z50+"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso48331725e9.1
        for <linux-staging@lists.linux.dev>; Tue, 08 Sep 2026 03:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788863710; x=1789468510; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UPBRY5QywHVL60y+J3dACmXSkYJynfKQaq7TX1tS5GU=;
        b=sKp0z50+AdZUadLexMtYbCzSsF8a/Cw1YXNeaNQHlnFs97NogxS5zGkGNk5DgoMa+V
         0PgYoiBYxyEnZn2T3UVwtt4FfDfmUkjP7lLuwtJDABHgQykDQDXVtB6IdCGQ4y+6zdhR
         /0fceqt+Px4gtFQEOwlgjf/A4tKFgO1YTOqY1zE0hUyrmK5w6plBZS/uJSXCFMjkxNdf
         g/E1Mo19qtpJWNSCKl+2lHh2Oiwmla2uDOa9vxPIzTw6Njpvrzr3Sfx5XlBju7w8fJ0o
         atSNweUKeigxHNw2TSmGanK9UQ0gpyF6cQHTa6HjS+Ca2De+KCXgY290DbBp1v6Xr56I
         k+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788863710; x=1789468510;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPBRY5QywHVL60y+J3dACmXSkYJynfKQaq7TX1tS5GU=;
        b=O0rCbPUJvcU1aIw16gjcdDfEzn+nS9FNKk47hjhnMzyOw2Mm4GErNliw9B/Nidk+Pi
         YwFUUD+83WBAZQI6PtiHXkFXwrjxYMBNhXsdGaf2OoBR3cf/w+GrNOiHx+jUlIJTSRXU
         Sq7HwQkjU73QlF55JsCF14ZhZ/jA/uwXW3GSaNW01HVHVhoOdtYpI3KazpoQ5n+tTrSC
         eH+kQftbHSFBYroBUcraCtLwECT2gQtBD+El+G+YKFrseGINE/J/1t4P2eQrecbNlG0U
         ztR8Bsm73d47Wc/pk0xG/3Z9bPxovAuQaquiIyy4nu/oPV5sd3XBLl7dRCB7HKzXNIzm
         zGxw==
X-Forwarded-Encrypted: i=1; AKwUvBzqEuRs/uTQP67XAmnaAdyBCG6yu9HNUwDNFU44bmel2j1AaeB5qroBet/lA0V9UlTMmsoI0IHQ1jKAQKWk@lists.linux.dev
X-Gm-Message-State: AFuF++kE4pBlqBHgTz9ldj8dFmbYvj0L9/m67FIft33uEcFKF/4lxgip
	hw/FNYdr1OfbxVbROw+yNL/zXTpC58+DCTRm5kGu/8P8VONXjcyAxuTl
X-Gm-Gg: AYBFou078GVGGAWwn1wBfQFxrKqMJqF6KX4n/mYrG5kP/Z90Cg6bvFZ6J9kgXVFOEwp
	p3vuoHqJk7jNeOER1g0I72LKXjEd3xKu3ZDMxxPfFyFQ84KwVp39xDjwePbNzO9qCNvmwQBq5Qb
	q/pdSbXDHutwe25rtWgmCuEcZFlCk11Qi8ckGRFb1eacHqeincBKRkgYLyjNu6BU2xBU9yfSQ4C
	4mfe2EsCbBp/6/lPsc8QqqIN6LM4GDAa4+RxQN8+VkEs6wpvhWFchejqRsneT8o1ejGh1ujWlbj
	hYdmrwD0CD7tx84ads2Ctyq3Z4fId5XXQbaytaPwj6BtHAGpf8ppOxRGZ9mhiEv/xfvRsv5DtC6
	C5sNnF97cg5FfXYgt13qauwC0X6Fpa+4DsOTdLR9vc+d/hzvbJGQGtvnfAw58c4HWObtmhTuon6
	OS7yLMrgM3nqMJuGx/UXXV1puGT8aT/iKd1EeUiYYWd/3qPIOVzo9sLxCWAI2/pNgoLNnQR5tt
X-Received: by 2002:a05:600c:8b05:b0:499:be2d:c290 with SMTP id 5b1f17b1804b1-49cf824e751mr303216285e9.9.1788863709661;
        Tue, 08 Sep 2026 03:35:09 -0700 (PDT)
Received: from [172.31.2.29] ([188.24.0.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cffdb2c40sm236442825e9.1.2026.09.08.03.35.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 03:35:08 -0700 (PDT)
Message-ID: <eff6fe78-cc4b-4192-93ed-53a738fc3c3a@gmail.com>
Date: Tue, 8 Sep 2026 13:35:05 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Sakari Ailus <sakari.ailus@linux.intel.com>, dumitru.ceclan@analog.com
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-gpio@vger.kernel.org,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Martin Hecht <Martin.Hecht@avnet.eu>, Andrian Suciu
 <Adrian.Suciu@analog.com>, Cosmin Tanislav <demonsingur@gmail.com>,
 Vivekananda Dayananda <vivekana@amd.com>, Cory Keitz <ckeitz@amazon.com>
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <apqGlTiybdvQX3Ao@kekkonen.localdomain>
Content-Language: en-US
From: Ceclan Dumitru <mitrutzceclan@gmail.com>
In-Reply-To: <apqGlTiybdvQX3Ao@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/4/26 11:51 AM, Sakari Ailus wrote:
> Hi Dumitru,
> 
> On Mon, Aug 31, 2026 at 04:21:19PM +0300, Dumitru Ceclan via B4 Relay wrote:
>> This series adds new drivers for multiple Maxim GMSL2 and GMSL3 devices,
>> replacing the few GMSL2 drivers already in upstream, and introducing a
>> common framework that can be used to implement such GMSL chips, which
>> avoids code duplication while also adding support for previously
>> unsupported features.
>>
>> While the normally acceptable and polite way would be to extend the
>> current mainline drivers, the choice was made here to add a totally new
>> set of drivers. The current drivers support only a small subset of the
>> possible features, and only a few devices, so the end result after
>> extending them would in any case be essentially fully rewritten, new
>> drivers.
>>
>> This series depends on support for internal pads, for which a patch has
>> been added.
>>
>> The previous version is at:
>> v15: https://lore.kernel.org/r/20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com
>>
>> Since the previous series, Cosmin has left Analog Devices.
>> Because included changes from previous version are trivial, his sign-off
>> and tags were retained.
> 
> Can you check this
> <URL:https://linux-media.pages.freedesktop.org/-/users/sailus/-/jobs/109521830/artifacts/junit/test-smatch.log.txt>
> please? If there's a single patch that needs to be modified, I can squash a
> patch into that, otherwise v17 it is.
> 

These are the same warns reported by Niklas in V13. Dan fixed them in
smatch in devel branch but fix is not in master. Testing with smatch on
that branch yields no warnings.

https://lore.kernel.org/all/ai_txjwLPHsSKsJI@stanley.mountain
https://repo.or.cz/smatch.git/commit/d12183645a31b737d7fb39cbefa589e34615e8f7

v17 is still needed to revert one breaking change introduced in v16 and
fix more findings from Sashiko.

Thanks,
  Dumitru
