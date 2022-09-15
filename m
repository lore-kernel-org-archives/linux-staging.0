Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B924C85
	for <linux-staging@lists.linux.dev>; Thu, 15 Sep 2022 20:29:59 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id e17so28690892edc.5
        for <linux-staging@lists.linux.dev>; Thu, 15 Sep 2022 13:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=OipeXrKVU1BCY0WjlS+Kuojt9dLqNbUbahDVdYj30x8=;
        b=mkQTbaiVCfxFHMGkSMiDq2B0j4wI7cUA65gFgr12puDxoaN1ZTeoAReUDGZxV3OA2B
         wWG5GBIXcY6Ttqkbc1iAXFWCe+cXNzdIXshyYk8OoR5lQgPFf4dv0JgbXjd745cRWP14
         gneqlmF4Msg58rqdMeOpMwiLdm1dHZJh62MPz5/4M89qZ4wJpb6PY8a0SpWIXBYjDkVY
         VdQciox2/UEeeUNiHuB1rPf6/enpOKq562MUva6huD8LZHV1dBuAJihQUR8UqmTcaU/p
         sAJ0/ri8wddyl/NJ/Ow7GSMHz2EZ6HYkIEoFny0++WFY0g6oMP6KTmF6q1TGuphJKAv8
         U+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=OipeXrKVU1BCY0WjlS+Kuojt9dLqNbUbahDVdYj30x8=;
        b=WQ9HsofDl8RWlmteldTeBB0T2E89qD4HOvv/tNTN0wYdoBBdL9ZzWLYl9JjPzBM3tn
         8Ztp7stKmlR9FQ49GST+vH/K2LcJwrnFvoOHAxjONjaA4Rn47qvstRmTiE6m7k4A7fzG
         tkq4YK0PdtxiiktUf/TJKW0rGb6r4/mqNkaeUxMLd1ImbuC1HPRfwxi20y8gRRDJi5ca
         jADD/ZdzrXWpezUEH0CYt2wY62j9m2NnpqeUKQChPpp2NhZJR+LSwy3BxNwR+yTYryH0
         x2yJ89Qy4z5MkdHWG9rPkOztqzwK70mif/c7rbOIQD/uRw2zjDglrZUFIYrBSLaXeTtQ
         o2Zg==
X-Gm-Message-State: ACrzQf2hqNXRYquYGbX7ispxjO1/q0Xpc4r7+eGcK7+sIocOqEa7hH4x
	1TmU2kIYoPn75UmOd8TKqV0=
X-Google-Smtp-Source: AMsMyM4jFu/KytAdYQKVUma6k3L7U3Vgc2mj0hUp08Ns2veNAewKttBuNZLs9d1DH1nAwCBbGSxb9g==
X-Received: by 2002:a05:6402:50d1:b0:452:899e:77c with SMTP id h17-20020a05640250d100b00452899e077cmr1348375edb.0.1663273797603;
        Thu, 15 Sep 2022 13:29:57 -0700 (PDT)
Received: from localhost.localdomain (ip-217-105-46-43.ip.prioritytelecom.net. [217.105.46.43])
        by smtp.gmail.com with ESMTPSA id ci25-20020a170906c35900b0072b3406e9c2sm9607295ejb.95.2022.09.15.13.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 13:29:57 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: forest@alittletooquiet.net,
	gregkh@linuxfoundation.org
Cc: namcaov@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [RFC PATCH 2/5] staging: vt6655: change vnt_receive_frame return type to void
Date: Thu, 15 Sep 2022 22:29:33 +0200
Message-Id: <f727ea04703858920f6da694676ec323469e7b97.1663273218.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663273218.git.namcaov@gmail.com>
References: <cover.1663273218.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function vnt_receive_frame's returned value is not used anywhere.
Furthermore, it always return true. Change its return type to void.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/vt6655/dpc.c | 8 ++++----
 drivers/staging/vt6655/dpc.h | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vt6655/dpc.c b/drivers/staging/vt6655/dpc.c
index c6ed3537f439..9f2128f5d3c3 100644
--- a/drivers/staging/vt6655/dpc.c
+++ b/drivers/staging/vt6655/dpc.c
@@ -115,7 +115,7 @@ static bool vnt_rx_data(struct vnt_private *priv, struct sk_buff *skb,
 	return true;
 }
 
-bool vnt_receive_frame(struct vnt_private *priv, struct vnt_rx_desc *curr_rd)
+void vnt_receive_frame(struct vnt_private *priv, struct vnt_rx_desc *curr_rd)
 {
 	struct vnt_rd_info *rd_info = curr_rd->rd_info;
 	struct sk_buff *skb;
@@ -133,13 +133,13 @@ bool vnt_receive_frame(struct vnt_private *priv, struct vnt_rx_desc *curr_rd)
 		/* Frame Size error drop this packet.*/
 		dev_dbg(&priv->pcid->dev, "Wrong frame size %d\n", frame_size);
 		dev_kfree_skb_irq(skb);
-		return true;
+		return;
 	}
 
 	if (vnt_rx_data(priv, skb, frame_size))
-		return true;
+		return;
 
 	dev_kfree_skb_irq(skb);
 
-	return true;
+	return;
 }
diff --git a/drivers/staging/vt6655/dpc.h b/drivers/staging/vt6655/dpc.h
index 40364c0ab7f6..f67c1ef23171 100644
--- a/drivers/staging/vt6655/dpc.h
+++ b/drivers/staging/vt6655/dpc.h
@@ -16,6 +16,6 @@
 
 #include "device.h"
 
-bool vnt_receive_frame(struct vnt_private *priv, struct vnt_rx_desc *curr_rd);
+void vnt_receive_frame(struct vnt_private *priv, struct vnt_rx_desc *curr_rd);
 
 #endif /* __RXTX_H__ */
-- 
2.25.1

