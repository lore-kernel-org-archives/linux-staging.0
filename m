Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F186D09
	for <linux-staging@lists.linux.dev>; Fri,  2 Apr 2021 17:30:52 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id g25so2826508wmh.0
        for <linux-staging@lists.linux.dev>; Fri, 02 Apr 2021 10:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wv9UQx8pFx9EKn1LAk5Wrb1T9ZM1NP2AqUIoiI8Ejp0=;
        b=hVQo0ISj4yCSQQtRv1KZJR3kDYHkEm9yu/V1uGelkH/U5+bQu60+38gwsq88R83NCB
         XtD1847j23hanWDdp8o32tuUyhabC69hgu7cCvu6mytOWoc6iy25WknCga0D7OWT6bw/
         c8vMIg9MPfROcZPBSK72UFaRyyZtft1Qxi4ZnqasSIdAzLkajrplCa6THRjlfi50vcgl
         2z9l/j24e7CZOVNWBqpfOG5kC1bsUqufM8HGIwPccJ4sFmYu2h9EZkYAO98H/LknDeu1
         CW8tSnV4f40ep6OHJxWhIzpHcWj0lj0D05dEmQtFSXTzQZcJqfq0ccqDNY/Tt+mWoHog
         N5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wv9UQx8pFx9EKn1LAk5Wrb1T9ZM1NP2AqUIoiI8Ejp0=;
        b=imj/ZD9IsY2E9o1Rh6VACY6Zk82lgC22fm62IxzCCgIsnL53FiCHavUPRf4A0ZAa+l
         7pobmLOqpqVg+UfE2IlSAFO50wN5J67j/Dtz5W/cuoPKm/5dyisESjAdg3CUMlp/W7mm
         po/h7fV16LY6/BQ7M7I7FjJrKpRTyPeYlwHpcrPMQFcghQFZZBPFb085QHk7A3ORuXFG
         D96/slvbJNKizz5kEP/F9LNwJZCk6VU1dPx6pIYC//iWFbd7JrteTroVUwNRJByesy/l
         4FxG8WTtVAvSmEANxWCgxD2Y3a8wsWahr5fE2/JsCDx4FQ/bmMLTCML0QpecARZ89u/c
         BSxw==
X-Gm-Message-State: AOAM5307+II/elRmQ22BNq58p8/4Es54ILRRQS1V52RzUVaamFHUF4lp
	nN7p03NzuBe0vHfe50DYhoE=
X-Google-Smtp-Source: ABdhPJyoPkbwxsOKVJ3jnjdBsbR3q0G3y3V9sAnRzRw3aox9pvnlyxFntawi++drvKlqNMxCSHyELQ==
X-Received: by 2002:a1c:a958:: with SMTP id s85mr13352615wme.138.1617384651505;
        Fri, 02 Apr 2021 10:30:51 -0700 (PDT)
Received: from agape ([5.171.81.4])
        by smtp.gmail.com with ESMTPSA id c11sm15832908wrm.67.2021.04.02.10.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 10:30:51 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 21/30] staging: rtl8723bs: split long line
Date: Fri,  2 Apr 2021 19:30:03 +0200
Message-Id: <273f9c3f1cc7ac8bc77cad7c929ff6cc3fd8fc0a.1617384172.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617384172.git.fabioaiuto83@gmail.com>
References: <cover.1617384172.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix post-commit hook checkpatch issue:

WARNING: line length of 113 exceeds 100 columns
110: FILE: drivers/staging/rtl8723bs/core/rtw_recv.c:381:
+				if ((psecuritypriv->bcheck_grpkey
	 == false) && (IS_MCAST(prxattrib->ra) == true))

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 953351f896c3..c8a13d733c98 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -378,7 +378,8 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 
 			} else {
 				/* mic checked ok */
-				if ((psecuritypriv->bcheck_grpkey == false) && (IS_MCAST(prxattrib->ra) == true))
+				if ((psecuritypriv->bcheck_grpkey == false) &&
+				    (IS_MCAST(prxattrib->ra) == true))
 					psecuritypriv->bcheck_grpkey = true;
 			}
 		}
-- 
2.20.1

