Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD5D3612C7
	for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 03:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778730333; cv=none; b=SyOML7Tb0esXUn5w3H39bRa24xs8EvZDqXJaS/TYcTH+qoDfH4efSPOQ/ayFAsgaA6NmdUFUC5U9LVIgZOmM9//UWbHzwwJr2kureCfMqYzQXZ5Sd+ErJQo+tSncY6BRkPx2LXpDbuqr+M0Zxu8WsAS0TvsTS166UqcEf/ZMy4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778730333; c=relaxed/simple;
	bh=7fzvXNkKyCgXZZTF525bDdETOC4962M9Zz1rkuNpoXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S5BvSTE6WnGvzgoLelwotrhVtao1i+y0GKeso4DE1ftFLEqNwIRVpppFvEYWR0rkfBgQGVMiGuMeiPSLb1Ohba4NBD4dnvYiMpnxgHot2vRPTiLAv/8Tqafl4DvdgQ721oxcVzIsJruY2hx4CQpZs2EwdrYrSAOXGgmMkNOK8hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Algh/K8E; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Algh/K8E"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-368763a1bdfso2881382a91.2
        for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 20:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778730330; x=1779335130; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zuozrY6hf5U3ahVFjB+fzD34V5OcD0q+0qREX/Mock=;
        b=Algh/K8EVBGRf6n7IaNbph28A1B5At36qKlp5AeWokq9c/M8hIuYHcys+fH4wS/1FJ
         6HKNXBbgI0sp0TEwEC/MnRVhnAcMY0lbzxFBDn/8B7/Q5Sw7fbP1TYL+y2IfiHXQ6NwP
         6TJrZj/5dhyTgy0PpcsA7OqTNVM39LeajSWx7J/lfQ3T8D8mAFUTevS5o8suXuaGPO38
         zKMdrfdonuc3/ZI1y0gYOaouJ42Z/EfnyN1fBfC+l69JtpzlRRRGQnq+sdtcuOv8csq9
         Y8vghdpjwpnD6qfAqs/MPIu02qkX27Z5QDaujBeddXCTOPCIQAroSDeu4KxyziSjvG6Z
         lI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778730330; x=1779335130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8zuozrY6hf5U3ahVFjB+fzD34V5OcD0q+0qREX/Mock=;
        b=EdfBWsVivlI3JZExdv4LSdW/YbgHq/vuD8Dzd93RXYBrumWgrimw18Vg8DMDoGgTt3
         1En1IQ8hJ/sAKM+Sa6RcXwzrCHIipiH8925oz5lzXLp2z6yQf0crjJXmdhEDtBhk/Gmf
         XEF/riwTWEY2aFKe+yK7nQ9p+v6I6ocV3dUCJ7oN4TMy/X8yOpsXWSfIMF0OyiuY7V4i
         8NJZAckInbMCjp/xWi2unLOUxwlcOAAxCn50SVcf7P7M2+JiXV6YZcbRvuicDoNVbYl6
         /E+SRUOtKsaS+Py0t1RmwXtR2M0BGMrLhYJeNe7g9kwMkJU9oJN9yEZuUuF7tzl+vy2Y
         pLHA==
X-Gm-Message-State: AOJu0YwYeXUFL50E80Tzmiug1dgJjSXWMu5aCGYYHLwXU4qAZysNEa3i
	y5GIZgBBOU5LxMk6OYim6XCdIpKdx+f4vohtbo+345AbJpIvlweLni5N
X-Gm-Gg: Acq92OGoEZTxoMjSLtTdCtv/wozeK9jb4zZOtyzYUDofiwuklcrf0/X1YGNmsBQlK2I
	lW5jTW/GcYRDE12eS8gwHG/X+ahsBfeZJqwPZGjrAsrTo0jK1/81hHEWLIcjq5f0NDXqYVJDKR6
	ts0tbE2UEISVhR1HIg7F/kKdDW4qZyZZbe43Ybd+Ro/5y3EzObl7WLJq2QU7gYkZWnuOLLOVCjX
	07oRHMyA2Vi18r58+/iqrtLc1si6uioYhLy4srzPnI3TRTPmtfAiDM4MvVKdOafjI4nirOZJ4uO
	i7hvKhOwcgaa9o5egGEkINaMV11c1swu4c5TEUhJ4nTOTJ+DLPGCuOvVj7X0BSPFU+X4c1AO1WK
	xm31NjHzhb2O0pyxwOHq3epXjMWUZrCGOHy06ciP8hndczhSZWC488YWrUeXN1chr6q0fqkP3nl
	TNq++Hy0R0O5XHqe1hsVDKiMQ76vvCFCbMYj7zSGE4KcluHb7ZZh75ejIdt7EUdEAWfO6kkV6qM
	w==
X-Received: by 2002:a17:90b:2d4c:b0:366:1bab:c3d6 with SMTP id 98e67ed59e1d1-368f3ab59c9mr6146223a91.10.1778730330166;
        Wed, 13 May 2026 20:45:30 -0700 (PDT)
Received: from PC.asost.local (fs8572fbce.fkol001.ap.nuro.jp. [133.114.251.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368edf4d940sm4434485a91.7.2026.05.13.20.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 20:45:29 -0700 (PDT)
From: Rion Kiguchi <kiguchi.r.sec@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rion Kiguchi <kiguchi.r.sec@gmail.com>
Subject: [PATCH v4] staging: vme_user: validate slave window size against buffer size
Date: Thu, 14 May 2026 12:45:10 +0900
Message-ID: <20260514034511.4244-1-kiguchi.r.sec@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026050947-easily-choosing-2f91@gregkh>
References: <2026050947-easily-choosing-2f91@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VME_SET_SLAVE ioctl in drivers/staging/vme_user/vme_user.c accepts
a user-controlled slave.size and forwards it to vme_slave_set() without
comparing it against image[minor].size_buf. The slave-image kernel
buffer is allocated at probe time with a fixed size of PCI_BUF_SIZE
(0x20000 / 128 KiB), but the configured VME window size can be made
much larger via the ioctl.

Additionally, a slave.size of 0 is permitted, which causes vme_get_size()
to return 0. In vme_user_read() and vme_user_write(), the boundary check
(*ppos > image_size - 1) suffers from an integer underflow because
image_size is size_t. This bypasses the bounds check entirely, allowing
offsets beyond the actual allocation.

Result: a local user with read/write access to /dev/bus/vme/s* can
trigger out-of-bounds read and write of the kernel slab adjacent to
the slave-image buffer.

Fix: reject slave.size == 0 and slave.size > size_buf in the VME_SET_SLAVE
handler. With this check in place, the existing bounds checks in
vme_user_read() / vme_user_write() against vme_get_size() are
sufficient to prevent OOB access.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Rion Kiguchi <kiguchi.r.sec@gmail.com>
---
Changes in v4:
 - Add check for slave.size == 0 to prevent integer underflow in bounds check.
 - Remove trailing whitespaces inadvertently added in previous versions.
 - Remove Fixes and Cc: stable tags to resolve checkpatch warnings based on maintainer feedback.

Changes in v3:
 - Drop redundant checks in buffer_to_user() / buffer_from_user();
   the existing vme_get_size()-based bounds checks in vme_user_read()
   / vme_user_write() are sufficient once VME_SET_SLAVE rejects
   oversized windows.

Changes in v2:
 - Use git send-email instead of Gmail web compose.
 - Drop redundant Reported-by tag.
 - Add Assisted-by tag.

 drivers/staging/vme_user/vme_user.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/staging/vme_user/vme_user.c b/drivers/staging/vme_user/vme_user.c
index 11e25c2f6..ba4c9a6d0 100644
--- a/drivers/staging/vme_user/vme_user.c
+++ b/drivers/staging/vme_user/vme_user.c
@@ -394,6 +394,16 @@ static int vme_user_ioctl(struct inode *inode, struct file *file,
 				return -EFAULT;
 			}
 
+			/*
+			 * Reject window sizes larger than the kernel buffer
+			 * allocated at probe time, otherwise subsequent
+			 * read/write would access memory beyond kern_buf.
+			 * Also reject size == 0 to prevent integer underflow
+			 * in the boundary check (*ppos > image_size - 1).
+			 */
+			if (slave.size == 0 || slave.size > image[minor].size_buf)
+				return -EINVAL;
+
 			/* XXX	We do not want to push aspace, cycle and width
 			 *	to userspace as they are
 			 */
-- 
2.43.0
