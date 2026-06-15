Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B8034214A
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 12:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525935; cv=none; b=ixbjsA/0DP5U8OFvm+xAaWdU1+GEJvOoR2PzBCYtY+jMZroqD4MSyGpo2glftZhXdRoUAZVemXr9CYUN0LBrWGVxsjJAooTRk5R0IKWbBe+VevpA+QLZdol8BlR5UiT0smIiUDFIpCAAZR7K2PZSIfWTmQn94wA+EtwDqTOUnG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525935; c=relaxed/simple;
	bh=BmWK2a+I80nUyWO3nz3vQqKUb8ODz3gXv4ZkC6nsj2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bW27H5ASKObbd4qE0D8MbTZY6FPbUHn7MoctZ0uIRHYE5tBkmIgr8sLBhP1egeO1Wu2uZliJWV4VOPAYL4hl8FzHwLqUZ2POlhFdgTU/TC6F4ZBHAyJZy+f1HDQLMORVTCprW1pgmTPsJ2MXeVugErkoj6O+UYsabXNLzT0BMyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P6W+P0D5; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P6W+P0D5"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c858b5de728so2052743a12.0
        for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 05:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781525933; x=1782130733; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JbDsrHiVlos6LOW2SoeVcldxygFzAZXb00C8wGvdaNM=;
        b=P6W+P0D5pgvLtAUucabPvOXC1pdrbm9Md1yxtnfA9ZL/5TLpaVnJTNFqPBGkXJpG5S
         Iq6xB/fCCQlhJ3hb7llhNxld77z0Ms5E4FRRHWgGnC29nrFwc65bpsMC1GwrlRL+LQci
         1rMD+Gig5i/m5tDyzTWb4LcYn5hHacxw5QtOBn2n4R8vXw337MLTRaOdhAmkskoPFNdX
         jbMcJxGm3W+TkEifaP8SEfvbG6INWzP2BiF9f9al1mL9PL4GEJPUR9Zk/YR2/kFkHlbF
         YrJFcn5VumXEY0i7NrI/nNEu9pqHZ85nomEk2J/jbShfqwUEJmcc2zTDCaCqnawkcUKN
         PoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781525933; x=1782130733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbDsrHiVlos6LOW2SoeVcldxygFzAZXb00C8wGvdaNM=;
        b=WYJehz+A91YnokaBw3TUVjKsBO7qJU9as/H8SZiWmFu9WvPdOcCkSdbi9aVap68IDo
         /CizNcXckkswYO/yZUyBwQXX7aCPtMjDOL1SihA4S/wV/R1cJGQQvoJc6YlINTOv2tri
         /+BouULS1W/hcxRNfWfkapuJCkY4WMmU1XgIFY7KPCXA2rIDY074eB2T9109hruYljbN
         BvOeuZrgUadtfg9T5x29C4VwdQ8COynOQZUfRek5/1GT7XGnZXcIZec0r/krcG/PreWD
         PrpGi/drsMd6AOIRqqhtHQvVajonucPhuogwVVckfVqkBBWBXdgMtpS/EEpBy4PUXEhj
         Gw6w==
X-Gm-Message-State: AOJu0YwGt5R7TA2eNALFvsnpTeghWPNbYV5XsJ9F0+6t6izdBUwy/8LO
	LxqhdZ9pgNMWh9vzrV5aXQ+7jAQh6olcTdJCRbR4D5wN/t0FxL0BVdc4
X-Gm-Gg: Acq92OE3Wh0ksfEowffSW3aFICb5bGgGzDA/JURKNqUHFXLXmzC6t62Fr9XRtVnzf1J
	SmKw5R3KIFhN8yPMZhMzHVdBQfgBd6D814Gvc+nG37GUezu5CtIK6Vx3X0zr4QG1fRZ0qJIpWbq
	RFpE5K3LTT9Zm8PPGf7mkL1aAg/fTLVdPJD2aNjAJHdA6ShoDOuwIOXLXAvniqXyCCJGagZt6kO
	54MpYjlXWVK3ipytULqARNOtyO2iXU7fvNIbqJ1V9bA3edHDU+Yo9pE+nVkT1rF3rPVQ5uuLYKd
	8jAY8lPEughYQ922FVLIc6OQjZqMW/wGFFl1fcoXR8wbgMKhkgIUiRfv9YSp6fd69Mj8jTudpag
	8NWm8pwlDvnkso6PFpkjywC6xHqoeKk7YdhzWwRghtxGXI4VUwVT0q/IhXu96chIhug23/ftdGF
	iu/03o6bgsIVoX7l8f7GHeholkiUfynNHyEqhyvrYlA8cg3f+g0xvRx/AljosKvQ==
X-Received: by 2002:a05:6a20:748a:b0:3b4:7aae:1ee8 with SMTP id adf61e73a8af0-3b79624cb18mr11910389637.14.1781525933156;
        Mon, 15 Jun 2026 05:18:53 -0700 (PDT)
Received: from localhost.localdomain ([103.87.58.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8661b5e509sm8893318a12.3.2026.06.15.05.18.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 15 Jun 2026 05:18:52 -0700 (PDT)
From: Devansh Soni <devanshsoni874@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Devansh Soni <devanshsoni874@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix line length checkpatch warning
Date: Mon, 15 Jun 2026 17:48:38 +0530
Message-ID: <20260615121838.30825-1-devanshsoni874@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wrap a long pointer arithmetic line to resolve a checkpatch.pl line length warning.

Signed-off-by: Devansh Soni <devanshsoni874@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index c1185c25e..d727a00f2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -184,7 +184,8 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
 		return -ENOMEM;
 	}
 
-	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf + 4 - ((SIZE_PTR)(pcmdpriv->rsp_allocated_buf) & 3);
+	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf + 4 -
+			    ((SIZE_PTR)(pcmdpriv->rsp_allocated_buf) & 3);
 
 	pcmdpriv->cmd_issued_cnt = 0;
 	pcmdpriv->cmd_done_cnt = 0;
-- 
2.54.0

