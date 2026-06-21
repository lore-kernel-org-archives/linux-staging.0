Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27084339847
	for <linux-staging@lists.linux.dev>; Sun, 21 Jun 2026 10:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782038558; cv=none; b=ikfKjFPUJKMm4MgLs0oE5ZJOFeEfcyLF9lZikjIl9xW5NQPhoCJn7fK2js5Z+gNOwfSkRhocUJTzUHkwWrt/luEcGzdqOPsdfwhHoshR7t7rFB9PJMgvHfGp+yi7UpER4iz1HWOu6nr/RWYhp8eDwNLfY0NRdWcJzESJXU/9urI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782038558; c=relaxed/simple;
	bh=MwjLSZlT3EKUMKJvVmNPJ5pLQ2tlrh1fNgUMO8VAGTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sOxFOozGiiznQ8zjy49V1cXB4zYDBwRdFre2Bil1UTUNo2HvPmNldTg0xGAsfQ1Ub2UXXagNZiV7Z/Zz3Ezq2efLojY49LMo+E4urFzBIKZppl/1yDDrd8Wl+mfDtxCPOhjHzv/GJpCGG1a1mugdXxMFm744HiY3TwmUhfSEY6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J3PnIxBZ; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J3PnIxBZ"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso23110395e9.2
        for <linux-staging@lists.linux.dev>; Sun, 21 Jun 2026 03:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782038554; x=1782643354; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eiVg9nQcRty4EufZGY81oqcohclJQ5Ud3fQIigAEFmA=;
        b=J3PnIxBZwz9M9V+4UdjHTwkVIVfDzszMP3d7IQEavZFAoxC90mb8btGa0pIeRQD6yc
         adzgjFoSrl7zNQBtU3ghfDmabtZZCbqLQr5EN1c+Pjuksulsj0lLRNBZD/yCof/WKzoW
         727/oSfCaBUofgCEvzVSwCN9uTZU0gk/ekd/NLevzFYg8HYSaQXDHBv4NqpT3YkFvIkF
         8jTfn2QUWPws+nA/pOEtFOAqN7oE7yR1uTdkTI8VhJVxOt0T19kz2Skawlc5ePzqwlMQ
         g14mhrcOrZAWmRRNWeZEWz4JApVpGJzYpWPIHZhvpjc5L5oWx4TO8Q6x0ll0Zk4Hyq60
         9D1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782038554; x=1782643354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eiVg9nQcRty4EufZGY81oqcohclJQ5Ud3fQIigAEFmA=;
        b=lTh/YiW0Wb6BIhMw5LmpQhdEGrTtZl1yGqfzj8Ki/nguXLbxqUa/Nl5n7m0UXxfzYf
         mIH+gUwtK4PNrgDYZ//F7XuwUDwaRW2RK8TE2WiIluCwU88LZdQhf2iQ5c0LO22pfok/
         nXgMq9q5ZgCEosETGaeGqv/OogIUsbD5d4H4uHlr1nBDLPJVoZNQZDwcQdg/r8FLfhZm
         hWR/fiynDFUCMN5xmd3LrPktefRdDaqcOTW9pZzpbuP1FPs+9i+2DivjBdok9AXrapx0
         0HKaMuBiPZ9bs19Fv5AdA73DhDm1XTgH8a9rPopXcPUz73ogXI9CWILlA93IHFA7Tjdb
         Koaw==
X-Gm-Message-State: AOJu0Ywwm4NzemCrwsWBuzagBOIUkBrj05HfK/ZwyZd8IZr7Z3t1ZS5s
	Bic72GTFFbNnL37p0daWveuewQZFD4VH6jjO7Xb85NERYlS+EqGeiVX6
X-Gm-Gg: AfdE7cmCItIBdhXWQtUpfOsmXaXZckf30XnHgxdp9FbreaOzKTW7nWQ3EoLShIfKCO2
	Uf4kVHocLvJiFvAt5cutu+stviTceA3qE0UG9WqKQ1AttC/q2RgjTODJkZ1Lsstxx+m7QoSedh9
	8MRu6MfOaxnRDaq5fJOLb6A1W4KLT1Q2dRGwnCGG87gR24xLyrG95OSDm9OpdlzUmQS/9UbyT5l
	hoXS0Fwxg210/SEvJDwsJzU3sgmGm7K7X2y4rW0g8xauc05M/idam7aV2dCbxwmJV7PD5qj8ILB
	QDE1/S1a7bAIHFEqybheuKRoWV9Rnxigtv26Peh4I+2nPrWBP5S33MzfDJqJCjVncLsj2z/RPz8
	QALfFKqqye5eq3rKK1hGAPZQZqECy137zhtPtB3ZJ8WqYMbpAhUAF/H/8ICaafX7B9YlqfHk=
X-Received: by 2002:a05:600d:6402:20b0:492:1e36:1fe9 with SMTP id 5b1f17b1804b1-49240eb56b9mr121305485e9.37.1782038553942;
        Sun, 21 Jun 2026 03:42:33 -0700 (PDT)
Received: from fedora ([212.253.214.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fc47720sm340690915e9.0.2026.06.21.03.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 03:42:33 -0700 (PDT)
From: Serhat Kumral <serhatkumral1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Serhat Kumral <serhatkumral1@gmail.com>
Subject: [PATCH 3/3] staging: rtl8723bs: use usleep_range instead of msleep for short delays
Date: Sun, 21 Jun 2026 13:40:58 +0300
Message-ID: <20260621104058.7408-3-serhatkumral1@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260621104058.7408-1-serhatkumral1@gmail.com>
References: <20260621104058.7408-1-serhatkumral1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace msleep(10) and msleep(1) with usleep_range(10000, 20000) and
usleep_range(1000, 2000) respectively in os_intfs.c, because msleep is
imprecise and discouraged for short delays under 20ms.
This fixes the checkpatch.pl warnings:
WARNING: msleep < 20ms can sleep for up to 20ms; see function description of msleep().

Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 89e41c26e..5e41f518a 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -986,7 +986,7 @@ void rtw_dev_unload(struct adapter *padapter)
 			if (cnt > 5)
 				break;
 			cnt++;
-			msleep(10);
+			usleep_range(10000, 20000);
 		}
 
 		/* check the status of IPS */
@@ -1086,7 +1086,7 @@ void rtw_suspend_common(struct adapter *padapter)
 	pwrpriv->bInSuspend = true;
 
 	while (pwrpriv->bips_processing)
-		msleep(1);
+		usleep_range(1000, 2000);
 
 	if ((!padapter->bup) || (padapter->bDriverStopped) || (padapter->bSurpriseRemoved))
 		return;
-- 
2.54.0

