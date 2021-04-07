Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C8A6D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 06:36:23 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id kk2-20020a17090b4a02b02900c777aa746fso764578pjb.3
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 23:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NKhEC0n0+HHz2/kqzUxi1bjRR45zn9PJxgcyMxxcHD0=;
        b=lygCHTNwZJDmCnOGSnyS9lEPmMhRONQKdZ1ZE0u7OaH+tfgDKVRJ40Zdz01VUkHOQJ
         EUDhqvAMjHJv+mgimYY3R6/YM6MHssvn7nn0jTy9eDw7v1JY2gs4x5kUNUALDq7DXwe1
         wFOB7B9RbtnSO7hl0rcRS2mSEp0R+2CpDGNJvNJTUYfbR5jGdrrcOGNGFq50OBsLUG1f
         rJeQhKQnSXwJSAsYQNzZFChA3nWWCWecTHkZL2tjsYF50Uv2bCc4teVKfwi58AlTjkhO
         MYkqtRpKBXSMrsGuuLOYIRKiLLb6rAXkGZVAfgSXsxBWDkRI2DlDFl/DEDbhTxDJPEu0
         v9nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NKhEC0n0+HHz2/kqzUxi1bjRR45zn9PJxgcyMxxcHD0=;
        b=IXfUZjpJjAlPBF/qYPXKUleLRCOuAaELpgfPBqYOTq+gyn6C2pPuz3iYNem7L6kAts
         QSCv1LTrFGI4LSxNnuDCa4VK//fY0mXt+2XuTwG7PdKZyaDBmLLTi2WTTYt5LDx4ISGx
         fiO1NhuqBsA/R6Yuk5Uzqpx7maDqXgrvEihCvxHFvu5gyNWYES5ENAsiexQzpY/8w5O/
         NKA0b8V3k7iwHxLak3jIch+rmpfiEbqL0HwQHgmtWuipl97nB5Xy0GCGCggQuD8iI5s+
         x+Gxq8ftXIf3eRw8NyxDZwQeVRCpu2vQPc/jZAXOyLR+VsKVgtO99LBy3rdDYDkkzRhA
         tkUg==
X-Gm-Message-State: AOAM5334HieuPXZn8lf/iXu3SuXGtZptjxi6akigo3yfqyBVjjuhwCQM
	xrVCrjS3Y2sdtYYupqum6+o=
X-Google-Smtp-Source: ABdhPJzjCrD9VkJdexxuIEAc44r4zfApwixmcFjRguF7fpRsP+5+wqpx2AuN60U/CklvcU2Q4Hcbvg==
X-Received: by 2002:a17:90a:7f95:: with SMTP id m21mr584566pjl.174.1617777383574;
        Tue, 06 Apr 2021 23:36:23 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id f135sm20247563pfa.102.2021.04.06.23.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 23:36:23 -0700 (PDT)
Date: Tue, 6 Apr 2021 23:36:21 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/49] staging: sm750fb: Rename sm750_set_power_mode
 function parameter
Message-ID: <39375dd8cf48aabdc30c6bca67adc38887fd03cf.1617776878.git.pavle.rohalj@gmail.com>
References: <cover.1617776878.git.pavle.rohalj@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617776878.git.pavle.rohalj@gmail.com>

Fix "Avoid CamelCase" checkpatch.pl check for the function parameter
powerMode of function sm750_set_power_mode.

Signed-off-by: Pavle Rohalj <pavle.rohalj@gmail.com>
---
 drivers/staging/sm750fb/ddk750_power.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_power.h b/drivers/staging/sm750fb/ddk750_power.h
index 4756db1ccb9c..d43942d6a5aa 100644
--- a/drivers/staging/sm750fb/ddk750_power.h
+++ b/drivers/staging/sm750fb/ddk750_power.h
@@ -15,7 +15,7 @@ enum dpms {
 }
 
 void ddk750_set_dpms(enum dpms state);
-void sm750_set_power_mode(unsigned int powerMode);
+void sm750_set_power_mode(unsigned int power_mode);
 void sm750_set_current_gate(unsigned int gate);
 
 /*
-- 
2.30.2

