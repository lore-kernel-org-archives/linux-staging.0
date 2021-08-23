Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2C03FC6
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 12:02:30 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id c129-20020a1c35870000b02902e6b6135279so10605172wma.0
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 05:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hmtc5bJ1VOtrjv9Nl+cOcRNE4MiTt6cvRbrnfn8s2tU=;
        b=mRtp8u54MR2reqhTeDNjaFLpEjefgZY6I8+oWCDMTVcXbCOCc0AjnpRmxl6TNdaUpv
         Rl4xOVr6VhdODxtf6Hf6+JkJdezM875KxBlhTVCIXndBl1oNAkkpN2xIcn1P/PsDAmEM
         8T51SOY3/gqq7n0QEkn3DxmOR+wg3e1nZd/GRRo6gmbAjEJqJh9H2bQ9SFrV9llGA/ke
         XKinT8f+CUe02lenhmSrSUpVs0FhEjw50oy9/7dltvXsq3WQl23TOy4wGsmXetf3e1ij
         ie+uKCl+R94Z9cWd8AwqaS7zodmPwTYPEgAWVc5/T+pAyh8ZGX0OXHhkQN3pknIbVRAp
         4x/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hmtc5bJ1VOtrjv9Nl+cOcRNE4MiTt6cvRbrnfn8s2tU=;
        b=VVzdBKd8cGS9agYA/PcBpGadaqVB2PGky07UMTPrkt+bIpwUvhlrFiIY/5OfrXRk9D
         r5DovcMPkCQvTFE+75HRv8Wjw5r2ufvDoqeVyLE0lOd3PEPMhUToh7Vf2VLzbiViqWql
         ajR6j85IrMgEzOxa8eq7zbQh6Kp+J4TV1hxh3lCV4nORUbD2wmyJAQaVsrvH8G2PCrqg
         yRl9I7iqHFLwM4o/Hbi9/scyuMT/YPOLp6lviI6y/t9HAi9UWPlaoSvhehdjuVwNbj+B
         OseqCnsrfmAty0KfAo2uOFOKCNESMkRQ+J1r7Q+u+0RCqLxiEuIt+ytg3v01IyIgaR4N
         /qVg==
X-Gm-Message-State: AOAM531o+GkXKZpxyGYdcTF8dJi8dFbLHLC6wsP1e3RULKX1TPu0D7jR
	3pA0xA7bIXl9KAMVqqlmYZ4=
X-Google-Smtp-Source: ABdhPJyTsYrcwTrZF0H7XKtvwgKssKj2T9C/9Wp5lH0exUTQQt7K7SB8sy5g/MjiOa47coagAA1kcQ==
X-Received: by 2002:a05:600c:35d2:: with SMTP id r18mr15946644wmq.116.1629720148836;
        Mon, 23 Aug 2021 05:02:28 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::3c39])
        by smtp.gmail.com with ESMTPSA id g5sm901332wrq.80.2021.08.23.05.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 05:02:28 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 7/8] staging: r8188eu: use is_multicast_ether_addr in hal/rtl8188eu_xmit.c
Date: Mon, 23 Aug 2021 14:01:05 +0200
Message-Id: <20210823120106.9633-8-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210823120106.9633-1-straube.linux@gmail.com>
References: <20210823120106.9633-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use is_multicast_ether_addr instead of custom macro IS_MCAST, the
buffer is properly aligned.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
index d22b16cc5a30..17be67ac5fae 100644
--- a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
+++ b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
@@ -167,7 +167,6 @@ static s32 update_txdesc(struct xmit_frame *pxmitframe, u8 *pmem, s32 sz, u8 bag
 	struct tx_desc	*ptxdesc = (struct tx_desc *)pmem;
 	struct mlme_ext_priv	*pmlmeext = &adapt->mlmeextpriv;
 	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
-	int	bmcst = IS_MCAST(pattrib->ra);
 
 	if (adapt->registrypriv.mp_mode == 0) {
 		if ((!bagg_pkt) && (urb_zero_packet_chk(adapt, sz) == 0)) {
@@ -186,7 +185,7 @@ static s32 update_txdesc(struct xmit_frame *pxmitframe, u8 *pmem, s32 sz, u8 bag
 
 	ptxdesc->txdw0 |= cpu_to_le32(((offset) << OFFSET_SHT) & 0x00ff0000);/* 32 bytes for TX Desc */
 
-	if (bmcst)
+	if (is_multicast_ether_addr(pattrib->ra))
 		ptxdesc->txdw0 |= cpu_to_le32(BMC);
 
 	if (adapt->registrypriv.mp_mode == 0) {
-- 
2.32.0

