Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D97122619
	for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 03:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724209743; cv=none; b=CMQWH9cEJ3J+3dsjq/VOHXKygR+s40Das5RE5qRRsblH/Vowyu2EhHwJS0Mg9fVeLFeUDebGPxBDqj1KbMZLPQoPxBnychNqexvFlEhNxloaKk/jUD57jEaw1EwYEzzkcM1X8t5KllcqQ2w16thDh9Hi/0Z292hT/ST/nboqsFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724209743; c=relaxed/simple;
	bh=EhogGN/0K5c0wQKRDXoOsl7gKqhK/nqe6q5HBqpRa/Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lwgaGzGuJPM9cETQw3d8pKuoHLn0OIBJUisDyUCJ6xBrsnubFhgG63f6P1o2r581EEafC0T4ZeUDBxslHsp7JvQi+tMqGIF/paZA32VQ5axfJLinNVT14JmmKPpZnmgdAJJ/VTafi3ksxcJO2gmGYFFbe+U9DaoaN9KhReJ8g1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=JuRcsTxE; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="JuRcsTxE"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7105043330aso5037594b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 20 Aug 2024 20:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1724209740; x=1724814540; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6x6dAOtaMiziM8hI7NOqaYooQRvRtzAARw8c3hYwAkI=;
        b=JuRcsTxE54TcBevL5IOFsK+81Dimq2asJIVxLCtHmfPaqhpn6+ex2nIzs/o2vwDmAy
         33dbprt0QgtrPo2UZANQxbrhmp7VcYZD7J3XZqgDn8TgdRIOOybtuLDhVqWes/FDjybG
         6EQcSq2KY8dpYgvoHS7V5lO2larwajzf2Z6VFUw1065zpzyXzH8HsDpc9uY0MmU2n/hQ
         KMUQkMTdDWqm3qvlwrWI54qkcOdX/3/s76W4+0fL1h+XyIiVa2TYGIwYg87nnzXQpkqO
         FuIBHfQ6u6JCLqc74NGs4xOhwPoErYHMhFaRxRzgrBL9QRl9neytK2zdyRi2c5IW//Xn
         F5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724209740; x=1724814540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6x6dAOtaMiziM8hI7NOqaYooQRvRtzAARw8c3hYwAkI=;
        b=sw78bt2dmJY9vxITpePzGJjhrrtAYCsWvkctCAhCZVFmfUZ0+ihsSxo1zVKoDGYzyM
         Xiojl7qjm06i0DB8drza+/6F57v2JxYI/JH2hTe/f3v2wDA2QZOm0CsEhwEMHaI8yaGV
         V9lXnGZGE1LpQeSHgF2l2mcN5s0ZGXHbkLnob6GiDBu9VgNU74bYh4YsVSS5lBVWI00s
         J+MQ4j/zSkwuJI50uH7a3o/eKrqPcwwEvOq3OxkmzHzaAXU8Oau3XSGhI+L0PZQVidmO
         vrBJU7bDOuFv5PZNAtm574Xt0MUcRBFuX4204dBlk/m8IN+iKikwE4SH+EgB+e+cI1LP
         l3oA==
X-Gm-Message-State: AOJu0YyZLWx3inuT42RU5Ji4wNN03muhmklHdN2XhdSKRpPuLOKQttqs
	TgpxfgvJA79jkFfpVlvcavlnj4iCJWlhmvE0l5wZNpl5ZdJsmRdkiv17ZTJxDxVYTCaWJuznFvp
	FBx4=
X-Google-Smtp-Source: AGHT+IFkSlznMyLs3v8wqjC5glkCuAOH8oxqlC+SiRhqisz4ba/yX5OBuf89WyteBz6zJthOmCYx5A==
X-Received: by 2002:a05:6a00:9190:b0:714:2277:3435 with SMTP id d2e1a72fcca58-714234657b2mr1361859b3a.11.1724209740461;
        Tue, 20 Aug 2024 20:09:00 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127add75dbsm8934404b3a.44.2024.08.20.20.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 20:09:00 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 0/6] Staging: rtl8192e: Style guide variable renames 
Date: Tue, 20 Aug 2024 20:08:50 -0700
Message-Id: <20240821030856.57423-1-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series renames variables to correct style guilde
violations.

~Tree

Tree Davies (6):
  Staging: rtl8192e: Rename variable CmdID_End
  Staging: rtl8192e: Rename variable CmdID_SetTxPowerLevel
  Staging: rtl8192e: Rename variable CmdID_BBRegWrite10
  Staging: rtl8192e: Rename variable CmdID_WritePortUlong
  Staging: rtl8192e: Rename variable CmdID_WritePortUshort
  Staging: rtl8192e: Rename variable CmdID_WritePortUchar

 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 18 +++++++++---------
 drivers/staging/rtl8192e/rtllib.h              | 12 ++++++------
 2 files changed, 15 insertions(+), 15 deletions(-)

-- 
2.30.2

