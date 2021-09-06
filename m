Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E2D3FD5
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 01:01:20 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id b10so7352440wru.0
        for <linux-staging@lists.linux.dev>; Sun, 05 Sep 2021 18:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DaJZrVBTvj6UOGOwwJhOi48onzQqMeFKGn9Q/X6QLVQ=;
        b=Vz1xOW7U5+cxlIwDK+kpBOehFQ21cNoScFlfCutXQF1VSso4TuDN2YVkBmNdOHLyJi
         HkrvNFXnMg0mZbnaTuYqa3nNJg+eqtTV9C5M2GsIPLoi7/7S/PhSvddg8Efil3QOsT6e
         35sw6oMM1ap2OQc7VceVEIkuk363d18pN2kaRjEwuyJmii84zLPqfXx7BGKrscNdejxA
         I4ndbl5HYMdvMWLU+HxpsveTHsgTorsCKvrHh7cXZ/n/Dx5Tk1V6lEWXSL1sDMIV8ksd
         Px+fk9Df2+9PGq/mBpZW6Bc/1++nw9htJOyiBWuOL0bk/cHsR+dX/PDNtunt9lbEGkBi
         Ll9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DaJZrVBTvj6UOGOwwJhOi48onzQqMeFKGn9Q/X6QLVQ=;
        b=Vo7uesskhagKZqCwbdxMgz9M+CrbBLsWhWz802T3kFWJULD299cOIPRQomMSfyG/qf
         yBHaLNa781dx86jwNf3aDUt0FErtyvBlj9bMmqe/332Ya/Oc4mqmlYec7cspReOpxisq
         1sEr+pBidg4HcAVnZpwS4PRpTJ+UNpCQAZ8Si60z6E563aV2rWkd78TiDyi7ENI90vRN
         AxkoJe0HOhpnC7xI4xQAeUy/7dPiUCTnNAcSGUUKdCaO75+t4ifQEjFHu7jNFLqMnygH
         w2mbcE0BYgMYKnPbnhwPv9fYE4epzTzbxA8L0Vi5OW2RvGodCgbuvNZ0/R9WOIeLgRQ+
         dY0w==
X-Gm-Message-State: AOAM530c1MbXvoUMRVKako+61Os4mu5+5bSw/A/9Zh/lrLnuKA/RUxyT
	szw/0Hmp0FUi8DD1niCQlcCMCQ==
X-Google-Smtp-Source: ABdhPJwxFknlODuD0DhIam2cYXI0zB1niQpoBdAesgMy2u3m7DeVCWM2OArGNo8rCjpl8ri7Qdd2xw==
X-Received: by 2002:a05:6000:92:: with SMTP id m18mr10362555wrx.293.1630890078729;
        Sun, 05 Sep 2021 18:01:18 -0700 (PDT)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id r25sm5151232wrc.26.2021.09.05.18.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 18:01:18 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 12/14] staging: r8188eu: remove Efuse_PgPacketWrite_BT from struct hal_ops
Date: Mon,  6 Sep 2021 02:01:04 +0100
Message-Id: <20210906010106.898-13-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210906010106.898-1-phil@philpotter.co.uk>
References: <20210906010106.898-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove Efuse_PgPacketWrite_BT function pointer from struct hal_ops, as it
is unused.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/include/hal_intf.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index b47fcdcf2027..002bcb338cab 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -229,8 +229,6 @@ struct hal_ops {
 	u8	(*Efuse_WordEnableDataWrite)(struct adapter *padapter,
 					     u16 efuse_addr, u8 word_en,
 					     u8 *data, bool bPseudoTest);
-	bool	(*Efuse_PgPacketWrite_BT)(struct adapter *padapter, u8 offset,
-					  u8 word_en, u8 *data, bool test);
 
 	void (*sreset_init_value)(struct adapter *padapter);
 	void (*sreset_reset_value)(struct adapter *padapter);
-- 
2.31.1

