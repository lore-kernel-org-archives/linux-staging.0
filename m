Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9BD22D4F6;
	Tue,  8 Apr 2025 15:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126969; cv=none; b=KkuFAa/bYox3rh8RSkxI86p/elxr/VU6vc25u7W0kAbhHlLH/j2B8+S9Esl/F+fTa0bUgjXpALt7VDSvFWAW0mvWmtBQCgyNMXgY/+aIz3Y6QhDNjjO8cogwv4WIauGoeXG0Qe3AWZzMnLtinHmaLZjdfZyvEQVtqpwGvcZ7foI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126969; c=relaxed/simple;
	bh=XmV/aXBh9Veoxhdvl7o8+k6EEukH7iNlTk+HsyVaX34=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CfBVxraoxzdQN+tEctK2eorpSA7pjNgCiywLmDh3CNMY8yxUxecwzdeMMlTSUdkQsg2yWwDDxelnJ+Y96MJ7yqOLD3KMmxJdg85MoWD2KYNVAoAhQmMEXpqtpcmMEeGzNHbre/oKZHKeQAK7AprZ+z+ZN2qa3pwgXofXzUmE2Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jSbgZ9bI; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jSbgZ9bI"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c07cd527e4so547008485a.3;
        Tue, 08 Apr 2025 08:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744126966; x=1744731766; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98XHZF4+/XGoFE4w7ezqiz6/KeSNziACB6nFKvABlAU=;
        b=jSbgZ9bIxiD+1X/min+eGDaoVofBzsLYmIHumUqmhfCHA/gb9v6wJTzWdayT05vLYR
         N2kwma22OmtuZetBzrQrO6Oe30Gs+wm3w82S3uXjmhFWokMbt1yqJEKnK8Z6RjSbjVli
         niZulgTBEEe3jeNRY70coVDgQh2CpvYdU195uKmEv93vLMlGAHEIQ8nf89Zy+0mM0EVz
         EkCJIjtarq8oWpD/rWWnq9PuT/KW/WC18M29GEgdHoAN1wBsopnL+EQu3fMRWj/cWv16
         XTFRYReo0CY4v6bglbr2pkE9t2tpWPbZtJHvTUeN9F62h+6Bk7SI4PDzRJi9+9VYDgj5
         DoAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744126966; x=1744731766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=98XHZF4+/XGoFE4w7ezqiz6/KeSNziACB6nFKvABlAU=;
        b=vn4PX2CyVQ4nZRzRa0wtDscoiSnUt0DVM1Xqo6wAxnvpmfz0P203IHCK1ca7fAeb+F
         ed5uPEhEwdU9sUt0p+34IC9vyP+P/Goa652tVmhAyZ9Tj+lvtBK8GM0C7tsI4Mg31bFF
         x1eaGXzuBaLsyNoLp4GTNiFiGc2YuDer5VLTsZhHoxqTk146K/TWs6qLvsC9EMeAv3kl
         c1SJ52SzqUdwPE2IaLC38xi4HP2Nj4IN8PV+o4r9+XmAOSCzs19IMOWw2mC4dqv6BZ78
         3oxJ1xgrpNs7vY1lzkNKNHrWtn4MFj12oSOAnry45VTa1/iehCUBWd5gcNk3cauU54lZ
         +oJA==
X-Forwarded-Encrypted: i=1; AJvYcCXqk+QkyyRCr5lLy0RtKdjxAgfdrLO5JYWZ67KTNAtDxq935kWqqzSKqQ8/T/+QfjVWvf6c1kaayKPlH5dt@lists.linux.dev
X-Gm-Message-State: AOJu0YymVQSaJGKOn671vN5zHc6dnVvbxwkE//ZMSnaBASdnuQ8A9Lzu
	UAg+6II/K7U8IixOpYN5GLe4txYRrnBU5aUYqFNsB9MvfeJU6gSg
X-Gm-Gg: ASbGncsysk+aE0sLRtkxhUdKfB2tu07he9WV420sgLmvjPeRW6bU0z+t5CCJKLdvf1M
	O06HhGXcKx6koeqc4kVfAQfPjtRVfYPvjb0N9EDdkwpYE7UCoGcqjChNWPI9hsORDbUV4a3s5BL
	jRF+IiBBvg5qVoahJ3ZLxB6Riom0h9oFrXryWIB42osYI0JfazAfYAzrmGSQ/jY7RftgR3J3B6x
	NURFoQwwH69XAnefFN3rYXTxSAlXOMsQAVnYrqh1K8cj8g/ue0ScbMVb2sOqxR99K2fpWYzjVVY
	cpcCXTl6LHYolPKANadC30cyXv4MzGoK30IF58JlGooM96LzTuYNJI2ybw==
X-Google-Smtp-Source: AGHT+IE9HMdekR8YtcVFYfgzDBJSYxUotETTUtehVlGaqVEWOP4lzhQH1VzCaKCauCD3Mj4nMirhQg==
X-Received: by 2002:a05:620a:1923:b0:7c5:55c0:db9b with SMTP id af79cd13be357-7c774e5b60cmr2657305085a.58.1744126966575;
        Tue, 08 Apr 2025 08:42:46 -0700 (PDT)
Received: from ubuntu ([105.117.1.177])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76e968988sm776649385a.51.2025.04.08.08.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:42:46 -0700 (PDT)
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
Subject: [PATCH v8 2/2] staging: rtl8723bs: Use % 4096 instead of & 0xfff
Date: Tue,  8 Apr 2025 15:41:57 +0000
Message-Id: <930b275f8bfd8a8a0b06e38c14b7c26dd08af200.1744126058.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1744126058.git.abrahamadekunle50@gmail.com>
References: <cover.1744126058.git.abrahamadekunle50@gmail.com>
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
upper limit, especially when it becomes a non power-of-2 value while
the AND(&) works solely for power-of-2 values.

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
index 5def2467f42b..76f25ab6a779 100644
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
-- 
2.34.1

