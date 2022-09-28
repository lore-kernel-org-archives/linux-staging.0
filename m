Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B72B4A11
	for <linux-staging@lists.linux.dev>; Wed, 28 Sep 2022 17:23:26 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id z97so18137194ede.8
        for <linux-staging@lists.linux.dev>; Wed, 28 Sep 2022 10:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=bAT4lI1cS6DeEw/8Q0cGUzgW7gwK5qXIMg6NrWzIWKo=;
        b=fEIfyz2lCaTo35Ue4OkF0Ce0XXDTMNKrW9uOD2H5Cn97v72XOAopWJnlWZxkrScF7d
         D1gfVWLXpX6mprk0QT7U0Y9ZfP2P5byBEQ32LQRkZYf/qDtSm4Rhhv50+gR8f68Yloue
         P6OJd3Ta24r6AREVrl6pKVKk8CfOvABnFByko0wbNtZgIg9EPm/Mr0pjBGWuL9QWoQfD
         r8sKcyhekFWOmI7Bag7qyThRdjrTXB7UhB97qCMr33ZoMFkw7rvZs3DxEGeWu9urmlJa
         JFMLNtGxIfqACdW/SXFNGNc5O6uVRS2m8mQJ/mePChfQ48grsZVQUTckhOhIxV9bHmxx
         UsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=bAT4lI1cS6DeEw/8Q0cGUzgW7gwK5qXIMg6NrWzIWKo=;
        b=kb67Bw0kyecc8w0/bcg8EKPeH42HlZChORt4RP/f5x9y0ur/tZU/ch6aerPadTqlLL
         +WCuBSovU5pBq5mMfmeD6184iwPGCCbuKgb/Khtf+zoAZfQPZ556iWg+9GMnz6FiyRbO
         xYB15aka2YH816nARrOb5XIvE7SbrSNHvN96b28P/RqypcgzTnUDfuKfgANwgF7CIRVD
         u2hnxLXG2MxpNz6hOc+5BOahh5uD/QMdUGDYU4qKYsl10lESFzQfezt6KAMp+dmQIzvg
         gz1uDgSVHGYbyZNNwYdruVQQS8/ZepQd0kRQFkrDUIdr0mQxFw5jLFBAuTe5EHmIYTze
         QvHg==
X-Gm-Message-State: ACrzQf1hG4Kn7lTGVrTYb6jxcUiPqMSMJaVIPUlS9qgTgtHg18I37rzJ
	fU85mmjLPtPTTL8yz8PqUI0=
X-Google-Smtp-Source: AMsMyM7VZsEXH6/txaWqMLlbcIlXV7P46ZdA8KCN1Hlp0FtfoZLURwXphOhPimW+QJ1dy03zkv77nQ==
X-Received: by 2002:a05:6402:2694:b0:450:d537:f6d6 with SMTP id w20-20020a056402269400b00450d537f6d6mr35433802edd.344.1664385804315;
        Wed, 28 Sep 2022 10:23:24 -0700 (PDT)
Received: from localhost.localdomain (ip-217-105-46-158.ip.prioritytelecom.net. [217.105.46.158])
        by smtp.gmail.com with ESMTPSA id lb6-20020a170907784600b007306a4ecc9dsm2725063ejc.18.2022.09.28.10.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 10:23:24 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: forest@alittletooquiet.net,
	gregkh@linuxfoundation.org,
	dan.carpenter@oracle.com
Cc: namcaov@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [RFC PATCH v2 1/4] staging: vt6655: remove redundant if condition
Date: Wed, 28 Sep 2022 19:21:47 +0200
Message-Id: <6a4028a10308d3abcd31421a28e760fc3ca61a72.1664384503.git.namcaov@gmail.com>
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

The function vnt_receive_frame always returns true, so checking its
return value is redundant. Remove it.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/vt6655/device_main.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 56c3cf3ba53d..21d10d9fde47 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -832,12 +832,12 @@ static int device_rx_srv(struct vnt_private *priv, unsigned int idx)
 		if (!rd->rd_info->skb)
 			break;
 
-		if (vnt_receive_frame(priv, rd)) {
-			if (!device_alloc_rx_buf(priv, rd)) {
-				dev_err(&priv->pcid->dev,
-					"can not allocate rx buf\n");
-				break;
-			}
+		vnt_receive_frame(priv, rd);
+
+		if (!device_alloc_rx_buf(priv, rd)) {
+			dev_err(&priv->pcid->dev,
+				"can not allocate rx buf\n");
+			break;
 		}
 		rd->rd0.owner = OWNED_BY_NIC;
 	}
-- 
2.25.1

