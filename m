Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183376136
	for <linux-staging@lists.linux.dev>; Wed,  2 Mar 2022 20:48:16 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id k1so2978187pfu.2
        for <linux-staging@lists.linux.dev>; Wed, 02 Mar 2022 12:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X/qCzXaSJsTevlXZxqUkbNmOTkHTMDBspxfTDqWAX6k=;
        b=BrUxiwuIeoNRbH8jZ36dzBZx/WriEcfMeF8R1thCBtA3mPceDRxvDDHJgIUlNSC73/
         o8Ef0k/TlerQjGcBWXZY+nR5akDOMaGKr3yHpeHCt3TQNMxRVYYjON2xCuT8rO8Swnfe
         G+MXqBP4mCD7SbVk/YT4+0t+hiiXfQUkMchwIVn5PTt9IVAlouYbHelpbKEwI872JcKk
         MLIxt8ZfX6NR6htfwg3FXsYR8EiP9WdKyLGmpepz3Salhb/t5eSGeNXPvojeuX5K/vPG
         iyeJ8OO2fI0e6rofjpAjwAUuwRqDoe4c9htP7ol076HnELRjXsXztp9MI/X7bMP7kBOQ
         j49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X/qCzXaSJsTevlXZxqUkbNmOTkHTMDBspxfTDqWAX6k=;
        b=u7JOjmntEVeeDGVcjQ4cWPAt4gdSFvIq706LbIYmVDQdPTztaspRLkX9kh/g5Obb1j
         BW5y4c4guhA5is17aQQzHKFT522uMVuwGER7PbAHt+Dg+9SARXfuc16ZS3alArwqVw3k
         67cSJvnrq7MHdYJ5PRIXykH/c6pvvJgCbdkWdAQVE+WRgKLgwbrNJmRUWudFYkPcdgVu
         XyfniXwl5r5m84PUqmc3avFk35+QDwA004kFxwkf+SgsUnySislWJamh2YxVX8TCdJmg
         9vCtk4f4ne92S6PJR61cMSgudKBSYWEHkMfLkKpmPqXJFiFubEQ05LlO50Q1B7jAdbCL
         4gSQ==
X-Gm-Message-State: AOAM532sIH1jk8Y5LSrQT+vI/K7mZS7hU/qe9to5jGneUkF1zc/QmmXd
	u2UCg3zCjYt2Vmwdw0ionx0=
X-Google-Smtp-Source: ABdhPJzBpsupHvG4Cux6vxKxRLWFsQe6QIitvMOhFX2OwjcuhGmCCe9xm+u30rBgNOjUkQLql+HQ9w==
X-Received: by 2002:a05:6a00:3006:b0:4f6:54ba:3581 with SMTP id ay6-20020a056a00300600b004f654ba3581mr4128592pfb.83.1646254095641;
        Wed, 02 Mar 2022 12:48:15 -0800 (PST)
Received: from localhost.localdomain ([103.161.98.179])
        by smtp.gmail.com with ESMTPSA id bh11-20020a056a00308b00b004f40144cf76sm50905pfb.142.2022.03.02.12.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 12:48:15 -0800 (PST)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH 04/16] staging: r8188eu: mark PS_RDY_CHECK as bool
Date: Thu,  3 Mar 2022 02:17:25 +0530
Message-Id: <20220302204737.49056-5-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220302204737.49056-1-makvihas@gmail.com>
References: <20220302204737.49056-1-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mark PS_RDY_CHECK as bool as it returns true/false.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_pwrctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
index b20436f75..7beabf82e 100644
--- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
@@ -151,7 +151,7 @@ static void pwr_state_check_handler(struct timer_list *t)
 	rtw_ps_cmd(padapter);
 }
 
-static u8 PS_RDY_CHECK(struct adapter *padapter)
+static bool PS_RDY_CHECK(struct adapter *padapter)
 {
 	u32 curr_time, delta_time;
 	struct pwrctrl_priv	*pwrpriv = &padapter->pwrctrlpriv;
-- 
2.30.2

