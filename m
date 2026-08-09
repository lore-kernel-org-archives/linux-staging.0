Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1CD361964
	for <linux-staging@lists.linux.dev>; Sun,  9 Aug 2026 16:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786292143; cv=none; b=RLHaf6i5IUUnMxeH+bWGw5fGbwOapn0klalPi7Uk764PlqXRdbo6hpBXyXbwF5TJTGER5wnGvTLYbc6MIJGYkT6f74Ondowjd+dRvfCohueHZtBBPPWsApX/1P9oaX0lNolslL+1pP6pb1jD3A65iAzU6UJ1faxDha1GUvIozYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786292143; c=relaxed/simple;
	bh=AjswW8PQOk4wdyMqDdjVB41kHqmW9yJF7eBdw1SdKZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bg9dSbOORy4kr4cTszEKexVcbmu/goMhiAys3klisByChn8Jomw4eltULEeNlEx1/5Z5ncUTeLdJGWSEiF7ZItMwwF0WL2A3s6EMkWnGi/lSr8cjmwfxIjm0KAHZ59E56euqPCUk+70B2hQL87n1ZbN+EgX5Vv8k81zcE/FUxLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ltvA2DY4; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ltvA2DY4"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso12280165ad.1
        for <linux-staging@lists.linux.dev>; Sun, 09 Aug 2026 09:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786292140; x=1786896940; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZVNjlv4HjI9wpOV1E7bXNS9S+gqVfTm8HFQb356tzq0=;
        b=ltvA2DY4lA2vCy4LiGByI5+Ra7+qIWuGN3+zGylUl8PwWrgdMBx6DDhWD103GqGXA7
         b/naysaqGIrBX9AUMzz4WBf3GL3xfuhP3yJYwNRKlZ/mnr+/gXBbgpdQHHus4os6ldmC
         LlGBiVznbTa1yzY9p3Ih08HpZrlGbVw/rcnhGJqMA6eMJlUPMExbvTFvbH/5x/QZNDHa
         Wa7qcdzPx7hxMStAlhwr3ybBnH3vKuEo1Pu6PS+66vl1S8pCFDIEAvZsMcYc9IsU0HlU
         GVwg3X5gK8xN4x4TXciMiM/USiDio0LzJXnKw62hAaeljuO03W1c4N7cOeGqp0+JORE9
         Wwmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786292140; x=1786896940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZVNjlv4HjI9wpOV1E7bXNS9S+gqVfTm8HFQb356tzq0=;
        b=gcnk5eX7aOffMFXo78yyKtUw/wiAn/mJ5BMvO2XrHO4RA7IH2tS3oy0AnsVysGjWFA
         zr4fcq1d0VD4+PYITkHJvsNDuF+dYAmKS3PTvi6op7B/VNuxOVTGeRHW2yA/IgFb2wDH
         cuM/WzrYfG5EWZH2gByP16uje0Vw34zoUHvlZUCHYaUiOdPmn1zzOGCTXQxU7lk3Y5qw
         zEimQGotwqqOlI2xm8fc03WGEPD6En5eaexbnI9SKiIXd0LilUxqg9ijmtNyew/QjRv9
         l4eet3zb8ks6H+xfjLlpjLeAZxsfnQh4YicMGChCbuQyR3BaCivGHWn1UIDLJT3WOT5C
         4AqQ==
X-Gm-Message-State: AOJu0YwgM9lHdXBq9lpnor9BbQE4UVGlkv78nw8d9jUp4wZoCaGbtJAg
	w1gScFED+ssSG9eXL1GROKRkaFeGc4HLwVw28Pq5oFViYCMmiwHXYpQJVsXg6w==
X-Gm-Gg: AR+sD117ahvWucmC/cb/hU9qqzQGUy7MVGxcfIygDDBbb6eqCTdTt6n8ZVxh+lND5oH
	gKyIKSnDsQ4DTyk908iLk19CznpZopfvxaneCzzW0Her44ryhKZteP0Vvjjn+xT1ITl0T7Oy6Ov
	+rb22WCHsiudFW7rJlPl2Snp0GrME/zmhQ0wXirbZuXFoykLlrP75a4zR2GLKAUfRv448aQwCa0
	EGec/hqznlWcXPoHs7Dsc3hVZzX17S0PTbFPFulHgqfpM7dhu38H56OgI5n6xDJRtu2c6kXqW9W
	P8WCRCxxERIlkmiUpVL+P8TMzPpZ35ajhD/eyqhUjsnELL0PqJ1bUX+QmuyLUFYinLbE4/h70lN
	He8REPC7k6Ysr6HWfRW5awNDa23eKuk5osyYFv/k6a7ZDncUbgm+tJDg4Oi/90ULGb9/BsTB0e4
	PQsuHWQeZx9NHFw9LuTF19bn4BhouPoJGKvD2cTvpMudtQuU1BptWF54YBrpNt2Q==
X-Received: by 2002:a17:903:4688:b0:2cc:f5aa:9513 with SMTP id d9443c01a7336-2d0ca7fbc9amr467477505ad.10.1786292139819;
        Sun, 09 Aug 2026 09:15:39 -0700 (PDT)
Received: from localhost ([103.210.95.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be8a6809sm33699050eec.10.2026.08.09.09.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 09:15:39 -0700 (PDT)
From: Raushan Kumar <mitramaurya80@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Raushan Kumar <mitramaurya80@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary else after break
Date: Sun,  9 Aug 2026 21:45:10 +0530
Message-ID: <20260809161510.228179-1-mitramaurya80@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove else following a break statement in
enqueue_reorder_recvframe(), since the preceding if branch
already returns, making the else redundant, as flagged by
checkpatch.pl.

Signed-off-by: Raushan Kumar <mitramaurya80@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 86c5e2c4e7dd..51536f155750 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1789,8 +1789,7 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
 			/* Duplicate entry is found!! Do not insert current entry. */
 			/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
 			return false;
-		else
-			break;
+		break;
 	}
 
 	/* spin_lock_irqsave(&ppending_recvframe_queue->lock, irql); */
-- 
2.55.0

