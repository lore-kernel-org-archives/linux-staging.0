Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D835948B396
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 17:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784136646; cv=none; b=uN0GD15Ls8A6Q+r/q4rT3S9Ys5sTP5lYpUQ0ut4D/JzEqu/LvN0MvOHh/ruY6z9KRbX4GBJmax4Ty26rYambN2mR0UNcpw4zYrffwSDzgS4kgrbqNJfIJ/gPEQfdcuxdQ2/U0q/WKPw53T3aMcerGd8sr64+VjKiwib4PepWnOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784136646; c=relaxed/simple;
	bh=l47BE7pUOntdEn1Mu5nMlzXv1Lh4KNOOZ4NVwlROktM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qw2u/xd+Pyxl0vAjTov174S/StoxwlWx2++Bm5sVcHlLElFbBDsE+sTV7RuRfm2PVkcqeXIzbsw00BEyked1GD14yCZ7ByyOvpftzS4PhzE0IO+BVmUxi388p+64md0NSXkCYigNLU3e+09Zpm3pV/FxsZjqCdDCw2r+9QVtKgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZ0SxvmB; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZ0SxvmB"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47dec32798aso5937420f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 10:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784136641; x=1784741441; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tJeFAR7iwdWGDaIC40OEbm2UHXdTFtuNScwJl51xzPY=;
        b=RZ0SxvmBtQbxBmjPVHFl9eKNMMQBh/dORi59zDOptcwTEl5t7nA1xHlqkdzFD5Jbbb
         gzj5wxiZ/qSgUdBCWum6iWM4CGcz3MICPxKiuwACBiOQLfuh/ibjr0fZ3ANbmsmwLRD6
         /VQ++QyF14FR4JPiiOqXw5lv82Pa+Pm6TK8b6hMWpCAY96IQzsVkO5vF0Pwi21Ghoq+o
         3Ypw1IiWdg0m65+0uC6pIBf6bHG7/sBY/4RamVY0kmGv27xA1eEobDND0hBgGflNqw+6
         HzQBQKCFOJSOr/oaPCrGLDPXngD2UiYLNq7Snow4X9HfHY05VSXlLM9PAOe91pWr+gBW
         ATXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784136641; x=1784741441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tJeFAR7iwdWGDaIC40OEbm2UHXdTFtuNScwJl51xzPY=;
        b=n4KKC6Y4CUAOq/V4eGyt3pGeHhIe5M887nUmhN3eA4sZCDfUwe23H6A56fhsdXE8r8
         HG7z8/rwSokVft3iziJDbOUNTtq6o8c6Qpa0d1Nj5RgOnaE0wmNIzHnnF72k3ZQOCg9z
         mjvFv4X0MUo6ITw7ldRQVOeKirJPTXo0rVN0uzsU35i/vb/LDHcHvWPBuiX+K9WVGkZ8
         sjgtYsKgacZm4n5yPaqYhazeEbPpBxmYAjG6GzNzB9ROvqnSZ1p8yPgKEWYj+DAhjTqD
         U5IMKV6F9eu8SzIQZPG5KoQtP+fDrryd+RLTxSrFtpvGfO47JrXiUv9iWVD2fINLLoid
         B/5g==
X-Forwarded-Encrypted: i=1; AHgh+RrURPvNNeB/evOZxvQ+hTu137TEQVFUfQVIerXbVpt9bZ4DCM9b65h49OgTp/jjcykzZvF9K+Cn3pGt3Qj1@lists.linux.dev
X-Gm-Message-State: AOJu0Yyo2CcolrQ8ygHnujMtAerWyAuBehzE4Zqavw5zxBId9i/MAxfr
	Vs16VkLEN1EAadwoTl3/JdCG1eyIj/QJ6nEaGAqmyDZ5V0jeRMm9KOUT
X-Gm-Gg: AfdE7clDx/bvu9H+/3jiQkAyP73vALBMXcmAY0td54LM6x2btxXxyHhX7vDjUKt0NUV
	DKewgZYEVEh3wtqlBlzIrvDoNZlNGreVEXFs7IryyhbZKTicq4g1lpBYVTlfoEdZHI25JBuc8kN
	pnUlixAnIMu0byIA7aAjPBJYMVQEA/OTx+C63ia3nWZhiq1pTuvZ/jCm3INXoBa68BIMbNRb8ua
	OqshlwuUPK3cKCKDt4GnTyUioZSSfDSpYLClTIKvW2qyx5GTrl0IPPkIpVaXtXfjLdIFrO5Gqab
	HxWV72PHb/xYOkR0mvI9288XF4D1qiud5aNTHaO4yUCpWt3SJym8STUJd8/VjMCCP2+P8w8/JQb
	tgEy2whHpBTe1+DHrR1G+BD8K6GOftHlgXsvDUFCSDFaq4KMnJPX9i3DYVBOITsuliAWO2gwB5R
	R84yoWODn/63yguzDF0BFbZpMV5xw=
X-Received: by 2002:a05:6000:18af:b0:46f:7d90:8128 with SMTP id ffacd0b85a97d-47f4885669dmr9952433f8f.14.1784136640969;
        Wed, 15 Jul 2026 10:30:40 -0700 (PDT)
Received: from Ubuntu.. ([2.147.165.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635082csm17997981f8f.7.2026.07.15.10.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 10:30:40 -0700 (PDT)
From: Mohammad Davoudi <mdavoudi2011@gmail.com>
X-Google-Original-From: Mohammad Davoudi <MDavoudi2011@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	rmfrfs@gmail.com
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mohammad Davoudi <MDavoudi2011@gmail.com>
Subject: [PATCH] staging: greybus: Replace sprintf with sysfs_emit
Date: Wed, 15 Jul 2026 17:28:58 +0000
Message-ID: <20260715172858.17658-1-MDavoudi2011@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace sprintf() with sysfs_emit() in sysfs show functions.
The sprintf() function is unaware of the PAGE_SIZE limit of the sysfs
buffer, which can potentially lead to buffer overruns. sysfs_emit()
is strictly designed for sysfs attributes and inherently protects
against buffer boundaries.

Signed-off-by: Mohammad Davoudi <MDavoudi2011@gmail.com>
---
 drivers/staging/greybus/gbphy.c | 2 +-
 drivers/staging/greybus/light.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
index bdb0f5164..bb9a5b538 100644
--- a/drivers/staging/greybus/gbphy.c
+++ b/drivers/staging/greybus/gbphy.c
@@ -31,7 +31,7 @@ static ssize_t protocol_id_show(struct device *dev,
 {
 	struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);
 
-	return sprintf(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);
+	return sysfs_emit(buf, "0x%02x\n", gbphy_dev->cport_desc->protocol_id);
 }
 static DEVICE_ATTR_RO(protocol_id);
 
diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index cab02b5da..2689f9a75 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -173,7 +173,7 @@ static ssize_t fade_##__dir##_show(struct device *dev,			\
 	struct led_classdev *cdev = dev_get_drvdata(dev);		\
 	struct gb_channel *channel = get_channel_from_cdev(cdev);	\
 									\
-	return sprintf(buf, "%u\n", channel->fade_##__dir);		\
+	return sysfs_emit(buf, "%u\n", channel->fade_##__dir);		\
 }									\
 									\
 static ssize_t fade_##__dir##_store(struct device *dev,			\
@@ -220,7 +220,7 @@ static ssize_t color_show(struct device *dev, struct device_attribute *attr,
 	struct led_classdev *cdev = dev_get_drvdata(dev);
 	struct gb_channel *channel = get_channel_from_cdev(cdev);
 
-	return sprintf(buf, "0x%08x\n", channel->color);
+	return sysfs_emit(buf, "0x%08x\n", channel->color);
 }
 
 static ssize_t color_store(struct device *dev, struct device_attribute *attr,
-- 
2.43.0

