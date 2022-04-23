Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A247C
	for <linux-staging@lists.linux.dev>; Sat, 23 Apr 2022 13:02:04 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id b12so1911079plg.4
        for <linux-staging@lists.linux.dev>; Sat, 23 Apr 2022 06:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Khre4woLYilT8tveAUDnxLgWCfWTYawAOp3Qw6Vbe6w=;
        b=V9B10p01ZGdq6LHGd5D4HGD+iyqdznu0HGruOf1N7UZPXyWqsy0LXMoG/Yr2YbtaMc
         EteTED3+dCmSwdcv/PsrgGOjdnRXVW9AyJc6VIojI5ep/Bah9ux0KsDeGC0Ez/OzGDzn
         kG8X3i41cXyGQqGCgP68ng3B1loFsR4UtEmztopu+6lUpEbqJvK/j/rrikO3ik1OMdos
         llATQJV/2kieUYFKiU8joaeklWV4LKFTjdXviv2CddbTIsjermdNGUtvq+NzZjOfeIWR
         7Dm3ohEF3778sPxoi//GR+YxWYmgNHrWBZwDuGdM7WmOCsRss+ctWHXkWRoOzZioELpK
         ru+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Khre4woLYilT8tveAUDnxLgWCfWTYawAOp3Qw6Vbe6w=;
        b=qDeYwhCIvNQ/aR+V9IpSGUUG6iPPoiPlXf58rd1Zxu0wsYAFsO7KkSVZrvvTblzzgO
         tkOlP1mQErpcWDpqut4RhzRH+zVZST08PvzqIZiP/NFWczSKszYrk63ijHGfDy9l1ylu
         QYrLOGJiO1NlFGx1aUMorLZZ+7i6mD7MPiyuAAkd1BIQ1AtwQVato/sfQS1gOUpGWf63
         i/3wAQcj0DVn65i8OSAzENmJ/YhtqvsnjkYABkoAD6DgUX0W8JavND3Dk2XgKCozaEzV
         qfe6CW6OT4Arb2wUiDgJ7pJCLL4cBxptRPLgvCwYNGbXmaXLvBMrDwxw3gAeKftpJcjO
         paVA==
X-Gm-Message-State: AOAM531N2gqtvWFMeNwOc2qqWWpUMczvsE/qFffB3dTLh6akuJep4r+5
	2Texu607iigncvw+Mz7bsPI=
X-Google-Smtp-Source: ABdhPJzS05PktvkR89kpKI4KkRwHVRekET8JQTKfNTda4WRK6RBwU5X9P9yt02vDuGSNw6Fb2fy/DA==
X-Received: by 2002:a17:90b:4a8a:b0:1d2:bff4:b44f with SMTP id lp10-20020a17090b4a8a00b001d2bff4b44fmr21460356pjb.118.1650718924248;
        Sat, 23 Apr 2022 06:02:04 -0700 (PDT)
Received: from localhost.localdomain ([14.100.36.163])
        by smtp.gmail.com with ESMTPSA id c139-20020a624e91000000b005060cdff4ffsm5808994pfb.129.2022.04.23.06.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 06:02:03 -0700 (PDT)
From: Solomon Tan <wjsota@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@oracle.com
Subject: [PATCH 0/7] staging: rtl8192e: Remove unnecessary u8 and u16 casts
Date: Sat, 23 Apr 2022 21:01:43 +0800
Message-Id: <20220423130150.161903-1-wjsota@gmail.com>
X-Mailer: git-send-email 2.36.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series of patches removes unnecessary explicit u8 and u16 type
casts. They are broken down into 7 patches as follows:

Patch 1 removes u8 casts in assignment statements of u8 variables.
Patch 2 removes u8 casts in u8 arguments to function calls.
Patch 3 removes u8 casts in comparison expressions.
Patch 4 removes u16 casts in assignment statements.
Patch 5 removes the u16 cast in the u16 argument to a function call.
Patch 6 removes the u16 cast because the function parameter is u32.
Patch 7 removes the u16 cast from a function return statement.

Justification is found in the respective changelogs.

Cheers,
Solomon


