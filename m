Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562A5204F84;
	Mon,  7 Apr 2025 15:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041249; cv=none; b=pPdopG5hD7PJrbOF/BR3rPnmDsUGJY7M1c6MPzMvSb1YkD8tqHJRrWHRSsXGINpXI5enwvMIJJq4X4Gag6mG5ytPRxxhM6fADn/3KD8kA4IfrCJO9omVNJOBdrY3YKjow9DyxpdinuM1MnjvfZaw+hUaogueubKxQxBQ7etu2zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041249; c=relaxed/simple;
	bh=WDaDUGwmEwERewTKyabJp/z9rCF2mx3zI4Bzn0WShS8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f8mm6uRUFDjJu4BMHqUbrJf9M2Q9LmyWDg0pjvZ9Ol01Kr0pANkyvdl0+4NEuRBkHr3FjyA9PJghtJ61IAgPAHyNyDqji/0ECByAfIULy7TCxWskxAlm2PkaC2BAPx6bIWh8wnefklLnXFozaaHiA70U7uB6G3eq4HcRKbcc058=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FjYr+WtE; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjYr+WtE"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e677f59438so6983297a12.2;
        Mon, 07 Apr 2025 08:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744041245; x=1744646045; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l7zpBmQSttWP+7fm7BnZXVdnmr4f6nnR4NTtCIBva+0=;
        b=FjYr+WtEqZECVpiZBnZaS5yGermg56nWUHcP5SzeuJ3Q3yENPeZyZJaere5Xf8yglV
         5mgzNQkPHmn2mc6vdVRjpW1PGWt+IffIsnuv5ah2Vu8Syad2X3OrjwqtL6aLBF0N4EFV
         P3VwR4eBvwoplHAsJj+ggFk7CKG8m/ZGRqkZzhmNY3zq5R5HKsP0wjMXR1+uD8MXrHam
         tjE40lBOMdFOxm/DZc5GCj0UmSJTGQsCux3sszxLTLn+wJW21/sngoEUjn626iyj+e81
         RfTsXwBnHHLcjwurR5QL0NDvrJ3iyL8Lsq4Zoa2SJwPNQ4lsY5/FFOdDc6j0F2xgWocm
         qnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744041245; x=1744646045;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l7zpBmQSttWP+7fm7BnZXVdnmr4f6nnR4NTtCIBva+0=;
        b=wIaEjbgiJOWr9dAHefWS2fGb0F2OZfuE7vmz8O/G7SrWROgZJf+cwGg3Daa/ZRYY88
         IFOK+kEUPohKD4JxfLsvbZm9d58ROuCrRuuAJY9ohihKUGb6a0pNcW180BH2QzE0FEaj
         UOHrijTBrOOSYGp1xMajjcx3P6Sze8jxBZWBRJWLWGHJ/lXLhgb31N38VW1f4Fr1Mfi6
         O6+KEmTV8t2sY6MTWvyAduw/gS6rNu7aFJizRMmfljEEoKu4FRsG7aXPnidifHCIsDLH
         DFCQEMhSXfUSFLPVaY1O9fOcsNnbw1tZ5zfI5LxNOISolExlAJJfPB5uuyiSU928HTUg
         DGrw==
X-Forwarded-Encrypted: i=1; AJvYcCUllTxlL2FBgIBk9eG9dR5c5CV722AeX5mySNCFMVmH9b0Gm6rgnkzF2rJwyzAmgswDAn3tSZ1fAhI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzIZfTp+VVp9rrDK7/KSMk0mlnZB+uWUwegITPevDpoEkE6JqOe
	Ls4JMUXHGXx8bWpY6QGp/QQGo4+Jqdzy+3lTR/YT3MR0BXDH4O/f
X-Gm-Gg: ASbGnctYaQ2KgNZg4Rw8kXO9NTBgmcANF3DR3JOFjnvahYdvHiXFeFQCDrh2MyaxG4q
	+QRvBxA35w38T0BPPzALrjSSLnvho7BzgKFjj0kCk7jv/Z1dprZ9bNAi0FZU31O23uO0U6nto3+
	TFDjhgwzFsfGH4z6WQVWDTSJG8RL6hcKqVx8nW3y9+95WDOW6wO7Nl5iJ/rHfsXohifxLM1J8i1
	5yWbY1s4OQSkhigtTMNKskkmF39SEO6h7JIr+27UoWikBZRygUt82cCE7z3ctprZauNBrYb3aHT
	Fz/C86VGpamLVYnXmAAPKf/ec9uCAkxJRWDRG8LcH2pdtxLcZa/a1lQaaFc=
X-Google-Smtp-Source: AGHT+IGcEDBQMZ6NJ63PN9jaNGPysR18XtEQVLoJ9mJjYIPbmqYOBpKf30iNgs0lzXrb0qCoFmr1nw==
X-Received: by 2002:a05:6402:3584:b0:5e0:9252:3550 with SMTP id 4fb4d7f45d1cf-5f0b5da540bmr11079775a12.2.1744041245290;
        Mon, 07 Apr 2025 08:54:05 -0700 (PDT)
Received: from ubuntu ([105.112.123.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0d87e272csm4551681a12.47.2025.04.07.08.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:54:04 -0700 (PDT)
Date: Mon, 7 Apr 2025 15:54:02 +0000
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: gregkh@linuxfoundation.org, julia.lawall@inria.fr,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com, andy@kernel.org,
	dan.carpenter@linaro.org
Subject: [PATCH v5] staging: rtl8723bs: Use % 4096u instead of & 0xfff
Message-ID: <Z/PyMXTjCHduOhKX@HP-650>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

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
Changes in v4:
	- Corrected patch to use '%' instead of '&'
	- To ensure this change does not affect the functional
	behaviour, I compared the generated object files before and
	after the change using the `cmp` which compares the two
	object files byte by byte as shown below:

	$ make drivers/staging/rtl8723bs/core/rtw_xmit.o
	$ cmp rtw_xmit_before.o rtw_xmit_after.o

	No differences were found in the output, confirming that the
	change does not alter the compiled output.
Changes in v3:
	- Added more description to the commit message.
	- Removed blank line in the tag block.
	- Added more patch recipients.
Changes in v2:
	- Changed the commit message t a more descriptive message which
	makes it clear why the patch does the change.
	- changed the subject title to include `4096u` to show that an
	unsigned module is used.
Changes in v1:
	- Added more patch recipients.

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 026061b464f7..548fcf9968bd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -943,7 +943,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 			if (psta) {
 				psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
-				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
+				psta->sta_xmitpriv.txseq_tid[pattrib->priority] %= 4096u;
 				pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
 
 				SetSeqNum(hdr, pattrib->seqnum);
@@ -963,11 +963,11 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 					if (SN_LESS(pattrib->seqnum, tx_seq)) {
 						pattrib->ampdu_en = false;/* AGG BK */
 					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)%4096u;
 
 						pattrib->ampdu_en = true;/* AGG EN */
 					} else {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)%4096u;
 						pattrib->ampdu_en = true;/* AGG EN */
 					}
 				}
-- 
2.34.1

