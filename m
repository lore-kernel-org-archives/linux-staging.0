Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EF86D0E
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 00:15:27 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id c138so27446440qkg.5
        for <linux-staging@lists.linux.dev>; Mon, 14 Jun 2021 17:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VMyPin8+QjMCQeCSylU1uE3kHGaRBZFo0ExrCER82pk=;
        b=t4zzHkrB7GmrCzt3Pdvc5WUQJkCSBIk4ZIYIS3HCJUkaV/EqQNCod5k43JJYG/V9cb
         VCbBT/8a/sELVhI4CrNclj/CC6cSwp6atcERRdgruR55E/+n3EQErlwXoAnAwW/Fhg8g
         3zlN9xo0FGWBgYYSnAvwBBSwpKTXr4TCKOqi8KgAssRdIHCKkrmAlerNKKa/94SLEkZ3
         2bD3ONMaQySFX0F5N/TfnoiBQaAsokBU5kPv2mM1XwvazTZjuvXe3ZonDDrD9/b1Ste1
         HZypOQTDjjdst17G3JJO0hmX69EWEb8dwNi5YOOt85zJHGZX0tc/wHkTMIiiAQG4L2Xg
         x4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VMyPin8+QjMCQeCSylU1uE3kHGaRBZFo0ExrCER82pk=;
        b=ZTusL8RbukD4wrYb63iNhQZ61cg9Y3qVyZ7df9JwFfluvlblsbTq8z/i5w7Tft5jyw
         EvVFh7N07Iu6XzaPVhjI/Rxroo6p1wgxcS1R3y3RsXabnulIAoFC7YD76TAA+yjxb/Vt
         sLDXGruPcVVNrXRKYatsfz1kCtDj1dMJS6bbWL/p+kKjMsevuwll2zQZ9T2zxree4cXb
         0sbHm1wwt/cvY2i5+4/zlSWJAl0G7fgDBRhDk0iCvMz3+BwGjKmwx3c1oVnoWC7pqfjw
         0mzaVOsZ/wgxde7srrkfV6KbFE7udgmmJBsKHHTtDhv3p7LnlPLJGfiUdY0/6y/cS6ec
         oirg==
X-Gm-Message-State: AOAM532TJQmLqwnTYmjREI5XIVt2cHkxnxxn5GLz0FcV8qrIBVkYngHr
	doITLtyO94ngHwUoRfyWC9u89g==
X-Google-Smtp-Source: ABdhPJx0Onn1lOZA+foFySz0PC/SF4aaRaMDRZXVumGelt1DFMco01qxgln8fAp9MPUPvSh/WBBXJA==
X-Received: by 2002:a37:d06:: with SMTP id 6mr19296024qkn.7.1623716126475;
        Mon, 14 Jun 2021 17:15:26 -0700 (PDT)
Received: from localhost.localdomain (5.d.e.a.c.b.a.1.5.0.9.4.d.7.7.d.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:d77d:4905:1abc:aed5])
        by smtp.gmail.com with ESMTPSA id m199sm11244248qke.71.2021.06.14.17.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 17:15:26 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 01/28] staging: rtl8188eu: remove all DBG_88E calls from core/rtw_efuse.c
Date: Tue, 15 Jun 2021 01:14:40 +0100
Message-Id: <20210615001507.1171-2-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615001507.1171-1-phil@philpotter.co.uk>
References: <20210615001507.1171-1-phil@philpotter.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all DBG_88E calls from core/rtw_efuse.c as this macro is
unnecessary, and many of these calls are dubious in terms of necessity.
Removing all calls will ultimately allow the removal of the macro
itself.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/core/rtw_efuse.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_efuse.c b/drivers/staging/rtl8188eu/core/rtw_efuse.c
index 9bb3ec0cd62f..0d51bf9c9bb0 100644
--- a/drivers/staging/rtl8188eu/core/rtw_efuse.c
+++ b/drivers/staging/rtl8188eu/core/rtw_efuse.c
@@ -91,10 +91,8 @@ efuse_phymap_to_logical(u8 *phymap, u16 _offset, u16 _size_byte, u8  *pbuf)
 	tmp = kcalloc(EFUSE_MAX_SECTION_88E,
 		      sizeof(void *) + EFUSE_MAX_WORD_UNIT * sizeof(u16),
 		      GFP_KERNEL);
-	if (!tmp) {
-		DBG_88E("%s: alloc eFuseWord fail!\n", __func__);
+	if (!tmp)
 		goto eFuseWord_failed;
-	}
 	for (i = 0; i < EFUSE_MAX_SECTION_88E; i++)
 		tmp[i] = ((char *)(tmp + EFUSE_MAX_SECTION_88E)) + i * EFUSE_MAX_WORD_UNIT * sizeof(u16);
 	eFuseWord = (u16 **)tmp;
@@ -113,7 +111,6 @@ efuse_phymap_to_logical(u8 *phymap, u16 _offset, u16 _size_byte, u8  *pbuf)
 		efuse_utilized++;
 		eFuse_Addr++;
 	} else {
-		DBG_88E("EFUSE is empty efuse_Addr-%d efuse_data =%x\n", eFuse_Addr, rtemp8);
 		goto exit;
 	}
 
@@ -220,8 +217,6 @@ static void efuse_read_phymap_from_txpktbuf(
 	if (bcnhead < 0) /* if not valid */
 		bcnhead = usb_read8(adapter, REG_TDECTRL + 1);
 
-	DBG_88E("%s bcnhead:%d\n", __func__, bcnhead);
-
 	usb_write8(adapter, REG_PKT_BUFF_ACCESS_CTRL, TXPKT_BUF_SELECT);
 
 	dbg_addr = bcnhead * 128 / 8; /* 8-bytes addressing */
@@ -232,10 +227,8 @@ static void efuse_read_phymap_from_txpktbuf(
 		usb_write8(adapter, REG_TXPKTBUF_DBG, 0);
 		start = jiffies;
 		while (!(reg_0x143 = usb_read8(adapter, REG_TXPKTBUF_DBG)) &&
-		       jiffies_to_msecs(jiffies - start) < 1000) {
-			DBG_88E("%s polling reg_0x143:0x%02x, reg_0x106:0x%02x\n", __func__, reg_0x143, usb_read8(adapter, 0x106));
+		       jiffies_to_msecs(jiffies - start) < 1000)
 			usleep_range(1000, 2000);
-		}
 
 		lo32 = usb_read32(adapter, REG_PKTBUF_DBG_DATA_L);
 		hi32 = usb_read32(adapter, REG_PKTBUF_DBG_DATA_H);
@@ -255,8 +248,6 @@ static void efuse_read_phymap_from_txpktbuf(
 
 			limit = min_t(u16, len - 2, limit);
 
-			DBG_88E("%s len:%u, lenbak:%u, aaa:%u, aaabak:%u\n", __func__, len, lenbak, aaa, aaabak);
-
 			memcpy(pos, ((u8 *)&lo32) + 2, (limit >= count + 2) ? 2 : limit - count);
 			count += (limit >= count + 2) ? 2 : limit - count;
 			pos = content + count;
@@ -278,7 +269,6 @@ static void efuse_read_phymap_from_txpktbuf(
 		i++;
 	}
 	usb_write8(adapter, REG_PKT_BUFF_ACCESS_CTRL, DISABLE_TRXPKT_BUF_ACCESS);
-	DBG_88E("%s read count:%u\n", __func__, count);
 	*size = count;
 }
 
@@ -432,7 +422,6 @@ int Efuse_PgPacketRead(struct adapter *pAdapter, u8 offset, u8 *data)
 						hoffset = ((tmp_header & 0xE0) >> 5) | ((efuse_data & 0xF0) >> 1);
 						hworden = efuse_data & 0x0F;
 					} else {
-						DBG_88E("Error, All words disabled\n");
 						efuse_addr++;
 						continue;
 					}
-- 
2.30.2

