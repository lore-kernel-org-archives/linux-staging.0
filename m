Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3B62EC0A1
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 09:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773999333; cv=none; b=RqgLMCrLUEFsMjQwbENpvimOWIS4AiNd/lBFW2e1Oi9mYyKWIWjB5kWRLCow2vVkJZ1Tx8V+GrhI/MNS+SKhvOVTM8G5+CE1MbSE0utkfFeEDd1JxUesduhxul65luuMREsiNTEFf273s4gx8HW5DQlr3320ZrGawXIqZ4GMvc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773999333; c=relaxed/simple;
	bh=hREI1FTeyh5+6+5vW2i+NWMEHJUHvF0mYilnckBGup0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I+EM+o1OlVEom87BHgXP7mAzKqimBaiRbnzzH3kmZg/NhmMrxVlhg0Hfqa0rKPvFdyjHdp2qSiWI+3rXovVCr/RjqAzKVON/7/l6XiCAJLYV9YVK/znfSvQEly9SEk6aRYNScvcMpaQFAZBakJOglvgJkDMeH+9DGGu1zIqgSbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wRXwNjqW; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wRXwNjqW"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43b4d73463dso242962f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 02:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773999330; x=1774604130; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pP3ds/Cehal6rox6/ILusKIvibV6yNP2ug/YBNAFzpI=;
        b=wRXwNjqWEA9C8UuqvgxrJ+vX1tlpDou/msNf/9rklh340Atp+7I20tV1ATy2l8y9gB
         DEHi0nYpaHoOrYqFUdaQQCIwt9PxcfQjvaf1yHy0x2h7TimRJHEm6DgsjhBW1teaTlxd
         qWQ0V/L4tMXblysmeuVgIt/KtTrMIbIfVzQWwbXHP3awasY317Tt43lPnpGpTRIufjjw
         6Sk8IdnSDlvbB7tciDTwoJmpxCS+gPUE1iSSMuZWII0lpOKcJa5exAwLomuzhvNo2M7J
         pyXq+EdEGUODP3E1Pg79xMx2V50H49l+wsnU+/yEoB4vW06O/HmCPyntiSyGR4b5DNcf
         ghgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773999330; x=1774604130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pP3ds/Cehal6rox6/ILusKIvibV6yNP2ug/YBNAFzpI=;
        b=sVedLGFQI5140fks2MzwZbRnhELg+/iCpd4d9w0t2RfRSMChHvLKv+ukTbAUX6NfX7
         eE/qKCp+iruRAXcNbeXJ/TmtEzHDmj2sjQKpWwV58sXeNEXVrK31L3ZtYXmlrh2/0u9n
         YwpmR4I43wpX2W+Sm32bbAp1GPQ/v5LmTj2GG6i/ghepHotual2bkWkVBAps6IjsIA6M
         pcg685os2pnhLyouE46r3KFP4+f5ejlm+iX1hjqH1yvD4seV0BiNxkwacm2YpjAekbQN
         En5se04L0Ru/h6UZG/bl2xRdOdP4VySOxBt14PHit0xypaLQc6FVxnJYlyQXc93LHwED
         KXlg==
X-Forwarded-Encrypted: i=1; AJvYcCXez21eHAfk6UFRz/kEQNA+r5MRPMJj8f1FhbYP8It72n6rvQ/ZM1QPT5Gm91X++4E+GokOizQM4bqVACH2@lists.linux.dev
X-Gm-Message-State: AOJu0YzOYoAc7GSPmYgcfozF67DzqfL8ajWPcyy0T0MKx3aLEBcDtvE9
	aUfwaUgX/lxHp5e7/D/shn+pJwxV2655rURF6WmjI6UruriHVC/+AyybC8/s7E2fmzw=
X-Gm-Gg: ATEYQzytNxjY33zCLTcXHugqlmCTsCtQ9P4KLqZSPnNFAdUx4si92JUmZOU+gyexis6
	Yh+oaQwpnbZml1ze066UmB4N6cbI8ZIOc5/r5JfkPzmqsc0OTLuZClkOPEG30bpECh8/5JVzrre
	MFzA+Exwjq67n1m9PnQevNtzkt2ru8TzCVcPoHOjzSOH93edyqBLYd5LslHBau5nHpQKVSrTbMr
	4qjN8tQXo9WBALFC7zQFy8ItTWNRcgDCTAOxQ2z/CM/Fx1Xhem07cIahKyRTtExQR3XeuQ639VE
	EMdRY4EIMmkVEyaCTBUjXHiDm8q6OGEO9ht6SnHxtf/ISRa6v2xSrFfwRL331rnRAnvKH1/IYz8
	hGYu6+6qIhO5WWeJmiJYI9aGXH3OxXEEEbPYjUnWiMjE3IxwxGciE8VUSgMJUy7KanydUU8nsuX
	9LwJaZYAYtik83Qi7cz/fQdZOIYj8I
X-Received: by 2002:a05:6000:26c5:b0:43b:4dd4:6847 with SMTP id ffacd0b85a97d-43b64277e3dmr3805558f8f.26.1773999330463;
        Fri, 20 Mar 2026 02:35:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c7fsm5405243f8f.23.2026.03.20.02.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 02:35:30 -0700 (PDT)
Date: Fri, 20 Mar 2026 12:35:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zile Xiong <xiongzile99@gmail.com>
Cc: gregkh@linuxfoundation.org, ovidiu.panait.oss@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: axis-fifo: remove redundant comments for mutex
 fields
Message-ID: <ab0U3jlEF-hw9ktp@stanley.mountain>
References: <20260320044040.21149-1-xiongzile99@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320044040.21149-1-xiongzile99@gmail.com>

On Fri, Mar 20, 2026 at 12:40:40PM +0800, Zile Xiong wrote:
> Remove redundant comments for read_lock and write_lock, as the
> field names already clearly describe their purpose.
> 
> Signed-off-by: Zile Xiong <xiongzile99@gmail.com>

You're not wrong, but this introduces a checkpatch warning so we
can't accept it either.

regards,
dan carpenter

