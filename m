Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AE070
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 19:55:01 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id z2so2919500wrl.5
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 12:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8S3Uh23H+gQhsf7YASK94vXEdzHi8M0NhOcwtIIfD7A=;
        b=FhBhCegfx9/JsWqLF1NrB74XyOFOPKGNuaiYUD+JF/Zj93OlXZR4UpVjGkZMDsBgPD
         E5ePdeCeKbf5jfa72arvobZIwCXXaklwXo+i8gVdj/7TgseX6xjTXMtlYJmyXdnEW9mE
         R6RLUZlv3qnOhLaoeTeRfSXiibcxF6/3YvT0v/xv/Fm7tS4kx6jNy+GyjPbuXeDoIFgO
         254MlEJ6mPlN16Sfya+TpS+K/4k6zISSYVkeut7cdZ0CGB+6piNc7+rQwPgQNDZBXoB0
         47Pb5zIq4aMpWr7iFOBeBFeYmbMq82piF6TwdPSN9Z9eqTCh+7JLQy+K0IwGBr7751Bm
         dwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8S3Uh23H+gQhsf7YASK94vXEdzHi8M0NhOcwtIIfD7A=;
        b=ZCO4vNicqt4gKyidNdvLTgRdVgKtm0oeoxu/ui3oGwgF442j2Q3CYOGvfTN2DcJz/I
         64T7TJR2JGXNYv+nKgZ41MbmDlO58c/W5VjrqO7HKn+3tOBs15NC3OeGij3ZxZ0UpTDe
         Xu+TIFQeKVHXVP6T5taFSDd+puK4c/oEA9GcU5DuJtvLIdfQqfvsYpzJG4mKe3W1mkT9
         uzZ+uNeQ7vH0BllgUnU9aMIbg714WXRgmXxP1s18mU/E0JGuHh6FJeTRwLXqx9tzh3gn
         Uapxp3VhrDEpsQYOdvVsWIxfNsnUilm52qp/ZJxOLupe/fWHEkm/PtMAloqgwjlB32ey
         pl0A==
X-Gm-Message-State: AOAM532+nMyLddZxw4DUGRlH++G5pdHjBGFat96pudyP/UHMk/TCaqbg
	QOQTsbxP/6ATPRl1R6W2hzY=
X-Google-Smtp-Source: ABdhPJw9bgeLnJNYJeVIVw3MDkoM4Wqo9MBHU865z+GZRI/p9r6gGaG4WUhqGjNpKXiYVvpD+Re/+w==
X-Received: by 2002:adf:fbc8:: with SMTP id d8mr11730071wrs.94.1617306900074;
        Thu, 01 Apr 2021 12:55:00 -0700 (PDT)
Received: from bcarvalho-Ubuntu.lan ([2001:818:de85:7e00:a182:b5f0:9f7c:c891])
        by smtp.gmail.com with ESMTPSA id s8sm11097662wrn.97.2021.04.01.12.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 12:54:59 -0700 (PDT)
From: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: outreachy-kernel@googlegroups.com
Subject: [PATCH] staging: emxx_udc: Ending line with argument
Date: Thu,  1 Apr 2021 20:54:57 +0100
Message-Id: <20210401195457.24512-1-martinsdecarvalhobeatriz@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cleans up check of "Lines should not end with a '('"
with argument present in next line in file emxx_udc.c

Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
---
 drivers/staging/emxx_udc/emxx_udc.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/emxx_udc/emxx_udc.c b/drivers/staging/emxx_udc/emxx_udc.c
index 741147a4f0fe..20f53cf6e20f 100644
--- a/drivers/staging/emxx_udc/emxx_udc.c
+++ b/drivers/staging/emxx_udc/emxx_udc.c
@@ -1073,9 +1073,8 @@ static int _nbu2ss_epn_in_pio(struct nbu2ss_udc *udc, struct nbu2ss_ep *ep,
 		i_word_length = length / sizeof(u32);
 		if (i_word_length > 0) {
 			for (i = 0; i < i_word_length; i++) {
-				_nbu2ss_writel(
-					&preg->EP_REGS[ep->epnum - 1].EP_WRITE,
-					p_buf_32->dw);
+				_nbu2ss_writel(&preg->EP_REGS[ep->epnum - 1].EP_WRITE,
+					       p_buf_32->dw);
 
 				p_buf_32++;
 			}
@@ -1225,8 +1224,7 @@ static void _nbu2ss_restert_transfer(struct nbu2ss_ep *ep)
 		return;
 
 	if (ep->epnum > 0) {
-		length = _nbu2ss_readl(
-			&ep->udc->p_regs->EP_REGS[ep->epnum - 1].EP_LEN_DCNT);
+		length = _nbu2ss_readl(&ep->udc->p_regs->EP_REGS[ep->epnum - 1].EP_LEN_DCNT);
 
 		length &= EPN_LDATA;
 		if (length < ep->ep.maxpacket)
@@ -1462,8 +1460,7 @@ static void _nbu2ss_epn_set_stall(struct nbu2ss_udc *udc,
 		for (limit_cnt = 0
 			; limit_cnt < IN_DATA_EMPTY_COUNT
 			; limit_cnt++) {
-			regdata = _nbu2ss_readl(
-				&preg->EP_REGS[ep->epnum - 1].EP_STATUS);
+			regdata = _nbu2ss_readl(&preg->EP_REGS[ep->epnum - 1].EP_STATUS);
 
 			if ((regdata & EPN_IN_DATA) == 0)
 				break;
-- 
2.25.1

