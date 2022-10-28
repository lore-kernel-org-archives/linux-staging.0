Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43593209;
	Fri, 28 Oct 2022 17:41:16 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id o4so9248282ljp.8;
        Fri, 28 Oct 2022 10:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Mcq4XElldK8n+d5RjVbZo8PZpT7nLSBwi7AAq7x+9Q=;
        b=D3e25OU+HyDWqNN1fgasgYV3Vkbk7jwBXYjresdC3vESiCdk9dMq8VY0KfePh1bhaa
         alOiUdmtuuL/qxkDetqvvMwuGcADZTpHHC4e8lqiFU+2j/pg31QeEJZdTNMOx2JN1TS5
         vZDv/T5/kx1RSGf2t5OQEM5r/LG6dM6M+1QVsPrjc3yW1EXTYaKihrLzwlX5wLys32RH
         d7fVGPOQDfrBhz+0Vywxh0N5UIaypCfZ2crHMY3IrBouabL+jjg+QiOhZ/rcNGz556rH
         tSxOFehPCsbRKxBX7uafACB60BAcoD/eV0FwJNgVZlP78J9gnNDwP5IeCuIHiUc+tbse
         YXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Mcq4XElldK8n+d5RjVbZo8PZpT7nLSBwi7AAq7x+9Q=;
        b=jx9YwnAji+kMzcmr0uRM/D4rizZKTSioVCPHEgBAJkJboy/wicr2vVQqtWqalJ2qot
         6SftAA9zz1BcqONS1wCrdbn5f80Cc/g2JbQWk0dqyOLeIqMJAVRMvcF8MhwXyCTM5Jxg
         y3NyqtTIX4iTgcR486EIy9GAD4M4dKk+j3wNuiV6RCM6KZ9yP2ZN+qZdOLT5/juogmnJ
         WzLHoZTRCTAeNys0B+5mj1jK6m+kbpY8lctzSbKwWpRv4EEdi07m/9ngS2WBE82okfIi
         3pkL2xwnRY3Uh+/Rb7t+UZIlIOhRKnQ6dJ8Tb+IYCXZr1cYndvumN27fs08HnDKrUhgc
         o2/A==
X-Gm-Message-State: ACrzQf2CdQHzUkW82MSQTwLap9VFBGVY5DHTwLt94n0Cw0KyoEzlIwEP
	uma7IAQGrnaewL60l60BDgA/WPAbiBfdXA==
X-Google-Smtp-Source: AMsMyM4JZ6JEnInv/iWxYNaboR0DAxnAIjGH6SPMnVMPNFq7ghm31fy/lYM4VKJAkuNntsVB6dCnGw==
X-Received: by 2002:a2e:92c4:0:b0:25d:9d30:5d61 with SMTP id k4-20020a2e92c4000000b0025d9d305d61mr291921ljh.202.1666978874931;
        Fri, 28 Oct 2022 10:41:14 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id s2-20020a2eb622000000b0026dfdcbccdasm725322ljn.14.2022.10.28.10.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 10:41:14 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v8 3/6] staging: vt6655: refactor long lines of code in s_uFillDataHead
Date: Fri, 28 Oct 2022 17:40:55 +0000
Message-Id: <a2e720d63f4e71dc9b37cf3440831e696c7e2fd1.1666978292.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1666978292.git.tanjubrunostar0@gmail.com>
References: <cover.1666978292.git.tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix checkpatch errors by refactoring long lines of code in the function: s_uFillDataHead

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

