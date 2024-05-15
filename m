Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048DD57CBA
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 04:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748769; cv=none; b=odecSkoh4artwmD6404aINeqfs5Vq49io/PjxGsTEy9AbK4LFifHCjVfNY4mITRk+ZLBtdIFMxUdJWARCOo0CnaQtrO+xpFl/nERrIHqothz+2XKjgHcqtv6FgIBOTHdYuK2n2X1R7G9JLKdA7hUPHmhWxQWdzym6f/zvlWPG9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748769; c=relaxed/simple;
	bh=j8FIoUecn1AFzIJ3lRcqU8BJfgd9wlre/NP/eWzugKk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oSeqUNT87QL7wO+2VqUIar7ZmDc39iThOAyeHmMB+XjFTrPaU1XggbFRUCyX/YGw5NsuMNIOCc4kwS6hqz3uDM5YTrPxErpUCECFG3c8m8SsyRhTXJrlkdx0M+ppSmHay0zaAnWevOp0NVpXbfFXON+fzEft7SVSrbJBmjINAZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=IoB3lOe2; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="IoB3lOe2"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6f449ea8e37so5520163b3a.3
        for <linux-staging@lists.linux.dev>; Tue, 14 May 2024 21:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1715748767; x=1716353567; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zj4L/CHdV/htnUT6J3pcKdpL1c2PJObvzofLSI2WZDA=;
        b=IoB3lOe2c18e4JSps2UOWnKheM6yyYmK37MXVaRX+2dT8ULMPCnQKum8eHT03q8YXd
         /X/muhh8nmSF54gd+NoUBMFdadQDlrJS8Yhs/XzjMcWu16f02eUoMEHerMFSWufJLle9
         8EWuz9JSxYAOsCCxU3K1guJ+R1bSULul3EFXAXqneJiHbYwgtnUVYRWlQj7UuQU1X+GI
         k75fERoE2sGe0eL7sYjopL0+//DhbvO6x3vGQXeMHXQ4A8wGLWj8biajga96852B2i0f
         jObe1DtL96cIjxxWI9jvpf9DtFALOX+unRZ+nRnW2Bvvq/78hFoPq42fvCsiEb0ubfSI
         L8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715748767; x=1716353567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zj4L/CHdV/htnUT6J3pcKdpL1c2PJObvzofLSI2WZDA=;
        b=re5TGnl+0SYIuxZStjKXUV8FBZhEY28xewfxmJOty57ZkjZ7xpt1+Nuef6jcZhNdmd
         xiZaGqC9lfkDH1tyOvmfiF2+AhaCPPVjFDhBPKZSieg24n42EkcxxqFUvkwUpEFAAgoZ
         DfEYCuut3gI8Tz7p2elwOCDTSPiB463gNpd4dO4NAM1AHsw94AiqR5BMYrg3Gh0y5fdD
         ebSBX/zf6JuxSFoCt980jv+py3K9Fz0pmAyHj+orQVGfhOlIrtlqmRAkv0eDMKKp0nCm
         r95lftZ8qTwfetKRP2XgDVModCK0WhD92sSHw4Vy67tN4R4YxiPAlxfZ+LQemgD69QYR
         4pXg==
X-Gm-Message-State: AOJu0Yx19W0NsXxPXFPslrARZjXDt3vmqeZBguI4Pcp7Xu1uREI2w+dj
	dKbr+Ds4HgXrp9JXwp98DC9aO5/JDme74GdQDkafq2sjN3qXhN+S1AcdWxNP+WU=
X-Google-Smtp-Source: AGHT+IHF+M70lFpwqTCc6v65QxOTVhynetMH3XiYC0SKHvlzoeD/Pw5xt6gI4J6VMcFzNRb0oD2LVg==
X-Received: by 2002:a05:6a00:1250:b0:6ea:b69a:7c78 with SMTP id d2e1a72fcca58-6f4e02b0b73mr21621527b3a.14.1715748767229;
        Tue, 14 May 2024 21:52:47 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a827fdsm10135035b3a.60.2024.05.14.21.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 21:52:46 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 18/31] Staging: rtl8192e: Rename variable LLCOffset
Date: Tue, 14 May 2024 21:52:15 -0700
Message-Id: <20240515045228.35928-19-tdavies@darkphysics.net>
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

Rename variable LLCOffset to llc_offset
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 0db75fa7da1e..3223619f8cd9 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -728,7 +728,7 @@ static u8 parse_subframe(struct rtllib_device *ieee, struct sk_buff *skb,
 	struct ieee80211_hdr_3addr  *hdr = (struct ieee80211_hdr_3addr *)skb->data;
 	u16		fc = le16_to_cpu(hdr->frame_control);
 
-	u16		LLCOffset = sizeof(struct ieee80211_hdr_3addr);
+	u16		llc_offset = sizeof(struct ieee80211_hdr_3addr);
 	u16		ChkLength;
 	bool		is_aggregate_frame = false;
 	u16		nSubframe_Length;
@@ -742,16 +742,16 @@ static u8 parse_subframe(struct rtllib_device *ieee, struct sk_buff *skb,
 		is_aggregate_frame = true;
 
 	if (RTLLIB_QOS_HAS_SEQ(fc))
-		LLCOffset += 2;
+		llc_offset += 2;
 	if (rx_stats->contain_htc)
-		LLCOffset += sHTCLng;
+		llc_offset += sHTCLng;
 
-	ChkLength = LLCOffset;
+	ChkLength = llc_offset;
 
 	if (skb->len <= ChkLength)
 		return 0;
 
-	skb_pull(skb, LLCOffset);
+	skb_pull(skb, llc_offset);
 	ieee->is_aggregate_frame = is_aggregate_frame;
 	if (!is_aggregate_frame) {
 		rxb->nr_subframes = 1;
-- 
2.30.2

