Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DFF6D19
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 18:12:29 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.124]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mnq4Q-1ltNkR1hs2-00pK48; Sun, 11 Apr 2021 20:12:25 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 10/10] staging: vchiq_core: split exit conditions
Date: Sun, 11 Apr 2021 20:11:40 +0200
Message-Id: <1618164700-21150-11-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618164700-21150-1-git-send-email-stefan.wahren@i2se.com>
References: <1618164700-21150-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:nA06OvCI+/iyCWraZt3+qzWavueTLMrFL8WZhR/gVGM9zujRmDS
 /NlaTXYsXYnOjdwC1ftRUU3YsZ7fMGSJVTHRDK1VVxn1VsnSaQGztk4QmEj1ahGxHv4Di2h
 FDwTISYfqa/n/g0ROVF9Cfk4EE0XmmZp4r0yNQ4HqrIzOfvQ8+Qh8AaCUb25P3dZKHghhVa
 Wy7qUOF3bjwBQwDY6EDJg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7KKYL/ksGSM=:UJOk9e78YLiFv64D6XfO4j
 6P6n2hK9Ei+mR8LYAEdUaXFsbSiSXr8JU4FtGAak7BRQ1Gy3DHYdMIg5wwICfZchLBLEtr/f2
 70g0zFChWvTM4xsw9tUfJRK7SVzmn4rFKHTRLgwF3B7SIjVFPZoZJRiHegPneFNNSPpwBST/H
 pvg4RdzkFG99VA7DRm7E09n5JCdV46t32/dyThKtma9QvmcMVi2bD+LMFfrVa7tz3es9vWrJH
 lf3+/02ExU/NCBh9Ws/sM1pAxSkcK8LF4DVIabtd58QHe7WE1XQZrvz2kAJVPsV3TEzAWANkP
 hf//1VBj2EWB1mFnS2gYIdzLzt4/py8dSAsyMrZauCG2BixBonsU5fGjBhVO+AROprhj5U3Dt
 RsiYXOlan/iwJ0K6kq2lUJa64ASKgdSO5UPGwxdPT/M/rnrInLxyPKiuZCRDOtxdkT+B0cCVR
 PVr/slvKiXhC5Qt+Xapfc5V4Gn3fEKmbmtRZzCaDcIN2NHLZRRkH
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Some exit conditions are rather complex. So better split them up.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c | 30 ++++++++++++++++------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index f5bd5e2..517a8c9 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -3069,9 +3069,16 @@ enum vchiq_status vchiq_bulk_transfer(unsigned int handle,
 	enum vchiq_status status = VCHIQ_ERROR;
 	int payload[2];
 
-	if (!service || service->srvstate != VCHIQ_SRVSTATE_OPEN ||
-	    (!offset && !uoffset) ||
-	    vchiq_check_service(service) != VCHIQ_SUCCESS)
+	if (!service)
+		goto error_exit;
+
+	if (service->srvstate != VCHIQ_SRVSTATE_OPEN)
+		goto error_exit;
+
+	if (!offset && !uoffset)
+		goto error_exit;
+
+	if (vchiq_check_service(service) != VCHIQ_SUCCESS)
 		goto error_exit;
 
 	switch (mode) {
@@ -3215,8 +3222,10 @@ vchiq_queue_message(unsigned int handle,
 	struct vchiq_service *service = find_service_by_handle(handle);
 	enum vchiq_status status = VCHIQ_ERROR;
 
-	if (!service ||
-		(vchiq_check_service(service) != VCHIQ_SUCCESS))
+	if (!service)
+		goto error_exit;
+
+	if (vchiq_check_service(service) != VCHIQ_SUCCESS)
 		goto error_exit;
 
 	if (!size) {
@@ -3327,10 +3336,15 @@ vchiq_get_peer_version(unsigned int handle, short *peer_version)
 	enum vchiq_status status = VCHIQ_ERROR;
 	struct vchiq_service *service = find_service_by_handle(handle);
 
-	if (!service ||
-	    (vchiq_check_service(service) != VCHIQ_SUCCESS) ||
-	    !peer_version)
+	if (!service)
+		goto exit;
+
+	if (vchiq_check_service(service) != VCHIQ_SUCCESS)
+		goto exit;
+
+	if (!peer_version)
 		goto exit;
+
 	*peer_version = service->peer_version;
 	status = VCHIQ_SUCCESS;
 
-- 
2.7.4

