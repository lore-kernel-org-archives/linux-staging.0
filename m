Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793048232;
	b=MohUUiOaPqdXr7yeSgZDULU1nKA9v3Re5W8+YMQnpmFw4nXhAVDTMslz4lIgfnk0sOxN
	 TYs+bN9724Z6URVgP6Vpyz8Fq3mY3q8N3bACRAdHUSLx4PDxWQg4iy7hi3WQ6BZhRkC44
	 ZPrhOde35Aatpb9OgRwaFphhU9nv2EFgmPyvB695K3GeufTbBqe6VvBrxvsPn2SY5ZZku
	 RneZ6KdpzTIIYlA3BALBsBvSyUJOTGBbWWcvKUeu1FQrMj4v45iq8QcHEKbbfCcPfCkn9
	 ucGQQNHe99MMvLZCgkKOy8Sl0ZSaSpZyRT/vNPeHQAKFCvYP9eS27uOsLkSqRYfZIRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048232;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=s299POfyzmrQX1i/IaTXeUG1mmAHpsaqzKPXCh90kkQ=;
	b=vGkyHFJXP5Oe7gJvvZms9valwhM5HpuqwNmKR87aTqDwtNuLBw0UyBQOO2lN4O7GpXAH
	 cGnbyIrfpk+iwLDVAkc3aGKQvYThFHVvzKu5Acl74WbuaZXmgMxO5AkeW+zzZUqcEl92i
	 Mmkv8HcTOOafispkC6w0HRwy+78lGesdyK3g0U34bmvyoU/lvDYHM74jRnrTzwmc2r2H4
	 OSabR3u6RlU88H7dx/c3Eg0XMxdAF3VepJnnVCqEW5kwxMsoG0ZP1G9GhNtNtnTx8WaJO
	 stsM1bhyeN4Ml23BwJYafqBlnSw95xta6wJJQH8kDIfM6+32XeBvFCZf7/9+2ma804A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="AEKz8dW/";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB16606A324
	for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 20:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EB16606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AEKz8dW/
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso35161215e9.3
        for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 13:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793048231; x=1793653031; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s299POfyzmrQX1i/IaTXeUG1mmAHpsaqzKPXCh90kkQ=;
        b=AEKz8dW/loaQS6yG140kt3rp8JcaRau1UWAinibrBhuABXPsXj+bSeTBMoD8Kr1Tii
         j3M2OPQs789sMlh7oFYMiIPD4Gns3gmmiF++hM2WhoO1jOkI6uC19+MeGmfO9Df43Y9C
         SGx6FEmYc2qmMx1mmfXh5CEdXHVyPJIEspbNuGRW8iw2YiH2bKreNlPeNKH5N5vC93YF
         qfoX+0tQpJ0LH0UW9zcJgRzJf8956U7t/6PLtbdbCr3dj3+wyBO+zJmr6mqWoVVBMSUj
         HZlR2yGlkdv/ojgGBSHNcVl3GNnRXjZaqulxT10P3j43Mx/oCp09xl7OElr3LK9j/7bq
         leuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793048231; x=1793653031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s299POfyzmrQX1i/IaTXeUG1mmAHpsaqzKPXCh90kkQ=;
        b=tSDB832j2RZS1BfoGk8URIuhnrs2getu83bsyE0QlIPZ6VMEUXj0XChHH3wNYXwMO3
         hGcsnRw7CFXAZnUo0VNmtVamtZ1d7d9Z73fdeeac5Evh6Q93PUzsSBVGelQusvvc04hM
         6KewDwy/pp3p++iezDcJFpJQSRy0mogAOMvXzEjiWkHhSwfjCuRWvROHs0hR3vG+LbLv
         TQanav8UDMBALyeNm4Lp1gmqHzPHyydLQMCnsq2nZcgDOygogVzk5DVKwIVczQ1Vyp7q
         V5KaUhZEpTXj0qB0AMM3tBxnHrjmZMt2KRI1Y3hfTdxE4K1QtrKQERMBwdqFSQ3fTApX
         brRA==
X-Gm-Message-State: AFq9FYKMy8IU+IcM5xbkVdk8l8lo+C5Q5UUu/vrvOlrHOUac0fUJ4a6m
	1kiqYOLTen4rDAepxgfMKi354ENBDDT2nkoJgDjovG5jYMeb6/u2GII0
X-Gm-Gg: AYBFou0k0eGJsCq28XsD9tE+ITZcf4h/nt2Zpd/HEkKIDmNuItBVha12yc04qUrthAy
	qR2u+hnitlbZPVnhB+4slo9tmKTXTDiYZZUWLFDADbpAV4Lo2Oky3YaxG8cfGwyPIVtlTmZ1eWx
	iBfK6OYcy0HKbLmqZX+tt6PELhgtK/dMz0J78Xyjr826k2rzXCTWbBR3Ppcoq9BnJQg0Z53WzAt
	gqhBLUQN+B+dOEv8FoZFGCTkH/lONMIXRs3lP94dqqgyh2dhdPEBZYGb1GQSVBBC4B9TXPUfrOh
	8FbgZ7G8qLuZ9Q7Rm3nrb0UGLYNBDTjtH7VZEgI51AN623JDoa7sXBdayIFlpWFuMpbafegEdKr
	W7Sk3aOXxVoI/GP8foS/jSEOzab7SGgmhTr6aLbkdHr0+1r6kND2+1FVAJUDzUD2BpEVtbhR5ZT
	xlC0bPDOqCaYwNqBHrUxcZXmQ09ezVvx+Nt5kOtE1uZqgC7s7p1TAfg6CehnbeswHNHTchmrxBj
	+Vxr/qnKNdlxvQP1lNB8fow4opKus2xaaN0dL702AbD5e2lh08BQoaa
X-Received: by 2002:a05:600c:8518:b0:4a1:a49e:a925 with SMTP id 5b1f17b1804b1-4a35acebf0bmr155156235e9.35.1793048230602;
        Mon, 26 Oct 2026 13:57:10 -0700 (PDT)
Received: from pop-os.. ([87.248.177.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a029332sm193725085e9.4.2026.10.26.13.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:57:10 -0700 (PDT)
From: Albu Victor-Marian <albu.victor.m@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
	Albu Victor-Marian <albu.victor.m@gmail.com>
Subject: [PATCH 1/3] staging: rtl8723bs: convert rate and mode check macros to inline
Date: Mon, 26 Oct 2026 22:56:57 +0200
Message-ID: <20261026205659.181065-2-albu.victor.m@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026205659.181065-1-albu.victor.m@gmail.com>
References: <20261026205659.181065-1-albu.victor.m@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert IS_HT_RATE(), IS_CCK_RATE(), IS_OFDM_RATE() and is_legacy_only()
to static inline functions.

No functional change intended.

Compile tested only.

Signed-off-by: Albu Victor-Marian <albu.victor.m@gmail.com>
---
 drivers/staging/rtl8723bs/include/ieee80211.h | 21 +++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 9767013887af..9741daef3b87 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -152,7 +152,10 @@ enum network_type {
 
 #define SUPPORTED_24G_NETTYPE_MSK (WIRELESS_11B | WIRELESS_11G | WIRELESS_11_24N)
 
-#define is_legacy_only(net_type)  ((net_type) == ((net_type) & (WIRELESS_11BG)))
+static inline bool is_legacy_only(uint net_type)
+{
+	return net_type == (net_type & WIRELESS_11BG);
+}
 
 #define is_supported_24g(net_type) ((net_type) & SUPPORTED_24G_NETTYPE_MSK ? true : false)
 
@@ -392,10 +395,20 @@ enum {
 	MGN_UNKNOWN
 };
 
-#define IS_HT_RATE(_rate)				(_rate >= MGN_MCS0 && _rate <= MGN_MCS31)
-#define IS_CCK_RATE(_rate)				(_rate == MGN_1M || _rate == MGN_2M || _rate == MGN_5_5M || _rate == MGN_11M)
-#define IS_OFDM_RATE(_rate)				(_rate >= MGN_6M && _rate <= MGN_54M  && _rate != MGN_11M)
+static inline bool IS_HT_RATE(uint rate)
+{
+	return rate >= MGN_MCS0 && rate <= MGN_MCS7;
+}
 
+static inline bool IS_CCK_RATE(uint rate)
+{
+	return rate == MGN_1M || rate == MGN_2M || rate == MGN_5_5M || rate == MGN_11M;
+}
+
+static inline bool IS_OFDM_RATE(uint rate)
+{
+	return rate >= MGN_6M && rate <= MGN_54M  && rate != MGN_11M;
+}
 
 /* NOTE: This data is for statistical purposes; not all hardware provides this
  *       information for frames received.  Not setting these will not cause
-- 
2.43.0

