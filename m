Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302923BAD92
	for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 08:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784623656; cv=none; b=bgY1EvqLgMi1p6npNrG/7UvJEMc0lQHOEzZVa/QJjfhuSZibwtBN00kff+ZiTLoXix0mX8zaJaQS5JPOWBNbNxREE1idpjOFyoK8ooxn+XvV7lFtIU2pN72GDU92LcV0Bkg2ddxUKDZC2FsoX2jZ7LWFUewJ8jXwfqwQYyonRcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784623656; c=relaxed/simple;
	bh=Iql2BNM56R8HoPn0c/UFqQmyvWWZVUhs7fIb3qIZbXU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DCp5FQK1G3baC+N47aJXP7TNyUHhGLA7DIFyPr124lhOo2ws7K5D3XayRxRz+ESRPGyOdUGMco1gSR3Vvwt8ZxYqvNjScq1QXI53vLYE5aAFs50PA1MrhOprneqzK9Hdp5+QpOL9mgnvm6ebs+Dws3RMVn6fLg6FKKfqRfDPqOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hgEKks8X; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgEKks8X"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8486672f03cso11000134b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 01:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784623654; x=1785228454; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QbD7aakjuzas7aIGwnmgoXMf7eV3onlAUDz/4DsKXLM=;
        b=hgEKks8XHFjlhDnQAaq6cI6BivvdROC+nkbd3R34g6WfcsesjwRqgPf3joBZr7OuE8
         9S2isIPr+qoJtDDpJeLL8+lT4DZTzRiOjfA4wc0dW9NnG4kwg25qdBecS5PedMcnZ7R0
         NlTwW4JFBv5epNKElvMRRm9Ri8qO0SzMNGQioWR+vsVI7ud676nF5xkZdORP+9vwm0sJ
         s1v1K+PSnBBBBOIDb4xNC6UKl7ifJGhCwbBtaOIzMzqWAaQgtldv+fRoPUNW+7y2eSBg
         yWzuRhZe7Dx23/7acqNnk3+ZWLAft8f3rgglZqK3WfU1A3Z7fO6GGtjMAQTbrixK/W6J
         tkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784623654; x=1785228454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QbD7aakjuzas7aIGwnmgoXMf7eV3onlAUDz/4DsKXLM=;
        b=NF2a4CkfH0MOAVU2l1WalTtCNUL/Mau47+ziljp8GaAgl/ZqNVh/k5q+lX7egFSp36
         4BaqrXqk4CTPbYE3mLDF6vSnWja3nG5AsIPfigVDeKeUSPdJOva3tvhhmxVxEFRHZgyP
         BulNuwQsGnei25sGv875XD4egjjZTpIRJvjGrQbF8miarTMXDcQcuT1YOZ21tYrjxHM8
         eSlvsgOMmklWUY5GAD/UYwYPBm8DQbxvRHPI1oW/5Q6XVuBWcYOM0yxj/rwnhqPLbQy3
         mMQ/ITTcAfFZIl0QkXCDYs/dUBNrKPBlf7+ec8XkVTnm0G2ykBR0k4YO8e3ukaXMXcON
         qngA==
X-Gm-Message-State: AOJu0YzbFI3lBG20IjiMLUrsR33aQrK+tabwbjW8Ae5zDSfMsR78P3qg
	WV3jBcdy/sZIHTaPP3X70Agzj71CUhF3K1SB5ju0Xe4g+22pSBqXoAHgvSdRV1QE
X-Gm-Gg: AfdE7cmAfGlLDpf5pTLITxytuHXPtY3w3jKUAId7tsJX9rRJN6XuoSvsYwnbaXbce32
	5SmnB5n6/mR8KnaRV3SfReDCdDtjDCUFLfESi6MoEXQbYesWBPkVSxI/tz3e495MEnXtuNr5Dhp
	3sSxK52lcEqmYWCSaEFPGZfgH5AtXs6ML3HABWDfOBWopOBykB0Wmmo/XHGbviLmEDtJkmZEYiu
	WkEYexrs1xPMZXqyuFhMw2r/Tauu18YpYTn2onCshrPU+LC5oGosJzvHHJHfCQ5r/bF4lxcS94z
	JPm0oPokYyZNxqU1vaoqhzA2+3TI6BG9urRxB7XMme/P/1JOTHSjr8ehfLwY76mOSD9Xi+6sXHk
	W65Unrqert1KMX9vhBeuF7JLeFXfkJEyLlOrriDKG07i6QW9GD97Y52sm7swWNMsJw7thWD9aic
	L6XRFrUpD9nGqGUXPQbniBg/I41wGzzuSyiDQn
X-Received: by 2002:a05:6a21:7a46:b0:3bf:6c08:fb85 with SMTP id adf61e73a8af0-3c3ad9bb5e6mr20543046637.53.1784623654436;
        Tue, 21 Jul 2026 01:47:34 -0700 (PDT)
Received: from localhost.localdomain ([125.20.165.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2900a37sm36575095c88.0.2026.07.21.01.47.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 21 Jul 2026 01:47:33 -0700 (PDT)
From: Aayush7352 <aayushdixit924@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aayush7352 <aayushdixit924@gmail.com>
Subject: [PATCH 1/1] staging: nvec: fix power-off path to not depend on workqueue
Date: Tue, 21 Jul 2026 14:17:27 +0530
Message-ID: <20260721084727.79305-1-aayushdixit924@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nvec_power_off() uses nvec_write_async() which queues work via schedule_work().
During system shutdown or reboot, workqueues may be frozen, so the
AP_PWR_DOWN message never reaches the embedded controller and the
system hangs instead of powering off.

Fix by calling nvec_request_master() directly after queuing the power-off
messages, processing the TX queue synchronously in the power-off context.
Also add a NULL guard for nvec_power_handle.

This addresses the TODO item "add atomic ops in order to fix shutoff/reboot
problems" in drivers/staging/nvec/TODO.
---
 drivers/staging/nvec/nvec.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 88c416ee0..938ea8f34 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -774,10 +774,23 @@ static void nvec_disable_i2c_slave(struct nvec_chip *nvec)
 
 static void nvec_power_off(void)
 {
+	struct nvec_chip *nvec = nvec_power_handle;
 	char ap_pwr_down[] = { NVEC_SLEEP, AP_PWR_DOWN };
 
-	nvec_toggle_global_events(nvec_power_handle, false);
-	nvec_write_async(nvec_power_handle, ap_pwr_down, 2);
+	if (!nvec)
+		return;
+
+	nvec_toggle_global_events(nvec, false);
+	nvec_write_async(nvec, ap_pwr_down, 2);
+
+	/*
+	 * Process the TX queue directly instead of relying on the
+	 * workqueue.  Workqueues may be frozen during the power-off
+	 * sequence, so schedule_work() from nvec_write_async() may
+	 * not execute, leaving the AP_PWR_DOWN message unsent and
+	 * the system unable to power off.
+	 */
+	nvec_request_master(&nvec->tx_work);
 }
 
 static int tegra_nvec_probe(struct platform_device *pdev)
-- 
2.55.0

