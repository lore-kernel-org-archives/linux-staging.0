Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D979F34CFDB
	for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 18:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768156646; cv=none; b=Atr0Q1D11sUePsk0Orn1EEdMyvTJLH+U2lExG5dIdWNH99kgp5qNFo+6aLW6PsCZhMpvtefoHy1Ym1lsIB2MYWs126P9W8P5RMYLIblP9dQZgwviYWXHFzVa0PLUup9hRYNfTI6qyYyDoLVf2VKAoFRyzxign1sj6bNVaHT9qwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768156646; c=relaxed/simple;
	bh=w8McxZgAmJ5kY6yzWHrQrbxiKWvgGFbEdycBC3TzNOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=utNTa1TAQlVm12b2MQgAXKUIskW6n2pAGwwvdV4P3fKI7KCfoTEMhSKn3bDMrwWz3HEqDd8A7iRb4phnbtpUWz24qrvi8TQ32bHk52hZPhvt3cXl0VgbtL1Hnlo2yQGkulpnrgNbi3MfXdttUlBjf3XYM/77JnSoAWyDes2dw/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bxj6DjBN; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bxj6DjBN"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a0833b5aeeso57762925ad.1
        for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 10:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768156644; x=1768761444; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6Jameo3+/nnme15NzTiR41yWGBTy740AQjZBOzHmF4=;
        b=bxj6DjBNGKbuqKbiGdBRSzVeCWY7ROfu9IZwv449Inh1lFkoV7fm/xOHE56sTmVGVu
         +NDAueVqzVAiieMNP0dm3jKiACGwzT+1W0bbZrvd++ygEIjxzZOl/dGHF48tOOH4o+rl
         7ysKvHd2QDpRZQKxX+0HGNBFbhVKYvDck1wLX7Jkh7Y5yWl7xjwDogwnj14UCfO5e8yG
         h2OfayVkF+1vDqceov7H+QjU9FQ7VARIE1qF7n3M/1ZasFKISeWgZq8zfGk4OTC2t2U6
         SEIfxUg9SwiWsd647wdvxEHfjyiEr0lh5eqa6oW8nIrmuHjdl7s5uzREZ1bpfmKckEZD
         XRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768156644; x=1768761444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x6Jameo3+/nnme15NzTiR41yWGBTy740AQjZBOzHmF4=;
        b=WP4GTqNE5nhPHxcH/IrvukeAHQZJDtDIr8VjG08FSvkuBct++NqhjXlaHCKY2CClkJ
         0dYQbGNFPwKmhz8SK3nS1DZDVI+JfORm8oULSZopogum8V2oQbSFG1eJmegzOvb2kaAU
         5ogFf341GYitnUcTjwev1pREbHBSCgn6Pme3jWwmmnSp//KwrvlKoBdll96Cs7n1jbOj
         TTOSnrbkce+R2Bxw6/g3zR7IKkhpPXd+KLZGOd/mHlGcsgRHhLf2MBGaXtzAQkC0684J
         qTR0pbN7N7yNdIBokN+IiXICicX/TXF7LbFWo/ic57bgufSWKPengC7QiJ5J2QAhQBGP
         KVbA==
X-Forwarded-Encrypted: i=1; AJvYcCWrnSh5FFjMcK4HgF36RRrtxAgQDrTrn6Y7T15aerOVTgfA1mTzEXJx5WaH5uzI2MC8eFe23W6UdIyvvtH2@lists.linux.dev
X-Gm-Message-State: AOJu0YyEioUxOaa9ir2WUbZHru00O7f+m1FPXxXgeM0N6fsYIYiDqXc/
	CIcx0jceceJwFN9+UbiTzMYTS7GDki+MSndqNSEF2Qz/kljNDvzCyOEO178iwfkP9YA=
X-Gm-Gg: AY/fxX6MdOVmQXOPXrR6VABiZ0W55TYWwS9iIJ13dJA059nxLBucPVjKfo1p6D4bKhv
	JUvwmjlaAwj8u/GpvSnP/KdIWoWR8ERJfnmXibFt8pX1Z8EK0mlN5MZYsBZwbDMaknR/mkmKmbU
	GpDdwZVPPZwBY+HVaV3n1JYOmXxIMLkfEPbb8kTQwuBkS3P3SU5GOfIoo+h2WHfqo0YmjwDjgdP
	pAo/yIcLmY4fSxwjGSpCe7rhK6gJbq7abw0l+iNzahKEueyimi/ccrnsrtdqbA8i7f4/byfZSCe
	2T1FbUFrfVRsqACOFm3HML+s27LFT66+uM8Lymj8L6t1QUO7kTkOi6YZt0aMlfQXsy/6zc1fRRo
	39tkg4cT/B/3eDTUNTQGlyAajWP8dP0ZtVK59ZD8Jg/f2ZBVCWYPLjb5OnaZgjaqI3nJdqzLpXv
	HkCCUtit7XE5seWLRpvmjE9yt9FTbbdiD00AU=
X-Google-Smtp-Source: AGHT+IE42+urqLAp87x3CNbPPmR98e2ft6TqH+1trqp/YTc4v93NAdWSSv4QOD3ldzPnHfaHmwzaLg==
X-Received: by 2002:a17:902:d507:b0:2a0:9081:8a6 with SMTP id d9443c01a7336-2a3ee437d3dmr158737505ad.20.1768156644190;
        Sun, 11 Jan 2026 10:37:24 -0800 (PST)
Received: from snowman.bbrouter ([43.241.121.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd2953sm152220415ad.86.2026.01.11.10.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 10:37:23 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH 7/9] staging: rtl8723bs: rename local variables to snake_case
Date: Mon, 12 Jan 2026 00:06:28 +0530
Message-ID: <20260111183630.12816-8-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260111183630.12816-1-khushalchitturi@gmail.com>
References: <20260111183630.12816-1-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename local CamelCase variables in rtw_xmit.c to
follow the kernel naming conventions.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 418ca141e656..5852209c702b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -401,10 +401,10 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
 
 			/* check HT op mode */
 			if (pattrib->ht_en) {
-				u8 HTOpMode = pmlmeinfo->HT_protection;
+				u8 ht_op_mode = pmlmeinfo->HT_protection;
 
-				if ((pmlmeext->cur_bwmode && (HTOpMode == 2 || HTOpMode == 3)) ||
-					(!pmlmeext->cur_bwmode && HTOpMode == 3)) {
+				if ((pmlmeext->cur_bwmode && (ht_op_mode == 2 || ht_op_mode == 3)) ||
+					(!pmlmeext->cur_bwmode && ht_op_mode == 3)) {
 					pattrib->vcs_mode = RTS_CTS;
 					break;
 				}
@@ -603,17 +603,17 @@ static void set_qos(struct pkt_file *ppktfile, struct pkt_attrib *pattrib)
 {
 	struct ethhdr etherhdr;
 	struct iphdr ip_hdr;
-	s32 UserPriority = 0;
+	s32 user_priority = 0;
 
 	_rtw_open_pktfile(ppktfile->pkt, ppktfile);
 	_rtw_pktfile_read(ppktfile, (unsigned char *)&etherhdr, ETH_HLEN);
 
-	/*  get UserPriority from IP hdr */
+	/*  get user_priority from IP hdr */
 	if (pattrib->ether_type == 0x0800) {
 		_rtw_pktfile_read(ppktfile, (u8 *)&ip_hdr, sizeof(ip_hdr));
-		UserPriority = ip_hdr.tos >> 5;
+		user_priority = ip_hdr.tos >> 5;
 	}
-	pattrib->priority = UserPriority;
+	pattrib->priority = user_priority;
 	pattrib->hdrlen = WLAN_HDR_A3_QOS_LEN;
 	pattrib->subtype = WIFI_QOS_DATA_TYPE;
 }
-- 
2.52.0

