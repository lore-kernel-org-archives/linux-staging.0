Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1681E5B91;
	Sat,  5 Apr 2025 13:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743858225; cv=none; b=KB7n8JM4iXPcYoTkRJz/6Fk+TnvFcy+wH5SOCnhughWQZVCr6LYj/z9DXKHMrkW2snJUclyeJAJFbqBQrIUrcY3VSg/3SVDC0/PgOh0DjIySlH9+KuMyM2QKB1GxGfpjLaBBRYhZlJByRMF9KiG04vq1HmD4BePbZ1nXPYPbmBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743858225; c=relaxed/simple;
	bh=Z6xq/h+Qly0PKUGsSPTgPJbf66WR5pT+E85G1cdl378=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nDg8hw/kS8LnHo5DlSFGsc5906F00UaDMdevy4F5SUaE/2s5RXtPQv7JGpXk5TdFUfcmDHO9rcvmJ6IAFny80ZPmu+DqQXJwu5DPZc3Gn9vS7KOzwzbAH/3aAaTLawdUiH3+eVJplbsjqubfcCSb3V1dtTTCDt1vdYvGGFzZsRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZXnZko+M; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXnZko+M"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39ac9aea656so2625998f8f.3;
        Sat, 05 Apr 2025 06:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743858222; x=1744463022; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yVTlKXlj09u3x3cF5cGmCUxBsTXjfJU7FwaBPii2bKY=;
        b=ZXnZko+MIQU0jd7GnE/Pw/L9yPm9MtPGnXeAIuib/cKLnXMtbme7VMDmHnpmaoOy4j
         gwPFDhCgO4dXv+do1Xx21VtX+m4sgAtUGOFsDeRE+9Qou7DMlTR1TNgtW0B4zXSbdKAQ
         d/gH66IwsYZBJEJfsPVBIsZuZpJS1D76yTwfzu5Q4QNdMLR13tfK4CJlNdCvidD9LgXk
         WAxth1cyXWAoFRRye6y1OsVhJRyeQYFPQqSfh5S2vHb/EAAdaf+qUAt3K7nisl9HeSYV
         /L/XVSIQIeJ0duyEMoy5DZERzWIQA62/VY/0nXvxibAK+4tG2sjjvrHfSYjYOVeTa7ya
         t6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743858222; x=1744463022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yVTlKXlj09u3x3cF5cGmCUxBsTXjfJU7FwaBPii2bKY=;
        b=vBm1+gkQw46/UH843ektOM4yjqFkXTYgJVEsI2kSbNoodkX0xssm5SnvvMaio0TcM8
         u8pEbvE3MA2mw+gN6cGH8zIzI7DFsjJBHrWbpOUpHCErpNXxwq516HDmNE6bcyIB6d7P
         Cbir7Lmdx4P4K7vBpTy0Hy2A00SFQGQDMw96C6XFE3CZCehbgdVg6uPnbGUOwe0Jx62/
         JQF7d3jQTZRhsdJnDqpxO5XnMklT2IL/6Bwmdjm3amuMHcdNKs2JUKX66qQjrqm6wJgS
         33l6y6T+EwgIoLHEZsYSV401Mt8vITgAtcSw4fdBLoofki9e89IlSDOeq4PVxJ2qCkOx
         +pCw==
X-Forwarded-Encrypted: i=1; AJvYcCUKO4b0hibwFkW42FTwb959YA88OR5SIfl9q6/nQ4uh95papH9Ty92HxyDqkkaTr8htkXL5JU1/1c1lsl7s@lists.linux.dev
X-Gm-Message-State: AOJu0YyI2rCcm4Tp8bdC1aaCjsX5Vm0W++xILByiHKSH9Y5/T+cHTtFG
	R6RI5T2lUmKWxNiwIOPQ4ySbJ6qrS3FH98uA6YVRI5PKsVim5zQw
X-Gm-Gg: ASbGncuEH0raZKYf0uyap6a/p6YiKTBwptkFcn91qGHr0ZNwq3FDjZT2awV2+vtH0Q3
	4u9EF3htgIdqTjiH8++h+yRbb5wqweWEHAGy+WyL90vKE410NKa1AB05OB86ZK6cO8y4IQULLcT
	PYegcvmeBnW7kG53OqG3ss/Fp59hYBuKb0vqWDV+xMH7IKHMLtTmSJUMLMR/ciVjiUWntYDmVZ9
	7zGEUi3fxRDvOme1Y3hz+ah+K+02y7enzGKR8UvPlUC9ek87Z63Del1I9nmO5jEXgPAU4QmJ2cr
	YjUfOUbPSkSZmerrKhyXjFkItw==
X-Google-Smtp-Source: AGHT+IHbHQIzgZdPRIb/SjbhPaPxh4G8SN2OsFmIIY0sHDVmccSXtysb5SvsyLcaZ3/zyCp8ztHoXw==
X-Received: by 2002:a05:6000:2283:b0:39c:268e:ae04 with SMTP id ffacd0b85a97d-39d01f6f04bmr5425335f8f.0.1743858221667;
        Sat, 05 Apr 2025 06:03:41 -0700 (PDT)
Received: from parrot ([105.112.71.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1795630sm78097495e9.29.2025.04.05.06.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 06:03:41 -0700 (PDT)
From: Richard Akintola <princerichard17a@gmail.com>
To: outreachy@lists.linux.dev
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Akintola <princerichard17a@gmail.com>
Subject: [PATCH 1/8] staging: sm750fb: change sii164GetDeviceID to snake_case
Date: Sat,  5 Apr 2025 14:00:52 +0100
Message-Id: <16e6e40930d67bb6481638982da13fc32fb88f10.1743857160.git.princerichard17a@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1743857160.git.princerichard17a@gmail.com>
References: <cover.1743857160.git.princerichard17a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change camelCase function name sii164GetDeviceID to sii164_get_device_id
to conform to kernel code styles as reported by checkpatch.pl

CHECK: Avoid camelCase: <sii164GetDeviceID>

Signed-off-by: Richard Akintola <princerichard17a@gmail.com>
---
 drivers/staging/sm750fb/ddk750_dvi.c    | 2 +-
 drivers/staging/sm750fb/ddk750_sii164.c | 6 +++---
 drivers/staging/sm750fb/ddk750_sii164.h | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index 8b81e8642f9e..3fb14eff2de1 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -16,7 +16,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 	{
 		.init = sii164_init_chip,
 		.get_vendor_id = sii164_get_vendor_id,
-		.get_device_id = sii164GetDeviceID,
+		.get_device_id = sii164_get_device_id,
 #ifdef SII164_FULL_FUNCTIONS
 		.reset_chip = sii164ResetChip,
 		.get_chip_string = sii164GetChipString,
diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
index 2532b60245ac..223c181dc649 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.c
+++ b/drivers/staging/sm750fb/ddk750_sii164.c
@@ -48,13 +48,13 @@ unsigned short sii164_get_vendor_id(void)
 }
 
 /*
- *  sii164GetDeviceID
+ *  sii164_get_device_id
  *      This function gets the device ID of the DVI controller chip.
  *
  *  Output:
  *      Device ID
  */
-unsigned short sii164GetDeviceID(void)
+unsigned short sii164_get_device_id(void)
 {
 	unsigned short deviceID;
 
@@ -141,7 +141,7 @@ long sii164_init_chip(unsigned char edge_select,
 
 	/* Check if SII164 Chip exists */
 	if ((sii164_get_vendor_id() == SII164_VENDOR_ID) &&
-	    (sii164GetDeviceID() == SII164_DEVICE_ID)) {
+	    (sii164_get_device_id() == SII164_DEVICE_ID)) {
 		/*
 		 *  Initialize SII164 controller chip.
 		 */
diff --git a/drivers/staging/sm750fb/ddk750_sii164.h b/drivers/staging/sm750fb/ddk750_sii164.h
index 71a7c1cb42c4..a76091f6622b 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.h
+++ b/drivers/staging/sm750fb/ddk750_sii164.h
@@ -28,7 +28,7 @@ long sii164_init_chip(unsigned char edgeSelect,
 		      unsigned char pllFilterValue);
 
 unsigned short sii164_get_vendor_id(void);
-unsigned short sii164GetDeviceID(void);
+unsigned short sii164_get_device_id(void);
 
 #ifdef SII164_FULL_FUNCTIONS
 void sii164ResetChip(void);
-- 
2.39.5

