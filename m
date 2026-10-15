Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047EE24E4C6
	for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 01:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792027398; cv=none; b=PwIEx3ClGxYVQ0E3TYVFQf7LX7HtZwUE4Xk/b08HRZ1b4Bubsa4ZXliE04wJu3QV9iJXXWGnLyGykqDvVzqfebIgF4yGa8qD2dOPw5EKkZ6hhjWgLqbEB8VkuLPxU0ZJC/BX0JcmCsCANL7DxGETg/ZaGs/t2EQr30iO4Awg93I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792027398; c=relaxed/simple;
	bh=7ficzhK3Rhv6KNOjHabHwbT4xbc1BJMxfoyzCtkPbaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qNHgnvvDW8vvHQiSATvvhHQpDGQFbm4pphnKaEAd2KqnaycCxt5huIUHwHzdVIl3vJb/2ce5LWbjBObGHM2BkKCTvPzn+uk5k/SfoS9kHyF+Vpeuer/KrtVEeM+zYChgH1gcCasDM2EzN1nJvL7YpxUQCXlQfHeXSfXlYwWnT5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=XIAVQtI8; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="XIAVQtI8"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53391786e55so77409761cf.2
        for <linux-staging@lists.linux.dev>; Wed, 14 Oct 2026 18:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1792027396; x=1792632196; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tDPLaKfb2lMm0cNVfzQxbfZzYs380EKo9PAZuk6Z0DE=;
        b=XIAVQtI8UCn91FeRnOwpDfAoIHsezTtPOHA/mVYrQi0sX7FnfNuVHn0cCZHh8+Dp8m
         D2pc3ilkSBG63G9D+nVrsE1IOF3lPOi/pkOYEQDw0pbgnid+sjypeFpBVm/yLcQsOQT5
         KUXqDr+XZbKnbSVubFXOPTpaSONr4uF76+njg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792027396; x=1792632196;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDPLaKfb2lMm0cNVfzQxbfZzYs380EKo9PAZuk6Z0DE=;
        b=RWdM7kj6hzpjKZ97enOdKp/ZPCj0dGI9HjLcOmCrNIiNCZmyxmX1FC/G89EtqD0j0f
         CE/eHWVrpHsr3czPO7Uf6thCrzScbuIjC5C8vjT1r/kfmx7NrjxNnYA81rKHDAOEr9Un
         4c3/6QGWS5Ib3WqSZP51SxdqfjWF/Obsjl99XzcSdnlp15YwC4nHWMZmhpChVkAHAiHv
         i1EUbs1+PPxHMfp9Na6pEFP2lqIk3V05Z4ktbXbFuVBoYqvawkGClMgRhdWKHq6ZFf8X
         qUblC69ebvHbqReET+dGPnAOxl9pmeSJ4+Lc04dYTu8RdmazguSWiQ4DseqTgnl/6Ntu
         Kpfg==
X-Forwarded-Encrypted: i=1; AKwUvBzad3FCEMxulj6BwGoUIUxVUkko8LJQ9uFjBA6ebeRs22omx/Igc7g9vvnX7a+3L8iRqEv5XoYbmYQ3UVNJ@lists.linux.dev
X-Gm-Message-State: AFq9FYKsUK4eOSfxIKX//MmxbSW/v8HflBj8nV36BXnVTm3ISRMf5Tzr
	hUZD12411qMboZXSC1DUZ16t9KKKQcynbTikDgK9k8Na+CaXq/hCTg5hy4cq+fdZmQ==
X-Gm-Gg: AYBFou1v1ZMELYJjgeIrTn3yTX/RuTCguIsijLJnTbCrpMNwNZywyQGHNingh1ym0Vg
	FrXG2s31ZpCQC6f63x8CcMHk0yXkclz/pyPEbyVjP8J2eP3BKBK0FJW3OTEHBbQbfOESnknTVvl
	YsoCskhT8KnrpP/Pvk8WwImP0aoU58rmsGKtSI9xYKyUyJz4CywoFqDTC7fkZAEkZ5id4BOV0fj
	u5PXNOcUo8vmZcLJ2tPGoflVpNenv29pZMs+zQkwZ+RBb/mPinhteKtMXVXqy8o0iD95pXbTxMd
	xY60YtuvKtXDYkC5t60C/PZ+1p0xQuyeDqjkdKH5GiHKDw9K3nNduEMUSVSf77FUfsBRAMyqn9k
	FH8KQR31zd/AqGhPzWmOxF3B904BPwTtLtzXMjAYzm1xM4iWl9RA9FVaHQ8Aw/Q60eNzY+5qHWW
	2Q88nh+W25zft5g3DG8fbUNXFcRVVkWPYPfAWSYv1Jf0TvhILrLVzPQnoQV5DyWb1PZw==
X-Received: by 2002:a05:622a:c14:b0:535:521:75aa with SMTP id d75a77b69052e-5359fba2477mr270509491cf.48.1792027395839;
        Wed, 14 Oct 2026 18:23:15 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-536128071c9sm12258771cf.21.2026.10.14.18.23.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 18:23:15 -0700 (PDT)
Message-ID: <80a12db6-8617-44f9-aac0-c4aa69de0a1c@ieee.org>
Date: Wed, 14 Oct 2026 20:23:13 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: greybus: replace PTR_ERR() with %pe in error
 messages
To: Julia Lawall <julia.lawall@inria.fr>,
 Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
Cc: johan@kernel.org, gregkh@linuxfoundation.org, vireshk@kernel.org,
 elder@kernel.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev, gservice341@gmail.com
References: <20261013022402.6322-1-pavankumaryalagada@gmail.com>
 <2fd23f9b-7eab-4afd-aa77-93a5b9ff0c75@ieee.org> <as6mC7sZnpqIKxN6@user>
 <26a2a4af-5d27-4bd5-b284-3758fa7a67b2@ieee.org> <as-wgGhJAGgYBZ7-@user>
 <9f3e98b4-8c11-62bb-49e0-99873c6fea8@inria.fr>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <9f3e98b4-8c11-62bb-49e0-99873c6fea8@inria.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/26 2:14 PM, Julia Lawall wrote:
>>> And if updating everything is a task you're willing to do,
>>> then I think I would prefer you extend this change.
>> I am willing to make these additional changes. Since my original patch
>> is already in staging-next, should i send a v3 of the existing patch
>> or submit a new patch covering all the relevant cases?
> v3
> 
> julia

Yes, agreed.  Thanks Julia.	-Alex
