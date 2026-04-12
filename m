Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080DC30E835
	for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 14:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776002803; cv=none; b=lLTL6DuAL8aSYgKeHzZJkb3Bg/ZYVwN7E/qYc3qxOMCoEpagwqr/6q80WaoXWTZ8PjHC89xUVfJtCg5Ni0s5wsaGsAE3f6Dv9UzVFw0cugohxDNVCFdo1T5ig+UwoigMJ+QZkdPwE2/Mu3ZNgaHCLhfriN2cBLArQYnOR7zlCuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776002803; c=relaxed/simple;
	bh=qM6YJ53xNVzXG/PrBOuOXVikaLggFljOKKHluRxC+88=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AYqIifHAWgaf9XCjdz/TKiya79K4GIx1hFCKbB6hmOdKP5bWkg3t6g/rk1xxThPkf8MeeawB7TMPlMnCVxEladN15fQ7S1ScAzhR5ELANUo7ivJRDTlD3gl0RECzpRzzOaWbOv/bxFstpGdYBqWVuqIaEsHKpV97ALvevaLtnmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YrnOM0RX; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YrnOM0RX"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35691a231a7so2319540a91.3
        for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 07:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776002801; x=1776607601; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aYYlewohB0JAi3ANrfi9m34ZEoRc/crJvBD2FBn8Ras=;
        b=YrnOM0RXEKL7Wqxa0MGcVJk7/ZPlfFxJJQ9ubZ1STbUBt+AGOB05iBEh3kCMJNc0w1
         D3AU9aICl+oBa5HXY9yQtVC/aqgz1GctUTzli2SYUw5o0TjgrKyjQI84Wg1xUR1Y2VUa
         ryV5U3w4IWWqfY6HuMi0eZk0vWLqE8s6kFdjiBwz7lqbqyPPMk7dlafYHMFSV+XMMY/M
         EHHnecTN7Xosfh/yJ31WIbZw5AUPVAlp/K4tnZgB/K23JKTQSS6S1jA2wqzh0vyXg+gY
         acp9i4F8t0C7prJb92M4E7Jg2htgRWl9NmRL+ZU0VFYcVxhl9KtFkPsPH+BVBi2r8IX7
         C5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776002801; x=1776607601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYYlewohB0JAi3ANrfi9m34ZEoRc/crJvBD2FBn8Ras=;
        b=olJ1Y1UxDragRKyGnXIz1rsqksQPXNu3PGyqyum0WJLP8oPfN0+ddp0p9J0sOpCL48
         jiAGJ1E89RvsvVfkYqkIFdmVF+WxnQ1DEuekOtXjCjiY3+BEv2RiPKabgJuVkQiCKVwc
         JW2XO5vs2rttkr6RfKb86vXmkfyJLV0hWqfbBBTThtQGMPIU2vlRDqJcYJZkKN0m0x0H
         SwPLxClBtrt5UXoGnP1TlwfT/qVU+NI8P+XR29qGjTfGQq7ba3sxW6JaUik+qR6qZHTo
         86ZRB2748unnOIxNg6Hr4TTTHrs1Zkq6x7GGkkKU44rrqu2LgNkE3UBiUxhPwSCYq0q0
         MX/A==
X-Forwarded-Encrypted: i=1; AFNElJ8iGLt73XUL2DiJvSKcLrPQkc75/3YcXiMCQZqZPvTQhPHqVNV9VPfOEVMZnVw0y7flcY6Ok0RBl3fas4Wv@lists.linux.dev
X-Gm-Message-State: AOJu0YwEFDnrZpGmwALQBO4Ma38tmHLjGGRE50EDDxmmit9CICTV1LlL
	QEHwx0lwXgKHTQuC/xs8pUw999nQk2rA36/zpQwA5yYwEdT9X8s+d+vU
X-Gm-Gg: AeBDietbQtthCZ+8awti7XJMNN/VyxGfEliz6DeFLxupNVoAua93mIi4tcaNDyZmNcu
	pdlQcq+M4oyj++ehum73CdOfdPinoQEmZiZLQlHQtnbgbrhuGwQeotL0iRPFka5povkcFK16CaX
	smM4lers7UXGufQlO2RSRgrrQHEyYBuc15uhYu7W9uql5euo5yxMAuiCmmMjzEKMMlGn1qA04iw
	41MPiBFbxa64wDq/xc+yYW/lddwdgobLw7amd/zKZPAr+mjQ/aNtOJ7CO8BLePzhjDPh+Z+54vG
	c/sXBBjnX9JXoGeyP8XbS1ajmK0a3zTgiOSSOcWr8Uzg4+R+so7CbnmbK8Lx/+hT4hThMEhx7jz
	LerDwm78XDwIjWn7BJB4hX6C/qNTl+/c1DkJAx3rjYTtpz2+ZHnwa68PHASuKC6t3Rq2VknL/dJ
	NneAGHvmuiYQVVGSIA2ZHvQW8Q01SuPQe3sJb5KIsLE0k1Xqb/9Fn3ZoT0xzDVBQ56dqb2SfMCh
	iYBuC1/4fStFWK/jZE3vYU=
X-Received: by 2002:a17:90b:4b90:b0:356:35a5:4a64 with SMTP id 98e67ed59e1d1-35e4254fb08mr10777957a91.4.1776002801225;
        Sun, 12 Apr 2026 07:06:41 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.113.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b45cbf0f87sm9362365ad.6.2026.04.12.07.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 07:06:39 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	shyamsunderreddypadira@gmail.com
Subject: [PATCH] staging: media: atomisp: remove outdated TODO comment
Date: Sun, 12 Apr 2026 19:35:41 +0530
Message-ID: <20260412140542.41911-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove a TODO comment suggesting a filename change for
sw_event_global.h. The header is already consistently
used across the driver, making the comment obsolete.

No functional changes.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 .../media/atomisp/pci/runtime/event/interface/ia_css_event.h    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/event/interface/ia_css_event.h b/drivers/staging/media/atomisp/pci/runtime/event/interface/ia_css_event.h
index d0c3278b0fd9..874331d8a435 100644
--- a/drivers/staging/media/atomisp/pci/runtime/event/interface/ia_css_event.h
+++ b/drivers/staging/media/atomisp/pci/runtime/event/interface/ia_css_event.h
@@ -8,7 +8,7 @@
 #define _IA_CSS_EVENT_H
 
 #include <type_support.h>
-#include "sw_event_global.h"    /*event macros.TODO : Change File Name..???*/
+#include "sw_event_global.h"    /*event macros.*/
 
 bool ia_css_event_encode(
     u8	*in,
-- 
2.43.0

