Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D17528FA;
	Sun, 15 Oct 2023 11:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ld8zR+4f"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5a7ab31fb8bso42040107b3.1;
        Sun, 15 Oct 2023 04:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697369271; x=1697974071; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v7ir7MAeCxuydH35Tr35csIS6YonhaPinnnXnjQUiNE=;
        b=ld8zR+4frrI9peKj4KMwB3s5mUhYWTONPW2KCICa3ha1NCoPajui3a+HcUTaV1z1Di
         gYwKQrgovQrttFT/BvQti4DCRe0JW1uRdrAL5XeNwRNAi41ORpo9TxLAioJxN+IfZ2ls
         58zmU2Dwey3fB8X2ZhlXSKS8FzFLVxiJwpGE5r+EeMObrRUx481WGl7D4qhEcPS7jJcM
         okVISw66/Vaj16gk3pTsmW8lMKHElS3bcHPOSPHtbskDqHmwWdTlupHK6cEHMwZDpoe6
         kUDykTVkKQb3zXZQoSPHuxW/PwW9+MYW0Vm84/pkEBa4I6N5z2Q+w77bnOFJ1Tkc3WDC
         sWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697369271; x=1697974071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v7ir7MAeCxuydH35Tr35csIS6YonhaPinnnXnjQUiNE=;
        b=Jyk3N/wV9KsKjb+7NGuWwr6yWUU9sGrvvGL8XquC8Pl4On+cyQ4Qi3nAfEIHrHi/PV
         TqEeMVweJR/zMYs7aztPUZ7ii8HawxIGTRRxrw7rbM8AR5n4+pZpVM5TtErkgec14WFO
         D20fi6gOWMGog9hgi95mDR3V6lc5GnANbX58z9Jmx0uEldt2oeWCMypbj+St0zm0Sbhq
         J68W7vs3y7AbKpijh444BSsTpMu62ZzQupixJzFUVT09DxglIvyXusNQQx3CZ3hl57Xh
         74mEKAGEowLPUCiYiXbpCur/2aDfXFshwcgdHedpBLE6lfUTVl+gUg8qEcA2eZKHOpqM
         j++Q==
X-Gm-Message-State: AOJu0Ywn85ru1Ng6gisqSWxe/3JglLbfFy0je+SsvjbP7KCR3uM6bEAu
	Q8/HusgNqe6aTP5d4AyreUo=
X-Google-Smtp-Source: AGHT+IFcE2PgdBj9vA0T4zOBQwYkgLlsRHFJfDYxrV9KMLi9Kdu+kvqWNNMtV8IrigqTTmKnYCh2hw==
X-Received: by 2002:a0d:eb46:0:b0:5a7:b972:a5c0 with SMTP id u67-20020a0deb46000000b005a7b972a5c0mr18945390ywe.3.1697369271317;
        Sun, 15 Oct 2023 04:27:51 -0700 (PDT)
Received: from gilbert-PC ([105.112.18.68])
        by smtp.gmail.com with ESMTPSA id h128-20020a0dde86000000b005925c896bc3sm1333765ywe.53.2023.10.15.04.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 04:27:50 -0700 (PDT)
From: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gilbert Adikankwu <gilbertadikankwu@gmail.com>
Subject: [PATCH 1/6] staging: rtl8192u: Align descendant arguments
Date: Sun, 15 Oct 2023 12:24:47 +0100
Message-ID: <76218d7a14d7f70c4a1b2f1140a69ac7364f1aef.1697367161.git.gilbertadikankwu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697367161.git.gilbertadikankwu@gmail.com>
References: <cover.1697367161.git.gilbertadikankwu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <20231015112447.j5eWwpWAnzGZ83040KbjtoNdqZvSbDxAf3GV6YCMvPw@z>

Align descendant arguments to the open parenthesis as per the "Linux
Kernel coding style" in Documentation/process/coding-style.rst

Mute the following checkpatch error:

CHECK: Alignment should match open parenthesis

Signed-off-by: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
---
 drivers/staging/rtl8192u/r8180_93cx6.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192u/r8180_93cx6.c b/drivers/staging/rtl8192u/r8180_93cx6.c
index 2527cea60e3e..1453a0307eb4 100644
--- a/drivers/staging/rtl8192u/r8180_93cx6.c
+++ b/drivers/staging/rtl8192u/r8180_93cx6.c
@@ -114,7 +114,7 @@ int eprom_read(struct net_device *dev, u32 addr)
 	ret = 0;
 	/* enable EPROM programming */
 	write_nic_byte_E(dev, EPROM_CMD,
-		       (EPROM_CMD_PROGRAM << EPROM_CMD_OPERATING_MODE_SHIFT));
+			 (EPROM_CMD_PROGRAM << EPROM_CMD_OPERATING_MODE_SHIFT));
 	force_pci_posting(dev);
 	udelay(EPROM_DELAY);
 
@@ -165,6 +165,6 @@ int eprom_read(struct net_device *dev, u32 addr)
 
 	/* disable EPROM programming */
 	write_nic_byte_E(dev, EPROM_CMD,
-		       (EPROM_CMD_NORMAL << EPROM_CMD_OPERATING_MODE_SHIFT));
+			 (EPROM_CMD_NORMAL << EPROM_CMD_OPERATING_MODE_SHIFT));
 	return ret;
 }
-- 
2.34.1

