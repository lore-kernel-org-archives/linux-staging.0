Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D053B286
	for <linux-staging@lists.linux.dev>; Fri,  8 Dec 2023 17:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSEqDXna"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-54cbabf4bceso615852a12.0
        for <linux-staging@lists.linux.dev>; Fri, 08 Dec 2023 09:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702057780; x=1702662580; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8gf91RaT4psSnTjQOvkHoL2IZEpgv+zezQV3dSOeHfM=;
        b=VSEqDXnabe6w/ZR9MB2c1DGXFcT97jA+VIt/6075tGmT9xviErjrgUQz2YWIlLUWUK
         0iSPB3G82QhGWYm9nFqiK1RoXN0E8QupqUVjFp+fLJu8KG/mElr84nG07ZTy/ofEu6gP
         8wZYbICdrwaicFwuu3Je1XkuHVkphOLFrHp/PSQskm1j9gkV/VfhiQ47DWNr5QuwXWf0
         diJmpif5VxSx61h19B6/WKWYtsb/nZSX4dDpyNJ0cURsmGp7jUKpvLfxyADxa3841VOM
         ZyGIk27tVaMw2yieSOVE+3p9YOp/lynkpWkmB4yq2GV6T6a/6R6nMfp8I3hlc7KEmTtK
         4qbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702057780; x=1702662580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8gf91RaT4psSnTjQOvkHoL2IZEpgv+zezQV3dSOeHfM=;
        b=KIA9MZ1BPPg5U2PTPL89xIVlkT2CZ3E+6sJ4lSDOeUqtn+XXcEBRYEjMA/eDf3nv3j
         rZc46D/Q/zWu57/F2aG62qDa/ORBHXPynDXIT5JzpWYazbDRUp8v0jAgbnzxYmgg5l0d
         Jfd7Lp+0mYbYbdPZ+a2ykT6DMoBtO87uTVz+YWpyify6uL17c9ODifXZHrCzW1lQo7zX
         nRfj/3RaxXp42OZW7rUfLfQt0FCmiIHWN13M3Su3Z7DQFcgvZ4EX1t0HZNbIYWKOuNAS
         603cqNkMqQCtOSLKTMK6Qv9hdJ5hCuX0kNREYdA1H2vW6oh86wiXxphX7wgKc2fu95wI
         pT0g==
X-Gm-Message-State: AOJu0YzVe5YBuJHLHMtHnDDUPXRj2NxmQXYE/eZ/nd/CnH4x3GfWqwdX
	HSq4L4BuEWmEuPwttOJlvjY=
X-Google-Smtp-Source: AGHT+IHp1bqbIduEvqo5uZujud1Xq8U3dFm2yrl/TdI4//NFcvUqeh5moXJ3Rp5abHwycc1GgkYtdQ==
X-Received: by 2002:a50:d5dc:0:b0:54c:e90f:2c33 with SMTP id g28-20020a50d5dc000000b0054ce90f2c33mr676889edj.1.1702057779964;
        Fri, 08 Dec 2023 09:49:39 -0800 (PST)
Received: from [192.168.0.104] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id 28-20020a508e5c000000b0054b686e5b3bsm993617edx.68.2023.12.08.09.49.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Dec 2023 09:49:39 -0800 (PST)
Message-ID: <493fe783-46b3-4da7-b0d9-01425e6adf2a@gmail.com>
Date: Fri, 8 Dec 2023 18:49:38 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] staging: rtl8192e: patch series renames (5) different
 variables
To: Gary Rookard <garyrookard@fastmail.org>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20231208015536.21013-1-garyrookard@fastmail.org>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20231208015536.21013-1-garyrookard@fastmail.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/8/23 02:55, Gary Rookard wrote:
> Hi,
> 
> This patch series renames 5 different variables with the checkpatch
> coding style issue, Avoid CamelCase.
> 
> Patch 1/5) renamed variable bCurShortGI40MHz
> Patch 2/5) renamed variable bcurShortGI20MHz
> Patch 3/5) renamed variable CCKOFDMRate
> Patch 4/5) renamed variable HTIOTActIsCCDFsync
> Patch 5/5) renamed variable IOTPeer
> 
> Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
> 
> 
> Gary Rookard (5):
>    staging: rtl8192e: renamed variable bCurShortGI40MHz
>    staging: rtl8192e: renamed variable bCurShortGI20MHz
>    staging: rtl8192e: renamed variable CCKOFDMRate
>    staging: rtl8192e: renamed variable HTIOTActIsCCDFsync
>    staging: rtl8192e: renamed variable IOTPeer
> 
>   .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  4 +-
>   drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    | 22 +++----
>   drivers/staging/rtl8192e/rtl819x_HT.h         |  6 +-
>   drivers/staging/rtl8192e/rtl819x_HTProc.c     | 58 +++++++++----------
>   drivers/staging/rtl8192e/rtllib_tx.c          |  4 +-
>   5 files changed, 47 insertions(+), 47 deletions(-)
> 


Please use present-tense as outlined here:
https://kernelnewbies.org/PatchPhilosophy
So rename instead of renamed

Please use a more unique Subject for your coverletter.
It often cannot cover everything. But more unique is better.



Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
