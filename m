Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79F24C72;
	Tue, 18 Oct 2022 16:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666111765; bh=95DJzNS4+6BSZN3k/buGJ1S6mzvcYAfN1v5sPyYssJA=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=UEFpHrb3UaPdjOef6bdxjh6GwfQyQjSXod5Q2YDHUUSGXK2o2bqaD7czq9+yTwqjA
	 xwOQsktIpWtL4lOhFyTxd8mHZMVQZrJsa0HpjKaTxA6LhTt9IxniR4z6GYxMYioVdN
	 gwchKIwMeZalhgogxz1TE9KsZ0WH6p5yQoWEgCVY=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
	via [213.182.55.206]
	Tue, 18 Oct 2022 18:49:25 +0200 (CEST)
X-EA-Auth: AAY4Oxui4nDXgDCRsm/XGiBKJS7WRerNUVMI9i/EcClgwoeDP7Yk6QLaTD4baMGpA46r8R6g3gC6m1YaWP/GSvI5gi2oEDRl
Date: Tue, 18 Oct 2022 22:19:21 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] staging: most: dim2: read done_buffers count locally
 from HDM channel
Message-ID: <83fd237d2ac157d234e9c7cce1206904c2d8773d.1666105876.git.drv@mailo.com>
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

The function dim_get_channel_state only serves to initialize the ready and
done_buffers fields of the structure passed as its second argument. In
service_done_flag, this structure is never used again and the only purpose
of the call is to get the value that is put in the done_buffers field.
But that value is just the done_sw_buffers_number field of the call's
first argument.  So the whole call is useless, and we can just replace it
with an access to this field.

This change implies that the variable st is no longer used, so drop it as
well.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---

PLEASE NOTE:
   1. I have only built the module on my machine, but have not tested it.
      I am not sure how to test this change. I am willing to test it with
      appropriate guidance provided I have the necessary hardware.
   2. This was a standalone patch earlier. It is now combined into a patch set
      with another patch for the same driver. Hence I am carry forwarding the
      change log for this patch here:

Changes in v3:
   1. The patch log message is further improved. This revised verbiage is as
      thankfully provided by julia.lawall@inria.fr

Changes in v2:
   1. Update patch log message to be more descriptive about the reason for change.
      Feedback provided by julia.lawall@inria.fr



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



