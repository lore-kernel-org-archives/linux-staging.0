Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203AB3E8C41
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 20:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173176; cv=none; b=CLZoeAZfXRZ1c8HCSymjkrFqZT7YTzpZJe/uJj/016Xrakyup9eSRuqB8KkM6fMUH6Xn+d/LWtppvVZP2cFEzkZfQHo7JXd5KikEjP4PA6qE/SAHHJQod3I/mJOy89LQo3FxqQvv+uxbuvZG8mvRqdfMyqRyDLooQgvlN97qgwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173176; c=relaxed/simple;
	bh=kDaS0oBBZ1N5fMHKwDDGFI1Ivj7HNRUlOpYXqktu9XU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GTNkLqMBXtbCoxQ+mLyhbhSQrwMGwjgBJnk/WYlb2hMBW/X0CRW4q25HFmWkf3BsHhTqUYTCzasC1kKAB6wZiSef6fsfYeKb5u8zBmA+9XZAg4cAmt5JtT7z8LorDQSyxHcgVSo8n/ANH7yNWIjq4VVaSmto7fLsK5sCAVMGDT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DlKho2yB; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DlKho2yB"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-829756f3ee9so5955258b3a.2
        for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 13:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173174; x=1773777974; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+FCnsZqgY0C/inqnWcqsCfogd4Ir01+XklcEE3giunQ=;
        b=DlKho2yBgwFt86Vh1PqqNf8KKFadOkrAmL0h1O2xhrxF/u2qn8+fs1oKSmLdb8jGhC
         vMK+IhFzAhteedpXc+d2cGEZ5LdewqLOHgMlvLfwCiCdHsHsi4A/yPETekLw2/M/z/kk
         sVDBzmKpn6KOhYQ1i+Xx71Eft3gEMNUfyUiw+k7lj6/JYzLYN4Dukp52Wae/440yg42o
         KTJAp6P4Z5tP3ncUQWmTvhPFHwHxjohIjnHq6Wwdyvz6K3WBllvFXgxw7Qo4d/EUnn0G
         rsolyvmcsMia+fvq53zFanwk2TD4McHYdUnu9rZJeoptvn9Hlf7MJocfi8jP0yHZdKoU
         pZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173174; x=1773777974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+FCnsZqgY0C/inqnWcqsCfogd4Ir01+XklcEE3giunQ=;
        b=AgcdbtMHfDFvyopif3oSIlu+Tw7mTBq8jkNMDHAPBv8bRIAgLZpFn9FEJWEOYk5+VT
         lkTwO6wbXt0sojGCP1LZGd1xrUdMfZCMc8dz/S9N29gi49s8lUl36iCbyih6AlO/HyfQ
         TjR8add7Ny9BfKhkqwAnt8h++Jrw9nEXxYI3qag/Z/T84MJW8Y35td0Ko/o0eiObvJ7x
         T8Tmz3HRtgF1Igay+RFPDDaNHfZZcTXsQ5K1Qu3XAY1H9b9Y5AjAI5SsbMtVYxtQdPWG
         pQG4YoHP2p6E8cKqs5hgN1MjK/xsEEL34R6nEah0gd5JOxXDfJ3D/pVWwHM726tHRlgK
         WKCg==
X-Forwarded-Encrypted: i=1; AJvYcCXUQvZyl/uyS0j5y1xXPd0AQslsnliNMsFRLGa2Bw2Q6lLvpOnmKFeJcKIYWpI5UIFciIr/Bhot9C1xPEyo@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3/QFfCWRs39l4AkduQXehaVYxG+MCAyYSEdBE2nkZxKyppCgK
	lxSJVqWyLEm9zTfOBA7VYRThwR/uPc7I2PxWkZ8VxAPkdFrB4GNgfqHc
X-Gm-Gg: ATEYQzxBj46tyXzGir0fxdDp/nu76sc61Sgr4ce5sxtIjJEb3HQarrkLdltDKA3tgFT
	MZnoCNrjV2Vj8NIGImdUai+Wwi15K6QApvTVDvUzjBFxGK5vWKq8+73JqN6iA9UW76bw7vjAywJ
	6cerPzX1kLND2LAyRfPcAl/D14vA6Zi3JzHHiZMTxizWUaDapLlCsaq17tkpYAzSCXAsKsrTTut
	iYabBX4UpwPacTdzAKckYXdGsLunIemB7OEAxc+bg354parGUXUlFqSj/rZoR/b8PFoMSHjBo9V
	R17QTFUZBhqXHaf49WSiKXl3xXOFLDcSCV1p+qgB+LXHz/hPNK5mIhML/WDWePOpHQ33czf7y+t
	WY8TJK7KyFZ3rpksjyY8HR5kWB+OLR4Oo6YS5AbgTTkeMOGRuwTAaIHv4R3/MZAjSJc6Yjela/B
	ibRQtFqSL1sOLpHVEtnpfICr6iUekR+xd8QOoH231b/UOAj9oA
X-Received: by 2002:a05:6a00:3d4e:b0:81c:6ca8:7ff8 with SMTP id d2e1a72fcca58-829f71c43f1mr119633b3a.61.1773173174414;
        Tue, 10 Mar 2026 13:06:14 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm101660b3a.13.2026.03.10.13.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:06:14 -0700 (PDT)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: jic23@kernel.org,
	m.tretter@pengutronix.de,
	mchehab@kernel.org,
	p.zabel@pengutronix.de,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	kernel@pengutronix.de,
	kees@kernel.org,
	nabijaczleweli@nabijaczleweli.xyz,
	marcelo.schmitt1@gmail.com,
	maudspierings@gocontroll.com,
	hverkuil+cisco@kernel.org,
	ribalda@chromium.org,
	straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	lukagejak5@gmail.com,
	ethantidmore06@gmail.com,
	samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com,
	s9430939@naver.com,
	tglx@kernel.org,
	mingo@kernel.org,
	sun.jian.kdev@gmail.com,
	weibu@redadmin.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	sanjayembeddedse@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH 4/7] media: mediatek: vcodec: simplify cleanup using __free
Date: Wed, 11 Mar 2026 01:35:10 +0530
Message-Id: <20260310200513.2162018-5-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

Replace manual cleanup logic with __free attribute from cleanup.h. This
removes explicit kfree() calls and simplifies the error handling paths.

No functional change intended for kmalloc().

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 .../media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c   | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
index 2da11521fc7b..3184939f793a 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_dbgfs.c
@@ -96,7 +96,7 @@ static ssize_t mtk_vdec_dbgfs_read(struct file *filp, char __user *ubuf,
 	int total_len = 200 * (dbgfs->inst_count == 0 ? 1 : dbgfs->inst_count);
 	int used_len = 0, curr_len, ret;
 	bool dbgfs_index[MTK_VDEC_DBGFS_MAX] = {0};
-	char *buf = kmalloc(total_len, GFP_KERNEL);
+	char *buf __free(kfree) = kmalloc(total_len, GFP_KERNEL);
 
 	if (!buf)
 		return -ENOMEM;
@@ -134,7 +134,6 @@ static ssize_t mtk_vdec_dbgfs_read(struct file *filp, char __user *ubuf,
 	mutex_unlock(&dbgfs->dbgfs_lock);
 read_buffer:
 	ret = simple_read_from_buffer(ubuf, count, ppos, buf, used_len);
-	kfree(buf);
 	return ret;
 }
 
-- 
2.34.1

