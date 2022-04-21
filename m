Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0AF23A1;
	Thu, 21 Apr 2022 19:20:41 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id j6so4311321qkp.9;
        Thu, 21 Apr 2022 12:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B8hL0jBT5xZ4aSX/GQ3ksV9bgLPofPyPWC/LZsNauFo=;
        b=XG8SJK33BDwMiVJqw1QQx/+w1u+bNOgMSY0Tm61NDdxthwyeJVFDjL2trbkS26WY7p
         jZL5SP/LnQPZ5kJd5XLSgnkgsncZhKVC409Hef4jfDFnY7IvAbw0Z6Jcw5ly8OpeIWvQ
         UGM+j2W6WexEmdSC3Ank/7x641c5dvG07g0kMxV7X1pkEbmYdgybn5q+Q26uI8tDQWVQ
         nmn/qpPE4yC3Ze4PkH0PVABDy0yahSoMSStaJFAjC060xRGBneViu6lkGSIScGSvoj1c
         tkpOvlSUT8q2dgbTtjyc3YTrif4+V03SHSnA70t3curI6Qdf3RU+8XqLy4XWfRjB984w
         Pjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B8hL0jBT5xZ4aSX/GQ3ksV9bgLPofPyPWC/LZsNauFo=;
        b=f7JPPmBllCNeCJ3hhPkfcuUwnhkPxnZNpKs3vE9GcijML9PyHzSDxJBDNSnvY4qmQH
         dBF2daHiRCU2aosf+zaFjjlNqn+/nN1Mj2tu16SuwE0fPr8xNVUk3CKZ0Lygc4X3l68R
         d5ewbIuflJ7NAGhdKncO6kQWrXT8OMMkrKHRssmTZaLObqR+bCbkUAsWgiFS4u0TCxxq
         nDmIaNQXKZ83k8Vx51IALmtqlL0s5uHB9/l7mI6MGZS6uVOO0NlU5f/iVHvOl6lDv3+a
         dJu56hsRq8brDnmkpHagzK4UMo6X0if1EjUnZxM1E0nFh5L7PMeofevmczLvKBD2Nmsv
         On3g==
X-Gm-Message-State: AOAM533ZzgLNZV3/AwHp+mnf84Z41fDGz4XqLLvUCwGDknoZA3KtP30J
	UVDi/f1KVQBxGq1zoB5Jn24=
X-Google-Smtp-Source: ABdhPJz06GNbdRt8kpmS3Y9/FKz328cWWogMe2wv1AFvX0xYG0jQK8O4EbxTpjClD3KlnqRuCQpBHw==
X-Received: by 2002:a05:620a:2681:b0:67e:933e:54b6 with SMTP id c1-20020a05620a268100b0067e933e54b6mr647276qkp.428.1650568840022;
        Thu, 21 Apr 2022 12:20:40 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.wework.com ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id l9-20020a05622a174900b002f34421b01csm2567736qtk.23.2022.04.21.12.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 12:20:39 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	jhpark1013@gmail.com
Subject: [PATCH v4 1/7] staging: r8188eu: remove unnecessary braces in single statement block
Date: Thu, 21 Apr 2022 15:20:26 -0400
Message-Id: <b96ae957e2ddc519e56813a1c56e770168f67a2d.1650568579.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650568579.git.jhpark1013@gmail.com>
References: <cover.1650568579.git.jhpark1013@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove braces for single statement block to minimize the number of
empty lines, without loss of readability. Issue found with checkpatch.
WARNING: braces {} are not necessary for single statement blocks

Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 3e9882f89f76..d3f4d7cdfa08 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -112,9 +112,8 @@ void _rtw_free_mlme_priv(struct mlme_priv *pmlmepriv)
 
 	rtw_free_mlme_priv_ie_data(pmlmepriv);
 
-	if (pmlmepriv) {
+	if (pmlmepriv)
 		vfree(pmlmepriv->free_bss_buf);
-	}
 
 }
 
-- 
2.25.1

