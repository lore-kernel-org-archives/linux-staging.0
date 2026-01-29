Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFBF212B0A
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 07:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769670722; cv=none; b=WRDlX4Wr3OTMgK0i9iVL0uyc8OWWFCdDwbKbYaldWMiol+fz95nOFTIT16ghvd8/Iru/AtcS4FNRFFDtt+7Ddobf2KtJ3+D/8V3ooO+W2xaXagsKRUIQey5qR0Ckx/3bu5jUjHy/Bm9ZhA211hjaGJnpA1dRFo7J7N6VVfz8FxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769670722; c=relaxed/simple;
	bh=3UwOsWUqyCZUNPvuIcNpxYkrc1l5K9e8DdukPxj77Hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQCWfXnjEsjX0vSYFxE9I7ces0KyoXF5YUaxigGUdh3W68i2gedyhyZmElGI+ULVV8i/XjT5DEdoHIxcsHtwA5kQ5m4MPCn9c3TasO8PwkktM1/i8Ggqsootp37xa5ndeufFPeepBB+f/3Fx6KPB5RZqtf5l5MxB8lc0+MNElUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NN6Xdol6; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NN6Xdol6"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4806bf39419so10658435e9.1
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 23:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769670719; x=1770275519; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G6OfEdod6Hjw4B7Yvubp1SWh5E6LzFlx1b0jKnUAB2U=;
        b=NN6Xdol6bDtslzf6KlLAU4wzgCUj19FCXj0uR9pYhT8W9bJa02JtA+y6Y3c475KeGY
         b6qcS2Zpjqct6bILcRWYrNCpm6q8Urzfg36VWofEZPE3Y5BJDqxmQClN/WbeRIiNabxU
         BN859jWofIc9oiKzY0uE61s6i5We5shFuzjqI2gW02gLgVFB2lblCvhH2Fj5LIsw42Ci
         HdIY4zMtpxaibRw3iV/iagbY9qUCUzFowDrvXLzlQO9oJ8N0+bC/LrNqqhHzOIVERONl
         WV1a8xFOzGUx0w1O1U9dA9MLoUaj85QYPsWDreBC1bTVZqBgJVn/UorR6IvmUUHh6ZQb
         bkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769670719; x=1770275519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G6OfEdod6Hjw4B7Yvubp1SWh5E6LzFlx1b0jKnUAB2U=;
        b=MeTIJ1zu7FiWa0YGR2382+wg9JaMfWUMs75p0M8LoE/un2ygRdS2aBIego+2aBXQ8M
         AStdhCt84BFI0grJG0H9bcqHFLVQbzXmPIAAM5cnP/L+dCnqkXkj6AWdRQaSz4R6T/Y7
         4iBByuxtPeLbxQEqg+mUI6Lu0Lz60igr6nD5YciC1NjY5DwhRToI5CTb/xywoIsJn4sR
         o0JMIgPN/HrC7NUhBhLnWB96RXwDER2ZhYulmFNvWaYt+IixalT6Uyr1knDR2tJF2NuO
         R4/+cpcR/SrW6vckACuv4BvkpuVz2l1sPpIBb6b7GGJ1uuCfBHSHEogvVE2eq4/cIKDm
         FztQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7W32EiLWc42abma45du05Y+KGPVSVW4oW4UyAYrCv3gGwQrG1G7rkh0yFx7hiA7yW+wmzAuqxi7r9HQ+K@lists.linux.dev
X-Gm-Message-State: AOJu0Yy79c0AROhfIsQYAVOtEHOSqwkmhEicavKZXjdbmdM/cG6jsUC5
	hUUmfXhmIkf0DZXfQ1FMTq7NZ4a8sTbOJVsVzLi4g8FLCSURBFVOS1EFEQEiCnP0IgmelMYS+CT
	Ot0RW
X-Gm-Gg: AZuq6aJOUvQ9si0Q5TIPzLn2AlQSfbTPiE/uI0DAG3+5zwx5TKIMVm8qBydNUrF9Hdj
	LHB4n7ELwfl79z2eCtGkNvJae+BNWCII9nzfECBfdOwhbUN2txHujitnZvp8umZYjtNYJEGW5lW
	OBPNxoTKsbTkddm+HQB5pUAQSLDR+nHIioxUFxpKf82HUGrLvytskGnAA24f5bBmOZk63+o5lYe
	Xj9KdlQAfys62J73l74590vhdo75lFkv4HJwoNcXprFVMEmY9PswCdWF+zCWf+C49QaIw/r4WuU
	FZ54X0UuCD4YepXkNFAIXuBum9IHJUx9h1j0hhS8dTx2HJKq+4rB9F6LLjvqXbHXkjet6pef/so
	n/qXn26GVZhXUyA9nVUxCeJxMF/sIud5iYQM8I8XNybkNBD1gocKyx2iAvd85+etER8bD2YLuQZ
	Ls1UP4YtZdZcxJXHPdaZi3I271Mno=
X-Received: by 2002:a05:6000:4011:b0:435:db9b:5885 with SMTP id ffacd0b85a97d-435ea0672c8mr2799594f8f.10.1769670718987;
        Wed, 28 Jan 2026 23:11:58 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4762sm11988777f8f.6.2026.01.28.23.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:11:58 -0800 (PST)
Date: Thu, 29 Jan 2026 10:11:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Luka Gejak <lukagejak5@gmail.com>
Cc: gregkh@linuxfoundation.org, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] staging: rtl8723bs: rename u1bTmp to val
Message-ID: <aXsIOzNRh18ddOZc@stanley.mountain>
References: <20260128171635.39879-1-lukagejak5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128171635.39879-1-lukagejak5@gmail.com>

On Wed, Jan 28, 2026 at 06:16:33PM +0100, Luka Gejak wrote:
> Remove Hungarian notation by renaming u1bTmp to val.
> Also fix spacing around operators in the affected lines 
> to comply with kernel coding style.

Do the "also" part in a separate patch, it's unrelated.

regards,
dan carpenter

