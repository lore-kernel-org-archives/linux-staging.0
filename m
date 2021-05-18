Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83656D0E
	for <linux-staging@lists.linux.dev>; Tue, 18 May 2021 04:44:27 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id ep16-20020a17090ae650b029015d00f578a8so853304pjb.2
        for <linux-staging@lists.linux.dev>; Mon, 17 May 2021 21:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XZRMdbjxMxB4jilOYqB66sZPAREoVkPe1v6Lee0oUs4=;
        b=iLWsrAi1bzNb6Ny1SZ+EqLbTmvGKxgXbnO87xCBUV/SioaE7lWKJNfclmiiMll3RVe
         GBT2lZ4zljRObXp/WM/KqkRMM/1tBoc8QegQj10NJ/pH8k6qV15q4rV0wntQxU6CzVTy
         8GCQCvxHzrT8jiGo2QEbirbgRXFaJIDvlT9R8EXJoYm31jw/SJSknfwcEo/6tT1AKrzO
         lhkvPVrzb8KwOBkZz5QoVhxm7WW02QowLJFqpXk0K/LQyYFpCoydwLaike0G9Mlgerfx
         CFx3SwRWUQBelG1nHuhmuxPxBEPBJQJ0h4kk1gB+HWujjhw7+pr8kVyAf11v2V9ko/gD
         asTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XZRMdbjxMxB4jilOYqB66sZPAREoVkPe1v6Lee0oUs4=;
        b=dU3CMrOBxrpCSwR2lKt7vhfo3Eq3wXhbgIoln+tGp8UlSHS4bIlMON3itwXnvin+c6
         kb8YyE3MbgpntYzcJhutr9TefMyXJeGqj1memuuTAIOZ8/ddC68BteZ5due8T7kKfnoL
         5lEHms3obp7hl5VTSmnD2n9tJiqebDjQNJh7fqh5sF3+bPMn0iwnTt6NOXZ5W2uwvxhR
         +IWdWhuCZyo/PKo0WaFpnECoMHwA96HAZltpxMI8dvtl3JlzRR0MK0YGu2EP4Wq39p/S
         ULnAKZxsdUtvFtrzIbqoP0vby6SFKXhIW3dcC2FE3/Riqd2xxJm1Tuzp9xlmPb6wh7Qx
         CMpA==
X-Gm-Message-State: AOAM531CZgoBBs0h1QjYyu7Ca6ZRZ884Sm/TLkAG8DNpFp1nOh/dT58f
	CCF9PaYYm9Injzlo5iPe4Dk=
X-Google-Smtp-Source: ABdhPJwrEPev0BjXHphGbKgGWulX1v4SAk+tUih50mHbMnYF0UvN0YbbrrzOmiAec3MkuJoGz9CJDQ==
X-Received: by 2002:a17:90a:f18e:: with SMTP id bv14mr3341739pjb.234.1621313067403;
        Mon, 17 May 2021 21:44:27 -0700 (PDT)
Received: from localhost.localdomain ([203.126.139.7])
        by smtp.gmail.com with ESMTPSA id t15sm357538pjh.0.2021.05.17.21.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 21:44:27 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: gregkh@linuxfoundation.org,
	marcocesati@gmail.com,
	dan.carpenter@oracle.com,
	fabioaiuto83@gmail.com,
	fmdefrancesco@gmail.com,
	eantoranz@gmail.com,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2 7/7] Staging: rtl8723bs: remove dead code in HalBtc8723b1Ant.c
Date: Tue, 18 May 2021 00:41:19 -0400
Message-Id: <20210518044119.2960494-8-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518044119.2960494-1-desmondcheongzx@gmail.com>
References: <20210518044119.2960494-1-desmondcheongzx@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit removes dead code to resolve the following checkpatch.pl
warning:

WARNING: Block comments use * on subsequent lines
+		/*
+		CL_SPRINTF(cliBuf, BT_TMP_BUF_SIZE, "\r\n %-35s = 0x%x ", "Latest error condition(should be 0)", \

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index cc7f558903ac..e5464a27c052 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -2509,12 +2509,6 @@ void EXhalbtc8723b1ant_DisplayCoexInfo(struct btc_coexist *pBtCoexist)
 		CL_SPRINTF(cliBuf, BT_TMP_BUF_SIZE, "\r\n %-35s = %d", "IgnWlanAct",
 			   pCoexDm->bCurIgnoreWlanAct);
 		CL_PRINTF(cliBuf);
-
-		/*
-		CL_SPRINTF(cliBuf, BT_TMP_BUF_SIZE, "\r\n %-35s = 0x%x ", "Latest error condition(should be 0)", \
-			pCoexDm->errorCondition);
-		CL_PRINTF(cliBuf);
-		*/
 	}
 
 	/*  Hw setting */
-- 
2.25.1

