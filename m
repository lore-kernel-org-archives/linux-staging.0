Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80545367B95
	for <linux-staging@lists.linux.dev>; Mon,  1 Jun 2026 09:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780306685; cv=none; b=Pq+jqNkEr6PL6yZvp+/YONNVetnziXmd5sMGMzTVkWONzB2i5bxRgabbGiSxuXtlkxegBKyDu+XRbKYJKSvV/AdQETjZJAgZN/GJC/lAEMIIu37fe9xSmIhtWOn42ChMoYw9+vqt+MB7d9V3onj1oj6oLZjps+3DYe0spXPMRNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780306685; c=relaxed/simple;
	bh=/6kilSnNrAxWINGosXRBGm8Ff64Pr3nwUgHilRRhxFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uUJgCk68CzcB1ScGVv8FHvmohy2r9GsIEg+VmMo89+90c8q1QPSfQ6vmbMrwRKICznNwqWtMlgluAOtjB6lRY5f08pDlIlt8G5PO+fT4nCBlOil93MWoKc/DnW3wokTWwQGZvpPaoM0ASvJ9I1aMqM32QERbHR7nRSgrDe04LA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ti7BqKfF; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ti7BqKfF"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2c0b944f6edso13386745ad.2
        for <linux-staging@lists.linux.dev>; Mon, 01 Jun 2026 02:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780306682; x=1780911482; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXPu/jxK8MNe/RPELawW0xVr+e+DS3gGpbljG7UEm/Y=;
        b=Ti7BqKfFskiOXkdDbOS0n17bfi3Y9fixewmJum29g0Sne6avshQP9pxCePNC07bNVi
         UwS4lqFXNjISSpJ0zoWLIr337k7RvzyyHa3J07wk3tPPK4FVa17l19ELxbSpjQT4n8AH
         8YKU0Mh7SJlI+FwteQIaRXqR7cU+N0TjkWtWo/MznBPccf5UNXEISkxawCqsizcXOXKG
         euQRy7feT8gu4E9deDAKNCDuUuDCb33K1NpqcAnwz6j0K+Jn8xQoGdqZrhas5U0V7kzw
         DpkAvdwH0Ucabu8dPnkTSLzwnMXaO6Mriob3M4wll3Du6+qL7fUNQ0hIM4QR4e71fk3v
         eRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780306682; x=1780911482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gXPu/jxK8MNe/RPELawW0xVr+e+DS3gGpbljG7UEm/Y=;
        b=DdI2btVbZueizKFuacHjUqe0DgvmXv7r6L6cvoMUCabff+x/4LoXm/0nPbNMnHpUd4
         awHWOOXJ2Wi+TcT6BSaQ0Ciu+aFlfxnTdLZ9jpc0gWXs6ksm+p5J7pGCK77yTjID8zcV
         1zOrMV1odVx/uhQ5Nmfb6Fou/4xnl9/QvtzvaKv/rEEC9NRpcv7+vIhNlTDAzaAGPflv
         CbMRIPTTOEwsTRmmrYoE4/s2mLD+YNbohEZGmrM/OT9m9VLOYbLXJqcYTIYKnetKs/UJ
         DLJJ2iP0qSB3nMPRQ/PRXy2Cj82p+GxgOHKx6/FvoVwh3i+9MbLoYrDEXprrGbWI0V7t
         hoIQ==
X-Forwarded-Encrypted: i=1; AFNElJ9JmjS4bmNnZ+qutiNttBfDMesQ5G3qBTPLpp/YxYunFnGgDBx2MXfoK0opsmlOMW8DWNs/T47ZF0W1BjNB@lists.linux.dev
X-Gm-Message-State: AOJu0Ywyyar3aT3xy3WkiqxuAjPljHuLEspl6HpCTFnWRi8vgKcFtLCn
	+1i2F/HeGvIWBBHZdg3cDGaxCmCCXD06r1d0sovYj9VI+3TbK2cYvyOB
X-Gm-Gg: Acq92OHka7Ohj1OBNZeGo/HcarJSg3Op+vWdEYqDOi9QiFh+Vrdy66LqtAHtXqR3QL8
	LlNMGXkdAWQb5y464XFA0n7tUAV4nT4rGOEgOt9HhO5Cv3zXZIbLmRbvuBYy6JCVSRaOPK4JePi
	ykNCQX+pKnluBhAImCEWdoX0P6Y4iVZ7K6Dqc0mDH2MCesJ/3/z5xEc7rkdHnCkzVknkvz8CGwS
	0Yv51lAoWtc+Yvl6B2wgtLkMwWTTL0kPm+QGz6wogTi19ioosleHPC47n22m7qkOn/8SSkCFlnw
	ooIf7Xl8Aj+uvAZ/Gk1XWgq3YJI8tlnExOcKfpUNkVpJEW88TUvesE/fqkw7tl8YBph8aYBpXJD
	n8U2pizxiaIOPZgq/ALl3h2v1P0rpne9ZpJrmWtQnJuJSBGJej+Xn7HTnvYB29dUQkIT5mN2rGr
	3NQEgV5qO6FKUgd5B3WVBKsePS7Wp6k0/cIrrULQzUyax4nwmEziJzFzCQ+cJL
X-Received: by 2002:a17:903:2a8d:b0:2c0:db23:4c1 with SMTP id d9443c01a7336-2c0db2307e3mr47733855ad.5.1780306681869;
        Mon, 01 Jun 2026 02:38:01 -0700 (PDT)
Received: from localhost (bb219-74-228-4.singnet.com.sg. [219.74.228.4])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2bf23b00e7fsm100689655ad.38.2026.06.01.02.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 02:38:01 -0700 (PDT)
From: Eugene Mavick <mavick4022@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hansg@kernel.org,
	straube.linux@gmail.com,
	nikolayof23@gmail.com,
	mavick4022@gmail.com,
	khomenkov@mailbox.org,
	william.hansen.baird@gmail.com,
	maxwell2119@163.com,
	dikshakdevgan@gmail.com,
	arthur.stupa@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] staging: rtl8723bs: fix line length warning
Date: Mon,  1 Jun 2026 17:37:56 +0800
Message-ID: <20260601093757.612130-2-mavick4022@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260601093757.612130-1-mavick4022@gmail.com>
References: <20260601093757.612130-1-mavick4022@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split comment exceeding 100 columns to improve readability and clear
checkpatch warning

Signed-off-by: Eugene Mavick <mavick4022@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index a1b7fe843979..02f8564d32a7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -222,7 +222,8 @@ struct	sta_info *rtw_alloc_stainfo(struct	sta_priv *pstapriv, u8 *hwaddr)
 
 	/*  Commented by Albert 2009/08/13 */
 	/*  For the SMC router, the sequence number of first packet of WPS handshake will be 0. */
-	/*  In this case, this packet will be dropped by recv_decache function if we use the 0x00 as the default value for tid_rxseq variable. */
+	/*  This packet will be dropped by recv_decache function */
+	/*  if we use the 0x00 as the default value for tid_rxseq variable. */
 	/*  So, we initialize the tid_rxseq variable as the 0xffff. */
 
 	for (i = 0; i < 16; i++)
-- 
2.51.2

