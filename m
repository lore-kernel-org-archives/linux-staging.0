Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6DD6D24
	for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 08:18:09 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id k14so5161240pga.13
        for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 01:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BmsxjSFu3i7r3eCLeFpeZGvQeDgyZ9p5i9AV6MQK988=;
        b=U0/vKB6ZkgtnKF2B3r1+lPQsKooRBRF/AcWh77jbjPkKOZOG7UOWfYDADGNFemAAp7
         ksttYG+CBgLD4eYOotkoOf/y+GLSWubAv7HW8bw+hEXizE/nIaCTS/rQ2l0Cz7kYu9oe
         ow5SNoXX6my/4hrTQiZbzQiHKB/u/SUOKKy7FZLt71vCmg3kzDl4zbAeBg6ivNYHh3/E
         N0QEYSVUVWvtbkxBFcS/elhbzj9JoBTrAG6yZrGNpAB1fthHNRXdsGvGutm6n59P/LWh
         jxl1r5IZzr6QWXENgLaKJisy9tvb4n4GCqkhBAdDWcoZplLKdME1kEq7MLA0kHM5dmh8
         wRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BmsxjSFu3i7r3eCLeFpeZGvQeDgyZ9p5i9AV6MQK988=;
        b=oZPyOKlpg09yPl73pvDlDKCDscxRu8f4POjORpUCe3/NHVr8BitHmGPuQjBzY7AgBI
         kemB+nmif1Qef9+1M8Su2k2EDyRN6Q94Br3X6V0WSvf1+s3ed8fu+JZnffNNBXtLAezM
         A8IwimqPL+dbeh0Qpz33BtVve9hseaCXncUy+Ei14M8rmdqQ3NJdWHyatfZUjVz3in4j
         GLMlbSuKsbwglIh15e/uFjuDmkZBFX7coq82q1SQIYYQphBf+II2yVQjvQ3KSHOmKiSV
         K4rVrB+PuALU6+enitH4C0pUZcnAfaP+SYNWoRDyJnZWfzGpTIlawemoDvk2wG1IQ2gj
         zh6w==
X-Gm-Message-State: AOAM533DpFJD6Vk6/O4/kV1Oq4jl8oLyR5x9JEhDSaCXFHymr7TXtZbl
	HnepcVvxvsYaCmkaz60F98Y=
X-Google-Smtp-Source: ABdhPJyGqlBpOT74lRTpXOMOG4tN3flMrP4LJmSXQr0f6nyNP38aCCvyABKBfeEdE92ths4b79llZg==
X-Received: by 2002:a05:6a00:1808:b0:3e1:f8c5:3436 with SMTP id y8-20020a056a00180800b003e1f8c53436mr13525967pfa.3.1629361089488;
        Thu, 19 Aug 2021 01:18:09 -0700 (PDT)
Received: from xps.yggdrasil ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id gb17sm1531129pjb.26.2021.08.19.01.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 01:18:09 -0700 (PDT)
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] staging: r8188eu: restricted __be16 degrades to int
Date: Thu, 19 Aug 2021 13:47:53 +0530
Message-Id: <031b477891e5981897fba5c96ae2da922cac55ec.1629360917.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1629360917.git.aakashhemadri123@gmail.com>
References: <cover.1629360917.git.aakashhemadri123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix sparse warning:
> rtw_br_ext.c:73:23: warning: restricted __be16 degrades to integer

Here tag->tag_len is be16, use ntohs()

Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_br_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index ee52f28a1e56..404fa8904e47 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -70,7 +70,7 @@ static int __nat25_add_pppoe_tag(struct sk_buff *skb, struct pppoe_tag *tag)
 	struct pppoe_hdr *ph = (struct pppoe_hdr *)(skb->data + ETH_HLEN);
 	int data_len;
 
-	data_len = tag->tag_len + TAG_HDR_LEN;
+	data_len = ntohs(tag->tag_len) + TAG_HDR_LEN;
 	if (skb_tailroom(skb) < data_len) {
 		_DEBUG_ERR("skb_tailroom() failed in add SID tag!\n");
 		return -1;
-- 
2.32.0

