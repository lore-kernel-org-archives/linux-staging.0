Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BC04734D3
	for <linux-staging@lists.linux.dev>; Thu, 24 Sep 2026 11:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790247798; cv=none; b=dBQ9qyUrpLSkF1hM81x7XOfHEvXwrtXLD4L7IW8VnzdafyNY05AN4hF3YkxExnocmOIkp4FPbkp5z7K0w3H1BvB9Up8RJeWgKbQ9FLWwvPRbY1cr8nt/LfYsudW/mN7g73v/DdCf9jB+CAux114FNwO6bijvjrYE1UEtItDvTEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790247798; c=relaxed/simple;
	bh=aO9jXqxRqOyTTCrOYU5B+DX1uyFV7Lr1IqEsZ1j3xU8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LU8HYwKUPbvsnRUguG6PnRDCa4rxN2WI1t1EZnw8MBrSFnyu1WaGsRFT7kQfiDTz9VTb4gtCnDtdqHJHDGhBI0P3nDjP5lP74l5zmgkhHGoTTa8AYZoGZZX84BCcAH8Oc5gbhrf2eIvmDRIydlTfJq2KvXafq/gXrtN+Til7LwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CasZTN/D; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CasZTN/D"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2ddaa08c890so9451955ad.0
        for <linux-staging@lists.linux.dev>; Thu, 24 Sep 2026 04:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790247797; x=1790852597; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nIbhax5iMWz0Nhglod4QvaTZFTgtc4d508WTfg8CcMM=;
        b=CasZTN/DXPRyUAbNQnFyt7lqcIrMbsVm9eLLQTkN5CxvBelRAp4NdkLHrhHp2rpMBE
         ngyfxFwukkhnRdiSI1XmyuFEIC0Gw1UDyi4ME7AESoPc0l+z3QysKrzIeFDWXkpzytmN
         wtzUmgcSr2fRoHXDlI2T5sAIcyKZVj3clxJzl9YF3WeK1oPL7bqekdfP1AfjOUlpHAuu
         zpmTjYEnvic/QU8o13fLfKtngjkZ3G/1zMOQClIXk5p+3G/bVU1gx6C87zE8KNv5OB0/
         SJDFiYQYpjqCJGdT7u1s2k5I/MODtWoyTHj+04jNqUMCjaRGplBKIKUvXBtgNT6C2y9V
         2lxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790247797; x=1790852597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nIbhax5iMWz0Nhglod4QvaTZFTgtc4d508WTfg8CcMM=;
        b=Y61yoTQFtwtyLEeHEDPOoBVSKBFB7cJEhcYB11LKVJzaxBKh11f6Heti8rlcq91OIG
         +/A7H5FmdDelD7GsVjVByyfQ4q/o1/sKI7wyjWTUpEHMeLIjf5k7WezFpQ94AMz7p5Zy
         qt8s9GpzaOdVe/UQs6FPpqDkYxH2ZYABFPnSHU8A4kUH8/3t17IRRBAJb33C457KG5N1
         22aEvnycPrOEZIe/a7BmhJ1JLAMu+jTKyXvGYJ78LeSpQMjaN09RccCtS4/f32z19DtD
         hAak866rqShog/BRcQF6gj5YDb8SPW0lVgiXuktPXwJdK8lMitJDLfie72xp7nZxIDdS
         isWw==
X-Forwarded-Encrypted: i=1; AKwUvByFQRwnGxMzkonu7vwz6uuINQ2P962Fx+spGxRwk8tl8kgw5he3mdT1RNP3vVdTXXmpiLO8L87v2F0Xb26G@lists.linux.dev
X-Gm-Message-State: AFuF++kld1agJfcAqcfjeypSiZBoUhH1rrnc/AsD4DoRo8OjQCYKHL5f
	rfUWKHFt1iXUuey6Zt6WU39grrVmomR/ILf92RAj/33iaEZJ+STB7BBa
X-Gm-Gg: AYBFou2eivhbOoz7RUGDpFjPQXjkdKQYco2bK0vmUWh3UjYxMA6y3Pyq+M9MCIZNWEU
	+aP1XQeEFsblgFmeBlzqTww/nsFBSeiDCHr4uRxXidbWqAa+Y7O2KYVYcJjWP3Effts2mmZkI5z
	nwUiAQRcVssfai+QVtexzafGnoex6KOjkDKr2Ze9zCHuOrcLBr0dOpdHw4BPFMDdFt9XzeExIik
	0NPE00/hob1sE9QphJkmVBvVVx0/itEoqxuCFxx9TH8HmHTQAANW6S0TdrB/UqGIHDThcxBClts
	I8oeQ0CBUXp0Tk4JoWSr01djOk8QVlCUZBADTTeehXbZy9zukg8N0G/pwUbB/vhR1fBLHVoWQfw
	9CjclZb5Aq8R8N3FcyqQdEQKArJ+tC5arEn2Wxa1Moy28NAu1pBArUXtzAsmsvTTMxo+6YwCc3F
	BYv0H/3irxD/VgCRsFC1O1ReTa6RkGv+p8xtCGg9XhwrKzH+XTXQmlzg==
X-Received: by 2002:a17:903:3846:b0:2dd:c100:7cc4 with SMTP id d9443c01a7336-2df7dd73ad0mr16876665ad.64.1790247796414;
        Thu, 24 Sep 2026 04:03:16 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5c3733sm24724005ad.41.2026.09.24.04.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:03:16 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bingbu.cao@intel.com,
	hverkuil@kernel.org,
	lgs201920130244@gmail.com
Subject: [PATCH] media: staging/ipu7: release ISYS firmware resources on remove
Date: Thu, 24 Sep 2026 19:03:10 +0800
Message-ID: <20260924110310.1555150-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

isys_remove() tears down the registered ISYS devices but does not call
ipu7_fw_isys_release() after a successful probe. The probe error path
already uses this helper after ipu7_fw_isys_init() succeeds.

Without the matching release, resources initialized by
ipu7_fw_isys_init() remain allocated on normal device removal.

Call ipu7_fw_isys_release() after unregistering the ISYS devices to match
the cleanup performed by the probe error path.

Fixes: a516d36bdc3d ("media: staging/ipu7: add IPU7 input system device driver")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/staging/media/ipu7/ipu7-isys.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/ipu7/ipu7-isys.c b/drivers/staging/media/ipu7/ipu7-isys.c
index 601e5a79ef8e..a54393fbb9db 100644
--- a/drivers/staging/media/ipu7/ipu7-isys.c
+++ b/drivers/staging/media/ipu7/ipu7-isys.c
@@ -590,6 +590,7 @@ static void isys_remove(struct auxiliary_device *auxdev)
 
 	isys_notifier_cleanup(isys);
 	isys_unregister_devices(isys);
+	ipu7_fw_isys_release(isys);
 
 	cpu_latency_qos_remove_request(&isys->pm_qos);
 

base-commit: f03c39de3a1307371a4032757cd1732e91087c7d
-- 
2.43.0

