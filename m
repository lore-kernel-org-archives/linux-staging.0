Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7436F72
	for <linux-staging@lists.linux.dev>; Mon, 22 Nov 2021 13:10:37 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id m186so3352187qkb.4
        for <linux-staging@lists.linux.dev>; Mon, 22 Nov 2021 05:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+PnC8Q/2hoId1m9hye9rp84tP4YYq89c/x16u1wHuFM=;
        b=PPMyp7kYd+NLYf06P+27pAK8/eb/WAO4+jZmPPIWlkits3mBuFI3cfiyFeymoThetT
         y27pqncW/0GFX1FFrUUPrb7MGpp/JnOBuZVpk45v/v3yOziPbRBNHLjWalRH0BUdH7Go
         +J3gA8072dVZMJcZchDrbSBvJ9NjYNe5LpiiLo8YhiA990wenMYsg9+9V+mjcXhiDeXQ
         hsZt7NFxFcNfFUPbU/sTSXFOf+Ymrc4rBDbl5gXMRHTHtyhVFzkRAO/5/5pFfo/scYDR
         Jx3XmAGSShPJy6HTbtPfaV68TEtHlm7C11MHEykPAh0XNrifhMYZZ1GKpvWNXMTLN1cF
         wXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+PnC8Q/2hoId1m9hye9rp84tP4YYq89c/x16u1wHuFM=;
        b=rOeIXlfIIDc5VQZYbUeEKyBC0xyyiWjDUCi164Je4qs+HedffsYUYcnKgJJrIOPMEI
         6hZGn9vFKLmyWWiF7dfOjM9tKuv0k4lK1CSx24lF8Dl+C3C2BbDovp6AbDB3ptZx4slm
         Xt84UU+8ZNtjkFCl8XdUnPrlAUin+Qbkc8/PToJwSupXp/c3CPa29IBwNp8KaTNB/oJj
         RH3OTEEETIAUsx24YgCpHUjks/pAwcxgvKs4U64wdwmJZFexUd6z6zDK700KwXvNLf+f
         Pf9De/lUOQAhlSu9OWugcSO1spmNp3XeL5edcy6nh+pLra8aJdnAIgxXUpZd4GP5LrrL
         FgmA==
X-Gm-Message-State: AOAM530qnaGivndQGK3TxTPqMZO9l/g2eK/lSW18XXlJifXQOG2y4VoU
	ACnzbclGofUD2Y6V/s+/spiYov2xQGEpjg==
X-Google-Smtp-Source: ABdhPJxMuj8b4MzbGxSOjAIa521bjob2/X1Tz9+Eowpwui4EVFC9GGJFxoZb3DaeGvko5806WGrJ1A==
X-Received: by 2002:a37:a956:: with SMTP id s83mr48738890qke.422.1637586636295;
        Mon, 22 Nov 2021 05:10:36 -0800 (PST)
Received: from localhost.localdomain ([181.23.85.46])
        by smtp.gmail.com with ESMTPSA id s13sm4651343qki.23.2021.11.22.05.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 05:10:35 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	nsaenz@kernel.org,
	stefan.wahren@i2se.com,
	arnd@arndb.de,
	dan.carpenter@oracle.com,
	ojaswin98@gmail.com,
	amarjargal16@gmail.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH RESEND] staging: vchiq_core: remove superfluous static_assert statement
Date: Mon, 22 Nov 2021 10:09:26 -0300
Message-Id: <20211122130926.342128-1-gascoar@gmail.com>
X-Mailer: git-send-email 2.34.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After removing the BITSET_T typedef in commit d8a364820e01 ("staging:
vchiq_core: get rid of typedef") the static_assert statement becomes superfluous
as now we are checking if the size of the u32 type is 4 bytes. Hence, just
remove the static_assert statement.

Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 53a98949b294..55abaf02a196 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -74,8 +74,6 @@
 	((fourcc) >>  8) & 0xff, \
 	(fourcc) & 0xff
 
-static_assert((sizeof(u32) * 8) == 32);
-
 #define BITSET_SIZE(b)        ((b + 31) >> 5)
 #define BITSET_WORD(b)        (b >> 5)
 #define BITSET_BIT(b)         (1 << (b & 31))
-- 
2.34.0.rc0

