Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C63F71
	for <linux-staging@lists.linux.dev>; Wed, 21 Apr 2021 08:58:43 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id s16so36086072iog.9
        for <linux-staging@lists.linux.dev>; Wed, 21 Apr 2021 01:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=xfIthxn5Cj403Bm7HXQsSVRsL492qnjnUjshlFM6QX8=;
        b=twi2SJyu0c4uwVjzk7Az0V2KCvGVHwkOBeP9NFFojwX6d3hFIhiE2o7bw1PXaNSubY
         LfmuhdEspNZZ2uLN34iUEl9nOtoNd0pb3qngDijdcxjwHmR6u5gj0CypGhw9mod25xeD
         T28kHKMaqr/tgfFW4S5t2XibaoISJR8x8tR2/OltFJMHbb0eTATf1YldM7StvsGMxEo2
         c/cS7r7FQmzFiSNl1iyRHmK0taTj+WPE9FY6gVBMqwKjREifTBD18xr/K/YgN5SzPFQi
         0c0BonvZsNGMhjmRJ76me8Pf4XTOlZa2oCD4Bb8tpUqQVmQvnr6C4qy24AfL4ZVrT5eA
         8oTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=xfIthxn5Cj403Bm7HXQsSVRsL492qnjnUjshlFM6QX8=;
        b=JD827Apg9NVFI+gCOa+1vkCxMDddu1rGlCVJEavDUKSXdxHjKXopVbA/+dZnoH5Ult
         US4LgNNg8+WSdy28xT97D2fBJqgcLeS00cn7ezWNzDI9058fsXGGuR5vTmUUDxCj8cCk
         DqOPbgBePPU9TqbbAk1K1aNH1qRdiVdI4bbVUDEfSl3v0tD9DUDu8BVhrThAVBwwGK0Z
         Y6i8up1OkgRpu/Tt/UGkr+92TILrn+4OkWNvzkqg7e8gn00mawpvqxj8zBiD7e6uxkgL
         GP+Aa9mjH6utub7HedixD1vfwQ3MdCv5fIYzn7tVYXsj+ezvFB+B4K6MI31fkNtnAjuF
         GF4g==
X-Gm-Message-State: AOAM5318y8Ld/vspPdLOGks3iaRETYA/dPiYIwQXT0ry1Bs7kD+6qZY/
	aywlYXhpML1R5X1bhX8PaHvnxr4q/yOoaZuEXqo=
X-Google-Smtp-Source: ABdhPJzJ2ZLoN4FPZTQNk7lRhck8dMYSNqpvfpxPiiJocxq51UJvO3ntYsOAi6zPKbUhCdx58aBKk/0ZmYEQh2rRMak=
X-Received: by 2002:a5d:9694:: with SMTP id m20mr22497008ion.40.1618995522579;
 Wed, 21 Apr 2021 01:58:42 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Zhengxun Li <zhengxunli.mxic@gmail.com>
Date: Wed, 21 Apr 2021 16:58:26 +0000
Message-ID: <CACY_kjR9rvB3dZ9dUAoa9mEp9P=aiYzy7jW1w24t2RUL5OUNUw@mail.gmail.com>
Subject: Re: [PATCH v11 2/5] clk: clocking-wizard: Add the clockwizard to clk directory
To: shubhrajyoti.datta@xilinx.com
Cc: git@xilinx.com, gregkh@linuxfoundation.org, linux-clk@vger.kernel.org, 
	linux-staging@lists.linux.dev, michals@xilinx.com, mturquette@baylibre.com, 
	robh+dt@kernel.org, sboyd@kernel.org, zhengxunli.mxic@gmail.com, 
	zhengxunli@mxic.com.tw
Content-Type: text/plain; charset="UTF-8"

Hi Shubhrajyoti,

Overflow still occurs.

+static int clk_wzrd_dynamic_reconfig_f(struct clk_hw *hw, unsigned long rate,
+       unsigned long parent_rate)
+{
+ int err;
+ u32 value, pre;
+ unsigned long rate_div, f, clockout0_div;
+ struct clk_wzrd_divider *divider = to_clk_wzrd_divider(hw);
+ void __iomem *div_addr = divider->base + divider->offset;
+
+ rate_div = DIV_ROUND_DOWN_ULL(parent_rate * 1000, rate);

rate_div = DIV_ROUND_DOWN_ULL((u64)parent_rate * 1000, rate);

+ clockout0_div = rate_div / 1000;
+
+ pre = DIV_ROUND_CLOSEST((parent_rate * 1000), rate);

pre = DIV_ROUND_CLOSEST_ULL((u64)parent_rate * 1000, rate);

The rest looks good to me.

Thanks,
Zhengxun Li
