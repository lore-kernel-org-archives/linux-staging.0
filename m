Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3BE448B83
	for <linux-staging@lists.linux.dev>; Tue, 25 Aug 2026 12:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787662464; cv=none; b=dfFoasQSh1c+EznYp4hx4YioNGAheK9Q1pvdpChZxVb+vK/9QTMyRHZQmFb0VlA2BU1X33Sk9fTzGKRuiplavgR4yUAKWvoTOWoEzEk05moYnytK5fdBJH5+SKpPHXih0zheLFdc1yBaZ/YzqK+r6ONNkYQweOj3u9liHShnaNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787662464; c=relaxed/simple;
	bh=nqeG38nDL5a8Z47AnwnvVJ8gs+ktebxLeeyNpHyi08c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gX5YipdB2wXEqqFzV3nkySiL2n9FaAT4lcI0ThJ/XmbvHSek19X7VECXa+uDPBqrH+BRO0vCdTGwD1GvUiQHDwgkOzYhacCsOWxPPIaOZmbR0BlL8kuBvd1/QHFLoPUoam6bOC9LSEMLnylzG3uuY5MTNlLnbN/7nVhIHSlUh9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tw9hJFJz; arc=none smtp.client-ip=74.125.227.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tw9hJFJz"
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-380f4166f80so3371559a91.1
        for <linux-staging@lists.linux.dev>; Tue, 25 Aug 2026 05:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787662462; x=1788267262; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6n02C1GcERUh9MH3QIiNPfmbF5LPbKL1+hA+sTPgh8Y=;
        b=Tw9hJFJz6afMFxH4b72AHZ9GvkPxkxc3NZ3rKbPbYD4oaonCSen5qWyKoXXo03Ta0B
         JVLntQTTazBlxnw7MoTphShwdnWbW33zf/zdnSWvztuoEYiisLWaPNXKDFBmnutXXCDt
         hxXEDiP7eiq32Rfhj8xyuc1BY0rpO6DUI08/5/c0OV7M/gQgAtqrlJnP0KbMnCHonI7S
         NLol1hi1mRQM5czdXWPUs4ko65QM2oizhOTUmSOGpLlROw5W3oAqyxQ7+xNCuiaEeXJU
         aUJCufe9ANZw8Na+hYeYUeR5kJCHQ3P6Jj2cHhuqINvZ6zyzoEU33ptGpuezaDu0SMdi
         02zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787662462; x=1788267262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6n02C1GcERUh9MH3QIiNPfmbF5LPbKL1+hA+sTPgh8Y=;
        b=NueJCVE530itaJ4PNLJIeTpCaI4jhdMzo/K/0kF37nSO8X4tFDexB0kWS8GX9hTU9h
         KQPuguRMiuu7sxVuEG5q47hbWq6MV2jYMVmV/Hb3L87PKiTjWGSkgVryS6fgeBr9HaIl
         JKed0hYrTRe0FdtTc4sMCgm1/2ZngfGc97rAyvUp6OkacqO300bskHlS1iizHUdBozGt
         nl9IE1+2Xc37Jb4N+5wAPmBDZw56W8+EoepfMJ2df6SHdKFC9qXfVews+VHYacbTgtSe
         2m/iA6MQa1/3LDML5LQt69kGjYEM0Fanf364Lr3wYL7mnhDw58LqLiMDS5U4nRFVveSK
         VbxA==
X-Forwarded-Encrypted: i=1; AHgh+Rrt0PI7fMmMXTNUJaLIrYUbQhmBU3G8FB9hvoYPqepM/F7nhOL51oqih+s2hW0ggJgT1vxJ1YltJAvw4xUl@lists.linux.dev
X-Gm-Message-State: AFuF++mHPfmeEkvh+t+ohbQN9lkB662JAznda+nPcqeqVjsm0BMTMZ4n
	j5m8L/o7fb6zMiehWsphH0AYwu8xHpWzdtPzBZ1rRPl6af2lLq57zFvI
X-Gm-Gg: AR+sD10ro+ff2hsk9C+XKA/0eJSLgdLum+Q2O0yp9jJDtICc2rh2CT0HONLoC2NrhnY
	JXnnxTPBzTzPAbku80AEuccrbMFBIc60mo7nEyhC5jNhsPBrIRagWQQ7IeR1u+fNzeDNEM6osCU
	0lQjnRYTUvPsNM2DzbQO26zHbgf0j/CNGtlIZ7wuggqpC6E6YtJ/fbQxuYTiY8oMQTcsj8h6H6M
	u8zda897Mu8c8YPU7n84I3vg0+rLlZja2NJIIV4yeNsitbVEclKiq6U4NvcCNGnGvZXvcPZm7Oi
	C6pFfAPL8cGuB6gEJb4VC3iw8nwwfcsJEvnztsD12GHZlg89sWR02WJylLpzi9HIvg0h+SwDQIo
	RLYK/PbOBABP5zolRiAuZhW5/hXH+4T+OuMC8Q16VuuIjGHMnekn5SM5r335pHKoU/wI+PrwRCe
	9vMZKZRTTX0h9iUHFMEYKh30BRgt2surood03ehAu0T+v4uEWvRDP5M3/IFKYPYQizNMtKUm5gy
	bGX+rE0fRQxMvGkq311Dqg/L0k=
X-Received: by 2002:a17:90b:574f:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-396463f1346mr13748414a91.8.1787662462426;
        Tue, 25 Aug 2026 05:54:22 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f92359c9sm37098329eec.27.2026.08.25.05.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 05:54:22 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: make rtw_free_xmitbuf() return void
Date: Tue, 25 Aug 2026 12:54:06 +0000
Message-ID: <20260825125406.1710-3-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825125406.1710-1-dennylin0707@gmail.com>
References: <20260825125406.1710-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The return value of rtw_free_xmitbuf() is never checked. Change its
return type to void and remove the redundant _SUCCESS and _FAIL return
values. Also remove the unnecessary extern keyword from its declaration.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c    | 5 ++---
 drivers/staging/rtl8723bs/include/rtw_xmit.h | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index a1a0d75d823e..5761b9a67a9c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1593,13 +1593,13 @@ struct xmit_buf *rtw_alloc_xmitbuf(struct xmit_priv *pxmitpriv)
 	return pxmitbuf;
 }
 
-s32 rtw_free_xmitbuf(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf)
+void rtw_free_xmitbuf(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf)
 {
 	unsigned long irqL;
 	struct __queue *pfree_xmitbuf_queue = &pxmitpriv->free_xmitbuf_queue;
 
 	if (!pxmitbuf)
-		return _FAIL;
+		return;
 
 	if (pxmitbuf->sctx)
 		rtw_sctx_done_err(&pxmitbuf->sctx, RTW_SCTX_DONE_BUF_FREE);
@@ -1618,7 +1618,6 @@ s32 rtw_free_xmitbuf(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf)
 		pxmitpriv->free_xmitbuf_cnt++;
 		spin_unlock_irqrestore(&pfree_xmitbuf_queue->lock, irqL);
 	}
-	return _SUCCESS;
 }
 
 static void rtw_init_xmitframe(struct xmit_frame *pxframe)
diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index 0dad1349e52b..4fa1b788701a 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -406,7 +406,7 @@ extern struct xmit_buf *rtw_alloc_xmitbuf_ext(struct xmit_priv *pxmitpriv);
 void rtw_free_xmitbuf_ext(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf);
 
 extern struct xmit_buf *rtw_alloc_xmitbuf(struct xmit_priv *pxmitpriv);
-extern s32 rtw_free_xmitbuf(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf);
+void rtw_free_xmitbuf(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf);
 
 void rtw_count_tx_stats(struct adapter *padapter, struct xmit_frame *pxmitframe, int sz);
 extern void rtw_update_protection(struct adapter *padapter, u8 *ie, uint ie_len);
-- 
2.43.0

