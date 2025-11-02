Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586A55695
	for <linux-staging@lists.linux.dev>; Sun,  2 Nov 2025 23:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762124518; cv=none; b=dBAJcj2InZxInRg9wzYC87o9BH8tqcGYsV4r5sSUulVrxqt7JzMPamWYHwsHmMqdbaJw5z3cMQ5wtOmaVaqoR3I/tTmwXVCx6m149/H66ZWPjPwNUi7SSI7IiZmrrZitVuEMk7Q3GUtRTT93wvsx9hVQi6nVpE+XC+sVAYULnkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762124518; c=relaxed/simple;
	bh=GfVeVjIlMgPT+UemYVUldkkWYQW4Y6aC+ZVdDKwyYkw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rj/PreT2XmoJlrUXI057gYkN8E7moYDcO9q5Gkrx2eQchLZe5sG8BcW6Aw3Kv/lKBNm8sQAx6g3E961Ieb6nuHpKMRr/EaWG2a+hCsmN5TN8w+ZvOW9hG6lGOn8QN3PWXzfklCtf20gwCdldeiAGIxUC+lwiOBSbQaIaptZIMyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=atlZfVLR; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="atlZfVLR"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-3d1bc63d5f0so2254446fac.0
        for <linux-staging@lists.linux.dev>; Sun, 02 Nov 2025 15:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762124516; x=1762729316; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZdylP5ZHtnXQ+DVmn1YWZdzLTkE7lGMQKzASiLTEus=;
        b=atlZfVLRkREfs2AbuS00yXGEUEseUIW+Rqb8VQZhz8YzH2xss5N1sN3hIEt5FwEPNV
         RvxqLdgHJGGhUMCVsPvMvJjOzUcGV3T9hggGKx9WC3DWnY6RnG8fXMsgJyPmZbxIdd7U
         PVYw1s0uHj39BHlFBYldBn+d1rldU3hUEsYXNxQOV9twZpZkS4iQsf1xe7BvImdByHGq
         iaeVM5ZLFuEKKgGHgD6ImW3zLRN96irCP6ukJkxGQdpokZzEwgRDhn5TsYSptw5emW5e
         Br6lzLUmFQx6ji2XPEG5OpDGVzJ3EGP+wOYiJpxAG+f69iYJl10a6xr6cKPcIIYx1ffZ
         aUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762124516; x=1762729316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZdylP5ZHtnXQ+DVmn1YWZdzLTkE7lGMQKzASiLTEus=;
        b=FUL446WQdJTTDFXunOIGmJ3Aiv4Xh6ms0Mwyl/Y35TRVcyF6H1/Ng01tw24Ea1UmNh
         NtlLyMuFkaQPIYyXrt4L/eD1CTrm1LJ5ecO2MXx0LsSQgjVsXxH50ZnDlhPjCE8JR4PO
         jNbBpKuUlAc8eTCL9NhQh4KXW+80FoslGoq2/e/Z4RiGEAD5cjYqhtqWxmlzVV9H1+do
         thAPVkrj45lbEzuRf1VMH78z4sM/oM6K0SpfcyJZEKhQLLlUj7obANR+l9XwQpGtXT6x
         R7rqFcxBy2ed/GgUZoovdJI8HP0zvmWxsICuUM7+/itJQ/yjvIt8QO/1rcx1YB3LU/7s
         Ilmg==
X-Forwarded-Encrypted: i=1; AJvYcCXvQJOCmObkSOiNn/mCJDXw27m0g4yhysE88PyXiK8M3yG+qFHC3uOV48wr2pKC4D3aMB7rRV3Iq7F1SV9H@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5Hz1wwLsOD3SE0m7ZlLpaWhRUlK2bcXNqddc5LzcpdDFhEHg/
	zabPwetuH3sdAgVkUqgK4hvIcZylqJpQZV+tNGsZAkxqraCTBghV/SgA
X-Gm-Gg: ASbGnctGW+5ypbROk27DPKP6EairLY9zP5eBAjsYLYNfvgEgRYICLNbnRuDGGYzOU9U
	4l8NzLmp6LHzknkIPgfezvZFyfCyLw8L+H7PZFZ58D71s4Tn5WGR0/FPvjzZesmSFAEXtCULJXL
	p9zct6W7ki5NVhIBbbcOjLp1MBDgywQ1pgwfQEaUSgPw6ue1F3B3UbEoL/yNLDNAHCDo2CS3jNa
	0gcv3vXJ1sPM2ABw0K7KYXd2vKDp9+jpTFg9nGnHWP3OvWAM9pN8Bey75VJgoYbwEfFL49eZCWQ
	hCZ1BxMXbEm2mKKTCRBsLfb9LDR78PJh3sIiRCVYpCzy1qLyhTZx6F2KR9rj+QhnCNGz3JWxvIz
	FeqmyFRHmPL6VdaZw6nuDt4gDLDL3aLA2uDO3l8k/MPZHJgo9JuorK2QFduG6UPrwgerBLLWD1F
	7RZpf+WvbUagUF8YgLGcsUeniKNrvtOTw=
X-Google-Smtp-Source: AGHT+IHxfEHo5U2Vd+PbcXp5r4xXTkBS84lXTZLCP09zNu4A/UZWHNNp54bKGFACytoMbouth6qfew==
X-Received: by 2002:a05:6871:8012:b0:3d3:ba60:ee19 with SMTP id 586e51a60fabf-3dacc9e2d35mr5145141fac.42.1762124516282;
        Sun, 02 Nov 2025 15:01:56 -0800 (PST)
Received: from localhost.localdomain ([104.247.98.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3dd9a924727sm1210628fac.15.2025.11.02.15.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 15:01:55 -0800 (PST)
From: Cristian Del Gobbo <cristiandelgobbo87@gmail.com>
To: sudip.mukherjee@gmail.com
Cc: teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Cristian Del Gobbo <cristiandelgobbo87@gmail.com>
Subject: [PATCH 2/2] staging: sm750fb: avoid chained assignment in setcolreg()
Date: Mon,  3 Nov 2025 00:01:39 +0100
Message-Id: <20251102230139.1720-2-cristiandelgobbo87@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251102230139.1720-1-cristiandelgobbo87@gmail.com>
References: <20251102230139.1720-1-cristiandelgobbo87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the chained assignment of red/green/blue with a temporary
variable and braces. This keeps behavior identical while improving
readability and satisfying checkpatch.

No functional change intended.

Signed-off-by: Cristian Del Gobbo <cristiandelgobbo87@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 9740f2705679..fecd7457e615 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -537,8 +537,13 @@ static int lynxfb_ops_setcolreg(unsigned int regno,
 		return -EINVAL;
 	}
 
-	if (info->var.grayscale)
-		red = green = blue = (red * 77 + green * 151 + blue * 28) >> 8;
+	if (info->var.grayscale) {
+		int lum = (red * 77 + green * 151 + blue * 28) >> 8;
+
+		red = lum;
+		green = lum;
+		blue = lum;
+	}
 
 	if (var->bits_per_pixel == 8 &&
 	    info->fix.visual == FB_VISUAL_PSEUDOCOLOR) {
-- 
2.34.1

