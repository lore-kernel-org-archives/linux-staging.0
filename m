Received: from mail-dy1-f196.google.com (mail-dy1-f196.google.com [74.125.82.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA4B3C0613
	for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 06:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778738633; cv=none; b=AS6Kv0eORgGh4Hkfr7dnHyvY74Ww2gbBOePp5SeLeUwglvfKMzZeUGYvYgr8TkpGcPHj7uEUtJtMmItVR4I/RAImzvSeTEkSB2oMPp0CQBZQYnsCG/sAzANUHd/8TAdNEAlHVi5UYvXnfSaDN0rKvuVuIF4kFaE/saa+RrhIG0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778738633; c=relaxed/simple;
	bh=Axmd5IPh2I0ePfoBcxce130e2QCyMyW6fCwo7DYmTgQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l99YQqqzLmlfAZjCPBo1E1sB4LAZpQ3s15oDDKKxUMyY9iA1lJwDYf7RR6ydjFAJjM9BqlUYvr2fyOYpplZ3uhUoTmLIFIMJYoahcXb8QkCq1fM0y4jC2/7aEyU/yI9BviS/FCcgJFCJ0BeS+fbEQZlFeMdEoVsuZmHBw6ZknJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnslnjXt; arc=none smtp.client-ip=74.125.82.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnslnjXt"
Received: by mail-dy1-f196.google.com with SMTP id 5a478bee46e88-2f3c623322bso12854257eec.0
        for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 23:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778738631; x=1779343431; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCk5lbI7sH2Lz326mmiKMLpYmZaGzeWhG5OnFEOU7xw=;
        b=DnslnjXt6SQEJXlReQuSyQHzc577B1yzIopHjCjpgQtVAT9KbA9ct9V07jxVnLv9DD
         KZ3D5sBLGsdsA0pZUjlHle2anSsE+UtXoFiXkomCx+Gyd3beNqraGKHHTqyCnfm3Y0SD
         Dm0kCZz8/m1GwUgMfN3olDxFfuDpmi4+eht4aQa/q6nc6wMQIB+QjhtUa74qkw+UJm8N
         RD8ghzKD1z0DEYx0wGO7TDXAkJAFKrfWQjPdzs+qJPo3hFskKQiRgaIbtDGCOUu9l2qi
         rA8APwQhYziFq6QI+E9Gp95m7j78ko+h1taHu3RwzB7nrAradgtI/i7DJqgNaTpggP9Y
         UQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778738631; x=1779343431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lCk5lbI7sH2Lz326mmiKMLpYmZaGzeWhG5OnFEOU7xw=;
        b=fMkZ0prUl6ObSSM7wbJUI7gtYBBVAZ1CDmAPF0J+lZSNXNQjA6FuEWHMId7I25EigF
         0HKuHmPXGOVSI6kb0ItyattSUOv4Lb+eyhxsUXZ7JE2WmMRuC0ftCV/fayiATCzrsjCj
         rj59t3YQFzUZiOIoHHlY+XV9bGfDjAsyHpsAcn5avpKvBTYzrMHBkQNZoofxBRFTUSxc
         toi9N+C89pve7R4bN9wu0tA/DK7bcTosYds113lcHNmKhb/Ozt8U87owhLR+haHjGkLl
         6Zzhlh2a/bJqUktHQQNSD+Ap+dJfNg+pN2kDOdlqnKn8IhPkHBsvgL2dV8eivdvGVSp2
         77rA==
X-Forwarded-Encrypted: i=1; AFNElJ/CzOj66Ir67qyVekOKsJFrUVtGfngJZ9jOhofFQ9BwZddLhFEKp9+QcPD+g3Xjb3hGPLrGCL8FhBDmWwE2@lists.linux.dev
X-Gm-Message-State: AOJu0YxaNgtV9ggG/h/NSo8CnzahQqWw0Yfpcc9SDwpnMTN5ot4H+ps1
	uDcbGqXlmoZrEZHpbranQewo/oiqm23au/BZ3uOZP3/EHtJw7h4cjliCxFomUdi96N0=
X-Gm-Gg: Acq92OEnJyxExmhq4Uv3+8wEvFlk4ui9KXlQwkx7foCmiFrr1vm6leCnYgsdrDDUIFo
	xBqLm9f8eETGSKcVntrJRl7kDuAxLXN9r+Xyai+hHbj1k/qjg+P8s8OsP+74CdMq1nSqadBCvc5
	+JvPxKd0zNCFb7qeJx0GcSPj6//uX/Zsmhlw4H6kUOUTgvxpIBRgbyFy5alYuiILY8IRmCy2pL+
	N6ItIsamKiMW3HGoKrKFJ4Y9yVP9jCQbQY6P+lUpN8lD6PTmgqW1d+UpeEEgbE7mhDoOdVz9mtP
	KL0kAYy01OV2X//yXINwGoFW5Lqr0L5xb9qDSPbonGScBk8rP8Jb5dFBDnNoGLCiCIXoIUVieIL
	g5QECclpSafUJHSx52aAKTNKMHieA9lPVAG3uEUPk86t29Xj9ZoYwO7Cx65trdpkrpNJJ4lwu8B
	5ooBzqwLcYlJRzkI856zRAF36MeeGnp6WFRakMU4/x6mqAXTQkPw40oCc=
X-Received: by 2002:a05:7300:5709:b0:2ce:f3d7:221 with SMTP id 5a478bee46e88-3015593e4e3mr3965161eec.17.1778738631263;
        Wed, 13 May 2026 23:03:51 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcb6adsm2034772eec.15.2026.05.13.23.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 23:03:49 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 1/5] staging: rtl8723bs: simplify rtw_xmit_classifier control flow
Date: Thu, 14 May 2026 06:03:19 +0000
Message-Id: <20260514060323.24895-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514060323.24895-1-dennylin0707@gmail.com>
References: <20260514060323.24895-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify rtw_xmit_classifier() by removing the exit label and
using direct returns for error handling.

No functional change.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 458e471535ad..72e5dddfee5d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1874,16 +1874,13 @@ s32 rtw_xmit_classifier(struct adapter *padapter, struct xmit_frame *pxmitframe)
 	struct tx_servq	*ptxservq;
 	struct pkt_attrib	*pattrib = &pxmitframe->attrib;
 	struct hw_xmit	*phwxmits =  padapter->xmitpriv.hwxmits;
-	signed int res = _SUCCESS;
 
 	psta = rtw_get_stainfo(&padapter->stapriv, pattrib->ra);
 	if (pattrib->psta != psta)
 		return _FAIL;
 
-	if (!psta) {
-		res = _FAIL;
-		goto exit;
-	}
+	if (!psta)
+		return _FAIL;
 
 	if (!(psta->state & _FW_LINKED))
 		return _FAIL;
@@ -1897,9 +1894,7 @@ s32 rtw_xmit_classifier(struct adapter *padapter, struct xmit_frame *pxmitframe)
 	ptxservq->qcnt++;
 	phwxmits[ac_index].accnt++;
 
-exit:
-
-	return res;
+	return _SUCCESS;
 }
 
 void rtw_free_hwxmits(struct adapter *padapter)
-- 
2.34.1

