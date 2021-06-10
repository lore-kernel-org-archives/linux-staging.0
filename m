Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D7F2FB2
	for <linux-staging@lists.linux.dev>; Thu, 10 Jun 2021 15:53:04 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id w4so7512947qvr.11
        for <linux-staging@lists.linux.dev>; Thu, 10 Jun 2021 08:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HusublkSZRMk4OjQy2DcQtE3Z9YSNom7wG4laSKspA0=;
        b=ITnZzhyTiyw/n0L4w2kDSbTCfd2L7qkxkJgBIGxepm1BXqVRFFjAWK5tp77xThGT25
         MDBr3T0Tbssa1OlhYm/hRSBKdvPStmnnr8Sm1bdvhP6f9yMh88lbZDHka88iL83PZ5J7
         LQtH+nfBywi1Dvxp92eXhsDzJbd47tbf5A9UfK1k+rWeOO553auSMSJ59lJmLnM4nc1/
         e9gw06bAolgV4kRX09rWRimwN9MdS9UEGAdBPa2jB53KBmzrY5Fv/Fw21PGhaMmCG/dR
         TGXQZ0huH6FK+2bbQlzxFC6d76fFPHvj8eK/RnUS9EQgo1X4N92QG1xlxx8lo3NTNUWa
         qAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HusublkSZRMk4OjQy2DcQtE3Z9YSNom7wG4laSKspA0=;
        b=VJrycmvx+qm/+YlX4w8tnerr6Sm2ryAra3by8g1nx5xj3UvOILKkGWuD8u4pkqnofE
         8RM5Jx9Ey2oua6P3+NSSrXN+nR2rrIBZPtrwXpZ5SSHC/dgSQ8p1tbQnZiovlup8Gm1Y
         KBZQWzzw3pfHO1qHr0WLjLQt3yT4Y+Q/Mtk9tNnDcLB1NoXKfuX37Nxn5QkxMF7QQwyw
         Noiy4z4oT1/Uf7MmB4Ao/F24P0sKjgudcyvwI9HPLu2pGhkx2KguCOTYgkOp5d7mO32z
         9cQ6UOcSDslzICDpapt1yvWuVu3Esj8vsQLy8Mix3TJFU0OhqfX15ag28Pfl8epZzHOs
         ovFw==
X-Gm-Message-State: AOAM533rijANkIrfq1vjPcsIRR24YhhqlyQaKWakW65nDZcLMcygK26i
	W8AXX50FkpwsDWtPnJCqMPA=
X-Google-Smtp-Source: ABdhPJxdVRbHLKoMuzqaLSpGm6XCLXlaSc9JD6JTXJnQmdwnSnk0sBic6XKOUWsiZfHfJYWLDkLXXg==
X-Received: by 2002:a05:6214:e4d:: with SMTP id o13mr222755qvc.19.1623340384180;
        Thu, 10 Jun 2021 08:53:04 -0700 (PDT)
Received: from ubuntu ([191.96.170.82])
        by smtp.gmail.com with ESMTPSA id e127sm2564302qkf.62.2021.06.10.08.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 08:53:03 -0700 (PDT)
From: Philippe Dixon <philippesdixon@gmail.com>
To: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Cc: Philippe Dixon <philippesdixon@gmail.com>,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] staging: rtl8723bs: core: remove whitespace from beginning of line
Date: Thu, 10 Jun 2021 08:51:17 -0700
Message-Id: <4fa641ac2f1fc1b1952c0f3265723289ef711ee9.1623339773.git.philippesdixon@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623339773.git.philippesdixon@gmail.com>
References: <cover.1623339773.git.philippesdixon@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the following checkpatch.pl warning:

WARNING: please, no spaces at the start of a line

Signed-off-by: Philippe Dixon <philippesdixon@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 347c043f5305..04956ccf485c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1339,7 +1339,7 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 static void dynamic_chk_wk_hdl(struct adapter *padapter)
 {
 	struct mlme_priv *pmlmepriv;
-    
+
 	pmlmepriv = &(padapter->mlmepriv);
 
 	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true)
-- 
2.25.1

