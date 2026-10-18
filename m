Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37956286A5
	for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 16:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792341871; cv=none; b=nke2gdRWOVCTAPxfSBA3rSy+sJC/LBjWk81GI16jj24EEiHph+DBfBg4bKl8gSYiMZodwYzFfGrLtDdLsLAkG6ZImM1FpZbyiL4KeMCNLbARO5DumRkYHGuf61QqP9kJHqpJz1CKyE8qdXrucFcjHvF/fKZrMagKMgZxp3HBZd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792341871; c=relaxed/simple;
	bh=xmKSzd6y7H5F5I8iOqTKJHpC+nO1N6svEATVQw+WmA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eTJ3GK/bQO2p6aQsT5gteGhYlNC7fua3TPCGQam+nED/+eBu4YkB4BYl95J3qUnk4QEdvOjU++fsIOL3eawHkWRmlbJ4C00wi9d/o+PY7fEYOlq8Lwz6fublZLPySJF2TsdLRRoJ5gvv97AmdMQ/c9/GZZ1mnU8Y4Eb5wvOkQw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fEoLScnZ; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fEoLScnZ"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3514b90bb89so3494113eec.1
        for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 09:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792341866; x=1792946666; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tjyLgG+lbAo9+1NVw/+tnv0kQ6Ik8T6x0RHmp6w96Tw=;
        b=fEoLScnZcOup3FQwMoaYvXRt78woerB84/fuA+4Fx92VzVaTVE7x0Ybi23oveOp4Vk
         Lntyipc0+GHYj8GyuZEx+q+5EJQ0l36XHsJckCYW2q/jr+jVYn2feisWrUc2U3P7Z05a
         /TE9G4OdqGYpxcWN2T0LxujdqOmotxRKq20Y0Dp6c9zSx26baq+TBdtpa6PnCzUd9Hmp
         pzuJHRlvhf1n7Qh3B4h8BGXTZikWaUX0aJd0HKIUYhHMRKT23UisUrfIOmHCw2FpUJDP
         I+yDuaB1Cek4cd78LbegpzTvZaTyO7ZlsC8dpPQxv/OYfH01t/dZYakQWmNJ/XImBNg2
         EXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792341866; x=1792946666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tjyLgG+lbAo9+1NVw/+tnv0kQ6Ik8T6x0RHmp6w96Tw=;
        b=BiPsSwG07cACIZeBl1AI6VfneTCLG23QhUvfidLAamo/HlBpFTZJhQl8ETAYh47GTF
         kaURTXbYf6i1xkYnt3VTwPc7jg2iPGcX5/f8OjFhxAMzlhCGWrS9fmdnTUIsd0c74/6z
         dtC8RitCZ1bgM6NJjyPqQkM7DvDiEuzkNysQUpwJnhIDryvnS0wllp45Jx2qo7W4hMrb
         caySLWQAVnxB7n1vhFdo2Y6IVy3JTXYg5S6DF3ntrTHDu0LnaOg/25r2YErxAMTfMl3S
         0c00XJG8dFqRv+EeN4XF2S/Kdl9hq+OKPddJgu5zsdMteiGNu63SWjdcgCon5nYE+Xl4
         P+Vg==
X-Gm-Message-State: AFq9FYLKgDLpIezHEC2dBOJOsFdXp4EJn8sOzo6qs+pe6Bx+ncFFSLyN
	uZ2+C6ELkPzR1srDIGWoMrRFIao2Lm+4kE2V3T6uaVcaYbtBtJH/tQFJIxDwN7RM
X-Gm-Gg: AYBFou2gd4FWVYJNWoUFRrV6I0LfqT6MO8T4R+W4MheH28dEiBIS1XdVtfhypbwOM5G
	++nRs/MkpnQ3CO1VYCxacozAVe6lhWFNCuDSX6Ec4Ii0ZacHjfomatppeoiVvq7XrkPsqlxZuG0
	iz6EhCKv76VAJPJ90P4OUUYXifGGckDVnaHF1aDAAUREm/Ow5vWs7ag1aqdyiLqJV8xjtlHK2TT
	7YqPvq5tizK4RQ9YcWkt7kNXbk2+X8mLmPplnIybfJUA95ThuDV4nI20Q2K2BFnW8q36rVNg3yq
	NC6lfhaoc2CaivZ1bPAHbmIxSkz3MzRJ29D9OIfLGZX90X3E4vPkPCxlhy9WyVx/ySzUDd/DKI4
	ZFhP+pf2QIbdB9nSrXs2RljmcxHeN3y1xfI0zlHD3rm4dtwl+9GLe8PNmg/u5wV4gghRZX4B28p
	d1iq8Vk0ZyS3/4hWdr8UuQbhOyFJERTXiX0/G5JxeVf0RxLrfoVKiGDE/ddLMfF5s71b52GzeOD
	aeZhi13civPf2oAgQ==
X-Received: by 2002:a05:7301:4d17:b0:35e:9562:ff1b with SMTP id 5a478bee46e88-361a3127f0cmr7590409eec.39.1792341865986;
        Sun, 18 Oct 2026 09:44:25 -0700 (PDT)
Received: from Vicious.localdomain ([117.99.24.166])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm31431363eec.20.2026.10.18.09.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:44:25 -0700 (PDT)
From: Ashmit Kumar <work.ashmitkumar@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ashmit Kumar <work.ashmitkumar@gmail.com>
Subject: [PATCH 1/3] staging: rtl8723bs: use PTR_ALIGN() for pointer alignment
Date: Sun, 18 Oct 2026 16:44:00 +0000
Message-ID: <20261018164403.14921-2-work.ashmitkumar@gmail.com>
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

The driver open-codes pointer alignment using round_up() with the
custom SIZE_PTR macro, or performs manual arithmetic on pointer
addresses.

Replace these open-coded pointer alignments with the standard
PTR_ALIGN() macro, and remove the now unused temporary variable
addr in rtw_xmitframe_coalesce().

Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 6 +++---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  | 3 +--
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 8 ++------
 3 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index ae64823afb8b..e9043104544c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -92,7 +92,7 @@ void rtw_wep_encrypt(struct adapter *padapter, u8 *pxmitframe)
 				arc4_crypt(ctx, payload + length, crc.f1, 4);
 
 				pframe += pxmitpriv->frag_len;
-				pframe = (u8 *)round_up((SIZE_PTR)(pframe), 4);
+				pframe = PTR_ALIGN(pframe, 4);
 			}
 		}
 	}
@@ -492,7 +492,7 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 			arc4_crypt(ctx, payload + length, crc.f1, 4);
 
 			pframe += pxmitpriv->frag_len;
-			pframe = (u8 *)round_up((SIZE_PTR)(pframe), 4);
+			pframe = PTR_ALIGN(pframe, 4);
 		}
 	}
 	return res;
@@ -977,7 +977,7 @@ u32 rtw_aes_encrypt(struct adapter *padapter, u8 *pxmitframe)
 
 			aes_cipher(prwskey, pattrib->hdrlen, pframe, length);
 			pframe += pxmitpriv->frag_len;
-			pframe = (u8 *)round_up((SIZE_PTR)(pframe), 4);
+			pframe = PTR_ALIGN(pframe, 4);
 		}
 	}
 	return res;
diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index ba7e53140bdd..a10672c11643 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -56,8 +56,7 @@ u32 _rtw_init_sta_priv(struct	sta_priv *pstapriv)
 	if (!pstapriv->pallocated_stainfo_buf)
 		return _FAIL;
 
-	pstapriv->pstainfo_buf = pstapriv->pallocated_stainfo_buf + 4 -
-		((SIZE_PTR)(pstapriv->pallocated_stainfo_buf) & 3);
+	pstapriv->pstainfo_buf = PTR_ALIGN(pstapriv->pallocated_stainfo_buf, 4);
 
 	INIT_LIST_HEAD(&pstapriv->free_sta_queue.queue);
 	spin_lock_init(&pstapriv->free_sta_queue.lock);
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 364de3c8d148..aded0cb27be9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -853,7 +853,7 @@ static int xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitfr
 			payload = pframe;
 
 			for (curfragnum = 0; curfragnum < pattrib->nr_frags; curfragnum++) {
-				payload = (u8 *)round_up((SIZE_PTR)(payload), 4);
+				payload = PTR_ALIGN(payload, 4);
 				payload = payload + pattrib->hdrlen + pattrib->iv_len;
 
 				if ((curfragnum + 1) == pattrib->nr_frags) {
@@ -1066,8 +1066,6 @@ int rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 
 	s32 frg_inx, frg_len, mpdu_len, llc_sz, mem_sz;
 
-	SIZE_PTR addr;
-
 	u8 *pframe, *mem_start;
 	u8 hw_hdr_offset;
 
@@ -1162,9 +1160,7 @@ int rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 			break;
 		}
 
-		addr = (SIZE_PTR)(pframe);
-
-		mem_start = (unsigned char *)round_up(addr, 4) + hw_hdr_offset;
+		mem_start = PTR_ALIGN(pframe, 4) + hw_hdr_offset;
 		memcpy(mem_start, pbuf_start + hw_hdr_offset, pattrib->hdrlen);
 	}
 
-- 
2.43.0

