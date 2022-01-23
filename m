Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12922CB9
	for <linux-staging@lists.linux.dev>; Sun, 23 Jan 2022 20:03:02 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.169]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MA7b8-1n1FkI0dha-00Bams; Sun, 23 Jan 2022 21:02:56 +0100
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: bcm-kernel-feedback-list@broadcom.com,
	Phil Elwell <phil@raspberrypi.com>,
	Gaston Gonzalez <gascoar@gmail.com>,
	linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 13/18] staging: vchiq_core: avoid ternary operator for set_service_state
Date: Sun, 23 Jan 2022 21:02:18 +0100
Message-Id: <1642968143-19281-14-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
References: <1642968143-19281-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:wtiVkW7T4Wa39fBJm1QCbft2EArtshrn7Fd3hU31yOfCjuQAOPS
 ZNgtDOECY1VcrgBaiYEN+Mi3vgkQROLn9abKakS9zqcfPQk5b2OPVMABVLxI87qHeIlh2aT
 IN1+7k5CWo9QevwBVLlpMUv43BzKfUJogbxNHfh3zcIYAlExX1UPGOCH/bKeW41SRQVLgzw
 uydfJMoiTfSvB9QFZQBQw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rJj0pyzCy0k=:NvW7Xdm9xJeY0yI0G4bf2r
 aPX23CeGHX4vg/muwYbdSNigJ+auK9LJ9WXi/62D3uG4SilsprTmHL83Ez021KcMENKCDRnvt
 Zno3DGEBXIeXtbp+h40DAqdSMfMh6LAmJdsPVozB7u4svMjgG7AZFzONIR6ZGLbGvLYXppy6S
 lMZP3XnF5+B9N3qcVPbNbug6BB3fd8QwQ/6lPj5UBLte3ictHCKSGlBZUYBJ4jUuKU4j4/Wcx
 IPWziasM7B7/V5YzIPQBlzO8sxa/m17KnLBIjOFZhyUCD53DzK+MgZBM8xLP+CFbgP6skOzbO
 NERymOzdCdYJOzmD1OjqqMDxappC7lh0clp9OTyrnlDNuTfbXUNJKZm2yNQV3cvunmUmDv7vc
 Ro1U0jt4gJwIjeRjQ0qxYt5MhCQ0jhlYExabhpCAdBpzQ1pBbRflDnmmXrHOMOUCzMNx4rlyi
 yb7OdUb4lmyEobtvLXnD//NHkIYqnpaErFti4nnvwfT5gppaSioNL7IRTA43xpPtdjOLFc3aF
 W8PCsy6AwmvtCaI+wn0JwbQXqbcgZkaDcW2WfJw7owChPZCjfGrcFWEGC/AOtAjRPvb+HbRw0
 +IS6dzSjUKlUb5Vv2WVbS7o5R0vbRqg/w2zlXolt+7Q+4pfsguT9m+161GbzfxWdgtA8criJA
 eM3SEnQRupt8qHl5cxkbjUtysK14ZB3z6Me+jZ3A4F+Xg6nj0CLqfpUc0Hx+E26eHYADje2y6
 TiZa4XHee8VtnORU
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

There is already a check for service->sync, so use this instead of a
separate ternary operator to update the service state.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 7e901be..6127244 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -1521,15 +1521,17 @@ parse_open(struct vchiq_state *state, struct vchiq_header *header)
 			if (queue_message_sync(state, NULL, openack_id, memcpy_copy_callback,
 					       &ack_payload, sizeof(ack_payload), 0) == VCHIQ_RETRY)
 				goto bail_not_ready;
+
+			/* The service is now open */
+			set_service_state(service, VCHIQ_SRVSTATE_OPENSYNC);
 		} else {
 			if (queue_message(state, NULL, openack_id, memcpy_copy_callback,
 					  &ack_payload, sizeof(ack_payload), 0) == VCHIQ_RETRY)
 				goto bail_not_ready;
-		}
 
-		/* The service is now open */
-		set_service_state(service, service->sync ? VCHIQ_SRVSTATE_OPENSYNC
-					: VCHIQ_SRVSTATE_OPEN);
+			/* The service is now open */
+			set_service_state(service, VCHIQ_SRVSTATE_OPEN);
+		}
 	}
 
 	/* Success - the message has been dealt with */
-- 
2.7.4

