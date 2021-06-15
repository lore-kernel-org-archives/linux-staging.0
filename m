Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57052FB2
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 00:17:05 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id f70so25103066qke.13
        for <linux-staging@lists.linux.dev>; Mon, 14 Jun 2021 17:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f2RtLeUvNWeQVpxnunV3kXh/kArwBIjO2OgKILZ+2XQ=;
        b=00QJ6XzDtYVN0QpYNWqlEc1VolxQfmOSwH0rO4G5xSQIys8i308FCLdvixZ1+vAOEN
         JkGnvnCHZBvetSmZ9WxuyUMdB1iQwfOz5YMTyBkoczaoQ9smgsMnxiTaZFn2esv4Zedr
         ojO6nvqhPkPFVyijw/zE6PNby37+zDMdtFlNauH3Pj2t2/NtjajKOvVbhHE1OZft/dnj
         Xo7FUF/QshE3G/adPdKE5hqjb6rsHoVHML37qq3nhiVyX0j0XmKYdUsxmj6dIPtxy+3q
         Wco4e3veoM6varbP05y8L9xF2Qt1cCeyUZw6yjrje2sxCqaXoQLDKN+gcCAgaVuHRj9P
         2tSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f2RtLeUvNWeQVpxnunV3kXh/kArwBIjO2OgKILZ+2XQ=;
        b=aKel3Ai5xadjjX7rcDaFBHkVrGKA7svzyBK9sva7hT80CsBDAIjbUCNCHU78nlBv2r
         PFPKEFHCmNCLYpfZaINWDJ1VxpPpQSMzZznlK1f65wok9oYYkaeLy6ocTj9w+CHUka/Q
         hjO4CwTt39bVBPJFdB8ZPyFJx30+KloyR3aQiJtjOcPdyhHLiHtc1JECGAG5tP8nsxcY
         sUIEPMVABH7QC3HuFjEfV4rgToPbhGwEvZSpPKTpiuHmkwl/Y9om19fVzOvf6bPQtGFi
         k6DtwGAJ6q0wGOh9TGGQWOdmK3EXHcF4H/72NhFhBFEGpDbjnDF5YMmrn8iUoxJ8/2Ol
         Bs0Q==
X-Gm-Message-State: AOAM530bK5TBt9B4xp3y/yFLe/sfj7ztlKw1DvNqQ7IbOjzYtwoXaD+P
	m15vuTZ4U2Bfv7nihP0qFyUh8g==
X-Google-Smtp-Source: ABdhPJwCJ45piE7Op7TVbmTKqsC0J1THpb+rlNxlexqQk5XAteuBV9+BfiTP0GddgRXYSMoc+40+pQ==
X-Received: by 2002:a37:f502:: with SMTP id l2mr18624271qkk.195.1623716224947;
        Mon, 14 Jun 2021 17:17:04 -0700 (PDT)
Received: from localhost.localdomain (5.d.e.a.c.b.a.1.5.0.9.4.d.7.7.d.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:d77d:4905:1abc:aed5])
        by smtp.gmail.com with ESMTPSA id m199sm11244248qke.71.2021.06.14.17.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 17:17:04 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 24/28] staging: rtl8188eu: remove all DBG_88E calls from hal/rtl8188eu_xmit.c
Date: Tue, 15 Jun 2021 01:15:03 +0100
Message-Id: <20210615001507.1171-25-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615001507.1171-1-phil@philpotter.co.uk>
References: <20210615001507.1171-1-phil@philpotter.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all DBG_88E calls from hal/rtl8188eu_xmit.c as this macro is
unnecessary, and many of these calls are dubious in terms of necessity.
Removing all calls will ultimately allow the removal of the macro
itself.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c b/drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c
index d82dd22f2903..7ca0a45dd0c7 100644
--- a/drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c
+++ b/drivers/staging/rtl8188eu/hal/rtl8188eu_xmit.c
@@ -287,11 +287,7 @@ static s32 update_txdesc(struct xmit_frame *pxmitframe, u8 *pmem, s32 sz, u8 bag
 			ptxdesc->txdw5 |= cpu_to_le32(0x00300000);/* retry limit = 12 */
 
 		ptxdesc->txdw5 |= cpu_to_le32(MRateToHwRate(pmlmeext->tx_rate));
-	} else if ((pxmitframe->frame_tag & 0x0f) == TXAGG_FRAMETAG) {
-		DBG_88E("pxmitframe->frame_tag == TXAGG_FRAMETAG\n");
 	} else {
-		DBG_88E("pxmitframe->frame_tag = %d\n", pxmitframe->frame_tag);
-
 		/* offset 4 */
 		ptxdesc->txdw1 |= cpu_to_le32((4) & 0x3f);/* CAM_ID(MAC_ID) */
 
@@ -620,7 +616,6 @@ bool rtw_hal_xmit(struct adapter *adapt, struct xmit_frame *pxmitframe)
 	if (res == _SUCCESS) {
 		rtw_dump_xframe(adapt, pxmitframe);
 	} else {
-		DBG_88E("==> %s xmitframe_coalesce failed\n", __func__);
 		rtw_free_xmitbuf(pxmitpriv, pxmitbuf);
 		rtw_free_xmitframe(pxmitpriv, pxmitframe);
 	}
-- 
2.30.2

