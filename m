Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A923E4C72;
	Tue, 18 Oct 2022 16:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666111802; bh=29EY3/OiWd3iMrUC+Z221n8xSKWT7a3/meFzR6wx6Rg=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=UPLnrygJi8azATBCFME5W5GsJbaeoA2OVblhpJfki8SQOcVKfFEWESmga62Ey2ytx
	 LuNp1ndjOjtGbIj5A41is56guQzzBqdCOWoBbMeBkrb9M9pK4cT1kpMgWjFz47kJbf
	 bD22xvPhZWZyxZQGG1TDLRFd6yBcpMi4VmN7pKMk=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
	via [213.182.55.206]
	Tue, 18 Oct 2022 18:50:02 +0200 (CEST)
X-EA-Auth: 5QBNPiTmqvSkx2+BFed9ahndmwwx34D1YnmITye6VjENxrhxM3zeqiAUbZ0O2WCA6GhZFj4dswD0e80vzqrdRU5pK1CpxAVg
Date: Tue, 18 Oct 2022 22:19:58 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] staging: most: dim2: correct misleading variable name
Message-ID: <b8550823920f40c4d02a3a691acca1af18998878.1666105876.git.drv@mailo.com>
References: <cover.1666105876.git.drv@mailo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1666105876.git.drv@mailo.com>

Correct misleading struct variable name dim_ch_state_t to dim_ch_state
since this not a typedef but a normal variable declaration.

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/staging/most/dim2/dim2.c | 2 +-
 drivers/staging/most/dim2/hal.c  | 4 ++--
 drivers/staging/most/dim2/hal.h  | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 4c1f27898a29..a69a61a69283 100644
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



