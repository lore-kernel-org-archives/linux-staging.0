Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA77F1E5B85
	for <linux-staging@lists.linux.dev>; Tue, 13 May 2025 05:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747115615; cv=none; b=YP6qFU2+Gb1DACXz3ySBuXmP5g/TMR6vABKRaET5J6RrXXnGJkgPRzqfwktuTEZEpGwPZ0CXud6nPQqMTwqSR1nxhIQQ6G6ILufUk3Gc8nvuj15xchjY3AOk+OXYFJ/Fmqg/oBDuQ8ng2D/nBFrcdvKGj2L7T+a7UyVMLQI+2R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747115615; c=relaxed/simple;
	bh=jB+1NSGMzo+MjMb56ZSc0FpCP8SLNObWRnq7yTjSBIg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=r8SMF5LQof3n30mn3GBAv6xZvuNm9kgmJyQUBYwg/zORHpQBm86cwaD55N1BWUiX7Q38znSZaf3noM5GYSqbBFk2OxkkhaPDR5QibNaK9spe2oOdwXSWaZR8knybGTGryhgi8+qwz9wgJXOytvlovDSlrag9lYNuyEkjg15c30M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YJbeNTym; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJbeNTym"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b170c99aa49so3515908a12.1
        for <linux-staging@lists.linux.dev>; Mon, 12 May 2025 22:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747115613; x=1747720413; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WNsyZBlrjZRlpcE1bXaf2I5YyPz0u8vhXL29PFihhZE=;
        b=YJbeNTymUdVDRbCBT7K2Kp/07xTZlP4JxdF9rm2quunwjUd2eHBBqZxi2ybNbHkQqg
         2v9L6Z/nURGWwo7l/Yy8cTxGQwiaryRZKNTPlQ23UWMXAdokAl5pVYovBhqDcUFfVF7Z
         pNyJVMVInTeykKM45SYxRWOtxm1d+zt7Wu5htWAZSLRAVSDuytOSkkZ5zgL48nIu6Dx5
         bApqhRMcDniSwQKrULjZzXWxy68GUH17Fv9ZK0oLuiuhsC/gITGEFp8R0a0EekgcMMAt
         4w3C/+swoFn+vlJr5W8UAl8UEM9rj1WmgA9KMLElOe1PRMpWAJ1m2UjzRI/xG8dUSMgs
         4pBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747115613; x=1747720413;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WNsyZBlrjZRlpcE1bXaf2I5YyPz0u8vhXL29PFihhZE=;
        b=gjaW0gUssXxbt/aEY9OQrtwBTxmT67a9l9VL+Eb3Vh79Q+ek58nA4VJCpDP44G2oTW
         i5ksLhUbSvEAIzr9yZlqMacDD7hPI2eOajhZxBuSDyV8d8d0BIYFKhEg+CPF7r7JeNmZ
         fSqtacNstXc7IR+ws7JkzbXpIti2qT7KGKyUFPg0EmmdjSJcReWIskRfPP3V20HatP24
         egwZJX746FXHGr1NPfD0YI7Lqw/1A/fAMBN6qVGGoQ4YdZp7/MUShhYKINfLUmSSQh9w
         JXYTdv9Qo9QFhoIXAdd50s3sK1wSx0g/+zys+KsBG2a9+u5A01KfoWXxiVKdvuwG6ME9
         /LAw==
X-Gm-Message-State: AOJu0YxU0ZShtX7uh/tYSfPa5apQ9Tg26+ZWQcQxt8l8h4h4GiLqHn3d
	bkxexjPK7EMPrgdTy6Z52Kq0Lp6XoXXBXZI/DMz4U0VDI9M5KccP2KIITmMqx4KuXScGan7fepC
	IugvYm/egk1w7HPH7j7pnAGLSYkE=
X-Gm-Gg: ASbGncu5QYWjI4xOOjO6F6mlduL/3cTDWwOpmqE/DVCRXqCYj/GTdDrFQs4H8uz43gQ
	ptv4rbAlT9vdvWpdRChu5nnQT0eEQ5feVox9oJPuMXUryL1olIfU3R7Cp8dUN5y+fQA12YaPq9D
	9LRX+r7vvs1bL4Tyxy/nDd4Ubcw/ROFrrE
X-Google-Smtp-Source: AGHT+IHOc8SXBuOLE9/iyqL8gXXnTqSTPtRR21+XgLdQcc71oLOwLLZ8JwQ7FB8OxioyLwjXMjTZMux/mq3GQJqBjCY=
X-Received: by 2002:a17:903:988:b0:220:c63b:d93c with SMTP id
 d9443c01a7336-22fc91aca1emr263133585ad.44.1747115613093; Mon, 12 May 2025
 22:53:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Tanav Chinthapatla <tanavc01@gmail.com>
Date: Tue, 13 May 2025 01:53:20 -0400
X-Gm-Features: AX0GCFsHdIaazRy_QlZVSW3DrhT5qlEYmvBox6N8Eyt0rzr0kqKxYEMV0FvKf-0
Message-ID: <CAPGyJDMv-N3HkdV4znQg=_i2owE2sbnRhzFem_Uv_15GjADBFQ@mail.gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix spacing around '+' in rtw_cmd.c
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000808d9f0634fe0dbf"

--000000000000808d9f0634fe0dbf
Content-Type: multipart/alternative; boundary="000000000000808d9d0634fe0dbd"

--000000000000808d9d0634fe0dbd
Content-Type: text/plain; charset="UTF-8"

Hi,

This patch fixes a checkpatch style issue in the rtl8723bs driver by
correcting spacing around a '+' operator.

The patch is attached to this email.

Thanks,
Tanav Chinthapatla

--000000000000808d9d0634fe0dbd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>This patch fixes a checkpatch style=
 issue in the rtl8723bs driver by correcting spacing around a &#39;+&#39; o=
perator.=C2=A0</div><div><br></div><div>The patch is attached to this email=
.</div><div><br>Thanks,<br>Tanav Chinthapatla<br></div></div>

--000000000000808d9d0634fe0dbd--
--000000000000808d9f0634fe0dbf
Content-Type: application/octet-stream; 
	name="0001-staging-rtl8723bs-fix-spacing-around-in-rtw_cmd.c.patch"
Content-Disposition: attachment; 
	filename="0001-staging-rtl8723bs-fix-spacing-around-in-rtw_cmd.c.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mam39x3s0>
X-Attachment-Id: f_mam39x3s0

RnJvbSAyNWFhMjRjN2NkZTdkZjU5MDE2NzRlYzA4MDkwOTkyYjE3YWZkNWI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBUYW5hdiBDaGludGhhcGF0bGEgPHRhbmF2YzAxQGdtYWlsLmNv
bT4KRGF0ZTogVHVlLCAxMyBNYXkgMjAyNSAwMDoxNjoyOSAtMDUwMApTdWJqZWN0OiBbUEFUQ0hd
IHN0YWdpbmc6IHJ0bDg3MjNiczogZml4IHNwYWNpbmcgYXJvdW5kICcrJyBpbiBydHdfY21kLmMK
ClNpZ25lZC1vZmYtYnk6IFRhbmF2IENoaW50aGFwYXRsYSA8dGFuYXZjMDFAZ21haWwuY29tPgot
LS0KIGRyaXZlcnMvc3RhZ2luZy9ydGw4NzIzYnMvY29yZS9ydHdfY21kLmMgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3N0YWdpbmcvcnRsODcyM2JzL2NvcmUvcnR3X2NtZC5jIGIvZHJpdmVycy9zdGFnaW5n
L3J0bDg3MjNicy9jb3JlL3J0d19jbWQuYwppbmRleCAxYzllOGIwMWQuLjk4ZDg5ZTgzNiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL3J0bDg3MjNicy9jb3JlL3J0d19jbWQuYworKysgYi9k
cml2ZXJzL3N0YWdpbmcvcnRsODcyM2JzL2NvcmUvcnR3X2NtZC5jCkBAIC0xNjE5LDcgKzE2MTks
NyBAQCBzdGF0aWMgdm9pZCBydHdfYnRpbmZvX2hkbChzdHJ1Y3QgYWRhcHRlciAqYWRhcHRlciwg
dTggKmJ1ZiwgdTE2IGJ1Zl9sZW4pCiAJCWJ1ZlsxXSA9IDA7CiAJZWxzZSBpZiAoY21kX2lkeCA9
PSBCVElORk9fQlRfQVVUT19SUFQpCiAJCWJ1ZlsxXSA9IDI7Ci0JaGFsX2J0Y29leF9CdEluZm9O
b3RpZnkoYWRhcHRlciwgbGVuKzEsICZidWZbMV0pOworCWhhbF9idGNvZXhfQnRJbmZvTm90aWZ5
KGFkYXB0ZXIsIGxlbiArIDEsICZidWZbMV0pOwogfQogCiB1OCBydHdfYzJoX3BhY2tldF93a19j
bWQoc3RydWN0IGFkYXB0ZXIgKnBhZGFwdGVyLCB1OCAqcGJ1ZiwgdTE2IGxlbmd0aCkKLS0gCjIu
MzQuMQoK
--000000000000808d9f0634fe0dbf--
