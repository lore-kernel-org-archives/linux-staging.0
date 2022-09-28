Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1F34A11
	for <linux-staging@lists.linux.dev>; Wed, 28 Sep 2022 17:23:27 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id r18so28538779eja.11
        for <linux-staging@lists.linux.dev>; Wed, 28 Sep 2022 10:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=j1KSyzaOPwalWf0pjnfJfXhH4MRcgiZbBjdZrYO0OQk=;
        b=Q7jDtpRe5K8YAjFqF4bQRDvmoFtZVKows8Ctd0gk4DNtFLOvt/NfdMOjgSAJwaERsG
         a36RbywejyXu0Q3iabHXMXwunSrULrBSrEzXZmRma0Y0/9dGbErngxzCm1BByz7XdP8e
         0hQK+k/TB9BZfB72vQ9QiicJuFkSJ6Bgbfx+xEwBwlFRCk/xpYorF3lE7yk12bu0Rbjf
         p/fu421y8+GmU8gKV5gFSRIylrfvm1jccDN6vO5GD8xCWO0l4UjaDhUgr6y/cl0xEheF
         2GY1oiDVF6QirQHO9DrEZ3B0xC3ygjyXS9jxk2gpizu76K00BPZKrLC01/nkvHtejppU
         sEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=j1KSyzaOPwalWf0pjnfJfXhH4MRcgiZbBjdZrYO0OQk=;
        b=nmA7VU6tYME2i999LAR7IgY27hEJMSKEOiA5l8IC8gd0pXwhi8f6nZpTChSaAkpNwv
         afOKn1nuitHShdMxOsaYUqfUKQt3mO6Y/S+nlJ4XgthjJTTgf0P4LCFnZSthjwMOq6SB
         8MNp/xaSF7TmmSPpEaVMTENmB4jK7K2E9gmaoFEpQ86PaLZ6aksF3Fl6cmwXEiEPyGaJ
         6G67vlKlc4vMBLJZPgdCDup5gzbn4PnOMqnNxeUT51UnEbqxTuXm0uAxv2vtfSnQx20Y
         CdVQpU+u1vGKcDeBDu4GOlI/L+Gjgid0dscrJEerorEIL43lNiFmJJy9QFpwjQ9D6fmP
         Cu1Q==
X-Gm-Message-State: ACrzQf11Lh2QDkMMxMP5SSu8KIlbFBQf5YM2T41iseFUU+sylkPbiZLx
	Im1+WUZHTJOT/7RvbXvCvt8=
X-Google-Smtp-Source: AMsMyM6eFw13xXqIKeSV3vLMuLiiD5CfNcuLpmycgL+iEvvH4STqJ+ZsiUXCl3mXQ7m+Mfvk1nnzeA==
X-Received: by 2002:a17:906:fe49:b0:73d:70c5:1a52 with SMTP id wz9-20020a170906fe4900b0073d70c51a52mr29369840ejb.469.1664385806018;
        Wed, 28 Sep 2022 10:23:26 -0700 (PDT)
Received: from localhost.localdomain (ip-217-105-46-158.ip.prioritytelecom.net. [217.105.46.158])
        by smtp.gmail.com with ESMTPSA id lb6-20020a170907784600b007306a4ecc9dsm2725063ejc.18.2022.09.28.10.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 10:23:25 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: forest@alittletooquiet.net,
	gregkh@linuxfoundation.org,
	dan.carpenter@oracle.com
Cc: namcaov@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [RFC PATCH v2 3/4] staging: vt6655: remove redundant assignment
Date: Wed, 28 Sep 2022 19:21:49 +0200
Message-Id: <4ccc5c55d136cb0749cf773e673fa903eebf473c.1664384503.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664384503.git.namcaov@gmail.com>
References: <cover.1664384503.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In function device_rx_srv, the assignment rd->rd0.owner = OWNED_BY_NIC
is redundant because this is already done in device_alloc_rx_buf() which
is called right above. Remove it.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/vt6655/device_main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 21d10d9fde47..c8cae6df7f51 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -839,7 +839,6 @@ static int device_rx_srv(struct vnt_private *priv, unsigned int idx)
 				"can not allocate rx buf\n");
 			break;
 		}
-		rd->rd0.owner = OWNED_BY_NIC;
 	}
 
 	priv->pCurrRD[idx] = rd;
-- 
2.25.1

