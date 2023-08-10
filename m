Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42B33C3C
	for <linux-staging@lists.linux.dev>; Thu, 10 Aug 2023 09:16:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 035AEC433C8;
	Thu, 10 Aug 2023 09:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691658997;
	bh=zJE0WmFdaYb7Ti2ERniP+fEDjSx1UljWS7VoaTirjiQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=epDptasYtf71uksmyF3AyJX63Xz++gBvXiLYpnCHLr3ySfJSc4lWoArFMZ5py/yI+
	 IqzOEkIdZ1EyZysLGkHNohXRtxY6+GmvKCUOv15KzxMZok4lb34U+SND0eGyuyVCw6
	 EXR+zxw/u1ayr97tNfHhzIYjkpqryYE6j5cSVk3cho4GGU/LHLF57ukLbUKL3w2kWZ
	 5JwIVKnqfjekzsqRrWA/EAZVj9LUUg+zKCaMd8Te5QbRmzEylq+QtCIundpXjg8W7D
	 Nq1kI5zvMwtVQkxeY2O2hXEK87OLU5GKMP0IO7Bg1t7cSB6UPwdlvkON8qVeql4K87
	 LuGeI+7lS2SYA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH 34/36] tty: gdm724x: convert counts to size_t
Date: Thu, 10 Aug 2023 11:15:08 +0200
Message-ID: <20230810091510.13006-35-jirislaby@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230810091510.13006-1-jirislaby@kernel.org>
References: <20230810091510.13006-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unify the type of tty_operations::write() counters with the 'count'
parameter. I.e. use size_t for them.

This includes changing constants to UL to keep min() and avoid min_t().

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: linux-staging@lists.linux.dev
---
 drivers/staging/gdm724x/gdm_tty.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm724x/gdm_tty.c
index b31f2afb0286..cbaaa8fa7474 100644
--- a/drivers/staging/gdm724x/gdm_tty.c
+++ b/drivers/staging/gdm724x/gdm_tty.c
@@ -17,9 +17,9 @@
 #define GDM_TTY_MAJOR 0
 #define GDM_TTY_MINOR 32
 
-#define WRITE_SIZE 2048
+#define WRITE_SIZE 2048UL
 
-#define MUX_TX_MAX_SIZE 2048
+#define MUX_TX_MAX_SIZE 2048UL
 
 static inline bool gdm_tty_ready(struct gdm *gdm)
 {
@@ -152,9 +152,8 @@ static void gdm_tty_send_complete(void *arg)
 static ssize_t gdm_tty_write(struct tty_struct *tty, const u8 *buf, size_t len)
 {
 	struct gdm *gdm = tty->driver_data;
-	int remain = len;
-	int sent_len = 0;
-	int sending_len = 0;
+	size_t remain = len;
+	size_t sent_len = 0;
 
 	if (!gdm_tty_ready(gdm))
 		return -ENODEV;
@@ -163,7 +162,7 @@ static ssize_t gdm_tty_write(struct tty_struct *tty, const u8 *buf, size_t len)
 		return 0;
 
 	while (1) {
-		sending_len = min(MUX_TX_MAX_SIZE, remain);
+		size_t sending_len = min(MUX_TX_MAX_SIZE, remain);
 		gdm->tty_dev->send_func(gdm->tty_dev->priv_dev,
 					(void *)(buf + sent_len),
 					sending_len,
-- 
2.41.0

