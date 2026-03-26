Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D46734AAE3
	for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 09:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517780; cv=none; b=kUB3KwGtOQlnLm77OdZGEdAUiwUVkLOVyNwMgz/ayVo39GXInNiWGvG/X5oZWwrJFwLQBQP4CmQvXjbprd6aWlutHX7uwSqDszL6NNiFQQGlhV8wAnWn+pWZgI/rlFyTDhdXEMWxQC/+9YQXp7czeINh/67gE/Y2Jf7jaFQkzD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517780; c=relaxed/simple;
	bh=yMyzaFoknNuQ6pVvN+fu/ld64KkXbgcWoC8dH9PpS/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jWBKboPi+yT0lrG7LxrA2kf+Lu21GwW6CE+CuhiXdFNhUlbg8MTutMy22IgUs1VkuoVlY9eG6Wuo4hvwWW5xeYUDxgxgOKkSpUJtSRAm95+d9nVN+P4fA7ahjHivtrg9QIjMvBvlH1gac/qNNDmMc2ca3IzxEg1a9PxH5GdfmxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bpRQxG/C; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpRQxG/C"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso7558945e9.2
        for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 02:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774517775; x=1775122575; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CAGNwD5mmaMNu8vFEx34UOd1uzUQMLsBdyRqg3s3DI=;
        b=bpRQxG/C/fw9zzURNBIixKSIGP8YwNHL3IVpO7a9o5KGDHM80x1VZe2cn4HqlY7G71
         Uo2BRh/hF8pXTwf9a7AcnZc2cDryXzeSQFF+4ZSsiI/aQCdPjBuMhZEWbj6VvXrreQdu
         AkObsHg3YdwTGZ51bgu2M98h1kSQluqnXC6cXZp4alIPao4toOxXurGYcONCSqtfGW+T
         oKzODyppiiZPWfYEJuVseek5GFMobPNxqBtVzB1P93wkHBQPhE5asCyRT+5iUOxhZ8eL
         E+YMS5sC2u7f17lDQQsnZAkuOsepMG5sxzOx0uZafhDKj+p0rscuT430lhUDxRrPoCLE
         Q0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774517775; x=1775122575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/CAGNwD5mmaMNu8vFEx34UOd1uzUQMLsBdyRqg3s3DI=;
        b=XjZdcANhRBU1nL6nxKF2ZFDeCZACJUbMUMtIfhmrsVgr17IuZlT0QCENH3Wo+DSdbo
         haf0iZBU5fK7qO+8XKWJ5tQbjrJqZGwzn1FEw4FrQQqloAMhbPyNms+1+1JpUXQUZ3Fl
         RGLvRtHce6gveh5HyupWHdQTvysEeGbRXnwXj6MDS3RGnpcre7SYnPovdRAUEc2vAImH
         Mj71xbctooakPr0W/zV8GNBnJF8/4r72qRC7RJ0jqnizpHzccgGGvVi0cNK3jKx3QsA+
         pTOgkwunODztw0xIpze0p6gMwrMWMOrquypjIVdy2HU40JweB3P3PfhcLfb9mIBJf/oL
         4nkQ==
X-Gm-Message-State: AOJu0YwqVi45B+D8KTQFx6akcnr6vTM9uHk6M+y3J+TNeE9d8I486uM8
	zqiVIdhX21TmWEgFLv8I70gGMHv7hOVt7tJJx2SKx3KBOKlL/WVHBIdZ
X-Gm-Gg: ATEYQzyRvaD1jze7EXLeV6tlBRPoUX0uw7BkC1AXjCj6CIH3d2yvjc3sgjWlMCsDtzp
	qkbW9r7sVxhZ0fhWCIzWTcVpCNjYW84G93iMa0FLpRVQOL9jJKg8IVFQods8rvOyffPtjey0fJv
	bQ2Rygnc/NipWFxIBsQPgG/+TF8ksHzgW4V3XAq+HgBSWiTqADXAS9MjwMou2D8Vm9n1Rxdj0AE
	2QrdZyW/IHz6g3TpWLQjXaLpbaUQQi+UovLm2Z46kUJHwsY3MHZPtZnblBVFdlScW24Iehh/G2N
	agCBH+QOe+QRd/PgkQQoU/7ztWZbcoIQwxrIrINVk4MhoNDsfZJGY6rUOZFUFkAhSLPpiVn8WVN
	OzyZmbqrRID4JcRzcpEdUNaxzAuvPEhWXfFD1CaEtf1RK0cCcXnzCF4OqDi6mJFj5pjlCxMygoJ
	Bz6N7lCQjsgC/v0CmoeFCNFWA=
X-Received: by 2002:a05:600c:4685:b0:483:6a8d:b2f9 with SMTP id 5b1f17b1804b1-48715fc3994mr97475005e9.5.1774517775260;
        Thu, 26 Mar 2026 02:36:15 -0700 (PDT)
Received: from potato ([31.176.167.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d236a9sm41224175e9.11.2026.03.26.02.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:36:14 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH v4 1/2] staging: rtl8723bs: use direct returns in sdio_dvobj_init()
Date: Thu, 26 Mar 2026 10:36:06 +0100
Message-ID: <20260326093607.13011-2-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260326093607.13011-1-omer.e.idrissi@gmail.com>
References: <20260326093607.13011-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sdio_dvobj_init() use direct returns

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d664e254912c..358eac0837cf 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -155,13 +155,12 @@ static void sdio_deinit(struct dvobj_priv *dvobj)
 }
 static struct dvobj_priv *sdio_dvobj_init(struct sdio_func *func)
 {
-	int status = _FAIL;
 	struct dvobj_priv *dvobj = NULL;
 	struct sdio_data *psdio;
 
 	dvobj = devobj_init();
 	if (!dvobj)
-		goto exit;
+		return NULL;
 
 	sdio_set_drvdata(func, dvobj);
 
@@ -172,18 +171,14 @@ static struct dvobj_priv *sdio_dvobj_init(struct sdio_func *func)
 		goto free_dvobj;
 
 	rtw_reset_continual_io_error(dvobj);
-	status = _SUCCESS;
 
-free_dvobj:
-	if (status != _SUCCESS && dvobj) {
-		sdio_set_drvdata(func, NULL);
+	return dvobj;
 
-		devobj_deinit(dvobj);
+free_dvobj:
+	sdio_set_drvdata(func, NULL);
+	devobj_deinit(dvobj);
 
-		dvobj = NULL;
-	}
-exit:
-	return dvobj;
+	return NULL;
 }
 
 static void sdio_dvobj_deinit(struct sdio_func *func)
-- 
2.51.0

