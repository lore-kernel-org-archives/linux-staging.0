Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8C52CAE
	for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 20:03:00 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.169]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MkYLW-1mQoWe0qr8-00m24A; Sun, 23 Jan 2022 21:02:54 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: bcm-kernel-feedback-list@broadcom.com,
	Phil Elwell <phil@raspberrypi.com>,
	Gaston Gonzalez <gascoar@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 07/18] staging: vchiq_core: fix type of parameter localport
Date: Sun, 23 Jan 2022 21:02:12 +0100
Message-Id: <1642968143-19281-8-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
References: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:vabqpbVYzgn8tzF2ncqj3pYXnkRr72ilgmvoZHEvoQ+WewTaI2c
 N3qIfPeARMSLAt1FMjbrejTnU934xeL4NRTKZ0cs2+rtkTPFBxNFjLFHPDocVs8BsATUtNl
 XJnld01S1NLt6lJuMapTaEOfTAf/4MmMglvqkosPdhr6+7gQ3ZjCvL3ne70mTv+9fUm4lSp
 TSB9tiCc2UANMlgPuOWyA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+QUCrMiLfRg=:FxBm+62Ch90cz6AgyOuuWv
 KCe3nJ91cEadWmPGNNUDv23ryRCJ8uFdjIP+70PjM0ja13nmb+2REMvB6XjazDjTmpbWn/EBz
 gW0NJhp76tJ0bI+oubXoFrfpWbgmdS89Ed0LvGzbKZzup6nXYCtvBWBBkF1Lc8OLand/u68ND
 B0HjgAdUm2pCxfziRu6SciKVO/iq4KtdewytdvC3gbWJFN32LY7T/bXNXMFZDpJBozKrGsfa1
 gkrmAlAFy7SH7RBoIXVkppmqTEKeLud/LrAnfkzHQoeTmrLfIe+4kCwMJyl4FBB7tIwjnpExa
 2HFGLd9wXBqIEM/AJ7fZygCgnsLbA6Cuqc2A8vzo1V4vj/EDe95QRELQYwmZAJ83IeApeyWw9
 T4yiNoYl8zIIBoUa4LqK63HKOFGpYBtsrKjme5pTU3Aj/2Di2UZErJ0h5kRu+qmiJIDpp0P7T
 m1JGQn95N49ik8p5nIIYdqrchb/NvbSeL8OOtl1gnO4wdLl2BOSh6P6RS48B/7Ya6RGi4jptt
 ue6+L95laoZP3dXliLe9n9iDggyGMiRMYZoNJ8cuG7q0tLe/8LKzZC60SB8v6OBx8aDkFlovB
 eufQEUexOBj5xv8dXGPpIwXyPgGqeZqyplz+D+2KI0aYzBgNqGLk7RXYetO5qp0o0PR+E7Hu1
 O9nDdLZCvOkswSxsBoSC/Bgf133eIvtEQPJvsX8b4QbYzcn5f+sgTyXwojkezVAMBTPFJ5Qn0
 i9LQJwxPIx16Jo0g
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The whole vchiq driver uses unsigned int for "localport" except of
find_service_by_port(). So fix this and get the rid of this suspicous
cast.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 6 +++---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 2cbbbb6..6fa9fee 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -255,9 +255,9 @@ find_service_by_handle(unsigned int handle)
 }
 
 struct vchiq_service *
-find_service_by_port(struct vchiq_state *state, int localport)
+find_service_by_port(struct vchiq_state *state, unsigned int localport)
 {
-	if ((unsigned int)localport <= VCHIQ_PORT_MAX) {
+	if (localport <= VCHIQ_PORT_MAX) {
 		struct vchiq_service *service;
 
 		rcu_read_lock();
@@ -271,7 +271,7 @@ find_service_by_port(struct vchiq_state *state, int localport)
 		rcu_read_unlock();
 	}
 	vchiq_log_info(vchiq_core_log_level,
-		       "Invalid port %d", localport);
+		       "Invalid port %u", localport);
 	return NULL;
 }
 
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index 55abaf0..82b7bd7b 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -524,7 +524,7 @@ extern struct vchiq_service *
 find_service_by_handle(unsigned int handle);
 
 extern struct vchiq_service *
-find_service_by_port(struct vchiq_state *state, int localport);
+find_service_by_port(struct vchiq_state *state, unsigned int localport);
 
 extern struct vchiq_service *
 find_service_for_instance(struct vchiq_instance *instance, unsigned int handle);
-- 
2.7.4

