Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9FB70
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 13:50:23 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id j20-20020a05600c1914b029010f31e15a7fso1194758wmq.1
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 06:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZHPPmH/9scj2tTqrM6KnTGx6qYluXiPbPCqtebRoBKI=;
        b=tO1RHbrlih5UBJyU6ZDZsGAiXYZA6Snuc3mjqpgaVsZ0quAtnYMeCAOsJ4WoAxk3A8
         Uf5xLgy4tHLEcIoXIRw8HNcvzQ+ki0Y9A4r8wo/vGbgihGxjPn89d4V2SIqgvz3zSDqq
         c9fJsERb8Z47JTPxHS2BMCkABj0hJP3ObqzbZuyMO/5a5C/ZGJUt5nFSsyeUBetaFXMi
         q/AGsYOKBiF6ex/hp+dbn56UXYIQBOjukEgPVUK9NaTFkx137yYPT228uITNvXnIgEPo
         FBYS/3IvYj2yt64X1s4uqrKWT3KNz//6KtLcyiWcPGGzZhzrKC60Tx+vRebMVUxL74+u
         VHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZHPPmH/9scj2tTqrM6KnTGx6qYluXiPbPCqtebRoBKI=;
        b=uWO9vraGKEc+W5wpxgCql0oBNkAktJfGq++O5bL1mIwtdzBraz5DO0Poqq7HblGrNn
         SajNHRaBS0HQr8xMyg07EXe3FU8lmsVhfzzEPZBlyWWOCK5kfHrrGkmvsRzSWjO7NJg8
         f6PjQLmBKBoWauBuF3FkApf0L3G2s1JGV01Ck34g2s2+1Ajtm/GTSR0ioqO4xcFB+vyV
         X1RSUqbVt9lGjjFyde0KQYLmKvSJW1FirwUz9bCG/AX0q3Ku5NcXuHeepNaf5f3f//V1
         tYd+oSqRwCJXZ2N624NPpHkBkZbFy/EM8VEJRSDcqU1jP6wnxxFI3o4rpCIojAS1Xkd9
         GbCQ==
X-Gm-Message-State: AOAM530q4LppU+VxZercPTBRcqGUa158CdK3Pr+E275fBzF8o92N5Gjx
	Vz9WURiWRL5PYnm1u4KVaVc=
X-Google-Smtp-Source: ABdhPJyP36q4Qk3lamjjEWPQUjJMdSRoMpJqh71sR8CZq+cRCb+1pdLlV83kwvybx1CaHRQ2qBMVHw==
X-Received: by 2002:a7b:c7d3:: with SMTP id z19mr3251889wmk.139.1617803422380;
        Wed, 07 Apr 2021 06:50:22 -0700 (PDT)
Received: from agape ([5.171.81.68])
        by smtp.gmail.com with ESMTPSA id o1sm13431619wrw.23.2021.04.07.06.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 06:50:22 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 16/19] staging: rtl8723bs: remove unnecessary parentheses
Date: Wed,  7 Apr 2021 15:49:40 +0200
Message-Id: <1453eec49833fc940e134fc14bc65d218ace0663.1617802415.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617802415.git.fabioaiuto83@gmail.com>
References: <cover.1617802415.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix following post-commit checkpatch issue:

CHECK: Unnecessary parentheses around 'prxattrib->bdecrypted'
125: FILE: drivers/staging/rtl8723bs/core/rtw_recv.c:365:
+				if ((prxattrib->bdecrypted) && (brpt_micerror))

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 18ad719c9826..668a703dee7f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -362,7 +362,7 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 				if ((IS_MCAST(prxattrib->ra) == true)  && (prxattrib->key_index != pmlmeinfo->key_index))
 					brpt_micerror = false;
 
-				if ((prxattrib->bdecrypted) && (brpt_micerror))
+				if (prxattrib->bdecrypted && brpt_micerror)
 					rtw_handle_tkip_mic_err(adapter, (u8)IS_MCAST(prxattrib->ra));
 
 				res = _FAIL;
-- 
2.20.1

