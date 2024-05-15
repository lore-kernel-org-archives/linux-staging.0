Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7F444368
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 04:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748765; cv=none; b=PL40NcptjY565a9KFELtXdGjfL/UOe1rDBNIGdleTdBW9n5gGqzybtcy3r7B2hoEDm45DYcAnttDqeci32yehtK0i95eHjhZyZovWUYe5+SzjlJPf2LHuh9IxrwlzljyN2lHosyLsrA76+rkBYgs8PApjdcM4X46XMwtgNocG58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748765; c=relaxed/simple;
	bh=VnvL1pR/A33+cx0W1gDMCk2E3fkBNhHbZrMUHsMUhe4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l1Z0c1U5T4EznlThuNLV5Tg/kjXzNs34AmB87FbMfCqzYLcQ8mvPtRKgZJ1HnaXWeN5dCxstcgbyaulI1/6huEY4R7dUrTGk3PUkiJlX7JN0cw4Hj3ZfBvjaH5+tTirzIBOXPPhNPxYcmSPRNXTazGCa/7HTtp0j2SLa2GD8D0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=k9/lVNHd; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="k9/lVNHd"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3c9b94951d5so589744b6e.3
        for <linux-staging@lists.linux.dev>; Tue, 14 May 2024 21:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1715748762; x=1716353562; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgCRtbTOWnZ8kzAmOYjZrKpYOKSuXshKUOyljVtAXXA=;
        b=k9/lVNHdOGjo6ih08ksFIJO3I0U+z2JRcL2oLYK9PJvKMo4RI3bngL9JrqhgJYmO2U
         pKWU8Ozr/wdtC+db/GktIa7467O+FbT6PNXQZ6TXaPeszjnWD8yeMgCJ9UZqyXgx2zxF
         flA/fUTnEkLGUf65hg8MwRSl7I2KbSDlwCA3F9ZXdzjUBVVaTNXlv/fmBpctpBo2or2E
         RkpAEAAZfDClddgpAMQ5pFQ2UnybrczlAhzNjAxYbeDDw8/kEkLne8HCtIoP5ccXiGTm
         vfXXrmB2v6cDDAlRq+BqJutkQcFghQ2lTkQiOY1C3nLswPfjPtWcR82RuqQsyMzJkuxR
         /YWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715748762; x=1716353562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NgCRtbTOWnZ8kzAmOYjZrKpYOKSuXshKUOyljVtAXXA=;
        b=Y5FhqdAFcAWc8mi/jZfJaWl/UNZamBbZzrfEuY++9WPvuNyNesA8Eltoe+tsTxXNXt
         9eBE6uWCqjEduN1SGAP21Prb15N9Fh5rHU+pii9ANfr+LeywydvBUwNFnsWcOkdvrmYM
         tWf0tiO/nGzc5yt0EOaSWxIBhxGrmJ7eMchxFBpQ7RMPSUzy9y1F3E+GJJnAknRR9QdI
         qwoPoxAdpqhQg7+gGl2LVA03dpgBQN1d0zH12B7LrVL6hj+3F/ghfkiobLNi+s0C6R9d
         lYsKberbXwMDYzdFLA9SuC7QB9eCvPrx3yfLX39pDlHVtgLeCnBAuIwQHcvLYe2InvZF
         rtHQ==
X-Gm-Message-State: AOJu0Ywz5Bct9gUj8Bx8k/v8zLH0Ug+RSuMGf9la5zDbfNyJ60GrwPGC
	1Wih0/JMXiS4yHdMcz6fScw8ogSA2FszfBlXuNJT7p4UlxDDUH1wg76UVsBSkcA=
X-Google-Smtp-Source: AGHT+IG8MX0IzqySjgg9OnwPx44Vzfw7g2WiJ8/t89Kc4UVleZmVjmIxCTB9X67dNCnWo287HiswDw==
X-Received: by 2002:a05:6808:a96:b0:3c5:f86f:a5e5 with SMTP id 5614622812f47-3c9970b95aamr13769982b6e.38.1715748762526;
        Tue, 14 May 2024 21:52:42 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a827fdsm10135035b3a.60.2024.05.14.21.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 21:52:42 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 11/31] Staging: rtl8192e: Rename variable IsLegacyDataFrame
Date: Tue, 14 May 2024 21:52:08 -0700
Message-Id: <20240515045228.35928-12-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240515045228.35928-1-tdavies@darkphysics.net>
References: <20240515045228.35928-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable IsLegacyDataFrame to is_legacy_data_frame
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h    | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 4645fe803a15..cdb3ebc77a53 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -339,7 +339,7 @@ enum rt_op_mode {
 
 #define	FC_QOS_BIT					BIT(7)
 #define IsDataFrame(pdu)	(((pdu[0] & 0x0C) == 0x08) ? true : false)
-#define	IsLegacyDataFrame(pdu)	(IsDataFrame(pdu) && (!(pdu[0]&FC_QOS_BIT)))
+#define	is_legacy_data_frame(pdu)	(IsDataFrame(pdu) && (!(pdu[0]&FC_QOS_BIT)))
 #define IsQoSDataFrame(pframe)			\
 	((*(u16 *)pframe&(IEEE80211_STYPE_QOS_DATA|RTLLIB_FTYPE_DATA)) ==	\
 	(IEEE80211_STYPE_QOS_DATA|RTLLIB_FTYPE_DATA))
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index ea8cab9707bc..24136bba64b6 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -882,7 +882,7 @@ static int rtllib_rx_check_duplicate(struct rtllib_device *ieee,
 	if (!ieee->ht_info->cur_rx_reorder_enable ||
 		!ieee->current_network.qos_data.active ||
 		!IsDataFrame(skb->data) ||
-		IsLegacyDataFrame(skb->data)) {
+		is_legacy_data_frame(skb->data)) {
 		if (!ieee80211_is_beacon(hdr->frame_control)) {
 			if (is_duplicate_packet(ieee, hdr))
 				return -1;
-- 
2.30.2

