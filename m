Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717D34680
	for <linux-staging@lists.linux.dev>; Thu, 21 Jul 2022 15:01:07 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id 72so1956910pge.0
        for <linux-staging@lists.linux.dev>; Thu, 21 Jul 2022 08:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JeYFtSPDsXNaZXYrTwjNhCXDJakI4RnMXmS/UIy+7LE=;
        b=SVI/XP2iFa0W/zveXCJv51PNfqhga0CSOUN0fdkEHmWKHobZSaspDG5RxXsDDBQQqg
         RVmpCBXdniVucnHYKvXWxGWrWRfdQONRjg9GxkpSroCpDslUTIiYU59DjdUe6B2agKPZ
         GaFIXlE5jLO7WhGb6HlBMZOzntlBElwDKLDYzMFq5AypUsw+OVfafHs47V98mpqpuVAb
         iyIEuTBDHaO/ARlR4Rr3yuHYTuzMiy2UyKpSTbG2PxkdSXZXarucw66nUuISrAZPsKLy
         mswB1Au0PV3twyhlMa8mCayZdFXNmVbCQM508g/pUuOIcNpxpA+2aXWsuHN4aBcFzdMt
         oPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JeYFtSPDsXNaZXYrTwjNhCXDJakI4RnMXmS/UIy+7LE=;
        b=wt9T36lzLliEzq+AkvSHNpj+rXeIN+RUUPkxcqiq6IV03QJMSwBTk5VgNcJJ35CtHo
         XrGH7IimQfeEVPLrY/qAdvMBHSS0IuiaUJSadRFtixYxA0gKYL/J/Qzh69YvJMYATTux
         sfH7USgqeWLQiu3oxZBXWLSyghHSeQzoK//RzVL2FKZidH1Euq5Izlk2oDC1rwkAdc4E
         xYm28qmXJ65wCXq50UlQoShQ1Qu85nXjCLUXLe8/jIcr+6Jx0vrM37bNakd3KYOYjusr
         mhdqhCDMdmTpUvcTwPa65f7eq9NS8BTaPKLxF8WEz61t9hggP6ruad0X4iHwCVbPAIpx
         4abw==
X-Gm-Message-State: AJIora+xGxTyXVN1YLM5ZX32PsmDXmA/1sF6pFv6s4XzOELaR30yURec
	yu3VrCe3wku4fmQiV80/WZE=
X-Google-Smtp-Source: AGRyM1vqv9W28F3bZ6fQOjrj7iN3NNLa2Q9GtVzBpwKiJnnbbWIJzHWbkOsSDolpAd3EeOmw30U7Lw==
X-Received: by 2002:a63:ce4a:0:b0:419:c8f4:d2a3 with SMTP id r10-20020a63ce4a000000b00419c8f4d2a3mr32246515pgi.515.1658415666756;
        Thu, 21 Jul 2022 08:01:06 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d01c:7038:6d29:af18:34a6:1c34])
        by smtp.googlemail.com with ESMTPSA id e25-20020aa79819000000b0052aaff953aesm1851897pfl.115.2022.07.21.08.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 08:01:06 -0700 (PDT)
From: Abhijeet Srivastava <abhijeet.srivastava2308@gmail.com>
To: 
Cc: abhijeet.srivastava2308@gmail.com,
	Corentin Labbe <clabbe@baylibre.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	mjpeg-users@lists.sourceforge.net,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: staging: media: zoran: Removed braces for single statement block
Date: Thu, 21 Jul 2022 20:30:49 +0530
Message-Id: <20220721150055.52096-1-abhijeet.srivastava2308@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Warning found by checkpatch.pl script.

Signed-off-by: Abhijeet Srivastava <abhijeet.srivastava2308@gmail.com>
---
 drivers/staging/media/zoran/zoran_card.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index 26f978a1cc72..0c138d47d0c3 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -1038,9 +1038,9 @@ static int zr36057_init(struct zoran *zr)
 	zr->stat_com = dma_alloc_coherent(&zr->pci_dev->dev,
 					  BUZ_NUM_STAT_COM * sizeof(u32),
 					  &zr->p_sc, GFP_KERNEL);
-	if (!zr->stat_com) {
+	if (!zr->stat_com) 
 		return -ENOMEM;
-	}
+
 	for (j = 0; j < BUZ_NUM_STAT_COM; j++)
 		zr->stat_com[j] = cpu_to_le32(1); /* mark as unavailable to zr36057 */
 
-- 
2.34.1

