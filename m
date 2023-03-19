Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58F41C39;
	Sun, 19 Mar 2023 20:11:52 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id t5so2510746edd.7;
        Sun, 19 Mar 2023 13:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679256711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=svh5CkV4qACNpUCwXOfTX98jsnzrQxv/pZHbsNshCOc=;
        b=EVcbTdW5IYaNkMNpQnzNmrShhEP0qdg43W5Tt9P6S09645P8qIqkcaKgWiEQPN+xqw
         L4O7/xbXPEliBNoMtmsgRIejlV4OfW/sIXo3huqciB5YLIAQFuaUUFO3iTGr20U8GDMF
         VcSCiGEqvWIgD0ZYvI2MKzC6OW1vvORVcDbKZ7q1flHBZd1iZ3uA1TiXT6DmCzTlUpMA
         Jh3xePPHpiJCycwth3CMn9kt5xeS1Gtfn4rrceQ4FKcqu4e8bJSdZaUcTWNy9NZ570fE
         jjzD50GyQOVlvraQ32pDnAVADU+IXKM6sDQLIXuXh6XX8BxrXsQXe3Zh0LuP08weiN9W
         zl+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679256711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=svh5CkV4qACNpUCwXOfTX98jsnzrQxv/pZHbsNshCOc=;
        b=NGmK+eo2sl0wUCM63kAYJg2CPYgdRDYgGjgI8/RkLFBqwNgrzzgbmsjyLKf106JVtX
         T71IwfpRxy3wcCh+DOSvgmtjdEaXj81HCDYGkQ4PaMEZx9MRo8gNvq62eoyiBrBOSKth
         B+X5hRRU6dMTeBo6ZCuTbcgXhN4Cp471bRBYX+aEpTCqz4bjbPlkseQjAEHZw0O+UPHo
         kATRwrKU9EIKSIXcRj0c6V8EyUeT7SEJscB83ODCPPs4zdf9ZouWD7EmFivo0SlksCGv
         oZpjm1UNHJWdr2ku0m2/a1yXNNrYtIinfs3uyycqf79bA4BnNp0UQkFSWLParBB2aKbu
         IvFA==
X-Gm-Message-State: AO0yUKUMptSFuYk2AUmEwudivbOfKHSiJ1wKdxHHgmok7U3HD/HiwGDH
	8pcllvyMdrCvFdbOyZOmBhc=
X-Google-Smtp-Source: AK7set/whmvn0pqWy5DPK6yzol3eRDFiLnkL9GeN4rBtwkl+KdiB53Gky2xHCyG5dfIotQCTtD95iQ==
X-Received: by 2002:aa7:c2d7:0:b0:4bb:e80c:5667 with SMTP id m23-20020aa7c2d7000000b004bbe80c5667mr10227024edp.10.1679256710991;
        Sun, 19 Mar 2023 13:11:50 -0700 (PDT)
Received: from alaa-emad.. ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id i23-20020a508717000000b004af6c5f1805sm3898695edb.52.2023.03.19.13.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 13:11:50 -0700 (PDT)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: gregkh@linuxfoundation.org
Cc: outreachy@lists.linux.dev,
	namcaov@gmail.com,
	hdegoede@redhat.com,
	straube.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	eng.mennamahmoud.mm@gmail.com,
	Julia Lawall <julia.lawall@inria.fr>
Subject: [PATCH v2] staging: rtl8723bs: use inline functions for dvobj_to_dev
Date: Sun, 19 Mar 2023 22:11:34 +0200
Message-Id: <20230319201134.253839-1-eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert `dvobj_to_dev` macro into a static inline function.
it is not great to have macro that use `container_of` macro,
because from looking at the definition one cannot tell
what type it applies to.

One can get the same benefit from an efficiency point of view
by making an inline function.

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
---
change in v2:
	edit commit message.
---
 drivers/staging/rtl8723bs/include/drv_types.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 82159e1c7f9b..ea6bb44c5e1d 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -305,7 +305,11 @@ struct sdio_data intf_data;
 };
 
 #define dvobj_to_pwrctl(dvobj) (&(dvobj->pwrctl_priv))
-#define pwrctl_to_dvobj(pwrctl) container_of(pwrctl, struct dvobj_priv, pwrctl_priv)
+
+static inline struct dvobj_priv *pwrctl_to_dvobj(struct pwrctrl_priv *pwrctl_priv)
+{
+	return container_of(pwrctl_priv, struct dvobj_priv, pwrctl_priv);
+}
 
 static inline struct device *dvobj_to_dev(struct dvobj_priv *dvobj)
 {
-- 
2.34.1

