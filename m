Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A8037FF6A
	for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 18:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199293; cv=none; b=p4gJva3UficXvy1XQDvYzqFHPgr5zAePhjDW5fmGxF7rshSUc0Bs75pbneLXst77odbvGAwRvQCyC0ao6iHS2SqePvZUpkgCjOT6u0JCbI8gHYr6HEEErDU+N3y7tYy7EwmOjJNsYXLjYBOjGmHdTX+y48oQO9BW+MUBX5DRtDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199293; c=relaxed/simple;
	bh=tOG/XM6h09iKbopfG4HSH27a9d3EpUpHmIenSbpRbCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RxYjIsN19pXDguQneRFEULZ5pnc6obYZcF4aBxu3AtQS37nWgUkPu6YCci3nS1SOaIGHV1355FFlWvDyE1DXi0YmUZ3aMAVvpM1Gw3RIg4220eGEI9Q9W/3cItrYh9gnAC9Yfw7HDmHX2kr+4ndyHGCU4bHgZ2oHdHJ3voPjNbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oyt/6PkO; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oyt/6PkO"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48436668d20so1047502f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 11:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199290; x=1788804090; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SB/CLgILdTURjzN6f7W6LHAoMmDLTtylLqF9+VZGOwk=;
        b=Oyt/6PkOWUFMO79B4Y2kSo4Dna6ZHQvWRXNLj9mrIj+u0WwpqE11DdSRd4FJCYStVG
         wk7qJO/5Z+7vYAnBH8tFzwsJzvjYS2kXjdeqOOlj7gya45jjOK+NmgIAhaJxpiTvkl9y
         Qq4MYBWDaKqOn6VEVFWHpF7DQdq6ivKx6T6+dte5MNILw7UxiRryQsgqWLjf0NvAtXfW
         DPOQT9l6ATiAhZWLzzpwQuVNcZA9b7OXB0Ph3so0ssyuy3zop2pry0hbCCLKM4Mznf2f
         MBZXsvPIGiLl0e8vs5Y6V5jrly5QPjDugfThHbHQXP03FzsALqM/l85hXzHBT0FkA/J9
         vjjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199290; x=1788804090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SB/CLgILdTURjzN6f7W6LHAoMmDLTtylLqF9+VZGOwk=;
        b=extD2N5yAeNZ7BjPXTkwdgtv64tvUkCgtARk7aqwcFmrmwqDnS2Zc5Ghk87HFfeAii
         frdGIPppPE+dtkAxSceHDGUK9pXR08+nfbeS0nPOUDY7UKxyivCgPLgydbN2Gi8vVBN3
         QAEfIs1JCCu0GlGAcd8HxyaUFV+epLh7ovUPQCu33eH9RXwkzs2ipwXKa/oRD8is/5ps
         38pJo1Be+hR3X7LmiEnBf05NRGawt+5FkUOY+e+6TEzUS+w5WKbzpx+tr2ytohnRTTV0
         w4QNjONhV6scPyBWpEoFOf+mLes98dkJH4idU3X9ZWBdxZ8lNtj+Py5k/VsROGyS/68p
         atoA==
X-Forwarded-Encrypted: i=1; AKwUvBwTZxxLSpGRDIByaN+R2GKpoDaWRj5RxcPhtdsTgiros6rbhCklmPXc5hVVZIpAHGe13bfQFzYzktGpJhT5@lists.linux.dev
X-Gm-Message-State: AFuF++nHsDia7F1Ugq5EFI3LXuG68pyeIuAqXQB9S+7bpmsjSNNakr2N
	ueI9ghFepbA5mjJfWgl757IXpzH0G/3ffrJECaHS5KqIinDYBBSL8NZt
X-Gm-Gg: AYBFou2pZHVa6Dz0oETTQiNNsuzddPddyyT/sK1IF5QvSC+YFPDLlmorJM4KWL+vZDF
	8qQ1KA3eGeiu3PqvBX9KSfAyJkcWYcXbK9Z6XvPX3UOMtS2Dl5nDDYhiYziRfHni49kpPJ+I625
	I2Kcvll7797BK2VaZOgyeXr5vzqy3aCUQfAobmO00ksw5u/awkTg9hzZNqhbx2FluS5c2NQI/eL
	qebxAZDGbUgqFEQLaxT5+w2HwAxGjARL9NHtBqYCZ3jirwJ0BTLnDcv0J2p5zAcqovcXbgbFleL
	b2hWq7WMEepCRc5znWCfpGW76s/szAAs9E1ECc5yGUMJSyqyrbFFqg5d5c5IVTcoAq5w3YIpaEF
	BS95GIf4HzWhSW9BFJfgJ03Ha7xO88DwwKOTH4trZ0UkqnN2gAYkeW2YiNOSf7oUO0tuwT18rPX
	ZF84C9MlY1Mh+rxxI1IMO7EN/QFKVKEeU05EFUO2wx297ekOCzvM6bb7linr9o6o6+Kwl7+KZZ+
	ycPAcs/aNcsSBDJDKwnbsgrOsGmlDtrGHjRYzPxwys=
X-Received: by 2002:a5d:5f49:0:b0:483:ca4a:530c with SMTP id ffacd0b85a97d-483ca4a5654mr27868570f8f.18.1788199289663;
        Mon, 31 Aug 2026 11:01:29 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:29 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v5 12/16] media: ov2740: release group hold after gain write errors
Date: Mon, 31 Aug 2026 20:00:57 +0200
Message-ID: <20260831180101.3109854-13-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Digital-gain updates start a register group before writing the red,
green and blue gains. The current error paths return immediately when
one of those writes fails, leaving the group open and never issuing its
end and launch commands. Later control updates can then be accumulated
in an unfinished group instead of taking effect.

Once group hold has started, always attempt both commands needed to end
and launch the group. Preserve the first gain-write error; report an end
or launch error only when all gain writes succeeded.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 drivers/media/i2c/ov2740.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index f3d91c87b3d5..5f381b7972bf 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -696,7 +696,7 @@ static int ov2740_identify_module(struct ov2740 *ov2740)
 
 static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 {
-	int ret;
+	int end_ret, launch_ret, ret;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
 			       OV2740_GROUP_HOLD_START);
@@ -705,24 +705,21 @@ static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, d_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_G_GAIN, 2, d_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, d_gain);
-	if (ret)
-		return ret;
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
-			       OV2740_GROUP_HOLD_END);
-	if (ret)
-		return ret;
+release_group:
+	end_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+				   OV2740_GROUP_HOLD_END);
+	launch_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+				      OV2740_GROUP_HOLD_LAUNCH);
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
-			       OV2740_GROUP_HOLD_LAUNCH);
-	return ret;
+	return ret ?: end_ret ?: launch_ret;
 }
 
 static int ov2740_test_pattern(struct ov2740 *ov2740, u32 pattern)
-- 
With Best Regards,
Maurizio Casciano

