Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9D1340411
	for <linux-staging@lists.linux.dev>; Wed, 10 Jun 2026 17:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781112638; cv=none; b=Ha5CQ0ln22A9f2zldGKJxpGFa/F2y43OvOOSx4jCpsQTOBpz3JdVPkp94f2b78hiq1wo1oxfI87wpvhE2KkdhK1YOEJz8qhGZTfgoopEn/hF9ZXOs5ce3rKu3IjXdjzo+6r30y0b2MWo8+4axFiaidUneQEN5X//fCDPlFkzYpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781112638; c=relaxed/simple;
	bh=zPhq5BCM5awaCIsPltgHdGoYC4FaXu8zHFWJXB+T6XQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K8RTvZTzPVmaNR2tIL49kX8Sju7IUKjb1J5FcIfHfaxEqu2STLzkgfhmX8aT/JF/fdZc+RW7q1jh6M38cLaroPs6JdDQmm4tfdgr3JHKwC6gMg8PfzTJA8g/9iC6mUhhceM6ug8Ny9dGSS1u6s5QaL5YL0vD3RQsmAuPaZaEUFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tumelty.co.uk; spf=none smtp.mailfrom=tumelty.co.uk; dkim=pass (2048-bit key) header.d=tumelty-co-uk.20251104.gappssmtp.com header.i=@tumelty-co-uk.20251104.gappssmtp.com header.b=U0+76Ay7; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tumelty.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=tumelty.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tumelty-co-uk.20251104.gappssmtp.com header.i=@tumelty-co-uk.20251104.gappssmtp.com header.b="U0+76Ay7"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45ef1629ff4so4928589f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 10 Jun 2026 10:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tumelty-co-uk.20251104.gappssmtp.com; s=20251104; t=1781112635; x=1781717435; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qF0nj1DmfNyUCwYCsGwvh7q/89LjA566cDgCp1BFT1o=;
        b=U0+76Ay7lF85KpaNrWDis+c+fIP7jMzR7LKOOoFN9fWLMjBfXLFeBVPz6htjhnRc5O
         zgRz3VrZL3M4E4nV7stgEwkgnQ2H8eX/zChkf4fF+LeadfJ4Dus371O1c/vOCLGhIRSn
         5gLyLKtGOa6j53QQ7qvtNeqtS0ucSXLXIYIw+gzhdiDWqt+iYMc4KramMg1mMEpFNQQi
         mI/H/WAUc44VFyK/ydA4rhaCwvgHpdeXVj3QRaltOvSaA1Qg/dqq8Z6Lhxup01gpZg2+
         +N2S48CsmhHf9UtHKLepgDEyu2s3BUQIDrJaZWSosRWKzueblLfpm2QIySgFgZKEcbuH
         hgcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781112635; x=1781717435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qF0nj1DmfNyUCwYCsGwvh7q/89LjA566cDgCp1BFT1o=;
        b=arXFH7b1uF5pDsE+doQKwu4JpCaFeM+ocZjygUyon8cVteVZQvHFyfrJfk8+4NkUco
         l0iaJ9+w2OjVOt7B8yEp7t2KfV+gaqQqDNrqr+fug2artCzYtXJb6ZQBzhvd7mp1nh3S
         fCz3HnRinh/d/1ybVQ59VfZvl1b/lGutWcvrcYQ9kZdTH5bHY7lL7Dg1nfInTI5uXMQg
         zp/ru3hQIBj7OiD6VrKUVwVgz9f6rEQ1HZw7OUDxSuh4OBfbfLdCKhMIcS+B/jKYU2Ys
         ro34hmTFSPyI53037DZRuK4WXqa/4+3GUM8MtqktvlJ0x4S9WBwiD7J3h/4jOMlDG8iZ
         2N7A==
X-Forwarded-Encrypted: i=1; AFNElJ9M2FyOqZjRfSH7KjWOTykyKuaFE77neMiH31xIDL8KYbQlHwFqyFgb3uchQh3mGhbRNDqYDA+DAEagb5ux@lists.linux.dev
X-Gm-Message-State: AOJu0Yxv3rpYk0gVNKv+M6Ka3j+oLGPmhnqXj8nnRPxgFI3u8qEGKibj
	NHAbJtbvS4SfcEJOwKeFTkuYu0hjQ229BKugcntgptNkNsxsXxDGUCHgtxLmfHj8WWU=
X-Gm-Gg: Acq92OF7fIszbtS285bPSVyR4/LdyW6OO4wF4DcqxTl9U1noxYnPSfKpCYmLqcQX7zq
	5XmqqUBP+1b9H9apD7dpjSI5lIirijW1Lj87EXJuq3saj48n/0jqJXOFixqIS3pDHzga/caT1IS
	G8BKAKGPxlUvGGBv//WM7ZxT3+jrGMAlkIK0tFrY6HPqx26vlUPahb7Blhhd6rk+FALwBsoS/4W
	rfKRG0dpsWVLUgE7jMfLcfISZa2ym6E1v2dDrocUv7N8d1v/+WocVrJvS+LAEYRqzkvN8WIwl/R
	uJRvUC+9xB2NBmySgcPl9FRdq0ZkQYjwnRz6+zIX/WZm14xrwiAvF4xu8gp4GCqNYGs2L8Pu0hx
	NY9f1CMAB9DbaNYr6Ipd456SubIpU9zdu4iDOZChfc/ZCxDZ/26RMhgEPplk8h7PkOi70wpnYr3
	F/jTNlrLgwdxlZWyJzPFltE7J7v/duiFnhGg==
X-Received: by 2002:adf:fcc6:0:b0:45e:8866:e58d with SMTP id ffacd0b85a97d-460302ed4c7mr28947262f8f.11.1781112634524;
        Wed, 10 Jun 2026 10:30:34 -0700 (PDT)
Received: from nixos ([83.217.168.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2f67c6sm70765203f8f.16.2026.06.10.10.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 10:30:34 -0700 (PDT)
From: Rhys Tumelty <rhys@tumelty.co.uk>
To: Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rhys Tumelty <rhys@tumelty.co.uk>
Subject: [PATCH] staging: greybus: remove unused macro CAP_TIMEOUT_MS
Date: Wed, 10 Jun 2026 18:30:26 +0100
Message-ID: <20260610173026.1105803-1-rhys@tumelty.co.uk>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro CAP_TIMEOUT_MS is defined but never used anywhere
in the kernel tree. Remove it to clean up code.

Signed-off-by: Rhys Tumelty <rhys@tumelty.co.uk>
---
 drivers/staging/greybus/authentication.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/greybus/authentication.c b/drivers/staging/greybus/authentication.c
index 97b9937bbdc1..d8f2cd43201f 100644
--- a/drivers/staging/greybus/authentication.c
+++ b/drivers/staging/greybus/authentication.c
@@ -15,8 +15,6 @@
 #include "greybus_authentication.h"
 #include "firmware.h"
 
-#define CAP_TIMEOUT_MS		1000
-
 /*
  * Number of minor devices this driver supports.
  * There will be exactly one required per Interface.
-- 
2.54.0

