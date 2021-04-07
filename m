Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AE46D13
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 13:50:08 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id q26so12378438wrz.9
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 06:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JsWUwV7KAjqM45vzWaT6+SgSOJnPCweW1Y3r8QJzpE4=;
        b=aInYbfHYrC4Emn8AqHBaEY9mMpb5kEgClsYuxLEfC1iw1U0I5MNb3ykWb1qWZXnDI9
         2soS6Zql2mvgXY9rTClq7xYJyPfbyBsnUjAgp+QKBMutWtIUz2dFF7k9uQA1vbZKeOdo
         Tj2tEix+7RfXuCyNb3cN1iiaIJ/tOnNGoeIzKiJ8U7Eoq9GnP1n8r0voesDFlMkqg5jF
         1kyX2TOqE/7IXTJ2Yql2laRELQvjr7DY6xrjajfFQqfLCLdVodcXL5lKRM+tx/H7c0lR
         vcUzYeHWceMwGmlEcdxtjjHXZfm6+aRjgu7TQKCtLVpM45Ws7kUadAcniNf+ItMDzDwr
         OLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JsWUwV7KAjqM45vzWaT6+SgSOJnPCweW1Y3r8QJzpE4=;
        b=WSvwbkIidb/6TsrTvi037TTPkGE5K+WKr/UGDJKk9kTss2k4+rM9J8RdhFkxnfYqQA
         WaljEELqapuXyZABjNoMxPZpNvq9HE01gxiiGS1xgO5u2UhA/4e24Xqh5M1fe9al4N+1
         PjPaaDV+Ow2mW4O0Q0UdGmNo5OrplqSQy01hqJXiu8/4vT92Foc959qMnUR1GGH6hnAa
         Ga1xsQY6a2XBTELoHq6l39vBynTJtN0GHF7UKPCzX/3AGGdNvYAQ8eApt9eM9H13RUaW
         Opv4YtvQNHGTH/o/4J/w6xnp3CPFPvVvZPbQ27HUL1Tfc4qbOeBR2NIQZ4JpgTKSXYdp
         F50Q==
X-Gm-Message-State: AOAM5307Vqn9HnyO1gvDcOtloe32J1jduhv4ZiRM88Zk8y/Oy9QMJfdt
	IaINkZDEgqw5dDeZ9OKzIiv5U2yJ2PloNQ==
X-Google-Smtp-Source: ABdhPJzgS6Tu/2d3tjY5KJWe5t5vcuF1kCGzWgViKTqjNPXo1TU/1RgU/j9gdQJ0JMqgNaNhji22Tg==
X-Received: by 2002:adf:fb87:: with SMTP id a7mr4614965wrr.58.1617803407262;
        Wed, 07 Apr 2021 06:50:07 -0700 (PDT)
Received: from agape ([5.171.81.68])
        by smtp.gmail.com with ESMTPSA id y11sm18078310wrh.6.2021.04.07.06.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 06:50:06 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 07/19] drivers: rtl8723bs: rewrite comparison to null
Date: Wed,  7 Apr 2021 15:49:31 +0200
Message-Id: <0c6d53c851d1b07eb0183108e0bad7b4f273f04b.1617802415.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617802415.git.fabioaiuto83@gmail.com>
References: <cover.1617802415.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix following post-commit hook checkpatch warnings:

CHECK: Comparison to NULL could be written "!psta"
97: FILE: drivers/staging/rtl8723bs/core/rtw_ap.c:2115:
+		if (psta == NULL)

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 30afe9f4ceef..e7712391a87d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -2103,7 +2103,7 @@ void rtw_ap_restore_network(struct adapter *padapter)
 	for (i = 0; i < chk_alive_num; i++) {
 		psta = rtw_get_stainfo_by_offset(pstapriv, chk_alive_list[i]);
 
-		if (psta == NULL)
+		if (!psta)
 			continue;
 
 		if (psta->state & _FW_LINKED) {
-- 
2.20.1

