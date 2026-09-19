Received: from smtp.inf.ufrgs.br (smtp.inf.ufrgs.br [143.54.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFD735DA65
	for <linux-staging@lists.linux.dev>; Sat, 19 Sep 2026 16:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=143.54.11.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789835979; cv=none; b=kTMOZrf8lLVQ+V56gq10fwT4n3ik2eVA0Ta0MpeFnt4Eot1Uog7Ivvr6R0XtUjrc7l6sGMrbrez3OVKMyuApg7yuq8jnqTzn+C5LC/6hoapcfAtMMZf7tSsIi6A2wQRxno9lGzZ9YvDEIVb5iXNQMLWc1dBySTKS4g6L44NLio0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789835979; c=relaxed/simple;
	bh=i3G2jf5tXlyz9D0tOx9MCJGy2wiS0fi0DZnIJuhmyhg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g5YC7XLQuzCE4YuYOV2oMq7a8FwNLgGQmw0UFqYsXPkxp2FhqxQSdeQZiu/5I1zeD6ImYFbtcPVdlBAOIP4C/vhHH3KdWYir3Sv+5wIPP+CN48T/JRxrcLIGTgEJtROA6bLzjAs5HO1OKI1QM6nCzSDJV4rXcvtanvhajnIeFFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inf.ufrgs.br; spf=pass smtp.mailfrom=inf.ufrgs.br; dkim=pass (2048-bit key) header.d=inf.ufrgs.br header.i=@inf.ufrgs.br header.b=A43sFXvq; arc=none smtp.client-ip=143.54.11.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inf.ufrgs.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inf.ufrgs.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inf.ufrgs.br header.i=@inf.ufrgs.br header.b="A43sFXvq"
Received: from LAPTOP-R01LEAQM.localdomain (unknown [189.112.72.190])
	by smtp.inf.ufrgs.br (Postfix) with ESMTPSA id 6C28C12109D;
	Sat, 19 Sep 2026 13:39:26 -0300 (-03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inf.ufrgs.br;
	s=dkim2026; t=1789835967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nIuxeQU38bmJqFWPhFJa4/OkmhYAv8xyY+EWoichy0o=;
	b=A43sFXvqUfYBGljego8jRmH2N4DcaRguYxWplDcux/d0u47wt61VjJ4xFVPAuiG1EFejhg
	UZAzBSzlRXku7h0y1+QjsnRYw150bHkYOrTNN5/BEJ5WDJZjvcdmXed/5mybW1h1tbw8HR
	kB23R1Xdb8fLhwALzoW1hdpXn5CCujR+08VetEr2j3Bx8eheHzer9NwxR0u0e82Egp6d6m
	zNS/n4GUUE+gRhxc5aR1e8xBRx0Z8mcKOWcDV3HQzbqehDtzR2j/Lqeq/CV4BZyQWKAJrZ
	1aJrFfpewjW/CdU6nKHm7BGlvbNB6Z/xwesgabcB89qulEdtpgAgnTnqGF1FqQ==
From: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
Subject: [PATCH] rtl8723bs: return bool from check_pending_xmitbuf
Date: Sat, 19 Sep 2026 13:38:57 -0300
Message-ID: <20260919163857.23772-1-matheus.aalmeida@inf.ufrgs.br>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

check_pending_xmitbuf() returns only true or false. Use bool as its
return type to accurately describe the function's behavior.

Signed-off-by: Matheus Alves de Almeida <matheus.aalmeida@inf.ufrgs.br>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c    | 4 ++--
 drivers/staging/rtl8723bs/include/rtw_xmit.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 95350fd6a94fc..634320e53aabe 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -2469,10 +2469,10 @@ struct xmit_buf *dequeue_pending_xmitbuf_under_survey(struct xmit_priv *pxmitpri
 	return pxmitbuf;
 }
 
-signed int check_pending_xmitbuf(struct xmit_priv *pxmitpriv)
+bool check_pending_xmitbuf(struct xmit_priv *pxmitpriv)
 {
 	struct __queue *pqueue;
-	signed int	ret = false;
+	bool ret = false;
 
 	pqueue = &pxmitpriv->pending_xmitbuf_queue;
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index 873807fcd0dd0..7d429300323f9 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -456,7 +456,7 @@ void enqueue_pending_xmitbuf(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmit
 void enqueue_pending_xmitbuf_to_head(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf);
 struct xmit_buf *dequeue_pending_xmitbuf(struct xmit_priv *pxmitpriv);
 struct xmit_buf *dequeue_pending_xmitbuf_under_survey(struct xmit_priv *pxmitpriv);
-signed int	check_pending_xmitbuf(struct xmit_priv *pxmitpriv);
+bool check_pending_xmitbuf(struct xmit_priv *pxmitpriv);
 int	rtw_xmit_thread(void *context);
 
 u32 rtw_get_ff_hwaddr(struct xmit_frame	*pxmitframe);
-- 
2.43.0

