Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD6239F185
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 07:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774856176; cv=none; b=pO8Q3+EDRMi6dSRFr63ksD8c4vul/tN1hPw5qwg5c4DPwkyiZ5NpRAJPzfRhWP8pOk4Xrcw2wUpIEspne5Sk5Y4Eh32mLk8lrqYDlzKQleApNN8sv1QyEINZXT3gWthmbV+wjz8AAFopAw/80rrvd/1/B3lmWvcrIxtACzH4QZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774856176; c=relaxed/simple;
	bh=gmQ8qib91/MURsT4umIJTHqgTjd7DNDJ0EiCZzRTbu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eBXq/NLHZ0+ZZueT9HsOARjGrKF/EevqYN+dbX4wbsknaZRntuGXsaZEvNtB5+T8iP3VLymWGOpMaWo9QT3rPEMR2tc/pVZZk1nHApsJ7bJqeOdWrNdHvSsntfBdVxiCTy+KaN1uydpTPEtvG1LLWmX7KGbnbGz51qSnSrvCRco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B3iTPUzX; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B3iTPUzX"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4873ce69ba9so5778115e9.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 00:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774856173; x=1775460973; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gnd3vtjEEK1Ylf3QTK0JvWS8DR77h7l5RXxPFxFA2GI=;
        b=B3iTPUzXThID1bO02uk1BQzB8XcUo/6g1YpFXtGPuqkqV7IfYEIcZzBe7I1Mufb/7b
         TRBH2KtSzq5MB1zeXE1A3lZs6p/nFD+x12F77MfGFVyeeCG3HYGmS/mJ5B7XLZ0qQTNW
         2g5DT/QDgcY7C4O9y/APFefcQdNHpanwWf8ou3LvewgHcBwpgtkHYXgogLje3gOwRxxb
         4E3lVs5ElTS1mUeL7aLLUJrpVkZMLYtPks9M4sUBLGXVdKpe4d0wP20XwD53Gl5wycfo
         zgotTD23PWVxkqvhMkMF96nE8cbKQoeEvg968ihTX2LQunvEiROLo1M0vOU7tc1MBOda
         8xYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774856173; x=1775460973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gnd3vtjEEK1Ylf3QTK0JvWS8DR77h7l5RXxPFxFA2GI=;
        b=SwwP90t/MVYXGINEngLVhPM2ksT9wohRzhWETCD9NX3rXx24pJPqp7KMRcTkPX7uIT
         Ugu8oimngEy+vAGL1nQxn0vHwbvFyKoLcvGAdKLGYu6DGbWIXSqu3wZmdqhHZAUw2Ya8
         uF3idQnOTryElbsXPF3xAlcZDEcqummXv2BtLdptkuQDPCBajN+J97DL1wTKT+JCh87b
         bfYsekK20+LNIYWThoienmvkzQ9jN1Z9JeE8Gtv5QyZ291G3s5xMSPuVhPdLmzvFrGkD
         qPdkl0LCAOxizlQj3106dbvlXe5GM3RWdgKrGSGBl7IF7Nqna56UV+bRKy2GYt7tRdaD
         92bA==
X-Forwarded-Encrypted: i=1; AJvYcCV+ODowVlSP7NO6Jc6fIz5HHIOJzYdGqFRRllfyJW9Qr1Qj66gyy9fyiueacFORybv4yHpct3vvBx+kO/fr@lists.linux.dev
X-Gm-Message-State: AOJu0YyJhj7V68C/B+PJ6x/M0hazOS8dzo2n7bdNUzwHVy4zOOA5M+Tb
	gGVrMRRU1JG4HiKibipRu5gFO1sIXaGrv/pd+Y5sWty3pZwKwggO0Bk5
X-Gm-Gg: ATEYQzxD6dZ1c56GBmpFzmulTgA87vgYztXRQfT6R/fg6jXM+w4vP2PPL+rr4zDgvlx
	/bqKugZXlu5wf/SgQc/3xcrQjWq/oqSSxo2roFJABqo+XikjolzIOdijqgb+ITjMFGjdhZbkLmS
	92WIJ5aE/O6zbyzadgnDGau28hmdu0HTafF92uLwacqrC/5bVNwwjpwno34ggL4s0PxPG5wFz+2
	RfoWE+8x5mCKQQzPtE4HQILiYtjC5O/BTmaMvKw4R4YNyCbqBjWJgD5x+dZ3Sin7DJRPkODMKuF
	Spq2PuRvkjc8FMyqmFCAgrCnTtK0+/M4sS4bCzePyOPauj2FpJhW+vPNxIeFPYcW45DYqZNYu0y
	/YMTk+0fSEj9/EFcm82/SUKqf52YfCSOKN5Jk3oOvyQXnn+GeIDivSmwxeAbWrX2sVmBcUWUMDj
	46DLJc3uNTwMHZWab5tEAtiHtPQlVGkK0ty3jq+ROwsM+YyggmAmk=
X-Received: by 2002:a05:600c:3b27:b0:485:3aa1:a7f1 with SMTP id 5b1f17b1804b1-48727d5a252mr194547585e9.7.1774856172717;
        Mon, 30 Mar 2026 00:36:12 -0700 (PDT)
Received: from DESKTOP-IHE0QGF.localdomain ([86.121.12.60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722be608bsm389407255e9.0.2026.03.30.00.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 00:36:12 -0700 (PDT)
From: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	d-gole@ti.com,
	m-chadhry@ti.com,
	Serban-Pascu Robert <robyserbanpascu06@gmail.com>
Subject: [PATCH v4 2/4] staging: media: atomisp: 
Date: Mon, 30 Mar 2026 10:35:47 +0300
Message-ID: <20260330073549.5782-3-robyserbanpascu06@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330073549.5782-1-robyserbanpascu06@gmail.com>
References: <20260330073549.5782-1-robyserbanpascu06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct a spelling error in a comment: 
'uninteruptible' -> 'uninterruptible'.

Signed-off-by: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
---
 drivers/staging/media/atomisp/pci/system_global.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/system_global.h b/drivers/staging/media/atomisp/pci/system_global.h
index c99fb649fb5f..6420436d88f7 100644
--- a/drivers/staging/media/atomisp/pci/system_global.h
+++ b/drivers/staging/media/atomisp/pci/system_global.h
@@ -28,7 +28,7 @@
 #define DMA_DDR_TO_HMEM_WORKAROUND
 
 /*
- * The longest allowed (uninteruptible) bus transfer, does not
+ * The longest allowed (uninterruptible) bus transfer, does not
  * take stalling into account
  */
 #define HIVE_ISP_MAX_BURST_LENGTH	1024
-- 
2.43.0

