Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F4318E377;
	Mon,  7 Apr 2025 06:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744007458; cv=none; b=MaM+8F3/rxwW+CEodn91U8xb8+Ktz4Ue5TXculx8sbd3VWgFk156C7jrrJfGHRXFCD66GzH/ow3MhpVRpInm45DYH2y/1pw0ajtg7s6WF4jsy59My/Ww1EFpNZNJ7TXKnRAAcs6aJtVew1Rxu/NmTWaKHkrwuGr79+DUq8NbZdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744007458; c=relaxed/simple;
	bh=AmxwkfNWnTqg4Gr3/bu+ich7qIKM/RNuPTFe3HF24B4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oc9QFZNJFUeMwA9BQ/Rd57xJKJMsxJ7w8EygzmtPkzinvdtP43QT8i98mUZXM7IQEI6aOhhVW7SoWrpu9IO4orTU7rKIF6hzYVl6UFSY+6z9qN+A2fAIMPxIjzeNzbJf0+8Jzj2MW2HBp12YgTSNq04p5dWUkc3POVzQBSfPh0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mygBoC+5; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mygBoC+5"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so729990466b.1;
        Sun, 06 Apr 2025 23:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744007455; x=1744612255; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6CZ+9nJvtU7EchwepTb4lUMtEiDIUa7OIoD5xm6M59Q=;
        b=mygBoC+5z5j7gGTk59f1iabthbH45kLPdA9ZEj/Y0bxt7HJcsFBxmFGfn2w3I3i/No
         JeevC0UmVuFsMapQYijBT9cp0oXatoMUmMS3Nh9B48EfqdfbiD3TYEqDQbY/gs7nGkZb
         h9UJmt7apmZgOkJehEMfGYCMELvthaqJAWpaSC06Z8BZLZx/gJ951tIL8cpO4NDotLPB
         lTGYHxAT+ypOc9md7tHDW6YlmABIPg1EoXTSz1za4c0x+hA+GNzSj4vIZrkzVGk0QQfr
         7/etdbfTNp1cPZ+b+zBUJNXCiR0q7xZerPnN+lYP19naDw0Le/2sM/4/1iZxiMgXbC6q
         lWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744007455; x=1744612255;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6CZ+9nJvtU7EchwepTb4lUMtEiDIUa7OIoD5xm6M59Q=;
        b=dGvjM9LNAqaaRbzaqnP3wYjfJE6FeYu9dGvyWX1W2qxKxXe5xLodpIKTCPLFhmt7dp
         naymClpAHkUYk6riQUkMjFdblrXA/6sEXxOFLVcp/wFYIiRmke5q6VTnW6jGC8vKIzDU
         8TujbQIQzYx10lXzFFSV2pRyUAWSV0H7YDWaytjrN8YCdtSPp8Y2cfJQTPDbwpkn8SB9
         Vj4KYV0mlv/lVmfSuqrvOVB0ZXJtlvAK9838hfoqtbP6pcabkChY5dwQfobk8pXTjKxx
         cp5BVU66SCZ/KxIsNxszjUVsi3oxLqp3QcVfEW+Y02K/RGgEA9Ehy4ejzWyQh46YzoAr
         XelQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLkuXAiGxbmoWMCx8xEcAO0Hq3XkOwAXG58QSQZP/WWyT3oMUKB+INyhjazewd/62VYxMi6hRl430=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/7fgQ5my/EjoUcZk8cucZSuYMWXn3Mglg5YX9h451eoVSrLPK
	g4fu1pQy3Dk+A3zZ/I8jhK0uLNxEHVEDM2kiNO8ctdVgbawMTn45
X-Gm-Gg: ASbGnct/OKvv1Q+g6vA5d+/3pVTwnh47yjq3GKDW04w6KrgbHZfFMb1d/dBJXMnsAdK
	FvqZax6mTw9bgf3dcq4z9Mq3bLZH8UWflFZ0sTOQYRF7jERcNTeoBS0q/s5J8AOYaUff+tD8AN+
	Wi0X4e0CFdGswrYXVk/9N40gNNufuj0lrwaiT8ELEX2LvV2c9qLYZFe+33iCkUGoEXCY1QENmOE
	1bvCtNEbCmz+hNL+yUcHTOePMbJoW5cN68gLAckFVnjm6qHm8lzEubGx1/UxRudzvmoaZx7vhGN
	00WaXOOLVX/km6SJ07bA2VKJWlDCALnE0Iq0D7FP0sw8k42o
X-Google-Smtp-Source: AGHT+IF/44BzJTOSL5Y5td5z/Uyw0Rj7IdwztQAzzywUWn7ts4FkRQirCuBekw6dxMQ5yjBEXdnh8w==
X-Received: by 2002:a17:907:2d11:b0:ac3:413b:69c7 with SMTP id a640c23a62f3a-ac7e76232e7mr470437466b.39.1744007454655;
        Sun, 06 Apr 2025 23:30:54 -0700 (PDT)
Received: from ubuntu ([105.112.123.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe9ae46sm705764166b.60.2025.04.06.23.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 23:30:54 -0700 (PDT)
Date: Mon, 7 Apr 2025 06:30:50 +0000
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: gregkh@linuxfoundation.org, julia.lawall@inria.fr,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org, andy@kernel.org,
	david.laight.linux@gmail.com
Subject: [PATCH v4] staging: rtl8723bs: Use % 4096u instead of & 0xfff
Message-ID: <Z/NxGilPLPy7KSQ3@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The sequence number is constrained to a range of [0, 4095], which
is a total of 4096 values. The bitmask operation using `0xfff` is
used to perform this wrap-around. While this is functionally correct,
it obscures the intended semantic of a 4096-based wrap.

Using a modulo operation with `4096u` makes the wrap-around logic
explicit and easier to understand. It clearly signals that the sequence
number cycles though a range of 4096 values.
It also makes the code robust against potential changes of the 4096
upper limit, especially when it becomes a non power of 2 value while
the AND(&) works solely for power of 2 values.

The use of `4096u` also guarantees that the modulo operation is performed
with unsigned arithmetic, preventing potential issues with signed types.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
Changes in v3:
	- Added more description to the commit message
	- Removed blank line in tag block.
	-  Added more patch recipients.
Changes in v2:
	- Changed the commit message to a more descriptive message which
	makes it clear why the patch does the change.
	- Changed the subject title to include `4096u` to show that an unsigned
	module is used.
Changes in v1:
	- Added more patch recipients.

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 297c93d65315..f534bf2448c3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -943,7 +943,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 			if (psta) {
 				psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
-				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
+				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 4096u;
 				pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
 
 				SetSeqNum(hdr, pattrib->seqnum);
@@ -963,11 +963,11 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 					if (SN_LESS(pattrib->seqnum, tx_seq)) {
 						pattrib->ampdu_en = false;/* AGG BK */
 					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&4096u;
 
 						pattrib->ampdu_en = true;/* AGG EN */
 					} else {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&4096u;
 						pattrib->ampdu_en = true;/* AGG EN */
 					}
 				}
-- 
2.34.1

