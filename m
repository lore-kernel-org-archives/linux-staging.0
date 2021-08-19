Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5EC168
	for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 05:08:14 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id dj8so6857971edb.2
        for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 22:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=77nT17Qwz5Ti/66HuChnzgubrYZ1JTKCItJbjSMqiXU=;
        b=CYud7j9sUPtxv14PLjjICnvzOgSw0EQxoddBj3s9QALzQz9l3aNqVMGwEI22zhkHzz
         osv0CqVQ1+KsrD8cwigvNwbxjzPLY0uXuYRZSj/G4hgo41nfmewL3lAIK7s2XRe4CnCI
         zAIaDaCBU2DrKQUrgpkco5r6E1RirTA0sWfFc+63JuMIff+Dr8rD1zzNuyyk/V5E0uRb
         kjibVGw9p/yWUKjIKeJTNs9rU8qsWN0MP7ITSZbezwyx5X84EmAt7hWyLICjgq7mgAwU
         8TuXDiUe4s+FsLua5o/8XaZ2zwlQzABCj0VG7FYd/qAxy8R9R6iF6KP1baE5x0qMAt2b
         EzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=77nT17Qwz5Ti/66HuChnzgubrYZ1JTKCItJbjSMqiXU=;
        b=M2f5A0/bBOswe4ooPKQEug2zliT+NnqOi0QgGQqdI5J/ed/j+n8ETdvSFEZ8uI1SCN
         fskiNrMLJ+0xhfGbce5JN1VLTqVBHtY2ECxI1uOfOR0hun2s336j24ZacgUZynCCTppv
         RsNQb7dja52+FjY0DF9Zj7Q9hx4HpYgrnfJdBar3NLTfwAUyEEa/diYoEzrzQWWBEv7o
         V7aLoIyaP7YZD9DnYbOrKOjy76KprjK/zrRx2vXYys9ei88AH0pona6+82UpM4v5FtgO
         3kOkYdL+RcA1YNpM/LcgetNAgvjsaFb+z7BHoJS/9OnKZpdjoi7BKREdkSWDpyEjvYKu
         LWyg==
X-Gm-Message-State: AOAM531ReoFQUz3MIGDDVWW643tqg9VsUzCGjB8H40PVrT9/svUwfuB+
	V+RW/DQO0PyARrg5siWC+nk=
X-Google-Smtp-Source: ABdhPJwUZFGY90ko4Yo4ULND1iGaJGXALOX8w/5QRAdc8GOpi9Br4wB+Ay9HQKnhkdbnXf9B49CNIw==
X-Received: by 2002:aa7:ccc1:: with SMTP id y1mr14212122edt.321.1629349692558;
        Wed, 18 Aug 2021 22:08:12 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
        by smtp.gmail.com with ESMTPSA id j22sm728484ejt.11.2021.08.18.22.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 22:08:12 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Martin Kaiser <martin@kaiser.cx>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: r8188eu: Remove empty rtw_mfree_xmit_priv_lock()
Date: Thu, 19 Aug 2021 07:08:08 +0200
Message-Id: <20210819050808.28825-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove rtw_mfree_xmit_priv_lock() because it is empty. Remove its only
call from within _rtw_free_xmit_priv().

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index e1de7448771c..f242f3ffca70 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -207,10 +207,6 @@ s32	_rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	return res;
 }
 
-static void  rtw_mfree_xmit_priv_lock(struct xmit_priv *pxmitpriv)
-{
-}
-
 void _rtw_free_xmit_priv(struct xmit_priv *pxmitpriv)
 {
 	int i;
@@ -220,8 +216,6 @@ void _rtw_free_xmit_priv(struct xmit_priv *pxmitpriv)
 	u32 max_xmit_extbuf_size = MAX_XMIT_EXTBUF_SZ;
 	u32 num_xmit_extbuf = NR_XMIT_EXTBUFF;
 
-	rtw_mfree_xmit_priv_lock(pxmitpriv);
-
 	if (!pxmitpriv->pxmit_frame_buf)
 		return;
 
-- 
2.32.0

