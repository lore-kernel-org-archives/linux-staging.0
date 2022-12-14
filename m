Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33E62F47
	for <linux-staging@lists.linux.dev>; Wed, 14 Dec 2022 20:52:25 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id q6so12456516lfm.10
        for <linux-staging@lists.linux.dev>; Wed, 14 Dec 2022 12:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zFLdAfKk9Qm17jrt7feddSvQWDFpf/HIJxK3WcQxEl8=;
        b=KTR///vKb6FkMxCfJhmBVJsixjYCRwNf3SNNxkY8Kcyk1KH6qKMIz1yymZbQztUH7A
         /fOUPhDfjc1In1qZYxs8oaFdbkiae/9zT+LqK0bcnb1WHfFYPtyYJGeTt3j6GDK3kv2D
         YicD4G7d9btkexKcOYUsSgEm6FIm/pso6E8YoQ3a0OyTk5S74l6AMPeCO6hFCZgcOXpN
         zA+lj9Tc0iPDSMzzBPsEmM3pSmzNoCEW2MpNIq23sF3tSsj5oakULwThMcR42YqZaCcy
         aR3tmPxvjMji1QYZsENBSNjRjyLSiteyMW+cV9GwXjvaQr45VdgdsRemcBbYxI8m3uKA
         GuyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zFLdAfKk9Qm17jrt7feddSvQWDFpf/HIJxK3WcQxEl8=;
        b=vG2GHEtyVcZRJJBv4nfsTL+vC9CkfhrUBfi/2g87R8qx3yKoVCT9yE6X9ABlBK86Ux
         e8r7vguva58m/bF9AZsFI+CIcte/587N/T4JPWOJcmUpeAYmkvdMeHlt1hgArz4OcuuI
         pwiFYbe52MmjT6gdcXJiz+TCQrSMV1onzc/xBG4jC1whteIQ//nzfbn0KILD9qiOWq4D
         bjwsPS5llcL0vAOOAj8HPgz9xL8YfPS0P33qm2BOb/WC0P/5T4Fmgr6rUVydLjJaTS3B
         GnFaZA7HwZTyTD79xUg8DUJyD1D6lHTEStaUy9M45EM4XLr75UtQXwgu8uSmDzlm/rR/
         +a/A==
X-Gm-Message-State: ANoB5pkPze7Kx7Ej4gGh7XYhPoKD82faO0B2z0i6KBC6QdFUCzcclCY/
	HW0NRmv2Gz0RyLDBDrh3nGo=
X-Google-Smtp-Source: AA0mqf6g4WD45xmyq30OdOjmCP1Uum4pVhBkE7h363BDFRriY9G1l8cO/jYy8Ir/u/cgIdwktccJlQ==
X-Received: by 2002:a05:6512:3499:b0:4b5:4079:c824 with SMTP id v25-20020a056512349900b004b54079c824mr5844679lfr.46.1671051143634;
        Wed, 14 Dec 2022 12:52:23 -0800 (PST)
Received: from DESKTOP-5EKDQDN.localdomain (78-63-10-115.static.zebra.lt. [78.63.10.115])
        by smtp.gmail.com with ESMTPSA id p17-20020ac246d1000000b0049e9122bd0esm930105lfo.114.2022.12.14.12.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 12:52:23 -0800 (PST)
From: =?UTF-8?q?Aldas=20Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>
To: manishc@marvell.com,
	GR-Linux-NIC-Dev@marvell.com,
	gregkh@linuxfoundation.org,
	netdev@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	=?UTF-8?q?Aldas=20Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>
Subject: [PATCH] staging: qlge: remove unnecessary spaces before function pointer args
Date: Wed, 14 Dec 2022 22:51:47 +0200
Message-Id: <20221214205147.2172-1-aldas60@gmail.com>
X-Mailer: git-send-email 2.37.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove unnecessary spaces before the function pointer arguments as
warned by checkpatch.

Signed-off-by: Aldas Taraškevičius <aldas60@gmail.com>
---
 drivers/staging/qlge/qlge.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/qlge/qlge.h b/drivers/staging/qlge/qlge.h
index fc8c5ca89..05e4f4744 100644
--- a/drivers/staging/qlge/qlge.h
+++ b/drivers/staging/qlge/qlge.h
@@ -2057,8 +2057,8 @@ enum {
 };
 
 struct nic_operations {
-	int (*get_flash) (struct ql_adapter *);
-	int (*port_initialize) (struct ql_adapter *);
+	int (*get_flash)(struct ql_adapter *);
+	int (*port_initialize)(struct ql_adapter *);
 };
 
 /*
-- 
2.37.2

