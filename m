Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31EE6D00
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 19:34:47 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id e12so2362881wro.11
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 12:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8S3Uh23H+gQhsf7YASK94vXEdzHi8M0NhOcwtIIfD7A=;
        b=K1jhGkT0rQRrxYrdUccc9LKWjwtNtE9JBvnSETUmCSElTHz3NOMDx9VPkZFkQy2V3A
         CUvcwCNOaHGF6nFo9RaP8gIvxfiu+K9v2Ag/EaR3c9+GdJV21TX0oREV0piWy6RLVBvn
         evaQ5igK6kZvhfi0Dn7DSZYTP/pF0x6twRofcg0OqKpQ0r/uaFe63z/ZWeVMkr/oviF2
         TYPkZjPba4L358UAql88B6lSPqyq2FPTNyhwHN2jAKLQmiu8HN1Tyrkk18SQHEUWhz/J
         ugkzJOXqhPH23SbPD0Iezga5dB6M2Fk48fMh4ThAQq4tMx7xH0oW0oSZQYIa8YDlNway
         aKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8S3Uh23H+gQhsf7YASK94vXEdzHi8M0NhOcwtIIfD7A=;
        b=aLt+iR0hrtL3EXH1+/TopC/ZTBM8weF7swkFGpNXZ4hUBMn6SBCqxzr1ns9bNjSMTD
         /USESDG1o1kIXs5UzlQ8m7ruQqRd4koXDyXOCy68H4CNy4KYaJ6WEEoSZz9FrHldUJJ8
         Yz28OSVOu7hG1wKIFMLYzO+wOzf2mTZj9742zS9y1c512a4BTcJDxNjAnCH5CD1m462t
         1ovEjClyTpn6V7w/OfFEiwEJdHzqUM6lYFSlNexLQiTqxaAJpfQE1CzjmgksXAMMoyuR
         FLuBq3W266fTqslr0T1wl8pydYLUkh+MpAgOBlg0mHZgRYfuxmEmldHr+vI/qufZTCrg
         p0sg==
X-Gm-Message-State: AOAM533Om7M3oalNK5h5v+TjDSRdj7z4wozOsergUTlNJnFYtZcAS61v
	vkRDyX+dUZPr+xtK03G10B/XjsGRkN/qRg==
X-Google-Smtp-Source: ABdhPJz/zZHte4xMj1qmO9PuPTWmA+ei+0MmuKjvvtqrQohhqJyFRgyEP6VSgVJ9ZwybUo9jhUllaA==
X-Received: by 2002:adf:f645:: with SMTP id x5mr14835224wrp.314.1617737685884;
        Tue, 06 Apr 2021 12:34:45 -0700 (PDT)
Received: from bcarvalho-Ubuntu.lan ([2001:818:de85:7e00:ef5c:3f2a:a646:d6ec])
        by smtp.gmail.com with ESMTPSA id r11sm18793668wrp.70.2021.04.06.12.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 12:34:45 -0700 (PDT)
From: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
To: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com,
	gregkh@linuxfoundation.org
Cc: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
Subject: [RESEND PATCH] staging: emxx_udc: Ending line with argument
Date: Tue,  6 Apr 2021 20:34:09 +0100
Message-Id: <20210406193409.96428-1-martinsdecarvalhobeatriz@gmail.com>
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

