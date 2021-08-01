Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399BB3483
	for <linux-staging@lists.linux.dev>; Sun,  1 Aug 2021 23:32:47 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id g21so2750727edb.4
        for <linux-staging@lists.linux.dev>; Sun, 01 Aug 2021 16:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nycSytXCZfYCR8LzQF81gm2hXQJ8owxI3Y1HaRP+Y8g=;
        b=Ek3CzkJjSfBdOm8c+TtTSerBkrRRLsGQgKrQ/4TcNnygf4BN4pfC2MnQZpNDSB165m
         KYlk5eVY+yYRMVmGsbPuUbN+79G0B1f+vaUFFx7E+xbV2W9HxR8YzfKW3kDzQMHe+EpC
         tVCPER5xomz5RXA/qYJ0os1uRubJbZGx9w6+2zzcXEYNhzNvEObwh26tIC6c5/f+mDTE
         quz+DlOXPC6TNNSyxpvBYC03sCZAzeSeDWYjqFY7YZSHJ50/SOpZkU/tw4QmWdf5gxuG
         YTxUgbByjmaZQrISs0cPioLWTm1DwtE9fF9hv+22C8A21F2VR7h/W05nK4keCt6ZW6r4
         rbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nycSytXCZfYCR8LzQF81gm2hXQJ8owxI3Y1HaRP+Y8g=;
        b=EfHPiJh/OdD9fFYIM1TTugtkfhY1k/yU9bMZulPVXVFShbi+8Wz3FEc8Inp/H4soio
         6+sr1b+W2rtSPJEbFh9gAT9ISCvQwAyWA1HKMWK93UxRwhUUbJcHzsVIwpuyDSK9u4VC
         nIdjq6IgbhGFYgB0wVFTIBYeMX+WXAa85C3zJsoMXjTy+lSvTeLwGJu6qxicRMYnwekG
         B+UJrNod1okB/X/HKFwDG+QHPVr6SfUN2zXJiAwSA6Yd6K6eaycAWxgGIy2Kkx8SuEkJ
         gNsvo/PbXvC1Hh9nsKDm42tApwHprUCDYaiRt0zyB/2bqebYUIcPkqgXIcEVfir8QZ+l
         y94A==
X-Gm-Message-State: AOAM532daBWhKPrakMmtqVK5qVytXsYN5T3Wi5wwLrd6ir2ihw/8SU2D
	p40PyEf9xQZp25ZCN3BPBPE=
X-Google-Smtp-Source: ABdhPJxwWXVeM0etOWnSk+DNRBJSiSVlb5Z+e+QBQfONfWUkYuQxilkf1BFBXIG6oyMayLXlRuHVvQ==
X-Received: by 2002:a05:6402:4246:: with SMTP id g6mr16039128edb.95.1627860765496;
        Sun, 01 Aug 2021 16:32:45 -0700 (PDT)
Received: from localhost.localdomain (host-82-51-42-96.retail.telecomitalia.it. [82.51.42.96])
        by smtp.gmail.com with ESMTPSA id bs13sm3610308ejb.98.2021.08.01.16.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 16:32:44 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: r8188eu: Fix cast between incompatible function type
Date: Mon,  2 Aug 2021 01:32:41 +0200
Message-Id: <20210801233242.20436-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix sparse warnings of casts between incompatible function
types from ‘void (*)(void *)’ to ‘void (*)(long unsigned int)’
[-Wcast-function-type].

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188eu_recv.c | 2 +-
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_recv.c b/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
index 2e3f624d0f22..ef722b4a9ddb 100644
--- a/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
+++ b/drivers/staging/r8188eu/hal/rtl8188eu_recv.c
@@ -38,7 +38,7 @@ int	rtl8188eu_init_recv_priv(struct adapter *padapter)
 	struct recv_buf *precvbuf;
 
 	tasklet_init(&precvpriv->recv_tasklet,
-		     (void(*)(unsigned long))rtl8188eu_recv_tasklet,
+		     (void *)rtl8188eu_recv_tasklet,
 		     (unsigned long)padapter);
 
 	/* init recv_buf */
diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
index e44a01af7f5c..510df3f3e6bd 100644
--- a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
+++ b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
@@ -14,7 +14,7 @@ s32	rtl8188eu_init_xmit_priv(struct adapter *adapt)
 	struct xmit_priv	*pxmitpriv = &adapt->xmitpriv;
 
 	tasklet_init(&pxmitpriv->xmit_tasklet,
-		     (void(*)(unsigned long))rtl8188eu_xmit_tasklet,
+		     (void *)rtl8188eu_xmit_tasklet,
 		     (unsigned long)adapt);
 	return _SUCCESS;
 }
-- 
2.32.0

