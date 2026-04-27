Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B043ED13F
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 17:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312750; cv=none; b=cIZYkLS65dbevXFMGvrz/2JK4uj5FIqcNYI3S6QsmE9m9+o8/F0i1mBMSD4tcUNfp+sZqk1WM/GnxdBYSd0uKZNrk2E0Ky4BuhgaNRPTjbrSs00KXgDakl989RyPU0507G7/aUwxFX8SYRx+RvV5LvaYaLJnhr/+cX0f8XS4cM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312750; c=relaxed/simple;
	bh=XM1QgPNcUxSQl19xq6wF6sZSJfkH4vzSK8eFHQX/s0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uwbnByA9ndVZSh2rtBg17K6Nb08fBR7B3y51ngL817Hh2NHx0Eog9WjM1sFF6efVNdrDuxoGwJaF6r4Odl1d+HYj87fJftryf4NUYQaAqGvzKeDBKNQ5u1VGKbhXz2AEs8wwGemv7ezXi3q2jJjlkP+Cerg4LGNS+C9FrYMI34k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=mLjO0Wad; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="mLjO0Wad"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4g4BCF1PcKz9ty2;
	Mon, 27 Apr 2026 19:59:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777312745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GSv1NSgWrwsrU3+kzaarzxFkS8de9ij1j3oABE/IP+s=;
	b=mLjO0WadTU9e6sYgP5XyEJCY+veCFf5P5+K/DpbTR/uYvq85iTa0ZJB7KnlSVxEx1bXT9D
	dP+71rvAkVkb+/f/fSFPgg2gn7jPDUE6kRpsoNTsPbkUquZ03q9IJCN2y/M7qRulH/fgq5
	E6+uXQkNpK7f7xloHg0skw1vJj8y6qKPxSP7ZGsO9gu6UFNetzoYpHjbBnND6pI/+IZyEX
	MM82+U4UeK3veKnQ9+ZpASXUQGKrlt1ptYc+Zhs3wmYLrXz3imy/o1tI4ZstRMOwdyQ+Mn
	34uI+lfoUqtk5tuWtG5/+pP3MwDlgj4N7214GHQPrle8EVySA3mDvoiJbfCqig==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Subject: [PATCH v6 5/8] staging: rtl8723bs: remove redundant braces for single-statement block
Date: Mon, 27 Apr 2026 20:58:43 +0300
Message-ID: <20260427175846.23470-6-khomenkov@mailbox.org>
In-Reply-To: <20260427175846.23470-1-khomenkov@mailbox.org>
References: <20260427175846.23470-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: tyrdr9jjghpb7q3gnb74aa8nfabjgrqk
X-MBO-RS-ID: 97ad70a8a06f47507b9

Remove redundant curly braces for single-statement block to improve
code readability and conform to the Linux kernel coding style.
This fixes the BRACES issue identified by checkpatch.pl.

Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
---
 drivers/staging/rtl8723bs/hal/odm.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index b01e9016e30c..b4f872f4d6c9 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -380,12 +380,9 @@ static void FindMinimumRSSI(struct adapter *padapter)
 
 	/* 1 1.Determine the minimum RSSI */
 
-	if (
-		!pDM_Odm->bLinked &&
-		(pdmpriv->EntryMinUndecoratedSmoothedPWDB == 0)
-	) {
+	if (!pDM_Odm->bLinked && (pdmpriv->EntryMinUndecoratedSmoothedPWDB == 0))
 		pdmpriv->MinUndecoratedPWDBForDM = 0;
-	} else
+	else
 		pdmpriv->MinUndecoratedPWDBForDM = pdmpriv->EntryMinUndecoratedSmoothedPWDB;
 }
 
-- 
2.53.0

