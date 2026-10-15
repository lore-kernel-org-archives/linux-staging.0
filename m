Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2775013C3
	for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 09:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792056699; cv=none; b=VNClvwIpPhk211YlZf0IG80BMa7woqj8anhn8fZFuwpuK6c3oEC9vzEWvSr3CSAx7IfUK2VwbPHtrW+BbpxWWTsM7NhsxbvUEdSbn+UPrjpztB4s7IUkaJHVbk36wDiRSJNE/+Tn8ldh+WZfl+MCHwbaImbEJDEXgm7ChD/GRl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792056699; c=relaxed/simple;
	bh=vPnfJFMVKsiwjLXBFZhMqdpAGPXTdxnn2DfKiehEh3w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P3SNm/ntW6XhwjjxRZI548TRQzGdWTrWIYhvtBJcVIrqHRKvOhx0/OEtyAw9volrAJW9OmxJxMXLoqoZHzM1PaxSjHTp9OaXCRcJUMFTB/PGMaEj4oBkx2oEpHgvGuZBgZ01gIUaayteRD3CDf6q95nba/baynNJ11cw3sZbEOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZonCSUv; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZonCSUv"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15354aa70e8so5108588c88.1
        for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 02:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792056696; x=1792661496; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WL4a1icRin4PPRMkYQAbv/szvpiExWuhLXPQSU9JcHg=;
        b=BZonCSUvDfz6Fbz/jo6wVhP2sbH5f21fkucGS9Pzmhg+VwpZUpxsvRsj5DdZ+nF+x5
         oUwz0kqkCkXE9Bw2gZueDuAAEctlSCyKjtFSBTRSzEpiWX2AGYgeuuE1iZUCEc2R3zBD
         9VlCx975Rv4us7XhYDAO/AWoUqHjDHTFee4sz/wvnyI2ZfMCww9WOyqPYbeeXx8PBXTR
         fdPi+QPbOdLtbj4fKBpbbaEaXbzNzcW4h2w+OrSNZFvu4gz8HBV6yETi+02wXCz0XHfZ
         MFGi4TQ/xTGsav4Xrh2xO0WzlkixVNhoMAt9Lm+pel4WGWtEevPWzjvDEQrpR0ru+tgq
         YbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792056696; x=1792661496;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WL4a1icRin4PPRMkYQAbv/szvpiExWuhLXPQSU9JcHg=;
        b=rDTrCsewsjlFzp0GHXYjXtwkWL6UsoGHe8hY/SYymb53XmZ8ovQZQBSTtbceKLfrzX
         697/xHmMKtuDFpbYrhsXhRWoyNgEqP79pV841sRyyJrs0vQak9IFLgguIQPPXBx1QhCI
         T+ZRer0t9TYoD6T8fvmP+p1DQJIVdq8IAgRyUCzP0nDldwQMXRC1Um0SbF1RQPvOf23e
         kC0yiliDV/pr5DGvEiECqZxMN29bTUdiwAmUWF3it223th1UEPb6qakdRwfEfMhY3cGf
         3jTPTvqcxndQ5Kb8flf7tpk4onl/neY1Rf58557l8CDsgB+raPnflGCA6GqzuRQ0QrN6
         iT0Q==
X-Gm-Message-State: AFq9FYLYh/vwOMhRHbry9wYrXkjYpKokdNm+h0T0Uk8Ess9ma0vtoB9D
	DuzkmVjYKh3xzCz9urrBlp5O4/AKv2uuOdHcJGyHFazboPjhFtoY3MTt
X-Gm-Gg: AYBFou0jC65o3LWIowpz11VWC4kqLsHzpjd+S97UOCyH6/EeXKz2XDPHZgKquED81EA
	pRsR/ielTMKiBFpNga5risHYBR74WFzlFWmnUI8FibsoEFPMNO3/YVutROWf399oV7Sm6EMz6Ps
	UOWTXaj9yESabRQsCOX4i7EhFy3+HwVFl8l74XnfvAeKzJ9cntBftzC9B1oDFUlNdKkBpOyjwCs
	3V3gzQds/EpQ55DmRz+3p7MZThLj0CPNyP4fwRy3byBTBYZNHhMcbmYo27UTae9D/sewi8n3CGY
	7IW/FjDKuCsegkELzJnsfdEL3Vg37asXzeQm4xnWp8jQvKma2uhOc7vFgruDt4tDwfB6wA5OgQ5
	xHOaAsISLLxSjaWTXkof1vjk1QMdlKo0KvoSlLPu13nPGtBwnPsDvv/GIlgnjgfDh5zrEkJYF0f
	3Q+pFF1Q17U70SYN2pMDpJZ0cPjDJLKHte+uiw8aosjQm4YOUwy11f1wN28OQQTFa9L9OirVOG5
	A==
X-Received: by 2002:a05:701b:4211:10b0:14d:baf5:c40f with SMTP id a92af1059eb24-16a5dee142dmr26522948c88.14.1792056695506;
        Thu, 15 Oct 2026 02:31:35 -0700 (PDT)
Received: from gmail.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a6021e49sm55049282c88.20.2026.10.15.02.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:31:34 -0700 (PDT)
From: pdsj2807@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Palak Raval <pdsj2807@gmail.com>
Subject: [PATCH] staging: gdm724x: make DEVICE_STRING array const
Date: Thu, 15 Oct 2026 15:01:25 +0530
Message-ID: <20261015093128.1004956-1-pdsj2807@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Palak Raval <pdsj2807@gmail.com>

The DEVICE_STRING array contains pointers to string literals and is
never modified.

Declare it as 'const char * const' to improve const correctness and
prevent accidental modification. Also fix minor formatting issues
reported by checkpatch.

No functional changes intended.

Signed-off-by: Palak Raval <pdsj2807@gmail.com>
---
 drivers/staging/gdm724x/gdm_tty.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
index 32b2e817ff04..ac8511b88464 100644
--- a/drivers/staging/gdm724x/gdm_tty.c
+++ b/drivers/staging/gdm724x/gdm_tty.c
@@ -31,7 +31,7 @@ static struct gdm *gdm_table[TTY_MAX_COUNT][GDM_TTY_MINOR];
 static DEFINE_MUTEX(gdm_table_lock);
 
 static const char *DRIVER_STRING[TTY_MAX_COUNT] = {"GCTATC", "GCTDM"};
-static char *DEVICE_STRING[TTY_MAX_COUNT] = {"GCT-ATC", "GCT-DM"};
+static const char * const DEVICE_STRING[TTY_MAX_COUNT] = {"GCT-ATC", "GCT-DM"};
 
 static void gdm_port_destruct(struct tty_port *port)
 {
@@ -160,6 +160,7 @@ static ssize_t gdm_tty_write(struct tty_struct *tty, const u8 *buf, size_t len)
 
 	while (remain) {
 		size_t sending_len = min_t(size_t, MUX_TX_MAX_SIZE, remain);
+
 		gdm->tty_dev->send_func(gdm->tty_dev->priv_dev,
 					(void *)(buf + sent_len),
 					sending_len,
@@ -272,7 +273,7 @@ int register_lte_tty_driver(void)
 
 	for (i = 0; i < TTY_MAX_COUNT; i++) {
 		tty_driver = tty_alloc_driver(GDM_TTY_MINOR,
-				TTY_DRIVER_REAL_RAW | TTY_DRIVER_DYNAMIC_DEV);
+					      TTY_DRIVER_REAL_RAW | TTY_DRIVER_DYNAMIC_DEV);
 		if (IS_ERR(tty_driver))
 			return PTR_ERR(tty_driver);
 
-- 
2.34.1

