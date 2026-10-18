Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8F9401A01
	for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 16:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792341876; cv=none; b=Who+7ns6/1a2vkL5+WXptl+7t/nMSqJDZebwkFadCKlWaENlOflE4SKgHKUWaTrUI+IY+lbFdaLKJA8GQSAau5m1cppkbiKSmfqfgWUCWhAF7HmLMfPET4+62gZv3iXgSomKrk6CbOtoCXoZkmZqT3IAx14+jsJN0lNf64CN+io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792341876; c=relaxed/simple;
	bh=LWPTncakzMA1NdKYwWnp03DoB2kYRjGmf51L1bPeqhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Af4YnM4lH3ZoipzHtcsglbJsL/PldE9xFIGNPRjZkOMq8bLiseXGvMoortWQFE8kv1NwTNx6QYbahKueRXhxJ3NtwbM/RSajE2FFZaXk+9iZkxGO+yp4qJH3O5SnF1GrPl4iePVL6cwYXBRuc0N6Y+zzgvXUEhL5NWW/cHXR/+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NQIhJsHX; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NQIhJsHX"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33fb4680717so1656365eec.1
        for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 09:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792341870; x=1792946670; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FFVVWVKO3HLX1qQu6kZSSrSNRYdIWUkeFrec4EBCv2E=;
        b=NQIhJsHXU+8z6od7QhqaTnEqCucwFUPH60RiwvvopzhfrnJQ0j5tbx/VsolXtLVWmj
         RYNffU8e3nX6eZ0vXXwYrBx+YMHu424YLAsa6JS3HRZzgTyC7Z0SH7aQCRQDd0JzMJ1q
         Ke449+embj1PBobAzCPAmXEzNg0r+bmNs5qCJTQO8NU5bHC/oUmQ/uoQvRCDH9wIWEgP
         8I8jo8Nucj7B4w5aaqZanr9gCAd0zybTPBh4lYo246NLd2k+apEuyuMNiQtounpDyoLY
         o/ePerw4akf3AG4H+VX8D1brPwCgkhj8resyd5mbQNVazmA/MVisrF2VyjJW2fO7yl6t
         /JEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792341870; x=1792946670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FFVVWVKO3HLX1qQu6kZSSrSNRYdIWUkeFrec4EBCv2E=;
        b=TaNO82yaJ2f+Q2EWoEgKOxYOPeaUDdlWvvxHnDUFCF1ZopIuC88QOxXBYFhqjkcpe9
         SdMBjMemBRfYk/GuhhUDBpKKtAHFVXW5XEAA+OD7JE/2nZ6pnczohSRe6gSaJV2eYs/R
         ac/xm2iT8QkFW7i+Ji2EUl5V4P5d/7rGoM8ZsRcJIElO7U/l5l83oQJhPnf1ps7wMBHg
         cE3gquAfakTEjortUPba6ys56QeYbBpcOcsNP+odLfyJBczqOVEFFcjuiCTMei69xWqg
         QoIy4/h/G8JtPOGVhNuwXi3aYeL3sgwnOWYvEiPhYPzbucP+2Fspuvm27+WIERr/xWiM
         xN1Q==
X-Gm-Message-State: AFq9FYLcTxffOb7z/db4w9PjbIpLBm06QjUAxQDxyFMKuxSjCA+0hrdo
	gCk9fe/SLNkNxK5Z+tn9J+5A7xGuzATKYgI4htpEP+X7v9pFpVrwEZyuSrRscfGQ
X-Gm-Gg: AYBFou38quICCtAPqEX8iOj63Q9nunjk5Jpk1baWgvBi9ekTa8t9OmxEjW91noSYx25
	PIlDXMWdJUaQ40EKYxwhL0Pz76C+pcZnP4zf1SQun1T+UfBSlSlPOPpdyAX6XJdV8Zoay4Fjihm
	msod8hEi3DfSoXctRluA4Ou7RsS59nakUugOoGeVuYBi1n+Bw+txOxWtsL+UxAtFGPpKmid/ctq
	sgbE/vy49tEqjjXvQIqR5TckYcoad7mqMpu9sGECdhKkPpgxGTD7/NEsvL9s1e3lc/FvqGPfS2l
	nKKoLcssNkLLYWdJDLhu0YUxoNvTzDEaJiwnU+6Tp79I8AVswWcVH7jPWfli1spQgylqyZm/Qw1
	OtSbRTCL39ikSa/5kEVjoOck/HruXZv7mA6yZQjO2tgvj8Wm1ItKonLBlM3oMg6Fn04CTJ5vGUZ
	oymT/6todLPf34yImUa3yRTyukbU06W5/0QHIzJ7TwIOnP91TtH8PS4lRLN+JpUbLdsnQOyQ0dQ
	xdoIcdJ05sVbaNNqw==
X-Received: by 2002:a05:7301:2727:b0:343:fb75:a5f2 with SMTP id 5a478bee46e88-361a1865981mr7975622eec.9.1792341870232;
        Sun, 18 Oct 2026 09:44:30 -0700 (PDT)
Received: from Vicious.localdomain ([117.99.24.166])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm31431363eec.20.2026.10.18.09.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:44:29 -0700 (PDT)
From: Ashmit Kumar <work.ashmitkumar@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ashmit Kumar <work.ashmitkumar@gmail.com>
Subject: [PATCH 2/3] staging: rtl8723bs: remove unnecessary pointer-to-integer casts
Date: Sun, 18 Oct 2026 16:44:01 +0000
Message-ID: <20261018164403.14921-3-work.ashmitkumar@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018164403.14921-1-work.ashmitkumar@gmail.com>
References: <20261018164403.14921-1-work.ashmitkumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pointer pframe in rtw_mlme_ext.c is cast to (SIZE_PTR) before
being passed as an argument or evaluated in expressions where it is
already a pointer type. In xmit_linux.c, the buffer length was
calculated using unnecessary casts:
(SIZE_PTR)pfile->cur_addr - (SIZE_PTR)pfile->buf_start
where standard pointer subtraction pfile->cur_addr - pfile->buf_start
yields ptrdiff_t directly without any casting.

Remove these redundant casts to simplify the code and use standard C
pointer arithmetic.

Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 8 ++++----
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 511eccf5b5a3..9e89d4a0392d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -707,8 +707,8 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 		offset = 4;
 	}
 
-	algorithm = le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset));
-	seq	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 2));
+	algorithm = le16_to_cpu(*(__le16 *)(pframe + WLAN_HDR_A3_LEN + offset));
+	seq	= le16_to_cpu(*(__le16 *)(pframe + WLAN_HDR_A3_LEN + offset + 2));
 
 	if (auth_mode == 2 &&
 			psecuritypriv->dot11_privacy_algrthm != _WEP40_ &&
@@ -856,8 +856,8 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 
 	offset = (GetPrivacy(pframe)) ? 4 : 0;
 
-	seq	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 2));
-	status	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 4));
+	seq	= le16_to_cpu(*(__le16 *)(pframe + WLAN_HDR_A3_LEN + offset + 2));
+	status	= le16_to_cpu(*(__le16 *)(pframe + WLAN_HDR_A3_LEN + offset + 4));
 
 	if (status != 0) {
 		if (status == 13) { /*  pmlmeinfo->auth_algo == dot11_auth_algrthm_auto) */
diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 6ee2a1f29aa4..91ab0f8bcb69 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -9,7 +9,7 @@
 
 unsigned int rtw_remainder_len(struct pkt_file *pfile)
 {
-	return (pfile->buf_len - ((SIZE_PTR)(pfile->cur_addr) - (SIZE_PTR)(pfile->buf_start)));
+	return pfile->buf_len - (pfile->cur_addr - pfile->buf_start);
 }
 
 void _rtw_open_pktfile(struct sk_buff *pktptr, struct pkt_file *pfile)
-- 
2.43.0

