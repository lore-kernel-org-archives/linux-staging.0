Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4F738236E
	for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 22:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792363370; cv=none; b=ex10J4GCP6INzCFwlOYQuMqNscrjsF9rXGSIAlzWGnUvOMnoPBGH73qTOZQFa2O2FLPJbsIEA7FzcUvjqYFb9j0ToEIgYtkEmSDFCk+YOJNUXI0Kr1NH1JckU+MmmoXNYTZcb/SOlhj5LzDPXASj3LS9NKNYDn/Z8L8xZxtWmQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792363370; c=relaxed/simple;
	bh=LLL8YnAyUQxPSK7+xdsfZLm9pB6HUgKQPfbKvkRhwDA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QBKEucKOojX2kBhOvanUR+yTqYe/IimrUCPSVBJQD955k9xiKx1v5e1xIZ01WdyP42bFLnh1CljFh3uIb3it5wXnhsDa8ybeL8lBhkSuLhV4GNJLp9+u9KGIaeoP8XPSn1oRnLfOsaVUOkH57MrtefJ9y8hFRBE0KDDFPZapMsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PdyMfspR; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PdyMfspR"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so15038995e9.2
        for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 15:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792363366; x=1792968166; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m1qlXxPCKnyZBMqZS+UI2tKQ3hqkztlpBKb9IkUQpHc=;
        b=PdyMfspRfTrtapIRztgcZ2MR21XQDuMZ/pRFA9NSiMJi6fNIAJffmc2nafSAYQb1KS
         KYCZN9/Ndu0a4hXzEuAXk1AnB//eqWZuGjuLUS3103g1s77fbe3zULSZsjzY/d/ub1DF
         6bQA13Mk6ry6j1z3kWYwiNbzg78PDdI6jNpBNLarXc0rvsChxwtibIk5e1wh2fbEGkBc
         ssRwyMKoqFIpP+sA++mMgeaqaobn9H+z92yh/54S9ChnOo24AeHPVVaCdI8OjUjTC4y1
         n6CXtO85/n3Ac5YnNcHVzrRDhnWlecuJijFEcXFwAeUFIgZxbedj57OY334YKFHfiWa/
         DjMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792363366; x=1792968166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m1qlXxPCKnyZBMqZS+UI2tKQ3hqkztlpBKb9IkUQpHc=;
        b=oeP2lkz2VfqiHowNjjB6XN0LXH6PavxjZoPnDRM9Hk+KCdHAwTytORhC7cfowS3wG7
         mFXCMlFP3GI3SoPuCnD6kjft0WMq0y6DvDGlJsdAF+YyaDCHoPMnrM/XOiQMj1hurDk4
         CVjXjzzZsopjHoYqqErwimDmxmVbl27SnTRvg1q+SCCwEqJjQ4dx1zinQyYmS/ZuuA/j
         u/FFrm+KkjtMUrTpoVPMd9LgTY09TTTHnhTTZTRbW4X5JtX3Kzkua3mKuCCTACaYoKQU
         XNR5f8vODMKOvSHPHSDb82JL4j1J5T86nQTo9H4bod5Nl6gIhlJLMolYfvluK+BQfoOL
         buYQ==
X-Forwarded-Encrypted: i=1; AKwUvByBvqe488aXD9WgzO3uWr78bGP6JdBbkROUrwlvOmAdoht4ODtkfbV3tJMab/iUY9/JOjw/zuvwsyvsDkfa@lists.linux.dev
X-Gm-Message-State: AFq9FYKQGA4PIxPxfCOl/1FRamxJTMEdfUTnvlGFyHF5RV0BC5NGztfe
	LmaBV96BGkRBgCwtdPFyNkeNCglT+Gv7SBCxQr42lHQZrzgZSaIcth1K
X-Gm-Gg: AYBFou08KppQvvaF28hXNiW34GRjOL66+Suljqu7orGHouccu/FyhRvGQA2B5HxPtL5
	IkD00E4Ra7p3a8ogFd6OPDnmcYeCsZVCC9j3AB+xEUuIm8fvADRq6XM3F+4GP201DDZelqRSmqu
	yXDaIr/roIpR58F+ky9g7D1q9wVB0xACHoCbBIBJ35/JIVPK+CMUDa8ys12GC3PudcJvbVXmJKH
	rG8NKwKVNq6/vWUG2ODYTg60/NkqxGotBDKF7nTsTNsE6NUEQRJtXRq1/fXVbfpr2/sM6Gus1Dz
	TEhe7C0ZOTS3154ea7pa+bdkHE9T9iACdTa8YuRIoAM8QgStPgdJzSJxQ88k+XEtCSVGdeGt+Rw
	96ZFMg4iWMBu4Ub555/6yUB2WBcGcthVSQAFGrPfB+mxbOhdAqxnMyiEN5/RzzeyqpHu3XnpRNq
	XIJS8fpQ8WVagUZM4O5LUWJ/r9QctdRWpWos8XblJ6ORoiHsYOi4MHs0mn3UwR48trLA1NicSRo
	77QU/jT+VtU5UJZRfEc718B67gNfYyXWj6invwTIJfKBgsljVaE6NkyH2iwdP4ejl+qf8/T7+73
	ZHByWRmszXRglX8LLXrlWhNXx+vSiSm5usN6HBLQktfYtSbcOfS+E2mwjeliUQclrc6bD/Q1
X-Received: by 2002:a05:600c:4f82:b0:4a1:df52:3e36 with SMTP id 5b1f17b1804b1-4a1df523fa5mr94086665e9.27.1792363366271;
        Sun, 18 Oct 2026 15:42:46 -0700 (PDT)
Received: from localhost.localdomain ([102.88.166.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1df164777sm140396685e9.5.2026.10.18.15.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 15:42:45 -0700 (PDT)
From: Okhuomon Ajayi <okhuomonajayi54@gmail.com>
To: outreachy@lists.linux.dev
Cc: Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Okhuomon Ajayi <okhuomonajayi54@gmail.com>
Subject: [PATCH] staging: greybus: fw-management: fix argument alignment
Date: Sun, 18 Oct 2026 23:42:41 +0100
Message-ID: <20261018224241.46011-1-okhuomonajayi54@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align the arguments of the fw_mgmt_load_and_validate_operation()
call with the opening parenthesis and split them across separate
lines to avoid an overly long line.

CHECK: Alignment should match open parenthesis

Signed-off-by: Okhuomon Ajayi <okhuomonajayi54@gmail.com>
---
 drivers/staging/greybus/fw-management.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
index 5d01da6b6eb9..e20e9136c106 100644
--- a/drivers/staging/greybus/fw-management.c
+++ b/drivers/staging/greybus/fw-management.c
@@ -434,7 +434,8 @@ static int fw_mgmt_ioctl(struct fw_mgmt *fw_mgmt, unsigned int cmd,
 			return -EFAULT;
 
 		ret = fw_mgmt_load_and_validate_operation(fw_mgmt,
-				intf_load.load_method, intf_load.firmware_tag);
+							  intf_load.load_method,
+							  intf_load.firmware_tag);
 		if (ret)
 			return ret;
 
-- 
2.43.0

