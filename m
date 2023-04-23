Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD5820E1
	for <linux-staging@lists.linux.dev>; Sun, 23 Apr 2023 14:23:17 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1a8097c1ccfso40819945ad.1
        for <linux-staging@lists.linux.dev>; Sun, 23 Apr 2023 07:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682259797; x=1684851797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6Rj1yv7n1B1sfzk8KaoZMeSwqJKYV0wulVNjWVVOWYU=;
        b=hBJy+FtMoEAZo8zMCKag/dNCLP8CU5676EocoCGjEyV4px+WfXVLKIWilDEicgEpl8
         5kyyFiLNNMpUhkUJqFrhcFBipodUiVkekklnKgDRgSbio5vYWqJoWn/Mfz04rrH91Ey4
         r3JF9qPJossUsR+k1QtgpOn6TNQsqofRDeWUgbHie2Nhe4GN8S4hBwppKsNoowLGQPk4
         9NxkvbP5vUEvH7mbxEEceb6SU6xR5qETcYFudISWyIs4lcULVdyg8je0QJHQ/mdjrHI6
         qUs/79Wn8DrKlCkrE6BOw+GcB91kWcyrumGbktTI4lS2vbbQ4lPAeiFbdB/pI1WzLB3f
         6RtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682259797; x=1684851797;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Rj1yv7n1B1sfzk8KaoZMeSwqJKYV0wulVNjWVVOWYU=;
        b=JapXDGP/Ny9oglU6P+zef4+Rpg8LEA0iVt2xk73n3ggJKDvtbsvJpnE9XwCJRuHSjL
         EVYvNUdqi0KrtBVZ90Q9w52fyuv9lcffIU6KVyrBugmmzIXTIeV1p5eUyWY1dSx/w92L
         rO1Mi2MtDUtl+T914S+Oj0CU/0gkpUQ8Yplh3OiI1DoiQ+vCJ9IA7rgElyXvdJeFktAn
         V4AfABmIz1DbZW3LcWmpUktALG+eyrrxVpVcUjHpZgE7NVYPN2xmHB70Q96n/zc+lzdA
         UT0PUfyqdVm+xak9omW3D4DLWtmDZrRe9PH8/yDUKkz8RwJF2FQt5EiVE5CKXRQS6Y+m
         lExg==
X-Gm-Message-State: AAQBX9eMGGfsoqcEpJOzDu6louOH6TGPbSxaghS4nbPdNrVc6lBf2nrN
	I5rRCvS9rmJDeY9dhrKyxZjAaweSfT4=
X-Google-Smtp-Source: AKy350bygPf9nrClagPjXCEBlejtnyuOj9PM7DG+QbqlLZLnO+AfkXGI7IQ6bV9pB6zHRW5snALPQA==
X-Received: by 2002:a17:902:ec84:b0:1a6:b012:afb with SMTP id x4-20020a170902ec8400b001a6b0120afbmr13547794plg.48.1682259796988;
        Sun, 23 Apr 2023 07:23:16 -0700 (PDT)
Received: from pop-os.localdomain ([103.251.210.208])
        by smtp.gmail.com with ESMTPSA id ik28-20020a170902ab1c00b001a6d18cb338sm5188532plb.2.2023.04.23.07.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Apr 2023 07:23:16 -0700 (PDT)
Date: Sun, 23 Apr 2023 19:53:12 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/4] staging: rtl8192e: Remove unused sens and max_sens
 from r8192_priv struct
Message-ID: <33ed0da2aa36058f7e88fc4e509ebf85d78cbf8b.1682257566.git.yogi.kernel@gmail.com>
References: <cover.1682257566.git.yogi.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1682257566.git.yogi.kernel@gmail.com>

The 'sens' and 'max_sens' fields in the 'r8192_priv' structure are no
longer used by the driver. This commit removes these fields.

Suggested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
---

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

