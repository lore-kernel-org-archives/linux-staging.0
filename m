Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D62C47CC99
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 11:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788260748; cv=none; b=ieHFldPc1jRXHHASW61OnaXC37Hysv7yhyl9N3M8nOSPjeZo0alyGwfvMcfVyivetyaSxrKf1weXBPCmxzLPsrcfhvHPzPqy3nQ5VaKbrqgelugGvgEXR0F/OWEFRdR1Xhj8wq+sNy2+u5PW7G7UvZ59+pG3U1GFqEO7dIEODMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788260748; c=relaxed/simple;
	bh=Je3UOa9lW5KIWcaPceaXLRplaHpvA2Op1KebD++CsqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YZqmHMfLJRZ1YJ/LSQ0Nz0UsC7aEZcdkE5h9+Q/06bNK2YK1vgiRQj2ZUmMlp64XfQW16cz/Qo1eU6yZZGxui+W7aH3fz96EulUjpE20c1FmdqWXaAFueFzBAxn0JBgkU5zzyUiUmsw1vu4AOkZYs2atjkUWtr5Fxu4VpmieyWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aIt8YS11; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aIt8YS11"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-482f2ee53e7so2243555f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 04:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788260744; x=1788865544; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h2+R9Oi4TN6YprnqweZUIScg3DNG10vBbq2pzi9xAuc=;
        b=aIt8YS11VKTfWkQ9g6j4H3NQ8iDjf7hQSHeXR7XXkWyLgCta6903h9KHIpIEoh0W/D
         uuyQuv6GukiA3N/uMgk3/FO0uIRvylzk7TnsaFuG9QqHPhkYjhg81yhdrp2m8xat1Uc6
         2WUKVqVdmUWI8UEK5s8D/lpMsdBZYbcU3V7+QKxGtHKXsQSlPQjOP8z5DApL8vtPmnjY
         pfNd7nazcLFjBby2Q4x9WN8N7SIJ1hjmzt0PVORDXL2Q/mermP5f4/kwjyiilFBlN9yk
         taQSdGW56cu+w9mq+b/uZvnbsV8+LI4i4GTwmYAKPw8LC0MJD5nafH1cJkoognu/0bIT
         cSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788260744; x=1788865544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h2+R9Oi4TN6YprnqweZUIScg3DNG10vBbq2pzi9xAuc=;
        b=R/70ZGwc+hJa+m9bxtkz5wpBwVmtj6WV7Qs7i5oVfcK1Hx5tH5Ir2IXVR32A8Br82B
         Vlg+uPlGqgeSiPeLQPrmfEe/Vskw83tP3s4kFEV8vdA0OCC3wT0RT27ylmxr/IevBjiE
         SHoq3z/M3N31b9PIwhkcv1q/1yj4VQzPg/B12e060b9WpRVwOR5HCUEz3oO7Po9B++Vs
         9CJ8TDvVMLRzywtXhi9u9exPg3UOJNpbdQtApZ7/y0ngpmWHG81+WFH0t0VX8zwtLpBQ
         uJl4B8uSGTfTBxcEi9o4bClU3++MGP/aremIKuQrf34yZgi3W6hTmFzZSCpSysVBrnnV
         oDcw==
X-Gm-Message-State: AFuF++lb0Fbu5nQPEIKukQ5uelRiaueV2ounWQ1WOm+0SmeKO2gvpKEf
	hyzrzHReAv1B2Mtn7tA/609mmmdVaMIAGLWMgZ1vUkUGG57k9vPctxIJVHswpaYj93n1Fg==
X-Gm-Gg: AYBFou1zTZp1fyw922EYK7BviGhe0uN7ZcaGUrZtDDzipRl9mpbGLWtpLFhGDZe3cYl
	tCd6AHyPk1OxWq6MG2iJ3FE7IovTNhabop3DcE6eyw02xlZ+3ut+cdIIWee5oJx/t4s27wHDPmM
	yGIUmujvoJurJPOU6mVeNDr33O7O8OUXxqp3oDjJQ4vFWXadDJhH0+hK/4oacrGhWHnbjnSIDQv
	i4YWuRwM+oVAv5r6LSjetXd4CeXIJCGgOtPAZgvc6zBemYChvQcRsmAjT6Gronm4U8ItZDE6VTW
	sstQ7+KVWEzpS60SYZLUcTBosPET3UHKXSVqrZCEEF4AVWMih5I6j5u7MI16W4k3yBpg4KdkLwF
	Y+mLV550UVFPorihhRwOppggshSJ7r7pqXSKxLpdspDgqIJSOJ6TSi9yGzxMp9aNEa6X7KJhmVy
	68kfTCa41T9SELQPppvOJmWDpcQZD0OrSd9xzlI6NrCb1TpahdGsRap+6gFtwb4JCEXXFwB7Ye+
	wNsz41o8QzGHoXFMjuYoEYzMgsWDzRUgoGWd4lf920=
X-Received: by 2002:a05:6000:3106:b0:47f:8d71:210a with SMTP id ffacd0b85a97d-482f79cf4d0mr48183602f8f.15.1788260743864;
        Tue, 01 Sep 2026 04:05:43 -0700 (PDT)
Received: from DESKTOP-EHH7ATM.localdomain ([102.203.209.200])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d6e826sm4116799f8f.19.2026.09.01.04.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:05:43 -0700 (PDT)
From: Godana Emiru <godanaemiru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Godana Emiru <godanaemiru@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: split chained assignments in _rtw_open_pktfile()
Date: Tue,  1 Sep 2026 14:04:37 +0300
Message-ID: <20260901110437.37588-1-godanaemiru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827062137.12937-2-godanaemiru@gmail.com>
References: <20260827062137.12937-2-godanaemiru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a checkpatch CHECK ("multiple assignments should be avoided") by
splitting the two chained assignments into separate statements.

Assign cur_addr and buf_start directly from pktptr->data, and pkt_len
and buf_len directly from pktptr->len, rather than chaining one field
through the other. This avoids making the reader trace a dependency
between the two assignments to see that they end up with the same
value.

No functional change.

Signed-off-by: Godana Emiru <godanaemiru@gmail.com>
---
v2: Assign each field directly from its source value (pktptr->data /
    pktptr->len) instead of chaining one field's assignment through
    the other, per Greg's review comment that the v1 split was harder
    to read than the original.

 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 7a9d2fabc..9f0d84e2e 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -14,8 +14,10 @@ uint rtw_remainder_len(struct pkt_file *pfile)
 void _rtw_open_pktfile(struct sk_buff *pktptr, struct pkt_file *pfile)
 {
 	pfile->pkt = pktptr;
-	pfile->cur_addr = pfile->buf_start = pktptr->data;
-	pfile->pkt_len = pfile->buf_len = pktptr->len;
+	pfile->buf_start = pktptr->data;
+	pfile->cur_addr = pktptr->data;
+	pfile->buf_len = pktptr->len;
+	pfile->pkt_len = pktptr->len;
 
 	pfile->cur_buffer = pfile->buf_start;
 }
-- 
2.53.0

