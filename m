Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9328193409
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 07:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729063195; cv=none; b=uD2Yh+v1xIHgJ/cVY+5ARgrBZ7O9165HXmOu4HW3/rU2LmFKNJmm4f9mMngm91roUlPxM9T+Otiiey4s8WpbXwioaUF1+C0k20WDRv/CprhLYikpc2u36r3T2uE26akzPaBD1ojWilkE+tuSMtFeZ8irIxBx4PAKEq88S4XRXR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729063195; c=relaxed/simple;
	bh=20bnFoPKDbLPVMTGyYK5V3qcRiT2PJ50MaAdGYRnu8E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=piWukc7E4i3TsRgWhyayh8A+NofWi3GMFt61SgIw/hBL/s2DYGhStvg/YqrallQyYdLeJoVkmEUaqfabDQFboko/U1rD/GqwovjDAjY2TFs9JSodYYDzvI6kmAhyRnTRyBEW2oGvuWaSq1ax9iflV9B48zly5DZUwsskEuOLWBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DzcxcyGc; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzcxcyGc"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20c693b68f5so64836645ad.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 00:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729063193; x=1729667993; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ORRdXeranIroI87MdpV/cKKqGxHy63/cqT3DlViNNmY=;
        b=DzcxcyGcH7Z2szWmgmEYOLHJe7EvIQ+kvk3K+NcrRpAMU0ZNg1hzVMxoIIFejHO/Lx
         bGSQ9924r4Ys//3QMk2fCDblDffqQXYaS3CK1aaf/ffO3PrtksRkp+APmXKKdOW7K0LO
         hqJsQqdu2Fq2JQRYoNFb0pXeFjSaw99BkpmM2raJ4R2zKIOunsAkXIoNr81Mcrjv55M0
         rZ3KTjH41avzaY9Ku1KFU8H+4fEFItfCp3XDN3Aix6hSSosqJhXzn1l6AtooT3opeTlE
         ubqmaldPUc3azgLWHKknLhMyNBmhh3yoWQbvmUCyAcpgFj3Awo3ze2lJ4KPS84Nh9vFo
         X/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729063193; x=1729667993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ORRdXeranIroI87MdpV/cKKqGxHy63/cqT3DlViNNmY=;
        b=ppLjHRL0teuCu4xL814fh91liFTbGwO9kEBWzDRQBhfb2ElkoDWseMiZ6z9l1yHnDl
         c4Gg3NupMj4QyBUxQPgLjmGp5yBnYDXe8T/2c+nVbz/d5lSw22v0XFhTdZA08/wufT3O
         6m3C/X2DQYPH6UE4CVQTZFYgxiEUV7FioixCWGQeLKBKHgpVkjOAykpj9nRy00TiiuNl
         hcwv+9uH6ITY8fktMMwJqHt3FTDsvEjfbW2qfdRvTb2zTbZ+8t0GQyZSzkOGAUwi8xwD
         On9DtyeK5IKqQPBWcLNvHw0B1gtbBm3IIuU1VcbtvgR5nWiYoULcrlpA2l9sLwpRKpcG
         Y2KQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiblt13WuoI00PUknf35Fut316ITzyQRl8nBufqTDmYVAovpAi9L0mgaAVHjEsOlRMbrcN04DyCdGG4Jzs@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7yPPda9KRZnp+aw81UJL62E5DBuayaJAIl01WtTuwj6kGEMDx
	4r0/D/9rOJ+d+SxCLuxd1S7ktns6vPiD07ZV7A+8a9w0DseucgYt
X-Google-Smtp-Source: AGHT+IHVhO1haPkv3eqY6vBJ5eR16keLbXkNRgpzWheFvnqzrJrAhxR5Q/Kdzt/ENgq+UbGiIl29wg==
X-Received: by 2002:a17:902:cf09:b0:207:4c7c:743b with SMTP id d9443c01a7336-20ca1315ec7mr227619165ad.0.1729063193134;
        Wed, 16 Oct 2024 00:19:53 -0700 (PDT)
Received: from dev.. ([129.41.59.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d17f9d2ffsm23109415ad.100.2024.10.16.00.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 00:19:52 -0700 (PDT)
From: Rohit Chavan <roheetchavan@gmail.com>
To: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Rohit Chavan <roheetchavan@gmail.com>
Subject: [PATCH] staging: gpib: Remove unneeded semicolon.
Date: Wed, 16 Oct 2024 12:49:41 +0530
Message-Id: <20241016071941.1615135-1-roheetchavan@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch cleans up the GPIB driver code by removing
unneeded semicolons.

Files modified:
drivers/staging/gpib/tms9914/tms9914.c
drivers/staging/gpib/tnt4882/mite.c

Signed-off-by: Rohit Chavan <roheetchavan@gmail.com>
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

