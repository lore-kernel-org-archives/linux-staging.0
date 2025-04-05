Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2521EFFB4;
	Sat,  5 Apr 2025 13:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743858230; cv=none; b=j1vJ06q9V/Z0FnNXi3B49Yw+aj/+TOm4wK0Qmpwl5kuMKT73lR4PffjuH8zopVQ7ENo4Pgovwp/JfHiOM5AluqJKZFZ6m95osvS4vYXSDRKJV4Ip4rC+QY5444bGSpm6XHMVQqHvKZ+qhQgafi4P5xwTzs4FZn5Nn0c19RfHydQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743858230; c=relaxed/simple;
	bh=gcvZnMhtR0XkyTMXHmFjgItkzTjcKo4d+SyWoFfroaA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GAa1n07LKuySaaSqv+GKKCqKCGIOke/B93vcCBHQBIsVxlXHO0eVnN+DNQ90HNYFYVNZbVWo6Udrw97xlZfG1F1sJkwyiENdulbpXShYGWXHFpzdgG1gvuXcmxBZP1ERY9yt7ntsuWpqRj6wEJKureftWgGgMTBR3o58JA1BGZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dde89kul; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dde89kul"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so26698835e9.1;
        Sat, 05 Apr 2025 06:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743858227; x=1744463027; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZIIlDBSj3POSZxjDzaSA5f1J19DQOtsWmRISrShn7M=;
        b=dde89kulH8axFGyH7vFzHhx3gyOU7yu03nuvGR7PUq0+2UZszVfmapDGFPZnV4DU8L
         Y7t0UcrtqmW5Qz2aSf8iEyupWOaJanYhoUM6PLiVhFnUhv0EeMg4OQrzXTvaFqQc7rZU
         e0ZY5k6vk4VBXAvOvF9fxFdmZS1MjwGxo5Fm4REy0UbAuMSSmOQPlF7IaYVn0SgfVlJ6
         55dRwsVTiG10j1LOQe4bsQWgTrLQYVOkQyaLMPJElEvgCWF7vT4THeiBm93uEEYgwOaI
         KFBTMHR/bY0z0A4WyeZRSOZQPfsDi9C839B3bYaFkcbAK3PZrtmwuPAhM4vQSASAaB8V
         wGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743858227; x=1744463027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NZIIlDBSj3POSZxjDzaSA5f1J19DQOtsWmRISrShn7M=;
        b=f8TP5Fd+zG4tOGHZY8Aln1NCzGTBOek9UgXxtCATNTlymLuaUWeaexns5FEl+1pHG5
         28WJ7gi5uP7HvG3L3N2lpDJDDC7s01RCT63UB9hXR6OwVk/GOCEy6dLKW7fTHIpxLMEH
         Nfzn3ySTu/G04qzqypAt/dJEq4UDIAuQWU/bYvBPdAnNcDcZ2YoQr5EiPV0G5GG9Oa7u
         ZJNcd6k1KHh5iz1AKgwZqI+WbJeiziyPKHhFOFV3KfPp1GzP5GmCUReasKpVdUVORK1x
         N8xkTrbpuX48g0TqasP7GDapVWD3LPxTLFDToEl0j2OZ78ZQVRF1PrSLU90rAREa36QH
         W23w==
X-Forwarded-Encrypted: i=1; AJvYcCXKXaX9OKkudpFLcVxU/29L4ShvsZux8BHHwlokI/kWds4ytfQxqHQ5EK9M4uAaTf/+Ve0VazneC0ddGMBS@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6hugskjTCPl94VCv6knJqtq7rKE93gpXmcd1VQ/UPxTO1rdDq
	En0ejOCGCS9pQPWi/OoUAv0OF/S6FjvPdlga+LVZLb9qzCGzBOb0
X-Gm-Gg: ASbGncvmacM6Gafbp4tjgl62lVZITK3Ph3dP+P8O06a8gyRO4qNuIO/pyJcFK8CpRW4
	/gUgT04yfA9vrc+nkV+bw8N3ASReI1wF4PvQut+tIFlVBY+h9zPXPvhqFmIYgq47VMloFOWAkAi
	B9vU4UXcBIm4NhzKCoW0eeJfAloFh8WsJhwi9EymIzJMeqxXSBQXSm3RUtStqlKjLhE12yT9tmm
	psBQgXSvfqi+zdjOVVgUI3FV6Rw6tevmqQM9rnyyD6Alr9y1Vedhn91CvviqPzmQZCg4qh06qMu
	WoQNF9ObdJf3+KZbL8ufQI64tw==
X-Google-Smtp-Source: AGHT+IGjYIqX2gJsmdrsMxTZ/QsNit5EW1azXy6aw0u6NIGAnqxr/B3pJ6+P7OW06m9+2yvVvJWXbg==
X-Received: by 2002:a5d:5f4b:0:b0:38d:ba8e:7327 with SMTP id ffacd0b85a97d-39cb35aeb5amr6349321f8f.8.1743858226575;
        Sat, 05 Apr 2025 06:03:46 -0700 (PDT)
Received: from parrot ([105.112.71.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d661sm7039310f8f.66.2025.04.05.06.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 06:03:46 -0700 (PDT)
From: Richard Akintola <princerichard17a@gmail.com>
To: outreachy@lists.linux.dev
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Akintola <princerichard17a@gmail.com>
Subject: [PATCH 2/8] staging: sm750fb: change sii164ResetChip to snake_case
Date: Sat,  5 Apr 2025 14:00:53 +0100
Message-Id: <0974eb17fa67b707e8d2972668da4d8a692a9702.1743857160.git.princerichard17a@gmail.com>
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

Change camelCase function name sii164ResetChip to sii164_reset_chip
to conform to kernel code styles as reported by checkpatch.pl

CHECK: Avoid camelCase: <sii164ResetChip>

Signed-off-by: Richard Akintola <princerichard17a@gmail.com>
---
 drivers/staging/sm750fb/ddk750_dvi.c    | 2 +-
 drivers/staging/sm750fb/ddk750_sii164.c | 4 ++--
 drivers/staging/sm750fb/ddk750_sii164.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index 3fb14eff2de1..6dee95e60a6e 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -18,7 +18,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 		.get_vendor_id = sii164_get_vendor_id,
 		.get_device_id = sii164_get_device_id,
 #ifdef SII164_FULL_FUNCTIONS
-		.reset_chip = sii164ResetChip,
+		.reset_chip = sii164_reset_chip,
 		.get_chip_string = sii164GetChipString,
 		.set_power = sii164SetPower,
 		.enable_hot_plug_detection = sii164EnableHotPlugDetection,
diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
index 223c181dc649..284c32f7e9b4 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.c
+++ b/drivers/staging/sm750fb/ddk750_sii164.c
@@ -250,10 +250,10 @@ long sii164_init_chip(unsigned char edge_select,
 #ifdef SII164_FULL_FUNCTIONS
 
 /*
- *  sii164ResetChip
+ *  sii164_reset_chip
  *      This function resets the DVI Controller Chip.
  */
-void sii164ResetChip(void)
+void sii164_reset_chip(void)
 {
 	/* Power down */
 	sii164SetPower(0);
diff --git a/drivers/staging/sm750fb/ddk750_sii164.h b/drivers/staging/sm750fb/ddk750_sii164.h
index a76091f6622b..7a71f94a1e9b 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.h
+++ b/drivers/staging/sm750fb/ddk750_sii164.h
@@ -31,7 +31,7 @@ unsigned short sii164_get_vendor_id(void);
 unsigned short sii164_get_device_id(void);
 
 #ifdef SII164_FULL_FUNCTIONS
-void sii164ResetChip(void);
+void sii164_reset_chip(void);
 char *sii164GetChipString(void);
 void sii164SetPower(unsigned char powerUp);
 void sii164EnableHotPlugDetection(unsigned char enableHotPlug);
-- 
2.39.5

