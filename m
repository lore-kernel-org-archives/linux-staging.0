Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D64E1866;
	Thu, 27 Oct 2022 08:59:40 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id r14so1448270lfm.2;
        Thu, 27 Oct 2022 01:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KG4wo9fiZVv4ZjhZHrMbGipKRmoFDP+ogMvv6qwzqFg=;
        b=P+O5B8GnyTxoSpaOPC17mwnIoShRXeOoCDsw1bT/ApIrr+KS4BfB/L0/a39HzGgVcG
         qIaBE4MeUtsxEd8kzx9ht1YsEBZfYmHvPRmKB9NYuG74rXqgXJXEvLQICu6QL9QXEqHo
         46XJkrBBqkeCKiP021H6GGtM8tJgqDqPpPhW0sC07h/CQNc6lZsc+RFAJ2DhIeD52osW
         8BTwHhRY3ADblzu3Mz8mzgdKPCljNcpM/4iDkuBXg6lgAuFiKe40CsybEWhltOiTHRd1
         irf/n0o2pAZV3BOMG+IfhtMxQMOwAlDUWnAAplvP5uwfwgtbycXGWJe+IphAueufMc7z
         lF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KG4wo9fiZVv4ZjhZHrMbGipKRmoFDP+ogMvv6qwzqFg=;
        b=POrBNPNbYxH4vz28E3ixU+OncUA/eChvFUSMAdvA7WUsrjatXbh7z1kizMmUqBYK3M
         O+ygntg5dXiu8wU/SsOYIsdkYwcjhE509oH0aFy4ur5CCYGowNQpNMNnb2M8POKBl8xM
         diKURANEmRnv+t27RipsVNMNocdMfzwYy3TsDxSvYkA94kK+1fRweET1eYhEcwXec7Z+
         lzINbyPXKObVVMe5nRUgwnOHCxYFTbm5V2vMdw321r2bAUFWfZU8H3S8QdIKOXtuwkWw
         3cMjgSvPoZ498yIpyNqyv3NrwlCXW/Fu1hEIQx+5XuYN/bj5NBKshP9gyPklxcBzKkLP
         3gIg==
X-Gm-Message-State: ACrzQf3eWHVrnhlPPjK0qORzexA2pbXI31khos/o9qdFV31ggsiPKfMi
	MfMc+FfNGSMsckSzzmvr8zo=
X-Google-Smtp-Source: AMsMyM6p21nKIC2hpXzRwSwBAzm7cAThEGXtqFAr5EtWF3nrwwDNuAW9++Sv/wrB+9wg2FFi+zi/YA==
X-Received: by 2002:a19:6456:0:b0:4a9:e691:921d with SMTP id b22-20020a196456000000b004a9e691921dmr9970485lfj.299.1666861178224;
        Thu, 27 Oct 2022 01:59:38 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id m3-20020a056512114300b004a050ddc4ecsm109892lfg.125.2022.10.27.01.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 01:59:37 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v5 3/6] staging: vt6655: refactor code in s_uFillDataHead
Date: Thu, 27 Oct 2022 08:59:05 +0000
Message-ID: <a2e720d63f4e71dc9b37cf3440831e696c7e2fd1.1666849707.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1666849707.git.tanjubrunostar0@gmail.com>
References: <cover.1666849707.git.tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <20221027085905.hFM-fMYqtyoD1BG9vcA15A7YR7BAyjTuuUEn9sph7i8@z>

refactor long lines of code in the function: s_uFillDataHead

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
 drivers/staging/vt6655/rxtx.c | 97 ++++++++++++++++++++++++-----------
 1 file changed, 67 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 8e56a7ee8035..7b6571ba7c36 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -481,19 +481,28 @@ static __le16 s_uFillDataHead(struct vnt_private *pDevice,
 			} else {
 				/* Get Duration and TimeStamp */
 				buf->duration_a =
-					cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A, cbFrameLength,
-									    byPktType, wCurrentRate, bNeedAck, uFragIdx,
-									    cbLastFragmentSize, uMACfragNum,
+					cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A,
+									    cbFrameLength,
+									    byPktType,
+									    wCurrentRate, bNeedAck,
+									    uFragIdx,
+									    cbLastFragmentSize,
+									    uMACfragNum,
 									    byFBOption));
 				buf->duration_b =
-					cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_B, cbFrameLength,
-									    PK_TYPE_11B, pDevice->byTopCCKBasicRate,
-									    bNeedAck, uFragIdx, cbLastFragmentSize,
-									    uMACfragNum, byFBOption));
+					cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_B,
+									    cbFrameLength,
+									    PK_TYPE_11B,
+									    pDevice->byTopCCKBasicRate,
+									    bNeedAck, uFragIdx,
+									    cbLastFragmentSize,
+									    uMACfragNum,
+									    byFBOption));
 			}
 
 			buf->time_stamp_off_a = vnt_time_stamp_off(pDevice, wCurrentRate);
-			buf->time_stamp_off_b = vnt_time_stamp_off(pDevice, pDevice->byTopCCKBasicRate);
+			buf->time_stamp_off_b = vnt_time_stamp_off(pDevice,
+								   pDevice->byTopCCKBasicRate);
 
 			return buf->duration_a;
 		}
@@ -506,14 +515,29 @@ static __le16 s_uFillDataHead(struct vnt_private *pDevice,
 				  pDevice->byTopCCKBasicRate,
 				  PK_TYPE_11B, &buf->b);
 		/* Get Duration and TimeStamp */
-		buf->duration_a = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A, cbFrameLength, byPktType,
-								      wCurrentRate, bNeedAck, uFragIdx, cbLastFragmentSize, uMACfragNum, byFBOption));
-		buf->duration_b = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_B, cbFrameLength, PK_TYPE_11B,
-								       pDevice->byTopCCKBasicRate, bNeedAck, uFragIdx, cbLastFragmentSize, uMACfragNum, byFBOption));
-		buf->duration_a_f0 = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A_F0, cbFrameLength, byPktType,
-									  wCurrentRate, bNeedAck, uFragIdx, cbLastFragmentSize, uMACfragNum, byFBOption));
-		buf->duration_a_f1 = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A_F1, cbFrameLength, byPktType,
-									 wCurrentRate, bNeedAck, uFragIdx, cbLastFragmentSize, uMACfragNum, byFBOption));
+		buf->duration_a = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A,
+								      cbFrameLength, byPktType,
+								      wCurrentRate, bNeedAck,
+								      uFragIdx, cbLastFragmentSize,
+								      uMACfragNum, byFBOption));
+		buf->duration_b = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_B,
+								      cbFrameLength, PK_TYPE_11B,
+								      pDevice->byTopCCKBasicRate,
+								      bNeedAck, uFragIdx,
+								      cbLastFragmentSize,
+								      uMACfragNum, byFBOption));
+		buf->duration_a_f0 = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A_F0,
+									 cbFrameLength, byPktType,
+									 wCurrentRate, bNeedAck,
+									 uFragIdx,
+									 cbLastFragmentSize,
+									 uMACfragNum, byFBOption));
+		buf->duration_a_f1 = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A_F1,
+									 cbFrameLength, byPktType,
+									 wCurrentRate, bNeedAck,
+									 uFragIdx,
+									 cbLastFragmentSize,
+									 uMACfragNum, byFBOption));
 
 		buf->time_stamp_off_a = vnt_time_stamp_off(pDevice, wCurrentRate);
 		buf->time_stamp_off_b = vnt_time_stamp_off(pDevice, pDevice->byTopCCKBasicRate);
@@ -531,12 +555,24 @@ static __le16 s_uFillDataHead(struct vnt_private *pDevice,
 					  byPktType, &buf->a);
 
 			/* Get Duration and TimeStampOff */
-			buf->duration = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A, cbFrameLength, byPktType,
-									    wCurrentRate, bNeedAck, uFragIdx, cbLastFragmentSize, uMACfragNum, byFBOption));
-			buf->duration_f0 = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A_F0, cbFrameLength, byPktType,
-									       wCurrentRate, bNeedAck, uFragIdx, cbLastFragmentSize, uMACfragNum, byFBOption));
-			buf->duration_f1 = cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A_F1, cbFrameLength, byPktType,
-										wCurrentRate, bNeedAck, uFragIdx, cbLastFragmentSize, uMACfragNum, byFBOption));
+			buf->duration =
+				cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A,
+								    cbFrameLength, byPktType,
+								    wCurrentRate, bNeedAck,
+								    uFragIdx, cbLastFragmentSize,
+								    uMACfragNum, byFBOption));
+			buf->duration_f0 =
+				cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A_F0,
+								    cbFrameLength, byPktType,
+								    wCurrentRate, bNeedAck,
+								    uFragIdx, cbLastFragmentSize,
+								    uMACfragNum, byFBOption));
+			buf->duration_f1 =
+				cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A_F1,
+								    cbFrameLength, byPktType,
+								    wCurrentRate, bNeedAck,
+								    uFragIdx, cbLastFragmentSize,
+								    uMACfragNum, byFBOption));
 			buf->time_stamp_off = vnt_time_stamp_off(pDevice, wCurrentRate);
 			return buf->duration;
 		}
@@ -552,10 +588,11 @@ static __le16 s_uFillDataHead(struct vnt_private *pDevice,
 		} else {
 			/* Get Duration and TimeStampOff */
 			buf->duration =
-				cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A, cbFrameLength, byPktType,
-								    wCurrentRate, bNeedAck, uFragIdx,
-								    cbLastFragmentSize, uMACfragNum,
-								    byFBOption));
+				cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_A,
+								    cbFrameLength, byPktType,
+								    wCurrentRate, bNeedAck,
+								    uFragIdx, cbLastFragmentSize,
+								    uMACfragNum, byFBOption));
 		}
 
 		buf->time_stamp_off = vnt_time_stamp_off(pDevice, wCurrentRate);
@@ -573,10 +610,10 @@ static __le16 s_uFillDataHead(struct vnt_private *pDevice,
 	} else {
 		/* Get Duration and TimeStampOff */
 		buf->duration =
-			cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_B, cbFrameLength, byPktType,
-							    wCurrentRate, bNeedAck, uFragIdx,
-							    cbLastFragmentSize, uMACfragNum,
-							    byFBOption));
+			cpu_to_le16((u16)s_uGetDataDuration(pDevice, DATADUR_B, cbFrameLength,
+							    byPktType, wCurrentRate, bNeedAck,
+							    uFragIdx, cbLastFragmentSize,
+							    uMACfragNum, byFBOption));
 	}
 
 	buf->time_stamp_off = vnt_time_stamp_off(pDevice, wCurrentRate);
-- 
2.34.1

