Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825475;
	b=GEU1G6j9RhywmVxvZ8yzLxhJw6YhMqegzGJX3I3L5lq0fcOpkyB2srD7AhBmuJLUTJE3
	 g1JRc2iWinOI0SSF65fSmjJR/ny2Q8f92rU6yjRe/vanG3oWM1pgJAZKuttdi2X4GHF2Z
	 KqaduaOFS2+FBE33fkEZjR19yiTT8SC4h/6k3hSVFqn6jy1BlOu9zTesIEKr2XwSym3bL
	 m+Mrt4Gg7xizac317vqxSfjdbtEI++vHCkQFdjaq7FB2BMh0NtpLVNJrHBKi/AJKgFRDR
	 USeEyzLajLMLPrbURUYD8SM5vSEgfGFNXOZcUKjbH9wlhjh3f3FWy77wwaFffRkAAmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZcuOQZa8CoqUQadF07jVeaxK5x/sHuN3v5tWYCwYq74=;
	b=zz8IFVRvkg32K9X96pbxLq/8lIRJV5zaPGhGsIR2B9OLXc/lA63ivPGpaAT0jAgO6IWE
	 /rZ4KyRo43CsN5Pg669tO8F3CB715EqXMt50KFWcTF2kn1mdaYGwG/DzA2EFDWawgUOV4
	 JB0lkuFSmt0mOI1E8fvxcSrmClXDqZUuyBW+hzrUcKNCC+CjSolVQjbwr0c01RyGxwNht
	 pSDNNM+Uqt9OJqWzVD7hN8xfjuiHDBIDwzVuZn4HvLsl6BahUzd8dNwYNEj9CN4OleSmY
	 ofxxj4iFp0Zgq0R781xij5MsAI99AtwT0OWoqcaUoVgt8pFCf0UFXPGmuNhzSqc8gFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oiyoIsqX;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD89C6078011
	for <linux-staging@lists.linux.dev>; Wed,  4 Nov 2026 20:51:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD89C6078011
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oiyoIsqX
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so9439585e9.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Nov 2026 12:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793825473; x=1794430273; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZcuOQZa8CoqUQadF07jVeaxK5x/sHuN3v5tWYCwYq74=;
        b=oiyoIsqXWkJJim6zwAe3pgFXZFUJdpjCG6wFPSgoSP179qfKvJPjh6j36xjzKJmMuj
         K5q7R7/LJcVuGEQRfLZkFxKz9lwhv+2nN5ax2TiipbQGRsyZXOldC1iDdcIHzNvsGMtb
         hNqp3dMxXkJC7N5XozpFRNplUwdxJtb4NQROCr0FB/sQ7MZ12dFnDVY8LEopYeF+LFY/
         okX09UiFr+yjcKdGySqLT++aPLUDYdWremD9few9BzROFsjy19XEuBnJOH/IFXSFTAhC
         KeqDkuX0DPociG0ppGzzUqXMr3jfPNxIEZYmuELQhbnMTwDX/+aGidC5cgSRWXonhxMF
         /fVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825473; x=1794430273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZcuOQZa8CoqUQadF07jVeaxK5x/sHuN3v5tWYCwYq74=;
        b=ecb811EEXZ57zPIhbVAMbZ1p6RU5/LruWLIzLXOHPlLUbIRTn9fk5zB6+QqglAdyBV
         Yf/9sgZPkwudtgIgIACKWU8Y5Yo2oup1m5oIaxONcU6vtb+4eu2ov6RoayV3v6QJO1i3
         Kp7BDk/LXgdGhE5sXsNgX67lp4OoH19bT15tRe0RSPk9mV95uZ/8Zh7IWDDJHVqF7Q9y
         WXwuXB179/8pFfrFn0QDA6ZO+w9IxP6Xc/cUop12D7j5O0HFZy2e2itrFsjZguZd1lZD
         KT+MrtjfgG6r9VjypULv2oTmoT79jFXGpBrbwSBc+yuT44rCXM1YMpNuBLGApi9bKt0L
         w1Xg==
X-Forwarded-Encrypted: i=1; AKwUvBwwhQF1I50wbO0cu1A9UCx/ysmMzQckJH3+nAaFnTlKPbiJQ2zgPFD1VLUdNupuXdTz4WqreO7Ut95Ru1m8@lists.linux.dev
X-Gm-Message-State: APuU4Z8qbFEgzSeH/f/QFFTPjftiDVMilBi/Dtupys+o1r8vsJg7cU2J
	MKzPy254sLr85PVoJC4MossU9nKrfBtE5cbbf1eBtIeTftxm2R5nN3lo
X-Gm-Gg: AYBFou0leRkARFGWOPfTZcwHFuDbEYfXL9QcKdl28UeXnPJB2UqseEklcn+kvq1NGyD
	qAFqoo5STXYw1AHD2vvO4CTJBYHwgnv0+du1wfwnA6VWm4VuAgKdaMunu2ALp2PHLVo4uHbqiGy
	srU+qB+jRdQHW1i2ZauLo+2ItoSZp3s9lGtVGF9iaJc6+saAdjDTDRkNZ/wSTmHJxVLgMYex1HJ
	RXjodg7+FHOqT005P1ES5CdvuAhc9lhLpWSL1Wp422XWrQVZFsCtK2pg44NUn4RsPRNd7t7NCaM
	64CjehHeKs9GjW/+DhwSlErcBTMoGWhBxt6MQ5VMvUF5nFOYSh9wh4MppiN7W6WI/OpeaWMRYQa
	81zEQcwm5WAtMBHmUdS1FyjszkWMKznV+qc3ZO1Z8fDA0yRhowKSRVmByjwC4/a/wzoZsUYskQ7
	aBEfOAnEknJYxPZv3E9ZYUvuyJ25cIUziQizNVgTEaE5Ny12o2fl6V6PGIdTAmvHWy8XeoQTSMA
	6Dhv+5jHggdcPev95jaaSL1hR/s1mvvZItNFSTZwUVN4lsZnRyB/97XnolO7X37zWs8PFDECZHR
	rlCJp5vdmv+guVh81gKFswda2VdwEA==
X-Received: by 2002:a05:600c:1c0f:b0:4a2:150f:1601 with SMTP id 5b1f17b1804b1-4ac1709a7bdmr399320245e9.12.1793825472951;
        Wed, 04 Nov 2026 12:51:12 -0800 (PST)
Received: from pop-os.. ([87.248.177.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b572caf48bsm11214565e9.11.2026.11.04.12.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 12:51:12 -0800 (PST)
From: Albu Victor-Marian <albu.victor.m@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Albu Victor-Marian <albu.victor.m@gmail.com>
Subject: [PATCH] staging: most: dim2: add missing Return: documentation
Date: Wed,  4 Nov 2026 22:51:08 +0200
Message-ID: <20261104205108.1041666-1-albu.victor.m@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing Return: descriptions to functions in dim2.c. 

Signed-off-by: Albu Victor-Marian <albu.victor.m@gmail.com>
---
 drivers/staging/most/dim2/dim2.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 0e2512d166329..7ed38d5d93f05 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -156,6 +156,10 @@ void dimcb_on_error(u8 error_id, const char *error_message)
  * @hdm_ch: channel specific data
  *
  * Transfer a buffer from pending_list if the channel is ready
+ *
+ * Return: 0 on success, -EINVAL if hdm_ch is not initialized, -EAGAIN if hdm_ch pending_list is
+ * empty, dim_channel is not ready or there is not enough DBR space, -EFAULT if first MBO bus
+ * address is 0 or dim_channel fails to start
  */
 static int try_start_dim_transfer(struct hdm_channel *hdm_ch)
 {
@@ -211,6 +215,8 @@ static int try_start_dim_transfer(struct hdm_channel *hdm_ch)
  * @data: private data
  *
  * Wait for network status and deliver it to mostcore once it is received
+ *
+ * Return: 0 when the thread stops without error.
  */
 static int deliver_netinfo_thread(void *data)
 {
@@ -392,6 +398,9 @@ static irqreturn_t dim2_task_irq(int irq, void *_dev)
  *
  * Acknowledge the interrupt and service each initialized channel,
  * if needed, in task context.
+ *
+ * Return: IRQ_WAKE_THREAD after acknowledging the interrupt and servicing each
+ * initialized channel.
  */
 static irqreturn_t dim2_ahb_isr(int irq, void *_dev)
 {
@@ -442,7 +451,11 @@ static void complete_all_mbos(struct list_head *head)
  * @ccfg: structure that holds the configuration information
  *
  * Receives configuration information from mostcore and initialize
- * the corresponding channel. Return 0 on success, negative on failure.
+ * the corresponding channel.
+ *
+ * Return: 0 on success, -EINVAL if ch_idx is negative or bigger than or equal to DMA_CHANNELS, the
+ * buffer size of ccfg is too small, sub-buffer size of ccfg is invalid or bad channel type, -EPERM
+ * if hdm_ch is initialized or -ENODEV if init_ctrl_async returns any error value.
  */
 static int configure_channel(struct most_interface *most_iface, int ch_idx,
 			     struct most_channel_config *ccfg)
@@ -561,7 +574,10 @@ static int configure_channel(struct most_interface *most_iface, int ch_idx,
  * @mbo: pointer to the buffer object
  *
  * Push the buffer into pending_list and try to transfer one buffer from
- * pending_list. Return 0 on success, negative on failure.
+ * pending_list.
+ *
+ * Return: 0 on success, -EINVAL if ch_idx is negative or bigger than or equal to DMA_CHANNELS,
+ * -EPERM if hdm_ch is not initialized or -EFAULT if MBO bus address is 0.
  */
 static int enqueue(struct most_interface *most_iface, int ch_idx,
 		   struct mbo *mbo)
@@ -637,7 +653,10 @@ static void request_netinfo(struct most_interface *most_iface, int ch_idx,
  * @ch_idx: corresponding channel ID
  *
  * Destroy a channel and complete all the buffers in both started_list &
- * pending_list. Return 0 on success, negative on failure.
+ * pending_list.
+ *
+ * Return: 0 on success, -EINVAL if ch_idx is negative or bigger than or equal to DMA_CHANNELS,
+ * -EPERM if hdm_ch is not initialized or -EFAULT if HAL failed to close channel.
  */
 static int poison_channel(struct most_interface *most_iface, int ch_idx)
 {
@@ -710,6 +729,8 @@ static struct {
  *
  * By success stores one of the CLK_{NUMBER}FS in the *val and returns 0,
  * otherwise returns -EINVAL.
+ *
+ * Return: 0 on success, -EINVAL if the string in clock_speed does not match any in clk_mt.
  */
 static int get_dim2_clk_speed(const char *clock_speed, u8 *val)
 {
@@ -746,7 +767,8 @@ static void dim2_release(struct device *d)
  * @pdev: platform device structure
  *
  * Register the dim2 interface with mostcore and initialize it.
- * Return 0 on success, negative on failure.
+ *
+ * Return: 0 on success, negative on failure.
  */
 static int dim2_probe(struct platform_device *pdev)
 {
-- 
2.43.0

