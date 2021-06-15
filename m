Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F8F6D0E
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 00:15:48 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id q16so14322776qkm.9
        for <linux-staging@lists.linux.dev>; Mon, 14 Jun 2021 17:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x5fEgSH4fIYijIsKFelpyojP/I9tE1YJoRFaP+W7jxg=;
        b=N3SZ+aPIJAhfrbwxtWBtTuS1k+Whv3iAH9RLXFLx2bK+bBMHjrizhLIpjZYeJOzJad
         +pDeOmaK3v8zIb8wm1rbrGNAn65AMsn0NXCsAyjwUGCL/Tu06oyKHmKs85KZjsh2GqrD
         Mgjv0Ka/P6x06ewN5Gz/SxhWaIOKnphdnErj0VUv7BA+EnRo7e4ju6eogthPnxvT57/u
         6SjfRGqTts5oe8if8a4ICC/5+OvbzT9Cy1MQFyk7tpxe/d/BxlkheMNfpF78Ahai4ovv
         3N2BxYCWPtg5Ym5E6B21Y5AuK9CcrvtQgUgC8N3iDgxh/lKSgeFbLTyQ9VqNHJpWZkc6
         1brw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x5fEgSH4fIYijIsKFelpyojP/I9tE1YJoRFaP+W7jxg=;
        b=CO/wPdvy+y08Xxtx5pkxp6Z2WGixPNtFCUM5ZPjUXi/N0srcFnQMIg1gkADuluqLW7
         Qx7VNLl5pxx8R1pg6m3NftcCQ0nCWDp1+QxSkO53plF/P7mGSbtmXx1HE2Pqe92gi7EQ
         0deOuDYc9nFfghcPX2Gv3iucjZg2HfbPz1wWAk8AvvWT/JCuAtfK4h0ZAGQ3O7I0yRb/
         AwRe+U6Wi7AkeSiERlPqm3OhK6Z8n0hUEKfmIyu51aW1+OWdwjiDoc1CAbZD45ZEisXv
         kiwxafqpRYXP8Z8O8wQmBKMDR0HSlQL8j4F9RPYRxq0ziIPULp070As1ZQTAXWn3/RKU
         TRBQ==
X-Gm-Message-State: AOAM530To5PObw6kRHfsv7SQ1p0lojhiD+2rZc8YDdrcHppk0b16qqSY
	sY8ayeLwI/i/10EVT9O2EGrALA==
X-Google-Smtp-Source: ABdhPJwRlTC6UsQ1fuFzERmwMEpqwTae7gtwZcbyxtHNLmSclGRjgmyUOO7kQxhwr+P6IXQ7Qt/wYg==
X-Received: by 2002:a37:9504:: with SMTP id x4mr11581340qkd.235.1623716147428;
        Mon, 14 Jun 2021 17:15:47 -0700 (PDT)
Received: from localhost.localdomain (5.d.e.a.c.b.a.1.5.0.9.4.d.7.7.d.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:d77d:4905:1abc:aed5])
        by smtp.gmail.com with ESMTPSA id m199sm11244248qke.71.2021.06.14.17.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 17:15:47 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 08/28] staging: rtl8188eu: remove all DBG_88E calls from core/rtw_security.c
Date: Tue, 15 Jun 2021 01:14:47 +0100
Message-Id: <20210615001507.1171-9-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615001507.1171-1-phil@philpotter.co.uk>
References: <20210615001507.1171-1-phil@philpotter.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all DBG_88E calls from core/rtw_security.c as this macro is
unnecessary, and many of these calls are dubious in terms of necessity.
Removing all calls will ultimately allow the removal of the macro
itself.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/core/rtw_security.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_security.c b/drivers/staging/rtl8188eu/core/rtw_security.c
index 4d0a23bf3f66..2c863facd812 100644
--- a/drivers/staging/rtl8188eu/core/rtw_security.c
+++ b/drivers/staging/rtl8188eu/core/rtw_security.c
@@ -664,7 +664,6 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, struct recv_frame *precvframe)
 			if (is_multicast_ether_addr(prxattrib->ra)) {
 				if (!psecuritypriv->binstallGrpkey) {
 					res = _FAIL;
-					DBG_88E("%s:rx bc/mc packets, but didn't install group key!!!!!!!!!!\n", __func__);
 					goto exit;
 				}
 				prwskey = psecuritypriv->dot118021XGrpKey[prxattrib->key_index].skey;
@@ -836,7 +835,6 @@ u32 rtw_aes_decrypt(struct adapter *padapter, struct recv_frame *precvframe)
 				/* in concurrent we should use sw descrypt in group key, so we remove this message */
 				if (!psecuritypriv->binstallGrpkey) {
 					res = _FAIL;
-					DBG_88E("%s:rx bc/mc packets, but didn't install group key!!!!!!!!!!\n", __func__);
 					goto exit;
 				}
 				key_idx = psecuritypriv->dot118021XGrpKeyid;
-- 
2.30.2

