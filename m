Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDCC5C96;
	Thu, 20 Oct 2022 17:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666286405; bh=y6f5yuwFB+7dnXtKXxkno+O53LHKdZ313hR7lgO+0+8=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=FbODB1m/snmKR53dyym2wqd6Gay0C6rLOo+K86CJCJCk4Xf+yEhg3vnvY5bJbwB2v
	 3hHER9fH5oznV88TxzD99EsxH9V0wMjFE47PIWRQi3oKZ8xEjno9fOZReDSNEvYkGA
	 dpDOraP8vkHzshmUcQ4jnOWV84Y3L0twWyK0YT00=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
	via [213.182.55.206]
	Thu, 20 Oct 2022 19:20:04 +0200 (CEST)
X-EA-Auth: wpa2NRXTxRpbcD6NcHXdGUXpqYLgRLwpFui68DnSAbKr31OTGDY/COyXD9aKaffAbelAvE0GWuk1GAAiWY9OcUfuTBr7wkDw
Date: Thu, 20 Oct 2022 22:50:00 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kumarpraveen@linux.microsoft.com, saurabh.truth@gmail.com
Subject: [PATCH v5] staging: most: dim2: correct misleading struct type name
Message-ID: <Y1GDQO+06fD24Pf/@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Correct the misleading struct type name dim_ch_state_t to dim_ch_state
since this not a typedef but a normal structure declaration.

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: Deepak R Varma <drv@mailo.com>
---

Changes in v5:
   This patch was part of a patch set earlier. Since the only other patch of the
   set is to be handled separately, the patch set is no more applicable. Hence
   this now becomes a standalone patch in v5. Feedback from gregkh@linuxfoundation.org

Changes in v4:
   1. Correct patch subject and log message. Use struct type name instead of
      variable name for the change description. Feedback from julia.lawall@inria.fr

Changes in v3:
   1. Patch introduced in the patch set

 drivers/staging/most/dim2/dim2.c | 4 ++--
 drivers/staging/most/dim2/hal.c  | 4 ++--
 drivers/staging/most/dim2/hal.h  | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index ab72e11ac5ab..5547b69b31a4 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -161,7 +161,7 @@ static int try_start_dim_transfer(struct hdm_channel *hdm_ch)
 	struct list_head *head = &hdm_ch->pending_list;
 	struct mbo *mbo;
 	unsigned long flags;
-	struct dim_ch_state_t st;
+	struct dim_ch_state st;

 	BUG_ON(!hdm_ch);
 	BUG_ON(!hdm_ch->is_initialized);
@@ -259,7 +259,7 @@ static void retrieve_netinfo(struct dim2_hdm *dev, struct mbo *mbo)
 static void service_done_flag(struct dim2_hdm *dev, int ch_idx)
 {
 	struct hdm_channel *hdm_ch = dev->hch + ch_idx;
-	struct dim_ch_state_t st;
+	struct dim_ch_state st;
 	struct list_head *head;
 	struct mbo *mbo;
 	int done_buffers;
diff --git a/drivers/staging/most/dim2/hal.c b/drivers/staging/most/dim2/hal.c
index 65282c276862..a5d40b5b138a 100644
--- a/drivers/staging/most/dim2/hal.c
+++ b/drivers/staging/most/dim2/hal.c
@@ -943,8 +943,8 @@ u8 dim_service_channel(struct dim_channel *ch)
 	return channel_service(ch);
 }

-struct dim_ch_state_t *dim_get_channel_state(struct dim_channel *ch,
-					     struct dim_ch_state_t *state_ptr)
+struct dim_ch_state *dim_get_channel_state(struct dim_channel *ch,
+					   struct dim_ch_state *state_ptr)
 {
 	if (!ch || !state_ptr)
 		return NULL;
diff --git a/drivers/staging/most/dim2/hal.h b/drivers/staging/most/dim2/hal.h
index 20531449acab..ef10a8741c10 100644
--- a/drivers/staging/most/dim2/hal.h
+++ b/drivers/staging/most/dim2/hal.h
@@ -27,7 +27,7 @@ enum mlb_clk_speed {
 	CLK_8192FS = 7,
 };

-struct dim_ch_state_t {
+struct dim_ch_state {
 	bool ready; /* Shows readiness to enqueue next buffer */
 	u16 done_buffers; /* Number of completed buffers */
 };
@@ -87,8 +87,8 @@ void dim_service_ahb_int_irq(struct dim_channel *const *channels);

 u8 dim_service_channel(struct dim_channel *ch);

-struct dim_ch_state_t *dim_get_channel_state(struct dim_channel *ch,
-					     struct dim_ch_state_t *state_ptr);
+struct dim_ch_state *dim_get_channel_state(struct dim_channel *ch,
+					   struct dim_ch_state *state_ptr);

 u16 dim_dbr_space(struct dim_channel *ch);

--
2.30.2



