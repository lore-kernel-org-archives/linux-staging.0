Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC8D6D09
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 09:14:51 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id b2-20020a7bc2420000b029010be1081172so3324954wmj.1
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 02:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HW8zP7DoM2YfAVkpuEz006Zh/rGoWUODHC32UiI5NeU=;
        b=OHRXh5+26RnIXBkTcT3u7qvjYxGs18gFrQKrrYik5fnQx+BAYvMZusUX2DxC+HiR8R
         I+GIUCHNGe3RB88aDwori/fRKOVcfm5OtgOvraG+ui0+UaRnorsuu3A34YqITsVALJlV
         3aClGUIhtYpRCHhHmLE+RS23JihKLjFPmKEqQU80tiW4uAn7B3FWoe5p1vpIkbBOG8dO
         ZA4tc1OSzg7bvZMnnac3YE/5JJad6DnJhezA15pO/Yt7N2+bFPZunZ/tVvZGMukkwG83
         akHq9vPK+1zE58103MxXr4Z0q9ij/K7TmrsT/Ty4RL0nT3n9mI2Yi8ytv4cLZONw5Nqa
         vTyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HW8zP7DoM2YfAVkpuEz006Zh/rGoWUODHC32UiI5NeU=;
        b=DdILjmZPgj79zYaauGIWiAhZU3tJS6SVKAy5AOi9DWrxGWjP05dYyiIsvjYVpOvzLy
         xogJi0kzDA95fpTM2HSrq29k8qxl11IK5tjJpndpwtaDOETax6Bo5xgxvm10Fa9bW4K2
         r1mJ5eRr5CdjzF/BFznDJ2XWyvJ2JTgHayuRr3IOFu7dxn12Zbqohs8czzwGZq+gZZvQ
         kSSmob9Fm725lWzWmUZcPFlarqWi2/2VE7k1OF2S7gj5qH/U/cbHdvKMAiFZ0iTYZ0/s
         oyyNp1dcowmVZ9PDNTzfrUFeoIgZ+iPazDsy9zVbaetqDfjJCJ9phySmc9/DKx1J/3ix
         aC3Q==
X-Gm-Message-State: AOAM531eQCEuJf4yWToIY04pH95MJmO06foaI2ezDHcY/OhEYGqk7b+v
	nM9MtFJwjqbKfkgfpzBqTj8=
X-Google-Smtp-Source: ABdhPJx5HvirmS15z/0MhS5AZ3okG4YxAYVKgxsnFMmQEyRQ9tafwrDkVpjln0dqSnNepkAGekZRNA==
X-Received: by 2002:a1c:1f4a:: with SMTP id f71mr16391388wmf.101.1617441290342;
        Sat, 03 Apr 2021 02:14:50 -0700 (PDT)
Received: from agape ([5.171.72.64])
        by smtp.gmail.com with ESMTPSA id b66sm3828776wmb.48.2021.04.03.02.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 02:14:50 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v3 23/30] staging: rtl8723bs: fix comparison in if condition in core/rtw_recv.c
Date: Sat,  3 Apr 2021 11:13:45 +0200
Message-Id: <5acf0d9573f2d9cd5d249f928fbfeee010f5f3fc.1617440834.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617440833.git.fabioaiuto83@gmail.com>
References: <cover.1617440833.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix post-commit checkpatch issue:

CHECK: Using comparison to false is error prone
27: FILE: drivers/staging/rtl8723bs/core/rtw_recv.c:381:
+				if (psecuritypriv->
			bcheck_grpkey == false &&

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index cd4324a93275..21949925ec77 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -378,7 +378,7 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 
 			} else {
 				/* mic checked ok */
-				if (psecuritypriv->bcheck_grpkey == false &&
+				if (!psecuritypriv->bcheck_grpkey &&
 				    (IS_MCAST(prxattrib->ra) == true))
 					psecuritypriv->bcheck_grpkey = true;
 			}
-- 
2.20.1

