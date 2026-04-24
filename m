Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1618D145A1F
	for <linux-staging@lists.linux.dev>; Fri, 24 Apr 2026 01:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776992424; cv=none; b=hfR3D612C5ui82E6o0WsvYKeAkrkHPjyLHHsNt7ITlcxZM//EnFkQ2iJ/AgQgHmIx4qP8GfndrZRzkD9qC5mNeSE9NRLFKthnKoNSUqLdzqKMODm3OOFCDRHkojD1dZsj9JIcjbeLNyemVfY6a2f39pQI8xAdXVWlV3iXaSTbu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776992424; c=relaxed/simple;
	bh=seuihVKfF3PGLP66pmmk7T9A/+XxvxyR9hIw3SpiflA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FFM+0ZlxnYclHld9EVTwiR+XId8rEV5JPU6rKFb/AKoLPhAkM1lsTjUqamGAZiujz4VIx7fYvFcWHClWTt8U4XPzfloR52Pt6tUrdRhUaYE60gswlBocGDFeBboZkAO1ptMbuH1K1h5n04wKjl3Qo5STiRIOs2M+CTXLFKXNOJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EU0olFxu; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EU0olFxu"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2dec803f9f0so4278184eec.0
        for <linux-staging@lists.linux.dev>; Thu, 23 Apr 2026 18:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776992422; x=1777597222; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OhgEHn2R+5oQuceTp+T/WxlCQ7K8Q2yqWLLVCK2KJyY=;
        b=EU0olFxu0/LPu/Yzk3ndQGMR1i+yRrA9Dv1vDg4arU9Oxqspinrv1wlqri08T6OsfC
         t5VMXpbpOphzE96wx67cF+50fPXAourJYLv97plV4f8jRzUuX+538IKhKhg5XFjFx6uR
         XmEfBh3oxA7deaVNCjngHQCEMCJHs9tn3XtO1HZi6/x5vO5MRMyRTVhuvC+mPD7NqAr9
         6oCXEt1KI+PtLy5D6vIDw9bXUH7Or+RlHbilPdK2tzf/DdV2eUNXNKYAXgKzqL8vZotq
         zPXcf2JG2t9O72sl/HJz92ikmmLiJJm37wQxnso7AE+sX1i8ZVC4WM/MmVBh8AA+MTKQ
         B1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776992422; x=1777597222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhgEHn2R+5oQuceTp+T/WxlCQ7K8Q2yqWLLVCK2KJyY=;
        b=sSyUFnAoYeJQp/fSJLoMS+TW9j8x10KBkKrw9VHvHbE/bNbiOj1hYFjxD7b511sz3w
         QjYhJdnLIBXeK9M72rbgG6kALNnJOWKFqJst5M1Z3HS6goieUSoKV3/iMRB2ssJ4SfEl
         Q/2q2ElgsLXlviwcwI26H0klV7hiHmd5bz8foi0vjF58DMxVuVvU8Jvmgte6c3voA5lO
         pq+24328wISMNVgQQFw650Ip6sQ0dYpDTmdJbbwCRV8dyy7l/mHfyGQ2xVR4ukzCnzcF
         xnGiVl33TB3sf02H3lcy48Lcdi1sVBhyuLFf5fyK/RryoUzi7ykJfNpA0wc+AsIH6pKC
         Mmdg==
X-Forwarded-Encrypted: i=1; AFNElJ8NJLUhWbO57OfgXZilJ2MJgQPucrHlCyNyqjoq7HmpZfcaYVVQ69I2cwBByD8OdvVfVVefzyuzm0N3Dxxq@lists.linux.dev
X-Gm-Message-State: AOJu0YxdQ9zl3AqNp1/vwOILF3HyvjV1V+8gaBa6Bx5AFOSp32Nn5TP/
	Htrripay5CfpuumjVwpNDb1mS404jKDuUEJtgA18LHi3B/PdoquRl8aS
X-Gm-Gg: AeBDietlwohoOyPhkfdAKGmrk4BYgkILzz3Y2uo5/1231tAEWEy/+2HJjIXr+amMuc8
	C0jQROASpsNWfrkfm7NXFq88YdwJjpEj3Z9pXEasRCJj1j+Ij4f9Laucb2exbD4kiMzobVC4hjz
	kleBmOs+/vYY8e5Lwv2druvpzA3J4EDjdZxwcWGdcQ75TOl7RD3pJ7S+9GxEvVkL64jPnwWPrfw
	DAkCOmvDhRd6Um09eI/91jWl4tCFJHTtejbHKXPo7bIr28jhCi7t+1rb9s/gGPJjrN/9igI+B7U
	OG9zQazX49VkUlilfACtkn5/jlMNeOkVx6QeXztaSYZGRG4sINrlwJlE85r7LIbFwzF8x8ZQSsf
	ePXAO2wlXoQJRuBRJOOvh/TzPJtorOZhcRsBqKxyq9pKR0zeoqubVurVrNjdOMd+ovaXgZgr2su
	VayYqNYWsnJFh5gM1YG5aC55zUtFR0g5A=
X-Received: by 2002:a05:7301:3d19:b0:2c0:beb1:8507 with SMTP id 5a478bee46e88-2e41a1e3fabmr11649995eec.0.1776992421616;
        Thu, 23 Apr 2026 18:00:21 -0700 (PDT)
Received: from localhost ([201.16.171.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d8b3dd9sm29661528eec.27.2026.04.23.18.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 18:00:20 -0700 (PDT)
From: Mylena Angelica <mylena.asf@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com,
	Mylena Angelica <mylena.asf@gmail.com>
Subject: [PATCH] media: atomisp: pci: hive_isp_css_common: host: vmem: fix line ending with '('
Date: Thu, 23 Apr 2026 22:00:08 -0300
Message-Id: <20260424010008.325784-1-mylena.asf@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adjust the formatting of the function call so the line no longer ends
with '(', fixing the checkpatch warning in vmem.c

Signed-off-by: Mylena Angelica <mylena.asf@gmail.com>

---

Hello!! This is is my first patch,I appreciate any feedback, thanks!
---
 .../media/atomisp/pci/hive_isp_css_common/host/vmem.c     | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
index 722b684fbc37..3831092154d1 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
@@ -38,12 +38,8 @@ inv_subword(hive_uedge w, unsigned int start, unsigned int end)
 #define move_word(target, target_bit, src) move_subword(target, target_bit, src, 0, uedge_bits)
 
 static void
-move_subword(
-    hive_uedge *target,
-    unsigned int target_bit,
-    hive_uedge src,
-    unsigned int src_start,
-    unsigned int src_end)
+move_subword(hive_uedge *target, unsigned int target_bit, hive_uedge src, unsigned int src_start,
+	     unsigned int src_end)
 {
 	unsigned int start_elem = target_bit / uedge_bits;
 	unsigned int start_bit  = target_bit % uedge_bits;
-- 
2.39.5

