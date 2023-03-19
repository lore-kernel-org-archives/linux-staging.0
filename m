Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17F81846;
	Sun, 19 Mar 2023 13:11:30 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id eh3so37051462edb.11;
        Sun, 19 Mar 2023 06:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679231489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NDHj4DvxjjAkmG31dhlk4CsUuKafohdFgFwjCU3khL8=;
        b=SpupAaCobj8+gF0IB38Y8jJXFWQpYJHi6h8rsvEHgRv9jc0yQCSGes9EzeHfkZmGLH
         lSmiO2eAe43u9x+2WkGIsgmYP+F/tXpiZ5eJxB+Gq01YaoqRvGRpAtyObMTvSGvFwQuI
         dOaCgP7pyz16CYK8kFvXtkUbnahZyk2Iwzj2rRyE6WrWrE+ug92Ez0hCL1WAB1/QmDqP
         skdyJ15G+eXiDuyXHFP1/9Xt0Iywk11PmNlw26JPOz2SNLrRm708c3cXedF9/zy7GfVN
         812EaDXXOFW3mfq2tRr83Ld1SMWPk0XWzl/CfI/oPUpGesUSFMKNN5ABCGYrJi9hCfP8
         TbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679231489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NDHj4DvxjjAkmG31dhlk4CsUuKafohdFgFwjCU3khL8=;
        b=iJmXHeh5PQR0+Jsuc7ca1bQSFT7Sccc7b0fkp69nU0kY6Noqoyoi0SPH9D2Xx0eKWf
         ad8Vp5cD6S4d4KneFAwqkt/LYGtad0WzYLw6rIxLbpckHfUhdXUmjp+zBlrBfu1QgChi
         eQ67o92Fu1KcTqWe+Ef+Ux7GSX+MpbyIvZVaqzjB/J+XJzOQN3/aK2hFWEG4tR0k3nKA
         EzjQ8lj8FZHQ1M0ydHb/JHFZIVsKN2BMP1ZY8vir9RKSwuRjJoYND9/8+9O1iUGgyetK
         qFNj90aBTNcHGN5JI748NPIrcl8ylBA/J6dOyqWR8uZUeEVwMxyo7LSx/JIW5WIFUrc9
         w+pg==
X-Gm-Message-State: AO0yUKUug8PbO30GPoqKpLD3v1S1TaXwdwnl53La7b4R/o6hTBpOkGv6
	6RymYMikY9OV7PSoa+qCfFk=
X-Google-Smtp-Source: AK7set/nr96keMgLA/H/r8hXyMIVmxQUuqdUMsdY+x/AB+4XhEY9KeBsPx3GVRDwdUluz9L/4hBoAw==
X-Received: by 2002:aa7:d782:0:b0:4fd:1cf1:b7b0 with SMTP id s2-20020aa7d782000000b004fd1cf1b7b0mr8581529edq.7.1679231488796;
        Sun, 19 Mar 2023 06:11:28 -0700 (PDT)
Received: from alaa-emad.. ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id i23-20020a508717000000b004af6c5f1805sm3497671edb.52.2023.03.19.06.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 06:11:28 -0700 (PDT)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: gregkh@linuxfoundation.org
Cc: outreachy@lists.linux.dev,
	namcaov@gmail.com,
	straube.linux@gmail.com,
	hdegoede@redhat.com,
	julia.lawall@inria.fr,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	eng.mennamahmoud.mm@gmail.com
Subject: [PATCH] staging: rtl8723bs: include: use inline functions for dvobj_to_dev
Date: Sun, 19 Mar 2023 15:10:30 +0200
Message-Id: <20230319131030.151170-3-eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert `dvobj_to_dev` macro into static inline function,
because it is not great to have macro that use `container_of` macro,
because from looking at the definition one cannot tell what type it applies to.

One can get the same benefit from an efficiency point of view by making an
inline function (concretely, typically a static inline function, because
the definition only needs to be visible in the current file, or in the
case of a header file in the file that includes the header file).

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
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

