Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F28173
	for <linux-staging@lists.linux.dev>; Tue, 28 Dec 2021 13:58:10 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id x4so13291700ljc.6
        for <linux-staging@lists.linux.dev>; Tue, 28 Dec 2021 05:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PEaUMa49hvK0BMP/2XHWA5/4XQXDgSJ54VhaMdz00Vs=;
        b=gDXkrzGgbzrxm/CwtZzrBKmsbV+8XVm33NO/AFiSku20IumKPBy6kxSOSlAsunWsFC
         Zv+TGOdpPh1gcx8kMPq3DTJJXM4NYPmHY+ognpOrjQ8y01gQjR9YaFJ92aMe+DOw8hb0
         dR61jB5YfdMAyxmKbh/29tRYOwv9J6RGdmwf/UmpLeAvpZ8SN6S5MsVqgG5r9O0hfiB9
         TiwegKdtqOltrrp6Z+jzx81PLH3PdX3cQQrryoMRxRpSQMZioNxNyCU/Hg+e1yde8ytp
         Ghpz2y0i2YseUt4gHbPTgH5t9VrCt3HwuWvCtEJNws9gqXRvO/ViJ3p+z/79QCieP8fD
         aLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PEaUMa49hvK0BMP/2XHWA5/4XQXDgSJ54VhaMdz00Vs=;
        b=N8YXn2JjYMep+PN2TOgWvNu2Q6HyaNzrN0LcGkIOTJBr/Lu2FT9lZrWW3SkwwYi+ff
         AK7ChJuWR9zng9b/EQr3HHiPAxGZpIdCjV93ZZ3QqXh5l4OgseivCDyOo1u/uW0TtcfM
         IxBeOGSRZ4329PIv2GSGOsKeFehvfoLcGmNuO+Ew38PBRpqoHxKGbJoKZ1qU04uE2TK2
         N6syU6BojDInsK0IyO2hJCmWigQc4DglEgFpB6CgV+1FkaM8NsWa6CABaXub4CZ39cfM
         bIcOaiAoR3r/JjdLbRt/yhy4edoGJ/s90kOrjPXCLY/9Es03EfF7MLQYgF2gfAE3QC4N
         AEyw==
X-Gm-Message-State: AOAM532x2+RudzyHo/RoEuUjaut+cd0Dz6IYIpdCmQqg7zrihult9Zh2
	5TudtH8AXepwRiasVV7/hFTDkmQnv2PQDg==
X-Google-Smtp-Source: ABdhPJzBE36knCRp0Ab+s+NQd1BagUR0kbc2Q5CnvRuW0/yQMFX60Br5DisFTWx3FA2+OufB8bU2+w==
X-Received: by 2002:a2e:913:: with SMTP id 19mr18201510ljj.343.1640699888714;
        Tue, 28 Dec 2021 05:58:08 -0800 (PST)
Received: from grimoire.. ([178.176.74.40])
        by smtp.googlemail.com with ESMTPSA id 194sm1052915ljj.60.2021.12.28.05.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Dec 2021 05:58:08 -0800 (PST)
From: Adam Kandur <sys.arch.adam@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Adam Kandur <sys.arch.adam@gmail.com>
Subject: [PATCH] qlge: refactor qlge_change_rx_buffers() in qlge_main.c
Date: Tue, 28 Dec 2021 16:57:56 +0300
Message-Id: <20211228135756.7343-1-sys.arch.adam@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Greetings. As I understand, qlge_change_rx_buffers() waits 4 times for
an outstanding reset to complete. And if it cannot, reports about
timeout. I assume this can be written using for loop instead of while,
wich looks nicer for me. Hope my guess was right.

Signed-off-by: Adam Kandur <sys.arch.adam@gmail.com>
---
 drivers/staging/qlge/qlge_main.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
index 9873bb2a9ee4..f36e43a85038 100644
--- a/drivers/staging/qlge/qlge_main.c
+++ b/drivers/staging/qlge/qlge_main.c
@@ -4012,19 +4012,16 @@ static int qlge_change_rx_buffers(struct qlge_adapter *qdev)
 
 	/* Wait for an outstanding reset to complete. */
 	if (!test_bit(QL_ADAPTER_UP, &qdev->flags)) {
-		int i = 4;
-
-		while (--i && !test_bit(QL_ADAPTER_UP, &qdev->flags)) {
+		for (int i = 4; !test_bit(QL_ADAPTER_UP, &qdev->flags); i--) {
+			if (!i) {
+				netif_err(qdev, ifup, qdev->ndev,
+					  "Timed out waiting for adapter UP\n");
+				return -ETIMEDOUT;
+			}
 			netif_err(qdev, ifup, qdev->ndev,
 				  "Waiting for adapter UP...\n");
 			ssleep(1);
 		}
-
-		if (!i) {
-			netif_err(qdev, ifup, qdev->ndev,
-				  "Timed out waiting for adapter UP\n");
-			return -ETIMEDOUT;
-		}
 	}
 
 	status = qlge_adapter_down(qdev);
-- 
2.34.0

