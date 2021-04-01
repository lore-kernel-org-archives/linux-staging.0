Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C167A71
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:21:50 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id b7so1874957ejv.1
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 02:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vwTkwJLj057qjRGk5qprK4YhJpBpmhOZC6UYL7UeweI=;
        b=uTirED+FkCcb3BNVfz9ujknRCRyIrBiBji+BmnqA8dNcTdxB3JJk3QfpqUFu4Rv52p
         C8w/JDRv1FBRr6VM/YXaL+/8sUv5SujIGvAqIYx8MvWgkGZvMoYRPqw9cgf5XPr3O/8L
         tNrE01NLv6GyRgzvATfar4moPqaCnEvLXZ1fCL5SwfYpVqZqHzIILeLL/+X1ZYI1Msy1
         0x7cH3iersyfH8RxlkWT+YkJ0pOj/SdyMrQ420+Ik83BgT9h6Au2x3pXYDKJiLfy55r0
         X603+/3EO9EoGmvm7zhCC43MdOE68+MMFFjkCeH1Q9+4Us56Q6SKMuTIA+3p5mUG88l1
         LZNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vwTkwJLj057qjRGk5qprK4YhJpBpmhOZC6UYL7UeweI=;
        b=c+JHia1M9N/CTE1i1q9kvFl/D5SIF0knvCeWA8MX21e1hAMClSpJflvfa66Lxnc9l9
         jMTmwf5+pP6LXJCxE+QQQX5Sjog+A6SC1lB6ubW4t5fDDHAQHKVwGUgL0IOR8VYRM9aI
         8VxDpMczTAYOHHXzxajDjiOkZoRGPfAZh8ILmBNgzRRSFm4xn0X54gP7V/gv8izg2s06
         4mUwenPGEbOER47cFX+vssheVAw1Q48aVuSUCVZt0S3iDrX3n3qoQg/qQKDE6lcy2rKc
         k5pTG1IAjTnEHdjqw6DdMccYVaxqKnaXknZATnD/yZVa166zhGXjg+8rfv+XtyTmfST4
         long==
X-Gm-Message-State: AOAM531D6F78Job42cIAqFDYdSZT++l3Npmu3v+A4lQkWTybmHh7fUu5
	jDfX1PcEUegbqcjs2Y36kZ0=
X-Google-Smtp-Source: ABdhPJxCGTHm9inhFrNpARSfK+PfwuAx3q7jeeXJH91KTa8dCBKKFt9CvJXys4gPP02Cttk0TIcr9g==
X-Received: by 2002:a17:907:f97:: with SMTP id kb23mr8069497ejc.33.1617268909375;
        Thu, 01 Apr 2021 02:21:49 -0700 (PDT)
Received: from agape ([5.171.80.247])
        by smtp.gmail.com with ESMTPSA id s6sm2476360ejx.83.2021.04.01.02.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 02:21:49 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 16/49] staging: rtl8723bs: remove empty for cycle in core/rtw_recv.c
Date: Thu,  1 Apr 2021 11:20:46 +0200
Message-Id: <a65299f9b659d9904fd105da50ab67772125b31a.1617268327.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617268327.git.fabioaiuto83@gmail.com>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove empty for cycle

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 9bd742e22ed3..5eb9914c48fc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -363,10 +363,6 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 
 
 			if (bmic_err == true) {
-				uint i;
-				for (i = 0; i < precvframe->u.hdr.len; i = i+8) {
-				}
-
 				/*  double check key_index for some timing issue , */
 				/*  cannot compare with psecuritypriv->dot118021XGrpKeyid also cause timing issue */
 				if ((IS_MCAST(prxattrib->ra) == true)  && (prxattrib->key_index != pmlmeinfo->key_index))
-- 
2.20.1

