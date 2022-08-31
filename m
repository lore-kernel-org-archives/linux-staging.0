Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B992568
	for <linux-staging@lists.linux.dev>; Wed, 31 Aug 2022 14:45:35 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id f12so14158459plb.11
        for <linux-staging@lists.linux.dev>; Wed, 31 Aug 2022 07:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=kcg2Q/3J3Ju4dFD9SiNuiFf7WPpy0/Z3n17LeQlJ4Zk=;
        b=HrAyq7AYwQdxuPqPF9lcKP/1LOiLbB+6lqfDjjA/ZAa6BtTUwcAtffEPCJzp4Vm7uu
         mmKNx5FyPQFuRcTZ+h9YD8lYiK9K0+otCUArq+g1oARRy0s9uhN9Typxrzw8K+ucnWLa
         xz8IqQwATJZD8lhQUAT0ApZ8fskyms8WXk+2QnXd1Iylf2zDykLUYGit6gQMKlA00PUN
         cgIlYJV5zs8Y78xchFnK34F4K72XK0ibEs5OP+JCmJcVswMyq7zEjyrLzMVTUBD09ZD9
         t+bH2zOUT0XsQUQg/E+XpwVQmn4426UdUJrfDQwfC7I9Lo7QWBP9PsHmJbzh8+oxUpIm
         uRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=kcg2Q/3J3Ju4dFD9SiNuiFf7WPpy0/Z3n17LeQlJ4Zk=;
        b=mR/tF7+0xZfgnnthObxinvLlcTiFF3/m6Ehh8qsmDudgo1eK1UhsLKuk05QaWkvnxx
         mAqdXuFsTvbZI4PA0A4rMI2EmjnaHdVBsRkdPDLtvc50NgrNnsIuMerJKtDxub1T/9lO
         923hWlUucURz93Z51ipUcwyDdSBIaUAZt8g2Sm3LmrqnvptsJiVcR9TRdC0sYu1wTkqu
         SdgKN38fHiyRIheS3RmIqEmt6ZRdNWXyvGUs0MGBB3mUqb7z/IFTsY9mj5uuIgvEBGKh
         rqXhZxzhHl93zlrerjbJO6nKTK8tCSYSYgKSw44NI/SgtGUgY7mL8Kks+lBThfLbOTo6
         E8Nw==
X-Gm-Message-State: ACgBeo2b7tG7KhBU3eUXWqjZO1WbvmBHWzcB5zBP/7iV2GIgKmeEf+vo
	8envcapnmYrE1BHgFTGBXa0=
X-Google-Smtp-Source: AA6agR50AgP4dMzaMMUwe5EM57JCW/RS9jAv3FzrbFhfpU8Lvy8L0ALv1LgeC64QTgfbq3pamI7LuQ==
X-Received: by 2002:a17:902:be12:b0:170:cc74:989b with SMTP id r18-20020a170902be1200b00170cc74989bmr25899146pls.88.1661957134708;
        Wed, 31 Aug 2022 07:45:34 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id m20-20020a17090ade1400b001fad1f975casm1415835pjv.12.2022.08.31.07.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 07:45:34 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: cui.jinpeng2@zte.com.cn
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	paskripkin@gmail.com
Cc: martin@kaiser.cx,
	straube.linux@gmail.com,
	abdun.nihaal@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jinpeng Cui <cui.jinpeng2@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] staging: r8188eu: remove redundant variable ret
Date: Wed, 31 Aug 2022 14:45:29 +0000
Message-Id: <20220831144529.304636-1-cui.jinpeng2@zte.com.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jinpeng Cui <cui.jinpeng2@zte.com.cn>

Return value directly from rtw_set_wpa_ie() instead of
getting value from redundant variable ret.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Jinpeng Cui <cui.jinpeng2@zte.com.cn>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index d6b6021a4250..31a439663626 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -1709,11 +1709,9 @@ static int rtw_wx_set_gen_ie(struct net_device *dev,
 			     struct iw_request_info *info,
 			     union iwreq_data *wrqu, char *extra)
 {
-	int ret;
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
 
-	ret = rtw_set_wpa_ie(padapter, extra, wrqu->data.length);
-	return ret;
+	return rtw_set_wpa_ie(padapter, extra, wrqu->data.length);
 }
 
 static int rtw_wx_set_auth(struct net_device *dev,
-- 
2.25.1

