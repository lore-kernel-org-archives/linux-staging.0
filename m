Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFF239DBD4
	for <linux-staging@lists.linux.dev>; Sat,  4 Jul 2026 08:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783153902; cv=none; b=mXxZuVK2yPgXAvdB4LWPu69fhCQGM9ZTqHyZRIseGE9qkMr6HzR1/5AuyRZFR1g+KiD2/hKmGWiZuAJu3BLWmeOVOv06gBFb1Ef1u40WBZS8oNn5XiSHtb3cXvGnWh1+/1bMvyLrvMv2HH6SPtATd82L9/Os6CFSrXKh3F6LDEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783153902; c=relaxed/simple;
	bh=y6mNeTzCyc08DlRJ6m8uHGdrjccntn+S5pSqgS1q7kY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UccRvpgLSJ4AurRuVc4fFB+LPW+vfNjoDEInndZVOlIAixqbwceb9wUEMW6LZ2rooQiJJRQJyG7DmNrfo/InDCKSky9xa2/zgHXvk+IRdf4HW18g2n2pv6j09aMREHUBLkqailzJ5+4oSbguvi711p3T3E0NyW8+7Z4Ul+2X+Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T9RMve93; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T9RMve93"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-37defb2f231so861775a91.2
        for <linux-staging@lists.linux.dev>; Sat, 04 Jul 2026 01:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783153892; x=1783758692; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6SKjOfWBF6wFcd/KZhxMJdBWrz9gubI4LNJ7uJpHMQs=;
        b=T9RMve93fg2aQRLOR9gh41DOYEhJBrDsl2H9fusewTfaUzgdB2YvsV+jaWgCfxGBKR
         mQiMCx5+xZYA+bc1Mi/VW4FlH5KOk/qJwFzQ47bhUc+dBzlVRmjYN5Qsf/NaTT4NiU32
         o58P7bsU7jroqqkebb3sOM1afIfPclxKAwNh1++fhOZiEsi64kYenfcOw4gTnU2bi7Je
         72X7iKfenYXJlSvhXtckJFkBZQAXTWrNYrZ9vTDVBKnTUhhYF1pfvPcRwON0ppI7Jzxa
         pCXrhQ1WYD2h0mlfkyiaNd2rJ+W94vUy4EqFtOELGRUcapQgPYcVaJU4HaqF+onftDm7
         6hmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783153892; x=1783758692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6SKjOfWBF6wFcd/KZhxMJdBWrz9gubI4LNJ7uJpHMQs=;
        b=lyJaA5qyv9l47E/Q9udrXpOx4ToWnj43nym7lpAvD0bnyUWja9bEL+pe4UKiUnXTGQ
         Kia3yuBZGQ5oEM8/RpQTxoAMBDriI3lPwj3fM9ZXhj8116u2hAZJSesoPyPQk07rhs4R
         lUt17aoPkdfzhy6ZJQwL/Bu/f0+2VrSANkqnoERc2hl+NY0J2LxOFmojQiTKwA/NsvSX
         1SRQrfS4t71ECuJk0lALrAda81daTC4p283+lhUoxrOdF8iemjRfJqeA1vRv/4RNNUcY
         21bkLlE+7bglxHY8VumokgxyLrFOnTkMB8KeUAFe54cfPXiwgsNgJeJ0pWpx16JglnDi
         qoBQ==
X-Forwarded-Encrypted: i=1; AHgh+RqMTwC/eqIfeAPq0Zb1GmPt4fquc3xyr1c7M+zl2tjhAjhEEbIVLIz8M+KCyO50lXhLGmOeLmf78r9h3vo7@lists.linux.dev
X-Gm-Message-State: AOJu0Yz47w/42Zw4qGTg5RMmE4i6hGv8b2LsAVzrZl74P86r/KlxFeWP
	4B4u5Bbp6fA/NI7z0RG+GKyZIYBjY58icaykFaGbl+bOJEnIdArSvxAW
X-Gm-Gg: AfdE7ckcu+jlhkQRavUpGvZ0wymanij+t06cv5P9r170VGpBfzHVvl+En9ybY/oLHvU
	+GqngrA+JS9sL/sYFjidncyHhauJWER+Ec+MBg/WEk1HgR1+U8bBw0MlNWDCx4pYmVmpf8Gx1PF
	mAO9Bcea4AZRrkW03QTa3xOR4FsC136+fk0LdKTzdr+IifOFXq3bqCvyf94sIXKt1XdNMWm+COz
	IlLTr9uMUlrAf9zLzmM6ut6zR9oEwfPMnbicz5uD4XlBCZZ7NrX0Vq/PgUGtqjOsSI7+H37eGzL
	37cH2tufeAharA5IIeNYcIwtVNtJkoPfTGrGPCMKuTKG+53BDfw933hjLB0BDDfAzKLbz9okbn1
	ytgj+ufKSgqnNzz/XAfzGSo7w3EmOKBnSnvg4ocu7fJd6Uz0cnHa+AzOuhw0qOpogcWaUUPVwEE
	0f/3/E4c9icHLt0QMYggiFrfba2SGmbFFwJtl5JnBYWRNbWcrelbAs
X-Received: by 2002:a17:90b:4d88:b0:37f:d9dc:557 with SMTP id 98e67ed59e1d1-3829d70cc3bmr2590824a91.16.1783153892139;
        Sat, 04 Jul 2026 01:31:32 -0700 (PDT)
Received: from primary ([223.181.23.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f376bf710sm10074745eec.6.2026.07.04.01.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 01:31:31 -0700 (PDT)
From: Vidhu Sarwal <vidhu.linux@gmail.com>
To: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org
Cc: bingbu.cao@intel.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	kernel-mentees@lists.linuxfoundation.org,
	Vidhu Sarwal <vidhu.linux@gmail.com>
Subject: [PATCH 2/2] staging: media: ipu7: fix pm_runtime refcount leak in ipu7_resume()
Date: Sat,  4 Jul 2026 14:00:31 +0530
Message-ID: <20260704083031.8524-3-vidhu.linux@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260704083031.8524-1-vidhu.linux@gmail.com>
References: <20260704083031.8524-1-vidhu.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ipu7_resume() calls pm_runtime_get_sync() before resuming the device.
If the runtime PM resume fails, the usage count remains incremented, but
the error path returns without dropping the reference.

Use pm_runtime_resume_and_get() instead, which balances the usage count
on failure and avoids the leak. Keep returning 0 on error, as resume
callbacks should not propagate failures to the PM core, matching the
behaviour of the ipu6 driver.

Fixes: b7fe4c0019b1 ("media: staging/ipu7: add Intel IPU7 PCI device driver")
Signed-off-by: Vidhu Sarwal <vidhu.linux@gmail.com>
---
 drivers/staging/media/ipu7/ipu7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
index 056af3a07507..48a35bda4237 100644
--- a/drivers/staging/media/ipu7/ipu7.c
+++ b/drivers/staging/media/ipu7/ipu7.c
@@ -2702,7 +2702,7 @@ static int ipu7_resume(struct device *dev)
 	if (ret)
 		dev_err(dev, "IPC reset protocol failed!\n");
 
-	ret = pm_runtime_get_sync(&isp->psys->auxdev.dev);
+	ret = pm_runtime_resume_and_get(&isp->psys->auxdev.dev);
 	if (ret < 0) {
 		dev_err(dev, "Failed to get runtime PM\n");
 		return 0;
-- 
2.53.0

