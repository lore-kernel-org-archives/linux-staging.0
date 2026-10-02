Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A1E46A61E
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 21:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790978337; cv=none; b=eOaYmwzqYDoQwOpiDi5brU1lVs/Kuy00uMm6tpD8INMz6aDR76gnDuNgQEbBv78GhZWEgb+JcIMH6Tz+M404Fybaxj+oLvfwf8MBcGR/0IqcCRThJ06wCAMDwsp1O3TGl/oNRMrKXi8MsQCVB6LpYGjQiRqHq+emJ4O1AXMCUkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790978337; c=relaxed/simple;
	bh=j80P7l00XnmHRZHdGp8CzEXbk0WPC0THXDmx4MUywrE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LCvr6t5UgKetzwViZU7Le6TV/Smh+gWLjF0sOJ6VjTWKEl0QIvJBXnP6e5tnlLjWuu4cjOSzAA54/JksheEhhTmXIHJ83PRCFOeGEMUtRpHtUfvfV7D/0O7JaOGljwvxVq3wzvi/y8/x5J9z9Tf5vvkMB4uZKhAoh2U1h1VAcqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GkFgf8rF; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GkFgf8rF"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b00a0ac65so192027f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 14:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790978333; x=1791583133; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wbJKfMNmSOP0Jb81UPeO1H5ayPU1ZkD0MoI49de1qyo=;
        b=GkFgf8rFerw2EZdSQvPmvlJO29YVIFao/9cZMoLsZOkVBZcTih66mDYv03fv+AlaML
         +mJAwwVWcvw9LAzrmOoL3r8pQDbmgnkUh+sr7+CRZK/QKwnSTHJrbWeY+GdV9xL4vJl/
         Gtl1FW6uSYhu+VeUl/ATCfnGIeTf9YaDn1Q2mxhdNszlX8F4PvTHmjCKraxrNMdU3MNA
         VccFvTt/fEqeobVCOk9UsYbzdy0R4GhCcyejHxsllnH1/EKsKkmQAs/im0kLBEod3IBo
         YpH86qdxsGNy4GmSIaJLSuRQY9nvwbishnl2HMfFeQ2LLR+dxOxDLJC4cLlP1UjOy1qB
         jIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790978333; x=1791583133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wbJKfMNmSOP0Jb81UPeO1H5ayPU1ZkD0MoI49de1qyo=;
        b=YsPTsNDdjQQGnhjW4o5w1gy01vqzCGBGNBreU4FQ1BuQUKkGKj9MByjGEEoWfJfik0
         /ly+EN6XsJxk4rvkla+0MIG2gEC07BA8zdxt7XY/HQIxdfNYNjjWnufU3XsNHoDLZ9Uh
         chLgUFpJMkHoGIN/kS+WY8Pew4b5egmVXt8xMTw2GRIOjxwFlODSx4enLXkT9Wr1i/U6
         pdscZzhQV5gupjjMCm9CH3n76/W5wXzWUCd0Ay4z0n8hw9z9gK4DanpJSa2mKdzWvZb1
         G3onhY0F38Go+Lw+NSnRBjpj3RQltP92zxMxEJwxq2ncT/w3LNBwsGD+TQztpz3Q60RO
         6x9g==
X-Gm-Message-State: AFq9FYJbomDR+juZCpj/bXMdlbnEk7XAc4bUlaNoLkG0hCVXhbx0LzQx
	7EhDCcV6XpDrtklomkJRpwMC3jMGugmWiqOaVQ5GrhOPFB0BnQwkAQ4l
X-Gm-Gg: AYBFou0BuIJnIZx7EWbvXmfMLjVPDp1PspMEz/hggxTrFu+4XCkuA4Viva4Q3CbqOlF
	fN1kXZZNuAQsfcm45/QqkIXJvHf5kTp/IEVII2Xc4vlIot2KVeGCFtApATN1Dg+Kk/4SBaYQl7b
	eib/C9Uy8+XWtoikZom6tbzrsq97kQELTaoRIBse/BFoQyIGQrAVAteTKpGGJa9Wn09FdyO9vpq
	PdIBW2l5p1c8p/dwpa8jpbKF76129Yf8VcDA7rE0cG6bQH0x4n0v9/kZoOiXTssh5zmGQQXjU00
	fbUkGouYP8V9kaXkTMpflNF5yPpHX6FMg4/fwyWWjayQcUexU3tmzvtlYbBh4CcgV3bXcwe+HA6
	f19omHFzEttvMrJD+MEc+d812VVfxn6rYuLz2xDjP3g7WCqaYwoE2Hb5Yyli7YxzDU/wtlUEf+j
	hzMCE406nlayxVdZAPh0c2jLl7gpH//PdR+i0Krtju+7nNRZ6Vc7ub9an0q2MiNvx8qq+5c0G3l
	zOJEOwOZEvBq/T4Paj9ZypCPF907FRY87dD0MdYnEs=
X-Received: by 2002:a05:6000:2c05:b0:48b:74b:4ce1 with SMTP id ffacd0b85a97d-48b1274a0a9mr6863863f8f.32.1790978333619;
        Fri, 02 Oct 2026 14:58:53 -0700 (PDT)
Received: from fedora.netbird.cloud ([2a06:5904:28f:7600:961a:ef3c:e30a:fb0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38306dd4sm7911770f8f.43.2026.10.02.14.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 14:58:51 -0700 (PDT)
From: Luca Hernandez <lucay202@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Luca Hernandez <lucay202@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary parentheses around list pointers
Date: Fri,  2 Oct 2026 22:57:46 +0100
Message-ID: <20261002215746.81683-1-lucay202@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the redundant parentheses enclosing the list macro arguments to
align the code layout with the standard Linux kernel formatting guidelines.
This resolves the styling checks flagged by the checkpatch utility.

Signed-off-by: Luca Hernandez <lucay202@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 381b3e29afaf..88e4b5c6c5fd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -58,9 +58,9 @@ signed int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *pada
 	precvframe = (union recv_frame *)precvpriv->precv_frame_buf;
 
 	for (i = 0; i < NR_RECVFRAME; i++) {
-		INIT_LIST_HEAD(&(precvframe->u.list));
+		INIT_LIST_HEAD(&precvframe->u.list);
 
-		list_add_tail(&(precvframe->u.list), &(precvpriv->free_recv_queue.queue));
+		list_add_tail(&precvframe->u.list, &precvpriv->free_recv_queue.queue);
 
 		precvframe->u.hdr.pkt_newalloc = NULL;
 		precvframe->u.hdr.pkt = NULL;
-- 
2.55.0

