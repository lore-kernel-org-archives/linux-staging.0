Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD7F2CB1
	for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 20:03:01 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.169]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MnJUy-1mSS9i3wFo-00jHAu; Sun, 23 Jan 2022 21:02:55 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: bcm-kernel-feedback-list@broadcom.com,
	Phil Elwell <phil@raspberrypi.com>,
	Gaston Gonzalez <gascoar@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 09/18] staging: vchiq_core: align return statements in msg_type_str
Date: Sun, 23 Jan 2022 21:02:14 +0100
Message-Id: <1642968143-19281-10-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
References: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:IXpFW5qMOCFn+nMgFXUuiGGH+d1n806jYtVXlBxVBvKUy6FuBgH
 PZG4rjAVlDmFnB0ZDgicWRKFfsPW+pmuXwOzia1ZugGcZsobi/0N6bw8f3FrYh+NjDLdQ8i
 TO73DqynTLaVhB5ql/yQ30UoZX4XLe6WqKeVp7O3MbeOSgLA8R/gqu8o60+Y0KXgtzfASTU
 0kc1C4fHhdqnIF1CclwiA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/3aONyms9go=:Ahko3rKs/kwdCksblg/LGd
 Vxk5hx9EFHlY/FD+7i7TKYjDx1f20sPG0ruKa5RI2A29RzXLuvU9LhhQ+Ju7VX8dJKhwkNU+8
 azQ4mQ5+Rc8k3MADsXZNcRdQvj5Z7QI36iDLqQwQm1FVUxkgNCg7XByKt8wjOXX7ZK0YVG4xJ
 5wZeBkpajEj8ICICDOeDVEQePHeF7JDi6qLu07xeLYnl2llLrVYtwEBlf6vxfKZnJyC8iCAuV
 Vk0sUHbjWCmWBEF0bjjgAAKtgN7JmKpEmFI60JoAUjAHRAlGaUnmmm6TWRJGfsK1zwawjtnUG
 hknIrXL5IisJMG7Hx0jK+jiZfR9C2W3Dkfv5oYS1BXAbPRvpiT/uUVqlU0UFGUQmEif5bk8HB
 H6dZ/xuYQizd6quOTiml/TO3/4cHqbK6wvhk/xa3ZiuJn+NBtPptQvJLS+gSuTsUzV6hmbvHF
 B8ZkcWepBOEOiYZ8renWd6oLABCh4hhasTKhuJ9bKdnNXvGmo7ekfTChgn5xRvgIutkdpXa+i
 0yGVdHdRJAwT8mP2GAAh+tDcnNVbc6rhATqBexCddsxJ1dcI3KKojKRkN2S/wszIeFcFzYxKo
 SDE/bWzOi4j573NcNCmy0kYjb0LxMvHGjkyfjxKYYH5mtxbywmK+Y6NHVMsR6+AFRoegP24Jn
 BZZNwLCd+9N7Y5J9fxXUef+BhzO1PiK9LYLNNy4x32d6saTMELxeQRW5sfHv6PVDGePtX6XRF
 aqsSiEOBdWCpY3iv
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

The return statements aren't properly aligned. So fix this by using tabs.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c | 30 +++++++++++-----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index a13a076..e500cef 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -205,21 +205,21 @@ release_message_sync(struct vchiq_state *state, struct vchiq_header *header);
 static const char *msg_type_str(unsigned int msg_type)
 {
 	switch (msg_type) {
-	case VCHIQ_MSG_PADDING:       return "PADDING";
-	case VCHIQ_MSG_CONNECT:       return "CONNECT";
-	case VCHIQ_MSG_OPEN:          return "OPEN";
-	case VCHIQ_MSG_OPENACK:       return "OPENACK";
-	case VCHIQ_MSG_CLOSE:         return "CLOSE";
-	case VCHIQ_MSG_DATA:          return "DATA";
-	case VCHIQ_MSG_BULK_RX:       return "BULK_RX";
-	case VCHIQ_MSG_BULK_TX:       return "BULK_TX";
-	case VCHIQ_MSG_BULK_RX_DONE:  return "BULK_RX_DONE";
-	case VCHIQ_MSG_BULK_TX_DONE:  return "BULK_TX_DONE";
-	case VCHIQ_MSG_PAUSE:         return "PAUSE";
-	case VCHIQ_MSG_RESUME:        return "RESUME";
-	case VCHIQ_MSG_REMOTE_USE:    return "REMOTE_USE";
-	case VCHIQ_MSG_REMOTE_RELEASE:      return "REMOTE_RELEASE";
-	case VCHIQ_MSG_REMOTE_USE_ACTIVE:   return "REMOTE_USE_ACTIVE";
+	case VCHIQ_MSG_PADDING:			return "PADDING";
+	case VCHIQ_MSG_CONNECT:			return "CONNECT";
+	case VCHIQ_MSG_OPEN:			return "OPEN";
+	case VCHIQ_MSG_OPENACK:			return "OPENACK";
+	case VCHIQ_MSG_CLOSE:			return "CLOSE";
+	case VCHIQ_MSG_DATA:			return "DATA";
+	case VCHIQ_MSG_BULK_RX:			return "BULK_RX";
+	case VCHIQ_MSG_BULK_TX:			return "BULK_TX";
+	case VCHIQ_MSG_BULK_RX_DONE:		return "BULK_RX_DONE";
+	case VCHIQ_MSG_BULK_TX_DONE:		return "BULK_TX_DONE";
+	case VCHIQ_MSG_PAUSE:			return "PAUSE";
+	case VCHIQ_MSG_RESUME:			return "RESUME";
+	case VCHIQ_MSG_REMOTE_USE:		return "REMOTE_USE";
+	case VCHIQ_MSG_REMOTE_RELEASE:		return "REMOTE_RELEASE";
+	case VCHIQ_MSG_REMOTE_USE_ACTIVE:	return "REMOTE_USE_ACTIVE";
 	}
 	return "???";
 }
-- 
2.7.4

