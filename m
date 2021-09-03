Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED8D72
	for <linux-staging@lists.linux.dev>; Fri,  3 Sep 2021 18:18:14 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id g14so177413ljk.5
        for <linux-staging@lists.linux.dev>; Fri, 03 Sep 2021 11:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=883xElBFencY5c0OGGg52rdLZq6bLCaxWzcjeMOL5Ig=;
        b=QRMaoMuu+mn7nYV8gnSsQzl0222xnKTRPE0tqT2Z4lYny5RixvHQLav7A2IOYhPiVu
         z9zjyFgpBH4MmrQTyXiJeg0DLDGTdOM0keZRvnUs+u406UAkyykG2QRezV0P5EjZwxkX
         VLtrbFHE4BfhWrZllXz7ledx/m8IP8YnPBVbjPn9UlsSOyAeLoNGGN/K3Ardm/XPYOxd
         QnfyLBaLH+QyCMKsYZuAmO9W7nTZ+MOm3g9j9boYblDt6B+M7CD27roOInJL6o+n5xoc
         3/d8j/x4U/AczX7WaUjOS09O97F3OojOUoAIylXzDQ6OYwseEUDkYPjwFG0V/7HLxbVt
         lrqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=883xElBFencY5c0OGGg52rdLZq6bLCaxWzcjeMOL5Ig=;
        b=U8/gUUnzCV6AYTOyjNQyMeHo2k2MyLmZMc2VFdJ4hOYx3wuw9yLqFHLfiVpqjgm5yD
         NovHL/487ISR+knC1qGf9eEJwlbprtSnJ2Zw3z6z02mBkW9lZIXjbpJvIUrj6a2HsEZU
         oxkZq3v2GFZdYYWwRzSWP2Ho4nn3O05HtOw273cJ5PW4P0XMXOLiK+CRjXaYK56cOmgK
         ciuLf7Cxv7gK8pqQkKtCOJkdkb7WLSqgNMsIJgyEbNhZxdTToB68mQQbtt9W0i7wP9DJ
         FhCE7jTpwd5onU11coW9vjCmpUKRMmV+qA6JUC/ScGo6gWCw7aqRGTOnrbXCd2XW5iRs
         SsHw==
X-Gm-Message-State: AOAM533JPs4CpanR8Y22ODrJvNroEuM4kmnbF2k8YRi4BTmHjaC9xfss
	xXPXkTcif9h9/plYQLGSVDA=
X-Google-Smtp-Source: ABdhPJy9FMS8REW2mtVJBLxK/Eusely6MYf8zBy4dPK+0LWD28RMb76WayE95gFYfislhIl8ZAmVIw==
X-Received: by 2002:a2e:5345:: with SMTP id t5mr247471ljd.20.1630693092357;
        Fri, 03 Sep 2021 11:18:12 -0700 (PDT)
Received: from localhost.localdomain ([46.235.67.70])
        by smtp.gmail.com with ESMTPSA id d5sm15719lfv.14.2021.09.03.11.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 11:18:12 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	fmdefrancesco@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH 2/2] staging: r8188eu: remove useless memset
Date: Fri,  3 Sep 2021 21:18:07 +0300
Message-Id: <97a283ed5b97632033b0fc7c6aa0fbfc82f06da3.1630692375.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <ee783fbb71abb549505b84542223be7a7c905eea.1630692375.git.paskripkin@gmail.com>
References: <ee783fbb71abb549505b84542223be7a7c905eea.1630692375.git.paskripkin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

psetkeyparm is kzalloced buffer, there is no need in zeroing it one more
time, since kzalloc had already set memory to 0.

Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for RTL8188eu driver")
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index bd991d7ed809..37578638bb76 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -1690,8 +1690,6 @@ int rtw_set_key(struct adapter *adapter, struct security_priv *psecuritypriv, in
 		goto exit;
 	}
 
-	memset(psetkeyparm, 0, sizeof(struct setkey_parm));
-
 	if (psecuritypriv->dot11AuthAlgrthm == dot11AuthAlgrthm_8021X)
 		psetkeyparm->algorithm = (unsigned char)psecuritypriv->dot118021XGrpPrivacy;
 	else
-- 
2.33.0

