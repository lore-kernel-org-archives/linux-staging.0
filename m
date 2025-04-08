Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D4E1ADC8D;
	Tue,  8 Apr 2025 13:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744119151; cv=none; b=tBpCjE6D3aQIT0Wd903H+qP3ffLw5Jv0uo7kHXDvZxUJDjgx6hqE0qmgsHf/ynTQpeOPexNfKmtlBOv4F8WmJOIxt7D8BWcysOGAuOhPdMIQuNyrY0Vha9nQZVXB7zc6aUUONuJb1MJPsD+G1k6NEBJIm1cXyGoYpy6dDxOBtn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744119151; c=relaxed/simple;
	bh=lWsrQEzNqzjBfUgCQgg/t3kJreBAVX3Wp1jmrt3C+VU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hcZVQryYX2DHKDAlQCIPy68bmxYZvLSHLFJk1ZZVlRNeTw+YfTS4t84QL6ipuUtW8cVjCGethSjMLUxuagjJ+iqCZcuAwEbhcttqU8NRolHzu2TBldXy5NqZTZADM0m3NDvm7/jErUqJjksBNInSGXK6JsCY3IxBmbKvHx5OZfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekl4U/Zj; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekl4U/Zj"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c5b8d13f73so583843485a.0;
        Tue, 08 Apr 2025 06:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744119148; x=1744723948; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfztqMVKNg0/SZeeg1Ddj2nw5qVrzuwCYVhV7uuKNoQ=;
        b=ekl4U/ZjQOXMjV8rXsGuFpKC04fkO3+8vqshH9f5kU0swk61QfkUbejaDOHL6avk1R
         KQ66w+8ScURN/ug1YDDou8cIziH+dbCE9CDJLb/YdOJHTZx5zyPx6d56xOE8ypUNxIh0
         Ts/1YSDf789HjGUw+2+l6gRyypOaa/ig5p0eCdAEeP2iV6VMkIkQqzCD7+HS9NZ9vycf
         iYlKNTglInY35Ni6jvAzo+VLD6ECPR6TCzLPh5JmYyDjA4x2oZ1UVyKf2cj+QRc25lPH
         Ce4fTGNzW0ghBspej8LaNezd+n9q8UptHyd7fbKR6wmbv3MLW14K77GS012REmKTGvNr
         uRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744119148; x=1744723948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xfztqMVKNg0/SZeeg1Ddj2nw5qVrzuwCYVhV7uuKNoQ=;
        b=DHqSK4K5xh52BYeXmpDfBl2ImE4VF9b0nAwc0WU/2PzQAkgbWj/2ZYHQcKMtZlec/2
         1FpbFs6GlgAxBKC0AfduKSC18C5XXp72WKen0MHnwc0UqYyCL1gt/4UdhKSJyu63z+xk
         mEhnltmOPtbgN14Wtq/1OjcRwk0OoQkteNwgV680qqooehx+0xdHfcZLQ+iboBxl5mE0
         fyUS5ibxW68VFWWC1QLPVK5pCE6fSmTOF6F/2/HAElwbialN24TYmAE9c5bBDQKveoFp
         xSus6tfSdBoDGOWKyJyKI47Yl3a5XL5zNUDPeiwsrpWPe3rdBOHgNdDaUYoQ9kZouzsM
         4xjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXi4EDHJncQFO4CL7cQgoSxOvnYmAaHatlCsjwVAiN889+YlVZ7v7HVLodKP7jKNmBRsF8NNXnWScyACsnv@lists.linux.dev
X-Gm-Message-State: AOJu0YzSFytNVmatpt0JzK3IC0j5g44jWSusKoQjpMLL+tTjIZC/Kxo5
	sbpNm6l3AePjTYSBR6L90ydJftH03l30QFW0Y3HA6n0VfZBw3yYp
X-Gm-Gg: ASbGncuBp6lSWHFXAZb28NBHMru0x8JtzHSmcY55HBCulWFqOX+SHWKYVzjX0Uc8nuq
	fTFk5l0+stx/qI7HSqyKa7tfV3AE8tc/5aopipW9lxJZuKnTtZgYC8DX+kmUy/BcioPtixaDLhq
	XYxnujo4I1S2UIqobRnbWGCz+B1a6udndxzh2x7IsUjjBBIw6PO96gJMRzwI7Lqh8NTWJzgj6yL
	JBTRxKxvUx0NQOCxMwk55Hi5nqbY8/gfYns8RyUqWLIXRM6I7cZjJBeeBFty66lFZpAa/5Np6x4
	ogghWZ7iqT0UfvpfphWq7XAGw1Rxtym3VnseJhVe0I12BPo=
X-Google-Smtp-Source: AGHT+IHRe2pR2pJowlyrKsIN0u6V7E88s/zkQejK6Cne2C22r80j/QC+KoIH7VUQQ4Mi/eo0ECKN1A==
X-Received: by 2002:a05:620a:28d3:b0:7c5:60c7:339 with SMTP id af79cd13be357-7c7759ea8b9mr2362665985a.9.1744119148274;
        Tue, 08 Apr 2025 06:32:28 -0700 (PDT)
Received: from ubuntu ([105.117.1.177])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76e75b72csm758082785a.37.2025.04.08.06.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 06:32:28 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	julia.lawall@inria.fr
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	dan.carpenter@linaro.org,
	andy@kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v7 2/2] staging: rtl8723bs: Use % 4096 instead of & 0xfff
Date: Tue,  8 Apr 2025 13:31:42 +0000
Message-Id: <c71ec1f13a2a5cc38a745314f134f6e7eb935227.1744117091.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1744117091.git.abrahamadekunle50@gmail.com>
References: <cover.1744117091.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sequence number is constrained to a range of [0, 4095], which
is a total of 4096 values. The bitmask operation using `& 0xfff` is
used to perform this wrap-around. While this is functionally correct,
it obscures the intended semantic of a 4096-based wrap.

Using a modulo operation `% 4096u` makes the wrap-around logic
explicit and easier to understand. It clearly signals that the
sequence number cycles through a range of 4096 values.
It also makes the code robust against potential changes of the 4096
upper limit, especially when it becomes a non power of 2 value while
the AND(&) works solely for power of 2 values.

The use of `% 4096u` also guarantees that the modulo operation is
performed with unsigned arithmetic, preventing potential issues with
the signed types.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 9ba3bebfc8bd..db5f1b931530 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -943,7 +943,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 			if (psta) {
 				psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
-				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
+				psta->sta_xmitpriv.txseq_tid[pattrib->priority] %= 4096u;
 				pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
 
 				SetSeqNum(hdr, pattrib->seqnum);
@@ -964,12 +964,12 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 						pattrib->ampdu_en = false;/* AGG BK */
 					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
 						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] =
-							(tx_seq + 1) & 0xfff;
+							(tx_seq + 1) % 4096u;
 
 						pattrib->ampdu_en = true;/* AGG EN */
 					} else {
 						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] =
-							(pattrib->seqnum + 1) & 0xfff;
+							(pattrib->seqnum + 1) % 4096u;
 						pattrib->ampdu_en = true;/* AGG EN */
 					}
 				}
-- 
2.34.1

