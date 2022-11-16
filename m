Received: from mailout-pe-b.jellyfish.systems (mailout-pe-b.jellyfish.systems [198.54.127.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5515ED53E
	for <linux-staging@lists.linux.dev>; Wed, 16 Nov 2022 19:35:01 +0000 (UTC)
Received: from output-router-58994b6955-smsdz (unknown [10.35.5.64])
	by mailout-pe-b.jellyfish.systems (Postfix) with ESMTPA id 4NCCfr4M6mzDqMs;
	Wed, 16 Nov 2022 19:24:52 +0000 (UTC)
Received: from MTA-05.privateemail.com (unknown [10.50.14.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by NEW-01.privateemail.com (Postfix) with ESMTPS id 81C3A18000CF;
	Wed, 16 Nov 2022 14:24:52 -0500 (EST)
Received: from mta-05.privateemail.com (localhost [127.0.0.1])
	by mta-05.privateemail.com (Postfix) with ESMTP id 6029318000AA;
	Wed, 16 Nov 2022 14:24:52 -0500 (EST)
Received: from bpappas-XPS-13-9310.wppl.org (unknown [131.226.25.151])
	by mta-05.privateemail.com (Postfix) with ESMTPA id 8868818000A0;
	Wed, 16 Nov 2022 14:24:47 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=pappasbrent.com;
	s=default; t=1668626692;
	bh=QvsVh75+ZnsL2z/rlywbbUnkur9BTukvZDfLnRxV6Ec=;
	h=From:To:Cc:Subject:Date:From;
	b=hmYwvYxYsbDtTCOHnMvYOWnHgShkzRVDTMA+8hSnyvsxDebsO0fNuapZpVcl33LNP
	 VvH+RMjjLmkJYFSWd8rosSpKG0uo3gBVjHb1aPdkKxGB6KZi5pK2MRFFs7c09lcLGP
	 mfiWHmSE9IdD9H9xQ2LK+KL0nuzw3OJrp0JYeRBHES1HMv4KEIfGFyZ97Voysrxk3i
	 2XdS/yfQqSsKKFxH2Wtroh/53N/BELT8/WfRF9W4rzLgJxgXEQDYasWFSmBvSTA1AH
	 bkqM1HUhO+3bnBGTRhCoDjt791k8nXlZXgUn0F3uPq5uPUiev7JFdZ9LW8rUOxKWIP
	 Wq/Q4LXoiRWvQ==
From: Brent Pappas <bpappas@pappasbrent.com>
To: gregkh@linuxfoundation.org
Cc: johan@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Brent Pappas <bpappas@pappasbrent.com>
Subject: [PATCH 1/1] staging: gdm724x: Replace macro GDM_TTY_READY with static inline function
Date: Wed, 16 Nov 2022 14:24:13 -0500
Message-Id: <20221116192412.22446-1-bpappas@pappasbrent.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

Replace the macro GDM_TTY_READY with a static inline function
to follow the Linux kernel coding style.

Signed-off-by: Brent Pappas <bpappas@pappasbrent.com>
---
 drivers/staging/gdm724x/gdm_tty.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
index cc6d80554c98..93d50d42a367 100644
--- a/drivers/staging/gdm724x/gdm_tty.c
+++ b/drivers/staging/gdm724x/gdm_tty.c
@@ -21,7 +21,10 @@
 
 #define MUX_TX_MAX_SIZE 2048
 
-#define GDM_TTY_READY(gdm) (gdm && gdm->tty_dev && gdm->port.count)
+static inline int gdm_tty_ready(struct gdm *gdm)
+{
+	return gdm && gdm->tty_dev && gdm->port.count;
+}
 
 static struct tty_driver *gdm_driver[TTY_MAX_COUNT];
 static struct gdm *gdm_table[TTY_MAX_COUNT][GDM_TTY_MINOR];
@@ -113,7 +116,7 @@ static int gdm_tty_recv_complete(void *data,
 {
 	struct gdm *gdm = tty_dev->gdm[index];
 
-	if (!GDM_TTY_READY(gdm)) {
+	if (!gdm_tty_ready(gdm)) {
 		if (complete == RECV_PACKET_PROCESS_COMPLETE)
 			gdm->tty_dev->recv_func(gdm->tty_dev->priv_dev,
 						gdm_tty_recv_complete);
@@ -140,7 +143,7 @@ static void gdm_tty_send_complete(void *arg)
 {
 	struct gdm *gdm = arg;
 
-	if (!GDM_TTY_READY(gdm))
+	if (!gdm_tty_ready(gdm))
 		return;
 
 	tty_port_tty_wakeup(&gdm->port);
@@ -154,7 +157,7 @@ static int gdm_tty_write(struct tty_struct *tty, const unsigned char *buf,
 	int sent_len = 0;
 	int sending_len = 0;
 
-	if (!GDM_TTY_READY(gdm))
+	if (!gdm_tty_ready(gdm))
 		return -ENODEV;
 
 	if (!len)
@@ -181,7 +184,7 @@ static unsigned int gdm_tty_write_room(struct tty_struct *tty)
 {
 	struct gdm *gdm = tty->driver_data;
 
-	if (!GDM_TTY_READY(gdm))
+	if (!gdm_tty_ready(gdm))
 		return 0;
 
 	return WRITE_SIZE;
-- 
2.34.1

