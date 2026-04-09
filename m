Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288733D9DC4
	for <linux-staging@lists.linux.dev>; Thu,  9 Apr 2026 14:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775745714; cv=none; b=oJaBjiISjfvpprOUYmGJZRqGHYdbBBLNFzm4aRNneZUbcUlHkgf+HpSH+AzUTYg5zP43JdBPBJSuHGOCdGMztmFDPaDGkdsbYr28HNY8dH4fi7Fb4tmCyXV8awij5N6JqVwkKgDYTfXWfv0CLTmou/GyFmwHA7urFhZW+qBWiog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775745714; c=relaxed/simple;
	bh=6p4QF9QphcGSUD4l+uqrzYbIS6kc3jd9F/UtB26ySvY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EPu6xNsIFtiJul8zNWRIuAMVA0jBYUrPUGvTLtN3cLrxl4aqZroQlSOxiMiWBmLQyOgJqgkOqJ/KD+yRtdCtZ8TaQEyS/RgtZpC/aPyMcdT2aoli27+n6Keh2kpmpoY6WPm13nNYyLjYMHoHxolU4qDWvh7bWjmHtqoo9ik0psM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L03CZw9h; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L03CZw9h"
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-12c15414820so590791c88.0
        for <linux-staging@lists.linux.dev>; Thu, 09 Apr 2026 07:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775745712; x=1776350512; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WHoVRK6G7QNLQuMnHul4V6G7GtbprndlSqKrNeZpyuo=;
        b=L03CZw9hvTHpdHano2ORaaO1/7HCaoTM/3JsSb8QpGgjjUvdIl0So+MSPl8CKsFRbx
         hq/5hrSy72ttjqlR+0rAc0175+P1scC3B0DY0EzhyuYOg+gxCBTDTZYpm5bRz/5mAYOe
         iX9x+xQmW06wQsxTzOlwHVgPdj4gi2/+Aci7xj91k4kMLOQd0SxTzjhw+pSbzsO6ki9/
         wV9t32cho7kKL1zSilHIcmHyXpXW2ZCJVeVYgNGnAa49P6DzVqbQCCmMjaImY1CSTodO
         d68Gi2/NJNyP4b8yPOkK6opbFYlHPohJJiUVCrxDFi4RLqWnVm/XTbPLrVj0Ut4ZM76b
         rQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775745712; x=1776350512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHoVRK6G7QNLQuMnHul4V6G7GtbprndlSqKrNeZpyuo=;
        b=eZuT3zMJiAzluLItTTIM6oCQibVRb5WuJMQxhX1mQ7rvlYFyJBaCy+2fEp/59ztelN
         wjewe68EU2czIvtErfAVoh5ClrUpUxnttlLfcIr03X24CxAK/4aZfh/afe6B1qg+0+7K
         QKIU8vhOisQBhArk54AXPwNPmMuy5Ao/sgjcbVq1rw3J1SmVKBuZaF+qmVLCQL5b6OnE
         /HzgpsfF/oFV09iN4btL4ge21kioTaO+dHJE5c3wZTa+skk1BuhX4UkipJsnoMsezlal
         Q9mIxeCW+If/vDNMBKtdFrTeINhylzLIopMN2VZMNexgQuPLj1dZK7jY6K0z5au4+lKS
         YiUQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0iKojJMtum2lKV9OJg4KXnzl3Lb+WpTopbLY22DjD4B745QsgRMqDvtRQv5PcrXGvoE5SiltL3Kae2em9@lists.linux.dev
X-Gm-Message-State: AOJu0Ywy09pojFB1iIbrDU2FJwjd49b1uHpaB0c7w+unQW8OiEjRFVpX
	LvYtIFHJ7goTh7CA17WeJcbOf5sjKcVK06j3fsNoS9IlzVh2bQgu3Y3DuEWual+b
X-Gm-Gg: AeBDiet4YfAXeYxYe7YrJrF02RqgaeZ9l/AQIwOniJ+jpOlLpkK8WjAey+drjZjA66i
	s0fRvUSGm4X4KdC2i1xfeWG1OXmzOSA0wYVJsQCRkvECvl5VIcbSQ4ilA+TYiGHWxfVg6nNDB2f
	24Sg8jhnzcuKrVUW163WujuxkmRk3SI67tbb9EtgvDYxcFUJD8H64B0Xlbdjew0Bncx6hqOpoUf
	TWSgli5e0HCZo3vhQo8WhcSIf6xrExi4mUMs4+HJCpekWeU5MvP95cs9ANFHCKCG8DC9LV7zris
	+dvUson5SQ1UQT8/z7OR5IsUXlFm7DLtUdkewlQ/jhVWuxq67mt44YDsyyiipYX18/qhB6DyY0K
	Ntz71bn9h8u4mJo/mbpEPUf1+K0/0BP1PX10L60tu9bk0RAvQN6F0NMOU/II+pQj5s8zQxTS/m6
	HZsgYthazeOtaMHLpqI55IcQSbtvsZogceHTswYQRFbXiWJDkFXXOWvFo=
X-Received: by 2002:a05:7022:118:b0:119:e569:f874 with SMTP id a92af1059eb24-12c28c2f6cbmr1557835c88.17.1775745712202;
        Thu, 09 Apr 2026 07:41:52 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c07a8703esm20363284c88.8.2026.04.09.07.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 07:41:51 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 0/2] staging: sm750fb: improve error handling in de_wait path
Date: Thu,  9 Apr 2026 14:41:17 +0000
Message-Id: <20260409144119.21500-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series improves error handling in the sm750fb driver.

The de_wait() helpers currently return -1 on timeout and callers
discard error codes by always returning -1. This series replaces
-1 with -ETIMEDOUT and propagates the error code to improve
error reporting.

Patch 1 replaces -1 with -ETIMEDOUT in de_wait() helpers.
Patch 2 propagates error codes in callers instead of returning -1.

Hungyu Lin (2):
  staging: sm750fb: return -ETIMEDOUT on timeout in de_wait functions
  staging: sm750fb: propagate error codes from de_wait()

 drivers/staging/sm750fb/sm750_accel.c | 22 ++++++++++++----------
 drivers/staging/sm750fb/sm750_hw.c    |  4 ++--
 2 files changed, 14 insertions(+), 12 deletions(-)

-- 
2.34.1

