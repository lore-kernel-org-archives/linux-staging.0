Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331092;
	b=eh5nqQ7bF8yrmpGpVA3jRjnD2BkonsaPZ+YtSEFtlZFt7/f2AurS7d7nG0BM3HUIl4bb
	 OFmWaanHKMJe3Au3no2cHeR8RqpG2tp2a2kuFSS41ArVOv6QjPTn+3XMHw3PaSpwjy2yk
	 rOZ/5bkVrgIZ1G5rRb/+xG+m7x8OohAXiIK8oILOW9tyXmodYVTawN+wkwIWseztYLMRq
	 4U49ijINt9g4aMRehNqJ2rzeciPNgBJvDCqL3uyslA7vnAcKQVg/opbQdeKQYIqO2RhpV
	 vdM60CBMKcbR8Sxdp8nAqE0Jldfdd7jbwcBLG5gPoX/VIjHfMleaFhw0ScIUuSD6Smg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=fobaesnmMKyjTvyeIs4N9hvt2MoGfB+9T3M/lvazKZE=;
	b=U5CVdMdslCLfFgjo2uD2DbPnk69O8YFqKU2unX4oDWX+NGEECZbBxAkYzxe0pBLCC8lD
	 kR8Xihgx4NqZrye8ljF5VErVomzt5iz6eH1zdqb7PO4W1Gm2mThkv9UVdQ6NuwBEmyoQV
	 m0k30KDrm4dAr9LcVcrT85lKAEqMI6G3gP1L8m4tM9JKY2vliNby4b9i6sSjtG/Uc/Rk9
	 rvDg+zO78e3DUmrU+KwkPkhPU7BvAaKtfmve35q8IMgaKvTpi/yy/7XOtCXf5feHzjIEj
	 ZuGIVRmQxsydJDcn8npgKB5mouo5a18zGMInUZdc61lWTl3qlq/YgXjs914lvzbTzpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="iPQ/rfJf";
	arc=none smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7086606A31C
	for <linux-staging@lists.linux.dev>; Tue, 10 Nov 2026 17:18:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7086606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iPQ/rfJf
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5ecaf4e9771so114135e0c.2
        for <linux-staging@lists.linux.dev>; Tue, 10 Nov 2026 09:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794331091; x=1794935891; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fobaesnmMKyjTvyeIs4N9hvt2MoGfB+9T3M/lvazKZE=;
        b=iPQ/rfJfJ3heECUAvHj3u+PXgYm4/eshAkbH5CWm2y3xKPbG/6sFjmcv/I+3fj/x94
         Apz2FC74sOJtZI/u+u1dW20JMkUAq/f6zQrn5WiAAE3kJpnRZP5uLPhKpDET22/HSA3V
         98ahwv2KQaMvAiBeZ2bQkxa6JhiT8UVxLibFPMvkLUmPNS5hvSdMZUFyZGNkKzf0gooy
         Q2sbAyYUdETcHzYRjm/ZoeLQRML4+Ny9UdTZB9MmHXIKf7Fg49QlNeePOb4TaHtBMIc2
         JmGcvL/hYasj+sMJzNonPOjDUctgdOQ/EqiGlrCGHK9fT78d3ZvrnQLkDwlYf+wV4Z/n
         QcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794331091; x=1794935891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fobaesnmMKyjTvyeIs4N9hvt2MoGfB+9T3M/lvazKZE=;
        b=r0/sE1YZ86PbKXQfevih4WFHEeMbbOzNGn6bfmHUIvZ36BN1ajt2+FlrOR52igNRV8
         kBbeUhrkAb7FxL5WY98jTQIf7mBXUNmhFvMXT/nE/VnegU0CCJ9a/IwoeAtA0MR9olKD
         fcw/RGmFwMj8PYm2rD6393BgMWQu7T5T4hp0GOvypVxhB5UVnekxwUZSgXc+xQRiEllV
         kr5bGcDu4mZAYz5wz4xatmbsy7ylrtxCNwyXNKhhl73mfh+MzFDdS2LLCqirE/uS8a7w
         FAKDzHCrVlrfpwwujWA2hnbWRlPEslBqNNaQncDYYyEspP2rUj1hCM4TyCeP24IpDrcn
         GEtw==
X-Gm-Message-State: APuU4Z+rI5dUFRZtT+GrW4/+wjFqv1uuvQ3oPg00SPhmCu1UI8W592Pd
	6qax8hJB0gQNvpB+7+gMdY27QpxXACxHJuWO/EVS7x+V0O2IAhzcnoh18sNYVlg3OFA=
X-Gm-Gg: AYBFou1b0swlIW9Npsm7gXYjZQ6fSKxzdC/gS2/Tcm1JYquoVlcD9GzYsENGpaWpJ+i
	A/Ad/jThNIPuSWO1UJFamUSupUT0hQuBY67CWsXY0nevJ7Cz3l4PEX0objiM+PR0K3cXjC2hhoa
	/JRpP1XHfeHz9tau7uBma3xO5g6Eyux5YLKBG77kdH5xGNAwGzyeNcl+9UXyj6Kq7o+2jqKAItu
	let/EUiCtMKe5vcKnbhKm9nis+bJe/plcR5M2OHXxEiX9rwGxQkzfuj+friNEr19rbYFv6HM9cv
	o+WPfuTce6eWiIH4GaP7WupaAC6suTj/XcDVQfXv/q3FTwtN/2KqIUgNQtRrq9fvKSB6DOHBa40
	bY6xSHUwTz0TSkjHFmUVXb0aDqBYhzkXRpyNUNvO9lrMlqeXGw4fUiYeq5t60VRDdqRsRpqWjKp
	5/ZmK153L4YODZ5nvLcBjeYUWoE1FIXvxy0Ecu98kHWnqI656JmgolhhQvdQSD7OZOTJ3tS34hP
	4hllMzp9Kt2jMJUwYYorMyq2hkTMAxcTw+3cksy2tlZltWOQR665Z18WLmg22NePgo3FvImGcBv
	s+9xyLP7kwb22HvtM2OvQs5eemgoONUSm38NNpOzWvUj6ZfFrLwE0qBbeoY5B8nb1FDwEnqzbBn
	O99Kq1g6w8XX96hBLeFByXB9VPomm9Cz7EteHJEHKNIfUdrs=
X-Received: by 2002:a05:6123:50e:10b0:5ec:e2a2:b70e with SMTP id 71dfb90a1353d-5ee0d1b1b03mr1450303e0c.4.1794331090720;
        Tue, 10 Nov 2026 09:18:10 -0800 (PST)
Received: from localhost.localdomain (bras-base-sbcypq6202w-grc-36-65-94-163-70.dsl.bell.ca. [65.94.163.70])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c1fffe12dsm2036676241.5.2026.11.10.09.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:18:10 -0800 (PST)
From: Massi Djaiz <djaizmassi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Massi Djaiz <djaizmassi@gmail.com>
Subject: [PATCH] staging: octeon: Fix return value documentation warnings
Date: Tue, 10 Nov 2026 12:16:18 -0500
Message-ID: <20261110171618.4507-1-djaizmassi@gmail.com>
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

Running "scripts/kernel-doc -none -Wall drivers/staging/octeon/" reports
that 17 functions in drivers/staging/octeon/ have a missing
description for their return value.

16 of the 17 functions have a return value description formatted as
"Returns [...description]".

1 function, cvm_oct_do_interrupt(), has no return value description.

Documentation/doc-guide/kernel-doc.rst states that if a function has a
return value, it should be described in a section named "Return".
Sections are only recognized if their name is followed by a ":".

- Replace each occurrence of "Returns" with "Return: ".
- Add a return value description to cvm_oct_do_interrupt(),
  which always returns the constant IRQ_HANDLED.

No functional change.

Signed-off-by: Massi Djaiz <djaizmassi@gmail.com>
---
 drivers/staging/octeon/ethernet-mdio.c |  4 ++--
 drivers/staging/octeon/ethernet-mem.c  |  4 ++--
 drivers/staging/octeon/ethernet-rx.c   |  5 +++--
 drivers/staging/octeon/ethernet-tx.c   |  4 ++--
 drivers/staging/octeon/ethernet-util.h |  6 +++---
 drivers/staging/octeon/ethernet.c      | 10 +++++-----
 6 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-mdio.c b/drivers/staging/octeon/ethernet-mdio.c
index 211423059e30..569e4aba38bc 100644
--- a/drivers/staging/octeon/ethernet-mdio.c
+++ b/drivers/staging/octeon/ethernet-mdio.c
@@ -49,7 +49,7 @@ const struct ethtool_ops cvm_oct_ethtool_ops = {
  * @rq:     the request
  * @cmd:    the command
  *
- * Returns Zero on success
+ * Return: Zero on success
  */
 int cvm_oct_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
 {
@@ -132,7 +132,7 @@ int cvm_oct_common_stop(struct net_device *dev)
  *
  * @dev:    Device to setup
  *
- * Returns Zero on success, negative on failure
+ * Return: Zero on success, negative on failure
  */
 int cvm_oct_phy_setup_device(struct net_device *dev)
 {
diff --git a/drivers/staging/octeon/ethernet-mem.c b/drivers/staging/octeon/ethernet-mem.c
index 68c3ef984e56..224a7189faf2 100644
--- a/drivers/staging/octeon/ethernet-mem.c
+++ b/drivers/staging/octeon/ethernet-mem.c
@@ -20,7 +20,7 @@
  * @size:     Size of the buffer needed for the pool
  * @elements: Number of buffers to allocate
  *
- * Returns the actual number of buffers allocated.
+ * Return: the actual number of buffers allocated.
  */
 static int cvm_oct_fill_hw_skbuff(int pool, int size, int elements)
 {
@@ -76,7 +76,7 @@ static void cvm_oct_free_hw_skbuff(struct platform_device *pdev,
  * @size:     Size of each buffer in the pool
  * @elements: Number of buffers to allocate
  *
- * Returns the actual number of buffers allocated.
+ * Return: the actual number of buffers allocated.
  */
 static int cvm_oct_fill_hw_memory(struct platform_device *pdev, int pool, int size,
 				  int elements)
diff --git a/drivers/staging/octeon/ethernet-rx.c b/drivers/staging/octeon/ethernet-rx.c
index 5be43bbf6a1d..5ca30f5b046d 100644
--- a/drivers/staging/octeon/ethernet-rx.c
+++ b/drivers/staging/octeon/ethernet-rx.c
@@ -41,6 +41,7 @@ static atomic_t oct_rx_ready = ATOMIC_INIT(0);
  *
  * The interrupt occurs whenever the POW has packets in our group.
  *
+ * Return: Always returns %IRQ_HANDLED.
  */
 static irqreturn_t cvm_oct_do_interrupt(int irq, void *napi_id)
 {
@@ -55,7 +56,7 @@ static irqreturn_t cvm_oct_do_interrupt(int irq, void *napi_id)
  * cvm_oct_check_rcv_error - process receive errors
  * @work: Work queue entry pointing to the packet.
  *
- * Returns Non-zero if the packet can be dropped, zero otherwise.
+ * Return: Non-zero if the packet can be dropped, zero otherwise.
  */
 static inline int cvm_oct_check_rcv_error(struct cvmx_wqe *work)
 {
@@ -404,7 +405,7 @@ static int cvm_oct_poll(struct oct_rx_group *rx_group, int budget)
  * @napi: The NAPI instance.
  * @budget: Maximum number of packets to receive.
  *
- * Returns the number of packets processed.
+ * Return: the number of packets processed.
  */
 static int cvm_oct_napi_poll(struct napi_struct *napi, int budget)
 {
diff --git a/drivers/staging/octeon/ethernet-tx.c b/drivers/staging/octeon/ethernet-tx.c
index 5e536827f87a..44534b94aec2 100644
--- a/drivers/staging/octeon/ethernet-tx.c
+++ b/drivers/staging/octeon/ethernet-tx.c
@@ -122,7 +122,7 @@ static void cvm_oct_free_tx_skbs(struct net_device *dev)
  * @skb:    Packet to send
  * @dev:    Device info structure
  *
- * Returns Always returns NETDEV_TX_OK
+ * Return: Always returns NETDEV_TX_OK
  */
 netdev_tx_t cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
 {
@@ -500,7 +500,7 @@ netdev_tx_t cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev)
  * cvm_oct_xmit_pow - transmit a packet to the POW
  * @skb:    Packet to send
  * @dev:    Device info structure
- * Returns Always returns zero
+ * Return: Always returns zero
  */
 netdev_tx_t cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev)
 {
diff --git a/drivers/staging/octeon/ethernet-util.h b/drivers/staging/octeon/ethernet-util.h
index 2af83a12ca78..510e04030c74 100644
--- a/drivers/staging/octeon/ethernet-util.h
+++ b/drivers/staging/octeon/ethernet-util.h
@@ -9,7 +9,7 @@
  * cvm_oct_get_buffer_ptr - convert packet data address to pointer
  * @packet_ptr: Packet data hardware address
  *
- * Returns Packet buffer pointer
+ * Return: Packet buffer pointer
  */
 static inline void *cvm_oct_get_buffer_ptr(union cvmx_buf_ptr packet_ptr)
 {
@@ -21,7 +21,7 @@ static inline void *cvm_oct_get_buffer_ptr(union cvmx_buf_ptr packet_ptr)
  * INTERFACE - convert IPD port to logical interface
  * @ipd_port: Port to check
  *
- * Returns Logical interface
+ * Return: Logical interface
  */
 static inline int INTERFACE(int ipd_port)
 {
@@ -39,7 +39,7 @@ static inline int INTERFACE(int ipd_port)
  * INDEX - convert IPD/PKO port number to the port's interface index
  * @ipd_port: Port to check
  *
- * Returns Index into interface port list
+ * Return: Index into interface port list
  */
 static inline int INDEX(int ipd_port)
 {
diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 42ec4b8324a8..463302cf5a61 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -183,7 +183,7 @@ static void cvm_oct_configure_common_hw(struct platform_device *pdev)
  *
  * @work_queue_entry: Work queue entry to free
  *
- * Returns Zero on success, Negative on failure.
+ * Return: Zero on success, Negative on failure.
  */
 int cvm_oct_free_work(void *work_queue_entry)
 {
@@ -211,7 +211,7 @@ EXPORT_SYMBOL(cvm_oct_free_work);
  * cvm_oct_common_get_stats - get the low level ethernet statistics
  * @dev:    Device to get the statistics from
  *
- * Returns Pointer to the statistics
+ * Return: Pointer to the statistics
  */
 static struct net_device_stats *cvm_oct_common_get_stats(struct net_device *dev)
 {
@@ -247,7 +247,7 @@ static struct net_device_stats *cvm_oct_common_get_stats(struct net_device *dev)
  * @dev:     Device to change
  * @new_mtu: The new MTU
  *
- * Returns Zero on success
+ * Return: Zero on success
  */
 static int cvm_oct_common_change_mtu(struct net_device *dev, int new_mtu)
 {
@@ -401,7 +401,7 @@ static int cvm_oct_set_mac_filter(struct net_device *dev)
  * @dev:    The device in question.
  * @addr:   Socket address.
  *
- * Returns Zero on success
+ * Return: Zero on success
  */
 static int cvm_oct_common_set_mac_address(struct net_device *dev, void *addr)
 {
@@ -416,7 +416,7 @@ static int cvm_oct_common_set_mac_address(struct net_device *dev, void *addr)
  * cvm_oct_common_init - per network device initialization
  * @dev:    Device to initialize
  *
- * Returns Zero on success
+ * Return: Zero on success
  */
 int cvm_oct_common_init(struct net_device *dev)
 {
-- 
2.43.0

