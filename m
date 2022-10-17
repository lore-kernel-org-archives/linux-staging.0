Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BAF7F;
	Mon, 17 Oct 2022 20:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666039214; bh=HfNdSL5kR9DFWp4FTByp61UgEXtW1M0rLtjHhZnLTGs=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=H6NkVbpira67tV8hG+xaoVTrFg0O3WrzSq8XmMaYZu8RN0ygdZxQ6F8pcagAyxWGS
	 rScqw6mAn+ZeBDbbw5mPsBIqpRzeTXyn/DMBFCYdHklfLFp2rqr2I81MlVBQYuBbpA
	 BlTCoAkjp/O12tC2sMGfoRhT3cQgt3kupWF7CZfE=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
	via [213.182.55.206]
	Mon, 17 Oct 2022 22:40:14 +0200 (CEST)
X-EA-Auth: aMqA8sT9Mr0stGvf8N+2a9dPRbNi3bSVq3A5SqmXIV89OJ3fW2osNJEecR/q0ee9je0djCVTooPMsZbn4LqP4gmD2jtylMJK
Date: Tue, 18 Oct 2022 01:40:42 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: kumarpraveen@linux.microsoft.com, saurabh.truth@gmail.com
Subject: [PATCH] staging: most: dim2: read done_buffers count locally from
 HDM channel
Message-ID: <Y022wjdPGYwyx7lB@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The done_buffer count can be directly read from HDM channel instead of
calling the dim_get_channel_state function. This change also results in
obsoleting the dim_channel_state local structure variable.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---

PLEASE NOTE: I have only built the module on my machine, but have not tested it.
I am not sure how to test this change. I am willing to test it with appropriate
guidance provided I have the necessary hardware.

 drivers/staging/most/dim2/dim2.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index ab72e11ac5ab..4c1f27898a29 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -259,7 +259,6 @@ static void retrieve_netinfo(struct dim2_hdm *dev, struct mbo *mbo)
 static void service_done_flag(struct dim2_hdm *dev, int ch_idx)
 {
 	struct hdm_channel *hdm_ch = dev->hch + ch_idx;
-	struct dim_ch_state_t st;
 	struct list_head *head;
 	struct mbo *mbo;
 	int done_buffers;
@@ -271,7 +270,7 @@ static void service_done_flag(struct dim2_hdm *dev, int ch_idx)

 	spin_lock_irqsave(&dim_lock, flags);

-	done_buffers = dim_get_channel_state(&hdm_ch->ch, &st)->done_buffers;
+	done_buffers = hdm_ch->ch.done_sw_buffers_number;
 	if (!done_buffers) {
 		spin_unlock_irqrestore(&dim_lock, flags);
 		return;
--
2.30.2



