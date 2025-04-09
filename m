Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159E325D90A;
	Wed,  9 Apr 2025 09:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744190068; cv=none; b=Qbvr9nRxA026oMedhqOmB66TsyFgaw4vH0wQr12bNOiSPMBAyjEpjBinHn776CgrR5YzzVu5m11wIK35I4LeXBADxkRWxuUICeFY8o1eYtH2Ms8UFNe9LkdwzXFOrNP6bxLwV5YV4h+xWZEQi1aywA6aqyD9fvWS94OsXpT/aXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744190068; c=relaxed/simple;
	bh=1D5iZVjmIKarwRYdGD7MtKz/UH9NKBv0KmWvvei4cMw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bYKHeT/tbC2OezV15O18QuxTKmzqMXlWui/GB4i2zd+H+7RP29TdZnFw96PbSSe9ZJCWY6QKYaFUMVTicACydrbc1RnACYfiwrXUzKFuWrTnL30CfrT1NqS3OY9XPYElovYuuSaPQ72Z7E3UzRBrda8sHmbNJhxHZiyIfSlyAI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3d9hHHD; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3d9hHHD"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c5e39d1e0eso623537285a.1;
        Wed, 09 Apr 2025 02:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744190066; x=1744794866; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJ4R9s+Smn1DtIHoE8sXkA1kzL8Ka1xkN88DpPb5/Eg=;
        b=I3d9hHHDhpwVP5Y88NVpIMvrU7TesdZn0K6ngfTgRweCxSeG+m2kX1+HFw9URh57eO
         sX/LijqCPQ8uEP1oMPwiwRQNkfbghjw2wEAFCMwXzXyzUAiTSTmRciOnPqG84yl4PFM6
         Yq4aK3GOeISG2w1dNtq1/UrbXKOTzphrdsqgHZM66QNW9ODZ2XpkkZixjYMDxW57R5nI
         OnW2O2EYDPawl+sEQ9vdy+ih3QUm/sLNmkXlh7gav7SgpXMuq1hGrByejDZVNY9BM/u9
         GOm6FyQTXyhqXU/QAqeCQ/XpGoBMTwXCrMOrlTq+WwRNhRK3PSrVhwD2ryd3zB5ybMfe
         98pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744190066; x=1744794866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJ4R9s+Smn1DtIHoE8sXkA1kzL8Ka1xkN88DpPb5/Eg=;
        b=pXcOAUzuAQWfARexfMMmdlduZ0GUxtFyZRekGSHJnyLzCWfZSZBoE7T/5U2GONNj8Q
         ltx9syaUon6LRiHSJfDdh7geS8H2/O7SwYKiDbpaYaxvxUSZNSMU4FuhgUdvB38xwETZ
         oDWSQ3OU760bUUznG2I364Qvs4nVoEEFCLLb+uxcg8rkVi1cigrsEbAdSv5zOHCvq/Lw
         OJHHUgbbOFVoIs7sZgqVATEsWCEnFSbZk4lc0NoKYNEOSQMhUFV6XFmttqvVsxQczjwC
         xMQOxuUfp1BOzMLBcWYtHXZytNFHQuw6SybQfYajWMzHR2HXzvROTKE8PS7o6Oq5VY/v
         jmnQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4686D+p5mrS9iRg18Zp7uyQq5UxZfgodrSuPDDmBKxHqY5f6w+ivW1V4K2J6M+j8Qa0zeZuoBbzE/gMw7@lists.linux.dev
X-Gm-Message-State: AOJu0YzjDZEcwW8QZ94qrVp9jB/xobgKcG9cRLa2DvjfTtPKAo2b+09k
	cGCxaR21OiMnDaqSrY2Mt547B/XDBLKBQsDoqnyT+dAZeb+dpivb
X-Gm-Gg: ASbGnctbv5y3l8eT1yeeO4MMOk0J/ytl3OShc/icxe1YXBpT0kDRP5FyDNIshTBDwgd
	ZntM5CqlDcvS/NepGZNXs/Ro+IIAIFSL8ShhXxYpu22OsQbeNPI9vU86VZMgyuQvjnyjc4jwrZo
	YuScY8C1Zwyv4jklAxFlJJ5YbM/owkb29PQk7Y02Gp8aj3fnor3etFMIymLM9tPsxRbEi0K9sr9
	/1D8AqaDlTUGEvR91k2+1iamJc9h3w0fk1ngE8PCGicmU2qAT34Qd6OqThKGyd6YqarhbkiWhzB
	DKvXZNEPJ1Y828+bJ2AHxLJcHkDRc5IyKgAYxJMZCyzAjw==
X-Google-Smtp-Source: AGHT+IEt+/uef1nd1EUQSOIdciPRgiNmmp4psQdY7P6wpuKI3PKyWfXaaQtxpAU+m9n/rZsfa7iUZg==
X-Received: by 2002:a05:6214:40b:b0:6e8:9e8f:cfb with SMTP id 6a1803df08f44-6f0dd0ad2fbmr20136336d6.24.1744190065911;
        Wed, 09 Apr 2025 02:14:25 -0700 (PDT)
Received: from ubuntu ([105.112.112.184])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0dea07c50sm5073136d6.77.2025.04.09.02.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 02:14:25 -0700 (PDT)
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
Subject: [PATCH v9 2/2] staging: rtl8723bs: Use % 4096 instead of & 0xfff
Date: Wed,  9 Apr 2025 09:12:55 +0000
Message-Id: <c590448d7cdef06dbc5af06090581523f8247212.1744189500.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1744189500.git.abrahamadekunle50@gmail.com>
References: <cover.1744189500.git.abrahamadekunle50@gmail.com>
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
Reviewed-by: Andy Shevchenko <andy@kernel.org>
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

