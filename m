Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104437C;
	Tue,  1 Nov 2022 12:38:32 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id d6so23340635lfs.10;
        Tue, 01 Nov 2022 05:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iH9vhU7zv5GDc91Wl04v1T86uct201Qybf+k0VYUxHY=;
        b=EjZ6e9OVZvrI71SL4MWaxmryGcntIUx9723MW27hUMhjG+dn5Lv5KBAVfTUaImKFe9
         veyEUi93Njbdqj6+lzd/Qr3ll83KrIFT3twvl8CWAhm4i4gdTuLQ+OIbxjyhSOOK2Yfb
         wSTN63ulqw2GzsPl0DYqh6ZPbFT3/6o/7XiJItmVatnpNHMy6VUV+71i0BSfknMZLCwk
         OeDF4zRda9EjgdkpS3/GYkBRpvJVbjc1CUxgoPDTqJgeYfNlvDoNW7FV2N2PZHheNSwj
         xZG9Bq6iWk0XM3L9IL4OS/7qfwn5gdstZGBcDa32zf8iTQXvUbitfNI53G7M1Nbs9YBs
         9T6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iH9vhU7zv5GDc91Wl04v1T86uct201Qybf+k0VYUxHY=;
        b=tNwvvBDXlbjkFfBGLR96oWuwOARTY5ZH+L6CZrPcAI5LaOohYaXTJ+iTdFHDpN/1E9
         xjLL8+ozP0Kg4ovQ9bMqmsfbBqNZvTXgOw/k3MAkzTLkylZ7qlN6CmgutpRCV7KNuAB4
         AuTYXJZ3QOrWOmdd1hcUELb9qzEa0kU/DFnOdBAWykjEA39Vft/CKdx26tOhquP78hzK
         jlgVmO2NgwR/CHDydRqvuHjkmq3pCgF7eqNofJ/+8GQE2eMuINmqCHtDs7qqf+6YHXlG
         PfMn4fqN7amU/9CCm/gp/IP1kQUcidNfzpf0r85ry0Nr+bd0b/bRe7b1GoJy5I/ymzbu
         p7xg==
X-Gm-Message-State: ACrzQf2QYF9kqcaeBhHUH0SXAx8/wmcZ9g7cbe2At+uaAOZ2WXeUl73E
	JxauN80zHDlvy7qb0hMJxq18ker84I+Nog==
X-Google-Smtp-Source: AMsMyM6xU01iBBnD4wgyTps3ciOLOEnhuAAcCU9m9LJnE4Qb5Lh0e1ZnMCt3TI18lfpEhD/vrHFUFg==
X-Received: by 2002:a05:6512:16a9:b0:4a0:349d:d30c with SMTP id bu41-20020a05651216a900b004a0349dd30cmr6843068lfb.149.1667306310957;
        Tue, 01 Nov 2022 05:38:30 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id p21-20020a2eb7d5000000b0026e897e3236sm1771625ljo.6.2022.11.01.05.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 05:38:30 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v2 1/2] change the function name s_vFillRTSHead
Date: Tue,  1 Nov 2022 12:37:59 +0000
Message-Id: <ea25c687d28f5cf40c315b8191d98fa0608f8a76.1667305446.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667305446.git.tanjubrunostar0@gmail.com>
References: <cover.1667305446.git.tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the use of Hungarian notation, which is not used in the Linux
kernel. Reported by checkpatch

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
 drivers/staging/vt6655/rxtx.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 31ae99b3cb35..d7e439cd8675 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -23,7 +23,7 @@
  *      s_uGetTxRsvTime- get frame reserved time
  *      s_vFillCTSHead- fulfill CTS ctl header
  *      s_vFillFragParameter- Set fragment ctl parameter.
- *      s_vFillRTSHead- fulfill RTS ctl header
+ *      fill_rts_head- fulfill RTS ctl header
  *      s_vFillTxKey- fulfill tx encrypt key
  *      s_vSWencryption- Software encrypt header
  *      vDMA0_tx_80211- tx 802.11 frame via dma0
@@ -85,15 +85,15 @@ static const unsigned short fb_opt1[2][5] = {
 #define DATADUR_A_F1    13
 
 /*---------------------  Static Functions  --------------------------*/
-static void s_vFillRTSHead(struct vnt_private *pDevice,
-			   unsigned char byPktType,
-			   void *pvRTS,
-			   unsigned int	cbFrameLength,
-			   bool bNeedAck,
-			   bool bDisCRC,
-			   struct ieee80211_hdr *hdr,
-			   unsigned short wCurrentRate,
-			   unsigned char byFBOption);
+static void fill_rts_head(struct vnt_private *pDevice,
+			  unsigned char byPktType,
+			  void *pvRTS,
+			  unsigned int	cbFrameLength,
+			  bool bNeedAck,
+			  bool bDisCRC,
+			  struct ieee80211_hdr *hdr,
+			  unsigned short wCurrentRate,
+			  unsigned char byFBOption);
 
 static void s_vGenerateTxParameter(struct vnt_private *pDevice,
 				   unsigned char byPktType,
@@ -912,7 +912,7 @@ s_vGenerateTxParameter(
 			buf->rrv_time_a = vnt_rxtx_rsvtime_le16(pDevice, byPktType, cbFrameSize, wCurrentRate, bNeedACK);
 			buf->rrv_time_b = vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11B, cbFrameSize, pDevice->byTopCCKBasicRate, bNeedACK);
 
-			s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
+			fill_rts_head(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
 		} else {/* RTS_needless, PCF mode */
 			struct vnt_rrv_time_cts *buf = pvRrvTime;
 
@@ -931,7 +931,7 @@ s_vGenerateTxParameter(
 			buf->rrv_time = vnt_rxtx_rsvtime_le16(pDevice, byPktType, cbFrameSize, wCurrentRate, bNeedACK);
 
 			/* Fill RTS */
-			s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
+			fill_rts_head(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
 		} else if (!pvRTS) {/* RTS_needless, non PCF mode */
 			struct vnt_rrv_time_ab *buf = pvRrvTime;
 
@@ -945,7 +945,7 @@ s_vGenerateTxParameter(
 			buf->rrv_time = vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11B, cbFrameSize, wCurrentRate, bNeedACK);
 
 			/* Fill RTS */
-			s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
+			fill_rts_head(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
 		} else { /* RTS_needless, non PCF mode */
 			struct vnt_rrv_time_ab *buf = pvRrvTime;
 
-- 
2.34.1

