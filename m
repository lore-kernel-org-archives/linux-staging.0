Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BAB2D24BF
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 10:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768213543; cv=none; b=DjNUIzKaiYkccDvIxnTfKXiQA2OqOqm1Njzbd1cAN3D07gD3HYJsKE3ViHSv7hGL6iCKJ7oQlf3S/eVBZytJzfnU2nLuHTXfMh/zFQf1yq9OsJXaQZxJZiK92/3rjxMOHVZhNLKvnNPKt4GjsRxUkUwAxywXbcJErWTZSuSklTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768213543; c=relaxed/simple;
	bh=TINYHnntRMzv9uGtx84wKsuW+XoWCUlGBKOdKFE7Eww=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j316YinYyal+wVluZ8FKh4Q4LrgW6wsE0Sz4/yCaPK0GSsMYOb++ixDGyt+IUEI0HMlStwbSD2zRu08I/F5v+NshNExQokg4gFDR/86wHPgMnp0tERdKnIJVoeImQbPpDAnnZHy2pxpn2qdYLNxu4s2FVCzLzbTaqclb0Wf12gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dp2I0Rih; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dp2I0Rih"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-81345800791so3139495b3a.0
        for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 02:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768213541; x=1768818341; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dfHep8BV0G7Gvi1TPQBDf1CvMfJU9vGevjHi7UTQn3w=;
        b=dp2I0RihqyXlh4oUPfIa8nz2B9eqiZgglCfGOF2Q7fmoy2ifTfPn+QuRYcqwrUQGZi
         qHNU58wEyeAwrR3fkq8Z/zDqwGZZy6n9VdTEVLcbjdrTus9a9sRHzG3NbPgfRU3zzVdI
         Z3kOijCI96CDAA+vWZQ8vYjBN8J+L2H82wYosRHRLWi4ufEgb7hqoVMJKOltDHyzHZO9
         mbGXVgtUW+wJSbsZBRuspQL/7SvXPFjIIkT3CB3RvddA7y3utBI/UoKa24MdcupJmGMS
         gmxB4MQy7pG/NOMTUedCI9nYVnulDdarMWrUMBucPlngsQ/PzNGxsqQI+cj8H9DfzXt3
         eVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768213541; x=1768818341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfHep8BV0G7Gvi1TPQBDf1CvMfJU9vGevjHi7UTQn3w=;
        b=DMXpd53jYrAgi5q5T5jz7D0HNwjeFpPj7Zdhg/1TO9xtrA2DqC3uVqMfQmHhL1mIsC
         /HZGnCtChJJziSY5RBwUvYPAhIKllu7IG+/B76j1Ej+6FJAtRNaVoRMOxZhdNhDFS0kq
         QW3tMaBs+3YnZSkg5ig3ufsZP0nWt0ZHVMm+sXUhG/abpJ3XJEqzP4SC3la2OHYDocWL
         n4PuPT0ov7hjgQ4M2ySbFRQRqwtI0ER9y9CraNF4dSgFHz2X8c5PR6xxkNYIuVh47Bho
         h5iVRLFPzU+ONtOCOD31rmXOgfkmnPZ7iIJNsdXlMf96pJs5NSAb8TXpnM5QRJWilwDC
         Yhmg==
X-Gm-Message-State: AOJu0YwgVO4hJdWUSZqj2oXk5CW7LqJ89S4AzBPP5hhu6pjgEUsJJBBG
	R2wzSS2RT8MTBM7o2xhAnO2atnzrLtM0pxlN74rJUJip0ukdh5t67cuh
X-Gm-Gg: AY/fxX4SGbnZNR1cwrIQtoTO30t4m1Tw3HirhUy9I/FqU6udy7DIGX0qXlu2diABh2l
	y41vu+5/AXPxn5rd8S3qP8JGvbLoLHR8Dbdr8Wg6Z34pEIAu0ccFRAWpWaXglPdocjApmGhbTmz
	HdKkJt7iQW1X98d6EU9zJjjYP4jD9DY9/vQznP8z1xC1XT9nOmnFDBZ7MuKE3gK9H98Cd2tDUii
	9acO+Tyfx+zrcXz/119pUGbdq5jIYPVnKmE8Mezk6jbVKdseyiPFXcyVKIUSfBSWw+N665G6pnG
	/cCjuXN9tnb32TK0tEnkysTwwDs/y84dvFs0WazbbfN7EY3/Sxqv0TEItBH42Nmd+7Z6QJZFWZU
	FF1wDo1aSmE6Got5vfwmwa1xVQiij3sr92Kqmq3XeNKaNIkLQl+Su7t8iVLRy6mSPctvSCDMR7Y
	6krnglysL54tY1/c157rEIB6gJIQwd+A==
X-Google-Smtp-Source: AGHT+IEhiDnmFftWWOD4TT9lt9e8kCHolyyyjdENTrdfTfNOWi+xEBcNRI8OyDpLwwJjedtP7mCo4w==
X-Received: by 2002:a05:6a20:5493:b0:366:14b0:4b05 with SMTP id adf61e73a8af0-3898f97c340mr17046714637.65.1768213541351;
        Mon, 12 Jan 2026 02:25:41 -0800 (PST)
Received: from localhost.localdomain ([103.215.237.209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c57a50da1a7sm6478371a12.36.2026.01.12.02.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:25:40 -0800 (PST)
From: Karthikey Kadati <karthikey3608@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey Kadati <karthikey3608@gmail.com>,
	Unix Antigravity <unix.antigravity@test.com>
Subject: [PATCH 2/4] staging: octeon: Remove port status typedefs
Date: Mon, 12 Jan 2026 15:55:07 +0530
Message-ID: <20260112102507.19796-1-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove cvmx_pip_port_status_t and cvmx_pko_port_status_t typedefs.

Replace them with struct cvmx_pip_port_status and struct cvmx_pko_port_status

to match Linux kernel coding style.

Signed-off-by: Unix Antigravity <unix.antigravity@test.com>
Signed-off-by: Karthikey Kadati <karthikey3608@gmail.com>
---
 drivers/staging/octeon/ethernet.c     |  4 ++--
 drivers/staging/octeon/octeon-stubs.h | 15 ++++++++-------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index eadb74fc1..6d03d2346 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -201,8 +201,8 @@ EXPORT_SYMBOL(cvm_oct_free_work);
  */
 static struct net_device_stats *cvm_oct_common_get_stats(struct net_device *dev)
 {
-	cvmx_pip_port_status_t rx_status;
-	cvmx_pko_port_status_t tx_status;
+	struct cvmx_pip_port_status rx_status;
+	struct cvmx_pko_port_status tx_status;
 	struct octeon_ethernet *priv = netdev_priv(dev);
 
 	if (priv->port < CVMX_PIP_NUM_INPUT_PORTS) {
diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 35b5078ba..3f90cfd0d 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -386,7 +386,7 @@ union cvmx_ipd_sub_port_qos_cnt {
 	} s;
 };
 
-typedef struct {
+struct cvmx_pip_port_status {
 	uint32_t dropped_octets;
 	uint32_t dropped_packets;
 	uint32_t pci_raw_packets;
@@ -409,13 +409,13 @@ typedef struct {
 	uint32_t inb_packets;
 	uint64_t inb_octets;
 	uint16_t inb_errors;
-} cvmx_pip_port_status_t;
+};
 
-typedef struct {
+struct cvmx_pko_port_status {
 	uint32_t packets;
 	uint64_t octets;
 	uint64_t doorbell;
-} cvmx_pko_port_status_t;
+};
 
 union cvmx_pip_frm_len_chkx {
 	uint64_t u64;
@@ -1260,11 +1260,12 @@ static inline int octeon_is_simulation(void)
 }
 
 static inline void cvmx_pip_get_port_status(uint64_t port_num, uint64_t clear,
-					    cvmx_pip_port_status_t *status)
+					    struct cvmx_pip_port_status *status)
 { }
 
-static inline void cvmx_pko_get_port_status(uint64_t port_num, uint64_t clear,
-					    cvmx_pko_port_status_t *status)
+static inline void cvmx_pko_get_port_status(uint64_t port_num,
+					      uint64_t clear,
+					      struct cvmx_pko_port_status *status)
 { }
 
 static inline cvmx_helper_interface_mode_t cvmx_helper_interface_get_mode(int
-- 
2.43.0

