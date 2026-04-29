Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6595388375
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 03:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777433444; cv=none; b=r30nNz3LYOCMGqjTjYx7NroPiaW7E7XEuIKJqJZiF6KcPFPgEUsF0wdFrCZ7/M1VmjPoNHmrpY69AyntjdAY67lxJakL9c3M54+slMFWZWZlWccZcrbNJIdRAiWbm2YiFlDt5N6RiMSyJzA2UGJVFOcdiIz0uI9VHHYxP4e/Rak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777433444; c=relaxed/simple;
	bh=DeiVv8eE3foofS7qdH8m28b/rcrvJTcd15SKpYB7Ick=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BNps9F3WJjawwGIe/Z4m3Fo+zmbUoGlv1yE/nidvluSaRUrSmSU3OPlmWZ/5ZRHiiALuPhIZIayVOwENik64hAi1yT81e8F9rmy2cumOVcwL2Km5QGi0K+yDXQ/HgekwsjToVRaX2u4dnuuTYfqklT2fR8oXwYQV7bJ4o7bRaZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pJOpg4WQ; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pJOpg4WQ"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8ec9f099fc6so1010213785a.0
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 20:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777433442; x=1778038242; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=99ir5UrhVt7eKKyVqsQ12EIapjNpUseGGaBw9S/TLCU=;
        b=pJOpg4WQy63oa4xgXbN2OMcfKb6q1NYyusAgG01OIRhWzg8wm3fG0i2kX9IoTv435u
         JMAWOIIFzAV1gGEAQiRT+C/6QVK0yMEhm0euF5iyrjz2Sd77aQ9OyCRB0vzPWz+q2ArF
         xovRn4EIJBtM+Gij22lsumzJuPOkC/9bSJG6YsHrn0I0r6RBgjpuV1Y++fWBEg5RWsrM
         vNmRaNPRlqVMOx2PpBPNfdDN/Xmws0E6fK+vCo6A1KpMSeGyvOiTMkApegDu0Mo3vr2w
         2rbAge4Wu8bQ4TMyoMOQnwJp9OKEBCJYAOWi1ZuD3ePiRgRIgNoXPGoEK4T6LbtBWWYG
         XFxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777433442; x=1778038242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99ir5UrhVt7eKKyVqsQ12EIapjNpUseGGaBw9S/TLCU=;
        b=QpGdc83I7y/38FokNjHwKv8grnHavqXzn4j/4U68nDPhBouLJ6H5PcpdXeHgRBmeST
         m+zzHaWrM3sJ80X5cxMd7x/EaNbgGvOP3bxlHh+tuVSQGlt8Rc5gPc7YosHFyb2SRNf1
         vogiKdYZ2FyertMw+3gM1ttXMkZGyoe1IPw/S+9AXzhNMOcnQ/MLmlAzC1+B73FHXV+w
         TCxebEa/kwhQ4+m3PvlLl3kAp+Vpr+fDUgli1imBYkFW7Zqp+MxvxjhwEUP8YH9bRR9U
         WsHNBh6E/rQ1R8Sp3068aXfzjpUG5eLnRAF6PIlCT+fj/kNbXOm/m/e1gCxYBc36uZcY
         F0vg==
X-Forwarded-Encrypted: i=1; AFNElJ8kFNvoDK3+CllLdDnISdbvXTdJnjU9JgOdhhZIOxBDlsFAtqdV1Lve9kCblHrEgDTe+EOS1LfQLFv0lsVf@lists.linux.dev
X-Gm-Message-State: AOJu0YzGCrcMUIVjbmbGB2+sl9T/z76WGU6qh08pkzE23fxC0dXPvcGk
	GG9RCUfViwy9egjTtICDzlWK6pmnvqx3I4qZJNnhyeKHBEMN39u0D5el
X-Gm-Gg: AeBDiesj4mW91gvXb8I6KGbgEzqgLDN/70A0nkciqPhYUXvlOCzQhpU7cjiGZdlVMmB
	qiMIeSSx0a0wCu4cTGgGiyO55nJBVDnZL6Ya6Vbh/5PTTxHbIBqzJo/QVITn9j9BOZpO1J8DVYy
	Xo3F+kFbR8UB2fOnoaILrMy21iuHBNKv4zlZVmLBrHKsbXXH8v1yzSwU4TpYKBknRTjQeXUx5VD
	i5+0oiOWyiY8H06cQRpDEGfyPl3JDniARgAWLi0T+SDlmUguY9WuLgi1JDeRaSkU6JrgrE9f2GN
	l5yj0gFdB4dOa1oZIAEsWrAmu5SAeUTODYWBrQmwqzrFeywOzEu/YqxYs3Ts5+jSZDH5r6IgYMq
	q7tyEqfIyRUR200Nq6VmI//hO+IQGQPvj1FdIdsRn4xe2exynxSeEhDFCA3USQTeF1UYk4TfeKZ
	Gw/t80z3DiVTZQk3ApCBn3SoYKcOqjAZ1X7uZJKVQZGMRGgun7jT09kp4aYQnlFM46bMKFf14Nu
	lwg0a4=
X-Received: by 2002:a05:620a:258c:b0:8d0:26db:4f9f with SMTP id af79cd13be357-8f8f4bc6abamr346010385a.26.1777433441844;
        Tue, 28 Apr 2026 20:30:41 -0700 (PDT)
Received: from House.mynetworksettings.com ([2600:4040:2afb:6400:d695:5459:e421:6754])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f940051f0bsm69833685a.40.2026.04.28.20.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 20:30:41 -0700 (PDT)
From: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Subject: [PATCH] staging: most: net: replace pr_err with netdev_err
Date: Tue, 28 Apr 2026 23:29:34 -0400
Message-Id: <20260429032934.10683-1-mahamaryamjavaid@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace pr_err() calls with netdev_err() in skb_to_mamac() to provide
better context by including the net device name in the error messages.

Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
---
 drivers/staging/most/net/net.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/most/net/net.c b/drivers/staging/most/net/net.c
index fffdb60cd230..fc1dcff107ec 100644
--- a/drivers/staging/most/net/net.c
+++ b/drivers/staging/most/net/net.c
@@ -81,18 +81,18 @@ static int skb_to_mamac(const struct sk_buff *skb, struct mbo *mbo)
 	unsigned int mdp_len = payload_len + MDP_HDR_LEN;
 
 	if (mdp_len < skb->len) {
-		pr_err("drop: too large packet! (%u)\n", skb->len);
+		netdev_err(skb->dev, "drop: too large packet! (%u)\n", skb->len);
 		return -EINVAL;
 	}
 
 	if (mbo->buffer_length < mdp_len) {
-		pr_err("drop: too small buffer! (%d for %d)\n",
-		       mbo->buffer_length, mdp_len);
+		netdev_err(skb->dev, "drop: too small buffer! (%d for %d)\n",
+			   mbo->buffer_length, mdp_len);
 		return -EINVAL;
 	}
 
 	if (skb->len < ETH_HLEN) {
-		pr_err("drop: too small packet! (%d)\n", skb->len);
+		netdev_err(skb->dev, "drop: too small packet! (%d)\n", skb->len);
 		return -EINVAL;
 	}
 
-- 
2.34.1

