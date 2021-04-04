Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD21770
	for <linux-staging@lists.linux.dev>; Sun,  4 Apr 2021 14:10:26 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id v4so8747951wrp.13
        for <linux-staging@lists.linux.dev>; Sun, 04 Apr 2021 07:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wv9UQx8pFx9EKn1LAk5Wrb1T9ZM1NP2AqUIoiI8Ejp0=;
        b=u6vfMqCI2MtUyeqLsgxkpUQzbF+w+I1CB9FeeQP+NYympvJxX+YAzIqcW4KRxiyjHt
         s9aCSIcFiJogB8HfX1FRKATNm7Y1BgzDxUCDElq/jJ8x8D5o5brdKfA3L5qqnDP5fDtH
         c3oNyTmutIJOV1N02AENrcnniCnSbaioqBMbToyHl7PQi4laEQ/OHXMCN/+7GFyXdU77
         nf+Y4rS7XWO+c2ChbmHxrLr8wluzonIg7IP3BdDBDTWhFUx7sxytHpdTxCfAWSe9bAi7
         /F/UO92MGJ6+RrOVnRECdJHdbgUk15/Ompqd52ZOujBegBSD1vzRpTCinnyYBmduodhq
         Bi1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wv9UQx8pFx9EKn1LAk5Wrb1T9ZM1NP2AqUIoiI8Ejp0=;
        b=KBwFsmkVq5mB3xdRFGp7539VdHjjh//q90jtky2r1X4eM7ZW0cjsBt2ubqHpZoOpuM
         Fuo/oQQj/Aq4+KMCdw8JW8AALK533Ee4enleKox9mx5jfg8zKj5m9UGuhtW5aObvGJpY
         uuuezzG1BX3i+4jrlqZu4Z5q+XarfORnhPbeco4hBp438vKrfMDt+1R7sIyvw0opnN5e
         eZ97CTOCv/vH1ScO95B2TE8wnfe3+HVUNGFr1PQuh8l/tU+mMrKWELr+pMTG/nVsaq9c
         CmdknVcY2XZeBUiniJch4Oio9WcLMnUs07INJjvxyvn0FcuC5lAxzv2D/+c2v71V8xLr
         N3Sw==
X-Gm-Message-State: AOAM533xHS1Z3bXy9zP+W4kc8bFpAWheUs5eud774cmtdMFD8iGxvW/Q
	qr450ygdX2BIzrHi7ZosiLM=
X-Google-Smtp-Source: ABdhPJySK3lhlaYVHenCUv2Qf/NKI9TvLcB//ndFIcbcHb47S+/O7bRCnv6Rqz90V8aet1hNU+CQLQ==
X-Received: by 2002:adf:f7cc:: with SMTP id a12mr24871522wrq.54.1617545425339;
        Sun, 04 Apr 2021 07:10:25 -0700 (PDT)
Received: from agape ([5.171.81.112])
        by smtp.gmail.com with ESMTPSA id k16sm11320479wro.11.2021.04.04.07.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 07:10:25 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v4 21/30] staging: rtl8723bs: split long line in core/rtw_recv.c
Date: Sun,  4 Apr 2021 16:09:37 +0200
Message-Id: <ac256752eddba7678e8305cb5e560969dec482de.1617545239.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617545239.git.fabioaiuto83@gmail.com>
References: <cover.1617545239.git.fabioaiuto83@gmail.com>
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

