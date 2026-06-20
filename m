Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432D8145FE0
	for <linux-staging@lists.linux.dev>; Sat, 20 Jun 2026 01:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781919575; cv=none; b=eCKbEW7HueTIzKkEecrSm8HathkajrrOK0HwldOzOj5jb0uCjLqGKiV+08AfKR2k/YHfgkHA3nVHdZFXIh4bmXdtrUbjOepSN0qFlgwqSJ4AUgWajX6OpJ07qtzIfUewyhMYJT4Gp3TG70DeojLH1DojJXsXdo5g/GbtCdFXz3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781919575; c=relaxed/simple;
	bh=rDuOoxdcgI0KszSBN3TWAKf4cpLef362S2a5BVx5o1w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KkCBMjKfv6xg2v1KzV8Z0unDNPJzT0ZEXVEmF93hcEt44vwQfoI0fwkC4StFIcbKdlVdXBqCIkKEuck1WYkvTCS9TOpnbb6H/M9GLIvSrkcNUlT1JEWpk7yRxY0EwSZ+LkQluPWTZGAAnad5N5wI/rQupplUsYdfuXt7Aa7ZA1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TRrCskCL; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRrCskCL"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso26227325e9.3
        for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 18:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781919571; x=1782524371; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lQml/dQoNRoOrtzXJcX3X8rhBdmWU63cHcWrMzfMNtE=;
        b=TRrCskCLweTeMv4vof3LVyVIgPjxzpQR+4FCMIjtsQvG3CCfDdrZW52DgM/X/+XbY3
         FAG0c2bkbsx1HJI9UHgwsMMwxBXvuN2mCe/lrnFJbz7P6ev7duakcHgfvKbtU1LqpJ8v
         cQBjvalrR+4uGZ91vx71nX9duJn2UZayRTFANOm0KBhbxmt+yZ+9GP7DRnrkPwWAlfGX
         MNBwt3WwQwSxyCJFFFZHWvfQWQqhBAD0sARp4dGN2gLOc3GhY0cGmK2beK9sGNa95uhU
         2/DD0wKtCLxpCh8v0gAQIHdUlMn9s0WCNq2sPKifsx+lHVd1CGd8e+BwHQZ5dPfDEfIq
         BuQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781919571; x=1782524371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQml/dQoNRoOrtzXJcX3X8rhBdmWU63cHcWrMzfMNtE=;
        b=g/CeLmFW/feKxZQveB+epoLwVDEiqpGp3qVYJ1CUd12Wuy+qdez1HvPFdxG7/yeidy
         EUOABwKE6KrC7nixQfNa+5OBiKG8kd6BGM4cgp9mmLdo5xwRLJwkv7va5d5vmPnM859a
         dw16PSxTC1lNmGjvO1J78gU+tKInQKQRTCaDcGOiuovtN0+SImHiYv+Gk3Na0Xtdxk56
         3SG3Xpb8yHGKW627GawBFR4WY1fsZsGdLG5+pTI9fXiemZIXmjvqxuGC5Y8dCmVV/W5M
         dN+IB65ngdf5PeWMw0tcTHrgZt8nBYAZS73Eu1d5kvQIGpzjJa1j+NaA8GajDX98ZLN7
         NoSw==
X-Forwarded-Encrypted: i=1; AFNElJ+AzVpIMvzfmTHrfOBMEfgCE51PpwSa/ErIW93KupvbIGpnn4VUn6S8+uLevL0yR0J+OuP6HhIh16oulpHT@lists.linux.dev
X-Gm-Message-State: AOJu0YwfsRRsuEjy8srh0M1t3r3OQNIGkDJMyB2op7M1fYYqDdtWxV0D
	JJeL3U6qWzrJ8zi/fUKYcl8nQX5TTYG0+XhCuCZi4rSAiycelI6d4/ox
X-Gm-Gg: AfdE7cnHgblW2NBZtJToubH2mqCW+1ZDItoL+WOU1BzFogZ1I1Bg2UwBRfIQHBRma3b
	286iw9ZRdYRqjyECZXEl8AKZTFIHVL6IsUMDuNr9G/KnFNajo/kkQf4LSjyhbM8o+xbSEmYNj73
	ATx9eP4jTlgU5QkQ5E7lzK5UMkc2I+DcoGHEQOewc/U6/eFM8FTAGxgWfGwhckZkjb/M6at3s32
	yFbOseKfgEi+9k8fXBcORmMv6417rlYgVcdMebhZyIjZKGxHn9tY0wCx9m2qaXUeLL1jWkoYloU
	E9IGa0jx1xB+o5dpDPkgARVhEWVSsB6dPoymuXF6FOMCs33pv/Mp0IGK4W4etsDdtGiFR757LUI
	g/Hr/I2cgGxvqo/z7Q/szQ++jxRyY6SVO5WFdpuzUy+2wYKXJrWqJffOyeWQ/vQRgBYsiqJOh13
	RajtubaD91fxZbnUWq/j4ICOKu9RqPB3BIT1TF/OfG
X-Received: by 2002:a05:600c:1f94:b0:490:d354:bcef with SMTP id 5b1f17b1804b1-4923f59cd4amr106655995e9.33.1781919570536;
        Fri, 19 Jun 2026 18:39:30 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c7:f906:cb01:1464:e869:8c77:e722])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fc47720sm166454045e9.0.2026.06.19.18.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 18:39:29 -0700 (PDT)
From: Christopher Mackle <christophermackle01@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Minu Jin <s9430939@naver.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: don't drop short TX frames in _rtw_pktfile_read()
Date: Sat, 20 Jun 2026 01:39:16 +0000
Message-ID: <20260620013916.7148-1-christophermackle01@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit bc4df274dca6 ("staging: rtl8723bs: update _rtw_pktfile_read() to
return error codes") changed _rtw_pktfile_read() to fail when the caller
asks for more bytes than remain in the packet:

	if (rtw_remainder_len(pfile) < rlen)
		return -EINVAL;

That breaks the assumption made by the data TX path.  In
rtw_xmitframe_coalesce() (core/rtw_xmit.c) the per-fragment copy is
issued with the full fragment length, mpdu_len, which is derived from
pxmitpriv->frag_len (~2300 bytes), and the code relies on the historical
behaviour of copying only what is left and returning the number of bytes
actually copied:

	mem_sz = _rtw_pktfile_read(&pktfile, pframe, mpdu_len);
	if (mem_sz < 0)
		return mem_sz;

So for every outbound packet smaller than the fragmentation threshold -
i.e. essentially all normal traffic, including the EAPOL frames of the
WPA 4-way handshake and DHCP - rlen is larger than the bytes remaining,
_rtw_pktfile_read() returns -EINVAL, rtw_xmitframe_coalesce() aborts, and
the frame is dropped before it is queued to the hardware.  The driver
floods the log with:

	rtl8723bs ...: xmit_xmitframes: coalesce failed with error -22

Management frames (authentication/association) use a different path and
still go out, so the interface scans and associates, but no data frame is
ever transmitted.  The 4-way handshake therefore never completes and
wpa_supplicant misreports it as:

	WPA: 4-Way Handshake failed - pre-shared key may be incorrect

AP mode is unaffected.  The net effect is that the chip is unusable in
station mode on any kernel carrying the offending commit.

This was confirmed with a wpa_supplicant -dd trace on an RTL8723BS SDIO
adapter (Bay Trail): message 1/4 is received and the PTK is derived, but
each "Sending EAPOL-Key 2/4" coincides 1:1 with a "coalesce failed with
error -22", so message 2/4 never reaches the AP, which keeps retrying
message 1/4 until the handshake times out.

Restore the original semantics: clamp the requested length to the bytes
remaining in the packet and return that length.  The skb_copy_bits()
error path is kept, so genuine copy failures are still propagated.

Fixes: bc4df274dca6 ("staging: rtl8723bs: update _rtw_pktfile_read() to return error codes")
Cc: stable@vger.kernel.org
Tested-by: Christopher Mackle <christophermackle01@gmail.com>
Signed-off-by: Christopher Mackle <christophermackle01@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index dc0b77f38..9bdb67a8a 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -24,9 +24,11 @@ void _rtw_open_pktfile(struct sk_buff *pktptr, struct pkt_file *pfile)
 int _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, unsigned int rlen)
 {
 	int ret;
+	unsigned int remain = rtw_remainder_len(pfile);
 
-	if (rtw_remainder_len(pfile) < rlen)
-		return -EINVAL;
+	/* clamp to bytes remaining; the coalesce loop relies on short reads */
+	if (rlen > remain)
+		rlen = remain;
 
 	if (rmem) {
 		ret = skb_copy_bits(pfile->pkt, pfile->buf_len - pfile->pkt_len, rmem, rlen);
-- 
2.53.0

