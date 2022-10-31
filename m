Received: from mail.draketalley.com (mail.draketalley.com [3.213.214.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC09A7E
	for <linux-staging@lists.linux.dev>; Mon, 31 Oct 2022 14:32:55 +0000 (UTC)
Received: from pop-os.lan (cpe-74-72-139-32.nyc.res.rr.com [74.72.139.32])
	by mail.draketalley.com (Postfix) with ESMTPSA id 0A33055DD3;
	Mon, 31 Oct 2022 14:25:31 +0000 (UTC)
From: drake@draketalley.com
To: Manish Chopra <manishc@marvell.com>,
	GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	netdev@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Drake Talley <drake@draketalley.com>
Subject: [PATCH 2/3] staging: qlge: replace msleep with usleep_range
Date: Mon, 31 Oct 2022 10:25:15 -0400
Message-Id: <20221031142516.266704-3-drake@draketalley.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031142516.266704-1-drake@draketalley.com>
References: <20221031142516.266704-1-drake@draketalley.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Drake Talley <drake@draketalley.com>

Since msleep may delay for up to 20ms, usleep_range is recommended for
short durations in the docs linked in the below warning.  I set the
range to 1000-2000 based on looking at other usages of usleep_range.

Reported by checkpatch:

WARNING: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst

Signed-off-by: Drake Talley <drake@draketalley.com>
---
 drivers/staging/qlge/qlge_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
index 8c1fdd8ebba0..c8403dbb5bad 100644
--- a/drivers/staging/qlge/qlge_main.c
+++ b/drivers/staging/qlge/qlge_main.c
@@ -3890,7 +3890,7 @@ static int qlge_close(struct net_device *ndev)
 	 * (Rarely happens, but possible.)
 	 */
 	while (!test_bit(QL_ADAPTER_UP, &qdev->flags))
-		msleep(1);
+		usleep_range(1000, 2000);
 
 	/* Make sure refill_work doesn't re-enable napi */
 	for (i = 0; i < qdev->rss_ring_count; i++)
-- 
2.34.1

