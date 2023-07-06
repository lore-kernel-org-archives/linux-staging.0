Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1ADA94C
	for <linux-staging@lists.linux.dev>; Thu,  6 Jul 2023 15:30:31 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-98e2865e2f2so25571966b.0
        for <linux-staging@lists.linux.dev>; Thu, 06 Jul 2023 08:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688657429; x=1691249429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Z1BlLxPWPKdxfGdvSEAnfzfEGC5OzbOtHCd5+Jzu/o=;
        b=ZH06GVHDnvnE9AgXnshEk4hPgxA8GrmUM5G0V92E2faBUmRMY96Hf2nHcOtfB22zbk
         vLX91tmLLepP/lIc0K4IqVHfJzFLi0fFPp2N3+LucCE892VFnwn9fskGkpKWnXoW2cmX
         xqRUXwe6iZcQ6oIvEaoYy/KpMmulEzVLy9bwmTHAwLYzwK20yZxIIu7EvEnEt5yfpe8P
         eOgy/5zIUtG+YEUk5Jwpb2xKxXTUU4uAEgB2yx1/2z5j7mI1NFZdn3Yqldqb1369Vn7K
         3kk5WCCI3F/7o+L0raPq+icWmEGiYMmoLSc+hUGLmJKI8xsdFBIKmxhzhQRGBc6hryKy
         lzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688657429; x=1691249429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Z1BlLxPWPKdxfGdvSEAnfzfEGC5OzbOtHCd5+Jzu/o=;
        b=Zog9y8F9hoLSj4kD4ti8ZYcj+o/X0km2eg7yzZOgrey/Swi6TuzsyYu7rOXT7bngyy
         7eHPqsg55iVDJ5viEYMejmn22Gj1fqZhqlzgBn3F3ww0qWTudS+QPTjB2fKb/YXPDlDC
         sp2E1OpzvMWwN6PYrrW6H95MbdVNDoGHx3ETlSf/Es+SB3qfTt0jBuwmDNmBr5pGUuh5
         LuWOr9X4dfxm4QnVwK0xm+eylM65mXAON0XO/cz+DUHDVTx3Xqy67gjol5yXq+aOIhkh
         DuFosaKPpV3T8FWDSEpxzTglIcjhDFR9XEunwaggblX/VWkAM5heOyxTIlmhXJ2DINZ3
         1Owg==
X-Gm-Message-State: ABy/qLaSimpWdoj9WJeGOL/EQ0Sc+MxDbbOWawdqhgl5Uv3VgMBlb1wW
	ZG/oXrc0AD/T/U39X1ClM4E=
X-Google-Smtp-Source: APBJJlEIFlAQoLHChpeApdMXnWcLayighaoM8TllhP6wKqIlXM7j2bfAcw4rAuX7pmcWNgOAK6T8jQ==
X-Received: by 2002:a17:906:7394:b0:974:5de8:b5ce with SMTP id f20-20020a170906739400b009745de8b5cemr1731313ejl.2.1688657429245;
        Thu, 06 Jul 2023 08:30:29 -0700 (PDT)
Received: from [192.168.0.101] (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id v11-20020a1709063bcb00b00993860a6d37sm950186ejf.40.2023.07.06.08.30.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 08:30:28 -0700 (PDT)
Message-ID: <8e53be9b-8b47-597d-1538-95733eb16cac@gmail.com>
Date: Thu, 6 Jul 2023 17:30:27 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 0/4] Trivial code cleanup patches
To: Yogesh Hegde <yogi.kernel@gmail.com>, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 skhan@linuxfoundation.org, ivan.orlov0322@gmail.com
References: <cover.1688299890.git.yogi.kernel@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <cover.1688299890.git.yogi.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/2/23 14:14, Yogesh Hegde wrote:
> Rename variables in function _rtl92e_dm_check_rate_adaptive
> to avoid checkpatch complains.
> 
> The patches are required to be applied in sequence.
> 
> Yogesh Hegde (4):
>    staging: rtl8192e: Rename variable currentRATR
>    staging: rtl8192e: Rename variable targetRATR
>    staging: rtl8192e: Rename variable LowRSSIThreshForRA
>    staging: rtl8192e: Rename variable HighRSSIThreshForRA
> 
>   drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 38 +++++++++++-----------
>   1 file changed, 19 insertions(+), 19 deletions(-)
> 

Please use the "staging: rtl8192e:" also for the cover letter in the 
subject for the next patch series you are sending.



Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>


