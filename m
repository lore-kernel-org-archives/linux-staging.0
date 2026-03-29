Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B3B387357
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 18:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774810168; cv=none; b=apGKuLlgxWqi1r1srRe94LTxKi5o5zwy3OfdhsdEX3rKF3eI3NvhQ3JDlnsNpIjoRy3ubiPnFZa5nNKMXnzSJFA7I7qmAB36IV9nWspIYQV+vEtDJrFsxeDUbv+hGV44bisXTDEAiBkUq3deIw7vMaYMT5RYP77iSs/nP6K48VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774810168; c=relaxed/simple;
	bh=gmQ8qib91/MURsT4umIJTHqgTjd7DNDJ0EiCZzRTbu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RTD+Be3B6HleNyxlsjOr22vw4NBUbibfEGYhxMYGy1XTTZ6jDHwDuZsFuBSJiaWceKRTVQrnP9JfH4e0euFjPrU1qQFuP52jdS9LzUfHgV+u16wbGqNAadlRpUsmrc4I1UtIgOQv4p/SX9Y+zFTPyp3dqhgeKnzBGHVaYZW0OfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YIHeiQTX; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YIHeiQTX"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43cf3ee0fc1so693166f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 11:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774810163; x=1775414963; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gnd3vtjEEK1Ylf3QTK0JvWS8DR77h7l5RXxPFxFA2GI=;
        b=YIHeiQTXwVLzGOWYUuF3Di32lzrsxqR7PU16WbRpKFpQ68Vgp90WhgHOfGJ02eLS/r
         R6JeCoTMG+GwYefrT+e3nED/GKmU5DbZ5Ta1X6htH77DSeiiAfgkVXBpG0/UxApTtYyK
         Ma+2+ail8fR8uKi01zZYwZaMKRe/+Csijbze7CZ1arRfgeKdAeGpq2LUEz/b0PHWcTi2
         ghXAZaEnKkXWGqgd/4JEpTPpZFTbndQGwuwRTiM7tRaD348PoU76BttPMNBs6LoTHj0y
         LvbpBkTW/DZKCjNrwHcZmb0gv2/wiAe7js0UuYpvIvmRD6wfvBNHc84Cv+L0KeqC9bnA
         tFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774810163; x=1775414963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gnd3vtjEEK1Ylf3QTK0JvWS8DR77h7l5RXxPFxFA2GI=;
        b=Dmk/vlyXxJPLdN1xSR9ELDI6qdQDOa1SriNzAvpWVoQKYtpdykZFORdySAxapUFuDy
         ssNTF09SUfGc0qryN4sU6BJOddWfPvaENzObO9QbJJGDadHUBfkQKOrpgsXmfRF3/wNG
         6aNS7UUifnb94TtjlmEGPfOqhKVO18cWxvO7YS/lsfFz5YrNT5JF2XzDJym/zyhgxMJa
         51i2uwmBEbt0b30HanBuW423gP79ufxNpXH0K60koRW3aX0M/sFG3m8byoIgzLcUojC/
         a/CGoDW7cGQksHjNZ/6tlMrewqAmiGM5pExsWxQG4Ybi6D2NQOV15Sm6T6vLmTir18Oo
         UQKw==
X-Forwarded-Encrypted: i=1; AJvYcCVXVVVPMkRlLMyvESP9bQCncqErPZJ35dJYUiEicO8XIM+h/xEkUOJthedYHterkN5aY37tJJJ0Og/0y8xv@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/R9XGZsINrfhwPJEBQ55rV6NANwQC1Tb1m1c0WvpWQoVN/wSu
	Kn/Ab5oA0/wCPuAb++53vrcfgbLhKcCfjsZ9b2gVIwTDGQSaXstfDLx3dAXkRKTsig0=
X-Gm-Gg: ATEYQzzywaILg9tYZpJ34WFGnTTO/LdlPif/WEowxA4OcPSF3+hQxWyDfv73FltqAu+
	QAlDpRsongMpLa/uBE0bBLXYEO+/bUwtrL0vsuLMTOxSwviR29G7xuqUGS7mxVPI/fQybwH/00g
	rH3RJmCFs7Rsp4ci50OsAPYE/1/jsS/IYrJBHEv3kNEhq7CASOxQWwcDqNeSSUeiPuLl8h+g7Vl
	xXXaqY/y83Po1k25keCfLXhY22cQ14RWEJacBm1BiS7ulhVdPM43rV9wFo7KWBeKRR3iu/h4/MP
	jLHGEcqRinakEmf+52DSWkNnl0r+z+LFpMrGba1yfXdNB8Fl8kXyYkqsg/d9fptmqwm6jjMSbhy
	VAQ0DZb7bULiWlSBkkFY+ECB3gczsGKBW+bul/CsSx3ps8vnrXzpuu2k/5YjBjj3WGkQVLbdCnn
	czUJl72ANBW3r4EVgVrnI1SkLzi3GsLkieDTcXCDVfkm4EdCOcSGw=
X-Received: by 2002:a05:6000:1787:b0:43c:f737:a3f4 with SMTP id ffacd0b85a97d-43cf737ab66mr6694222f8f.30.1774810162932;
        Sun, 29 Mar 2026 11:49:22 -0700 (PDT)
Received: from DESKTOP-IHE0QGF.localdomain ([86.121.12.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21eba4dsm14058443f8f.11.2026.03.29.11.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 11:49:22 -0700 (PDT)
From: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	daniel.baluta@nxp.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Serban-Pascu Robert <robyserbanpascu06@gmail.com>
Subject: [PATCH v3 2/4] staging: media: atomisp: fix typo 
Date: Sun, 29 Mar 2026 21:48:08 +0300
Message-ID: <20260329184810.455285-3-robyserbanpascu06@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329184810.455285-1-robyserbanpascu06@gmail.com>
References: <20260329184810.455285-1-robyserbanpascu06@gmail.com>
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

