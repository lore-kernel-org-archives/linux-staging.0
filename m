Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B88CD2F2
	for <linux-staging@lists.linux.dev>; Fri, 24 Feb 2023 10:50:59 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id l15so17492796pls.1
        for <linux-staging@lists.linux.dev>; Fri, 24 Feb 2023 02:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dW3qXQYpmNKcqlh4A0ERoGNSnFf2SSyTXbPFz2Oak8Y=;
        b=ks/XSPw525h+Cz4ygu0GbROT6kca0MC6o5cU/AR01Dv5hyZpWjF80YHJBuakUdTUjE
         NPObc8ulfp41MfLiOgPbbcLfi1qsLGHA4bAKFYAq/9WKpLshkLVNHEX1maRZy45vvQOd
         /K+Xp/Of+dwZjFSHrB4HdtFjiOx181IHaoT0zNCfIWkRyGtSr83ewtz8j/uiwCvoHR6Q
         SO5TQbZa4jgqrQnaVk9k9GvwAZxVWFLTGjxiAf0D8zTj+BxWuMwBUz5CyKGtuvy9FUT/
         PJ+3mrzzHIvpd93Jk296ibq8EDyn/IgTRbdy+ht484QIglJAuMrzMAkKfteFZndxmqW+
         M5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dW3qXQYpmNKcqlh4A0ERoGNSnFf2SSyTXbPFz2Oak8Y=;
        b=mxS+ozZ1k2N1LMGFB9yVLRHYyHb6sF1kUCandhJHRlYy4Sy3nNOWozMVM2XdME0R3o
         17bKRz93SoJsWgDBjGDBuEX2/9WZjRfRYA7zavx3n7agt4wdUeC7FvWJmruOHIJc7KTx
         0wF/ftao42u/kyiolI+erwRZ5i7FP8pcolBapeU0daO/x/BPL+sInPCKeMQgDskDbcAg
         sLW2dI+xF0WHV6bQSPDlpn477GcRBMdXMPzVPEiL86C2NjUY93+A9Y+IHmfetH3wa+tu
         Rq7w81hnDpxkql/D/inSRRCNRV9y5TEs5Q8iCJ7jubxtclVE+T5Zxkh9kx2MZOwz+Th8
         IRWw==
X-Gm-Message-State: AO0yUKUzWI6shFCkprokASsy7TR9KnLZ6bNuAsuumz7cg99LTQ0OdxZN
	aQ4tQFhfe5KgnHUR6kk0dAo=
X-Google-Smtp-Source: AK7set/Wm8ZkZur4lZZ/ZSqtkJF98/L27AWp2UMInfRwraO3lAO9xpUHtwt95ROYV3/Y6bEpftzFBg==
X-Received: by 2002:a17:902:ce8d:b0:19c:da68:337b with SMTP id f13-20020a170902ce8d00b0019cda68337bmr775918plg.16.1677235859176;
        Fri, 24 Feb 2023 02:50:59 -0800 (PST)
Received: from XHD-CHAVAN-L1.amd.com ([103.115.201.82])
        by smtp.gmail.com with ESMTPSA id be1-20020a170902aa0100b00194d14d8e54sm7827461plb.96.2023.02.24.02.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 02:50:58 -0800 (PST)
From: Rohit Chavan <roheetchavan@gmail.com>
To: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Rohit Chavan <roheetchavan@gmail.com>
Subject: [PATCH] staging: vme: remove unnecessary parentheses
Date: Fri, 24 Feb 2023 16:20:48 +0530
Message-Id: <20230224105048.758-1-roheetchavan@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch removes unnecessary parentheses in order to fix a checkpatch issue.

Signed-off-by: Rohit Chavan <roheetchavan@gmail.com>
---
 drivers/staging/vme_user/vme_user.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vme_user/vme_user.c b/drivers/staging/vme_user/vme_user.c
index 4e533c0bfe6d..5027d91d7038 100644
--- a/drivers/staging/vme_user/vme_user.c
+++ b/drivers/staging/vme_user/vme_user.c
@@ -506,7 +506,7 @@ static int vme_user_match(struct vme_dev *vdev)
 	int cur_slot = vme_slot_num(vdev);
 
 	for (i = 0; i < bus_num; i++)
-		if ((cur_bus == bus[i]) && (cur_slot == vdev->num))
+		if (cur_bus == bus[i] && cur_slot == vdev->num)
 			return 1;
 
 	return 0;
-- 
2.30.2

