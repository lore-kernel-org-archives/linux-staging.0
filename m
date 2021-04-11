Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9075872
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 23:10:07 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id d10so7925431pgf.12
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 16:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uNZYWgEVoAuUntavroH02XS3fbZ6zaZUx6Qay4mZmPA=;
        b=bm075u2/6bp5bVTyE82skZrkF1AOKjM+JqwEDKDedP5L33qOMv0ZLYxIGzTQoBjblx
         pF2Ps7cEWAsuWuambPeMut8Ntx8AoPeqMNLZB57bTQibajGanlXSchky9OuZOecRHFv+
         bWRl/aT5qhXk72bOVNoPvO421tr/Nxo+4qRkTInOZEUQX4tTceaNXnrmMJdKruFBTEVv
         mUjeIoN7zFBLDgKNq7danLE0aD1rRSONXNieWzjTh4bzyeLrpQCD14YOKQC4jwN1q43F
         4/Z8zy15zokhw+SSrgIIbO3wh7LS2XKkP2p4Fqf/lm7d007K7CBmrVT88GxSlNfQcV+x
         wfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uNZYWgEVoAuUntavroH02XS3fbZ6zaZUx6Qay4mZmPA=;
        b=fKJdyhfHXd7OB/iiQXm9OCjpTVpJYGzVysoiKV7kMVIwKg5NCBmUxQctroW11qc54u
         UOgbCpk2oL4ekz8QE3LrNYacLO9WqHuVtPdLnnp4Sr6g1TDeAGgYy/6pPILf/xtrhWq2
         9Ajrb8FewfJrbHKg81RC0e+3ad1dr7BeN1dwTJ59oMSqrbHws4aHfgXuM62DyUVgTv4n
         CNbNI4mQCSR8TTNFxjqD+HX7MbDudDFJ5h7NBDfKGvH7uDJpD4S36/cds+tcvWgDaEP7
         VMA3ee91L0YCOQRn+B1BN+7F6PjJBFniqyDhUaXxLWHuYcpmUsof0CBVDBs5O6ZFEYKc
         HH6A==
X-Gm-Message-State: AOAM530gXvMBkaJeAdq30rzP6rakD0gCMn2mdWmmOpNIetvdOH3roG4n
	JSn8cN1WE+5ksvyMuH7vedw=
X-Google-Smtp-Source: ABdhPJywa3sKuTUwqu9f1bZGYbNYxlQ1tZ7AJDcS5PT2vWiwYTUDUlxxKPh04pcn7LipL9fHPEGf2Q==
X-Received: by 2002:a63:5004:: with SMTP id e4mr23507889pgb.61.1618182607156;
        Sun, 11 Apr 2021 16:10:07 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id q5sm7696619pfj.131.2021.04.11.16.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 16:10:06 -0700 (PDT)
Date: Mon, 12 Apr 2021 04:39:58 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
	tian.shu.qiu@intel.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: [PATCH 5/6] staging: media: intel-ipu3: line should not end with '['
Message-ID: <7514b0a9f6b0ce736de3c9d13ae2629d9e67f04c.1618180660.git.mitaliborkar810@gmail.com>
References: <cover.1618180659.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618180659.git.mitaliborkar810@gmail.com>

Fixed the issue of line should not end with '[' by moving arguments
from next line to line ending with '['
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/media/ipu3/include/intel-ipu3.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
index 53f8e5dec8f5..0451f8b7ba4f 100644
--- a/drivers/staging/media/ipu3/include/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
@@ -246,8 +246,7 @@ struct ipu3_uapi_ae_ccm {
  */
 struct ipu3_uapi_ae_config {
 	struct ipu3_uapi_ae_grid_config grid_cfg __aligned(32);
-	struct ipu3_uapi_ae_weight_elem weights[
-			IPU3_UAPI_AE_WEIGHTS] __aligned(32);
+	struct ipu3_uapi_ae_weight_elem weights[IPU3_UAPI_AE_WEIGHTS] __aligned(32);
 	struct ipu3_uapi_ae_ccm ae_ccm __aligned(32);
 } __packed;
 
-- 
2.30.2

