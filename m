Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F30C247280
	for <linux-staging@lists.linux.dev>; Fri, 14 Aug 2026 00:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786667200; cv=none; b=IAa2/iqXnTUjcSjzXTZsPhtyXLVyAuCTD0SOrKHLSVdpv/c5X3LzTdZh/XGk4PEaXS+ctVZtjDxAtyqAc727GkWhyv6UpvPugabLwV6+2jjjt2r3FFQBc94+aIJFzcS/P+b7o5ypGbhU/5wIYq7PMAn+F+UETUbdaNQcR/GSkOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786667200; c=relaxed/simple;
	bh=X1a9fK/4NNC6r2ePH6a/zFJGDl2RWe9LgkLwSBMAxPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PiAPB+r9FxnUjiNmVWhf6yUqTMNZQGqIhCkHwMm6d5GSNCFMnbNVjGeBUW2s9Mzuy42PvUuhkxWyUSmZRjK858B6dFX4usIUNjZaDYmUhwp5P4vwEH2QW1W6xw2WVTPOmXWsZ+U8wjcMpJtGcujtPulDGqCHbUCotziWxlJ2jk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aaedRqN7; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aaedRqN7"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so483369a91.0
        for <linux-staging@lists.linux.dev>; Thu, 13 Aug 2026 17:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786667198; x=1787271998; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FzDJVTqBycIe9A8eQQNyKp4byXI6PWbQ3M6TQcPm+YA=;
        b=aaedRqN7o85UGDFELOCLuoD6Vb70Af45cFOL2Os/gm3ETPP2I5iM6f1qcrp0awRKuR
         FLoNFmpHxIdXk59E5x7OYJxS8zR+vlps7PDg7mRz6M1/LM2q3ZQzN9/Ln/KWZBQbX1p7
         H82dwpcT0bKXw2+ziqIvq0gYo89402z0mOaQ9BkVnpBSbLHxEU92QgWCpULHGUejbf96
         mcjvqXeuCPYuln/3MBbImXc595CkRk/PXYxJ0tUJeyqThLEJgGi9oDYr7epw7TxKU7k/
         GoYDM7TLGaaXvGrPjNUg7mVIrALdDGiAJlkgAUrEpSxAazGJLepaB8doxse1ZyXKF9Th
         MhYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786667198; x=1787271998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FzDJVTqBycIe9A8eQQNyKp4byXI6PWbQ3M6TQcPm+YA=;
        b=bXlQJGGf5Xm9m08hUugO9lz4jzEmO1DHNYeduMw5aHQxboH0GcpnHjt19UimrK83T/
         olHj9mTESUhcJg0Bpmg2noNkcMn3y4FY0MfcB/3qdqNw+aVDtnVvYtU7Yl+xw/OabVNF
         0m/VrMIZG6E4GbUtdGKpJXhvLVLll86UA5gk3Dck+WBQS1SbTQHHp7Zl16NCMW7YUnLo
         wxeUFG9lwR7yBIJ6xo0WStIVsZEojJa6sk8Exy+nZlsENH4HGpnKNUDheF4pGiu60i+H
         Nwz8kbxZiZtsgftmxcfiXwItcuzOMc5I2Sh9sNbuq8X0sOIbaVgsHWEnKskh9xudBsW8
         koBg==
X-Gm-Message-State: AOJu0Ywh866SZ+8LER6R0yHLDBF5V2Vie8oh8ojQviPYbd9Afdf9MOw5
	JAcZOJWjMYMB8HPdoZDA0qG6yFRCIxoNyGeQMcgIms1ysPwItbPzUS/F
X-Gm-Gg: AR+sD11LPKNfaApJXXRg/CSw9c6V1Fm4IkKLlCd+zY5WQYUyIOZ0fTPS130AyxUg4No
	xY/EM5XIDJ/hwauf7FL4o13DEUXg7zBlXEZ+Muilk0ZhaTn25kYExLEW5m/O8pPehKcRrw50MCv
	GaN2ezSLIzkPkWQ0fKowrHAFZ01Ixs3LdF9N7vyH15NN4H7pfUrc/i3UFwT823M6+PwsMSLA9P3
	teu4/jmZsSaLiXpeofhMVxOtKvMSvfEZJ400GQgeDgjtwjtQBsqobF7xd5r1zxftRQjoBnBj70q
	oGbR3q7/FQnxGuKNUpuQqWYpAJ7A7VUSeYBqAwvysyn76gYIiXt+mpy76dWRMbf4pQ76e2W1K37
	2BdWyZIeOcLwq8NkNSIigfTFO2a8xNusXBCYRW3gp2d9JoNSlzay9RjX1N+KeWbyzw31YBSzeCZ
	/fJ4+n6VJfGrUQs7jolGUeYBbvDgRG2iZAJRDoIi+f5OsgvTdy/MJs5eCV4HuFg31n
X-Received: by 2002:a17:90b:53d0:b0:38e:9e9d:9209 with SMTP id 98e67ed59e1d1-3933bcec7eemr852233a91.17.1786667197809;
        Thu, 13 Aug 2026 17:26:37 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14d:9ea1:8718:bb46:57cc:bba6:6246])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebf731dbasm14666255eec.17.2026.08.13.17.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 17:26:37 -0700 (PDT)
From: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
Date: Thu, 13 Aug 2026 21:25:52 -0300
Subject: [PATCH 1/2] staging: rtl8723bs: replace N_BYTE_ALIGMENT() with
 PTR_ALIGN()
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-staging-testing-v1-1-8baa7c210474@gmail.com>
References: <20260813-staging-testing-v1-0-8baa7c210474@gmail.com>
In-Reply-To: <20260813-staging-testing-v1-0-8baa7c210474@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Leonardo Martins Martins <dev.lmmrtns@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786667193; l=5627;
 i=dev.lmmrtns@gmail.com; s=20260813; h=from:subject:message-id;
 bh=X1a9fK/4NNC6r2ePH6a/zFJGDl2RWe9LgkLwSBMAxPM=;
 b=3okLFowl4EGfoXi9w80Wi2z2L2HVwhU0yUT9yaaKs23BfJ5dT2XfNY8VsAPZpQS9DhORDtaC8
 lbVUYJ5dbAuBGQ4ek3avpSbdgdAFkPdvKl2KN9Ymiiy306oovJrmsf/
X-Developer-Key: i=dev.lmmrtns@gmail.com; a=ed25519;
 pk=dOFSCpUL7hbyVftAaUGDebsgsSl9Uk/Tx0Aqpd4Bcng=

The macro N_BYTE_ALIGMENT() uses integer division and multiplication to
perform byte alignment, with a result equivalent to the standard kernel
macro ALIGN() which uses bitwise operations instead. The usages of this
macro involve casting the pointer to SIZE_PTR and casting the returned
value back, which is the same pattern that PTR_ALIGN() uses, by
replacing it with PTR_ALIGN() the manual castings to SIZE_PTR and (u8 *)
can be dropped, improving readability.

Compile tested only.

Signed-off-by: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c      |  3 ++-
 drivers/staging/rtl8723bs/core/rtw_xmit.c      | 13 +++++++------
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c |  3 ++-
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 7568fc514d7ce97274c1695d6b445b39cad84b51..dc6e7ef9857d54005f517d277d20102bd5eab5d8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -9,6 +9,7 @@
 #include <rtw_recv.h>
 #include <net/cfg80211.h>
 #include <linux/unaligned.h>
+#include <linux/align.h>
 
 static u8 SNAP_ETH_TYPE_IPX[2] = {0x81, 0x37};
 static u8 SNAP_ETH_TYPE_APPLETALK_AARP[2] = {0x80, 0xf3};
@@ -52,7 +53,7 @@ signed int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *pada
 		goto exit;
 	}
 
-	precvpriv->precv_frame_buf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(precvpriv->pallocated_frame_buf), RXFRAME_ALIGN_SZ);
+	precvpriv->precv_frame_buf = PTR_ALIGN(precvpriv->pallocated_frame_buf, RXFRAME_ALIGN_SZ);
 	/* precvpriv->precv_frame_buf = precvpriv->pallocated_frame_buf + RXFRAME_ALIGN_SZ - */
 	/* ((SIZE_PTR) (precvpriv->pallocated_frame_buf) &(RXFRAME_ALIGN_SZ-1)); */
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 81d9e713fc12bd00b05a2ad3dd312f93220489df..7ceca76553a6c2b9b930cd99c3734d3221cfcfc4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -7,6 +7,7 @@
 #include <drv_types.h>
 #include <linux/delay.h>
 #include <linux/if_ether.h>
+#include <linux/align.h>
 
 static u8 P802_1H_OUI[P80211_OUI_LEN] = { 0x00, 0x00, 0xf8 };
 static u8 RFC1042_OUI[P80211_OUI_LEN] = { 0x00, 0x00, 0x00 };
@@ -80,7 +81,7 @@ static int rtw_os_xmit_resource_alloc(struct adapter *padapter, struct xmit_buf
 		if (!pxmitbuf->pallocated_buf)
 			return -ENOMEM;
 
-		pxmitbuf->pbuf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitbuf->pallocated_buf), XMITBUF_ALIGN_SZ);
+		pxmitbuf->pbuf = PTR_ALIGN(pxmitbuf->pallocated_buf, XMITBUF_ALIGN_SZ);
 	}
 
 	return 0;
@@ -126,7 +127,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		pxmitpriv->pxmit_frame_buf = NULL;
 		return -ENOMEM;
 	}
-	pxmitpriv->pxmit_frame_buf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitpriv->pallocated_frame_buf), 4);
+	pxmitpriv->pxmit_frame_buf = PTR_ALIGN(pxmitpriv->pallocated_frame_buf, 4);
 
 	pxframe = (struct xmit_frame *)pxmitpriv->pxmit_frame_buf;
 
@@ -162,7 +163,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	if (!pxmitpriv->pallocated_xmitbuf)
 		return -ENOMEM;
 
-	pxmitpriv->pxmitbuf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitpriv->pallocated_xmitbuf), 4);
+	pxmitpriv->pxmitbuf = PTR_ALIGN(pxmitpriv->pallocated_xmitbuf, 4);
 
 	pxmitbuf = (struct xmit_buf *)pxmitpriv->pxmitbuf;
 
@@ -207,7 +208,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		pxmitpriv->xframe_ext = NULL;
 		return -ENOMEM;
 	}
-	pxmitpriv->xframe_ext = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitpriv->xframe_ext_alloc_addr), 4);
+	pxmitpriv->xframe_ext = PTR_ALIGN(pxmitpriv->xframe_ext_alloc_addr, 4);
 	pxframe = (struct xmit_frame *)pxmitpriv->xframe_ext;
 
 	for (i = 0; i < NR_XMIT_EXTBUFF; i++) {
@@ -239,7 +240,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	if (!pxmitpriv->pallocated_xmit_extbuf)
 		return -ENOMEM;
 
-	pxmitpriv->pxmit_extbuf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitpriv->pallocated_xmit_extbuf), 4);
+	pxmitpriv->pxmit_extbuf = PTR_ALIGN(pxmitpriv->pallocated_xmit_extbuf, 4);
 
 	pxmitbuf = (struct xmit_buf *)pxmitpriv->pxmit_extbuf;
 
@@ -1717,7 +1718,7 @@ struct xmit_frame *rtw_alloc_xmitframe_once(struct xmit_priv *pxmitpriv)
 	if (!alloc_addr)
 		goto exit;
 
-	pxframe = (struct xmit_frame *)N_BYTE_ALIGMENT((SIZE_PTR)(alloc_addr), 4);
+	pxframe = (struct xmit_frame *)PTR_ALIGN(alloc_addr, 4);
 	pxframe->alloc_addr = alloc_addr;
 
 	pxframe->padapter = pxmitpriv->adapter;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index e943c304950e7c50cb680b7ff4c7db1894077905..706d58741dcede8921f49ff2fcf6747062b96015 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -7,6 +7,7 @@
 
 #include <drv_types.h>
 #include <rtl8723b_hal.h>
+#include <linux/align.h>
 
 static void initrecvbuf(struct recv_buf *precvbuf, struct adapter *padapter)
 {
@@ -386,7 +387,7 @@ s32 rtl8723bs_init_recv_priv(struct adapter *padapter)
 		goto exit;
 	}
 
-	precvpriv->precv_buf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(precvpriv->pallocated_recv_buf), 4);
+	precvpriv->precv_buf = PTR_ALIGN(precvpriv->pallocated_recv_buf, 4);
 
 	/*  init each recv buffer */
 	precvbuf = (struct recv_buf *)precvpriv->precv_buf;

-- 
2.47.3

