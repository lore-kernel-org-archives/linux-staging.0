Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132E24086A
	for <linux-staging@lists.linux.dev>; Wed, 24 Dec 2025 10:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766570677; cv=none; b=ohUDrY8xSYbLNAqwSV+FcRLd8A+kqAGvRR/Zasy3ovssqYx1lr9OYoqV9Xhzpq+UybfERfAI0SPtiYb9wLnndYWCmO50VVaI4TS809rVxKJXdISfz3fcu5DJ9ZIZjRieyL91+44sTY6ixqxZJJy2ueTnrbKIXZ2aaJQLwxMoCCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766570677; c=relaxed/simple;
	bh=a1R9f9yHLwbz+I4PxKmZT+oys7sVkRkm1ijOJ+xQHh8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UwU2lRwGJdKUFxNlN4VB6rfBYfB4VqqxiktAUHnAKR058zRGZPeq/EbmDwDafUT+7opJ0+BDwsxTQuUSovkKcyllAFddGpdWu8uqJ5zCRBbze1cQ4FNURwX0GvadXMu/ah0gonKaP4Sdfcixqt1LNaJ/fGGDiNqjV6z9ImQUleM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TkmzdaOB; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TkmzdaOB"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b734fcbf1e3so1152572366b.3
        for <linux-staging@lists.linux.dev>; Wed, 24 Dec 2025 02:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766570674; x=1767175474; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G9glelcpJM+PxER11SMVAuXCWtXkfXh4lHJsv/3Mb4o=;
        b=TkmzdaOBqlvENNMg+y3pPE69YcW700yjdwkiM81DdwtGlyJNnIDfOxFJ6TebJOhpOb
         zaAAWKQ4o7dF7SLXcoqu6ifiphiUkHnNz2T85nnjA2IoD4dDNn4lyTmkElwxLV7c2OrO
         +4MnY+qhoXz7W2WsJx5DfbUeQGQzLQwwLieHDPnw7ClbFtj9xEMithwPvFUmv4MEcBPD
         NBeuDvCl69n88UVIlqXEKnaWhyg+RnRoeHrkZ8ff36SiAyUirKeTvSVhnw47pK3Go8eh
         8XahSbv3JeMdkOoNx1Ii2yJntHZGR1KWsIiyv+VDtyqyob+/P1UOM7lJ2X6LE6qsT9Z8
         A+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766570674; x=1767175474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G9glelcpJM+PxER11SMVAuXCWtXkfXh4lHJsv/3Mb4o=;
        b=dYJjJgKzI/IJox0IYfa5Xtjs59SRQaCxGxGVCbGoqDuY7lazYEnjD4hkp3rgIx/EPj
         Jf+FFR2E8E7IyRhSTFh6Nu3qCZ5RZSeOrVQtSSpPqElKFANGRvj/PyurCEgdRQ5UDEp0
         V+/zS6vggEKtKtO0pCnMC5tKJEYkX0tD2bqZ3fjZM4yCdbOFUBRjq1lIXtMH1gvfYUhL
         7vEZ5xUZVbXxXCLX1VKrKVro22xzij3JJEmILdm09sEyPd5sB2TI9sen2cQYYpSF5OLv
         VylbSbkFCzA8HbX8GkmNjhS0Np0OCnsX7rKjmNCy+IMz2cuk/hJwxuw5hHGa45kPWi9e
         X15Q==
X-Forwarded-Encrypted: i=1; AJvYcCWs+tLBvOwPs9b5XmDZAwGulR66mDi9XIneGxgriJLYZ4Ad4Pd3QMN74mXJy09pFrH1seXCCg3FMbQ0dsqR@lists.linux.dev
X-Gm-Message-State: AOJu0YzZKxbW43HWqO0OzOF5HVD2rC7A03Mcu6Tuf2AyklNXjhiM6VJF
	N6Wso8IxKzUGumsVD/cIbeu+ZA9s7cTEV5nr1AEhna3Xl6s0G7B5AbN91E0B1OMP
X-Gm-Gg: AY/fxX5iCf1GHdEJ3cTh4fKdY2iTC6T+9UoYYzBXhili7EvRPkqJNldVyr0qOhY8goT
	wX93QdHjjouEeyblH8B9g0bpoSkUdKXiN8TtRk7ly3SbHGLxsgJ7aUERwfae05w8a8R8E1Ykbnl
	FZOLr3LDvVEAGoSCUou3iS3tQBboE6odEh/lYr9admHaYkmHpN+ZmdV7vtwznOaYqkurvI9uwsw
	woE+zcWW7NL0jCk2cH6OvvMKckOhxUock9mi0S/+0nWVQdT6JiR23NHMXG5kZCTD7LxCVscYsEl
	6bMMnUoNX1+yek9TpN2fAZ+O+8YmEl7Sn+3k3esjkB93AIyjAJhZqaFCNdvx3H08Ple1Qpcos8g
	HdN5iJfsVdO1+i78tI3lpUXTAE0NY5yIg2aB2DcK711Ob9hFgryKvPSQgksRIjUxfWplM9OQJUi
	Nc9zh8TKepUEKBFrmGxQSek9X4aEjfHU05C69OrGw2rUW6xzKpGRBdK1omP7mLOfI6Y7P5rYz1
X-Google-Smtp-Source: AGHT+IFrit3HjGYBhSElt3+3JlaTipTh/uoXNKhnenjs0sUyaiTe6+SZD0FWJXgDi4riqOGq5h/YMg==
X-Received: by 2002:a17:907:d87:b0:b73:5d8c:dd0d with SMTP id a640c23a62f3a-b80371d69e5mr1826627066b.52.1766570674054;
        Wed, 24 Dec 2025 02:04:34 -0800 (PST)
Received: from localhost (19.120-65-87.adsl-dyn.isp.belgacom.be. [87.65.120.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a6050dsm1742246266b.9.2025.12.24.02.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 02:04:33 -0800 (PST)
From: William Hansen-Baird <william.hansen.baird@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	William Hansen-Baird <william.hansen.baird@gmail.com>
Subject: [PATCH 1/3] staging: rtl8723bs: core: remove empty if-statements
Date: Wed, 24 Dec 2025 05:02:54 -0500
Message-ID: <20251224100329.762141-1-william.hansen.baird@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch removes if-statements with no body in rtw_recv.c and rtw_xmit.c.
If-statement conditions have no side-effect and can be safely removed.

Signed-off-by: William Hansen-Baird <william.hansen.baird@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 3 ---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 2 --
 2 files changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index e893cb6fa273..24cc4a9e0445 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -2035,9 +2035,6 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 
 			preorder_ctrl->indicate_seq = (preorder_ctrl->indicate_seq + 1)%4096;
 
-			if (retval != _SUCCESS) {
-			}
-
 			return retval;
 		}
 	}
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 21690857fd62..ae482c28b40b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1707,8 +1707,6 @@ s32 rtw_free_xmitframe(struct xmit_priv *pxmitpriv, struct xmit_frame *pxmitfram
 		queue = &pxmitpriv->free_xmit_queue;
 	else if (pxmitframe->ext_tag == 1)
 		queue = &pxmitpriv->free_xframe_ext_queue;
-	else {
-	}
 
 	spin_lock_bh(&queue->lock);
 
-- 
2.52.0

