Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC0117D4
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 10:43:54 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id v4so5804643edl.7
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 03:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W3gIVX2j+QmqthafxJMF0q4aG/MQAnfAXiq7/gIShys=;
        b=XovvZG/8sCJ8k9pCBYUJ+OHgqqdde5GmmeXkHwJihA7upLfxvh1jDTUiXVdTJdBEiM
         EJhO78fW/ewzLp554JAnUIaOjDb7usX0v7DyA77Sdret4zAliR1gVhqeQBFssBPuG2f1
         cRxz+VtIBj3v2woVJfjYNwEVg1zBmCniR9fbfROajydNbZgo89jpvZATvTsRuUJBnC84
         /TMCCVw8tb/zvMjBBjEdmVUA2LCRmxboea9G0iGDK65uIco0mDhdc8u0Bn30nItCgL2N
         BLcVgiC24zVGcpOiEkXQQMk3hlQMKOsJIN+VIvT/t+cr+hnICgy9MBClrfwgqlXk77qg
         XvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W3gIVX2j+QmqthafxJMF0q4aG/MQAnfAXiq7/gIShys=;
        b=PpZntyKzgZIsdWQhI/Hmu24q/9ZckGrTC4vWecGggh6HU3r4bT4Ty5II88IgFS6Owk
         Lb8BPuoG2J6iEMwWs+94gxl1yorCa6ULWYg0OVNoFhRghaYNSiCC2DqBgQta39lSI1Qc
         67PGhXpiVfODbmG2Vff840UB5+lXXURwgYzAAOVmdarDzumZzPAOv3i5OAiPNMziIjlp
         BVkiVPjSSjfBjvP6CRvgT86lhBxtgM4i9vxX2n5Saw7d1rBoJDQP9fx3S3mx+Wkg3nIX
         duC/LpwIzRgrq0HOWXunU7P46fWUuw9RQ67HJkrolQrbnRjgw8p039JbkS4UN6AHavGs
         LJsA==
X-Gm-Message-State: AOAM532nUSZEE7OJiWvCyRunPbnKqNdjIVIck/thMhB3QFCO8CJgPthC
	wYOLlQjaXb0ihmM6nSEnr70=
X-Google-Smtp-Source: ABdhPJxVyX5PxwakbXcEFYaxnu2B2+HCic+kNvRI1uhHPcpT1aWcCf5Cp8CfvubY2cTb78IH6B5NCg==
X-Received: by 2002:a05:6402:438d:b0:419:4550:d52b with SMTP id o13-20020a056402438d00b004194550d52bmr2219466edc.83.1649933033138;
        Thu, 14 Apr 2022 03:43:53 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id h9-20020aa7c949000000b0041b4d8ae50csm821318edt.34.2022.04.14.03.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 03:43:52 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>,
	David Laight <David.Laight@ACULAB.COM>
Subject: [PATCH v2 8/8] staging: r8188eu: check rt_firmware_hdr size at compile time
Date: Thu, 14 Apr 2022 12:43:23 +0200
Message-Id: <20220414104323.6152-9-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414104323.6152-1-straube.linux@gmail.com>
References: <20220414104323.6152-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check the size of struct rt_firmware_hdr at compile time since
we rely on the size to be 32 in rtl8188e_firmware_download().

Suggested-by: David Laight <David.Laight@ACULAB.COM>
Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_fw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/r8188eu/core/rtw_fw.c b/drivers/staging/r8188eu/core/rtw_fw.c
index c58bce1a1856..4417375a158d 100644
--- a/drivers/staging/r8188eu/core/rtw_fw.c
+++ b/drivers/staging/r8188eu/core/rtw_fw.c
@@ -34,6 +34,8 @@ struct rt_firmware_hdr {
 	__le32	rsvd5;
 };
 
+static_assert(sizeof(struct rt_firmware_hdr) == 32);
+
 static void fw_download_enable(struct adapter *padapter, bool enable)
 {
 	u8 tmp;
-- 
2.35.1

