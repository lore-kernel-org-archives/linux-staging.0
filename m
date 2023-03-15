Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E611953AB;
	Wed, 15 Mar 2023 15:35:41 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id x37so6572745pga.1;
        Wed, 15 Mar 2023 08:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678894541;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mH9snH5oMnk00V9V22sRI9X+SMiczhAu4ymIdyFHzvE=;
        b=pKIkOUEY5+QPtipzidTl6zflUjml+sBj2vU44BH68gsC5l+6sx4W9F02txa37IXK6o
         f20pvG32xxZx1xpfZyP00sZDlZjeN7CR2D0rlJigrJ9biYClE2zjWkxKvUvsfxktNpaK
         NaV/8pt6kja+DcehL77wJcdXAbyuCsTxkCuuTSGfHdpEOKkU0NjkB0DaZcejP8lXhPDE
         TyFjm+ZjMkDTcqmGWUdB5DtQsWuvx6vUxe03VLHyyogk6QsrcONjkZ9E/b9vE7K1iWqF
         HrrN1Bq4PelTAT4CTE0Ag5IOlQuM9jn51+2HW+L4gfI7cvIfEQ5nh6u/qwFRVmHH1XQd
         tyzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678894541;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mH9snH5oMnk00V9V22sRI9X+SMiczhAu4ymIdyFHzvE=;
        b=UYqCmLyRlFqVTbr/cuqmGo5OUUtfu2sutnDWXxRb+WcwvnRVJm8tngyYQsPKUkeYXU
         YVwmuI0nkinBKY4rsPI/Sk1xvUfbD5k3daKnh9b39InS2CoekxaaGFQr+vNBNptQmGN/
         JGgYFx1qwYZGQVE1EdgrKqCBZ52wmtce454senR2r6Q2e7XhhFyj43yUA9rLLRr5Vbjp
         Rd4eohni4E14qpt0MiZjjdtsUeag3G/K2Hb3Aqe1DYfK1thY6T+QQ4i7qGFcarHp9lih
         jKIZCqTX42TY1eePstg+vczaWcjnDWEhqOHDnTIi+DO8xQegWorMNlHG5eVABMdcvxdO
         DuHg==
X-Gm-Message-State: AO0yUKWSWNQEdrSnwygMl4tK2vp7+23gNGr5csgaMOHxtfBUXGKBcUS+
	7Z5P6Ft4JWlqNvicUk+xMD8=
X-Google-Smtp-Source: AK7set+xtfNe2lHmhXv2MbjVzVqbM1qWhNJYgvDoVDUVJpw7t+tLv5+w0IcwqHOHwpx/X23tCM8M8Q==
X-Received: by 2002:aa7:8f25:0:b0:624:2a11:760 with SMTP id y5-20020aa78f25000000b006242a110760mr10247348pfr.30.1678894541280;
        Wed, 15 Mar 2023 08:35:41 -0700 (PDT)
Received: from CloudiRingWorld ([60.188.201.163])
        by smtp.gmail.com with ESMTPSA id u19-20020a63df13000000b00502e48db9aesm3461395pgg.53.2023.03.15.08.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 08:35:40 -0700 (PDT)
Date: Wed, 15 Mar 2023 23:35:37 +0800
From: Kloudifold <cloudifold.3125@gmail.com>
To: Alison Schofield <alison.schofield@intel.com>
Cc: teddy.wang@siliconmotion.com, sudipm.mukherjee@gmail.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: sm750: Rename function to avoid CamelCase
Message-ID: <ZBHlycBoZ0JRwHZm@CloudiRingWorld>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alison,

Thanks a lot for your help, so if I send my v3 patch, should it be like
below? (Philipp said "please make the Subject more unique", but the
Subject could be only a few permutations of very few words, I can't see
how it could be any more unique.)

Subject: [PATCH v2] staging: sm750: Rename functions from CamelCase to snake case

sm750 driver has sm750_hw_cursor_* functions, which are named in
camelcase. Rename them to snake case to follow the function naming
convention.

Changes in v3:
- Add this changelog (Philipp)
- Move lkp tags and link to the correct location in commit log (Alison)
- Update the commit msg (Philip)
- Update the commit log (Bagas, Julia)

Changes in v2:
- Use new function names in call sites (LKP)

Signed-off-by: Kloudifold <cloudifold.3125@gmail.com>
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303110849.X24WnHnM-lkp@intel.com/
---
git diff message
---
