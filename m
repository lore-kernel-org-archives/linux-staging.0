Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C4A2F9C
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:57:44 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id u21so105732465ejo.13
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ACO+R08CoyLCjvDMxXLNgD1Yym9DyLgjQx6IL72eiqo=;
        b=Cb58TPZTxpMHBf+GSxxia/jruA+b/5wNawtH2GaAKuZVf/nbkFrKRajNzxX9z5ke56
         hkEFXaH5HYJXsWUgeJaumUlHdkxHPj79dIXGzyPl107H7cgwy2ts8Vx32kJE8+69Wyi2
         LF+c3O8nBOXTMIfGzgPuDAQNPeZ8jqehJ1GoCUnRkpVlzFOMS85qkoP5u08Z7304pPP9
         UrbDnjC7VS+rsim7LqUdhvqc3YCZYFgEO1yflXHSL5S0S8xpcsqVaXZ27K9dfDj/r//E
         jGXbfNeiMpVfyXhuF2ya0pHOM9rog5YW+wbWvbjf139z8vgc5YnTfh6oKuHhGO/4eN1f
         jW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ACO+R08CoyLCjvDMxXLNgD1Yym9DyLgjQx6IL72eiqo=;
        b=DIfsERtA/KAscL0HIgAfLWti03uM/M9IWlWtDOr24+XLE1Eb+gYAeUBFdOE/6rOe2P
         ngDDkePfvg+SXtIf2P9FYGFHDFoe3khn5blhiU33S/DiSVM3rki4QbAY/AJ+vJIsPnAI
         sHSBnqL+Otjq2eINnJQoq8QoZkBUOcuN85Akg9/EpPfg4zgDADpmZuLiuQf/M0El6PF3
         63OB6jMILI7GYIzDp8QD1FJP9rMxbzlL0Y+tyqzP8EhYmLAspydt7zTVKSKQr+mw5Deg
         iiPp8H4dOj/yqV7wZDJuBczPTYtUfvlF3T0igZnCm+R+O8QkAPe4iDd8Q3Dn496L0IAx
         yhmA==
X-Gm-Message-State: AOAM531NhXo2iCOKqoOVW6rezDCzzxuOjObSqREdC78VlXUGubJnQJhg
	AWnjabdqGMMXzRRrPwXACwI=
X-Google-Smtp-Source: ABdhPJxtb3RAkkTHuw4O1xODhTTPGZNzR2NjGgsRR3fsv7IdSEMwgamv0vI9kixWBImvq5KrBZTn8Q==
X-Received: by 2002:a17:906:b7d3:: with SMTP id fy19mr4789821ejb.269.1619794663526;
        Fri, 30 Apr 2021 07:57:43 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id g11sm1452354edw.37.2021.04.30.07.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:57:43 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 22/43] staging: rtl8723bs: remove braces around single statement in if block
Date: Fri, 30 Apr 2021 16:56:44 +0200
Message-Id: <1c95d3d0d4ccd74d4e97ee496f7a04eadd1f8ff0.1619794331.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619794331.git.fabioaiuto83@gmail.com>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix following post-commit hook checkatch issue:

WARNING: braces {} are not necessary for single statement blocks
21: FILE: drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c:609:
+				if (!bBtHsOn) {
 					algorithm =
		BT_8723B_1ANT_COEX_ALGO_PANEDR_HID;
 				}

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index 57579d7eab71..911d753e51f6 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -606,9 +606,9 @@ static u8 halbtc8723b1ant_ActionAlgorithm(struct btc_coexist *pBtCoexist)
 				pBtLinkInfo->bPanExist &&
 				pBtLinkInfo->bA2dpExist
 			) {
-				if (!bBtHsOn) {
+				if (!bBtHsOn)
 					algorithm = BT_8723B_1ANT_COEX_ALGO_PANEDR_HID;
-				}
+
 			}
 		}
 	}
-- 
2.20.1

