Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4222137E
	for <linux-staging@lists.linux.dev>; Thu, 14 Sep 2023 20:07:19 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2bfc5218dd8so21811961fa.2
        for <linux-staging@lists.linux.dev>; Thu, 14 Sep 2023 13:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694722037; x=1695326837; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ry9s078EXiAMlrtPVQmJBgmFI58bw0qDCvSBdknb1Y=;
        b=mMACUgd8dFrvjCFfCKpA46HusPgHt5kNMHaLFbxVEezOkdfiHhl+k6C2cn49ek61Ds
         ye3MxNFI9H+mTm7g5h8O+ILC9F2rRbbWUlaznjnYzBqKxjA/zT1TR/NbzyfDV8TT1zEq
         wfUwLk4nFiICAXKsp/SbKHrXPYpIjo9sKR0lPQkEwrkiiT8avA0pM+KdjfXAN3V80GCn
         Z+8kU0fS4McfGuACavtvfSn/0LgHqitOEJHmlNCJfT66xoSrPt15s3wP89Kr5uzi2L7A
         j2tEidaR9/x1avn3dyqOc2f4NPSifuMC53YL5CpPt0gbLz/Ino5njZVr2uFXERsLCiiH
         oPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694722037; x=1695326837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ry9s078EXiAMlrtPVQmJBgmFI58bw0qDCvSBdknb1Y=;
        b=q/zxGCITMF+ywLqhB/yf5pdiTIhGDjdVoqhWdgHPd2Dgjb8/WBsoZv/RVEhoi0kcCY
         pVHBsckl6HLUpb/13bbZQtQ6b27xGdVq3NoxH2n4UjOb6yjhDsAjWhckS1IJVkoW7XcM
         Z3AcmA5v3T5pUQ1/CnjMjsySlzCmmz4wy8U/NT8phGkA3ZuzWG6oi4QuuTfanxSPqmkq
         dLN9t8f7YBeTcjYPsF8FlLikrqHWTy7Kfuqh7IaL3tnNThOrRwJZ+7qurZESSjW7Z78H
         oPiZEpHVEx6IylzT5m3HKCeBqaSmBFxF2vTiporK35vT45JSWP/a7KSCj2VTBAsJGrUH
         +A4A==
X-Gm-Message-State: AOJu0YxINIKqsPBYrMMixMfVZoTysnI2mHcbzQcbHJODygqXCAa0nHGs
	O8pNnpO5UxkjPWumI0tz6Yw=
X-Google-Smtp-Source: AGHT+IE4QrJGJnzm6+9tMJvwmQOMA7/wp+Mi3TzvgrT240zk3wvBoqrwBG6BW4ylOuJPXcnsKk/9Kg==
X-Received: by 2002:a05:651c:144:b0:2bc:bb46:4fc7 with SMTP id c4-20020a05651c014400b002bcbb464fc7mr5580338ljd.24.1694722037327;
        Thu, 14 Sep 2023 13:07:17 -0700 (PDT)
Received: from HP-ENVY-Notebook.lan (81-229-94-10-no68.tbcn.telia.com. [81.229.94.10])
        by smtp.googlemail.com with ESMTPSA id y16-20020a05651c021000b002b9ead74535sm418368ljn.15.2023.09.14.13.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 13:07:16 -0700 (PDT)
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jonathan Bergh <bergh.jonathan@gmail.com>
Subject: [PATCH v2 1/2] staging: vme_user: Remove spurious newlines between define statements
Date: Thu, 14 Sep 2023 22:05:37 +0200
Message-Id: <20230914200536.47619-1-bergh.jonathan@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed spurious newlines in define statements so that defines which
should be grouped together for readability are grouped as such.

Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
---
 drivers/staging/vme_user/vme_tsi148.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/vme_user/vme_tsi148.h b/drivers/staging/vme_user/vme_tsi148.h
index 63f726e1811a..dbdf5dabaf90 100644
--- a/drivers/staging/vme_user/vme_tsi148.h
+++ b/drivers/staging/vme_user/vme_tsi148.h
@@ -96,13 +96,9 @@ struct tsi148_dma_entry {
 #define TSI148_PCFS_MISC0		0xC
 #define TSI148_PCFS_MBARL		0x10
 #define TSI148_PCFS_MBARU		0x14
-
 #define TSI148_PCFS_SUBID		0x28
-
 #define TSI148_PCFS_CAPP		0x34
-
 #define TSI148_PCFS_MISC1		0x3C
-
 #define TSI148_PCFS_XCAPP		0x40
 #define TSI148_PCFS_XSTAT		0x44
 
-- 
2.34.1

