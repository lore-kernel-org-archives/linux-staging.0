Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435CAA29
	for <linux-staging@lists.linux.dev>; Sun, 20 Aug 2023 00:45:27 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6bd0c953fd9so1494236a34.3
        for <linux-staging@lists.linux.dev>; Sat, 19 Aug 2023 17:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1692492326; x=1693097126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkHoJUzAPxMfc68EFG3kieBAI+4mssO5bS+U9HMrCPk=;
        b=kswwQzhfuCff78t+mtiEViBxtJqIKAU9NdE+RgljpHCkdo6pb8vnUWyMbAfBYrsxW6
         tC/lBInZSV9OjwKvs0BtIP6VQkqfXSsXm4HqtuAr17yBzVEG2VhiCB7nyucA5JhTaeQZ
         dlvN4VZT/LXkrl3AJKazyjYzXnbsX5kWGo5ZOq/0Y8TM7dpO0IS8iZw5sdiOpL2nrkwU
         /ACXRKMNmMEJfyOv+ZyR/MhU2QioTf3FFS8i5fYtcfVNf3XU9KLYUs2TTiwNbFIsFyKb
         lLpxaWNyOyjoVpZ6d6cgxT/H8mbF+OwGgFrlj8rYg/3aUVIXJvXZ4E2txZEMeO0INSaK
         x0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692492326; x=1693097126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dkHoJUzAPxMfc68EFG3kieBAI+4mssO5bS+U9HMrCPk=;
        b=MDJVlBG8onV/UvMMWeaQe/y8WSurfKHY4zRwEbrliSXxJ1TwJyaMZPotLfwGZ8QAbl
         XxVlCPvSAnIrO4ka6RZsszeG83EQgPnQbNnyPy42Pd0cqk1vODjzrQyEKUM+/EMuYITj
         QCksOb8J2YZjMotDv4gdM2xBRuaZoZ/umFQQIgZePLnsre0cMRmjhoe94UAKP1/VfIdz
         vMQyS/1Aa/3vX6m0m7dgRyIyO2JID2KXcwqhi6XlxsXcKSBMEIK8qmcroranGc2Bxn+W
         EgfwHLdy0AhmwE5aYPujmR3dpoNxgeb+9zN9cV9+79u91Zm0vNIZq28cq+TYW5IZ5a00
         xF0w==
X-Gm-Message-State: AOJu0YzV8JVR7riYSXMA5VYiegp0f6AqFCBHYtRH3x2t9DzXPEsdTzzP
	fa6doNZITJPRWEih/M8J0JtghA==
X-Google-Smtp-Source: AGHT+IHImiKD+aQRv8PXSU3VVg5OLr83ViuWGdc8FfjH9gyrDraPvn3XLBCqqEXvAaAdeHgBNkQeLQ==
X-Received: by 2002:a05:6870:c094:b0:1bf:11f1:4729 with SMTP id c20-20020a056870c09400b001bf11f14729mr3857629oad.56.1692492326276;
        Sat, 19 Aug 2023 17:45:26 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 25-20020a17090a1a1900b00268b439a0cbsm4004884pjk.23.2023.08.19.17.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Aug 2023 17:45:26 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 09/16] Staging: rtl8192e: Rename variable tmp in function GetTs()
Date: Sat, 19 Aug 2023 17:47:37 -0700
Message-ID: <20230820004744.278022-10-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230820004744.278022-1-tdavies@darkphysics.net>
References: <20230820004744.278022-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable tmp in function GetTs() to ts in order
to make the name consistent with other references of type
struct rx_ts_record.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index ac97b6d627da..131a5d7b4599 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -325,11 +325,11 @@ bool GetTs(struct rtllib_device *ieee, struct ts_common_info **ppTS,
 				TsCommonInfo);
 			ResetTxTsEntry(tmp);
 		} else {
-			struct rx_ts_record *tmp =
+			struct rx_ts_record *ts =
 				 container_of(*ppTS,
 				 struct rx_ts_record,
 				 ts_common_info);
-			ResetRxTsEntry(tmp);
+			ResetRxTsEntry(ts);
 		}
 
 		netdev_dbg(ieee->dev,
-- 
2.41.0

