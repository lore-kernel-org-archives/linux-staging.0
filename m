Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CE7107A4
	for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 14:06:21 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-68a1af910e0so782926b3a.2
        for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 07:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1692972381; x=1693577181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A45owKeZCcGxrJDvohEXl0lV0iLAnAAGipTcWp8WS68=;
        b=N2mNqQ7ynHFjULfa/isy/qSyIb6fQDkzLllxIB49iC+9AIUhWlyUjj3KG9aGfkbwdS
         v+rIywKc0XbU96DhGDnQ6A2hoLfXfFG9ngE74mDTy+7rGZf6OSoUX07oiFlrbC/XbzhA
         79Y8b0JaMUUS1i9/i7bmP4tRk51d2rtWgj5CxJmFujNt8K5dvY+VxbqWd1IXOP07N2d8
         C0y0oxwhnE6IJKbSOqQWjyFYiQKsrNZvSl8WANuuiAe514h6R4qZeieas7m1I+UJY82l
         vHX5kgiACDtLW0F8qbzLfZPbBRyFrTPBGSwnQ1Tno0BLcRLzfGG02Tp/aHXMaDFYO/kk
         rbOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692972381; x=1693577181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A45owKeZCcGxrJDvohEXl0lV0iLAnAAGipTcWp8WS68=;
        b=XaMiwBHMUeqEi5oCR9tE00Ww7/dtyCSrCYKLK24734pw17QuJMyIizfr7NfRYDug5O
         VSd4url1BB03mjpKLpvONAwgGKfc4p2yLlyZem2dABeTiWPj+qLnvUudSqgohzBRH6Wn
         nROG8MdYGOW4NHozlBw9GOFTqanulwB9SlMlLCHrvaA5BacAZIHOrdPdoZCgZS6asQUi
         Ecf0/xPMfJ7Y788JPHfmgt+jBBB3JjnwW4V84TPjq43yz+bSKAdJl1rxAN2kN2WwgJ6d
         pmStey2VLZczRiDtHLgiz2ZGsmCr0HWyzaBeXy/dCxk9N+Bl1xm0XEQNGNL4rOxQICA1
         807Q==
X-Gm-Message-State: AOJu0Yw3EARlyGAQt6c2oB793irdkHobsla7EwdtJj4aS4wuQBlJ85+3
	Uu+0DgTVS+158A4Lk0HOy7fU+A==
X-Google-Smtp-Source: AGHT+IGpKjeOkUaxyU5TzsNzWONG0U609xLRucm36VdW3zMgzQ4JgsW1jEvmWr/sSGled5aJ04isfw==
X-Received: by 2002:a05:6a20:2446:b0:140:94b8:3b70 with SMTP id t6-20020a056a20244600b0014094b83b70mr18867226pzc.17.1692972381452;
        Fri, 25 Aug 2023 07:06:21 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id v23-20020a62a517000000b006870721fcc5sm1628232pfm.175.2023.08.25.07.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 07:06:21 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v4 05/16] Staging: rtl8192e: Rename variable pRxTs in function rtllib_rx_ba_inact_timeout()
Date: Fri, 25 Aug 2023 07:08:36 -0700
Message-ID: <20230825140847.501113-6-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825140847.501113-1-tdavies@darkphysics.net>
References: <20230825140847.501113-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename varialbe pRxTs in function rtllib_rx_ba_inact_timeout() to ts
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
v4:Resending as v4
v3:Resend as 16 patch series - no longer throttled by email provider
v2:Resending in smaller patch series
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 2aa624bcbfd1..bc6f9e8c5dd8 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -532,13 +532,13 @@ void rtllib_tx_ba_inact_timeout(struct timer_list *t)
 
 void rtllib_rx_ba_inact_timeout(struct timer_list *t)
 {
-	struct rx_ts_record *pRxTs = from_timer(pRxTs, t,
+	struct rx_ts_record *ts = from_timer(ts, t,
 					      rx_admitted_ba_record.timer);
-	struct rtllib_device *ieee = container_of(pRxTs, struct rtllib_device,
-				     RxTsRecord[pRxTs->num]);
+	struct rtllib_device *ieee = container_of(ts, struct rtllib_device,
+				     RxTsRecord[ts->num]);
 
-	rx_ts_delete_ba(ieee, pRxTs);
-	rtllib_send_DELBA(ieee, pRxTs->ts_common_info.Addr,
-			  &pRxTs->rx_admitted_ba_record, RX_DIR,
+	rx_ts_delete_ba(ieee, ts);
+	rtllib_send_DELBA(ieee, ts->ts_common_info.Addr,
+			  &ts->rx_admitted_ba_record, RX_DIR,
 			  DELBA_REASON_TIMEOUT);
 }
-- 
2.41.0

