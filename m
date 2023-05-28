Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27D87C
	for <linux-staging@lists.linux.dev>; Sun, 28 May 2023 15:41:38 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6af8b25fc72so972691a34.3
        for <linux-staging@lists.linux.dev>; Sun, 28 May 2023 08:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1685288497; x=1687880497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bl3YC+K9pIicljZpxp1Y9H/zXA7QbseGMJCLEGLLPms=;
        b=G6VwHZXyhqUKcjpZHqgLQ6OGjEgSL2ZxYcpOgWYUeE/5rdXN5tSaliymhBAIDmGFsE
         HXtG5Kf3HOtaDa6af5FhSmnOKB3tr5mR26ACJBHzt1RDDBxgN6BVM4Ps7p3L7WAx9HRV
         zC+BTEOMw+sREefuTDkUMi1UCHBS7yYxClYWPo6dZzGr0iskbjn7zi5qHxZJXTdGFIcK
         tSMHBN4VU5mAAZhUd6kKx25V9Yp9LIsmfom1CRtk0hKZMJqr0A0H7Y52/6fIyWSIVtp2
         oHAMEUQUqzWOZb5w7eJilh6hKZUDoBzjK8w76UtaRwVpxKhs0C5fVX8CS2Xa0o84V6kP
         sMiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685288497; x=1687880497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bl3YC+K9pIicljZpxp1Y9H/zXA7QbseGMJCLEGLLPms=;
        b=XzO7RsVQEjTvoZeDvnKxDyJzL2iKEpNwA6CiMte3ohXnqJK9L+codw/+uEKJ9pNu1e
         K7unD3agcnRPPZGmEdpVihpNty4JGo8rjt57OiYbee82hNpDpl54Xf/qIWhnzzR/GUaX
         P2NUktLvqgHfjjUMRu4IsQVXQY6hNhsdL138MZ47+s+XcqTlpbPiZH307XjAxX1ZkAdv
         bjRj/Wtb3ddW4eQcmrCrS1dCB5sfvdOSwl0RGAYD+Dtkfe0ddweZkyKfPIYlVQhPk/3Y
         94NELDo27kJyb+w7I0bG1fN77X6ynamRHvLurFbWJfxOl5VW+70ldMGQ3K5GCj37wIye
         f/9A==
X-Gm-Message-State: AC+VfDwyeDOoJpg0POQLVGeBHQvCyRdvmnSe1I3ftafxPRucv4UGibOg
	pPVZESq5nV1TlL0DDYXqL8FOFw==
X-Google-Smtp-Source: ACHHUZ56kjmLqsnFwcc/Efx5bHTV5PHh0c4CwKqBQbZ42GFL754umFy15oY1e530KY3sJ7ns1gENaA==
X-Received: by 2002:a05:6830:1611:b0:6af:e87e:aa5e with SMTP id g17-20020a056830161100b006afe87eaa5emr3784121otr.12.1685288497627;
        Sun, 28 May 2023 08:41:37 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:63:8ae3:4d1f:9fc2:9fe6:c88e])
        by smtp.gmail.com with ESMTPSA id m9-20020a9d7ac9000000b006a64043ed69sm3659217otn.56.2023.05.28.08.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 08:41:37 -0700 (PDT)
From: David Tadokoro <davidbtadokoro@usp.br>
To: gregkh@linuxfoundation.org
Cc: David Tadokoro <davidbtadokoro@usp.br>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rtl8192e: clean unnecessary braces warning on r8192E_phy.c
Date: Sun, 28 May 2023 12:40:10 -0300
Message-Id: <20230528154010.3068-1-davidbtadokoro@usp.br>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean a checkpatch.pl warning of type "braces {} are not necessary for
single statement blocks" on r8192E_phy.c file.

Signed-off-by: David Tadokoro <davidbtadokoro@usp.br>
---
V1 -> V2: Revise commit message

 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 4b0ebe96302e..ea993cbb7bf7 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -1099,9 +1099,8 @@ static bool _rtl92e_set_rf_power_state(struct net_device *dev,
 		break;
 	}
 
-	if (bResult) {
+	if (bResult)
 		priv->rtllib->rf_power_state = rf_power_state;
-	}
 
 	priv->set_rf_pwr_state_in_progress = false;
 	return bResult;
-- 
2.40.1

