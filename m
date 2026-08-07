Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBA837CD40
	for <linux-staging@lists.linux.dev>; Fri,  7 Aug 2026 16:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786118527; cv=none; b=muUT1YKp/V5XupxONdg2LlS1T2fNsrbCoK2J7xQhlhNE1+YxdtdaiHl45BZve2eUNU+BOuZ+zBqEwH9AFctdabtdgTHeU/ehr0hNeKnPmqIDVx1irpv8nR5/RBIAlUlLRHQEp/dgGk+oU1xvqo78wpOB3o4K18K3wGhOAhgxIjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786118527; c=relaxed/simple;
	bh=EM4Vhda4iANKw4zH1mLVyegOjLPWicuTh1IS7OIaYHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BRf1GRIEPOeg7Ue6+Ss2gfVb6yhwLesVMYdlX1s4Ed3Q6uDrdveRiwFblt0gzO/tYZdH4c4ZczwdBdmRXlIGNTj50Qp4uMG0uURbyrwjh+5ep40i62ZSJ7BVc5nZLEqIBWdLPVByLB6V2wYoEZmYwys4dYjBWrtdyMQ4A4bpXXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPu2g9M6; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPu2g9M6"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cfff5f88dbso51892405ad.3
        for <linux-staging@lists.linux.dev>; Fri, 07 Aug 2026 09:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786118526; x=1786723326; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a53gzyAyuQlXypxOv3PMFxi0c3UAzkrW7E7a+SiDOU4=;
        b=EPu2g9M6fWe9StxTcxi46stDDESm9N0zt6BLn8VgyFbvayXBf5Ne3RKHeVs2kK/uS7
         pkHkSstA9phIFVr3q8U/2G16NvVhM3FZvfiltGp7JAxraZU3nnhiEy5ixlYrp5HuFVJv
         utgMh08cHo8+0vIX1rkwT/O04Qjwxks10J5yoxehhexWkE2wmeBiDCKyNsdEfuANfsQw
         XCwbpNQud9gd9Mi4ZsZOJsJP5VxXrscuw1c/Ag8BhcFVvMyP1yn4hs4R45XRRlowXxBn
         xwu47szrDjdV8ERNHa0ksfEFooT4CeIHVJNzrri93Dnm7N45AhyFc3S3/b/K17xYm+t6
         SJ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786118526; x=1786723326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a53gzyAyuQlXypxOv3PMFxi0c3UAzkrW7E7a+SiDOU4=;
        b=MeqPd9Pe23rlux3BczhsLscUfb5u0uc8cg2z1WcPMs6m04Nk2yazQFxf1CA0o1Rw/4
         xG2EZvEHAmb8PJgi5x8DSaommVd6J32gp+HZFnHaEr1FrxKlM6mK9RG0Ax7BFHO+MKGr
         Rs/kpk+3rRm+T0n8v8rpd3pDcfASZMvokfT+PFfgE8ztajoBczF8K3axsg+CMJn3TeT8
         Lp8HQzIhiQfBPqjbgaxyvIb686V+tPTqQ5kx/huFWKTFPapvXKJEtGqh64n9UU0oDvIA
         +tcvNlYFRmRal/Ks4C+9ldzgp0WisT3Zg6zMwvab+adrG24TMtP2RkC8zvWYSpHTZ4Yo
         FpFg==
X-Forwarded-Encrypted: i=1; AHgh+RoyyNkLrHFsWCyLRpKazhXkciDMn45cgN6LBRfxDX/c+91iti+FIHfn2mivQMNSTki99mLPNwgicn71ov33@lists.linux.dev
X-Gm-Message-State: AOJu0YwAG9dTwlfQsF9nisiUYbMxWq6ax3VeuzwV1Xr/3QCb/pcMVJsK
	5vFK0SLy6PToyINauRy2l3zZ2MaWc5nJekyPaUU3Y+EK9KIXQbxajNmw
X-Gm-Gg: AR+sD136zt03aO7ul8M25yeLNWXT/WYg15ErHNKaIQ48pyVyy49br48BLCH7ZUkTDpq
	4etYukfvm5VJXYnAI/UprUONp86kv76nyb0whaSPZU3m677xy0tz6EKU9uJS4BEzKtg34O9r4z/
	CMhkxj7bLrzRFT2YgP2lUAoOtuhPsO5OyjKZs4a8Qe0yiK+x4gKv6kWQEyZH1MskUf9okojFZ9r
	2lmED5FQK8SfMGvrcaY7t3AV/sNZzyd/0/oWFgQjWvWCkMYQjHLDNvHnaBkat1zPrN0pKPS+RvV
	OcxiBnxViDx+5JEXS1nX6bYzhEo8C39F42RP0VQHelgkTkxlGqX3yoFUVf8R4cR8mg/JBod3rb3
	H/8Zc45koiiFxEYsE41A9eixi/WmdhB134LGsMM4OKuubwYmbfjGNqQrz/PeCL4v8iSQb8QMNXp
	LRGO+0/OewWmMYRfyvzmaX58aP0yee03W1/hWSkpGeZw8nzJzgAMZJyChUIYhRANTE0+Ijqxxgv
	SFaWGr0frHPx4HRAkz/FA6HOD++LQ==
X-Received: by 2002:a17:902:ccd1:b0:2d1:1a28:10d with SMTP id d9443c01a7336-2d11a280465mr102386685ad.18.1786118525413;
        Fri, 07 Aug 2026 09:02:05 -0700 (PDT)
Received: from localhost ([2401:4900:1c70:5a7c:d1d2:a457:c3e3:35a1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bebde353sm9884952eec.23.2026.08.07.09.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 09:02:04 -0700 (PDT)
From: Punnay299 <punnaysharma805@gmail.com>
To: gregkh@linuxfoundation.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Punnay299 <punnaysharma805@gmail.com>
Subject: [PATCH] staging: media: av7110: fix sp8870 initialization and hardware communication
Date: Fri,  7 Aug 2026 21:31:49 +0530
Message-ID: <20260807160149.41580-1-punnaysharma805@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Address multiple correctness issues in the sp8870 demodulator:
- Fix BER reporting in sp8870_read_ber() by correctly ORing the upper bits.
- Set state->initialised only after successful firmware upload in sp8870_init() to allow recovery from transient I2C failures.
- Catch partial I2C transfers (err == 0) in sp8870_firmware_upload() and return -EREMOTEIO to prevent silent firmware corruption.

Signed-off-by: Punnay299 <punnaysharma805@gmail.com>
---
 drivers/staging/media/av7110/sp8870.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/media/av7110/sp8870.c
index 29fb4934c..def2a7f0c 100644
--- a/drivers/staging/media/av7110/sp8870.c
+++ b/drivers/staging/media/av7110/sp8870.c
@@ -68,7 +68,8 @@ static int sp8870_writereg(struct sp8870_state *state, u16 reg, u16 data)
 
 	err = i2c_transfer(state->i2c, &msg, 1);
 	if (err != 1) {
-		dprintk("writereg error (err == %i, reg == 0x%02x, data == 0x%02x)\n", err, reg, data);
+		dprintk("writereg error (err == %i, reg == 0x%02x, data == 0x%02x)\n",
+			err, reg, data);
 		return -EREMOTEIO;
 	}
 
@@ -135,7 +136,7 @@ static int sp8870_firmware_upload(struct sp8870_state *state, const struct firmw
 		if (err != 1) {
 			pr_err("%s(): firmware upload failed!\n", __func__);
 			pr_err("%s(): i2c error (err == %i)\n", __func__, err);
-			return err;
+			return err < 0 ? err : -EREMOTEIO;
 		}
 		fw_pos += tx_len;
 	}
@@ -315,7 +316,6 @@ static int sp8870_init(struct dvb_frontend *fe)
 	sp8870_wake_up(state);
 	if (state->initialised)
 		return 0;
-	state->initialised = 1;
 
 	dprintk("initialising frontend...\n");
 
@@ -353,6 +353,8 @@ static int sp8870_init(struct dvb_frontend *fe)
 	sp8870_writereg(state, 0x0D00, 0x010);
 	sp8870_writereg(state, 0x0D01, 0x000);
 
+	state->initialised = 1;
+
 	return 0;
 }
 
@@ -401,7 +403,7 @@ static int sp8870_read_ber(struct dvb_frontend *fe, u32 *ber)
 	if (ret < 0)
 		return -EIO;
 
-	tmp = ret << 6;
+	tmp |= ret << 6;
 	if (tmp >= 0x3FFF0)
 		tmp = ~0;
 
@@ -511,7 +513,8 @@ static int sp8870_set_frontend(struct dvb_frontend *fe)
 		if (valid) {
 			if (trials > 1) {
 				pr_info("%s(): firmware lockup!!!\n", __func__);
-				pr_info("%s(): recovered after %i trial(s))\n",  __func__, trials - 1);
+				pr_info("%s(): recovered after %i trial(s))\n",
+					__func__, trials - 1);
 				lockups++;
 			}
 		}
@@ -530,7 +533,8 @@ static int sp8870_sleep(struct dvb_frontend *fe)
 	return sp8870_writereg(state, 0xC18, 0x000);
 }
 
-static int sp8870_get_tune_settings(struct dvb_frontend *fe, struct dvb_frontend_tune_settings *fesettings)
+static int sp8870_get_tune_settings(struct dvb_frontend *fe,
+				    struct dvb_frontend_tune_settings *fesettings)
 {
 	fesettings->min_delay_ms = 350;
 	fesettings->step_size = 0;
-- 
2.55.0

