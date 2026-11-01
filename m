Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793548208;
	b=qL7QMIvS9Be/gEykMiKRNR6FRuUt8xeNhFbhDuKU/ReF/eE9P4XOGZTmXCuGP/v/lcsW
	 d2yzNXeAI1CVPbaRV/M/XYgoOqNEf2bUKNpskny1m04ZX/yh19MN5a7YiQ762BIbZsMQB
	 IInsKUhzXbbRb/I/HiS+lRiwY96VMuC2NLM95hKbFvpa7v+HSF+KKofyxDVM1qjiQCkpX
	 UWgtGYYwKZ9toVIk71jeT1sA4N0+gSh8I/L8DbLWkcUeVyDqmXy1cPE/O6okO41cSCagg
	 Ozr0T9nXGk8UCVnNQgwdfnZF2GVbuNiRqzB9iEI/a09QGSAdjlgDxEaQa4MxClJ2P4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793548208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZQZ4ENRlGzy9j1pUwqm6k+qNATZGaMh89x9i7xh06Gw=;
	b=OSEYcNOzU6QE20V/bC/CBZsJSVu6QV30uEuCcgs1+vc2tgdUDWehuBtnuT6EPMgXN2tN
	 e9ctzvCwasu5PDiQMJJYN8eDMXTFyVfBwZh1BCho5q7iODGv3Qw9Dld7/GFgv14tPPVEM
	 9wKrG0hkf733u3JpJH6p+YD2+7v3UwcXAypBfFzpSxv2E15Vo9faNL93AKqNsVhUhsa4A
	 Lu87D7Mqqepw9704/ssTyA3nzPPSYgZwK4aBk0AEWFkTYfe+n05ZbyuUf/sLBZY9qBnNA
	 4DyJ3SBNt1QXZCynG0+/mvpTbu0RkvAfzGZVSQlyBO1IUzz4WjjGVAUFG93xbnRk6tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WUum7w47;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44DA606A326
	for <linux-staging@lists.linux.dev>; Sun,  1 Nov 2026 15:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A44DA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WUum7w47
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36a2551d7b5so4238043eec.1
        for <linux-staging@lists.linux.dev>; Sun, 01 Nov 2026 07:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793548207; x=1794153007; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZQZ4ENRlGzy9j1pUwqm6k+qNATZGaMh89x9i7xh06Gw=;
        b=WUum7w47Sykive/L9e4RhBT/ta+QNlbBV8WW3Of8JYv4eRxChECsXDdZ+hx0qskD7w
         e+wb5ca6R8C5vcVLArFRYzx1O54Er/F2RyxrypO6ICuIIC+oM56RKit6ED6Owi2E8+cl
         anscLJNHjsyxAU4UcvBZ31eNzDag+KYO8vBtTpVft/L/BmjnOejQ5SCyVtTfHFUd0Axc
         CmPpshavQEyORVOnUwu3JVy0E9001gJ7bVif5Ca4bRHA/UtgO3+3nAZELA2+8ZLrxmDQ
         /MNOjnQgL1J0S4ywKx4msHAx5cGSg9D/dVrNWMgUX/0ATwqSZYV9cx90DUMR9XT3kqlL
         sSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793548207; x=1794153007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZQZ4ENRlGzy9j1pUwqm6k+qNATZGaMh89x9i7xh06Gw=;
        b=gxfK6j6o/C32uZeCFySPfQ3CUOE112kUNqSHbmw/ZtgLLsiooMzqWhGByOo15UlXCC
         ovVIq1deL5q9htd1VhzhfPuJNdejLpW1DQVpmsLftPPLOlN1hpwowvXFIpX17R5qM8VU
         l4nWiJYf9eurMUrtR5GFgiEsRFWcZ/uj4LH2lUtV4L2OBmYQTexy8s/fkGyKAtgkv4BS
         7pFAVJgPvRmYaP1T+NgFFUue2ctd1AuO4VfnSrzNPfsOaPEzecWxQtFUI6Y6su2NGw3A
         oIEj/LFxeV/8SyyJKO6HoMtOOBngashVPRR54fxwIUq7tHRJxTmKEv8rX7zZwJoT9Ov5
         vI6w==
X-Forwarded-Encrypted: i=1; AKwUvBwf/0t8Ibs1RmAAre1189dK1b7EwQOb3NPtaITKNmNpZPwxScL4KNIcDSfwzT54HeaYsvRLUhjyDsS5JNcP@lists.linux.dev
X-Gm-Message-State: AFq9FYIQNoEw+Ude1LeLgmqoqJoGqzcYIUJgNQV8sllIgkf/R9jMHoRI
	eCfTw+rN+I9TII42lT0l1L+vOJj6p/N1fuGqL5DKv8/BcVEBI8k+uEL4
X-Gm-Gg: AYBFou3i9LORnBwF/jULzMsktPMaOulCRKFIiFJRffulprzeQeOFp9aY4F8fmOPLUEU
	hcb2v+YdBJ7nFGvI6RC1Y7onGqgq4cg45mMuOSH7bzNTHSMQGEY0I/WJYs6u+vCutTxIFrEZJlI
	S1aXXkLt5Esb7tWsT33poY12BCB+cPJb6qcQ37b0xDNZbp2TZYbF4Ekr3z9sdAZuTSpvGv8ZLrl
	L5XI6AOZw8Y2rCOJs60LVMgyPfEyZwIU3vxJQS9nyeEVz29BuuXiyorDKa3YTYIXwKgyqQa87Za
	JK+yqgnX3SwohVtqZoa6NE3Mq3ZrhY/NPq1IMmhEGX2MBYnR8ivMyDePANTrGshXVkBRbush6Rt
	udC4kmqebu3uVZbRha8u9YHFOhWjfTnnY3isyja2EWSLxSLTJIypc5N0amKKdjlaJTy7G5kShPg
	EcaIXkyXg7ymVHF855a0vknwIV/o7M/mAto40UdifjAn1ls2+CcFoyvAyrscDE9fWZUtRdZBiam
	iEyPFUzTQdBhTslUExEYjdBxcO8LGdZdyI02dBOjjHIHW70yoavzmRzlq21OsijFxVVg7jL2XJf
	WS/yvqPdxEtou1jkCfdQp+zr65X4kerhkrimAG2bLMQ8jYjQ5jLJOrOyeuVRYWDxD9IrgkKB
X-Received: by 2002:a05:7022:7f02:b0:156:d588:c881 with SMTP id a92af1059eb24-1a9420e36c4mr15374530c88.2.1793548206589;
        Sun, 01 Nov 2026 07:50:06 -0800 (PST)
Received: from X.tail7c3ebe.ts.net ([103.190.40.31])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a136537sm25437817c88.18.2026.11.01.07.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 07:50:06 -0800 (PST)
From: Avishek Chaulagain <chaulagainavishek14@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH] media: atomisp: Remove unused atomisp_get_pixel_depth()
Date: Sun,  1 Nov 2026 15:49:59 +0000
Message-ID: <20261101154959.381-1-chaulagainavishek14@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

atomisp_get_pixel_depth() has no callers anywhere in the tree. Remove
the unused function and its declaration.

Signed-off-by: Avishek Chaulagain <chaulagainavishek14@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 41 -------------------
 .../staging/media/atomisp/pci/atomisp_cmd.h   |  2 -
 2 files changed, 43 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index e66a7d1c7..4f876b02c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1080,47 +1080,6 @@ static int raw_output_format_match_input(u32 input, u32 output)
 	return -EINVAL;
 }
 
-u32 atomisp_get_pixel_depth(u32 pixelformat)
-{
-	switch (pixelformat) {
-	case V4L2_PIX_FMT_YUV420:
-	case V4L2_PIX_FMT_NV12:
-	case V4L2_PIX_FMT_NV21:
-	case V4L2_PIX_FMT_YVU420:
-		return 12;
-	case V4L2_PIX_FMT_YUV422P:
-	case V4L2_PIX_FMT_YUYV:
-	case V4L2_PIX_FMT_UYVY:
-	case V4L2_PIX_FMT_NV16:
-	case V4L2_PIX_FMT_NV61:
-	case V4L2_PIX_FMT_RGB565:
-	case V4L2_PIX_FMT_SBGGR16:
-	case V4L2_PIX_FMT_SBGGR12:
-	case V4L2_PIX_FMT_SGBRG12:
-	case V4L2_PIX_FMT_SGRBG12:
-	case V4L2_PIX_FMT_SRGGB12:
-	case V4L2_PIX_FMT_SBGGR10:
-	case V4L2_PIX_FMT_SGBRG10:
-	case V4L2_PIX_FMT_SGRBG10:
-	case V4L2_PIX_FMT_SRGGB10:
-		return 16;
-	case V4L2_PIX_FMT_RGB24:
-	case V4L2_PIX_FMT_YUV444:
-		return 24;
-	case V4L2_PIX_FMT_RGBX32:
-		return 32;
-	case V4L2_PIX_FMT_JPEG:
-	case V4L2_PIX_FMT_CUSTOM_M10MO_RAW:
-	case V4L2_PIX_FMT_SBGGR8:
-	case V4L2_PIX_FMT_SGBRG8:
-	case V4L2_PIX_FMT_SGRBG8:
-	case V4L2_PIX_FMT_SRGGB8:
-		return 8;
-	default:
-		return 8 * 2;	/* raw type now */
-	}
-}
-
 bool atomisp_is_mbuscode_raw(uint32_t code)
 {
 	return code >= 0x3000 && code < 0x4000;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index d3d1f2574..937b64ac8 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -284,8 +284,6 @@ void atomisp_init_raw_buffer_bitmap(struct atomisp_sub_device *asd);
 int atomisp_enable_dz_capt_pipe(struct atomisp_sub_device *asd,
 				unsigned int *enable);
 
-u32 atomisp_get_pixel_depth(u32 pixelformat);
-
 /* Function for HAL to inject a fake event to wake up poll thread */
 int atomisp_inject_a_fake_event(struct atomisp_sub_device *asd, int *event);
 
-- 
2.43.0

