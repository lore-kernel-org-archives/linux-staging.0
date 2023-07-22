Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84768EBC
	for <linux-staging@lists.linux.dev>; Sat, 22 Jul 2023 21:59:30 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3461053677eso7673785ab.0
        for <linux-staging@lists.linux.dev>; Sat, 22 Jul 2023 14:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1690063169; x=1690667969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4tY2GuOM7XF3DCI8b76kqr55OfGzK0tioQlStQn52s=;
        b=ApX7fxDyQFSjWFbkswQ6ONJQ/2B6R3/UfF2kiS4kQSEjPBgoURIyeVVhk0ZNjz3O/q
         kkic6sftOpZF8YydDQQK4oxPm0p7zYliaN64hSqHMh6py6xZhLmt9tXChoRT9PP/O9jU
         a74cxDd74UqISD/VCzSerGY9P/peTnIUpnC1KstK0Mz7v8WQWY+iTQr5+nTrxERcH6DY
         qXDEPSROzETCGQJSpP1eCFHkc2H6Zh+oz4cjPEYfO6bKyC3anzcN5wWfqQGomHALCbZI
         hsHyG8Tzu3i+siD07SeSPSlrrtkBxofZBbDOE1AonoUUZwE/NJwTOXXiJR3T5Ow80AEF
         NN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690063169; x=1690667969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g4tY2GuOM7XF3DCI8b76kqr55OfGzK0tioQlStQn52s=;
        b=YiGXcLwoBIgrVxj0Pjpg4v/Zcj8rd0LcWLNbxXdmpClML6xP9nIdMI8mDwC295DnBk
         jmRchs1+5K9xLGPH1gAR2SZEzzU0zzGUR1Lo1YqxQY4Nu+jMEA4pFE/o3xowzhFPFwIp
         IPiznVNR8q5/XWHcrPyPk7sE7hyn9qr1v4mM6u5fTaIH8SFVcUwW0raOCAFDHhqJ+1M+
         0fcigGKpHQ/D1W4p7scNVTKi8nnOiEOP7KClmGYNxf/EnA9wnuDvNHvJN9vWWx14ybOE
         ECjkhrYiKRRDBf4ABbuR/zViZHFJOi3DQ9kTK5sOPaC+03LX7OOazDXV/BcLpa+IL9ab
         /0QA==
X-Gm-Message-State: ABy/qLZIdI2hkRck4y6ZqXd2xYmMHBR833i4BoAvYPDdzZknt6VuFmsr
	/7xmoPSzu2eq6vKOUTGWV/s=
X-Google-Smtp-Source: APBJJlGnr1TRBYjUKRbs+sLex/dT9A4Zmt3haniB2O7BLMdIRO2kLi4QWtG8xWGe31MexKYl4QdSSg==
X-Received: by 2002:a05:6e02:1ba5:b0:345:fe2d:56f with SMTP id n5-20020a056e021ba500b00345fe2d056fmr2181422ili.14.1690063169593;
        Sat, 22 Jul 2023 14:59:29 -0700 (PDT)
Received: from localhost.localdomain ([161.97.244.155])
        by smtp.gmail.com with ESMTPSA id f16-20020a02cad0000000b0042b2d9fbbecsm1874673jap.119.2023.07.22.14.59.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Jul 2023 14:59:29 -0700 (PDT)
From: Franziska Naepelt <franziska.naepelt@googlemail.com>
To: franziska.naepelt@googlemail.com
Cc: gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 9/9] staging: rtl8723bs: ioctl_linux: Fix comparison to false
Date: Sat, 22 Jul 2023 23:59:27 +0200
Message-Id: <20230722215927.4443-1-franziska.naepelt@googlemail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230722215330.4114-1-franziska.naepelt@googlemail.com>
References: <20230722215330.4114-1-franziska.naepelt@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following checkpatch issue:
- CHECK: Using comparison to false is error prone

Signed-off-by: Franziska Naepelt <franziska.naepelt@googlemail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index 2896d64e13be..54a2998e837d 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -832,7 +832,7 @@ static int rtw_add_sta(struct net_device *dev, struct ieee_param *param)
 			psta->htpriv.ht_option = false;
 		}
 
-		if (pmlmepriv->htpriv.ht_option == false)
+		if (!pmlmepriv->htpriv.ht_option)
 			psta->htpriv.ht_option = false;
 
 		update_sta_info_apmode(padapter, psta);
-- 
2.39.2 (Apple Git-143)

