Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AFD364B3
	for <linux-staging@lists.linux.dev>; Fri, 24 Nov 2023 21:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DUOjlnqT"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-507cb194e30so659018e87.1
        for <linux-staging@lists.linux.dev>; Fri, 24 Nov 2023 13:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700861441; x=1701466241; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7G27DLDSnr98RUfDdYxVys5pn2qiQC28hb1GX/OMO0I=;
        b=DUOjlnqT7JjqtNOFdIxGMGYduztm8CFXyQ/b42kwg1Eews2WOpYuNx64RjPOxEnt4N
         99h0S4kT+KB9w5ZiWsXSDUgMl6qmtmI0cXdAAliSD/SJmfYwClHxKpb904Du/jqyxde9
         uMedMfA+9W3ofRBx+EHhWuXxGGrcXReCPLEogVKx0ZP4+yDr2CGIv5rUfumF0esSnHHU
         sNe0kVcoWJnjJ2bKpMiwISeTf2EkT3bhfVcDTMdBWoWVOlPCubd1TQDQj5ZES4JzpocW
         S8x5TToKG5CPUG3bXlB8IWfjl55816ERyXL1AMWeKh49dFqgDBcFPlB9f7EPofmN3Rzr
         DxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700861441; x=1701466241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7G27DLDSnr98RUfDdYxVys5pn2qiQC28hb1GX/OMO0I=;
        b=TUYlxAzHiNZ+S945BsmpkNNif7JyL9gnOdIq9a3J+8/arnVzzoWOFfrBSYGy3WZaJQ
         K8uGyyWv3I0xeURX8Hs5aWFnEO5jWrJq1v6yoJrLuwyzbRQXuffRyqnPgSPvip7sBnHu
         IbtWWPU3zxiqxx4ZZvWxp61zh63jRJD5rWf5GteBhhB1CzHwLKIVcxTSNifmRP5pIjpC
         DE8A9zFNhlemudNXTabujjdd80EJA13BeqvrpnI/OsHLEBFiHzQFjgjlJ05yDByi82PB
         1LhjA6Nh2HGg77mNFZtpN8SaZp8Ag8wLOfwWD8ZEcZc45SdQe/TU5xOPsP5tQHJYxoWZ
         d/1g==
X-Gm-Message-State: AOJu0Yz7sqMTJRFWayDGdeQnKQbX7P72uWRPMPPxt2gBwBeOftzd9cWX
	GmdzTGuh5gy+wZSG8GxxhnU=
X-Google-Smtp-Source: AGHT+IFlYdG7tyeIYbb8Y7pITwOO+/AGFM093dRsUC8/YvjlAYnA3fBVfLMrwtAQKK6QP0i2QzzMKQ==
X-Received: by 2002:a05:6512:3b0a:b0:507:b1b8:cf0a with SMTP id f10-20020a0565123b0a00b00507b1b8cf0amr2922142lfv.3.1700861440913;
        Fri, 24 Nov 2023 13:30:40 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id x22-20020a170906135600b009efe6fdf615sm2519712ejb.150.2023.11.24.13.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 13:30:40 -0800 (PST)
Date: Fri, 24 Nov 2023 22:30:39 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] staging: rtl8192e: Remove unused function
 rtllib_get_beacon()
Message-ID: <d76eeb7e273f4fcfec4ae8879e56d237363ebde2.1700860758.git.philipp.g.hortmann@gmail.com>
References: <cover.1700860758.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1700860758.git.philipp.g.hortmann@gmail.com>

Remove unused function rtllib_get_beacon().

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h         |  1 -
 drivers/staging/rtl8192e/rtllib_softmac.c | 21 ---------------------
 2 files changed, 22 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 5d6563d12480..835b407ab180 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1693,7 +1693,6 @@ void rtllib_softmac_start_protocol(struct rtllib_device *ieee);
 void rtllib_reset_queue(struct rtllib_device *ieee);
 void rtllib_wake_all_queues(struct rtllib_device *ieee);
 void rtllib_stop_all_queues(struct rtllib_device *ieee);
-struct sk_buff *rtllib_get_beacon(struct rtllib_device *ieee);
 
 void notify_wx_assoc_event(struct rtllib_device *ieee);
 void rtllib_ps_tx_ack(struct rtllib_device *ieee, short success);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 2ce4f64f88f6..0ad08165fd85 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -2180,27 +2180,6 @@ static struct sk_buff *rtllib_get_beacon_(struct rtllib_device *ieee)
 	return skb;
 }
 
-struct sk_buff *rtllib_get_beacon(struct rtllib_device *ieee)
-{
-	struct sk_buff *skb;
-	struct rtllib_probe_response *b;
-
-	skb = rtllib_get_beacon_(ieee);
-	if (!skb)
-		return NULL;
-
-	b = (struct rtllib_probe_response *)skb->data;
-	b->header.seq_ctrl = cpu_to_le16(ieee->seq_ctrl[0] << 4);
-
-	if (ieee->seq_ctrl[0] == 0xFFF)
-		ieee->seq_ctrl[0] = 0;
-	else
-		ieee->seq_ctrl[0]++;
-
-	return skb;
-}
-EXPORT_SYMBOL(rtllib_get_beacon);
-
 void rtllib_softmac_stop_protocol(struct rtllib_device *ieee)
 {
 	rtllib_stop_scan_syncro(ieee);
-- 
2.42.0

