Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81CF350A35
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 07:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773646935; cv=none; b=CCOIZxCRE7POX4ktVsWIamlVVrBUem1KHdKibCtA3FD2cUVp52pMzOg6IQk/6PpehPYSZtqK5s1/t6Cpe76/UftuXWezws7WSphm+EA9ZTxksEiXLnH7m4IC237/zadP/8tpLT6Fvb5ix/kLbKuQTdY8DyLI4qn162UU2vo1FpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773646935; c=relaxed/simple;
	bh=FaAc+B1nYPdrCyBNRnJEU7eDYxSk4ST+r0OhJnpbQyc=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YW0tQ0Y6hrOSODUE9nQNfi1O8SHMO7jhugMDEzfwq77bYvcli3cpG/T3rxQmsNcTNo50bmfOJxtOng6DWLd3fgpdZSgN8uhdJkDxMEhpihaocWqDFc/u+Qr1xwFSHYTFiYnT9MEVhNgCqFvFf5oVM/0nFGbJ27wCOWvAqBUH5ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fC5bynUs; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fC5bynUs"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so37614485e9.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 00:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773646932; x=1774251732; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KfdA3fJWYtAoxokNTDaNIvgn8hvi0R/oaJDnwwTowl4=;
        b=fC5bynUs6iPmeqRrMDnj94XcKTD6XqI+0hera2cY6n80dh73h9ryQfIih5ENPtIdNv
         07suSAuww16wRS9TQ9zOF2tW35td8nSx9XNk4Dqzq7uoiUd0sHO+uzV41RI7ktYI5/ns
         j5zEHinLZCKLPYeRTSDuGJNW4z4+DodaxUsf0u4Ux3q8hwruPfLO/aqxI7yh0pKoiIAf
         5RTRkrWxgFoXwezvk43zMkmxxLLI1ItaqiLx2cT7qaU+vPbvuDrietv8JWzl8h/xKFdQ
         poQlmxJ8KmZ+o0simDgAeUIgA9YpHdyU50TH5duloI9eZ8HmX+xRNijVC4a+BZ0kHhHd
         Ll6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773646932; x=1774251732;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KfdA3fJWYtAoxokNTDaNIvgn8hvi0R/oaJDnwwTowl4=;
        b=Ysarzu+N3AfLgO1tyIcNF1huVhXL0j95t2KVOXaWxWIYAzKQcUE2nxqjzwVaMXXMX9
         Xxg5hZTSxotqQzWpPMDBTsjOkSr0ntBqDYfxn/vCr7JSdj78zlUbfuTSXTM9yaUEY3l1
         3GhxCkgK71X0fVUQIIjXw9NOwvceoY/vi70zyP5Qab/tZ9JUgsRtX827tL/KJdw9V/eR
         paI8FLECF1Irdpl94iMkVx1rPFpNUW3hXA/DnYFbKsj+N7Yg7aJIUYV8KjwYl4PbvfIZ
         Sbu/Y5zKrc7KigMKyqpq/q0DfUfReqv/JrtbOZycneLdyotCwkeIRB6DoPX04PYBHH/5
         xTQw==
X-Forwarded-Encrypted: i=1; AJvYcCXkvreXJV0nMmKo8lSFTKZDdSWIyrTJQF+5qSHGuftetr4nrhBKiYJvp5Qg+feDRQLkUTgSARhz0HMxEYNN@lists.linux.dev
X-Gm-Message-State: AOJu0YxCzDBMpHHgehc/hXJYn+eR5sa7UCujOHc2Ox/3+1MWOq+oUfeC
	3JkSANgCXDuEGHzAY7bXPZPWeKReA1DHK5Lf0he3dmbel39tUn10B8T4
X-Gm-Gg: ATEYQzzKw07CrPWawaxTiivWa+7R70CsR2YS5ro4s2YgkyUD+CRarGZFb4nWEWyYta7
	wBTmkk7RtxgkW2BNwOMdawFUTSb748LnIWG27tHcCusXNoB0rU1aYZc7gPXet+8jjkopdXQokRp
	Bu51p4+PeIc9RVh6vZPwcWz077JFXTvwpIU0wjSdQsCXF3yQX2LDfp6r0UI9Ege8t3gHyh4uBLG
	il8snN/vi3pUBE78nQELmnmpUr5RwoY7txJCkGKx3oX3wjpDr1cjXA81mUleWnlswboVDCwEw3O
	pDGva5ySbgnL1BvU7KuFTtjcV+FsKVL0wExBZHLMjwcmvgrMhDk7+zWOLnM1dwh5yYWAVcUC0pQ
	eSc8fzdNtUU0dm5zL5gO8odE5hti/iLtgWv6dv4RfWeb3GxTp/HJUqdAclNOhAhX6O5rxzpVFB1
	jO6V9zV1G7hFQBRZzv9htYirV24mpJ
X-Received: by 2002:a05:600c:3106:b0:485:3ae3:b394 with SMTP id 5b1f17b1804b1-48556711ec9mr223828535e9.31.1773646931869;
        Mon, 16 Mar 2026 00:42:11 -0700 (PDT)
Received: from [172.18.0.1] ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ad1e4esm500719945e9.8.2026.03.16.00.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 00:42:10 -0700 (PDT)
From: OaroraEtimis <oaroraetimis@gmail.com>
X-Google-Original-From: OaroraEtimis <OaroraEtimis@gmail.com>
Message-ID: <495a2eb6-619e-4ad8-b550-678f7334819e@gmail.com>
Date: Mon, 16 Mar 2026 15:42:04 +0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v2 1/2] staging: sm750fb: Replace busy-wait loop with
 udelay()
Content-Language: en-US
To: gregkh@linuxfoundation.org
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260315232042.231620-1-OaroraEtimis@gmail.com>
 <2026031626-semisoft-attic-8b37@gregkh>
In-Reply-To: <2026031626-semisoft-attic-8b37@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Greg,

Thanks for the review. Sorry for dropping the historical comment in v2. 
My only goal was to fix the -Wunused-but-set-variable warning and 
prevent the loop from being optimized away by the compiler.

I will definitely restore the comment.


On Mon, Mar 16, 2026 at 14:11, Greg KH wrote:

 > How is "2" the same as this busy loop?

It was a rough estimation. A 600-iteration empty loop on older CPUs 
(~500MHz) took about 2 to 3 microseconds.


 > And why not fix this properly, as the comment states?

The comment suggests writing to VGA ports (0x3ce/0x3cf) to force a 
delay. I didn't implement this because I don't have the specific 
hardware or datasheets to test it.

I was afraid that introducing direct VGA I/O just to fix a compiler 
warning might cause unexpected hardware regressions *or compatibility 
issues across different platforms.*

Given that I can't test hardware I/O, how would you prefer I handle this 
in v3?

1. Keep the original loop but add cpu_relax() inside to prevent compiler 
optimization. (Safest for the hardware)
2. Use udelay(2) (or ndelay) and restore the historical comment.
3. Migrate the driver to the standard i2c-algo-bit framework (a much 
heavier refactoring).

I'd appreciate your guidance on the best path forward for this staging 
driver.

Thanks,
Oarora
