Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CF6A95A
	for <linux-staging@lists.linux.dev>; Tue, 12 Sep 2023 19:28:28 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3fe4f3b5f25so17570875e9.0
        for <linux-staging@lists.linux.dev>; Tue, 12 Sep 2023 12:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694546907; x=1695151707; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VFhh3RYguSGZkGRqPmnmCXiDYtANu+EmtRXu+PYPOCI=;
        b=GXhrZTjo/boPceS6TnkdqtYjIsKSVGrboV1/EKCtR+KrMKo9wgiG2FmUEcDcBDgAcz
         tHP0fVywelGFHYmTEKUuskCidBeEnNtQFYDHqqa3p2RuanacO4D14KvMhKFESp8oU4mc
         V4jjX0O/ouIIHDo8nDVlqE1mjlT8qz/vJg0/MJFNSSdKGwKMEDIMUWjSJdF1MyeUqmqT
         n41Y0VWVQ79pOd4mtngyjjLLOho5ORSbAUc0xNUD0kcVD27+Q7YCwW85zv+K5bYw2XkI
         ttTqGW85eOpTcCgdCTLNMbBiKpxDOSNbOUgsFNxjWZ41tRRVP/k0rBB71a2jobIqY5L2
         5CGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694546907; x=1695151707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFhh3RYguSGZkGRqPmnmCXiDYtANu+EmtRXu+PYPOCI=;
        b=JXLDhiMgZjsIFbT9dSCk4zc/wwgWcO0Z63kOth7iismgLFIzcELDZ0bAMBTrY29t/j
         I4BM3CP3Sl9/afuKa2Csn+Mv1xqk5O84OmblTtg20RwykHCWtLUONLH8/ZDvrygkClXD
         1OpeGey1f0kOKSPjosA4JST6a2UJ7wUfF99i28dT7fWtoztRzTFN4m50s9sz7QhMxs/+
         GSEINatSLdNocJDxD9vItoCsNfP/Dj1MKzom3WwGiQ/sxL6DhHv1yc8aP93UeFeabZo7
         //T+4J0oZfSfun5MCvf9B+rkY0bMRZMzu0nlUHL6tED/qKuLygCNZsdJ8c82cITV4thj
         7YVA==
X-Gm-Message-State: AOJu0YzWHRVMKTkuHKnPkQATNldPFBWqm2Pwi90O6ZUAXsu8QTJHkOTH
	pTa2FyG6z2zTMvZVUr0qUKI=
X-Google-Smtp-Source: AGHT+IEWeO9Hgpc5nHkKHmZJfxWb6esn5cYbn63twoTBUk9Fy18fYsflOzliC1ojWtha+ePEtaKcKQ==
X-Received: by 2002:a05:600c:314b:b0:401:c6a2:3cd5 with SMTP id h11-20020a05600c314b00b00401c6a23cd5mr299818wmo.2.1694546906801;
        Tue, 12 Sep 2023 12:28:26 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id l40-20020a05600c1d2800b00402f7b50517sm13840629wms.40.2023.09.12.12.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 12:28:26 -0700 (PDT)
Date: Tue, 12 Sep 2023 21:28:25 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/8] staging: rtl8192e: Use standard function in
 rtllib_rx_check_duplicate()
Message-ID: <b74b6ef5e266504b9e3d84495bcd8fe4978b4ded.1694546300.git.philipp.g.hortmann@gmail.com>
References: <cover.1694546300.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1694546300.git.philipp.g.hortmann@gmail.com>

Use standard function ieee80211_is_beacon() to avoid proprietary code and
to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
v1->v2: Take wrongly removed definition of fc back in.
---
 drivers/staging/rtl8192e/rtllib_rx.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 89c8d66765fe..7c16d4db67ad 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -904,11 +904,9 @@ static int rtllib_rx_check_duplicate(struct rtllib_device *ieee,
 {
 	struct rtllib_hdr_4addr *hdr = (struct rtllib_hdr_4addr *)skb->data;
 	u16 fc, sc;
-	u8 frag, type, stype;
+	u8 frag;
 
 	fc = le16_to_cpu(hdr->frame_ctl);
-	type = WLAN_FC_GET_TYPE(fc);
-	stype = WLAN_FC_GET_STYPE(fc);
 	sc = le16_to_cpu(hdr->seq_ctl);
 	frag = WLAN_GET_SEQ_FRAG(sc);
 
@@ -916,8 +914,7 @@ static int rtllib_rx_check_duplicate(struct rtllib_device *ieee,
 		!ieee->current_network.qos_data.active ||
 		!IsDataFrame(skb->data) ||
 		IsLegacyDataFrame(skb->data)) {
-		if (!((type == RTLLIB_FTYPE_MGMT) &&
-		      (stype == RTLLIB_STYPE_BEACON))) {
+		if (!ieee80211_is_beacon(hdr->frame_ctl)) {
 			if (is_duplicate_packet(ieee, hdr))
 				return -1;
 		}
-- 
2.42.0

