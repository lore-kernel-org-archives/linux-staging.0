Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46BA70
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 09:10:05 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id j7so4917748wrd.1
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 02:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CpJVIH89KnTHlqwjWvcVRjRrnGlAUbLyDfZyG3OaRoA=;
        b=oklwFFm4lgGgWqEn0vkWl3/DvHJo3njYX84Ip1pOF7qz6tEK1Vs/n4jBXBaoG1o/oG
         Vhbv7GQ/oTlRcKvuvUs1sjBs+133BnsCcKfYVYX0i8Sk/3/lU5RX+adVuDrTAVscO+WG
         NRgWm92TUUtAfGX41QQkrpdMcjT0ixSP/5XrGTG7fWuPLP+GHKtEbMsBeXrdfJywdv4C
         IQTQU6j+iZ4mTfdZY/bqRedV6FpmZsGVMN+jfMb6uS3G4EsAzEgebDy1D6xYhFolPc62
         LXlWikYbcB7acs4sd4fvoPA6TUv+UeexyKjQYR7tRQ3rJcdftRJuSPcLUujAS4oeRG3d
         fgAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CpJVIH89KnTHlqwjWvcVRjRrnGlAUbLyDfZyG3OaRoA=;
        b=YuAgPpsGfTnHXKeSBY3HP+OvsWpZtBZvMw4MY+1EvM8qY+WNakntbcuBEbUTA53IgW
         5u/REqun4i5zKJlsIobivGCo5HjLFjwT38bFB9vkLa/h5zG/LwkklTXPAxLUhM5GgMXb
         atuHj7wWIga1lgPUd1JsGwHQv23E3+h0IClWAUuAY45DxCONuiKi7Vb8kOrSL9dka/s/
         Ra0HdbdOFpGewfiUyQSEJ4ZD0UfUeiv5SBzwOonyII3vC1cvXyNBlxkS2KiRQjm6pmBI
         +sROGkRL/zrIQWm72X1RnEffkYg7Ot2dP+cIdoYDY2yGezWUgzfGR2DYxLUCq6LsL5eL
         FV9w==
X-Gm-Message-State: AOAM533zQAyK5GVHu7m6mQBjsgU6QuZAkI/ww51MMzvPFELF0nLlKFZC
	FOkrxIciYJ5jbZzDynAQCSE=
X-Google-Smtp-Source: ABdhPJy6SZC3IZgKY4wxYbqpk5YltwyD84Ip/a+2Ohs+J1WFJ5/W8Fixh06wqxvAOc2FEMSdxX+LKw==
X-Received: by 2002:a5d:4fcb:: with SMTP id h11mr12273689wrw.53.1616749804416;
        Fri, 26 Mar 2021 02:10:04 -0700 (PDT)
Received: from agape ([5.171.81.75])
        by smtp.gmail.com with ESMTPSA id j14sm11051641wrw.69.2021.03.26.02.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 02:10:04 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 15/15] staging: rtl8723bs:  put parentheses on macros with complex values in include/wifi.h
Date: Fri, 26 Mar 2021 10:09:22 +0100
Message-Id: <369571b50a5e51e4727fe7541b968cad891943b5.1616748885.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616748885.git.fabioaiuto83@gmail.com>
References: <cover.1616748885.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix the following checkpatch warnings:

ERROR: Macros with complex values should be enclosed in parentheses
114: FILE: drivers/staging/rtl8723bs/include/wifi.h:114:
+#define SetToDs(pbuf)	\
--
ERROR: Macros with complex values should be enclosed in parentheses
119: FILE: drivers/staging/rtl8723bs/include/wifi.h:119:
+#define ClearToDs(pbuf)	\
--
ERROR: Macros with complex values should be enclosed in parentheses
122: FILE: drivers/staging/rtl8723bs/include/wifi.h:122:
+#define SetFrDs(pbuf)	\
--
ERROR: Macros with complex values should be enclosed in parentheses
127: FILE: drivers/staging/rtl8723bs/include/wifi.h:127:
+#define ClearFrDs(pbuf)	\
--
ERROR: Macros with complex values should be enclosed in parentheses
132: FILE: drivers/staging/rtl8723bs/include/wifi.h:132:
+#define SetMFrag(pbuf)	\
--
ERROR: Macros with complex values should be enclosed in parentheses
137: FILE: drivers/staging/rtl8723bs/include/wifi.h:137:
+#define ClearMFrag(pbuf)	\
--
ERROR: Macros with complex values should be enclosed in parentheses
140: FILE: drivers/staging/rtl8723bs/include/wifi.h:140:
+#define SetRetry(pbuf)	\
--
ERROR: Macros with complex values should be enclosed in parentheses
145: FILE: drivers/staging/rtl8723bs/include/wifi.h:145:
+#define ClearRetry(pbuf)	\
--
ERROR: Macros with complex values should be enclosed in parentheses
148: FILE: drivers/staging/rtl8723bs/include/wifi.h:148:
+#define SetPwrMgt(pbuf)	\
--
ERROR: Macros with complex values should be enclosed in parentheses
153: FILE: drivers/staging/rtl8723bs/include/wifi.h:153:
+#define ClearPwrMgt(pbuf)	\
--
ERROR: Macros with complex values should be enclosed in parentheses
156: FILE: drivers/staging/rtl8723bs/include/wifi.h:156:
+#define SetMData(pbuf)	\
--
ERROR: Macros with complex values should be enclosed in parentheses
161: FILE: drivers/staging/rtl8723bs/include/wifi.h:161:
+#define ClearMData(pbuf)	\
--
ERROR: Macros with complex values should be enclosed in parentheses
164: FILE: drivers/staging/rtl8723bs/include/wifi.h:164:
+#define SetPrivacy(pbuf)	\
--
ERROR: Macros with complex values should be enclosed in parentheses
170: FILE: drivers/staging/rtl8723bs/include/wifi.h:170:
+#define ClearPrivacy(pbuf)	\
--
ERROR: Macros with complex values should be enclosed in parentheses
220: FILE: drivers/staging/rtl8723bs/include/wifi.h:220:
+#define SetDuration(pbuf, dur) \
--
ERROR: Macros with complex values should be enclosed in parentheses
224: FILE: drivers/staging/rtl8723bs/include/wifi.h:224:
+#define SetPriority(pbuf, tid)	\
--
ERROR: Macros with complex values should be enclosed in parentheses
229: FILE: drivers/staging/rtl8723bs/include/wifi.h:229:
+#define SetEOSP(pbuf, eosp)	\
--
ERROR: Macros with complex values should be enclosed in parentheses
232: FILE: drivers/staging/rtl8723bs/include/wifi.h:232:
+#define SetAckpolicy(pbuf, ack)	\
--
ERROR: Macros with complex values should be enclosed in parentheses
239: FILE: drivers/staging/rtl8723bs/include/wifi.h:239:
+#define SetAMsdu(pbuf, amsdu)	\

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/wifi.h | 38 ++++++++++++------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index efef549bf811..a9f24fc2bf2f 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -112,63 +112,63 @@ enum wifi_reg_domain {
 #define _ORDER_			BIT(15)
 
 #define SetToDs(pbuf)	\
-	*(__le16 *)(pbuf) |= cpu_to_le16(_TO_DS_)
+	(*(__le16 *)(pbuf) |= cpu_to_le16(_TO_DS_))
 
 #define GetToDs(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_TO_DS_)) != 0)
 
 #define ClearToDs(pbuf)	\
-	*(__le16 *)(pbuf) &= (~cpu_to_le16(_TO_DS_))
+	(*(__le16 *)(pbuf) &= (~cpu_to_le16(_TO_DS_)))
 
 #define SetFrDs(pbuf)	\
-	*(__le16 *)(pbuf) |= cpu_to_le16(_FROM_DS_)
+	(*(__le16 *)(pbuf) |= cpu_to_le16(_FROM_DS_))
 
 #define GetFrDs(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_FROM_DS_)) != 0)
 
 #define ClearFrDs(pbuf)	\
-	*(__le16 *)(pbuf) &= (~cpu_to_le16(_FROM_DS_))
+	(*(__le16 *)(pbuf) &= (~cpu_to_le16(_FROM_DS_)))
 
 #define get_tofr_ds(pframe)	((GetToDs(pframe) << 1) | GetFrDs(pframe))
 
 #define SetMFrag(pbuf)	\
-	*(__le16 *)(pbuf) |= cpu_to_le16(_MORE_FRAG_)
+	(*(__le16 *)(pbuf) |= cpu_to_le16(_MORE_FRAG_))
 
 #define GetMFrag(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_MORE_FRAG_)) != 0)
 
 #define ClearMFrag(pbuf)	\
-	*(__le16 *)(pbuf) &= (~cpu_to_le16(_MORE_FRAG_))
+	(*(__le16 *)(pbuf) &= (~cpu_to_le16(_MORE_FRAG_)))
 
 #define SetRetry(pbuf)	\
-	*(__le16 *)(pbuf) |= cpu_to_le16(_RETRY_)
+	(*(__le16 *)(pbuf) |= cpu_to_le16(_RETRY_))
 
 #define GetRetry(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_RETRY_)) != 0)
 
 #define ClearRetry(pbuf)	\
-	*(__le16 *)(pbuf) &= (~cpu_to_le16(_RETRY_))
+	(*(__le16 *)(pbuf) &= (~cpu_to_le16(_RETRY_)))
 
 #define SetPwrMgt(pbuf)	\
-	*(__le16 *)(pbuf) |= cpu_to_le16(_PWRMGT_)
+	(*(__le16 *)(pbuf) |= cpu_to_le16(_PWRMGT_))
 
 #define GetPwrMgt(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_PWRMGT_)) != 0)
 
 #define ClearPwrMgt(pbuf)	\
-	*(__le16 *)(pbuf) &= (~cpu_to_le16(_PWRMGT_))
+	(*(__le16 *)(pbuf) &= (~cpu_to_le16(_PWRMGT_)))
 
 #define SetMData(pbuf)	\
-	*(__le16 *)(pbuf) |= cpu_to_le16(_MORE_DATA_)
+	(*(__le16 *)(pbuf) |= cpu_to_le16(_MORE_DATA_))
 
 #define GetMData(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_MORE_DATA_)) != 0)
 
 #define ClearMData(pbuf)	\
-	*(__le16 *)(pbuf) &= (~cpu_to_le16(_MORE_DATA_))
+	(*(__le16 *)(pbuf) &= (~cpu_to_le16(_MORE_DATA_)))
 
 #define SetPrivacy(pbuf)	\
-	*(__le16 *)(pbuf) |= cpu_to_le16(_PRIVACY_)
+	(*(__le16 *)(pbuf) |= cpu_to_le16(_PRIVACY_))
 
 #define GetPrivacy(pbuf)					\
 	(((*(__le16 *)(pbuf)) & cpu_to_le16(_PRIVACY_)) != 0)
 
 #define ClearPrivacy(pbuf)	\
-	*(__le16 *)(pbuf) &= (~cpu_to_le16(_PRIVACY_))
+	(*(__le16 *)(pbuf) &= (~cpu_to_le16(_PRIVACY_)))
 
 
 #define GetOrder(pbuf)					\
@@ -218,26 +218,26 @@ enum wifi_reg_domain {
 	} while (0)
 
 #define SetDuration(pbuf, dur) \
-	*(__le16 *)((size_t)(pbuf) + 2) = cpu_to_le16(0xffff & (dur))
+	(*(__le16 *)((size_t)(pbuf) + 2) = cpu_to_le16(0xffff & (dur)))
 
 
 #define SetPriority(pbuf, tid)	\
-	*(__le16 *)(pbuf) |= cpu_to_le16(tid & 0xf)
+	(*(__le16 *)(pbuf) |= cpu_to_le16(tid & 0xf))
 
 #define GetPriority(pbuf)	((le16_to_cpu(*(__le16 *)(pbuf))) & 0xf)
 
 #define SetEOSP(pbuf, eosp)	\
-		*(__le16 *)(pbuf) |= cpu_to_le16((eosp & 1) << 4)
+		(*(__le16 *)(pbuf) |= cpu_to_le16((eosp & 1) << 4))
 
 #define SetAckpolicy(pbuf, ack)	\
-	*(__le16 *)(pbuf) |= cpu_to_le16((ack & 3) << 5)
+	(*(__le16 *)(pbuf) |= cpu_to_le16((ack & 3) << 5))
 
 #define GetAckpolicy(pbuf) (((le16_to_cpu(*(__le16 *)pbuf)) >> 5) & 0x3)
 
 #define GetAMsdu(pbuf) (((le16_to_cpu(*(__le16 *)pbuf)) >> 7) & 0x1)
 
 #define SetAMsdu(pbuf, amsdu)	\
-	*(__le16 *)(pbuf) |= cpu_to_le16((amsdu & 1) << 7)
+	(*(__le16 *)(pbuf) |= cpu_to_le16((amsdu & 1) << 7))
 
 #define GetAid(pbuf)	(le16_to_cpu(*(__le16 *)((size_t)(pbuf) + 2)) & 0x3fff)
 
-- 
2.20.1

