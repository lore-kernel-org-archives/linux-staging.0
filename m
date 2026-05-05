Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235954921B2
	for <linux-staging@lists.linux.dev>; Tue,  5 May 2026 21:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778015609; cv=none; b=Rt+1pjzIHVXv0yipA4RRD5kEWg5vrQlCM3gLxREkKkjvwcEKgjcEftrB18pV9LHTvQEG5YgcI0GevwAfEqkM1nykuhgOl79sq6nRNJu5Kq8ClexKkHKvIgHaOsf9Z/hRVK2Obc/gDSffK4JvMGCToa/o12SHjWnry0NHnfN5hKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778015609; c=relaxed/simple;
	bh=yeZk9yOeTk35adoPsJ72JURTsAZ9MYmWZqZL5l4j7yw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qMp1YyI6kBOqhVzayrjFjkT/qyBhhPt6MClukcZAUq5jMHz0JGxbTUXZairFsLmG0vFYWTUKxjhfp1f8r0L11c5dQGG7O+JONkymVMwjZUp5BHGEHPdCf3O437uRXJRKe/wEs3gxQ7MLnH2C/Y3g6YfohWT331UnK2s5z1vPIUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X7UZMfUo; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7UZMfUo"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so89430925e9.2
        for <linux-staging@lists.linux.dev>; Tue, 05 May 2026 14:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778015607; x=1778620407; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3D1fo51a+Fqwvih6rAM0AOM8n9BMVTDWYpVR0qTGxW4=;
        b=X7UZMfUokQLywJZdO2NYFgNqLFnOZhKBcppIGdZR2LJXNJd63e1s/mF55rhnFr7qQx
         9pjiwNN6nIE0OnZDuetlBV7R8X9F2UsvTHwGHQlWhSQx2TCIT6g2aiTFpd2otIp1SoBz
         bwnkPKjhu9oGrs6P43jI6jo2hTfQTa8m+Wh+s7HjZoO/UdwRPIRQoT7xSf6OGYcRC571
         OBQwlfq/B0J2XanhLYW/YYO4MRVYn6lgwJNsht2ykTsqXGsaJ1IEZ0rnwu6RX63uWyKq
         uoy5ENH9LGQ1jb8saTdLJutstBU66cj04/E/6tOMLzhhmer7oZm0mQMz8rHI94jHJWr3
         da/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778015607; x=1778620407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3D1fo51a+Fqwvih6rAM0AOM8n9BMVTDWYpVR0qTGxW4=;
        b=Mhky6hr1KO32JYR9MVQdO8ANkJso8QXmVezFyby6LNMRfcCcBOFqtwoUTh0IPbikXl
         6G+mh4Z3fi7PI8SYCozTQD4eenLaN+ijrlr903g94+Al99IcAm33VXe5nmfMBXXTuMhl
         fGAHbdFRcgmu8Dk5Zo89SXnbyoVKThWgn/ysngDEzSPYVPezgra45BH8wNV0VC2yxInJ
         vLbtaq3I9K9eVcAw7pqbpAffCX7VuVrK2pnmMD2EL3Cd6ckFyVNfaHbvXjCK116Pkl/q
         Mdfyrsc5Xkz5Hs3d/iHnPrFVtIw+zJ7uAEUVq9gZeuwRncwysq2Ih9Y2KHOdaKTESH2x
         LGnw==
X-Forwarded-Encrypted: i=1; AFNElJ87nKUJKKinmysLhMLz8eiBd+xQ6eMSUqxhBDsrK4mOAHCfwLCXuwbNwHJ20JY18wTQXeW2dRnMKGsZa/sp@lists.linux.dev
X-Gm-Message-State: AOJu0YyREsMQD93+3d+AxDxaH2wCGJdM/qXfe5jEo0yYpIe7WOyeF+U1
	/jjy8P+5Ysu7+NYaYfrjWT3VPHx1VswSzNYLvMMeJSbqnO7UJI7qI2By
X-Gm-Gg: AeBDiestu5p5ow/CkXJHmxvJPcd9cSJi5xs5fG5rWDoCKgytL9Z2ZJjEGXeTbqZjanK
	p4dvF5Zaw8gEbjzgXlsdlUThgeDNSlepr2ekf1jgSx/snXDj9dXJ+WX91W6XyeHvteOy3kl2/3w
	5SXFRpBi1pizP6wwP67tV/EGIaxYg8eYNwsxk/yepPOob+d7sqnEtSKAuXeSAtIFLgwRAool5bA
	LB3Fx/oCX0Aojdnob+cVuD3uuGNU3jZETE2qFsXQC1oRDluG13aLr/IFb3xnuyMa6TJRs/hBlkZ
	G0MVhqtMAMG60IU+etX65yr5qr9jo9YvyJC0Hhi+tSHXZ1IJyFCjfOc0dFR7nmthotybiSeR8DW
	ZfKXkg2kiJ2oSO9xAXmM8M6rfOoahjppn2DAhPMfsWUBOUIQcbE/OYwNmwPApqKaxJvYo850oNr
	8iLy2QtMHc9HsptbNFFEXE8yC9qBYFzVSJzvr+M2GEUm2l6CeX9OVQq5eXkkrVUaJ0YgYyhFbmy
	RRl70TBJAjYgZPzGqrKCRacXD7ATHiRxDTOhDqp0EuyC/6CaeQy1GxDqtlTPGeo7WI5dh4=
X-Received: by 2002:a05:600c:b8a:b0:48a:5574:3a48 with SMTP id 5b1f17b1804b1-48e51f32bf7mr12038625e9.16.1778015606400;
        Tue, 05 May 2026 14:13:26 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb6fffcsm403400045e9.4.2026.05.05.14.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:13:25 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: error27@gmail.com,
	stable@vger.kernel.org,
	luka.gejak@linux.dev,
	hansg@kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH v7 2/2] staging: rtl8723bs: fix missing frame length checks in OnAuth() and OnAuthClient()
Date: Tue,  5 May 2026 23:13:16 +0200
Message-ID: <20260505211316.3837020-3-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505211316.3837020-1-hossu.alexandru@gmail.com>
References: <2026050453-scorer-rebate-3898@gregkh>
 <20260505211316.3837020-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Four out-of-bounds read paths caused by missing frame length guards:

1. OnAuth() reads GetAddr2Ptr (pframe + 10) without verifying the frame
   is at least WLAN_HDR_A3_LEN bytes long.

   The first operation on pframe after the AP-state guard is
   GetAddr2Ptr(pframe), which reads 6 bytes at offset 10..15 (Addr2).
   If the received frame is shorter than WLAN_HDR_A3_LEN (24 bytes),
   this reads past the end of the frame buffer.  Add:
     if (len < WLAN_HDR_A3_LEN) goto auth_fail;

2. OnAuth() reads the algorithm and sequence fields at pframe +
   WLAN_HDR_A3_LEN + offset + {0,2} without verifying that those
   offsets are within the frame.

   offset is 0 for an open-system frame and 4 for a WEP-encapsulated
   frame.  The reads at offset+0 and offset+2 are both 2-byte, so the
   last byte accessed is at WLAN_HDR_A3_LEN + offset + 3.  A crafted
   short frame causes an out-of-bounds read.  Add:
     if (len < WLAN_HDR_A3_LEN + offset + 4) goto auth_fail;

3. OnAuthClient() calls get_da(pframe) without verifying the frame is
   at least WLAN_HDR_A3_LEN bytes long.

   get_da() inspects the ToDs and FrDs bits in Frame Control (bytes
   0..1) and returns either Addr1 (bytes 4..9) or Addr3 (bytes 16..21).
   A frame shorter than WLAN_HDR_A3_LEN (24 bytes) causes an
   out-of-bounds read in either case.  Add:
     if (pkt_len < WLAN_HDR_A3_LEN) goto authclnt_fail;

4. OnAuthClient() reads the sequence field at pframe + WLAN_HDR_A3_LEN
   + offset + 2 and the status field at offset + 4 without verifying
   those offsets are within the frame.

   offset is 0 for open-system and 4 for WEP.  The status read at
   offset+4 is 2 bytes, so the last byte accessed is at
   WLAN_HDR_A3_LEN + offset + 5.  Add:
     if (pkt_len < WLAN_HDR_A3_LEN + offset + 6) goto authclnt_fail;

Note: a previous version of this patch claimed that the signed/unsigned
mismatch in the rtw_get_ie() limit parameter caused an out-of-bounds
scan when pkt_len < WLAN_HDR_A3_LEN + _AUTH_IE_OFFSET_.  This is
incorrect: rtw_get_ie() declares its limit as signed int, so the
wrapped unsigned value is reinterpreted as a large negative number,
which is immediately caught by the if (limit < 2) return NULL; guard
inside rtw_get_ie().  The actual out-of-bounds reads are the four
direct pframe dereferences listed above.

OnAssocRsp() was already fixed by a separate series.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
Changes in v7:
  - Add frame length checks for OnAuth(): guard before GetAddr2Ptr (len <
    WLAN_HDR_A3_LEN) and guard before algorithm/seq reads (len <
    WLAN_HDR_A3_LEN + offset + 4) (sashiko review of v6).
  - Correct commit message: remove incorrect claim that rtw_get_ie()
    unsigned underflow causes OOB scan; rtw_get_ie() uses signed int
    limit and returns NULL when limit < 2 (sashiko review of v6).

Changes in v6:
  - Add frame length checks for OnAuthClient(): guard before get_da()
    (pkt_len < WLAN_HDR_A3_LEN) and guard before seq/status reads
    (pkt_len < WLAN_HDR_A3_LEN + offset + 6).
  - Correct commit message: OnAssocRsp() was already fixed in a
    separate series.

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index dd3c94d314d8..b42eab61d8a8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -687,6 +687,9 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	if ((pmlmeinfo->state&0x03) != WIFI_FW_AP_STATE)
 		return _FAIL;
 
+	if (len < WLAN_HDR_A3_LEN)
+		goto auth_fail;
+
 	sa = GetAddr2Ptr(pframe);
 
 	auth_mode = psecuritypriv->dot11AuthAlgrthm;
@@ -709,6 +712,9 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 		offset = 4;
 	}
 
+	if (len < WLAN_HDR_A3_LEN + offset + 4)
+		goto auth_fail;
+
 	algorithm = le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset));
 	seq	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 2));
 
@@ -860,6 +866,9 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 	u8 *pframe = precv_frame->u.hdr.rx_data;
 	uint pkt_len = precv_frame->u.hdr.len;
 
+	if (pkt_len < WLAN_HDR_A3_LEN)
+		goto authclnt_fail;
+
 	/* check A1 matches or not */
 	if (memcmp(myid(&(padapter->eeprompriv)), get_da(pframe), ETH_ALEN))
 		return _SUCCESS;
@@ -869,6 +878,9 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 
 	offset = (GetPrivacy(pframe)) ? 4 : 0;
 
+	if (pkt_len < WLAN_HDR_A3_LEN + offset + 6)
+		goto authclnt_fail;
+
 	seq	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 2));
 	status	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 4));
 
-- 
2.53.0

