Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA9E1C680;
	Sat, 16 Mar 2024 17:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710609942; cv=none; b=O40omUnVK3GcYdDZ5DnXYxy0GP6Bvqe5BKDJnv8x4asWGpRmleO4tzi3LzICGJjKD9GAKTnCjEjIeCUGvW08e4owZ4j96+n5bqoJ9bQ33zSV24Nm7R70JhQt2jA5J9hJ34YYyjSqFw61AROXksD0QSWXD5dnJIyj+p1bxfBt1aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710609942; c=relaxed/simple;
	bh=wdtCS9WiVMBSSsfVOvP7DIpQhKy4sSXVufpuN9UNSeM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZXRHEzDkVHoGfOVsr6KVx4YyXG3c3YmoxXMxXqeJ84EqkEIeQcEjAnVKzCmX3nRqXlORTfYksKt1mfb3I5GpF61SoF7LEVwr4WR3v5N9V38e56ic/9e0Z5mwy3QQia9Rsd3YkVHP6tpt4sk6dTFjXG13iYws7/EirvlfsMsATzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=knfiPxhH; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knfiPxhH"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a3122b70439so381022566b.3;
        Sat, 16 Mar 2024 10:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710609939; x=1711214739; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OmT9zzOaWBj42CPMMdcIM8SYCh/t/ddtINOZfhSyRqM=;
        b=knfiPxhHfwhVBvgyrI/jQvmGuvVJ0e6XBVVD0oTbiBsDXjwn5RbVL8hhpvwNQBC9zI
         j12U+M3BCuXh2Xq40y/Lm8pCYymZg+BNBVD9R6NXI5kN3P5ZxUbc9XtwbdWZuOFeXqEX
         3qRYJwfbDZKypgd/sITm/E6lYU1fHQnLrsF1GXP4UWEVJ/nGun49gepjEs+k5Tk4knXf
         YMwRXEnDjs+r7LEO+mt8NmDsSKlqNiOE2x75ZSHoBpxya5nO6i5mCmZhbz4pWXXD8/dZ
         EUbiyVVFqlzxw5pIH1mJIfqrEe0oNbBA6gPqTZFLnIUccLiqmjKmr+EcNW/nKX0vQb5s
         FiUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710609939; x=1711214739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OmT9zzOaWBj42CPMMdcIM8SYCh/t/ddtINOZfhSyRqM=;
        b=Xx3eYn+ChmMIlwMx80dI4D6AKRN48bwLAV9I5ov+c8e4z7LIYFncMb01rf3ON9BY9r
         HlirJ4MNGaRTekjds3/o0GKYfaF2U7wckICQzDGolRONWidWj2aFUy3SyJGCupmqSEQU
         ajLloyMEI/QtVTnaBBD347mqpoT5hCHtgJUmJfp5VmP8WJ3X5mcSV+KqfX6qlZey/l9m
         PMPkqlQmcJUPUa9cGxZsgF0EU47xvJfa3OOPcXgc3cubsXGdcNzy/rsgsOArzHwMGqUZ
         mqojD2ItF+Gp0ndEPaEARY92UArl5VqNkSG/ysoJUvCd4ryJnluDZ5g5ftD6JBJOAfNd
         schA==
X-Forwarded-Encrypted: i=1; AJvYcCXnp/ouWPdAJm1oaw42hyaEcpc2KApvH+i8yvWbwt/M63KbewiRxhaKs/M0cGlPs/L9pKMDXaMdLi6yu+FrirQaZA3OM8EGoc0ZZR6mn8a05yJrreiPd7con4i6cPxBb69/I2sWC4ALzw==
X-Gm-Message-State: AOJu0YxufEsslefabK2GBpYEzBsEdd5ORkrIzocQWe4YpjzkAJgFCw9R
	0OrHCcW8DW0RgP1H+koTnpgTYEBT//1uzWJexGI6vxz2PGeBSgMn
X-Google-Smtp-Source: AGHT+IGMk/5bMB/5nL29DN47hj4TBfOWzxPZuSnHRmbl3bm3w5rOjT5sa3u2++adQk3V7kbifaqY2Q==
X-Received: by 2002:a17:907:7e89:b0:a46:ae35:9939 with SMTP id qb9-20020a1709077e8900b00a46ae359939mr400591ejc.50.1710609939133;
        Sat, 16 Mar 2024 10:25:39 -0700 (PDT)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id p20-20020a1709060dd400b00a46a3e4ef11sm885931eji.92.2024.03.16.10.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 10:25:38 -0700 (PDT)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	forest@forestbond.com,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>,
	julia.lawall@inria.fr,
	dan.carpenter@linaro.org,
	philipp.g.hortmann@gmail.com
Subject: [PATCH v5] staging: vt6655: Remove unused function
Date: Sat, 16 Mar 2024 17:25:18 +0000
Message-Id: <20240316172518.2717-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused function RFbAL7230SelectChannelPostProcess declared in
rf.h but has no associated implementation.

Commit dd2837bdea0e removed the RFbAL7230SelectChannelPostProcess() but
accidentally forgot to delete the declaration in the header file.

Fixes: dd2837bdea0e ("staging: vt6655: Remove unused byRFType in rf.c"
Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
Changes since V1:

V2: - Removed the unintended blank line after removing the dead code
    - Removed "in rf.h" from the subject

V3: - Added in the Description Comment about unintended blank line

V4: - Adjusted complete description according to hint from feedback
    - Rebased patch

V5: - Added a missing closing parenthesis in the fixes tag

 drivers/staging/vt6655/rf.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/vt6655/rf.h b/drivers/staging/vt6655/rf.h
index 6f842ac00526..8eef100c7ef2 100644
--- a/drivers/staging/vt6655/rf.h
+++ b/drivers/staging/vt6655/rf.h
@@ -68,8 +68,4 @@ bool RFbRawSetPower(struct vnt_private *priv, unsigned char byPwr,
 void RFvRSSITodBm(struct vnt_private *priv, unsigned char byCurrRSSI,
 		  long *pldBm);

-/* {{ RobertYu: 20050104 */
-bool RFbAL7230SelectChannelPostProcess(struct vnt_private *priv, u16 byOldChannel, u16 byNewChannel);
-/* }} RobertYu */
-
 #endif /* __RF_H__ */
--
2.25.1

