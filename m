Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC1536BCDB
	for <linux-staging@lists.linux.dev>; Mon,  9 Feb 2026 12:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770638839; cv=none; b=i11zDr1PRCxqWclQ8158sdKtx0QnejfQzmltHy9qBwUsBijfp8jbZ5skH05L07+1umWT2bDmxLMatEiCtudB6/Nap7vWrJ+ta2qPTS8ohcrrwpQpxIQ4W4kVATbuLwPNz5BvtAt2e0G/KOCtOmgHgcBybeVuq/u+9jkw4JcYLnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770638839; c=relaxed/simple;
	bh=W6TNcnabJ+m4BlzL3r1Dc1OIo2LemULXrbUWzAAx1bs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JQRkOHvTfuwsg/Q7hc+Tl+mLWe6Oun2L1j6LuDIiamCja1larPW+tPawnu4qLiHmg7lPY+pt47ar4Rt7AKg/nMa39AoOojHily5cFhQeS8RS580+ySr1TCky4yXa6AaDEMmsJsWY8tAOqIwLhxVv4SvItVWMCpTNO9/nceXCKlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ALN7AMYP; arc=none smtp.client-ip=209.85.219.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ALN7AMYP"
Received: by mail-qv1-f68.google.com with SMTP id 6a1803df08f44-8947e17968eso52541986d6.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 04:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770638838; x=1771243638; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PxjceD+zkvqf/hu9w1e7zS78YE1wiRoLcWqIxTi7DCs=;
        b=ALN7AMYPNUh/0nyhUqGk4Oxno8TFWdOk99BqqJHjkH+NspeTAY1Zx/8hQmjrfma+lM
         1/6LgjluViJpuCy7je8dljbcdgLrn2NDuP8T9CUoU/clzkOsq27Z5Sm+BApPIu6tuoNR
         K1Aa7UQuL4W+vDtR0+85+jUtmjwbtzcPc4d67nT4/MSMyB+n3XGxpMnXbNktpByDnDbN
         gqYJjItRqmh+dmMIgyEnhjWjMY4xccpOzDl3p1MsysMbU99pAuA6JJcZfS901euMVZQM
         ZWftSgqr6RTQKfNvJGXLknw6OKZn7wNAVgUqGer037i4QsGa47BsiWIKjBjUgDUPannM
         6EdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770638838; x=1771243638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PxjceD+zkvqf/hu9w1e7zS78YE1wiRoLcWqIxTi7DCs=;
        b=dcUawfEzxaY0j7ZhRWVBD0V6aNlTTar/f3pvpTiCMQWCHcCbw1SgPJ4lSIMb5SKwXu
         wZO/n1gcfPidBTrgy1i0TVi8WHdjT76KBfszXkP4ZZh822lAxGykVgWCArnCdrrzrLFn
         7Cc5sLd+HnhlWS4pGKxpokAmkRw0krxt59LfBoNl4A7Kg2Axx9WQ4QpRWf2SFmnbwCWu
         u8z6FXg+L8Z6HTNQ24W21SEp+ofheGkE8EHDX4pJbPGjYCtnPykd4fdeKRpOGA7Mi5Vy
         paPW1LJYC8RTMkEzdFaIpcGpLzhlDuBfWFTDd0oIHZQmsF2p1ssuaKD5Iq9bejrvEDPC
         6UuQ==
X-Gm-Message-State: AOJu0YyGxyE4G7X/KI6c5m5TshQ4oZj8DHudjbUDH79vDAN6XdWOvtqw
	ZR4lRb+sjonoW+awNQqVUUD1iHNHWUynh2caCN0tZoDkKK52BsVCmXvf
X-Gm-Gg: AZuq6aLj2GXNlvgzl+KXoJycHdvLOQ6D+A83xvOL+JgkUK1PIDs4u2lHTzbccuPt+nd
	1H8n9hm7wrfMWsWMd9kTXqvD7kI4X5iYOqw5OMLS4dZJJUleMhhT2ANAx1YTRGQOMVyU38oDpKB
	SzBvWlNyfUn1AcFHt+mnEIC5KXgWzgnPt3Y9/xgpkiK8tEwRaRpmUMFkexjXB6QnSFvaZFWcmMQ
	SKLK453vUVTvCTL1j4Z9Lj0b3/9iU96f1uKo5yO+aXixVG/tLXObRJW/JEN6zdh5jcid9EsCumn
	e2lYVjJ34y931Pq1h0SH+Y9ce9w1YrDDTSDmJPVp+JF80EtRVQ/6Oo0WcyBC9VocsxT2/Pb/N1z
	aCNLrAm6UC8J651vYZ9YYR0xS28jv24ugY8yOy1m//v/z8bw6LPt1iznO/P5bDLcgJdpL1Htggl
	Ct
X-Received: by 2002:ad4:574f:0:b0:88a:2fd1:b582 with SMTP id 6a1803df08f44-8953cd9cc5cmr154851106d6.47.1770638837736;
        Mon, 09 Feb 2026 04:07:17 -0800 (PST)
Received: from deadibone.. ([118.141.233.34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8953c077a8asm76467926d6.52.2026.02.09.04.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 04:07:17 -0800 (PST)
From: Ethan Lam <ethanlxkernel@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ignacio.pena87@gmail.com,
	bryant.boatright@proton.me,
	strnad.jj@gmail.com,
	mingo@kernel.org,
	tglx@linutronix.de,
	Ethan Lam <ethanlxkernel@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace msleep with usleep_range
Date: Mon,  9 Feb 2026 20:07:09 +0800
Message-ID: <20260209120709.29824-1-ethanlxkernel@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

checkpatch.pl says that msleep < 20ms can sleep for longer than expected.
The documentation says we should "Use uslee_range*()
whenever accuracy of *sleep() is not sufficient)

Replaced msleep(10) with usleep_range(10000, 11000) so the delay
is more accurate and percise

Signed-off-by: Ethan Lam <ethanlxkernel@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index ef2d92b5588a..97c923015279 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -215,7 +215,7 @@ void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 {
 	_cancel_workitem_sync(&pevtpriv->c2h_wk);
 	while (pevtpriv->c2h_wk_alive)
-		msleep(10);
+		usleep_range(10000, 11000);
 
 	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
 		void *c2h = rtw_cbuf_pop(pevtpriv->c2h_queue);
-- 
2.43.0

