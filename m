Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C93F760BC
	for <linux-staging@lists.linux.dev>; Thu, 21 Dec 2023 12:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggrkFavT"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d3d0faf262so6190195ad.3
        for <linux-staging@lists.linux.dev>; Thu, 21 Dec 2023 04:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703163449; x=1703768249; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=musVmUuCpnjPGleACL/byj1kr0cfsw28MzXrnkX6PJs=;
        b=ggrkFavTTAmIzTSxvuWhoJqYHqon2T3HVBPO0w3CPKcVQ7ddGE0J5Awi0yTaqLzHB1
         0JtlcU4Xya3rh+tsMq79glqYKX+FqWU0KQY6jOAwTLoApEVUBAVbO4chnA5mMFAO+3Kf
         OQJ8GHmM7Zm5Hst0DHh0fjeRm706ujHvfIDVkvDs1CsjDpwrxFntLl9O0wrQxNVJl6Kw
         265J2wWZUXzRN0u44F2ZapYzqlxY4XX/ujLubele5/zBpPWPzBsWMc1ZxgMz2yYCb9DB
         qgRieX0n0PVYjKOCpC6vA6zwikpUPFl/wJmnKqa1w8PfKfcJy+MRgF+57NBzJsBitvJj
         iZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703163449; x=1703768249;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=musVmUuCpnjPGleACL/byj1kr0cfsw28MzXrnkX6PJs=;
        b=DNLb7A5g65gGlZ8mTMyA8mhsDgmYX8iAJp82Z4gSCb+Ib//V1U1OViw6ANTddioC38
         p50OVAMasviTnBFgOGlOubi1Kl1Wt0vtYNrOMpjce7eSQaMYWAhQP3TOli1Kkys3Goy6
         BM5+OykMCj/yUrw5/ysOBDWPU1105mzi3S67t+i56pW7sOZi6DdV0dtAXp0zSeVcKbp7
         rnNj53VtQwc6sK5p09hs8Nrlvo5YsTpu4ewo0FyqW1lSYmT3QqB1ZerQvnKls3liQWjN
         O/mtYewjAe3VfrtKncsdPJm76QGX7lQHYewYtwBOm9cIYqYq9VC/MdwpeG1xrKNviA2o
         O5gw==
X-Gm-Message-State: AOJu0Yw1Ui9uT//E62QJM7FjMy1jNo9x/OkD75UyztV6TEGV2hb74gFb
	pvR1dYE9lsoL3An6XT7UWb+Brn04meKmSA==
X-Google-Smtp-Source: AGHT+IE83WLqTmJQCap1InNLacVDE0wJkQuQau2txCTQEmJoSOqYP0pm7IV5mVJnb29ieMz3zYuT/g==
X-Received: by 2002:a17:902:f68b:b0:1d0:6ffe:9f7 with SMTP id l11-20020a170902f68b00b001d06ffe09f7mr27771648plg.85.1703163448802;
        Thu, 21 Dec 2023 04:57:28 -0800 (PST)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id g24-20020a1709029f9800b001d0696e9237sm1560048plq.118.2023.12.21.04.57.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Dec 2023 04:57:28 -0800 (PST)
Message-ID: <cc276c0e-99bb-4422-9771-d864db4287cb@gmail.com>
Date: Thu, 21 Dec 2023 19:57:21 +0700
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: "Link in bio" instead of Link:/Closes: trailer
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Jakub Kicinski <kuba@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Staging Drivers <linux-staging@lists.linux.dev>
References: <ZYQeZjN_3bPOdKKf@archie.me>
 <2023122112-rigging-january-7618@gregkh>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <2023122112-rigging-january-7618@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/21/23 18:51, Greg Kroah-Hartman wrote:
> On Thu, Dec 21, 2023 at 06:15:50PM +0700, Bagas Sanjaya wrote:
>> Hi all,
>>
>> Let's say that there is a content creator who submits her first kernel
>> patch (touching drivers/staging/ of course to get her feet wet).
>> The patch supposes to fix a reported bug, with appropriate Fixes: tag.
>> But instead of using Link: or Closes: tag to the actual bug report in
>> the patch, she instead writes "Link to the bug report in my bio", as
>> it is the norm in social media world. Here in the context, her bio is
>> LinkedIn profile (IDK if there is a way to add arbitrary link there).
>> The link in LinkedIn profile, when clicked, will list many links
>> (including her usual social media campaigns and of course the bug report),
>> which makes reviewers confused about which link to the bug report she
>> means. In some cases, she may disambiguate by saying in the patch,
>> "Link to the bug report no. 99", to refer to the specific link number.
>>
>> Is such practice a good idea?
> 
> No.

why?

I'm confused...

-- 
An old man doll... just what I always wanted! - Clara

