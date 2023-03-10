Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D5D23AF
	for <linux-staging@lists.linux.dev>; Fri, 10 Mar 2023 08:35:10 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id s11so17354320edy.8
        for <linux-staging@lists.linux.dev>; Fri, 10 Mar 2023 00:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678437308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s4eERmpGRWxN7WGTZJirAqZLtcWVZejiRDlj9T4wObg=;
        b=QEHT/Kmafou4c+fPJ4W3mksw8ajqdo2XLzLsHGizvtqOzI7nCHZoz67aRqVygsWNYI
         vYYEJVdHtWJ1ByZTTanLjVOpcB4EeOamopmdXVZzv4SrO/Nlgr6bIN6/EtCuiop81i1+
         qbQPTif6bWMIjblA5muXgURhXELE2Ost6+EW/qo+b21PoubO9ZVRj9NnZg5BfYr/R6L7
         9//z+geQJ6je0xWKAAvis5k/814C4zAeonRRvnkO6XbvwFWSvgwC0cuTio/4Eb8F6V+J
         69/G56a6W86SdCANiBZ4DXUuH1IvLz8bI837HzWqvNxi0cF/PvApv3mg6MV1AYZB19VG
         Da+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678437308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s4eERmpGRWxN7WGTZJirAqZLtcWVZejiRDlj9T4wObg=;
        b=I6O/KifFsWhoFSHiCdc0aE0Zp+J80YgcWs6OkU6TKSRC2WdEtuTNy5XBzyWsFX4evV
         dFC53XIF81/XrwukGullU54cPKH/mbJlLT/OPTG1Rq64cYHISgEDNeTocrtl+pVbRZuk
         cZdY2/FjlvwurB+PBkec0qen1rX58Bygh5cn4z+OoQdHuZcVDs7Dc57ejWSwgGrVRZi/
         Zy5QqZXFd7iDpZiMs9R7DBCN1YEnI2WEaALyKaOuFdNQlTUv44PFUSb19GF+Vc3tgCTN
         kJ5hksJh9qbnITWBwaf/ysp329hjmG6+rOfxeGMmfmlBgp+ZoTHy9XxWMYTJAV2WTFQR
         8Iyg==
X-Gm-Message-State: AO0yUKXQUaf/PhD5F+FHvRD7BTxCyVdGU8CUhVySiZqU2Wl76EvuYkht
	qSZP+86nPHlOmwMYkX7luy4=
X-Google-Smtp-Source: AK7set/gGW4PyYu6LY3aIJ3Hp9Re7e7hvAsjhgO+H1xmMX+PpYMlrAWORpE4aOBw42Vsz+6YXngpSg==
X-Received: by 2002:a17:906:d9c2:b0:8b1:7b22:90b6 with SMTP id qk2-20020a170906d9c200b008b17b2290b6mr23302762ejb.37.1678437308487;
        Fri, 10 Mar 2023 00:35:08 -0800 (PST)
Received: from localhost.localdomain (ip5f5abbd3.dynamic.kabel-deutschland.de. [95.90.187.211])
        by smtp.gmail.com with ESMTPSA id h10-20020a17090619ca00b008ce5b426d77sm697888ejd.13.2023.03.10.00.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 00:35:08 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/5] staging: rtl8723bs: isAllSpaceOrTab() is not used
Date: Fri, 10 Mar 2023 09:34:47 +0100
Message-Id: <20230310083449.23775-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310083449.23775-1-straube.linux@gmail.com>
References: <20230310083449.23775-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function isAllSpaceOrTab() is not used anywhere, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c     | 15 ---------------
 drivers/staging/rtl8723bs/include/hal_com.h |  2 --
 2 files changed, 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index ff0e41bf72b0..da68557c5b20 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -877,21 +877,6 @@ bool GetU1ByteIntegerFromStringInDecimal(char *Str, u8 *pInt)
 	return true;
 }
 
-bool isAllSpaceOrTab(u8 *data, u8 size)
-{
-	u8 cnt = 0, NumOfSpaceAndTab = 0;
-
-	while (size > cnt) {
-		if (data[cnt] == ' ' || data[cnt] == '\t' || data[cnt] == '\0')
-			++NumOfSpaceAndTab;
-
-		++cnt;
-	}
-
-	return size == NumOfSpaceAndTab;
-}
-
-
 void rtw_hal_check_rxfifo_full(struct adapter *adapter)
 {
 	struct dvobj_priv *psdpriv = adapter->dvobj;
diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index 31fdb5c45de3..839d93d8a1df 100644
--- a/drivers/staging/rtl8723bs/include/hal_com.h
+++ b/drivers/staging/rtl8723bs/include/hal_com.h
@@ -149,8 +149,6 @@ bool eqNByte(u8 *str1, u8 *str2, u32 num);
 
 bool GetU1ByteIntegerFromStringInDecimal(char *str, u8 *in);
 
-bool isAllSpaceOrTab(u8 *data, u8 size);
-
 void linked_info_dump(struct adapter *padapter, u8 benable);
 #ifdef DBG_RX_SIGNAL_DISPLAY_RAW_DATA
 void rtw_get_raw_rssi_info(void *sel, struct adapter *padapter);
-- 
2.39.2

