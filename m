Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A2770
	for <linux-staging@lists.linux.dev>; Thu, 20 May 2021 17:47:21 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id k5so9528085pjj.1
        for <linux-staging@lists.linux.dev>; Thu, 20 May 2021 10:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uaNz0pGgnw41U7b9/4YySDsutMOtFyU5/A1BP+vwOSo=;
        b=nCxzoJwnT7b6cU313aMMJaaa/LaDoZ4dIFz/OQLbUH1mpz+AZordGu5hYYSSoF3iuZ
         9jzy8zZoas868Og3FAhNYOhzCj2pdqvV9gHZYuJ5nbVWCIdbZNxc6kfmtl+GyipUpUAi
         FbVj/sxrrKf0Q25Z6ougkD5jPcdFSl7uW9HamsQTMVYAXiUbV5ovyPgE/vugL3v1mCVh
         6jh7FVqWmc7LhgJCPiiAxUAmAcMBzfDpJ1td1suJCAULiANv+WqwmOd4uyD1O3J7zZre
         mJbVZQwLGKY49yHvgTRqxv46eCFFLE6a83VkLBwO5pJp6DaHy4C7o/k+Kir4HAL/fYqw
         Di2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uaNz0pGgnw41U7b9/4YySDsutMOtFyU5/A1BP+vwOSo=;
        b=oFVT6GI+/BDj/SfoyGLCQhLX9GIv61Rxo3ig6DvZ+mbdEEqOwaBE8qNiLAJsSswmQv
         z5qLdxIMtfZz/gy4jL40ichyZh3w35fBtYQk6Lw7enl28FjREBwcKDjqXGDtmZhBqnRd
         uhXuAUuKpaHevkud164ewX+lRmBSoR8r2pUiOyJtUpZ9bESv2AVs16AYAHuoqtiUF1CS
         613wNkNRWBQodfKVZWVswkUSILdyGhgRIp6/vImp3sJowPQbXlVhNVnUZWafqpQs6br6
         AZV70h1FTiZlZgu6JbogCbteUmDH0njv9dTLCk6KT1gd5UwNCr5ZLzdgZ8T9RK8gd/GQ
         NNHA==
X-Gm-Message-State: AOAM532a74DGPFRFwVAp0bfnlug4ftEOl8BD9qOVOeE3DkWbbRvyoXVY
	6/DPugQDnAoW70xaAT7h8zA=
X-Google-Smtp-Source: ABdhPJyxsXj/b5lWKiUQS4qPuu+WqQ2yEz3XfUJJmUnGQ5dI42+4c2/1SAu9dNtZLBLiOuMOjm1pkA==
X-Received: by 2002:a17:90a:7e09:: with SMTP id i9mr5967986pjl.166.1621532840693;
        Thu, 20 May 2021 10:47:20 -0700 (PDT)
Received: from ubuntu.localdomain ([103.196.78.23])
        by smtp.googlemail.com with ESMTPSA id t15sm5775310pjh.0.2021.05.20.10.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 10:47:20 -0700 (PDT)
From: Hriday Hegde <hridayhegde1999@gmail.com>
To: 
Cc: hridayhegde1999@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Dewar <alex.dewar90@gmail.com>,
	Sean Behan <codebam@riseup.net>,
	Colin Ian King <colin.king@canonical.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: emxx_udc: Fixed coding style in places where lines should not end in '('
Date: Thu, 20 May 2021 10:46:57 -0700
Message-Id: <20210520174701.8370-1-hridayhegde1999@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fixes were for the following checkpatch outputs:

CHECK: Lines should not end with a '('
1076: FILE: drivers/staging/emxx_udc/emxx_udc.c:1076:
+				_nbu2ss_writel(

CHECK: Lines should not end with a '('
1228: FILE: drivers/staging/emxx_udc/emxx_udc.c:1228:
+		length = _nbu2ss_readl(

CHECK: Lines should not end with a '('
1465: FILE: drivers/staging/emxx_udc/emxx_udc.c:1465:
+			regdata = _nbu2ss_readl(

Signed-off-by: Hriday Hegde <hridayhegde1999@gmail.com>
---
 drivers/staging/emxx_udc/emxx_udc.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/emxx_udc/emxx_udc.c b/drivers/staging/emxx_udc/emxx_udc.c
index 741147a4f0fe..8364316c1d25 100644
--- a/drivers/staging/emxx_udc/emxx_udc.c
+++ b/drivers/staging/emxx_udc/emxx_udc.c
@@ -1073,8 +1073,8 @@ static int _nbu2ss_epn_in_pio(struct nbu2ss_udc *udc, struct nbu2ss_ep *ep,
 		i_word_length = length / sizeof(u32);
 		if (i_word_length > 0) {
 			for (i = 0; i < i_word_length; i++) {
-				_nbu2ss_writel(
-					&preg->EP_REGS[ep->epnum - 1].EP_WRITE,
+				_nbu2ss_writel(&preg->EP_REGS[ep->epnum - 1]
+					.EP_WRITE,
 					p_buf_32->dw);
 
 				p_buf_32++;
@@ -1225,8 +1225,7 @@ static void _nbu2ss_restert_transfer(struct nbu2ss_ep *ep)
 		return;
 
 	if (ep->epnum > 0) {
-		length = _nbu2ss_readl(
-			&ep->udc->p_regs->EP_REGS[ep->epnum - 1].EP_LEN_DCNT);
+		length = _nbu2ss_readl(&ep->udc->p_regs->EP_REGS[ep->epnum - 1].EP_LEN_DCNT);
 
 		length &= EPN_LDATA;
 		if (length < ep->ep.maxpacket)
@@ -1462,8 +1461,7 @@ static void _nbu2ss_epn_set_stall(struct nbu2ss_udc *udc,
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

