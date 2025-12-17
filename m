Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF9630FC04
	for <linux-staging@lists.linux.dev>; Wed, 17 Dec 2025 14:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765981564; cv=none; b=mOx9HWdlj4B3qHxYj9UggVTiIM7tJCXU/Nf+DGCtQ/9c9YwswwAEEwgAW3mbTtKY7AGwiT7EO6QHH4xngJYnr9p2RNaTvFsYTM+G/TgGIze/ZBNoa5OP2/NLPHz3HnfoLhOCb7ONt5J3wveY6MBEbjIhi4VlikZO/vdP9zEn+/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765981564; c=relaxed/simple;
	bh=MMQufte8uMxfLl4336FpOzPVa98EpnOQ6vZAtVXcGig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tg9ksM+y+Uigboms9XkIFqxdBpvMtqEK1ksCn6XOIY8+yyaBkKamoCt5z9vNQmfR/6/gkvtlF7Xf19/jZLPW0IzPG4J51sjSyeDaRbMP7V3s15kw4XaMD0h49urCSxxiYGRU+B2EPGFL6oR+G0uWaK2+b8gM9QMU/npVVmcpA7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I1xvrfe2; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1xvrfe2"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-34c565b888dso4345316a91.0
        for <linux-staging@lists.linux.dev>; Wed, 17 Dec 2025 06:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765981559; x=1766586359; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QB7woGnnTm4TL1giS9i9ZKAn2hmtsp0nQQVgiyrPAh0=;
        b=I1xvrfe2Y1yPW8nNlKBB77zXOQsbQ0+scfJiPy/ArjnHbJUPBYHB//wpvDhC8cR4OU
         z+DCLYUCkERZgyDvuhQPc3BTnm9s6oyRhQzc/ty1wUSDVkNWLfsDBZbsfXV3lCsycbCA
         GYgIU0oY/ErTkbzkBZyuQ2WQwH25LAeJQi2NCfYvcJxWiVFmZ6Mn68UwnvSJwGa4c1jL
         1qSxli9OO29MLPPTcokvmdXPh2AYgQYjOTYvlDQckQG1izI89ty+xXSj6v9PMAP6q+Du
         RlQ2XdFXVJpuCgrx25wFot5yqNyveVMaLlsB3hn2T8LxSQ2cwE6S6EMqBOa072x9LAaW
         WW4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765981559; x=1766586359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QB7woGnnTm4TL1giS9i9ZKAn2hmtsp0nQQVgiyrPAh0=;
        b=NRZiJuJjJdb07wmGRgnwcGK6oiEEo9HOue9A6mCIAMNphDXA587d6k7Y0VZMf1z1Vn
         vfLSMnFewU6eR6qbEpHNb4dw5mCZlu51s4CxsMg35KzX/J1K4KCTqP3jpH87jvqLlMl1
         dQ4vudq0tm+jXulFNiNWKnsnV7vM3yjwOw7axlATde4w/XQSqK1wmG6q+DLreRaARbjg
         TB1WxSK54rFrO+oM5QBgPbEE9o8+JlhwD88csUID6x7NOGgKntXlc4NvRvBylhZbbr4m
         xo3pExBDPn60wkWi86eE4Ze//koxn1SBQgAzNFUPogtytasTXok3Rxg7wTY6RmlTS2Wl
         GaQQ==
X-Gm-Message-State: AOJu0Yxlp8pEv1Jt5wZlKSNCKfuacoMWv56vTPE4dfJ8ybc02p4or8m+
	kx5hY98yHhw5ZdeTi7PjiSemADEClj52/KXu0gDbDbGpLfYWK/M1ct9Y
X-Gm-Gg: AY/fxX7fYQuIs6NualQR+rf10h+3kjs7PmBAE0FRLzfB8Fvw7qoGqOQ2fgfKzgzfDAE
	0i+TR/Z9ayIYalAkZ7fckadNq1cFVeC/gcU9gopSDQbBd47zaJwOEfRGnjz73/akHiRoweVY7dG
	sadtevU+UUSM/8YXEOnF4mFIxbosIJ26EsDX2t0a3gYDBGPe2SkLQDBYtSDkwRSHfJSmyjnBAD6
	Nopl6mbQZqwCVyrmYSSioXROFSMQWEvij2xfZrBHbeeG5n8gD+OdrpzNwj+qoq8teWA4ObI7qfp
	RcyGrCNMy+grZNzQao5y1fSmlVndxKc3aD3/KZKED7CFQ3Kw+09neMFe2RDfiZgtTmSHghnAl73
	Z9meK8Gv8If7MMvid5gU7M7EI0krrasyt37RLmMpQ/fRAHqJyoCF06C2aXrnc3jSDYyp1YMoDYO
	QwVrWZpBpK
X-Google-Smtp-Source: AGHT+IE0wwRbZIbYmzh5WDlXHk2BhOXC+0UdNoCkmA+cixe2PiUUAxDhUj0cTrGEGXqeclBFtfSEaw==
X-Received: by 2002:a17:90b:4c:b0:340:c64d:38d3 with SMTP id 98e67ed59e1d1-34abd6e0220mr18576614a91.12.1765981559367;
        Wed, 17 Dec 2025 06:25:59 -0800 (PST)
Received: from ubuntu.. ([211.234.192.122])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34cdbacc1dasm1544331a91.10.2025.12.17.06.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 06:25:59 -0800 (PST)
From: Sanghyeon Lee <sanghae778@gmail.com>
To: gregkh@linuxfoundation.org,
	karanja99erick@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sanghyeon Lee <sanghae778@gmail.com>
Subject: [PATCH v2 2/2] staging: rtl8723bs: remove unnecessary else block
Date: Wed, 17 Dec 2025 14:24:44 +0000
Message-ID: <20251217142444.5530-3-sanghae778@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217142444.5530-1-sanghae778@gmail.com>
References: <20251217142444.5530-1-sanghae778@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fix coding style issue reported by checkpatch.pl in
odm_CfoTracking.c

The change include:
1. Removing an unnecessary else statement after a return, which reduces
   indentation and simplifies the code flow.

The change verify clean with checkpatch.pl.

thanks,

Sanghyeon Lee

Signed-off-by: Sanghyeon Lee <sanghae778@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_CfoTracking.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
index 0b70509f553b..166af5f6c9e0 100644
--- a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
+++ b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
@@ -132,8 +132,9 @@ void ODM_CfoTracking(void *pDM_VOID)
 		) {
 			pCfoTrack->largeCFOHit = 1;
 			return;
-		} else
-			pCfoTrack->largeCFOHit = 0;
+		}
+
+		pCfoTrack->largeCFOHit = 0;
 		pCfoTrack->CFO_ave_pre = CFO_ave;
 
 		/* 4 1.4 Dynamic Xtal threshold */
-- 
2.43.0

