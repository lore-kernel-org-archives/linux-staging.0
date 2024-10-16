Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064E01D63E1
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 11:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729078221; cv=none; b=sPGGhGPhJQ91K6G3hLzS2I7nmOa0inxlKjyn9cdyG5RIApKGHJDbiQp2MH261tPBMz+/79+nAZuojlcRPPpHepHmuM3zcuaxBt7Wdi7mkozBxKDJa/6ZzUeu4vuqBnFFZDeHNgodsJBC5SJ/erFsXa/9hV6PVx8iYctbvL8DEHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729078221; c=relaxed/simple;
	bh=6mNog43tW563Jxg6ZE5L+OMs0VpPqDUyOVAWupos4Yg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hzFkczU8AsRbl5UxKQAABwba+TqIsftZUYQc6sqIzbjZXYwUzow+5+H4VyPWBZUkwn9fYrA3CO6TelOVQK1ix7drLORlYHSlL+EaRIp9eEJzBSscJz2kr1LgqNyPeui85JObxN3qJMoohf3QoveyFGysX6DkgVpFj+4abdxVk8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZsZg3L6; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZsZg3L6"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20cceb8d8b4so5821265ad.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 04:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729078219; x=1729683019; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kQl5G0/AI1StBzfhAYLo7LwBo9nukakIzwgbx3SL5HQ=;
        b=bZsZg3L6lP/J25J2tt7JtycnJrYjRA+hT/XOTWTYBdWgUiiP4zP1dYkQvfr0L/SXqv
         tgEh481Z3EjlxHKSl2cDWNTRBbcuF/l2ljuhaDPxLii98FuBQ28CtMy2nNQmY3dJXWNB
         jc0xTYc39kecYYUMz67ejjG1B3xPFAw9RnA6P07yyS6Mqzo31w261H45ciiPQVRNQrgb
         tCJetW7sg0z9IhJgQFzPT8f2WqtOkh3gGSV4zvwvj0Q3n1f+qxrFhjF1KD9qNEmw0XA9
         kiC2+q/XvDUH/fk2Df/6NSBgpgftKJR/AK6iqov3+VturIb0Qej7Wa6GsylEFEvQgPe4
         Te3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729078219; x=1729683019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kQl5G0/AI1StBzfhAYLo7LwBo9nukakIzwgbx3SL5HQ=;
        b=cbmNx7dwIp3pKUglmc1A/MxBN1u5OkWKXIBloqc0YuiacHhLPknISRJfkQzPhpCMnP
         GnZo0pP5IT0tQLuKNGw5J9GmWIEXwmkcCqwLJmjobLGBpIZgmUJQBl9ldVWT41b+5mOL
         WJKfUoLp29buDS5fCtA4klM26zPlTjq2T8acrZnqrZSHflkQTa1Iw2ltSlythrd7lAMQ
         B3Xkzemqo9RRVw2vSXwsqdMUwwtiRMMtTfyqWxmsMYiVxiSkJ77QveyQ2KMeM1W6ysN3
         FyAvorZ/o7vZpmHR2bGRvUSvLyrZMCkNkRTH0++fbD+itUjYzoHaGK6oxMuz6QiNtERj
         3zQg==
X-Forwarded-Encrypted: i=1; AJvYcCXwjeW/sw/DkC28Bkvf1WWj35kBIINPr72FtUr39OtwYoH6IumTiLRQ3WsB13Becdptkx1IPCkN8HCjdxoc@lists.linux.dev
X-Gm-Message-State: AOJu0Yzo6ROxWTvJ+KpKsApG9f0qjJYM2zV3DPP5j4k7InyIDWqZ6Olt
	L0DllNmx2w3vEbJrSuAr2yoMfasSU6D5yBdtHOiuFxpodkdIFsSG7sqXAsY0
X-Google-Smtp-Source: AGHT+IHtcy8eg5KYhfU/Pds2Wh3IVDzktpMJO4CADGPtpjwiShD7kSqhO3e3G+Ufo21QZ5QMZb1wPg==
X-Received: by 2002:a17:902:ec87:b0:20c:b6cf:f465 with SMTP id d9443c01a7336-20cb6d002c5mr285637545ad.6.1729078219113;
        Wed, 16 Oct 2024 04:30:19 -0700 (PDT)
Received: from dev.. ([129.41.59.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d1804c119sm26899015ad.190.2024.10.16.04.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 04:30:18 -0700 (PDT)
From: Rohit Chavan <roheetchavan@gmail.com>
To: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Rohit Chavan <roheetchavan@gmail.com>
Subject: [PATCH v2] staging: gpib: Remove unneeded semicolon.
Date: Wed, 16 Oct 2024 17:00:10 +0530
Message-Id: <20241016113010.1619275-1-roheetchavan@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch cleans up the GPIB driver by removing unneeded semicolons.

Signed-off-by: Rohit Chavan <roheetchavan@gmail.com>
---
Changes since v1:
 - Make commit message concise
---
 drivers/staging/gpib/tms9914/tms9914.c | 4 ++--
 drivers/staging/gpib/tnt4882/mite.c    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/tms9914/tms9914.c b/drivers/staging/gpib/tms9914/tms9914.c
index aa2308cf5477..6d75294412d8 100644
--- a/drivers/staging/gpib/tms9914/tms9914.c
+++ b/drivers/staging/gpib/tms9914/tms9914.c
@@ -439,7 +439,7 @@ static int wait_for_read_byte(gpib_board_t *board, struct tms9914_priv *priv)
 				     test_bit(TIMO_NUM, &board->status))) {
 		pr_debug("gpib: pio read wait interrupted\n");
 		return -ERESTARTSYS;
-	};
+	}
 	if (test_bit(TIMO_NUM, &board->status))
 		return -ETIMEDOUT;
 
@@ -473,7 +473,7 @@ static inline uint8_t tms9914_read_data_in(gpib_board_t *board, struct tms9914_p
 	default:
 		pr_err("%s: bug! bad holdoff mode %i\n", __func__, priv->holdoff_mode);
 		break;
-	};
+	}
 	spin_unlock_irqrestore(&board->spinlock, flags);
 
 	return data;
diff --git a/drivers/staging/gpib/tnt4882/mite.c b/drivers/staging/gpib/tnt4882/mite.c
index adb656a5eb2c..882cc4bc122e 100644
--- a/drivers/staging/gpib/tnt4882/mite.c
+++ b/drivers/staging/gpib/tnt4882/mite.c
@@ -82,7 +82,7 @@ int mite_setup(struct mite_struct *mite)
 	if (pci_request_regions(mite->pcidev, "mite")) {
 		pr_err("mite: failed to request mite io regions.\n");
 		return -EIO;
-	};
+	}
 	addr = pci_resource_start(mite->pcidev, 0);
 	mite->mite_phys_addr = addr;
 	mite->mite_io_addr = ioremap(addr, pci_resource_len(mite->pcidev, 0));
-- 
2.34.1

