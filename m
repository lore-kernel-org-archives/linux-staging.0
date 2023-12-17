Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF034B12B
	for <linux-staging@lists.linux.dev>; Sun, 17 Dec 2023 23:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="gu4mATng"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-28b400f08a4so1575796a91.1
        for <linux-staging@lists.linux.dev>; Sun, 17 Dec 2023 15:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1702857326; x=1703462126; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QcmVbJydKEcWtYX1J4gYneDAG9W0JB3UC1M7ZuIvgfA=;
        b=gu4mATngKnCQ1dDJN0q1ml7nzcPI4L6K1Uq2EkwjpJQ1hzmr/BWZGbc0rLxQPfW/5H
         5K/RxixvDZ79Jb8+WDqpTXHU7jkTosF7y/eZYQW9cgt1TTU9zCE3gJBYAjIhZTbu2GcQ
         MfwgY26WpwcTP2jrTeh3TnKx1SnfygUFBAC6v/e/KpaukfZ0zRYP5RtrT+ynXYrPM7I1
         fmhJK+BzIsRDWw31jV3800zcF/85Z04FFPckS+NBZPyc/LnkSGAG809xx9pURNGYD3kx
         +ZeADInObNTu+6yLPL+35/pt5SJwNjqD7nLvBZ4qDhLHkrV7F7DKXcbVSAtPpUHbGHmc
         VuGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702857326; x=1703462126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QcmVbJydKEcWtYX1J4gYneDAG9W0JB3UC1M7ZuIvgfA=;
        b=cS68LPBVQ7hDF6XCkWNZn+tWPh5OqIi6up1nI1XmwnXZ5skGpQ7tA1FhXsXADRtRRI
         SUh7CJBw/mpyrqnNmK0/juUXoc0vD0wrhkvR+Sz7wYKjzs9KhOHfJINapPjvIVaiH6G5
         GK13SUIBhiqUVF/7wcxy1+/kyKdtYcizjEWNIA6an9NqvMoiRQo0hRf3sIqOo35EKHSo
         /112u/V0YEYQsY7Nx128YCaRVBe+t/YEzlG6XOKLqp3JY8EdYTJhhjy0v0nqYog6LEot
         OPpzs6PaZG56jBGEg+r+oWzUofP3+Tcp3RJTOTGPyydriDJ7eugaZkAUz4mEq4Oc3Ci2
         Iz9w==
X-Gm-Message-State: AOJu0YwrRN8abBqFv1SnM2UBUqNDtsfLCNN+myTydWsQXjTaUxx9I85t
	PBMjCRABa+vR3bxJ3nXQYDLUzw==
X-Google-Smtp-Source: AGHT+IGzG4RbwFRuq9imJKDCMJ+xVKs77Du/FtG5Jl2kjnXKqAUalU71OA38gz2W8J5ijf7XBOmkcQ==
X-Received: by 2002:a17:903:2b10:b0:1d3:4d31:6e3a with SMTP id mc16-20020a1709032b1000b001d34d316e3amr11271032plb.47.1702857326256;
        Sun, 17 Dec 2023 15:55:26 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id f11-20020a17090aec8b00b0028ae8284840sm9036176pjy.10.2023.12.17.15.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 15:55:25 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 3/6] Staging: rtl8192e: Rename variable ucTSID
Date: Sun, 17 Dec 2023 15:55:17 -0800
Message-Id: <20231217235520.30377-4-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231217235520.30377-1-tdavies@darkphysics.net>
References: <20231217235520.30377-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable ucTSID to ts_id to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 2 +-
 drivers/staging/rtl8192e/rtl819x_Qos.h    | 2 +-
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index cdbda65b4d50..fd0149d3f717 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -474,7 +474,7 @@ void rtllib_ts_init_add_ba(struct rtllib_device *ieee, struct tx_ts_record *ts,
 	ba->dialog_token++;
 	ba->ba_param_set.field.amsdu_support = 0;
 	ba->ba_param_set.field.ba_policy = policy;
-	ba->ba_param_set.field.tid = ts->ts_common_info.tspec.ucTSID;
+	ba->ba_param_set.field.tid = ts->ts_common_info.tspec.ts_id;
 	ba->ba_param_set.field.buffer_size = 32;
 	ba->ba_timeout_value = 0;
 	ba->ba_start_seq_ctrl.field.seq_num = (ts->tx_cur_seq + 3) % 4096;
diff --git a/drivers/staging/rtl8192e/rtl819x_Qos.h b/drivers/staging/rtl8192e/rtl819x_Qos.h
index 1c00092ea3a5..50e01ca49a4c 100644
--- a/drivers/staging/rtl8192e/rtl819x_Qos.h
+++ b/drivers/staging/rtl8192e/rtl819x_Qos.h
@@ -8,7 +8,7 @@
 #define __INC_QOS_TYPE_H
 
 struct qos_tsinfo {
-	u8		ucTSID:4;
+	u8		ts_id:4;
 	u8		ucDirection:2;
 };
 
diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 489261831462..ad4d9e4c9b63 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -198,7 +198,7 @@ static struct ts_common_info *SearchAdmitTRStream(struct rtllib_device *ieee,
 			continue;
 		list_for_each_entry(pRet, psearch_list, List) {
 			if (memcmp(pRet->addr, addr, 6) == 0 &&
-			    pRet->tspec.ucTSID == TID &&
+			    pRet->tspec.ts_id == TID &&
 			    pRet->tspec.ucDirection == dir)
 				break;
 		}
@@ -305,7 +305,7 @@ bool rtllib_get_ts(struct rtllib_device *ieee, struct ts_common_info **ppTS,
 		netdev_dbg(ieee->dev,
 			   "to init current TS, UP:%d, Dir:%d, addr: %pM ppTs=%p\n",
 			   UP, Dir, addr, *ppTS);
-		ts_info->ucTSID = UP;
+		ts_info->ts_id = UP;
 		ts_info->ucDirection = Dir;
 
 		MakeTSEntry(*ppTS, addr, &tspec);
-- 
2.39.2

