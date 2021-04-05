Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094F45F
	for <linux-staging@lists.linux.dev>; Mon,  5 Apr 2021 16:50:27 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id t5-20020a1c77050000b029010e62cea9deso5922124wmi.0
        for <linux-staging@lists.linux.dev>; Mon, 05 Apr 2021 09:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WwoHEE8hHryiGOd3Mhwepcll5gXefGpIh1T+3gwkYJA=;
        b=tqeE2euWnKJ4LxJlLnz/7r0IDiJgQNlZJ8eVaQpBBXg6Z5IgffojYfxIylNdq7T1Wo
         rVaOqRm8or4A4D7eZK0iKtOKUMLl58Ky94xSJElTS2mUvLzmOv2v9yGg+ymW9YvtZcF9
         lgzWzMPw2wPOUpRCw7fmUd2ArfEjyRAMWGKrXAC6qw82OMLhL2GDXH+hFPjnjmFaj/DT
         zTcIUxxk1oslxX3jt0xcc5kXF/GCtahv/STmYLKY1AirWn/dV4aOzXpyiJNSDQUmE1hR
         SxWEIA8aDkM5qUg+H+ImS7p8dyyGIphvTu3vohTIa8VDmDY70gNDAO9Gc34upTP6PDHr
         Aedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WwoHEE8hHryiGOd3Mhwepcll5gXefGpIh1T+3gwkYJA=;
        b=F2lDXXRG76K8InGa1U9yEllHFeXkWNGRt/FllpTg8EEsBrkpACtQ9cR/cR4kk6nz7x
         cWt71sF0bIrKh/w3BS8enmMe3FWnz5+NanKerUAIkaUHJnT+95V7zI28bWRXLKgUw7Yl
         nVFBR71YpqrCZFZrdTG6QCVBC7kcaq1g9d6mEx6wmGF7xOAxMpTm0cUYfC+cHZ0FDyx8
         GkHbJxMTBh/z6GbyfhOck/1jn2SgzW+ssKSkkdtJyKoQ9Gfz1zd+hWWvJ3hh+ALkd/TP
         i98eW8QWykrWzc5Rw5bd2D9/8R3ugJnF9MFX2m8Oc9PdjwYLiduTCmW3x06HiiQftzDN
         JpTA==
X-Gm-Message-State: AOAM5318g2P2BefHAFSjg7w/hymx/BscRNOeN0FYLlmEcYRIIpj6IV7V
	5QkoNgvbLMUwHBjwqzbGqGw=
X-Google-Smtp-Source: ABdhPJxY7qv5aB9NnvH0CerBlsu3vuoBBShY9Ell9Z8KHFjiqo8KdwZOxWNOjZgCpfx5MvK1vtv6PA==
X-Received: by 2002:a05:600c:19d1:: with SMTP id u17mr26064wmq.141.1617641426524;
        Mon, 05 Apr 2021 09:50:26 -0700 (PDT)
Received: from agape ([5.171.72.58])
        by smtp.gmail.com with ESMTPSA id s8sm28366511wrn.97.2021.04.05.09.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 09:50:26 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 07/10] staging: rtl8723bs: place constant on the right side of the test
Date: Mon,  5 Apr 2021 18:49:54 +0200
Message-Id: <8a6967abaef8b2edad6dc829dd232a7f048899d2.1617640221.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617640221.git.fabioaiuto83@gmail.com>
References: <cover.1617640221.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix following post-hook checkpatch issue:

WARNING: Comparisons should place the constant on the right side of the test
85: FILE: drivers/staging/rtl8723bs/hal/sdio_halinit.c:676:
+	if (_FAIL == ret)

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index cec72abc983c..5553246fa80b 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -673,7 +673,7 @@ static u32 rtl8723bs_hal_init(struct adapter *padapter)
 /* 	rtw_hal_disable_interrupt(padapter); */
 
 	ret = _InitPowerOn_8723BS(padapter);
-	if (_FAIL == ret)
+	if (ret == _FAIL)
 		return _FAIL;
 
 	rtw_write8(padapter, REG_EARLY_MODE_CONTROL, 0);
-- 
2.20.1

