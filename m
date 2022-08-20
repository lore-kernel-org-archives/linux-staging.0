Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7212D3201
	for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 18:16:45 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id s11so9112255edd.13
        for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 11:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=tlMFx2z0JvLnlziapMufzUhDKuW3EwLTT6t3dqkzUYs=;
        b=QiXUYODOT64yakclYO6S8gLkVQ6g5lz4PJ1CZvM7CvggGkJbRDBczDrfv0+wiYx9Bi
         Ec8NdlIPgNC1n2g0AhUlK268Uecvfqv2mGDzP1/tQoN08kcuqqUrIkOWfrnebjnDMHVk
         H04cLaT31VaYu3DV9J6Lz7Yl2UWdCQhLwzyVy5YK1sD/b4zsFPmVz9qXF7MwHVJ7Mqdr
         BpL13pt//ZRiHFM760XtR4Z7868WFpR64/uDrQkTyEuxhHZ8jGjsECVQMnRtHOhjkzd0
         f/gH/gD9KdN82rlclguJYN5L2dz8kSwnX1NF0f5F3DgsbqSoMXJQiyo5pkwcKG2y44Im
         c8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=tlMFx2z0JvLnlziapMufzUhDKuW3EwLTT6t3dqkzUYs=;
        b=gRrFY6Tis9F/frtjz1ATYCic5lm5Y/X+7j11wJhQPccHtQeUM95CQYonD+sxhnfWZL
         vK6YG20KpZu5UZ9x8CcJNCrNzDSxZEv2gXwsWDKzVCqte6C8jkC12CYkDItIi53+Rr0Z
         xfJquxPh2SAU/Xl8MIRlB0mT9muPJyUD5y6s2gegyJEWPfN2idjdNGT+RgS2kLqeWgtV
         iy8iYBkFnixA6D0Wwm8mkwOB4fGLedbLRanvZVdSFb+nODtHTKkq9xHHZJFm9qGQ6GVq
         il8GJ3z1cG6nDnjerRR97kD3KAjccG62RfyPc2nqcDU/F3+FRmLqsn3FZ6oa1ojRVYd7
         +q7A==
X-Gm-Message-State: ACgBeo0rIWEe85ZG4AHeZuAuiTlCbOZKJXtzqXbntQO0V7XXW4cyAhRk
	/qeDCA02pvquGLcJpF97PYy0LoNuaTI=
X-Google-Smtp-Source: AA6agR6I6IJYWnxPzBp2530EXNKAgGiNN8Ww81N5ix3KRcfivHZtsfooZ6C+kcj6P7sWwtrPc1zZ/g==
X-Received: by 2002:a05:6402:350e:b0:446:145d:a3bb with SMTP id b14-20020a056402350e00b00446145da3bbmr10066463edd.23.1661019403855;
        Sat, 20 Aug 2022 11:16:43 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb77.dynamic.kabel-deutschland.de. [95.90.187.119])
        by smtp.gmail.com with ESMTPSA id g2-20020a17090604c200b0072af890f52dsm3887833eja.88.2022.08.20.11.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Aug 2022 11:16:43 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 11/19] staging: r8188eu: rename _rtw_pktfile_read()
Date: Sat, 20 Aug 2022 20:16:15 +0200
Message-Id: <20220820181623.12497-12-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220820181623.12497-1-straube.linux@gmail.com>
References: <20220820181623.12497-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no need to prefix the function name of _rtw_pktfile_read()
with an underscore. Rename it to rtw_pktfile_read().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 26bf300e672b..51672984156b 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -427,7 +427,7 @@ static uint rtw_remainder_len(struct pkt_file *pfile)
 	       (size_t)(pfile->buf_start));
 }
 
-static uint _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen)
+static uint rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen)
 {
 	uint	len = 0;
 
@@ -450,11 +450,11 @@ static void set_qos(struct pkt_file *ppktfile, struct pkt_attrib *pattrib)
 	s32 user_prio = 0;
 
 	rtw_open_pktfile(ppktfile->pkt, ppktfile);
-	_rtw_pktfile_read(ppktfile, (unsigned char *)&etherhdr, ETH_HLEN);
+	rtw_pktfile_read(ppktfile, (unsigned char *)&etherhdr, ETH_HLEN);
 
 	/*  get user_prio from IP hdr */
 	if (pattrib->ether_type == 0x0800) {
-		_rtw_pktfile_read(ppktfile, (u8 *)&ip_hdr, sizeof(ip_hdr));
+		rtw_pktfile_read(ppktfile, (u8 *)&ip_hdr, sizeof(ip_hdr));
 /* 		user_prio = (ntohs(ip_hdr.tos) >> 5) & 0x3; */
 		user_prio = ip_hdr.tos >> 5;
 	} else if (pattrib->ether_type == 0x888e) {
@@ -484,7 +484,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 
 
 	rtw_open_pktfile(pkt, &pktfile);
-	_rtw_pktfile_read(&pktfile, (u8 *)&etherhdr, ETH_HLEN);
+	rtw_pktfile_read(&pktfile, (u8 *)&etherhdr, ETH_HLEN);
 
 	pattrib->ether_type = ntohs(etherhdr.h_proto);
 
@@ -512,7 +512,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 		/*  to prevent DHCP protocol fail */
 		u8 tmp[24];
 
-		_rtw_pktfile_read(&pktfile, &tmp[0], 24);
+		rtw_pktfile_read(&pktfile, &tmp[0], 24);
 		pattrib->dhcp_pkt = 0;
 		if (pktfile.pkt_len > 282) {/* MINIMUM_DHCP_PACKET_SIZE) { */
 			if (((tmp[21] == 68) && (tmp[23] == 67)) ||
@@ -963,7 +963,7 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 	}
 
 	rtw_open_pktfile(pkt, &pktfile);
-	_rtw_pktfile_read(&pktfile, NULL, pattrib->pkt_hdrlen);
+	rtw_pktfile_read(&pktfile, NULL, pattrib->pkt_hdrlen);
 
 	frg_inx = 0;
 	frg_len = pxmitpriv->frag_len - 4;/* 2346-4 = 2342 */
@@ -1021,9 +1021,9 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 
 		if (bmcst) {
 			/*  don't do fragment to broadcast/multicast packets */
-			mem_sz = _rtw_pktfile_read(&pktfile, pframe, pattrib->pktlen);
+			mem_sz = rtw_pktfile_read(&pktfile, pframe, pattrib->pktlen);
 		} else {
-			mem_sz = _rtw_pktfile_read(&pktfile, pframe, mpdu_len);
+			mem_sz = rtw_pktfile_read(&pktfile, pframe, mpdu_len);
 		}
 
 		pframe += mem_sz;
-- 
2.37.2

