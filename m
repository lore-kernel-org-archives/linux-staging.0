Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF6B101D1
	for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 14:06:20 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-68a3e271491so775656b3a.0
        for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 07:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1692972380; x=1693577180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuqWDfbkk1jArp3egowQBA6Br3DIlZvf5v8+1xse7q8=;
        b=Sprh4DX7bg6D1HVSkBfwA5ZnoMtTEsiW+BkhKjbK8IFFgAwlgM9dxNjflsmvGuN2IX
         LMSaIxPN+/Mn5LYk5ttBW1iDB7oRmKi+CkkR8RnX4DOgEKtw2p/W6hEVQL9+nbJITqy8
         0RgcEsr0oo4vJ3nAujWu7SGGkOAbvybs0i9diIwANGkmOLsKXfjryo4+7J+t97alvUs5
         /c6H+3eLRfsF4ft36RGBgdUmGBEC0tF5ixzPt2940KzuVz43oPEFY5vh59iNVTMeIpjK
         lBMaSXg0eow24thG7nUoigX1NApLpWJwFjT3VZ9UH+jXJV3/OP/yudm1W2lZJjCytsSV
         bMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692972380; x=1693577180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AuqWDfbkk1jArp3egowQBA6Br3DIlZvf5v8+1xse7q8=;
        b=TXPwW55WmaE/3PFLaKtFXKhnKDmcNMVOtwy8U568hfYyb2MmdeQk5uWC44FdrzwOif
         zNxuurxS6PF+TWvpA3rDrtHr+Da/oEoKzZwu1pN5WDHGNb5JXxt15y6x/ZrLPLA1VFx2
         Xa64H6i0OtEa+gBw1IFDYbEBSg2iC0Ri+Nr2fKBMO16aBl1O1UoUgID4ndh5n+h2yzQy
         XC16kq86E3kintRM11ntFJcioKb+vEtDp4owd2v3TRcwF9z+EocdWOdfO2rSzPkxJqfZ
         BeMzK6iwbvgyiqvztWSxyBput5Y4lJWR41vCROA+8sdl06nwYbwY/ema2U/L28aJTD/5
         OQew==
X-Gm-Message-State: AOJu0YxzIbMxmz+lXmXq/YpBQZ6mvov8dx1icVM95F2zyZu95B+UbxL+
	jLh3pRcctmmEjE1cP/v8AIW0cw==
X-Google-Smtp-Source: AGHT+IGWz7urlOlDuqNC9Yba0/RyUDSNpdxDqxn6voytQ5ZyXHHehEW6SCzaaad+Hq03/RlWgGKVfA==
X-Received: by 2002:a05:6a00:124c:b0:68b:e321:285e with SMTP id u12-20020a056a00124c00b0068be321285emr6601605pfi.15.1692972380157;
        Fri, 25 Aug 2023 07:06:20 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id v23-20020a62a517000000b006870721fcc5sm1628232pfm.175.2023.08.25.07.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 07:06:19 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v4 04/16] Staging: rtl8192e: Rename variable pRxTs in function rtllib_ts_init_del_ba()
Date: Fri, 25 Aug 2023 07:08:35 -0700
Message-ID: <20230825140847.501113-5-tdavies@darkphysics.net>
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

Rename variable pRxTs in function rtllib_ts_init_del_ba() to ts
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
v4:Resending as v4
v3:Resend as 16 patch series - no longer throttled by email provider
v2:Resending in smaller patch series
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index c584e9ec48b6..2aa624bcbfd1 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -499,11 +499,11 @@ void rtllib_ts_init_del_ba(struct rtllib_device *ieee,
 					(&pTxTs->TxPendingBARecord),
 					 TxRxSelect, DELBA_REASON_END_BA);
 	} else if (TxRxSelect == RX_DIR) {
-		struct rx_ts_record *pRxTs =
+		struct rx_ts_record *ts =
 				 (struct rx_ts_record *)pTsCommonInfo;
-		if (rx_ts_delete_ba(ieee, pRxTs))
+		if (rx_ts_delete_ba(ieee, ts))
 			rtllib_send_DELBA(ieee, pTsCommonInfo->Addr,
-					  &pRxTs->rx_admitted_ba_record,
+					  &ts->rx_admitted_ba_record,
 					  TxRxSelect, DELBA_REASON_END_BA);
 	}
 }
-- 
2.41.0

