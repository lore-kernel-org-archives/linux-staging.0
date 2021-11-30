Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4964D2CA0
	for <linux-staging@lists.linux.dev>; Tue, 30 Nov 2021 00:07:32 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id np6-20020a17090b4c4600b001a90b011e06so15593159pjb.5
        for <linux-staging@lists.linux.dev>; Mon, 29 Nov 2021 16:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yLroyclqA7COdzkeGPg4v5EHelvIwAsUxd1X4mQaBh0=;
        b=oVZiDleNTBieFGQT1vWlQLpNNvmIpfgLebXbskRGsBaGYkKs2YZOcnldKh2VPOL0oO
         wtmPJl2ZZDk523mRkJEzpY2T+3dQ54hLG2b1ZglA4hKh1WF/7u3mhrfFatMH+vYkX5Qq
         PSaaweiUUmPn9u+by56tc88LxehK2cm4wj5Hp1u0itUzJTWK6XXfaeW6pp+Vn5d2+ob8
         mLKs4uPuQrPmDarxiIEzxVLTmPNBiTXyXa6yOKP7D5HQW22RgV/HUC9Bgm3MmkSsR/pK
         we+PJWbLTi3/ltn/3KBJZBkl3W5k16Bq9Y8Y8OJieJNW5JDycAHbztVlrFpKIE3TgNYb
         bdfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yLroyclqA7COdzkeGPg4v5EHelvIwAsUxd1X4mQaBh0=;
        b=M/97bmo82fMS1WDBltV36Y0A7qIue20koahtMXnscc7BASkGvpPLnM/0L8kuaoSEin
         +lLVdl580jeiQ5dv/LOdBLE2/O354BsFLRyskEDhGt7lI5sucJH4Izz9S/XqDttSMnXG
         VuJBs1T1JR35P5iU4aqrst8dJZBVLiBv8MH7Q1mfWCfj4OPoQYvFKUv3bsqGuZNaGzi5
         zvBXJDzDEkpP9CgrAOqvyatBB599xfjF0L6G84GLa8o0jyJjQfCbgVLXwdG6awVmlt5p
         gcDn4mNC8MUZS+ZNkciOeJ/TXaO2NYOdbyQ/dapranh0rLsbSxHepjcD39jWVoRUj7JU
         k/3Q==
X-Gm-Message-State: AOAM533s1r+uaaXIpmJNCdihmn5Rou/ARs0ZWWX/egDpjCkPi41xXYbD
	x1HjUzTAVteujqfwTvd2Ac8=
X-Google-Smtp-Source: ABdhPJyg9nks96NZQCGBQ2/wyNf2fPNd0KsWM06DlMcci1jiFulf+PxRX1jdZPLwin+RrkTqp9maUQ==
X-Received: by 2002:a17:90b:1e51:: with SMTP id pi17mr1613000pjb.245.1638230851814;
        Mon, 29 Nov 2021 16:07:31 -0800 (PST)
Received: from debian11-dev-61.localdomain (192.243.120.180.16clouds.com. [192.243.120.180])
        by smtp.gmail.com with ESMTPSA id m24sm13098152pgk.39.2021.11.29.16.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 16:07:31 -0800 (PST)
From: davidcomponentone@gmail.com
X-Google-Original-From: yang.guang5@zte.com.cn
To: TheSven73@gmail.com
Cc: davidcomponentone@gmail.com,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Guang <yang.guang5@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] staging: replace snprintf with sysfs_emit
Date: Tue, 30 Nov 2021 08:07:21 +0800
Message-Id: <21e2111f6c2590ac24ad15d39e87160f9425045b.1638186054.git.yang.guang5@zte.com.cn>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yang Guang <yang.guang5@zte.com.cn>

coccinelle report:
./drivers/staging/fieldbus/dev_core.c:73:8-16:
WARNING: use scnprintf or sprintf

Use sysfs_emit instead of scnprintf or sprintf makes more sense.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Yang Guang <yang.guang5@zte.com.cn>
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
2.30.2

