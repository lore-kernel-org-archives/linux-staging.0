Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA15D1862F
	for <linux-staging@lists.linux.dev>; Sun, 10 Dec 2023 20:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/s/i0UM"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40c317ba572so6148715e9.0
        for <linux-staging@lists.linux.dev>; Sun, 10 Dec 2023 12:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702240852; x=1702845652; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1Ab7lMzsLfWXGl0JbgQIy0bj4UtBSLghAU6yN7UWGtc=;
        b=L/s/i0UMXmkwJ5788NSuzrHvxE6ZAPerbEZxr9THuI+OOAiixXJvDHrtAavqO2//xK
         WF4wz1bctjJL6pOBbkAerEeYSaIYGHWjV7h3jJm92mSS3bj4FL26uw6kWlRrjS7WE3Nf
         VIQJhOAXg1fVcpcS/toRgMdmFtv06ntXhsSI46vtGzfAm0jKZMQjkEyt7BdZ6x0sRiFn
         I/Aa8Ir4r48oPNV26X/dF+F/fCx99k5wjo1h6Y0ypKzTxf3l927VdrwIdLyt0fPaYu7o
         j6hO7yT8pGZm5tBFz+rTi0ORludl/rcKlxr4/ZSeIZsT4yWGAintlEcj8M3ypYi5qE9a
         TzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702240852; x=1702845652;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Ab7lMzsLfWXGl0JbgQIy0bj4UtBSLghAU6yN7UWGtc=;
        b=Ja5DoNBMyc6qBcQtpxQPbTDA9D/YpdSW8ARH7ZbaOS8NdXfR0eOFEgmhJTvKkIfw1v
         a7He7JVn0AElTyOgImvBPzJQoN7Eh6PsBkR0DXuwndF7ntwWULzi93QidAfyTf5l13+7
         xiMDxEYeLWlHbANpz2Uge7AvbKXuuwa/kfJyYHUCYS7bv1KtBJjZDmnswOCkVzYgQVSD
         Zphhl8mC+sKMcWk2GISP0Qb5nmbeODsMBtQxUlNGcTWiGJ/1GPMnX7kt/NiIJ4c0yFNm
         8m7JBLcBHQ9NhIdxb6gt0JSzvRYxCzHc4kwKU8gr1ZYhqHXM+rn61JMs2Vzt5eI8CN3V
         Tu3g==
X-Gm-Message-State: AOJu0YxdDxxHmutZoBNaAbynng7fgmRe4iD7ugOQPlYG3pckRltUseGB
	YqTUbbjw5g6Au/t9ZwPDShg=
X-Google-Smtp-Source: AGHT+IEq7ypqKwoorgwhbbOrqX2eZbNSUEABBido4fvYyzJ4sCIzFZC8cdjPAs210wnQHCqfjccieg==
X-Received: by 2002:a5d:6483:0:b0:333:460f:759c with SMTP id o3-20020a5d6483000000b00333460f759cmr4065123wri.1.1702240851947;
        Sun, 10 Dec 2023 12:40:51 -0800 (PST)
Received: from [192.168.0.104] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id q18-20020adff952000000b0033609b71825sm6534260wrr.35.2023.12.10.12.40.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Dec 2023 12:40:51 -0800 (PST)
Message-ID: <cc4513b5-2ed0-4475-8bed-fe75e837aebf@gmail.com>
Date: Sun, 10 Dec 2023 21:40:50 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Staging: rtl8192e: Remove unused variables in struct
 cb_desc
To: Tree Davies <tdavies@darkphysics.net>, gregkh@linuxfoundation.org,
 anjan@momi.ca
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20231210193705.2131807-1-tdavies@darkphysics.net>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20231210193705.2131807-1-tdavies@darkphysics.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/23 20:37, Tree Davies wrote:
> This series removes a few unused variables from struct cb_desc in
> rtllib.h
> 
> Thank you in advance to reviewers.
> ~Tree
> 
> Tree Davies (4):
>    Staging: rtl8192e: Remove variable bFirstSeg
>    Staging: rtl8192e: Remove variable bLastSeg
>    Staging: rtl8192e: Remove variable bEncrypt
>    Staging: rtl8192e: Remove variable macId
> 
>   drivers/staging/rtl8192e/rtllib.h | 4 ----
>   1 file changed, 4 deletions(-)
> 

Hi,

works.

Thanks for your support.

Bye Philipp
