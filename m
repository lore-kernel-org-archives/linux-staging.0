Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7D33214
	for <linux-staging@lists.linux.dev>; Mon, 24 Apr 2023 18:05:30 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-63b5c48ea09so4101870b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 24 Apr 2023 11:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682359530; x=1684951530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tfmGIk+2aJtglmQ4U+xotZJmfTGbg/l0yn8LVq2SGfo=;
        b=OarNsWC+fF4u+9Ooj0JuFEUiySfJdyWWMfDsKABx+8IhNqooMu67lLrn21b907pxSV
         HF75Bf7Sn4C9W9C1k3x7TXDy2bi9I8G7irqy81QbvEE4g3+COSbEZ9B1sWDFcgyY4/i7
         dfwu2ZtKN/9iv63Q8MJJlyXURJ9BWZQQac4AhCBtyCOBH2msn1kgPqtMjASeQVMHZmqd
         24yBO0+fzkcmstrvItioH7HPnbkajWjknDCCL/X/M188exE7W4VkOXotr9XqVPTJVq2y
         zvyRr3ag+sSVP9CrnTck5sWVuon1wX0N94pP9YEuPkk38AbfJEdqBjhcF/0bxcLaAFWJ
         wLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682359530; x=1684951530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfmGIk+2aJtglmQ4U+xotZJmfTGbg/l0yn8LVq2SGfo=;
        b=X0ybuFJ6stX/pXxk4V7iQhAJ9fNULREM62chxD4MYUyFxVf7tsMSUjylWqMlZFFR7Q
         tSqmsHEiiEyad50tq1NU7UeCQnOy/wZpzZ8vTf3RpeOnlLZdJ++HMHwi6mjqoSAw4EYn
         9x0Wah8ND05wEq9MkOhITSfuS/4Ef5CPGpbFvbRU1Z1U3D2w+77jMRBFlyhghrq3TWRL
         3j2HalKDV3IQG/aWv5/Tl4EB3vU6pEUEHZWAAqykixpJsqG2xSEg4DbvmTZDxnMgImya
         sL5oY+4fnD1Kj/yThw2Rf5uaCOk+jfRp7zO2c/Uv/t/FOYDvAP2S5VzFY8rWeIA0YyZn
         IA/A==
X-Gm-Message-State: AAQBX9eXSFLSwqLmtJ/la9DEzrtgFbQ1h47q4oCbd2tI/rT3fon0sGe6
	B/Y/ScSzAFzJai/Swrwnfto=
X-Google-Smtp-Source: AKy350b16pqAJrWOT+Sm5OQWm92N7XgAfn7JZrPjyvJrRp8bFYWR1qAMfjPUGAnZ3NPHUNtGl4kMog==
X-Received: by 2002:a05:6a00:a93:b0:63f:1717:b7fa with SMTP id b19-20020a056a000a9300b0063f1717b7famr17891664pfl.24.1682359529639;
        Mon, 24 Apr 2023 11:05:29 -0700 (PDT)
Received: from pop-os.localdomain ([103.251.210.208])
        by smtp.gmail.com with ESMTPSA id h69-20020a628348000000b0063db25e140bsm7666697pfe.32.2023.04.24.11.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 11:05:29 -0700 (PDT)
Date: Mon, 24 Apr 2023 23:35:25 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/4] staging: rtl8192e: Remove unused sens and max_sens
 from r8192_priv struct
Message-ID: <e117e958ada5695975deecfcd442703fd11bba3f.1682358035.git.yogi.kernel@gmail.com>
References: <cover.1682358035.git.yogi.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1682358035.git.yogi.kernel@gmail.com>

The 'sens' and 'max_sens' fields in the 'r8192_priv' structure are no
longer used by the driver. This commit removes these fields.

Suggested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
---

Changes in v5:
    1. Rebased onto latest staging-testing branch

Changes in v4:
    1. Split changes into patch series per feedback from
       gregkh@linuxfoundation.org

Changes in v3:
    -- None

Changes in v2:
    -- None

Changes in v1:
    -- None
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 08145e1f814c..ec9e454299a8 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -270,8 +270,6 @@ struct r8192_priv {
 	short	promisc;
 
 	short	chan;
-	short	sens;
-	short	max_sens;
 	bool ps_force;
 
 	u32 irq_mask[2];
-- 
2.34.1

