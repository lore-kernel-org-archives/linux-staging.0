Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EE73537F5
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 15:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305292; cv=none; b=J0h+2Pm72SZUPVWC6u3+orPZl+KlbjFkv4BNYSyu5EOdBXyBaLqaURmdTCLTTsylB5wHhxHI5CYLA1qOfAAzvuRDQQ+7YE+xcjE3EXEv7GAtNzb8eFvfKhNobZbQ8xG+0wYMTQ0/451hLiFEtynqpsLJFIAZN7hLuE5iG6phz4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305292; c=relaxed/simple;
	bh=3lMBDTmGVSzQWPgjOUuDoQlBGhvTrtUqoyElVhNjLfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uq3EVsEa1DexsrAKhG81V9IEa6np51APxtSYbXnUv+xTzsG7x7QrC3ztsMk82FiDBaihEBz3HU4VCQaIN7YOA5naZUNMZCWeQloqktkKiFJZAohASV3VsRojAe2N6Hlk7YyhkLv3pKCZXgHyCn6Wh2++mCdEszdaFn/vpoHwoQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FTlqaM6Y; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FTlqaM6Y"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2b2589c26e3so97107515ad.1
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 08:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777305290; x=1777910090; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thNCQIJeEhwAIcXi2kXr3H7Q3kP3X1CPFM6RiVR/dT4=;
        b=FTlqaM6Yyx4sOHOz0LIo5oQ06mK26qE6XgE91FMKWYhsY72B+0KpCZkYVrRcYOJccy
         Cee5acn0lbKG3vgDXqMDvzp4ea8W1/JipWN4d/bbB8/QuSNCxFoGNd5y+yQs242or23L
         KGcevuS+UBfQXJm7u4RgwvtgSoP+P5GHncXkQjdB5hm8e/8paftVGdne8luUsbRxOr+g
         hq8TCAh/vl/UIC6t4mrvltTRnqzbCyprqA5Y2sFOjHzHMeESr1aNoaFxidipm7kqFpip
         vrjPb0UVdk4YmhbN3q+iMlFCgfumBeUNI53jqeJOlo7xGYxT14h1gsWwZ4aPoOEEKEO6
         dDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777305290; x=1777910090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=thNCQIJeEhwAIcXi2kXr3H7Q3kP3X1CPFM6RiVR/dT4=;
        b=b0Al6t0z2U6MnBVVUN0itEPiIlm5UgJgH5fIXxqZLWZLxdLgjeLVoIM7lNyTKBe2U0
         oeZdb3tDKLSGUMjgJ+kYhgHsLr62YEmladwFQ73tIfMcQaHs6hwxwK4Mx0Yl7r3FojXu
         6XWvqbTmeqQ3fFW/gTaRVeNEcaPri4vloCWziUSB763JgAWP7avOM+ksMgvcZLmvUqVm
         aMb663+cXi9+F/AXhEcWh39aRiEDv5/Jd8g+HGfC5c8IvKNi5Ef6IE1PzGAhmedf9QCI
         NNgHlfW9u7aNDCvAiUj8P2mDwTvTNSJlRflvuUP8s2YVKjS48iAsod/2RBVUgCMvKjDw
         Kujg==
X-Forwarded-Encrypted: i=1; AFNElJ8e/LwYjQqm3tVRg6gHqnJ2qbeYz3tmAZRmow+zxkhcgkWJVpLAVsCb3K6uncDSgsPqALYZ4EJW5pzd6FZQ@lists.linux.dev
X-Gm-Message-State: AOJu0YyfOOydBywErwa0m1o+8/WsJDAs3tmlffH4pL3spndhbabV2PM2
	GNl9VyyAzMYWGiwic5Rh1oDm1r9pDlwBZuaAU5eD73ntlLTzLuZ0ayYA
X-Gm-Gg: AeBDievfmSyFBQpgRU7SoJw2NanZmLK5GV8amz9pYcSD93ee0H9apzlgwxOr4R627XE
	FgvdeeM74p277syF2HU6Q/WXoukDqqbaJTKXp6b9qTWwX13omVoRsdTLY6w7ioodubEOvXx3QbH
	srtFXH0zZ2PgYxJMSrjkb3qbn7CfmzLPQvheFRYWx9m8ItfK23hFeodinIbkZ3B7AW017FenxsX
	834maiKkg2mAPXS5+nVN+GtpY6Vs8hCEvjng//AUqsTQLpLM75Ek0vyg5IjcAoHpYIomlCiMIL1
	pB/IlQUdLgCCD0meUEkmDOzUJVZ9JUaXLL5JytzI5COuI4rHiwd4nQ5vGnZyXaIhWOT4IMKytlY
	FjaykRWOmSmMiBtp+Pq1sSj5lpdRaa9owgsfsP5ineh2SRiGcVM39vcGfuHfVz56kIMLfkTImOQ
	FNxano9POBMSHPJcqDJgwDf58TzlR1ax3r3p/S+hIR
X-Received: by 2002:a17:902:efc1:b0:2b4:5dff:30fd with SMTP id d9443c01a7336-2b5f9eb0501mr315369565ad.4.1777305290006;
        Mon, 27 Apr 2026 08:54:50 -0700 (PDT)
Received: from localhost (vps-e1cc9378.vps.ovh.us. [2604:2dc0:202:300::1365])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa30047sm320483735ad.28.2026.04.27.08.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:54:49 -0700 (PDT)
From: Eric Wu <kunjinkao.jp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-mips@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Eric Wu <kunjinkao.jp@gmail.com>
Subject: [PATCH 6/7] staging: octeon: convert cvmx_pko_port_status_t from typedef to plain struct
Date: Mon, 27 Apr 2026 23:54:26 +0800
Message-ID: <20260427155427.668540-7-kunjinkao.jp@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427155427.668540-1-kunjinkao.jp@gmail.com>
References: <20260427155427.668540-1-kunjinkao.jp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Linux kernel coding style discourages the use of typedefs for
structs. Convert cvmx_pko_port_status_t to a plain 'struct
cvmx_pko_port_status' and update all users across the MIPS Octeon
architecture code and the staging driver.

No functional change.

Signed-off-by: Eric Wu <kunjinkao.jp@gmail.com>
---
 arch/mips/include/asm/octeon/cvmx-pko.h | 6 +++---
 drivers/staging/octeon/ethernet.c       | 2 +-
 drivers/staging/octeon/octeon-stubs.h   | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/mips/include/asm/octeon/cvmx-pko.h b/arch/mips/include/asm/octeon/cvmx-pko.h
index a742c1d61d8f..26cb26a7ff2b 100644
--- a/arch/mips/include/asm/octeon/cvmx-pko.h
+++ b/arch/mips/include/asm/octeon/cvmx-pko.h
@@ -114,11 +114,11 @@ enum cvmx_pko_lock {
 	CVMX_PKO_LOCK_CMD_QUEUE = 2,
 };
 
-typedef struct {
+struct cvmx_pko_port_status {
 	uint32_t packets;
 	uint64_t octets;
 	uint64_t doorbell;
-} cvmx_pko_port_status_t;
+};
 
 /**
  * This structure defines the address to use on a packet enqueue
@@ -574,7 +574,7 @@ static inline int cvmx_pko_get_num_queues(int port)
  * @status:   Where to put the results.
  */
 static inline void cvmx_pko_get_port_status(uint64_t port_num, uint64_t clear,
-					    cvmx_pko_port_status_t *status)
+					    struct cvmx_pko_port_status *status)
 {
 	union cvmx_pko_reg_read_idx pko_reg_read_idx;
 	union cvmx_pko_mem_count0 pko_mem_count0;
diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 5f9c29071fab..448a4ec42d0b 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -202,7 +202,7 @@ EXPORT_SYMBOL(cvm_oct_free_work);
 static struct net_device_stats *cvm_oct_common_get_stats(struct net_device *dev)
 {
 	cvmx_pip_port_status_t rx_status;
-	cvmx_pko_port_status_t tx_status;
+	struct cvmx_pko_port_status tx_status;
 	struct octeon_ethernet *priv = netdev_priv(dev);
 
 	if (priv->port < CVMX_PIP_NUM_INPUT_PORTS) {
diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 8496c60d647e..7bb72e152f08 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -411,11 +411,11 @@ typedef struct {
 	u16 inb_errors;
 } cvmx_pip_port_status_t;
 
-typedef struct {
+struct cvmx_pko_port_status {
 	u32 packets;
 	u64 octets;
 	u64 doorbell;
-} cvmx_pko_port_status_t;
+};
 
 union cvmx_pip_frm_len_chkx {
 	u64 u64;
@@ -1264,7 +1264,7 @@ static inline void cvmx_pip_get_port_status(u64 port_num, u64 clear,
 { }
 
 static inline void cvmx_pko_get_port_status(u64 port_num, u64 clear,
-					    cvmx_pko_port_status_t *status)
+					    struct cvmx_pko_port_status *status)
 { }
 
 static inline enum cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
-- 
2.43.0

