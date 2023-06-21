Received: from pb-smtp2.pobox.com (pb-smtp2.pobox.com [64.147.108.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E6819BD9
	for <linux-staging@lists.linux.dev>; Wed, 21 Jun 2023 23:09:52 +0000 (UTC)
Received: from pb-smtp2.pobox.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id CBA75198F18;
	Wed, 21 Jun 2023 19:09:44 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=pobox.com; h=date:from
	:to:cc:subject:message-id:mime-version:content-type; s=sasl; bh=
	LaMTHHZhe0ayidS7J9bZYPC/eJrFVGqD9FfQcdqxFmA=; b=IzBpQTi+9zPzSllL
	Imb2jVPcou4EJtbDBM/vQLH/qEyNv+bi5L2da9MdRwY4+2IHo0bQ3QbdWXAV+GUj
	c9nWGUHnPnooZWH7ifPyLQkaqB8MdlUkk/pCQ8E1ydDWdlAQjsaZnMLxXcaavl0X
	tuQPY+uO1AcgRU3ht9E/NIM1BRo=
Received: from pb-smtp2.nyi.icgroup.com (unknown [127.0.0.1])
	by pb-smtp2.pobox.com (Postfix) with ESMTP id BEC99198F17;
	Wed, 21 Jun 2023 19:09:44 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=darkphysics.net;
 h=date:from:to:cc:subject:message-id:mime-version:content-type;
 s=2019-09.pbsmtp; bh=LaMTHHZhe0ayidS7J9bZYPC/eJrFVGqD9FfQcdqxFmA=;
 b=Xv+ANbVbC4DEA0purULgMts3mzjPIITbPwT4JmikHk4XOkD/owuJQddKikGhtVcjVj/rqUNz+kTg4eSXSeeEqfn7nzAt+IPDx9JkXb9C/MfjG7YPJ3kWQerBewnPZAQ6XBS8NAn+tEIZx87U5kiAO4um9LSo1sYhh19nRDMI3qo=
Received: from tacos.darkphysics (unknown [76.146.178.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by pb-smtp2.pobox.com (Postfix) with ESMTPSA id 5326B198F16;
	Wed, 21 Jun 2023 19:09:43 -0400 (EDT)
	(envelope-from tdavies@darkphysics.net)
Date: Wed, 21 Jun 2023 16:09:35 -0700
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	t4rmin@zohomail.com, colin.i.king@gmail.com,
	dan.carpenter@linaro.org
Cc: tdavies@darkphysics.net, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3] staging: rtl8192e: Remove whitespace and blank lines
Message-ID: <ZJODGu4pvNNQc134@tacos.darkphysics>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Pobox-Relay-ID:
 B56299FC-1088-11EE-9C38-307A8E0A682E-45285927!pb-smtp2.pobox.com

This patch cleans up extraneous whitespace for the
struct rt_hi_throughput definition.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v3: Create patch from linux-next
v2: v2: Fix subject line and send patch inline.
 drivers/staging/rtl8192e/rtl819x_HT.h | 61 ++++++++++-----------------
 1 file changed, 23 insertions(+), 38 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index 3e601537412a..2bbd01048561 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -92,68 +92,53 @@ enum ht_aggre_mode {
 };
 
 struct rt_hi_throughput {
-	u8				enable_ht;
-	u8				bCurrentHTSupport;
-
-	u8				bRegBW40MHz;
-	u8				bCurBW40MHz;
-
-	u8				bRegShortGI40MHz;
-	u8				bCurShortGI40MHz;
-
-	u8				bRegShortGI20MHz;
-	u8				bCurShortGI20MHz;
-
-	u8				bRegSuppCCK;
-	u8				bCurSuppCCK;
-
+	u8 enable_ht;
+	u8 bCurrentHTSupport;
+	u8 bRegBW40MHz;
+	u8 bCurBW40MHz;
+	u8 bRegShortGI40MHz;
+	u8 bCurShortGI40MHz;
+	u8 bRegShortGI20MHz;
+	u8 bCurShortGI20MHz;
+	u8 bRegSuppCCK;
+	u8 bCurSuppCCK;
 	enum ht_spec_ver ePeerHTSpecVer;
-
 	struct ht_capab_ele SelfHTCap;
 	struct ht_info_ele SelfHTInfo;
-
-	u8				PeerHTCapBuf[32];
-	u8				PeerHTInfoBuf[32];
-
-	u8				bAMSDU_Support;
-	u16				nAMSDU_MaxSize;
-	u8				bCurrent_AMSDU_Support;
-	u16				nCurrent_AMSDU_MaxSize;
-
-	u8				bAMPDUEnable;
-	u8				bCurrentAMPDUEnable;
-	u8				AMPDU_Factor;
-	u8				CurrentAMPDUFactor;
-	u8				MPDU_Density;
+	u8 PeerHTCapBuf[32];
+	u8 PeerHTInfoBuf[32];
+	u8 bAMSDU_Support;
+	u16 nAMSDU_MaxSize;
+	u8 bCurrent_AMSDU_Support;
+	u16 nCurrent_AMSDU_MaxSize;
+	u8 bAMPDUEnable;
+	u8 bCurrentAMPDUEnable;
+	u8 AMPDU_Factor;
+	u8 CurrentAMPDUFactor;
+	u8 MPDU_Density;
 	u8 current_mpdu_density;
-
 	enum ht_aggre_mode ForcedAMPDUMode;
 	u8 forced_ampdu_factor;
 	u8 forced_mpdu_density;
-
 	enum ht_aggre_mode ForcedAMSDUMode;
 	u8 forced_short_gi;
-
 	u8 current_op_mode;
-
 	u8 self_mimo_ps;
 	u8 peer_mimo_ps;
-
 	enum ht_extchnl_offset CurSTAExtChnlOffset;
 	u8 cur_tx_bw40mhz;
 	u8 sw_bw_in_progress;
 	u8 reg_rt2rt_aggregation;
-	u8				RT2RT_HT_Mode;
+	u8 RT2RT_HT_Mode;
 	u8 current_rt2rt_aggregation;
 	u8 current_rt2rt_long_slot_time;
 	u8 sz_rt2rt_agg_buf[10];
-
 	u8 reg_rx_reorder_enable;
 	u8 cur_rx_reorder_enable;
 	u8 rx_reorder_win_size;
 	u8 rx_reorder_pending_time;
 	u16 rx_reorder_drop_counter;
-	u8				IOTPeer;
+	u8 IOTPeer;
 	u32 iot_action;
 	u8 iot_ra_func;
 } __packed;
-- 
2.39.2

