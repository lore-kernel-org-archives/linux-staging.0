Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F08B319858
	for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 08:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773475798; cv=none; b=pPBsshy2Ke/Lh4vTFjlImuR+V9rNXTgZryKxoNI4oIBZbbXEjp2qkXlH3rOyDOf29FjOdgBXAYF3ep3TuavVfOO8y1ray0aQJtlh1gOkPpGIOYkH4KGxwuTx6kAo93MDyJgOhKc880snmr5e2DuRyBWxbK35ioSAyc6kWCdR9SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773475798; c=relaxed/simple;
	bh=Ej6quQFb3gfPTuE+COdLvKyXP7sId4xnK2ZAaE//f5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tw1Mt4c8qXI8ERCcGnH0RVoDlAaBRFTXkxf9DL6EEzZNIaYyW7Milj5wjrmxt/OBF0xvIKTU07GiUwlD9SpN7KNfrAEUsYmIYS2TFwM5BWEdghf75VJoSW73OHog+mQ+m0IatVmwk35RwI2bHoSXY8Xiuk9SjKOfA0FcpLFelkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOsY0joX; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOsY0joX"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2aecefc7503so10098645ad.1
        for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 01:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773475797; x=1774080597; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bij56Q8/mZC/30hBYzuyhlpvFrw3G2CfXcV+RBR4NDs=;
        b=iOsY0joXZ6ysm2yc9zP4u5hMcTfnBfItW/6em+ajl/Au/LvKQr6/O+fjS3/9ztrggP
         848Px75EqT0TgoPq4gyQ/XhkxDCSLEAB7TmVeadfO8NYqUC94XWbXk6T1qgMB9yzWKoM
         udGpjEVavPC5BpfnzP2Y9pT2kCvozowiEaEsd27YHIBmwE5rne1mHBoa03/Q2lyxBdlg
         d0jDEbKlOcs56k+Ca9o50zPZRfGRBy9h61oG7alutnWFFma2H2+YzBka+6eVZyyYoi7Z
         dgShDMLJVu3ONB6iR3vIBwa+TpPf/C4HpSh3g1R3eRcXgS239jU1+Tz90PC3fy8YAg9O
         /TIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773475797; x=1774080597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bij56Q8/mZC/30hBYzuyhlpvFrw3G2CfXcV+RBR4NDs=;
        b=BMSf7x6k/AtYpzs/XQKay19ole04y04LEz3qUKoA8KbDPh1XpxrSNRpg/Mw2ruCFXU
         b3YwPqYj6kVJXcpGuo6R3vGzJ5GmNP4TkTZ0qZI+9UkwcYqWjbwVKWS0w7B7HNLtEpYm
         veKWOHmpFRUlB9LK82gedp+YWeisKsM6qKC7MqBbS+tCUJ8V9U4HdBpGs8LaAGWUGt6x
         tKjbbhFGixmHkQ6sMYL3Ef8H3LaxXgFBbsOtwKyzEnR0aFXogkont1TNEs28zOM6G0S/
         Rhcfp74/z2HdvNg+MMYLRKtLCDSOzd3obC6tYU32AnBi72xxUaPgeX09fk17k+QH5mcB
         3U2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXifKUQcw7f8zxsqUKslKE4olzs3eTl9MEi3PFusHsUrl4by2x7mV6QT6mWPvqKnIWMJYp157vcjUA1Innm@lists.linux.dev
X-Gm-Message-State: AOJu0YwMp0pIleHPRz8aAnSVivx2xvh6EAakzYL/267dOpB/kE62T8mr
	EIi2OxLjZkyKiHJQaqYingkVszQTwZV2dHK3Q3LGtm4Iw+AE+BJ9SzT4
X-Gm-Gg: ATEYQzwJOTg2rKVqBPNMYrPv0mBU3AY3o0J61VvgbOOL9CGMgf9wQAMC3sEAOTSU9CI
	auHvPspNJJ07tIgMj7yygN5TB+CzZCwCW6q4Bq3gaXUfQG3usNRryIJ66xpPRwREEU8Ie+m8ngu
	FOevrpkgIcgu9Ddbyqqtqap+VmPVBRry1vx8ZAENrG0YGSdwiL5iAEPYszivSzgX0GJaZ4XJPV4
	kCCu7LPkeYP/Fh+AdVtvKVvGgIk9H4mWC8OckNEyvzIJsuegMmw8W0tCf0bfn5EgnZ5j+8O71iO
	jngAgVH7NK26hQ24rDXV+ypU9tin72KaQdNGefZCapHWJsO0+a076uyL0FB5pkl5f4gyB7qZiT7
	EBZe1rgEnfBm86cnH0m9AkEiLUCCcgrsS2qJVBjpBiU2a3XRU0lz315cWWNCAiiT/ne4CfQ7DPu
	GFxwvPiOz+bZbn3INCezRwMYbD5lS/MmEe
X-Received: by 2002:a17:903:2b04:b0:2b0:4579:ae6 with SMTP id d9443c01a7336-2b04579119cmr9368075ad.38.1773475796882;
        Sat, 14 Mar 2026 01:09:56 -0700 (PDT)
Received: from fedora ([2409:40e5:1052:9a56:d0d2:2da5:541:7e3c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73eb9966d9sm3665378a12.11.2026.03.14.01.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 01:09:56 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH 2/3] staging: sm750fb: Rename struct init_status members to snake_case
Date: Sat, 14 Mar 2026 13:39:31 +0530
Message-ID: <20260314080934.135457-2-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260314080934.135457-1-chakrabortyshubham66@gmail.com>
References: <20260314080934.135457-1-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename CamelCase members powerMode, setAllEngOff, and resetMemory to follow the Linux kernel coding style.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 6 +++---
 drivers/staging/sm750fb/sm750.h | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 729c34372a1e..c30ffab8a5f3 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -921,9 +921,9 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 	sm750_dev->init_parm.chip_clk = 0;
 	sm750_dev->init_parm.mem_clk = 0;
 	sm750_dev->init_parm.master_clk = 0;
-	sm750_dev->init_parm.powerMode = 0;
-	sm750_dev->init_parm.setAllEngOff = 0;
-	sm750_dev->init_parm.resetMemory = 1;
+	sm750_dev->init_parm.power_mode = 0;
+	sm750_dev->init_parm.set_all_eng_off = 0;
+	sm750_dev->init_parm.reset_memory = 1;
 
 	/* defaultly turn g_hwcursor on for both view */
 	g_hwcursor = 3;
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 49a79d0a8a2e..b683a82af349 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -39,13 +39,13 @@ enum sm750_path {
 };
 
 struct init_status {
-	ushort powerMode;
+	ushort power_mode;
 	/* below three clocks are in unit of MHZ*/
 	ushort chip_clk;
 	ushort mem_clk;
 	ushort master_clk;
-	ushort setAllEngOff;
-	ushort resetMemory;
+	ushort set_all_eng_off;
+	ushort reset_memory;
 };
 
 struct lynx_accel {
-- 
2.53.0

