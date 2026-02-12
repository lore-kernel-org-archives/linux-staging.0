Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FE319DF4D
	for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 06:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770877127; cv=none; b=Qy589O41TsWqZ/PgR5VcJMA6MqcgmuIUqf2RL43qxxcux2mrQAG0z9t6eoiczXSVom6XGCkQXM/0dGs+g9Arb1Epx9sJTF8SqY2UL3pLEEHlaug1ZPAN1U6a6yD0KKY5tnTJiolNKLe//S7huA0CeZVwz2aqx8VNUt4svUSPi9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770877127; c=relaxed/simple;
	bh=xybdZo+44DNRQqsGo2mH6Jf0DHlP2O06yrMNIa3o7y4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GKj7j2emGlFEyube0Xk+CMmwX7t2wGDEBkkRtImcXb2RGEmYlOzRDGl+gKEroUBPkdnMIOEVLouUOxFIW8+z4EmQrHDIQdKjecpGu1ZNf3uZHtcpmt69R2edGSYIp80fn5FQtQUUSM/P0HGbQaY+whRQp/YIumfiSr7zFdrXZk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BfxNam+7; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BfxNam+7"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5664848545fso2875524e0c.3
        for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 22:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770877125; x=1771481925; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3PEseT6BopSqhZhN32gIprCivodcmzfr/RMIIcQqOo=;
        b=BfxNam+7xm5M2mJH3zYGOCbbWE+QrD2NKp6pz/yI1JYeeDYPfqCBTsE0jipc5HTZzO
         Wxn6rA+/2aHvuHYpDrCoRSftx+mOc95+Bvm0UsB8Im2WjcaSS0X3v8twoCS7QBap7vr7
         xQ3w8BPaJ/bOl9axOQLDMA08MG8QoKxKnOJtNxgO6sKZyA8OyY6xmDWiAwD3/3OMrEf0
         +0i099oUeVKdLNg+j7+pgwO/mAeT98/3KksoN7IAw9393AacPcWE1LQJnbve3AcV/uvy
         0kjL1prujhE2YzmYzMjq/f1J9DNdq130BvI46Icon1Jlv0OpTge83s6aj8fDxvKudgMq
         66Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770877125; x=1771481925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3PEseT6BopSqhZhN32gIprCivodcmzfr/RMIIcQqOo=;
        b=Fo29V6fLC3SctWP4z5QbW32nPqIqfLHP8NpswygEmlIb6qUQH1wfJS3woRySkT3BXl
         ucmeYzSGi49eaKysea75DTDBrDPEeuoD4D6x3iucGkpIxRoiT93RBKoPDWEUKKTFDc3i
         U45JaLq3+qUQ9iFxn+pDqtMGiX5juW4bveEMnxUvIgVGEBpYwAy5MGxyukvA17PfnKDt
         CRBjfSCMiOnV9M5E4HTjai2LRGpq2fC3jXG4Qy3wI9GaK20SJ1g6T9a7RO8FFWcSYpUL
         x1EGlzFvVZzZUquqV4+L+SkHEFM66o7PQz4/7Jz/ZmVOAg1+Iayqr2v1O/HWOrHNp3kE
         2U8A==
X-Gm-Message-State: AOJu0YxnNmnsE29v/qto4t61fH/bcAbGYIniJRsRwJHMhg4DCCXuWdNp
	0lPLodPWbKYyRvlAY2vqhoIYi4Xsm7LBjUCvGHizr0zfqCmbix2SlLKZ
X-Gm-Gg: AZuq6aL4SV+2JbSve6XnULabQwCl99NHiVdT/aRp178W1N71D3v5UY1ATfkEqoHoRbh
	x8Rf0Xtqm3RCPAvM+Wd3ssqrXvJEesWCyrE7ljgpX3D15iX54S0aHjaEMDxmLwW4/+difJ3w29c
	PcokoeK/+TBDIHFOxdEc1qLmAkGCEz0gNPOkUowFJ5lwsOsd5jt+tummxRXgEn+2qqgoJscM8P7
	SDoevotruuHNX7Ec2dFBao11eDlb+PXjXRBmzn58BhIBnNs5nY+V72D0EM8zPaWrCR49hzom1XV
	QMYdKJG2yrTl2HMYGuUQbBGAid4R0y0pPDvxzj3mgazqotse+goikpM929JHtjm7NmKmeEhljQA
	/V1l7miZt2iwRgVZEVn1Gk0f/6YKsqR9FFsjSdfKbJVpuiQjQ75ob2bkFB1S/+/Bpib15JQqJdC
	V9jQ1x8mQcm2ONEX+3zhf8xQx96YUKeTcGHLeTzcbhHqXUJy9HuDcxnQA=
X-Received: by 2002:a05:6102:3f48:b0:5f5:4121:9b0a with SMTP id ada2fe7eead31-5fdfbe22e29mr466522137.36.1770877124799;
        Wed, 11 Feb 2026 22:18:44 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:28c:10f2:1ece:51ff:fe39:a5f1])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94afd14e0d3sm1496920241.2.2026.02.11.22.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 22:18:44 -0800 (PST)
From: Santiago Almeida <santiagoalmeidaburbano@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Santiago Almeida <santiagoalmeidaburbano@gmail.com>
Subject: [PATCH] staging: fbtft: fix spelling mistake "writte" -> "written"
Date: Thu, 12 Feb 2026 01:18:02 -0500
Message-ID: <20260212061802.463237-1-santiagoalmeidaburbano@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct a typo in a comment within the fb_st7789v driver.
Found by codespell.

Signed-off-by: Santiago Almeida <santiagoalmeidaburbano@gmail.com>
---
 drivers/staging/fbtft/fb_st7789v.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_st7789v.c b/drivers/staging/fbtft/fb_st7789v.c
index 861a154144e6..9c85430ae82e 100644
--- a/drivers/staging/fbtft/fb_st7789v.c
+++ b/drivers/staging/fbtft/fb_st7789v.c
@@ -221,7 +221,7 @@ static int init_display(struct fbtft_par *par)
  * write_vmem() - write data to display.
  * @par: FBTFT parameter object.
  * @offset: offset from screen_buffer.
- * @len: the length of data to be writte.
+ * @len: the length of data to be write.
  *
  * Return: 0 on success, or a negative error code otherwise.
  */
-- 
2.53.0

