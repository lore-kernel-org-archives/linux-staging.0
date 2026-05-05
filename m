Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13893EAC8D
	for <linux-staging@lists.linux.dev>; Tue,  5 May 2026 20:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778014722; cv=none; b=V5B428IW8DnzbpDiPIC1vjFGnp9Nw4b4MAdIE4iNuXskMAWYK4ze8RiUbxds3bAR8noYNRzcU6Sg0oKCeCBkcCkOAhIjkdnOGRnn9AHd2GEWX3EwKPnq2sW4lLo8MWz7ZL3xIIgHxIL++yq1ytBmQJB+uYZ1N1EP6PIxavgwMLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778014722; c=relaxed/simple;
	bh=6TVlG5PziR3qmd7U7JHFkcbO6djhkN6spgVpg6Q98GY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TKQtsrBh4pxjITyi7AyTXhP8JYnJXFWCxY3SNTcsOKkSOzxNHLU2u5mDJv4TNau12IIy8QnqWyAeh0sPixSmGW6Wsz6ADzZ7tosqzcunxJ/hvoq1NRpV554rLX+6dbeUnA6g9jCpxrY7s36leqxHbzR9U226D0egP479CspXpCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3zdcRf9; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3zdcRf9"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36525730172so3285424a91.1
        for <linux-staging@lists.linux.dev>; Tue, 05 May 2026 13:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778014720; x=1778619520; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v/KIP2hVXgnRxDhtLbrroKUeWc6NpJcgq/yST8Hr7Cc=;
        b=c3zdcRf9w5TCtpCBA769i1dkebt5avn87xeY3XWwz+CRuLluBoajZZkUFzT8lX+01A
         Pqyslu0bDV1l+1GnsJI5mE4FiLCOTp0yH37iTNCME1mAJe52XDV6QcovG5yRfMpLOQ2g
         oys2V66Byjuc8PNfRaAx3wM8uN9wTnkgOnSKO+jl96SXGr/P9wnuTiomATK93Bb6Iojo
         wuooZyKvU8KU1EdzU1OB3KEGjdRzMuIrrqa+NV+agksBg8+frzmrVwaGtp4QSsy1qDgT
         wryNdQ++L7mWlLFJRChjhz1MgYtc1Iwzz4HaMWwwv1J7nqfIolCbUrztnslvzSa6gbar
         ZINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778014720; x=1778619520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/KIP2hVXgnRxDhtLbrroKUeWc6NpJcgq/yST8Hr7Cc=;
        b=V6ywY4eMwUiHvElJHUM/kb/tMb2wuRZhmygmMzbjBlrJFZqHg0T9XqEOS+oN1UiIxa
         Y5lhf1TjorsfJ0Zn/eCfdLUEmJBKCB3LhC0Hp7uPPDt8NVrRajs3TilW3TO0VuZGkKTT
         YmrqSIb+OoFydHoarUVeHlbxE8znUwR0ZHi12AWSLzQb7oM9eyO9RTJhUW88NO88Us2L
         McoNtJqFwekOZaR27zrSCyEoDC0t1dhmHuP2nCZa7buSQg/JjkqRcqDtEh/asL5E1ZX+
         tihnKSu+S1ehA64SCk1IFsWh6HlNXkOc3EfUEOVapqozOHFEJNsuz/aRKzHbPXB8f91C
         zB8Q==
X-Forwarded-Encrypted: i=1; AFNElJ/CRm92D9RNskZpCrDYnYRL8ygCnpZCbGEh54OpRyv5fBALNLSPqwGewQaPbxP12tT+TrhGkae3zbOgQ20C@lists.linux.dev
X-Gm-Message-State: AOJu0Ywyq7cr5b+zQw1qlRxyR0DJSOOe+i7jwRI5fZdDIwVhsozuPfA1
	+QBuBlRTGF/Pzppog0GL2NrWhy2PIxNeuHeSnh9BBABvAzgILD5v4PKf
X-Gm-Gg: AeBDietbM9fvBNHK8sIur0LPQOh+WLNJhDuNvFyHm7LbC7yXkQP3RKcw1zTHhjZolWe
	iLMLIXtCiZgsug8JzWrdMDo5cCVu38gSWYWzrVFlTQptvgy0ON0Vs7Lxv4CDm1/kyNn1e+KHQKG
	kDWe61ODlZp7z8/vVTE+lWi617L09UoWzHdBnEk0ADBOGtZMUgj0FiVkt/Y3GTfbYWa6UNVIFzj
	RHo/UIMDeKxDjtpMtur3Tyx7evpee7xAZPovlx22BqLM2IN42EIBYgqn1pGTdhiqFanHfT6vYag
	gQd126ls87VDPgvQHGv6vsk/Ze+96V0nZZtvy6gQrScs20GJM6cbFouLcvxULj3Qi7JDNctiXyD
	8b87udVV9wKr7kxwXurJFGGO+fgzGOpz4SsyIwMVhbJ7Lb2j6bPq7wnFgEUYXqhwO9whe8hRfdq
	JyL27JMP1PAdWO1XYJMUK5QrSZDz0pg20d5tHYgZrmXsAMUxkJEGHGt/mRgndFVXRyd6mFg7spb
	DpfofZ2qB6dpmlPrQiBD0lRbH4NAMgn
X-Received: by 2002:a17:90b:2d0c:b0:35e:30bc:96e2 with SMTP id 98e67ed59e1d1-365abadcd42mr467821a91.10.1778014720131;
        Tue, 05 May 2026 13:58:40 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.114.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba7bf2c4aasm1678015ad.23.2026.05.05.13.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 13:58:39 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH] staging: vme_user: check find_bridge() return value
Date: Wed,  6 May 2026 02:27:46 +0530
Message-ID: <20260505205746.227144-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

find_bridge() returns NULL when no matching bridge is found
for a given resource. Some call sites dereference the return
value without verifying it is non-NULL.

Add NULL checks before use to avoid potentail NULL pointer
dereferences.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 drivers/staging/vme_user/vme.c | 63 ++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index b5c66b66ce32..2ed2f1fe502f 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -82,6 +82,9 @@ void *vme_alloc_consistent(struct vme_resource *resource, size_t size,
 {
 	struct vme_bridge *bridge = find_bridge(resource);
 
+	if (!bridge)
+		return NULL;
+
 	if (!bridge->alloc_consistent) {
 		dev_err(bridge->parent,
 			"alloc_consistent not supported by bridge %s\n",
@@ -107,6 +110,9 @@ void vme_free_consistent(struct vme_resource *resource, size_t size,
 {
 	struct vme_bridge *bridge = find_bridge(resource);
 
+	if (!bridge)
+		return;
+
 	if (!bridge->free_consistent) {
 		dev_err(bridge->parent,
 			"free_consistent not supported by bridge %s\n",
@@ -136,6 +142,9 @@ size_t vme_get_size(struct vme_resource *resource)
 	dma_addr_t buf_base;
 	u32 aspace, cycle, dwidth;
 
+	if (!bridge)
+		return 0;
+
 	switch (resource->type) {
 	case VME_MASTER:
 		retval = vme_master_get(resource, &enabled, &base, &size,
@@ -332,6 +341,9 @@ int vme_slave_set(struct vme_resource *resource, int enabled,
 	struct vme_slave_resource *image;
 	int retval;
 
+	if (!bridge)
+		return 0;
+
 	if (resource->type != VME_SLAVE) {
 		dev_err(bridge->parent, "Not a slave resource\n");
 		return -EINVAL;
@@ -381,6 +393,9 @@ int vme_slave_get(struct vme_resource *resource, int *enabled,
 	struct vme_bridge *bridge = find_bridge(resource);
 	struct vme_slave_resource *image;
 
+	if (!bridge)
+		return 0;
+
 	if (resource->type != VME_SLAVE) {
 		dev_err(bridge->parent, "Not a slave resource\n");
 		return -EINVAL;
@@ -409,6 +424,9 @@ void vme_slave_free(struct vme_resource *resource)
 	struct vme_bridge *bridge = find_bridge(resource);
 	struct vme_slave_resource *slave_image;
 
+	if (!bridge)
+		return;
+
 	if (resource->type != VME_SLAVE) {
 		dev_err(bridge->parent, "Not a slave resource\n");
 		return;
@@ -529,6 +547,9 @@ int vme_master_set(struct vme_resource *resource, int enabled,
 	struct vme_master_resource *image;
 	int retval;
 
+	if (!bridge)
+		return 0;
+
 	if (resource->type != VME_MASTER) {
 		dev_err(bridge->parent, "Not a master resource\n");
 		return -EINVAL;
@@ -579,6 +600,9 @@ int vme_master_get(struct vme_resource *resource, int *enabled,
 	struct vme_bridge *bridge = find_bridge(resource);
 	struct vme_master_resource *image;
 
+	if (!bridge)
+		return 0;
+
 	if (resource->type != VME_MASTER) {
 		dev_err(bridge->parent, "Not a master resource\n");
 		return -EINVAL;
@@ -618,6 +642,9 @@ ssize_t vme_master_read(struct vme_resource *resource, void *buf, size_t count,
 	struct vme_master_resource *image;
 	size_t length;
 
+	if (!bridge)
+		return 0;
+
 	if (!bridge->master_read) {
 		dev_warn(bridge->parent,
 			 "Reading from resource not supported\n");
@@ -667,6 +694,9 @@ ssize_t vme_master_write(struct vme_resource *resource, void *buf,
 	struct vme_master_resource *image;
 	size_t length;
 
+	if (!bridge)
+		return 0;
+
 	if (!bridge->master_write) {
 		dev_warn(bridge->parent, "Writing to resource not supported\n");
 		return -EINVAL;
@@ -718,6 +748,9 @@ unsigned int vme_master_rmw(struct vme_resource *resource, unsigned int mask,
 	struct vme_bridge *bridge = find_bridge(resource);
 	struct vme_master_resource *image;
 
+	if (!bridge)
+		return 0;
+
 	if (!bridge->master_rmw) {
 		dev_warn(bridge->parent, "Writing to resource not supported\n");
 		return -EINVAL;
@@ -753,6 +786,9 @@ int vme_master_mmap_prepare(struct vme_resource *resource,
 	struct vme_master_resource *image;
 	phys_addr_t phys_addr;
 
+	if (!bridge)
+		return 0;
+
 	if (resource->type != VME_MASTER) {
 		dev_err(bridge->parent, "Not a master resource\n");
 		return -EINVAL;
@@ -783,6 +819,9 @@ void vme_master_free(struct vme_resource *resource)
 	struct vme_bridge *bridge = find_bridge(resource);
 	struct vme_master_resource *master_image;
 
+	if (!bridge)
+		return;
+
 	if (resource->type != VME_MASTER) {
 		dev_err(bridge->parent, "Not a master resource\n");
 		return;
@@ -889,6 +928,9 @@ struct vme_dma_list *vme_new_dma_list(struct vme_resource *resource)
 	struct vme_bridge *bridge = find_bridge(resource);
 	struct vme_dma_list *dma_list;
 
+	if (!bridge)
+		return NULL;
+
 	if (resource->type != VME_DMA) {
 		dev_err(bridge->parent, "Not a DMA resource\n");
 		return NULL;
@@ -1173,6 +1215,9 @@ int vme_dma_free(struct vme_resource *resource)
 	struct vme_bridge *bridge = find_bridge(resource);
 	struct vme_dma_resource *ctrlr;
 
+	if (!bridge)
+		return 0;
+
 	if (resource->type != VME_DMA) {
 		dev_err(bridge->parent, "Not a DMA resource\n");
 		return -EINVAL;
@@ -1494,6 +1539,9 @@ int vme_lm_count(struct vme_resource *resource)
 	struct vme_bridge *bridge = find_bridge(resource);
 	struct vme_lm_resource *lm;
 
+	if (!bridge)
+		return 0;
+
 	if (resource->type != VME_LM) {
 		dev_err(bridge->parent, "Not a Location Monitor resource\n");
 		return -EINVAL;
@@ -1525,6 +1573,9 @@ int vme_lm_set(struct vme_resource *resource, unsigned long long lm_base,
 	struct vme_bridge *bridge = find_bridge(resource);
 	struct vme_lm_resource *lm;
 
+	if (!bridge)
+		return 0;
+
 	if (resource->type != VME_LM) {
 		dev_err(bridge->parent, "Not a Location Monitor resource\n");
 		return -EINVAL;
@@ -1561,6 +1612,9 @@ int vme_lm_get(struct vme_resource *resource, unsigned long long *lm_base,
 	struct vme_bridge *bridge = find_bridge(resource);
 	struct vme_lm_resource *lm;
 
+	if (!bridge)
+		return 0;
+
 	if (resource->type != VME_LM) {
 		dev_err(bridge->parent, "Not a Location Monitor resource\n");
 		return -EINVAL;
@@ -1598,6 +1652,9 @@ int vme_lm_attach(struct vme_resource *resource, int monitor,
 	struct vme_bridge *bridge = find_bridge(resource);
 	struct vme_lm_resource *lm;
 
+	if (!bridge)
+		return 0;
+
 	if (resource->type != VME_LM) {
 		dev_err(bridge->parent, "Not a Location Monitor resource\n");
 		return -EINVAL;
@@ -1631,6 +1688,9 @@ int vme_lm_detach(struct vme_resource *resource, int monitor)
 	struct vme_bridge *bridge = find_bridge(resource);
 	struct vme_lm_resource *lm;
 
+	if (!bridge)
+		return 0;
+
 	if (resource->type != VME_LM) {
 		dev_err(bridge->parent, "Not a Location Monitor resource\n");
 		return -EINVAL;
@@ -1664,6 +1724,9 @@ void vme_lm_free(struct vme_resource *resource)
 	struct vme_bridge *bridge = find_bridge(resource);
 	struct vme_lm_resource *lm;
 
+	if (!bridge)
+		return;
+
 	if (resource->type != VME_LM) {
 		dev_err(bridge->parent, "Not a Location Monitor resource\n");
 		return;
-- 
2.43.0

