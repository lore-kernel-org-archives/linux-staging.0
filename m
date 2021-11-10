Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576EA2C80
	for <linux-staging@lists.linux.dev>; Wed, 10 Nov 2021 02:30:56 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id k4so1719019plx.8
        for <linux-staging@lists.linux.dev>; Tue, 09 Nov 2021 18:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q8lqcfseykKATmhHCWq2pArMBCPPmzVWy08PgtrSdsI=;
        b=aimbETNZFP1SpyShjP2S/ek7l5wrG2X3WwRsHJoz3EJpSYIQh0CL8X5rp8GsWJ+rAP
         ixex/QaTImzriyJ2h6V58iiRNKOuxmHRb8daYvh8THiLEvhjA13yv5UOj7fBZ0RlDON7
         iffAgbQyRaBJX8WYCcuVJeGnpYjIg1vwGG6CYa9BsWmxMZDAWp6IWysnZFncbJw9PEJZ
         nL7Um8hE0ebos3dbHRA7LEtsT6GPqDKpkuE6EWVQanaKpYuQey7Gdxh5BQESnytr6JwR
         dnJhy39yba1v5xxEt9n0wJEEopeHw9reg6XWZD2gN+7aYmJlSGLAVLO7II/PZQBfgnwr
         sU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q8lqcfseykKATmhHCWq2pArMBCPPmzVWy08PgtrSdsI=;
        b=PeB/z7JhM3adOL/+ZOiKHoRp+6IXZiV62+h8m4mbanPulonhQCN8gUNG7nKIsV/ZRm
         A+5sxJ12iENXkte+J7axIs41Z/rvumjQNbD2FWTM7D1S3CfWGMOHrrqIVwne50NB1Z0P
         BWME3OvzoAPQEby5EsnQ3mh8BLQ48xgJiSpg8QIncJa3OnG4FGfy+CVnUPebNv3D0w11
         w4bBXToKjYLqLebrD/5dymKX83XrN0cI7iT8Y9BYj5PE7rr42duNijSF/O1EikSmbBkL
         CJCMdutMJxvVXNhm1MjxfyzJv8bSJtvlyQJ52njlCHrX9f9N8HpU8W7YKH++jNwcne4u
         DhMQ==
X-Gm-Message-State: AOAM5322jSBaaX7b2FspXnO2Kva8cUPav+kMd20DDzLHORcrRWSYqTTz
	FAliQKwJslYu0rr31yUaj3Q=
X-Google-Smtp-Source: ABdhPJyCKhtqaaSbMJ7luEwYSeVxxIJJhnmohGR53u1QLRcfhpTRvR5e5eEE+2GjVRPkt7/jfouk+A==
X-Received: by 2002:a17:90a:be0c:: with SMTP id a12mr12738589pjs.204.1636511455658;
        Tue, 09 Nov 2021 18:30:55 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id fs21sm3743033pjb.1.2021.11.09.18.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 18:30:55 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: yao.jing2@zte.com.cn
To: TheSven73@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jing Yao <yao.jing2@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] staging: fieldbus: Replace snprintf in show functions with  sysfs_emit
Date: Wed, 10 Nov 2021 02:30:48 +0000
Message-Id: <20211110023048.135535-1-yao.jing2@zte.com.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jing Yao <yao.jing2@zte.com.cn>

coccicheck complains about the use of snprintf() in sysfs show
functions:
WARNING use scnprintf or sprintf

Use sysfs_emit instead of scnprintf, snprintf or sprintf makes more
sense.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Jing Yao <yao.jing2@zte.com.cn>
---
 drivers/staging/fieldbus/dev_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fieldbus/dev_core.c b/drivers/staging/fieldbus/dev_core.c
index 5aab734606ea..01862fe8e4cc 100644
--- a/drivers/staging/fieldbus/dev_core.c
+++ b/drivers/staging/fieldbus/dev_core.c
@@ -70,7 +70,7 @@ static ssize_t card_name_show(struct device *dev, struct device_attribute *attr,
 	 * card_name was provided by child driver, could potentially be long.
 	 * protect against buffer overrun.
 	 */
-	return snprintf(buf, PAGE_SIZE, "%s\n", fb->card_name);
+	return sysfs_emit(buf, "%s\n", fb->card_name);
 }
 static DEVICE_ATTR_RO(card_name);
 
-- 
2.25.1

