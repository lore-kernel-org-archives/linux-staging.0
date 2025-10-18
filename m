Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA14F7483
	for <linux-staging@lists.linux.dev>; Sat, 18 Oct 2025 10:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760781746; cv=none; b=CvWp+KVldqEDi0p9Q/amRP808xgHPLtK4NhAOYrIsKReAEeQn3oS2VlTaD1LEUu57EevCs7LExbTF01M4VXVIZlYcDrBzZHGcUib89WB1tEXzwiQxmUFZSVEtMFvsFKUc74WVn0CcbHJWXMgmMAcVAoHrSjVLiggi7UkInQlfZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760781746; c=relaxed/simple;
	bh=Hv5Ljs6FrRb7pUSsiQlacFfe2Qskoh1xdRID9+T001o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GjipTo6e+9sj1CigFYf+SgvxmRVPDvix6YXTXXnIzEzYCCH28KZokTpeItsHnKhVsEbvt4NkpGKjkg7ZiHpbtyaM83b3ZCNkudGd15FCKI37J+TAiHZ+Y5Tq1teD/RvxnPDXLHBVO6T+4C1y4PygNnE4FHaghgxp3O7ortiGxpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZOMRi439; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZOMRi439"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-427087ee59cso193198f8f.3
        for <linux-staging@lists.linux.dev>; Sat, 18 Oct 2025 03:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760781743; x=1761386543; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HzO6VhjvKwAMDM8uxT7kMNLFUoCoiaoR2UQ4fRpNG0A=;
        b=ZOMRi439wQinTgjGEsiGvNdE0ynN1QNZdpq1QHdQUno6M12seq2tq+vkdY/42Y7DGu
         Y/xv/gYq29/hWNnGe550459fjEsdIcPOteutxrcl8CBh3bgCQEJ2OYQr2nbcJR0JRsHd
         SI8ILj7XvFZ5fFYaIdW5usu0gSlFecIKPcIHx1hT8v1VpBiemKsoDE/hu9ZZ4IcA/bJ8
         awF2gkPCOInuBPcBtTqH+y9DYBFrngINNethCJuY1+9tjg5g9BbzbHpe1P9jSUvrW90p
         oIgWPIpuXCWhZcgsFeeHypc3OozoxGxrmPmgsQYp3PWaJJL2acOKKDxRl1lPdeF5VEgm
         qvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760781743; x=1761386543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HzO6VhjvKwAMDM8uxT7kMNLFUoCoiaoR2UQ4fRpNG0A=;
        b=pID0Wwx5nA3Ufm5519Cu0ZaJCEAKHyvR9CQoq7S2WH5SXV3dT9xTCKfimQnUzjRcZ0
         7ElAygcujoWBJMbAU8oH2t2lrvvJtAUiGilxKjKq/ipibOcxtXXXBRt6ryZmgP7n7U4x
         3bY3AWG7RXwG1mCyW6jCG+RmWQcjM9IwyndrAophT33QR6TIrxJX0Z8QNdRgHoQS/csT
         +ovnsUbNqfZeu/Wcf6TcyTnZKZ75d2rwwgMrk4o9YCp5weKYZ7OdN86or1o9notouRxR
         28JjCw6UhPLXYRv86huikSTx0TK1jmqpeW79GZH7iDz3vf4CpurjNEWn5jvouG3kX/NZ
         dmAA==
X-Gm-Message-State: AOJu0Yz+oXbA8KAgGZBI6ELSKMZOx4ykrwckyhQyHBUvwr4YnHGEOfXp
	Lltc4epInF/PNYNX2linbJDOmXIPDTE3iO7bhdn8cOzmbs+lnMy4n/xZ
X-Gm-Gg: ASbGncvM5uZFiUohLaKY4KTTSJCNlukV4FAT7TQioGyFGaNx4ruNVeYRHH2hrFrZS+k
	9BuvRFfjfp4Kvb8wtb5+hZq2TWRBaDGHdMTqJs3PEEzw3AOyb9QlfUIvNN9uA7QQ9ZC5IyXBSpK
	UCoRWIEMi2YHd99W/R+N2W7sZ5DfkuSny3MCIyfP2189sYPf4m8UOanozGTvHQray79+7XvL18v
	8PJmyg1VkqnUoKOqsctwgTl1kLS58mlK3/M0yx51LI8i40lOq2BghaA8vtJisP4MgEPUzwKZTFY
	veIqcrEpV1WNI9A+yp86q8D9zRVN3QcEx2+kRK8C8Y3iPiw4PUhtMiY4PDs8+uWBtjGZ15hjg6t
	DMuFRMsbLtkADkq+U4VIBpzSmx80ZbJ+rWgSPtBEHxrLjEmh4VMhCQrreykPjOfDB6u6uigAJ98
	y33NGKYmge/lYzY7N75JjpY/iLr0T9
X-Google-Smtp-Source: AGHT+IGm5LhdP2RVNXXTMlqsV14F6UhwcvN7Dc7JGFx+1hiln4OQn6+xXug92t2a/wtB21DossPS0g==
X-Received: by 2002:a05:600c:4748:b0:471:1387:375e with SMTP id 5b1f17b1804b1-4711791ae91mr27636305e9.5.1760781742808;
        Sat, 18 Oct 2025 03:02:22 -0700 (PDT)
Received: from fridge ([46.154.89.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715257d90bsm38774485e9.2.2025.10.18.03.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 03:02:22 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Emre Cecanpunar <emreleno@gmail.com>
Subject: [PATCH] staging: nvec: remove NVEC_PS2_DEBUG and dead debug macro
Date: Sat, 18 Oct 2025 13:01:57 +0300
Message-ID: <20251018100157.3231-1-emreleno@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NVEC_PS2_DEBUG macro and NVEC_PHD() are unused and only add clutter.
Remove them completely.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
---
 drivers/staging/nvec/nvec_ps2.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/staging/nvec/nvec_ps2.c b/drivers/staging/nvec/nvec_ps2.c
index 575233fa1677..2db57795ea2f 100644
--- a/drivers/staging/nvec/nvec_ps2.c
+++ b/drivers/staging/nvec/nvec_ps2.c
@@ -23,14 +23,6 @@
 #define DISABLE_MOUSE	0xf5
 #define PSMOUSE_RST	0xff
 
-#ifdef NVEC_PS2_DEBUG
-#define NVEC_PHD(str, buf, len) \
-	print_hex_dump(KERN_DEBUG, str, DUMP_PREFIX_NONE, \
-			16, 1, buf, len, false)
-#else
-#define NVEC_PHD(str, buf, len) do { } while (0)
-#endif
-
 enum ps2_subcmds {
 	SEND_COMMAND = 1,
 	RECEIVE_N,
@@ -70,18 +62,14 @@ static int nvec_ps2_notifier(struct notifier_block *nb,
 	case NVEC_PS2_EVT:
 		for (i = 0; i < msg[1]; i++)
 			serio_interrupt(ps2_dev.ser_dev, msg[2 + i], 0);
-		NVEC_PHD("ps/2 mouse event: ", &msg[2], msg[1]);
 		return NOTIFY_STOP;
 
 	case NVEC_PS2:
 		if (msg[2] == 1) {
 			for (i = 0; i < (msg[1] - 2); i++)
 				serio_interrupt(ps2_dev.ser_dev, msg[i + 4], 0);
-			NVEC_PHD("ps/2 mouse reply: ", &msg[4], msg[1] - 2);
 		}
 
-		else if (msg[1] != 2) /* !ack */
-			NVEC_PHD("unhandled mouse event: ", msg, msg[1] + 2);
 		return NOTIFY_STOP;
 	}
 
-- 
2.51.0

