Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC841B60
	for <linux-staging@lists.linux.dev>; Thu, 24 Mar 2022 07:31:01 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id pv16so7420297ejb.0
        for <linux-staging@lists.linux.dev>; Thu, 24 Mar 2022 00:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bQP0V9OY5aQsKT4SJO0KH8YjFqWZFbeNBTnB8MCoLgM=;
        b=p+j6YAY2V68RpdPuWD726VDdObgITxMOArazNEZ+vBFzd/Yyzwxf7UJRhHGjLOx/c1
         eu1r3a2tAJa+O0Xm+a8k8wWrz0K1QtaHKUUXgXzazpXSr9PZHYwFApajJSNiqRk7dXT9
         qhSfvDxpciDHZ37jtEgKCyxERlB6a8N55D9jmEVLDj4XXhjlNAD2r/EaHDsB3uNOiywZ
         oUVDeeb2xy6h3jGTYWpTGOzUX4Lef6xyIeC2tFMn49ZkHq/Zvcuh8lqJlyTYpsuTEGBV
         NGwQXEisS/3JAiNA4XN9ackHlaGaCXkKwnQ/iOybWRtaY0k+rk0pYcUTpH31XoCr7cz+
         6/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bQP0V9OY5aQsKT4SJO0KH8YjFqWZFbeNBTnB8MCoLgM=;
        b=mxnNk5mxbetv61wFO1Oo/nQI28C5MZNpnfbbow9ZP/QsO58MsC6YPpWurf9iptZI+b
         JLOJr25xwjvZQKGdbVDKEyWAWky/ss3vG9nvtNYdGj2Bve0Xp46LwuK4HVFsuKg8D1J6
         zO5XrMuyh4ZX52d/pgD9idB/GecLJtu7s6s8O5VHXXb0Lp03O/i5PUtDwQuTQOLsPWU3
         cc2grRuGSKtNZY22ZdmyWIYOIKcNTQaPorxkcvB+I9N3gef+oUnaGZ0CTPWXHscKYISL
         orfeuel3hjUT6BR0hPn6fmlkNcxsV3ZAXcO4NrD9ZmkW9xRHF9BKQ0dNHN5vFAKQIZIb
         foMg==
X-Gm-Message-State: AOAM530hLtpqphjnObvj+juCkDpXjLKGIXZjBAxNA3PnhZzmw3BJHL12
	6C6XlABMU9xHfW+JNu1xYJk=
X-Google-Smtp-Source: ABdhPJyjdhPveqm4nFYih/ZGNZbOl5jnnO+9D7Pg2jNePkk0xBvxhyvs3MM/lXT8Rx/g8O09rT6I4g==
X-Received: by 2002:a17:906:ae0b:b0:6df:c7d6:9235 with SMTP id le11-20020a170906ae0b00b006dfc7d69235mr4366763ejb.664.1648107060275;
        Thu, 24 Mar 2022 00:31:00 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl. [62.195.130.160])
        by smtp.googlemail.com with ESMTPSA id sa13-20020a1709076d0d00b006ce3ef8e1d4sm776972ejc.31.2022.03.24.00.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Mar 2022 00:30:59 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Gaston Gonzalez <gascoar@gmail.com>,
	Ojaswin Mujoo <ojaswin98@gmail.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mike Rapoport <rppt@kernel.org>,
	"Brian Johannesmeyer" <bjohannesmeyer@gmail.com>,
	Cristiano Giuffrida <c.giuffrida@vu.nl>,
	"Bos, H.J." <h.j.bos@vu.nl>,
	Jakob Koschel <jakobkoschel@gmail.com>
Subject: [PATCH] staging: vchiq: replace usage of found with dedicated list iterator variable
Date: Thu, 24 Mar 2022 08:30:24 +0100
Message-Id: <20220324073024.65943-1-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To move the list iterator variable into the list_for_each_entry_*()
macro in the future it should be avoided to use the list iterator
variable after the loop body.

To *never* use the list iterator variable after the loop it was
concluded to use a separate iterator variable instead of a
found boolean [1].

This removes the need to use a found variable and simply checking if
the variable was set, can determine if the break/goto was hit.

Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c   | 13 ++++++-------
 .../vc04_services/interface/vchiq_arm/vchiq_dev.c   | 13 ++++++-------
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 3a2e4582db8e..f27ff246a672 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -908,8 +908,7 @@ vchiq_blocking_bulk_transfer(unsigned int handle, void *data, unsigned int size,
 	struct vchiq_instance *instance;
 	struct vchiq_service *service;
 	enum vchiq_status status;
-	struct bulk_waiter_node *waiter = NULL;
-	bool found = false;
+	struct bulk_waiter_node *waiter = NULL, *iter;
 
 	service = find_service_by_handle(handle);
 	if (!service)
@@ -920,16 +919,16 @@ vchiq_blocking_bulk_transfer(unsigned int handle, void *data, unsigned int size,
 	vchiq_service_put(service);
 
 	mutex_lock(&instance->bulk_waiter_list_mutex);
-	list_for_each_entry(waiter, &instance->bulk_waiter_list, list) {
-		if (waiter->pid == current->pid) {
-			list_del(&waiter->list);
-			found = true;
+	list_for_each_entry(iter, &instance->bulk_waiter_list, list) {
+		if (iter->pid == current->pid) {
+			list_del(&iter->list);
+			waiter = iter;
 			break;
 		}
 	}
 	mutex_unlock(&instance->bulk_waiter_list_mutex);
 
-	if (found) {
+	if (waiter) {
 		struct vchiq_bulk *bulk = waiter->bulk_waiter.bulk;
 
 		if (bulk) {
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index 2325844b0880..5102750dbabc 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -290,8 +290,7 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 				      enum vchiq_bulk_mode __user *mode)
 {
 	struct vchiq_service *service;
-	struct bulk_waiter_node *waiter = NULL;
-	bool found = false;
+	struct bulk_waiter_node *waiter = NULL, *iter;
 	void *userdata;
 	int status = 0;
 	int ret;
@@ -310,16 +309,16 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 		userdata = &waiter->bulk_waiter;
 	} else if (args->mode == VCHIQ_BULK_MODE_WAITING) {
 		mutex_lock(&instance->bulk_waiter_list_mutex);
-		list_for_each_entry(waiter, &instance->bulk_waiter_list,
+		list_for_each_entry(iter, &instance->bulk_waiter_list,
 				    list) {
-			if (waiter->pid == current->pid) {
-				list_del(&waiter->list);
-				found = true;
+			if (iter->pid == current->pid) {
+				list_del(&iter->list);
+				waiter = iter;
 				break;
 			}
 		}
 		mutex_unlock(&instance->bulk_waiter_list_mutex);
-		if (!found) {
+		if (!waiter) {
 			vchiq_log_error(vchiq_arm_log_level,
 					"no bulk_waiter found for pid %d", current->pid);
 			ret = -ESRCH;

base-commit: f443e374ae131c168a065ea1748feac6b2e76613
-- 
2.25.1

