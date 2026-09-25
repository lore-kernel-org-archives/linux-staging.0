Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA9F34BA50
	for <linux-staging@lists.linux.dev>; Fri, 25 Sep 2026 17:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790359090; cv=none; b=Oq9vBajGbrxjkZa/DRV22bYJBdhFax4MY+yaslBC14VGTw2fAL0rTW5RPFtWl6fEmsHx83TYbp5JkPKVG8IvDjoRNPW9gAO6GhECTHxTZa9KaWw5Sca5vbdgrdlVFtiG86XyMxkJcjXdGyXvYalHabEEswVY9DB9s3yxzZwFMhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790359090; c=relaxed/simple;
	bh=dy3kayxY7ahbDZ1Ym1aZTstg6nWrbiHbpjNTJMoYFg0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CTQ79pGKP3FI6GYf0y9JsYdyJ+QCpJmZI1zWZCiO65auZNAeUbdHlgnH13L+C1MJlRzqTV9bCNIXR1K5ls/QD8gwEk99+xps6saAgk2FheDSqreW6veV8ANdQpbiPFJIlSflNSoaB4dO65dXQ+cJNYn5YWPKIYrPtYNxqyV23HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGLROkgD; arc=none smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGLROkgD"
Received: by mail-oo2-f39.google.com with SMTP id 46e09a7af769-804ef461aedso644631a34.0
        for <linux-staging@lists.linux.dev>; Fri, 25 Sep 2026 10:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790359088; x=1790963888; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xplQ4+Yy+zxL1uKzZFCMDOeucDaFR1YF5s1Y1HL0co4=;
        b=nGLROkgDUJWa2+4zvmjqA7MrYsByLvzKS67Sn4VST6McopEIfcfIbn9qT8/jR/M0VH
         p39B+x23Z9/DCqmKBYWZ79VA8U2Y1NNQ4YHzGiClZoR16dHa4vnZiOwfy/UfBLEt/cGU
         mkTZuXd0EWD//PAtVxEuDFG5uQdE+sxz/n+zfmSgmINV7Hgx5MEa+5Q4+LjZZVe70cb5
         DS0oari102TAuchCNWLtAOMON8c3bWwIJ0fWqpzef62LU9jSpZhCx8HK/YrK9c9IjElK
         KtE8TpYyvP9dvFxh17+xoEamkfM4Gw/0bekWHhJtumU9PWiwmt7//XTIoV10Kh+ZRcGF
         o6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790359088; x=1790963888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xplQ4+Yy+zxL1uKzZFCMDOeucDaFR1YF5s1Y1HL0co4=;
        b=qEQlIU9oO85qjOrFt2Az64Eov1rMbvWv5857jxL946iH5GpC7PXNOdgFTMEZkDB8HH
         uBJuP3ydXovgTAJumtZapXppuxES9ggRr/dhTwXZUZcynzqQl6F6tizQEW4DJ3rs5yfo
         GJ71K7WQ5LvoENACgYRgihbrJhjRLgB9rrce3kVCSJ6gVUlN7Atm2DVKUZ2qM02WWzw9
         8mcKjS4EBVHzi2qa4lwA0bvtZfaOVteWCpgF+Zp/3KwxwdSyLxPzi268bjEwbcy2s8fL
         xOZcSc5dj2SZnnPbD2RrVDuN7X2xLves8IC0u+PqES711q99dK4vSwfLFn9lJio1rHo1
         AG2A==
X-Forwarded-Encrypted: i=1; AKwUvByspoUgTQf6tpo6vWs4E6hH0oF+UkwPj6ntAcvVI6BlVU0nLGP1U7NnPf82rH4LziJgbVjxSt7umIHTAgDU@lists.linux.dev
X-Gm-Message-State: AFuF++kmzWdTKhrgnn/oEFsbAMuMeAC2eNfdy1aUPwVI5OfRvyjtTW8B
	YA8Q42X5Z2srvurPmxOhnawNz3OVOy1CeDXWfQVPLIWazOueBP7acvrw
X-Gm-Gg: AYBFou0b93zxNOnEYNLd1rFvLXVvwgWTgnq1jTnpdAizEwQ1GB44Ao2huRUWool9UHO
	RiYiPTzTZnTomjk1xTZB8sUIcsNRhCvcU8ksW49d0fbyOr+H8Q9kn33TYo/EXBUA1p9cXgP+jEh
	MGW494L2dqZBsVCbgw/1K9ANvQwWdYp1kExFFjyjZ6bZtUNUbwee5onsxfSADp6WcuzRP8flf6f
	dMGEyFCCxon2m+Ag5yB0f6H2fILh+sQUp/R846t+stHQdTA2bd+mFqcvedv0/3RK8f4HpvhI0ED
	4qugk0CZ8tRnJugFDEiNZgY2bXOpPbt5XceKmRSkemtaFVTgdmipv6W0jSpwZCYAOKwnO0xGshI
	O/LQ8zX57k0XS3i/Pb8ej/BePQGYy/PVULAIILJ1dzpJ+QMIlhe8RgKokiZe5NBNWHNYB+NEKaj
	XuCC0hJ/OlPSZxMjH362ZIBzowuiQ8DbLhrjnctV3WAVWV0XPzr/QtNUbZ0c32ZK/OHvEJo7jX8
	MQ=
X-Received: by 2002:a05:6830:2992:b0:80c:4d85:9aae with SMTP id 46e09a7af769-81784686d37mr7362881a34.15.1790359088158;
        Fri, 25 Sep 2026 10:58:08 -0700 (PDT)
Received: from pop-os.. ([24.32.17.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-818e92c1f66sm2744647a34.19.2026.09.25.10.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 10:58:07 -0700 (PDT)
From: Rishik Yechuri <epicrishik@gmail.com>
X-Google-Original-From: Rishik Yechuri <rishik.yechuri.code@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rishik Yechuri <rishik.yechuri.code@gmail.com>,
	Gabriel Windlin <gawindlin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: remove unnecessary parentheses around prframe->u.hdr.list
Date: Fri, 25 Sep 2026 12:56:26 -0500
Message-ID: <20260925175627.227374-1-rishik.yechuri.code@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed redundant outer parentheses around prframe->u.hdr.list in a call
to list_del_init()

Signed-off-by: Rishik Yechuri <rishik.yechuri.code@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 3c82012fd..71362a4ec 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1796,7 +1796,7 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
 	/* spin_lock_irqsave(&ppending_recvframe_queue->lock, irql); */
 	/* spin_lock(&ppending_recvframe_queue->lock); */
 
-	list_del_init(&(prframe->u.hdr.list));
+	list_del_init(&prframe->u.hdr.list);
 
 	list_add_tail(&(prframe->u.hdr.list), plist);
 
-- 
2.43.0

