Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E6B30567B
	for <linux-staging@lists.linux.dev>; Thu,  1 Oct 2026 11:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790853850; cv=none; b=dm+7lyIf5ejwVknV1B3Ncl+tEBgDEnMEf2MAVSuUolSsuZWqfXIFEiAF4nsFCmvKyklRAuH4wrAAcCi/1BCilOOcwX225ltV8cIBhN2mVmAhUefc3ZUjanqQFEyQPLO0YwgBFhfYTGSLukDBn/WPan0TkgEIbkqHzb59PT29l9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790853850; c=relaxed/simple;
	bh=kqq4iv2tJbpksVSZakY28B9D5QWU3TABTw5r7AJsPBw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=inW3as1KURY6SoDJw4rCx8pT6/TTMbRLccttyz6fwdzLXVT+jsYCYbiSFA7sm4Se4puzEeRFGJi4gIdMLxlCv9HMJXwhoXkka50sSRENnALVCFzqrRnJCjTHkRjBgTQhOZmGAGTrDFu5HNcy8RlFmKvU5iRvmkTHXm7FAdQP1mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WeMtNc6A; arc=none smtp.client-ip=74.125.229.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WeMtNc6A"
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-34da84f64d8so940217eec.1
        for <linux-staging@lists.linux.dev>; Thu, 01 Oct 2026 04:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790853847; x=1791458647; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9pJKS2CPEX9rrrq+8z8dCJOBpbOCAF4va+FsiogZmcw=;
        b=WeMtNc6AuCfAV8TmNM7t/9Vvwvdb6neKJ2FFXbVasIx3TNHJkC0ZiLBn8SH4YqyJW4
         +l0e+EaAWb7I3UFAM97r9hoS27ygp73SAOf33wSdPR8Qs+JTu8ayMPZ0umnpiKJitaiE
         Ubp13MrFgj/F0f7s1yVp/F0n0DPtr/sKXQY0JcXgdQPSpb634jjxuB+4mQ7qB4mJWUP/
         lpPXU9MPCx51H9IXt8KCmLgq3KrYVWhk4IlzXl7zQvZzkuwW/XYvJ/4x5nd6kJh2Gox4
         J0llxEDFpqV0r1j8rQzaObQM5lfEmu3lSb1HTerwelVF8OdUL9f0d29BjIEBs8U4rWU8
         qDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790853847; x=1791458647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9pJKS2CPEX9rrrq+8z8dCJOBpbOCAF4va+FsiogZmcw=;
        b=AGDcIsGP4rd2uAD5LmNes2puWw3SFP03WTMVYfkspDGr/3nCMMHCAV4GoCPiY/eq95
         yvXzP3AxVJYmrDdFgFSB1wwJ9nBC5dncaMh3UXnai5s3XeerSi/46bmbaVoFCCz+yi8F
         9LFKzh3VYDE/RilFWnWIUM7hvzqXoOeaJUzYK9gGktaMFCDrToHJPgGzlRiDAmjQmyXV
         K8mGOPm7HvEZ9uBmBx6y+b68bEo9TKBz3GgD22MrFfi4LvXZEHk9dciioOH0QtslwM46
         vPQlIl0zZxE3CYQ+x72IF5SuazrcuXV1PrGaeRqx8osKcxJlB/Q+P4+aDQV2g6KHCJhH
         N/8g==
X-Forwarded-Encrypted: i=1; AKwUvBwYOZMG/2UxgP9uxQ0jrqDCNv0XmoiCkDIH2WCX6HyeCZ2jfQA6TUCL/I7QmvK3T5SLW4B1sj7ZtdsvTvsm@lists.linux.dev
X-Gm-Message-State: AFq9FYIoElia7vOL3/wlE5mD65kPmUhcFITZMMuejn48IL/Ap0IiF0hD
	MkUC9M3a0wRP34m0FBBawvcLhDTTwVp3Tg5AJ+GfU6BU1LzJrdG6Mk/7
X-Gm-Gg: AYBFou1dK6ufRhbM6hk5TsltnA6C4KH9WS2x/MEFPCvz+7jSuTvuyhax5jbtdw054Cs
	uIdAKuSR0wkTXVZmt5vetO0slsKg8j4yf+fbt4NCTj671jf+WNZJYYGgg0ip0P3BJHR35OAEkvX
	BQFeW2lgI99NS7wHdWLza9UfhshcN79HIAbLocimXd01SKMGkZ/y43vNl90FNc++bWtG0Yk/pL3
	FVqAbEAHGwhrlVvwQcgWyqAtkV7r2NZui41Q6DiO/h1zQKUGxs65iuo+FDb8LELDamGb7N+qjxI
	zJwWLy7TURirycisFCAhh2KgyRxonAmu4nPB4LGRwahzqO8tjeYUpThP8ubtWF0FwX9n4zsTZH4
	lwurbnwiOCAYpdWziC0AKtQr38dFiEWfUexUGFpJGpvssCyoa57++Z9UyjwpvwzmZtfYggiAJrV
	w8nGBe8EC6jM9Vo61WjUkRvQhEs8Ajem+/dofNYTPcnpt0aKIZ1nazRJIECcqIw0xdF6euo5Af9
	ODILrwZ79RHCLQwNyJFORbEqck8DKTvfs6dUQ==
X-Received: by 2002:a05:7301:4b12:b0:34c:85c:da56 with SMTP id 5a478bee46e88-34cdc1ce152mr4987298eec.17.1790853847277;
        Thu, 01 Oct 2026 04:24:07 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db3162a00sm7052128eec.10.2026.10.01.04.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:24:06 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: make rtl8723_dequeue_writeport() return bool
Date: Thu,  1 Oct 2026 11:23:51 +0000
Message-ID: <20261001112351.6820-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtl8723_dequeue_writeport() returns boolean state and its caller uses the
return value as a boolean.

Change the return type to bool and replace _FAIL with false. Also use bool
for the caller's queue_empty variable.

No functional change.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
Changes in v2:
- Resend as requested; no code changes.

 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 0441e84ea87d..482dd1baf3ca 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -33,7 +33,7 @@ static u8 rtw_sdio_wait_enough_TxOQT_space(struct adapter *padapter, u8 agg_num)
 	return true;
 }
 
-static s32 rtl8723_dequeue_writeport(struct adapter *padapter)
+static bool rtl8723_dequeue_writeport(struct adapter *padapter)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
@@ -107,7 +107,7 @@ static s32 rtl8723_dequeue_writeport(struct adapter *padapter)
 	/* pxmitbuf->priv_data = NULL; */
 	rtw_free_xmitbuf(pxmitpriv, pxmitbuf);
 
-	return _FAIL;
+	return false;
 }
 
 /*
@@ -121,7 +121,8 @@ static s32 rtl8723_dequeue_writeport(struct adapter *padapter)
 s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
 {
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
-	u8 queue_empty, queue_pending;
+	bool queue_empty;
+	u8 queue_pending;
 	s32 ret;
 
 	if (wait_for_completion_interruptible(&pxmitpriv->xmit_comp)) {
-- 
2.43.0

