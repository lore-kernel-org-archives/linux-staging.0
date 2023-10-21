Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6C320B1F;
	Sat, 21 Oct 2023 23:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z9c4dZ7P"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-32daeed7771so1394413f8f.3;
        Sat, 21 Oct 2023 16:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697929977; x=1698534777; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amjkysvwGLDMqQy/BiqSp0BajkmyMximPs7WeghdDP8=;
        b=Z9c4dZ7P2vWoliP/1UvKb0MtD2z7FYYxKGCmcAlxGIJ857VXLSpw2Iea3Iant/QbSB
         vOk4pLECJwe++1mCZ7MKWtRpdYkpUAZkV0DOjWyI4sQvWtLSAYeh2avnUnAlhiD33O4N
         sFs7sAt9zt3e5l5gbX5gZekjj5j8msm450cd0hK2KD1R58gtdQc/12VL/xNgBnoHAs6d
         zxVk3f++hzWNF0rB0aOmurMVkiA+1XymstbPgRYpTNl1unssJHeMObrtKPM8yXuovI9u
         QT8nIK2X0lG7z623JHo0g7FeO1qFI8tDF6xjLUoAQ21+GnqCiyq0kaO7FpOUCuLkQNGf
         qKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697929977; x=1698534777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=amjkysvwGLDMqQy/BiqSp0BajkmyMximPs7WeghdDP8=;
        b=G4sI6A1XIQj9Wvb7Q6dPZeXV5/iLFg8THdye2x3rJbe+XSIsYACaGNYzRKjv7S9np2
         s94uJWZPUxHjGOVOZBpPU9UXUMZNMGRexW5OTo894Fyyasug1S36YvXe+2bhNuGnGNmN
         hZHJujK9i43gamo5+eHVquRbDMRsMsZcVNBgnKyF1Shp1SRGSrpW1xKk4i588OfS4j1/
         RCGc5hAJ5/JAqycSW0s8RNi7B+vLAKwroBzbfpp8BOZPDJvw7TWQY1EjwZYpzH0sf4l8
         cH0EelC1RiiZ81feGmzRkLc0gE2WBivs00F7hoHjhZpOWpk/PZbpfQMs6qJSaRaBtV6r
         0lCQ==
X-Gm-Message-State: AOJu0Yxq2sim8oQ5TEkfYDRTjzWBKchObirwy4oZ/fSsdHo6NTVtK51d
	7X5PfegXFhmZ0xVAVzmYOqY=
X-Google-Smtp-Source: AGHT+IF388wDyEcE44JY0oqc4aiVNscTJNQza6DDdkdC9cj3Y1sX7vvjrj6sCaTLdYDZdpuaze36Mw==
X-Received: by 2002:adf:f30e:0:b0:32d:a98c:aa1f with SMTP id i14-20020adff30e000000b0032da98caa1fmr3648237wro.1.1697929977124;
        Sat, 21 Oct 2023 16:12:57 -0700 (PDT)
Received: from gilbert-PC ([105.113.89.119])
        by smtp.gmail.com with ESMTPSA id w15-20020a5d608f000000b0032dbf32bd56sm4505098wrt.37.2023.10.21.16.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 16:12:56 -0700 (PDT)
From: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gilbert Adikankwu <gilbertadikankwu@gmail.com>
Subject: [PATCH 5/5] staging: vt6655: Rename variable byEIFS
Date: Sun, 22 Oct 2023 00:12:31 +0100
Message-Id: <4428aa96453516b6706b1a834c46e3f6e70b5828.1697927812.git.gilbertadikankwu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697927812.git.gilbertadikankwu@gmail.com>
References: <cover.1697927812.git.gilbertadikankwu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove byte Type encoding "by" from variable name and replace camelcase
with snakecase.

Fix checkpatch.pl error:
	CHECK: Avoid CamelCase: <byEIFS>

Signed-off-by: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
---
 drivers/staging/vt6655/card.c   | 6 +++---
 drivers/staging/vt6655/device.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 9c8648ea96be..079fd01c6780 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -250,9 +250,9 @@ bool CARDbSetPhyParameter(struct vnt_private *priv, u8 bb_type)
 		priv->difs = difs;
 		iowrite8(priv->difs, priv->port_offset + MAC_REG_DIFS);
 	}
-	if (priv->byEIFS != C_EIFS) {
-		priv->byEIFS = C_EIFS;
-		iowrite8(priv->byEIFS, priv->port_offset + MAC_REG_EIFS);
+	if (priv->eifs != C_EIFS) {
+		priv->eifs = C_EIFS;
+		iowrite8(priv->eifs, priv->port_offset + MAC_REG_EIFS);
 	}
 	if (priv->slot != slot) {
 		priv->slot = slot;
diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index 264bb056c80c..7773b19a5788 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -183,7 +183,7 @@ struct vnt_private {
 	/* PHY parameter */
 	unsigned char sifs;
 	unsigned char difs;
-	unsigned char byEIFS;
+	unsigned char eifs;
 	unsigned char slot;
 	unsigned char cw_max_min;
 
-- 
2.34.1

