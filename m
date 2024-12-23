Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF3C14287
	for <linux-staging@lists.linux.dev>; Mon, 23 Dec 2024 15:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734966695; cv=none; b=ShD2wt31eOqtIiJPNC3rII0N5va+Fn5dv5GPKzoXjjfhE8sIS5nkTneRXmIGyJmrni+ZzJu3CrmUUlm3+vsXl4n7F3iLpe2e38GhAuLV4wW7ufHpqqfLuhYetVPw5JyRWQSB/rAvRrke1EIw4P2WMItZii5EDQxBaa1/br4G8DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734966695; c=relaxed/simple;
	bh=fTFucDhxjtEGgpn4AzDmmIuzURG6Ys6vAmcUHoLLeJU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JD74z8dqH9xt5Af9S0cRAri5le9j8BjEXUIMZjkg4uyB9hl+9JAuttxFZhtF9yQeJ7SOKYPJOV1qOIehkGMVQgegUcmNXB5rK5K94JgjsUdbyMImsYF0HBlUk9OERO6c+6nsUCylDg6OUGlLM3k31sanz26TAVJQtEBkhNhIVpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dJD5MX3u; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dJD5MX3u"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-725ef0397aeso3396315b3a.2
        for <linux-staging@lists.linux.dev>; Mon, 23 Dec 2024 07:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734966693; x=1735571493; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lI4kJIa4YMLuNKj11odd7DQVNVxgPQzDSixr+an5cnE=;
        b=dJD5MX3uNYqwFYotuKP2f/1xJaZ3WwipBU0agJKPZEl5m9eAx4jRnAYTK0GxhdCtgo
         n0n5cBRY0bLlobdilZEqu9VsSKD5WBYuCigeBKir9gpmbOe8fZTvrPwXbTI6TcdkPKla
         sEKwWkXSbdRDz8GIQu5t+3L4bA7fHYzR2/Lia5cxpmRndrMBMMFTHWMbTkE8wnGnE9w8
         qiz2AL5FJm58KRJINLsGdlVklKv2sXfH4rTyVNYwGM3nXseJQSfepbZisu4BkP/XUfgM
         oiREHR7eaH52Fv9Q9PMxRcgVABoo0iRk3lj+8di8qs4FLNrqwPbxzS7ESaCD1gXK80Lb
         Vz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734966693; x=1735571493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lI4kJIa4YMLuNKj11odd7DQVNVxgPQzDSixr+an5cnE=;
        b=KcawjvwVRRyc/ZP3w30d4Qbn9kAsi7xu4FZtZPAF/FTbX0lC0RI4Nje3l2kAajo2EV
         bsa9laYZ6yCqPf8+zBGVJxeP/RldxAUtpFw2SNRTp486IUgY0G/cueCeV1GnnKWKIXRr
         wjikf9hv+f8iY9JifDSnJ1KrWd0RPznor5pBq1Qw0HJE2rCf0tSbobFSqqfByNp50K3Z
         XidFDlcs0an46EJMnGisAKKMKHkQLtC8HrKWKmEdz5Ny63TPDFpJlUAdzrYIgo6Sf/0Q
         fncZIS6KjB7rbvBu5RDsIa6fH0yEGtMxoxytMo59eguVWEuORRH8GrroSzl8xZZ3EA0K
         umuw==
X-Forwarded-Encrypted: i=1; AJvYcCUs4yEcRrPYRPL3VScRcc+yYjRdHzSFVDP87wKZyUTUlyZKoW+HwmhWG/dzMw28bUPTItUWrDdzUt3J5d5c@lists.linux.dev
X-Gm-Message-State: AOJu0Ywu2HTWPTYopQeYX/gPu6plfGoDpmaEjXSnLVxLDpOXteRHq4Ok
	tvbtE3TZCf1lGBgfBBcg4tyNmbzp2sF4YsceGbqdw58tF8yFioeo
X-Gm-Gg: ASbGncsyY3hpgg+fbzg1geA+JCz7wA5Ss9pcXpjE6Cqec6nJR6FbVMy+aK0GvLZS1lb
	ctAMT5COML71bk3C5MstnYM7cMLOLxlgIyCeofoS86h2Hhr4utd7PoKdFl2woH6nknl1l6v+V9Z
	R4wOhothJe7yv2h4Bb2DdekaFc6vhhNW+mGR9Pt5skPxWkB8kTun3AML6qnbMSZFrWen1v2C5f6
	RdD+y4U8QUKY9OJhRX1kY/xVuNhtdNEjJk/WCNZKDXS+ZpYXXLy4mQlmgofPUf+nEyhX51vKQ==
X-Google-Smtp-Source: AGHT+IHo7Oyow4R0lnqRxcxf+UTkUABGQ7Oh8WLLMujHWeevLJRRTOWxtNS+3YqGLjYxkO9n+LoGhg==
X-Received: by 2002:a05:6a00:3c81:b0:72a:bc6a:3a88 with SMTP id d2e1a72fcca58-72abdecc754mr16191289b3a.22.1734966693548;
        Mon, 23 Dec 2024 07:11:33 -0800 (PST)
Received: from localhost.localdomain ([106.208.147.102])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fd7afsm7944538b3a.139.2024.12.23.07.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 07:11:33 -0800 (PST)
From: Atharva Tiwari <evepolonium@gmail.com>
To: 
Cc: evepolonium@gmail.com,
	Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: Remove module from list before freeing in gb_audio_module_release
Date: Mon, 23 Dec 2024 20:41:12 +0530
Message-Id: <20241223151112.206908-1-evepolonium@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously,the module was freed without detaching it from the list which could lead to memory leak
this patch uses list_del to safely remove the module from the list

Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
---
 drivers/staging/greybus/audio_manager_module.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index 4a4dfb42f50f..7e52c3f95692 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -69,7 +69,8 @@ static void gb_audio_module_release(struct kobject *kobj)
 	struct gb_audio_manager_module *module = to_gb_audio_module(kobj);
 
 	pr_info("Destroying audio module #%d\n", module->id);
-	/* TODO -> delete from list */
+	if (module->list.prev && module->list.next)
+		list_del(&module->list);
 	kfree(module);
 }
 
-- 
2.39.5

