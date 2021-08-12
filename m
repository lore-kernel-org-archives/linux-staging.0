Received: from mx-lax3-2.ucr.edu (mx-lax3-2.ucr.edu [169.235.156.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9244872
	for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 07:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1628753736; x=1660289736;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ih509MZfBFgCEEZtNiCc3rKR+7wk2Y1qBqpU/o2sR8I=;
  b=pCWNXBYxMl+kQLp4WvjYXPN2kIS6PopOlqC51ed9TZQ8WoxyG0gbBq4V
   fJj110XJzyMkCxijQH2Q22JgTzMYBPVyPyP51+v2rnfosj2wuCPMTNJdC
   DEPaFNcbnQ5WdA2lC7w6q/x3r460a/8pMink/Q2mPBMZSj+N8+9OnopN+
   6FLv/f5Jg2tLxUgcttFnKvDPxtxQaytDAV5Nc4PeZ9gs7N93LbNZyG18X
   roh5c0hBWEm5MjpXKdNWFq3N1fMn3onJQw3Tjd7q8n3aUZS5mqHbOyai+
   RTuM/+N1kzsNQmHP7WpGSuEZ7u3UtOYDg+eVz5a46P+8HEqLXEqdnOxqf
   A==;
IronPort-SDR: a+9mPH705YLRLv2tqpiGTLbaxGF/fdO6pDAtlbL5f6Eg/6F7uod/a+WWpVo71wpEqBubknOz1n
 dkgQzaCGQtFgJZqYUaT2JapEJd+IZPHrmMQsbaXfJ3rg4P7VMWMwBgsl/tP89E5Cibm2I8Ct+p
 RN50dtwGof+0wDQu+C98bmVxT3qJ0LXovymyopHEYDnGXrsYEnTv3NOVl4ACMoGXkEieMKmhCP
 +FpXdwhCIBoowQx2cP1ivkE/usoVflMdIYWvOoP3UccnmwgOYLK3p/2pgB/hHXvGl+kktrBBUc
 8JJ9QYn5e7oOAN1OGOpKTQPp
X-IPAS-Result: =?us-ascii?q?A2E4DQA5zhRhh0bYVdFaHAEBATwBAQQEAQECAQEHAQGBb?=
 =?us-ascii?q?gKDd1UWjUyTUYEahnyIaIF8AgkBAQENAQESExwEAQGEWQKCZwIlNAkOAQIEA?=
 =?us-ascii?q?QEBAQMCAwEBAQEBAQMBAQYBAQEBAQEFBAEBAhABAQEBgSALWQtjgU+BeQYEP?=
 =?us-ascii?q?YI1KYNlCQIBAxIVCwFGEFE0AQUBHBkiOYIWAYMHnhaBBD2MMTKBAYgcAQkNg?=
 =?us-ascii?q?WMJAQiBKAGIfoRxJ4IpglCBM3WHb4JQBINqexOCKYFQAQEBkD0bgwYBi1iBJ?=
 =?us-ascii?q?ptyAQYCgw4cnjNFlUeRLLsuAgoHBhAjgT2CFTMaJYFsCoFBTQECAQIBDAIBA?=
 =?us-ascii?q?gECAQIBAggBAQKONY5XITI4AgYLAQEDCYkMAQ?=
IronPort-PHdr: A9a23:xFWhfxLyvBgWtp7u6NmcuK1mWUAX0o4c3iYr45Yqw4hDbr6kt8y7e
 hCFvbM91hSZAc3y0LFts6LuqafuWGgNs96qkUspV9hybSIDktgchAc6AcSIWgXRJf/uaDEmT
 owZDAc2t360PlJIF8ngelbcvmO97SIIGhX4KAF5Ovn5FpTdgsipy+y+4Z7ebxtHiDe+br55M
 Qm7oxjWusQKm4VpN7w/ygHOontGeuRWwX1nKFeOlBvi5cm+4YBu/T1It/0u68BPX6P6f78lT
 bNDFzQpL3o15MzwuhbdSwaE+2YRXX8XkhpMBAjF8Q36U5LsuSb0quZxxC+XNtDtQLsqRTqt8
 btkSB7wiCcGKTE59n3Xitdth65fuR6tugBzz5LRbIyTMfp+f7jdfcgbRWpHUcZaSjJPDJqhZ
 IsBDuoOI+JYoJTgrFcKoxayGQygCeXoxTJUiHL6wbA23/09HQ3bwQcsG88CvXTRoNjzKawcU
 /26zLPQwDvDcf1YxDnz5ovPfB8jr/GDUr1+fNHNxUQsDQ7Jkk+dpZD5Mz6Ty+8Ds3Kb7+1lV
 e+3iWEnqgBwojiyxscrl4LGhYIVxUrF9S5kx4s0Jdy5SE5hbt6lDJdcqy+XOpBrQsw+WWFko
 jg1xaAbuZOieiUB1ZsoyQLFZfOdb4iI/gzsVPyXITpgmH9oZr2xiRa9/0W9y+DxVsm63UhXo
 yZbjtTBq24B2gLQ58WHRPZw8Uiv1DaR2w7c5exJIEQ5mLfFJpAvxrM9mZweulnAEC/ugEj6k
 rOae0E+9uWr6+nreKvqqoKdOoNuiAzyLrwiltG+DOk8KAQCQWaW9OSm2LH9/0D1WqtGguM4n
 6TfrZvUP94UprSjDA9Qyosj7hG/ACq439kAhnkHKU5FeAqAj4j0J1HCOPD4Aum7g1SriDprw
 urJPrzlApnUNnjDkqrtca9z60Ne1AY/199f55VTCrEOJPL8RFX9u8DfDh88KwC0wuDnB8th1
 o4GR26DHquUPLnRvFKI/O4jPfSAaY4PtDv/N/Qp//vugmU4mV8Zc6mpx5wXaHWgE/VmIkSZY
 WDjgtYdHWsWsAczV/Hqh0GYUTJJeXm9Qr886ikhCI26FYfDWpytgLuZ0Se/H51WYH1GC1+VH
 Xfza4WLQfgMaCOUIs9uiTEEUbmhS5Q91RG1rgP6z7tnLuzJ+iwXr57sycZ65/OA3T8o8jkhP
 sWP03yKB1N0l2JAEy4k3Kl++RQm4kqIy+51j+EORo8b3O9ATgpvbc2U9Od9Ed2nH1+cFuo=
IronPort-HdrOrdr: A9a23:eW4ueaAWt4/nC73lHemF55DYdb4zR+YMi2TDGXoBLCC9Ffbo6v
 xG885rsiMc5AxhO03I3OrwQJVoIkmsj6Kdn7NhW4tKNTOO0ADJEGgh1/qY/9SJIUzDH4VmpM
 NdmsZFeb/N5JtB4PoSIjPTLz/t+ra6GdiT9J7jJr5WIW9XV50=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.84,315,1620716400"; 
   d="scan'208";a="59890849"
Received: from mail-pj1-f70.google.com ([209.85.216.70])
  by smtp-lax3-2.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Aug 2021 00:35:29 -0700
Received: by mail-pj1-f70.google.com with SMTP id m3-20020a17090b0683b0290178cb50bc1aso4412794pjz.7
        for <linux-staging@lists.linux.dev>; Thu, 12 Aug 2021 00:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kccsi7K3Q0d7ZEGUYI767ae2qeNpNVR9x1RI+mNTwAU=;
        b=sw3BnLMQM20+AU/JMPSqMfIjav9BJMGq5YiKBz/UrwRzo1I1RS6IUme5JU1nK0eRn5
         +OmZpgGb8nym1rIBAAQEbc/il+hxqbqPj7vMH4dXD7QWQmob1j/FvHkTF4hvM5Hmwuue
         4n+MqBmX1nu9tXDSKJs2k9yLYVEqJ8nZTO90SvlsOgL8FO/f5zcK3hEkdC2kLcFUsuGd
         IPcsDFmlMCLz25NszhUK/Mt1rLlI75GREYoewgTom+46Vudgznh0aTj/26bIj9SqEqOz
         +Cmc7guIvTP4MiDpT+w8RuJORbABNXI0l5wvDmP4bAtKKX693QRHtHv82Qn7xqNoWrd2
         L6Xg==
X-Gm-Message-State: AOAM530mEh1au7/WOzGGlvBuSwbgqsuaVIv2uz014kJJ/Ixv7Qfw3lm2
	SGgU72/kqNIL86KBeJRUjls8JxiQjGGUP5jMriNZmrfvR6/O5qva9wnTS6TBp4k8r6dnlPHL+vn
	W7xG7i2lSgc9IScR76Ny/o/k+Bzo=
X-Received: by 2002:a17:90a:1d05:: with SMTP id c5mr15695406pjd.175.1628753727678;
        Thu, 12 Aug 2021 00:35:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlN3QIKxpfS3sp2zQl+zNyzHUDzfrTSRi+p5FZ6+O5COzp/wL3UQAMaJrRFiVp810LR6P+ow==
X-Received: by 2002:a17:90a:1d05:: with SMTP id c5mr15695395pjd.175.1628753727504;
        Thu, 12 Aug 2021 00:35:27 -0700 (PDT)
Received: from kq.cs.ucr.edu (kq.cs.ucr.edu. [169.235.27.223])
        by smtp.googlemail.com with ESMTPSA id s5sm1879447pji.56.2021.08.12.00.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 00:35:27 -0700 (PDT)
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
Date: Thu, 12 Aug 2021 00:34:46 -0700
Message-Id: <20210812073447.127193-1-yzhai003@ucr.edu>
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
Signed-off-by: Yizhuo Zhai <yzhai003@ucr.edu>
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

