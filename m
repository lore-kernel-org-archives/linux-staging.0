Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A139A2C21DD
	for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 16:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784650055; cv=none; b=H6IfkZ47xGKqlJpMf1womnqBALZuvW5veyz0Ttb66zoEOrgBIUAwgjfWBedsWc5taNrDnffFbltqJf0YoxGDDKJGeDKqgvPUZsq8Ya2i0+0W3+SmtJOUPrSXzGgyeL+Jgy+15c2bQ/AjfdfZkR3gsx9OPZuAAnfURBytGOU8Nlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784650055; c=relaxed/simple;
	bh=LKiBtk8t9+PWD5595iIkKaCbgIxDrNhX1two6J10epA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QLkB26w3K95KejFJWifAv5HYXcMHSFyrhSyhBeczOBn32fpmIFryTQipOqK7n/1s3s1Pr8DU5Ij6ws6u7ywXmgqCDCXNI2xCgrcQEsJD4WupQhAmqTmdhXbrX18VgVf/cV5MRiRm6lLtP/QCnnFqzDzq3cBJty1mCfg5BUWwb7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L4y86Pg1; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L4y86Pg1"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8484f229529so5118913b3a.2
        for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 09:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784650054; x=1785254854; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f9/QfEhkjBILio+lgT24Y9aK+Mw9oxGGyofW64Y99NU=;
        b=L4y86Pg1tFFsVb5kEOQcp6HeTM4R4+h5BBQMiFuddtDecjcD8e+7gptfRAXJizvvoF
         RMlShK5a163Z2i0nXD5LT7R757SGRrhHI102KGhNU48p3ktbFiRQKlGcnF8zAdBOm2hn
         OTGz6CseeeCJlEftEkQevqdM8XSLLLN6MLcEV7dbSbbTfEvFDRTSlS9ZzcG2qca40PZg
         7VeVJzqRs/isJ0JqCabP65dwg85OGuFJvG/gng8RKmYkxID2Gntq2OTgsEePNO4ctfE3
         9yXRK5sMSmd7T8AePaBjU/h/YW59QmdMKm9wLvJUpqjbK94m+ZRopt0HvRkhj/Qj9Lfn
         kuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784650054; x=1785254854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f9/QfEhkjBILio+lgT24Y9aK+Mw9oxGGyofW64Y99NU=;
        b=iBDnG9/yJEea3poc1/Bi7QjEL+lGLlfUAUiPPO+AhmFjF0tGO9UrJbHLckLWpIlCwz
         38N/qIMXONnhTqsBfVtzmNw6A/MoozStFCnowrlU6c/TVoz8vlxVKfJM2IH9HyJclSJ5
         6UPNk+PvkZwJ9bdCWzxC63SDwXSeYc0C3ijuynQJxRcg5ealDceJowUNJVNHmxB6N/GD
         htJ7buC9l4TDFZ8KjL4sBQuPTW6O3Lh+NaOznvuHM4FQOjnjQu+LNeayzR63BOgZ4rQG
         6S5JXhZKQtr0nz84qmKNv37gowR7mWP6nSHe/IXAqbooQOfLXLzdX2NEh7eWPmYdRHwy
         p0OQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+3pPOUtjyTMePMlPHvrekym2E0LGeVXx1SV/U9nt+jcQw/N3A0KXnGuDOnT4kRdR2OMEHmUkv31YjN861@lists.linux.dev
X-Gm-Message-State: AOJu0Yyk3CjYxIObwrqgJFBoeFejwzCR2ICU7Nh06IaiImUWq5SM4xaM
	TzSI9czKfEAhbj5cFhykr3xeMxt4RaX08vWcLolkceRFAn1rarLEbuZm
X-Gm-Gg: AR+sD10u6Lyr54XtDqYi6f7LU5oqbkJDeEIS1CPUBwJouoQ8f8qEFWUdZZ2sdkyCxfL
	jxBstBd7zxGi7MRTQWN+sar+PcON524UK4fUegqcKmBDEvsL63vJaN7Mq0EIUb9cvQs3KeZJ8gQ
	+iFKB4S5IkOQ7hLjbUPdmMO2SmYN//F0aOHAj3e34NN3gfVseTNfaozK50+5UXPE3InRTc/yZb3
	s6Zd1TRX0aWdudVFJnJ3gixWdanfVy7UDE3h9Lz5ArvdKxRdIK7GGQRqnj6kdfoGlx/lw7MLi+O
	jVp2OIGNKAPjrcAgGIMPheAAu64YErw6+Rn81F5grpI+rWtPYVATIiiPE6j2TP0gcpPFZzZdEh1
	GfX2HhfTyPrW8F9OvTX6/Rp+mJebvFTmaEpDSL7b13gTEL+HJktWAGUaxQ9wI2R+oggOyP6W2jr
	ClItl2ceHo8ubtyF7cfxyclQ0jEZSzNtymUeCjCltOx+oDxkOEVglE8g==
X-Received: by 2002:a05:6a00:1382:b0:84a:2ec8:fca6 with SMTP id d2e1a72fcca58-84c29494781mr19243421b3a.52.1784650053640;
        Tue, 21 Jul 2026 09:07:33 -0700 (PDT)
Received: from colten.. (61-227-26-231.dynamic-ip.hinet.net. [61.227.26.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af6ea1csm7841747b3a.49.2026.07.21.09.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 09:07:33 -0700 (PDT)
From: ColtenOuO <jun930436@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ColtenOuO <jun930436@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Michael Straube <straube.linux@gmail.com>,
	Nikolay Kulikov <nikolayof23@gmail.com>,
	Andrei Khomenkov <khomenkov@mailbox.org>,
	Jennifer Guo <guojy.bj@gmail.com>,
	Minu Jin <s9430939@naver.com>,
	Khasar Munkh-Erdene <02khasar@gmail.com>,
	Mohammed Rizwan Kaniyate <mrizwank004@gmail.com>,
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] staging: rtl8723bs: remove unnecessary else after break/return
Date: Tue, 21 Jul 2026 16:02:32 +0000
Message-ID: <20260721160236.80963-1-jun930436@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

checkpatch.pl flags an else clause following a branch that already
returns, in enqueue_reorder_recvframe(). Restructure the if/else-if/else
chain into sequential checks to remove the redundant else, with no
change in behavior.

Signed-off-by: ColtenOuO <jun930436@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 86c5e2c4e7dd..79bd56a5d6cd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1783,14 +1783,12 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
 		pnextrframe = (union recv_frame *)plist;
 		pnextattrib = &pnextrframe->u.hdr.attrib;
 
-		if (SN_LESS(pnextattrib->seq_num, pattrib->seq_num))
-			plist = get_next(plist);
-		else if (SN_EQUAL(pnextattrib->seq_num, pattrib->seq_num))
+		if (SN_EQUAL(pnextattrib->seq_num, pattrib->seq_num))
 			/* Duplicate entry is found!! Do not insert current entry. */
-			/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
 			return false;
-		else
+		if (!SN_LESS(pnextattrib->seq_num, pattrib->seq_num))
 			break;
+		plist = get_next(plist);
 	}
 
 	/* spin_lock_irqsave(&ppending_recvframe_queue->lock, irql); */
-- 
2.43.0

