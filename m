Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C7B2CA1
	for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 20:51:33 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id j18so46600659wrd.2
        for <linux-staging@lists.linux.dev>; Wed, 29 Dec 2021 12:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UL7Kn9Pt7QSxCX3ozk8sdDTpNPjuICREpZJE33+iy7g=;
        b=AJ0GPSzKZkzR0OZtAN1puQWHbU7AlzaOhvVtaTa1+4j7Asij4eJ94eaqLQkWOZjpBF
         /dUNNxFOjemSixCCMXvlNcOTJgU64/dIcTBN2lhJF4qsecQTlbgIWxn8SNbLPG/WQnng
         QIBeHiKQ97snAKh19+I2LhOhxJ7vrU9gzm0mfnA1xdUfosgnPLFwffyge54bLf1ox/Sk
         Yg5qmdcgQEhpB/F1XQ5SbTF5T76d70kPZPdz6rG8uw63mugqbkG7OjZjF9vpNE6PObtL
         zAG4n7/11C3RVAJWEtAwsXmE6hMgnFj0CXcO9iQis5MAlxnYD5u4zRWxPj/VqUgkmpco
         qOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UL7Kn9Pt7QSxCX3ozk8sdDTpNPjuICREpZJE33+iy7g=;
        b=m/4ERlbjVWmy030SDOBhOuqs6now+B2BuDsZcGB6Wcz4IOUpk6BzL7dWfEJvVBHSEc
         bRFLSAp0NxM5Wcwk+uZVepxpRViIi33aQdGz6VEiIDm/GbH4FbF270AYKYDxByBCIi2D
         /n9naUtpE1bp3XefowTihdN99wxCbf51NYdh0Oz/DqxqVbdMRXcQ81nNVDFB6Sy+co6V
         x/ECB41aK5/kzgUS8BHNKCN6TLf7em4l2pMkgfEh4ZYQIrHQAef5Ubl97Qq2ZRvw3GqO
         nWjiKtKoIPTMVy6uCLPOZDnAnb/8hdpd26PJSPgb7NnB/6raUZHem0e1r8RqM6yxcRDj
         gnEw==
X-Gm-Message-State: AOAM530CROXpXBCea8zR97Z46ElZzI6cod359ZVBD74JqMXnXjGT5Efv
	bJCFz9e087saGj+aCa9bSZ0=
X-Google-Smtp-Source: ABdhPJxywXSYd5shvP11bCpoLVc2r4gWUNwGPxvGGsvH7q+xiqL706RvnN/TYXMkje03x0FUCJiEPw==
X-Received: by 2002:a05:6000:2aa:: with SMTP id l10mr22680499wry.518.1640811091476;
        Wed, 29 Dec 2021 12:51:31 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id l12sm27421989wmq.2.2021.12.29.12.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 12:51:31 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 07/32] staging: r8188eu: clean up coding style issues
Date: Wed, 29 Dec 2021 21:50:43 +0100
Message-Id: <20211229205108.26373-8-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211229205108.26373-1-straube.linux@gmail.com>
References: <20211229205108.26373-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up coding style issues in odm_ConfigRFReg_8188E() reported by
checkpatch.

WARNING: please, no spaces at the start of a line
WARNING: suspect code indent for conditional statements (4, 16)

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm_RegConfig8188E.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/hal/odm_RegConfig8188E.c b/drivers/staging/r8188eu/hal/odm_RegConfig8188E.c
index b5b614686a65..3c591bf9459c 100644
--- a/drivers/staging/r8188eu/hal/odm_RegConfig8188E.c
+++ b/drivers/staging/r8188eu/hal/odm_RegConfig8188E.c
@@ -7,7 +7,7 @@ void odm_ConfigRFReg_8188E(struct odm_dm_struct *pDM_Odm, u32 Addr,
 			   u32 Data, enum rf_radio_path RF_PATH,
 			   u32 RegAddr)
 {
-    if (Addr == 0xffe) {
+	if (Addr == 0xffe) {
 		ODM_sleep_ms(50);
 	} else if (Addr == 0xfd) {
 		ODM_delay_ms(5);
-- 
2.34.1

