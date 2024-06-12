Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08F31EA80
	for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 03:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718162558; cv=none; b=beg4PKH3GBTEZbsJb6KE3VECJqsQZEOhc1BYQk8ECUPjhfRCgcooSDzQTjQk30cSCpd6W1tG9KlevUPiZD55g8/EnfqGPn45hh2CM7A2zA+eBqnzbCEbEoii9NzSrRzSuPqoMpjYvDfGjqqnO+QDc8Ry2SS8OdZ1IDZLkE1xODw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718162558; c=relaxed/simple;
	bh=Z2Og8hD3ZwqLqSZxTqFmWZuV5tskamWURf9scY/q4VE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GKWickqzymYaV1dMW6B93415hvL3MF3o6poJz52qfVOz8su48tvS8TRM66lAnN7AkiG77QvDrYAIlH2sMbW4UJluSK9IyXhmD00deqwaCebaO0jS6J3gXdIPmWFhGOw8pVVE91OvfaE6cYlbXUeQvhVUFCowlhuJjAJUIpUAFeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=MeVbhZCB; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="MeVbhZCB"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3758fa1cc8eso7385295ab.3
        for <linux-staging@lists.linux.dev>; Tue, 11 Jun 2024 20:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1718162555; x=1718767355; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kn6Y3ZurmMy+llEC4r5fkl0HupmvFt8cRPelN9RG3Yg=;
        b=MeVbhZCBX69guce55ockEgKg43hcjkS7Sxutn/cXJS1UfwMF+/TiDqihYCgBcKzuUb
         zhtFXgUC59Y45GTLrcbEGaTth/wShECIOtndpn997yjztGaviRgtFSyvRwJCtddioklY
         H8kcvCLl/+1iRkMcfsuOD3NxWWVfNvZDoMdYeHEUEmNcATug9dd8wEfagvMDc31y1/fj
         3avezG4C5j913wSto0bVhBF/TtXRauYOVa1T7NOU/S3iR1iJPXlZ/3ML0phZPZw0N4hw
         H9K1SKN9+0zwfAQiNN7exxS28/plOqubjO0VETYDCPZDlNKZUVqBA1vddLnas7UeTPKv
         ni8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718162555; x=1718767355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kn6Y3ZurmMy+llEC4r5fkl0HupmvFt8cRPelN9RG3Yg=;
        b=LhE6rQa1uXl/ESzhKz+OxHh8fkI3Vf48xuv602U4b7+wpDy2Djtt2kz9MZ8O00t8oi
         9yhuYPbJlnK03A476wcdVH8QQBrNLC4GoPYhMhnvexiqO8igq3NbDdkRP0TWQVszs5MM
         isPyGgdR4TYwxCjrEvk0x2sM0AndHufyCP5MzSKByso5n1Mp0NIt44VXITgwzLLMf7Ul
         ZjVzzetxlCnKEMNaqRGN9YIN7WyWeTFP3py7095H2bWIrQ0gHJIK73aLxEVy1cHFj52I
         lVoKdTEIRuZPiFlFrlOsw+OgzoKIX+NLbZHvxVj6gaM8UlGCvFSds99O/DRqhsjcs2YF
         EWxQ==
X-Gm-Message-State: AOJu0YzP7E3AGljZI30zwQTH/+bXWuyEmOi8MI0KpWhhwOdFwxTSSZdc
	Z65aUPVFswpINVsLLriyuBdHp4MBxpfPXsOm6y1OMLjbrpk7a/86t+2xhHoSGjI=
X-Google-Smtp-Source: AGHT+IHlb1SEKPZ48DLEKbZ8JbrKYCfG1s8maoccY1eQUTqDbRm0E8V53nWrYeQDI2gx7GqagFjmhQ==
X-Received: by 2002:a05:6e02:1c8a:b0:374:8e4e:86c6 with SMTP id e9e14a558f8ab-375cd14f8e3mr8105285ab.4.1718162554971;
        Tue, 11 Jun 2024 20:22:34 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6e8e8a84949sm5635411a12.32.2024.06.11.20.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 20:22:34 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 02/24] Staging: rtl8192e: Rename variable bIsMulticast
Date: Tue, 11 Jun 2024 20:22:08 -0700
Message-Id: <20240612032230.9738-3-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240612032230.9738-1-tdavies@darkphysics.net>
References: <20240612032230.9738-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bIsMulticast to is_multicast
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No Change
 drivers/staging/rtl8192e/rtllib_tx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 87d1ff943617..8856191a1228 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -538,7 +538,7 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 	u8 src[ETH_ALEN];
 	struct lib80211_crypt_data *crypt = NULL;
 	struct cb_desc *tcb_desc;
-	u8 bIsMulticast = false;
+	u8 is_multicast = false;
 	u8 IsAmsdu = false;
 	bool	bdhcp = false;
 
@@ -655,14 +655,14 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 			ether_addr_copy(header.addr3, dest);
 	}
 
-	bIsMulticast = is_multicast_ether_addr(header.addr1);
+	is_multicast = is_multicast_ether_addr(header.addr1);
 
 	header.frame_control = cpu_to_le16(fc);
 
 	/* Determine fragmentation size based on destination (multicast
 	 * and broadcast are not fragmented)
 	 */
-	if (bIsMulticast) {
+	if (is_multicast) {
 		frag_size = MAX_FRAG_THRESHOLD;
 		qos_ctl |= QOS_CTL_NOTCONTAIN_ACK;
 	} else {
@@ -774,7 +774,7 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 			/* The last fragment has the remaining length */
 			bytes = bytes_last_frag;
 		}
-		if ((qos_activated) && (!bIsMulticast)) {
+		if ((qos_activated) && (!is_multicast)) {
 			frag_hdr->seq_ctrl =
 				 cpu_to_le16(rtllib_query_seqnum(ieee, skb_frag,
 								 header.addr1));
@@ -809,7 +809,7 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 			skb_put(skb_frag, 4);
 	}
 
-	if ((qos_activated) && (!bIsMulticast)) {
+	if ((qos_activated) && (!is_multicast)) {
 		if (ieee->seq_ctrl[UP2AC(skb->priority) + 1] == 0xFFF)
 			ieee->seq_ctrl[UP2AC(skb->priority) + 1] = 0;
 		else
-- 
2.30.2

