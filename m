Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF48A3FB2A
	for <linux-staging@lists.linux.dev>; Thu,  1 Feb 2024 21:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706821633; cv=none; b=X+pvUpDtSwv0ckMNQszle2aTFbh7gfUwgObIrMa0hmpSPXlZfqA9VQ3blwiCQt/yY584P/ioneBZO27LjZ5KbxgRcmCAcQ2E8HGx1w9b2zwJyCWpzgAFX3fZrDrfICXgY7/odYL5L6p4+TYSSAyOI9D8n7lurI7ymImNbw7XIqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706821633; c=relaxed/simple;
	bh=7EmwMioNxZXrojX8nMWHbwqJFpxP0JNO+hJYa0MADuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ngLtXyGPrFkwwPfAS8jbUNp9k2INHyxYDOdOt1gjtotMpzmwLxloLMTJtlQfH6P2O0J8IxtRhDXUxp4FZLtxSzEqWJpofYf64Ua+vqFsie+QP7qgTsX72bgYsTf60s6vU0WJ7WvljD2eiDC64xg6V+pWJL4xjzzaVkv7xjtujQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3w2biZ2; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J3w2biZ2"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-783cdbecfe2so40685085a.0
        for <linux-staging@lists.linux.dev>; Thu, 01 Feb 2024 13:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706821631; x=1707426431; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fNUsRQWJRD/SdtoJ06hRNIrvyVsnBVIIyaRokLoeu84=;
        b=J3w2biZ2jB2GB1G/mBWeU+1XpNX7yuuftIQnE/M/6DfhCS0VFPxey9+YEPzAhuZhAK
         U0eLgkmBvTK7drL54UFYT6nnxEgq/N3hyCt/rMNzxylTeLzNcgLO8Xsjh9ECOso6/jB+
         BP8Zm/zXp1sZL2dJERPYc8tb6K9AhrHh8kU1j4mwvQ7Nj07FuCnsrX8X3hAdteDoUW+S
         RGLI7P2KmI0td4rxXwMtzLIpxfPrjkhWNK2hqOBSVKet587UE+g0qWhKxjGPnPvRH1A7
         sGWjiS5tmho/mxkNMm5j/AJI1mOS7KJfxdJbU7Ji2kXQd81n4o1g5necxUOsRYAikpsT
         CE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706821631; x=1707426431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fNUsRQWJRD/SdtoJ06hRNIrvyVsnBVIIyaRokLoeu84=;
        b=u1ViM+4o1Eft0w1Da2SyYR5nYFcsrtTydqhw/8JymiJz9YB+TVV9maohlnDErH15As
         SglXJP/zgPvwoS0y9REwgc6nm0VYcgpwgulyffgG9bSs+sONpq+RDlNz+t/eBU9ImdrW
         u+wfy+cY7wpLd/bKnk/i9UVAIiKdKSuvCQjvkHP+BOBpR6hCj2n9GK+4IMAKPvZ5JAqH
         QtLPYsoBmKVkL6BjxD6ykRR7kUPeVZhdvji0ChuCFcgj4G55VhCMe+GOg66jq8bMsOOi
         aRROLoqZeD2Vj3esV7weA4mzcOJJzxz5UQhpqCMuXgFuubdM/ygT/han/UcfFX1b9vEN
         13tQ==
X-Gm-Message-State: AOJu0YwrD3P/+Wl7m7WO1DZ1zm80Gg4lFeCdYa5hV9vseJEVlWoABT1k
	wJAPzb4wl6JbmvopDbRHMNUHgZy8dkt9ziU3/4V8YKH+nSTsWgp3
X-Google-Smtp-Source: AGHT+IF8oF0nC6tGdbCX6Sy80api5qcXhhwLPM6Yg3kdlboF3pSOM6Aqoeg2JcClHarMiturlUn3fw==
X-Received: by 2002:a05:6214:aa8:b0:68c:6eb5:c727 with SMTP id ew8-20020a0562140aa800b0068c6eb5c727mr3869586qvb.6.1706821630646;
        Thu, 01 Feb 2024 13:07:10 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUNybhWeQ64BmWfJoCjsJARxp+lYkniBeFdWKYSls90Bv2w36QA1aWymKsIFGufrTcCs9KreBmPrngOdQLathlLszNnMCoKbHwc4FtitkQ96Su2ZJ3sQmmnLk6xWBIUiUNbkxiYo3Igfw==
Received: from [192.168.0.104] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id mk17-20020a056214581100b0068c7c91b04bsm126741qvb.104.2024.02.01.13.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 13:07:10 -0800 (PST)
Message-ID: <d2033061-2f85-4215-9d39-0c56da17cd37@gmail.com>
Date: Thu, 1 Feb 2024 22:07:07 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] staging: rtl8192e: some coding style cleanups
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240201081824.6998-1-straube.linux@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240201081824.6998-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/1/24 09:18, Michael Straube wrote:
> This series contains some simple coding style cleanups to clear some
> checkpatch warnings. Compile-tested only.
> 
> Michael Straube (3):
>    staging: rtl8192e: remove braces from single statement blocks
>    staging: rtl8192e: remove return from void function rtl92e_set_channel
>    staging: rtl8192e: initialize variables at declaration
> 
>   drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 5 ++---
>   drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 1 -
>   drivers/staging/rtl8192e/rtl8192e/rtl_core.c   | 3 +--
>   drivers/staging/rtl8192e/rtl819x_HTProc.c      | 4 ++--
>   drivers/staging/rtl8192e/rtllib_rx.c           | 5 ++---
>   5 files changed, 7 insertions(+), 11 deletions(-)
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>

