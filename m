Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601A9332EA0
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 11:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778411047; cv=none; b=C0aNRzOaUuw/uS5QOg/muej9U/Qcxu4T0Fviod40zT3QmXweACa8a+h7Cxj28FNy2Uuij5ihMgFwBOdJ7FkYIqGATS4DfcSwJjOzGSCrXwuyRTElpJ6L7EyqEQBfInzGrIx9kUyww5qbniilhFqsOr8ikz2ctaKO9yEyE+GQmCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778411047; c=relaxed/simple;
	bh=zn15nct7DfdA+9Tj0axf4sF1fr3DrBJf7sPRz6qcgFA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ijj1RsFMH8o2nkNi1aYMwowgmtsEIW5NVs4E44fmBxacaYmJJEAfBio18pw6zAapW5Eu1JjcG7yeUj+eka2AiKaeBtHJ3EJE+/PRbQbzZ4rbqoNUuKGNXdMbV3qC2d70sqZY6RiB/YPsPyT6S16O9xBJykqMuIq8j3Ka74p2Fp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O7rIwjbt; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O7rIwjbt"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-837dfccd950so1513591b3a.0
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 04:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778411046; x=1779015846; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RjbJI3dV96Z6rDDis2EaenI5OkcvPxOxYXh7L+qNodo=;
        b=O7rIwjbtOFZTQi0rm1QRiqTmGLgbCLlBhRTac2TSMFttNFsOgS5zSjNO/2jXjW8uNW
         ZHYx29nN6YeEV7t1dnWbPdAvSUHH7Z55DrU46srx9lFibQI+ZeQueYGmdzP/qk39jzk4
         49Dh5+LZdHeEtoKZQZOcYXL9NvI31UKIvvzg424lakWm/+PGw0G3beXWbmrdcnDuVAV4
         JkLMZGtWcE6bn69obO/feJNsS340JmDbOhi5WYrfZL86fuJuJqlrIwg5ds4ismnYReek
         GrRqyy8BQmWxFM3oeczENRdUpt7vVcfN0EUt+VE8eAaLSpApV8aMj/3siTIPgHtzizzi
         oVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778411046; x=1779015846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RjbJI3dV96Z6rDDis2EaenI5OkcvPxOxYXh7L+qNodo=;
        b=PFVg4FARqmmVaUjxOrApzB+mES4kcq5abLwfYK3TbU90Ok2m3nW5adJo9ZxrLm4P0I
         zYMPf5bYMJxjirhi9lE/+w6sZxsRh5Bw2hslsXBGuMS7yWCwExvb2Opa2ac+DBqW8gqs
         DHc33/BMmRUHLi1mbNXblk0gKemLB/qAc430t1oZh0a44jai3eeE9B+DWQvMzGHsPTL3
         oZOgF8gDrKqbkqLKYnCjcchkd6R0WzY242vjaA3mEu2+ztoKMfgDlKMyhrzW36gcpqfA
         kWiIQPfZHLTdH2BLeB47LGzBO0ItSA243dwGY7U/VyWLtG9ERLmC3/i10GRh4AlDfTWr
         0ScA==
X-Gm-Message-State: AOJu0Yz/xTxAWuz+fuPsYCmLtz9YtetIz4ylWbsBldWxCLvnooTxj/sU
	CGQpRmy9J+8aQEaN01zm061WLOr3fUCxJeJ/gskIOC80xDTUTU7+X4JwH9j34MsVXTotDz4y
X-Gm-Gg: Acq92OHjiHbQDRweap8Cu9zW3Xn2vezBeS+QVMFr2WnaL6uLJkiDNmfVFpbWeet9Iuu
	u8z6cg/SCXL4CVsbBrui8vdjxeFwlXZXISVXTZXkKqxWhqrZCj55bhJOFnl3ABfloiPt9NIFViJ
	tbz4VaMCHMT2JNRlu7Rh8t9oWTFXyV924YgxXiQwfJAdpnp28S+0ltnX3TF1AnfvF8AMJhwdX24
	cZa1pGDf/K0eEdebCYXJCK4IqxDE83mBFw+NPyqToYnsOdhvtlOcSvO2LDyYcQ7zXoZrTOViljN
	ieBoYfUdc2aLm4lqvawRTcHRQpomTVYFJ/KzH2hzqYqtwR65LwoPaUY0YfToRmG0BSPw1J7bGaw
	fL084R8yUajFBrkeQdoI5u/R+010S0zZ0qYj9SGh1hBhFY4OWcX9ieigFTuxhUsu+SLU7n0Db+x
	e9ULYLZBwSxvCjmsc0l0QO+LBHi/UmuGri1InvZXoePnSc1vl4J7D8BKePpQxb3A==
X-Received: by 2002:a05:6a00:4195:b0:835:3949:3c22 with SMTP id d2e1a72fcca58-83a5d285a4cmr19370056b3a.27.1778411045669;
        Sun, 10 May 2026 04:04:05 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d008:80b:a00:27ff:feb6:42dd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c7b92sm16893879b3a.29.2026.05.10.04.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 04:04:05 -0700 (PDT)
From: Pramod Maurya <pramod.nexgen@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	pramod.nexgen@gmail.com,
	Michael Straube <straube.linux@gmail.com>,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
Subject: [PATCH] staging: rtl8723bs: Replace __attribute__((__packed__)) with __packed in rtl8723b_hal.h
Date: Sun, 10 May 2026 07:03:34 -0400
Message-ID: <20260510110338.98540-1-pramod.nexgen@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace __attribute__((__packed__)) with the preferred __packed macro
to fix a checkpatch.pl warning.

Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtl8723b_hal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
index ffd03927841c..cb164122c8ab 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
@@ -171,7 +171,7 @@ struct c2h_evt_hdr_t {
 	u8 CmdID;
 	u8 CmdLen;
 	u8 CmdSeq;
-} __attribute__((__packed__));
+} __packed;
 
 enum { /* tag_Package_Definition */
 	PACKAGE_DEFAULT,
-- 
2.52.0

