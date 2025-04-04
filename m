Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4328313B2BB;
	Fri,  4 Apr 2025 23:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743809603; cv=none; b=r1xMMYEMSbNVbE2kk3FnQHI5iwcAYhZN/76v1+ZVM5EOW1cL1UbEhXnVs8dHx1MSce/RrZtZDNW6vOPXJnvUoK1ur14Zvlvg0eyKObVLZACoX0QsV2lSX8N8wl1rV2Uyfxq0LqCRq63LGfjeY1qy4Km2a+Iu+zwdE9IcZfzf62c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743809603; c=relaxed/simple;
	bh=F01ob2aLQ3liUe4JNIsCv844jx2uuMudGq8B5gfh9E8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q2KHGZPItgMc+EBr15tMrb5KzBq1b7DkomAIGG1LI/tJS1pmTeshVxxBpcDLolDQ9YvI4zlr/Q4qyH5TCORF06bTx3GmI9fN6HGcod3soB2zGCrsZ7jlX2VCVl07xoUr+7CGlTzOKGw4+3rMnPgIKCEAOlAbWOLA8mBNwpjZS2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DYwdmuL9; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DYwdmuL9"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e5c7d6b96fso4652158a12.3;
        Fri, 04 Apr 2025 16:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743809600; x=1744414400; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4EP4z1mChh3kJ48ZHpuKiS3iu2fY6RHMQL3FYeKcgZU=;
        b=DYwdmuL9/OT215Po+C/FvDxYAf2bNU+wxwwJTMiC+EnyVZmeacdJFFkj0u0lTe6YpL
         vnYBHU+VYdhAPEbkaE1C7CBKsZHgXloTQQ98wolcVA19aJ5a9umtOgEJE6IJoL6TuPir
         7kxjYXLGkO+oRWFLd3MIUCKLIp1j6lMTMTljQUf4yv/5SdGGr+6MUV3An2bDjh94mhIO
         FAT61MDSpPXoYgKG87uJxYatxdLjED9lzbqqrajofALL0E754VbMWjk8rdQ/Uu16HTc7
         ZsWnHT8WXSidg/9ze6X/9inXavSfhx+VwvW0NSCLTtUOic8iCs+htG/TO8L6zOhA48QM
         Le1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743809600; x=1744414400;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4EP4z1mChh3kJ48ZHpuKiS3iu2fY6RHMQL3FYeKcgZU=;
        b=ewnVv7OAb/FTfAMwyc0eTW1+ZrTx4VMdvYjoc4uW6m3xd0nSZmlP8bi3piDX/r9CKI
         Gzg4Khu+yZL60BzqY3h3qgvDyEDEy3x0hQVH1+6vZGgkLlSk3bvB806d0j9ZV5xwcxRC
         S/4fTMNQ36Nz4ijVAnIsT/Q6Z/Mjb668VMCmKT1SNODMcuXt6wQVWU0Wigvp/rZX8so4
         tq3d058etDuLHKCbXTytIdCXfqdgFuwWtYYYxOUkEyk6/MsffY54dg8OmQtqguHMmlVp
         5J5EYg82GAIQAK/AVHDAgmO4i0mOX5SHSTXGY4Cio1D+gwLEG3tyw37bBwwVwvm/RNRJ
         g4Xw==
X-Forwarded-Encrypted: i=1; AJvYcCUPJBMWaHvykLYUj6Mb+OQx9d6LNq4MWbdwNlJ8PRQt1lpPyUp7Dvy1sNm6H3WQAYArda0UCq+nujI=@lists.linux.dev
X-Gm-Message-State: AOJu0YylbRpjfmVVx7nRffzuYlRS3e+SQtXXgOzICqVNDfPeBJ1cSw0t
	Gpv2PrEM8UWW5AqFijIwSjNj6zWSMnwq4jB5J+EVgs34qxDUPNgf
X-Gm-Gg: ASbGncs7NS5Pp5LvKStwiHNMzIQ/6KoC1y1oIKdNIGg+Dgi5Ync0ttp4/qkW9zzMYQq
	AlNQPx+wK/F+YUpkWbgpMEmshdfGm8wJzHd4+4TxizEHY/dXe+zzMm7EuUzxpQZwczayO7k0yPa
	izh/AJuZubi2nkdn4KB8gtZ7SRKt0686PpyMdgaBCVg2gjtfiST1HHfgtECYo6VFEeAS28+Znwh
	8P7x4ReGe7SDqEWpr1TlO8VmDP28G9PB/kEgnfvMV5A3d7wKvWdDdLlLv2QCpXO6cyvOdbdEOlH
	xsi5KANxUtGJiFjgMZBAIowRma4Gz07ZPKn5c37/4jHTSjGIMg==
X-Google-Smtp-Source: AGHT+IGJ0ANfNXgmMJj0Q1O1O/JVYiWXMA2oa4wpweViwDI5wrLYiU1Dge5Z4oCqR6T4shEd3Ne/9g==
X-Received: by 2002:a05:6402:2712:b0:5de:39fd:b2f5 with SMTP id 4fb4d7f45d1cf-5f0b5d8b51bmr3718138a12.1.1743809600312;
        Fri, 04 Apr 2025 16:33:20 -0700 (PDT)
Received: from ubuntu ([105.112.234.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087ed1c68sm2881390a12.17.2025.04.04.16.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 16:33:19 -0700 (PDT)
Date: Fri, 4 Apr 2025 23:33:16 +0000
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>, andy.@kernel.org
Subject: [PATCH] staging: rtl8723bs: Use % 4096 instead of & 0xfff
Message-ID: <Z/Bro47isE8zhcu7@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace the bitwise AND operator `&` with a modulo
operator `%` and decimal number to make the upper limit visible
and clear what the semantic of it is.

Also add white spaces around binary operators for improved
readabiity and adherence to Linux kernel coding style.

Suggested-by Andy Shevchenko <andy.shevchenko@gmail.com>

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 297c93d65315..630669193be4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -943,7 +943,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 			if (psta) {
 				psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
-				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
+				psta->sta_xmitpriv.txseq_tid[pattrib->priority] %= 4096;
 				pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
 
 				SetSeqNum(hdr, pattrib->seqnum);
@@ -963,11 +963,11 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 					if (SN_LESS(pattrib->seqnum, tx_seq)) {
 						pattrib->ampdu_en = false;/* AGG BK */
 					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq + 1) % 4096;
 
 						pattrib->ampdu_en = true;/* AGG EN */
 					} else {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum + 1) % 4096;
 						pattrib->ampdu_en = true;/* AGG EN */
 					}
 				}
-- 
2.34.1

