Received: from mx5.ucr.edu (mx5.ucr.edu [138.23.62.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544C570
	for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 05:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1628747824; x=1660283824;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Dih/syqAoRh+zFSVP5ghlcBWDYRkM3algk3/KHqQrKw=;
  b=Bka+/TSyHPBwAde7guZK5l1rdJp+kgKK8zv4vs3azdTZz481UKnFQs1u
   IKx12ZWADMuM2LJBUlDOnrjjtLwTZht8QdQmfLKCbyOPRrGwT026+G/91
   8EnDY8IhKl7wFtO/mvKRslZq2fve+o6KJNu6W1+cs15cCP+DiekWVfExX
   AYqR5tqlexQqVDl59FW/h4nijhrDbCV/QpHXAp61S+ov4K6KMxE8S/QZh
   6MTmtRnc1xU3pMYV4jynxXdRNlEL8eLUKAWRZZe991JDDwxtZIMcPcaeg
   LC26T0pNmrlFs636YogFbWodeM0qE+6oAQoeYIIO9Ds54MFz6TuysukI6
   w==;
IronPort-SDR: c2nwXbQGOLC1CM6OrxoDQeaY/j9Q7KoLCCstiBaEN3ZOKtULeiKt3N4VIet5eeiQ/CKrmeAWZ5
 8kdUWFoU1upK/igsMh9iDtCRdC0yf9pOzyZhfvHjoZFGe0yyEKl2UDJuaOcyL+8uGiMDufSxkW
 UgNkEVIejSURc0abE0/i6HcL43YUdzt4gOK+q/T5sshaF+msMtdHZmZCleUfwjkfkcE2bpwqo/
 ODW7gpsshkWuMCkagLknTr12wImd/72D5eWWljQDog24ckaPEM8bguMDi4ZwcNDCndLLMxKf+n
 7F3FqR96RQDw2tpDOSalpzOg
X-IPAS-Result: =?us-ascii?q?A2EnDQBEtxRhh0bYVdFaHAEBATwBAQQEAQECAQEHAQGBb?=
 =?us-ascii?q?gKDd1UWjUyTUYEahnyIaIF8AgkBAQENAQESExwEAQGEWQKCZwIlNAkOAQIEA?=
 =?us-ascii?q?QEBAQMCAwEBAQEBAQMBAQYBAQEBAQEFBAEBAhABAQEBgSALWQtjgU+BeQYEP?=
 =?us-ascii?q?YI1KYNlCQIBAxIVCwFGEFE0AQUBHBkiOYIWAYMHBZ4YgQQ9jDEygQGIHAEJD?=
 =?us-ascii?q?YFjCQEIgSgBiH6EcSeCKYJQgTN1h2+CUASDansTgimBUAEBAZA6G4MGAYtVg?=
 =?us-ascii?q?SabcQEGAoMOHJ4zRZVFkSu7LQIKBwYQI4E9ghUzGiWBbAqBQU0BAgECAQwCA?=
 =?us-ascii?q?QIBAgECAQIIAQECjjWOVyEyOAIGCwEBAwmJFgE?=
IronPort-PHdr: A9a23:bESL3BRibbRpKsKhMki3TRNtadpsonefAWYlg6HPa5pwe6iut67vI
 FbYra00ygOTBcOLsbkU16L/iOPJYSQ4+5GPsXQPItRndiQuroEopTEmG9OPEkbhLfTnPGQQF
 cVGU0J5rTngaRAGUMnxaEfPrXKs8DUcBgvwNRZvJuTyB4Xek9m72/q99pHNfwlEnjmwba19I
 Bi1ogjaq9Ubj5ZlJqst0BXCv2FGe/5RxWNmJFKTmwjz68Kt95N98Cpepuws+ddYXar1Y6o3Q
 7pYDC87M28u/83kqQPDTQqU6XQCVGgdjwdFDBLE7BH+WZfxrzf6u+9g0ySUIcH6UbY5Uim54
 qx1VBHnljsINz8h8GHWlMNwir5boAm8rBB72oLYfZ2ZOOZ7cq7beNMaRHFBXt1QVyxHDYO3c
 pUBAfMcNuZWronyuV8OogajDgWoCu7j1jpEi3nx0qAm3ektDRzK0BU8E94TrX/YqMj5OacXX
 e2z0aLGzyjMb+lO1Dn99obGbx4vr/KLU71yf8rexkYhGhjZgliTs4HpIymY2vgRv2Wd8uFuV
 fivi2kiqwxpoDevx8YtionUhoIS11vL9iV5z5w0JdalT0N6Yd+lEJtKuCGbK4d6Xs0vTnp1u
 Ckm0L0Ko4C0czUXyJk+wRPUdvOIfZSS7B35SOaRPSl3hGhjeL+nmxu/70euxO3zWMSp0VtHr
 ipLn8fRu3wTyxHe99aLR+V+80qh1zuC2A/d5+FaLU47mqfWKposz6Mum5QdtUnOESn7k1j1g
 q+Obkgo5PSk5uD9brjlppKQLZF4hhz/P6g0mMGzHfw0PhUPUmWf4+iwyrPu8E3jTLlUjPA6i
 LfVvI7UKMkdu6W3GRVa0pw55Ba6Fzqm1dMYkmQZI19dYxKHipTpO0nJIPDlEfezm1Ssnylvx
 /DBJrDhB4/CLnnHkLv4ZbZ96VNQxBM9zd1d+55YEL4BIPX0Wk/+sNzXEAU1PBCzw+biENl91
 4UeVnyTAqKBLq/erVuF6vgsLuSMfoMZpivxJvk/6/PskXM1gVodcrOo3ZsTZnC4BPNmI0CBb
 Hvsg9YBEX0FvgsiQOD2hlCPSiNTaGqoX64m+D40FZ+mAZ/ZRo+xmLyBwDu7HppOa2BCC1CMF
 2rodoqdV/cXdCKdOMBhkj0CVbiuUIIh0RCutBTmy7p8NObU/iwYtZT+1Nl6/eHciA899SInR
 +qH1GTYfmBmnn4PDw021aE39V1vyl6CifAjq+FTD5pe6+4fAVRyDoLV0+EvU4O6YQnGZNrcD
 Qv7Kug=
IronPort-HdrOrdr: A9a23:1YV6IK4gvMd2E/0nCAPXwOHXdLJyesId70hD6qm+c20xTiX+rb
 HSoB11726StN98YgBCpTnEAtj5fZq+z+8O3WBuB8bFYOCOggLBR+FfBMnZskbd8kXFl9K1vp
 0QF5SWZueAb2SSTvyW3OB7KbwdKRW8n5xA/d2utkuFhDsHBZ1d0w==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.84,315,1620716400"; 
   d="scan'208";a="231702106"
Received: from mail-pj1-f70.google.com ([209.85.216.70])
  by smtpmx5.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Aug 2021 22:55:56 -0700
Received: by mail-pj1-f70.google.com with SMTP id 16-20020a17090a1990b029017582e03c3bso7215754pji.7
        for <linux-staging@lists.linux.dev>; Wed, 11 Aug 2021 22:55:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rubSw9FCX3UYPP3qCFnQoWoTCnQrhAdQYI5e/tU4EqY=;
        b=ZuGlmsPXwmHy66YnXdfDYHlVZzSlBxpK3mOeT0kmIf1UPQxC9Tpipt9i55gvPMQvzi
         tHbtm4S91Z31iGXZ1smNyvtd5EGF++iXa95v4fdtmwDBZbcwXTtNCdek/O8I+A50EYAh
         aw/zuJQMrq38DT34VIbMSogwkzqP8Gs9WKZromiT/FvbnHE0CUQTTk8xEku7GoOr3Oc+
         4n7bZS457QSc2bnPC4a6kYCd5Tn1+TOsAHa0oS5tTTeRmUuJcljBF7Y3/MsmvLGhXYWD
         A6l7YmPakL8Be9iFktixyjBjLnvgff/3kC7HBhHkkPIDZd8Vo1btAST7ow42ov7CD7fp
         LB/Q==
X-Gm-Message-State: AOAM5334KlQ3AbuQcZHCoXp6/p8KPV45uAN7B3oFtmM8DyiS877yqBQ1
	5OHEqVD0JhxI7Nn05xDHWaw6wMP427nm48TYYX5zlAcp/cbJ11Vjl1vunWpW7p6thpQSh3JPnZr
	zO3cmTO7PcTZv1Rbe/JEqacysJ60=
X-Received: by 2002:a63:83c1:: with SMTP id h184mr2410937pge.37.1628747754102;
        Wed, 11 Aug 2021 22:55:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOygrKV5WhARieKOIood/QYvjnnVnFyEKRNwCN5hxkQkZt74kl1r/JcDId5gGmRbEWFlUyOw==
X-Received: by 2002:a63:83c1:: with SMTP id h184mr2410923pge.37.1628747753894;
        Wed, 11 Aug 2021 22:55:53 -0700 (PDT)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
        by smtp.googlemail.com with ESMTPSA id j6sm1659165pfn.107.2021.08.11.22.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 22:55:53 -0700 (PDT)
From: Yizhuo Zhai <yzhai003@ucr.edu>
To: 
Cc: Yizhuo Zhai <yzhai003@ucr.edu>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Juan Antonio Aldea-Armenteros <juant.aldea@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] media: atomisp: fix the uninitialized use and rename "retvalue"
Date: Wed, 11 Aug 2021 22:54:17 -0700
Message-Id: <20210812055421.44450-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210723003607.64179-1-yzhai003@ucr.edu>
References: <20210723003607.64179-1-yzhai003@ucr.edu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Inside function mt9m114_detect(), variable "retvalue" could
be uninitialized if mt9m114_read_reg() returns error, however, it
is used in the later if statement, which is potentially unsafe.

The local variable "retvalue" is renamed to "model" to avoid
confusion.

Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
Signed-off-by: Yizhuo Zhai<yzhai003@ucr.edu>
---
 drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
index f5de81132177..77293579a134 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
@@ -1533,16 +1533,19 @@ static struct v4l2_ctrl_config mt9m114_controls[] = {
 static int mt9m114_detect(struct mt9m114_device *dev, struct i2c_client *client)
 {
 	struct i2c_adapter *adapter = client->adapter;
-	u32 retvalue;
+	u32 model;
+	int ret;
 
 	if (!i2c_check_functionality(adapter, I2C_FUNC_I2C)) {
 		dev_err(&client->dev, "%s: i2c error", __func__);
 		return -ENODEV;
 	}
-	mt9m114_read_reg(client, MISENSOR_16BIT, (u32)MT9M114_PID, &retvalue);
-	dev->real_model_id = retvalue;
+	ret = mt9m114_read_reg(client, MISENSOR_16BIT, MT9M114_PID, &model);
+	if (ret)
+		return ret;
+	dev->real_model_id = model;
 
-	if (retvalue != MT9M114_MOD_ID) {
+	if (model != MT9M114_MOD_ID) {
 		dev_err(&client->dev, "%s: failed: client->addr = %x\n",
 			__func__, client->addr);
 		return -ENODEV;
-- 
2.25.1

