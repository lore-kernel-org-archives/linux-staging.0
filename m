Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB2C7640C
	for <linux-staging@lists.linux.dev>; Sun,  3 Mar 2024 17:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709486975; cv=none; b=lNfwlQmPARCMKngQ7bPi6mdbfsprk0mvbKSFRa5AyDO8pFWZr/HdfmDeNAqD+7kqnUKXcmG0lUo0w+cLKP0nbe8RBK48cd6A0g/rGaf0FAb4htddFCqfZpfabExsM+VL9PTK1MB2+oKnteFQQdEI/mMaHOot3YonjBGRbAq2fiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709486975; c=relaxed/simple;
	bh=28EhC5XSpteuYd/qzCd4RcejlAoQCodh6ULXimjO9C0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CthnpU0FzB68/XvhJyENP9I2ETqCFywHt1ugYWcIHlHKIdfhmeTJara2UX4y0mL0d1WnbCZrsT5amQSBWqL0uZ74462KKJ8tPewIrffiWguhRjo7EaHIdwVy1tp33/uJi+2/5d3PS4VrNV04nBevKyjbUCKbqrHPBBh6Eat9bVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljvn1Qop; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljvn1Qop"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d1094b5568so45072181fa.1
        for <linux-staging@lists.linux.dev>; Sun, 03 Mar 2024 09:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709486971; x=1710091771; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hkvXYX+ONENv8/j+tz0gO2keTFuryyaJ4d+HnaqfB4Y=;
        b=ljvn1Qop7AZepuh8Wp3VrweLmRRzxzxuj0Om7zSl+II55UebKSEvodfUJHGUHSJlKS
         rt9zSybVmB1oB2fUUQ55+QOBNr196mmQCARV6DMX74p1YrWsPDa/UpNNJmd9dK7aGdET
         ua2644NH+3BpmjLRs//GjJr99jMCLEHNXbPdJJX0u79KAd4KIDegnx+uneZ0H9+SRqsh
         6Rgb6XNyCD5DjrIIG2RXw+ePvXL9IfFazr1RELalUl87U7NUMIhlatOilsEvo09w6HW7
         38qASJ8rvKf0EItP0h/NJdAsYEKtyJFzTbOrLZC+yi4EHYOGiY2zKQQwjbvPRZzEl+KF
         evMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709486971; x=1710091771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hkvXYX+ONENv8/j+tz0gO2keTFuryyaJ4d+HnaqfB4Y=;
        b=EuMZcXu5A0bYKiqEeQ1bJw7J3mFLEXbtSvKBkviKR39lKOPCikdpQh2Y3cnI+VEpLA
         N7KEqU7N1mstZ58fUBfw6jzMfMzr4SRgLBeV4WL+3NM6vM0hjwRWI+HqHF6S9TFUuL6T
         fH1v+38jodde4BQzkpR4z/XlmEu1uJtR90d99wU2RrV/wOo4YvI/aMd0IHw9sYVdxqG2
         EOEFYzQSeTYS29qo4/I75K+QY8iOlAObIVyqQes33eeqFEmGais5qsKBW9Fx9rqOZrDy
         OI15QmLvARMCJOKGRHVK7VExUpmhYeBted9w7506SJNOUh0c106iFDVPsuvFEpWe0GCL
         KNjg==
X-Forwarded-Encrypted: i=1; AJvYcCWizPDoFtLikP7AdHoqdUDaREhcHBTQNcgxBGrLYHQynaDmoeWvVsrBr/z+5c3xPLma7Z+TugP9vTBzadi4ptl8Un8GTCPaPv+2sIvOLA==
X-Gm-Message-State: AOJu0YzHhjzkOi7rgzyYq5CLEPFFzEazKFxn3p4AZmrTsOfu3q7EJvi4
	tUgwlfZKHaND6/Gh8MGOxTJzreOPqwRrsSPeEzuhF14xywnd7IVU
X-Google-Smtp-Source: AGHT+IHyJJ/DcrP89x+IuuSiPZW3F7228qHRaRw4qu8k4MUOA9GgO+lUlyrl6G4FeFxAdCNV4uvKaw==
X-Received: by 2002:a2e:9018:0:b0:2d2:dfd6:8335 with SMTP id h24-20020a2e9018000000b002d2dfd68335mr4556684ljg.22.1709486971170;
        Sun, 03 Mar 2024 09:29:31 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id j1-20020a50ed01000000b005667629f6e1sm3695030eds.39.2024.03.03.09.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 09:29:30 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: forest@alittletooquiet.net,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH] staging: vt6655: Match parenthesis alignment
Date: Sun,  3 Mar 2024 06:56:40 +0000
Message-Id: <20240303065640.11651-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align parameters in static void calculate_ofdmr_parameter()

This patch aligns the parameters with the opening parenthesis for better
readability and adherence to coding style guidelines.

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
 drivers/staging/vt6655/card.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 36183f2a64c1..77662056c52c 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -81,9 +81,9 @@ static void vt6655_mac_set_bb_type(void __iomem *iobase, u32 mask)
  * Return Value: none
  */
 static void calculate_ofdmr_parameter(unsigned char rate,
-				       u8 bb_type,
-				       unsigned char *tx_rate,
-				       unsigned char *rsv_time)
+				      u8 bb_type,
+				      unsigned char *tx_rate,
+				      unsigned char *rsv_time)
 {
 	switch (rate) {
 	case RATE_6M:
-- 
2.25.1

