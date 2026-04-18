Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0778176FB1
	for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 23:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776554662; cv=pass; b=hgMMwDJcBZkwPzzqoQo9ubrxN3ljtvxw3LLImbOk7JjGCyUy4JZwD4EI5JWYL+WPF4E96FfV0MBAI6Q7wTVJqPORlngUuy1rVx0cZrzs3+JHKBK8U4r4jrmRWJCQASP5y5CBw1F6SSiqL4Bvb1uRVTyCZTLao4xVDNkA2s22/ZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776554662; c=relaxed/simple;
	bh=6S7UYvDjlvyvCF88qvmt4OV+o63RdtgBfV552YoG82M=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=XsKJAVJs2HqVqcrfsBcEV6guASbO1oHw2LwB4RdGIWHh2z9BLKmPnk+O+lOLDlUtPBT/JA0Qd7bhi3shKXYcJoPG6SGpOm+AFyEmZwu4AqU5rRNMcZu98Fk5MrklHhV5UAmcxqIT7RwA7b2Z0asmAewH85YlhljVLFhJUkiISS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbii+bvY; arc=pass smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbii+bvY"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8a5800772f3so13422456d6.2
        for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 16:24:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776554659; cv=none;
        d=google.com; s=arc-20240605;
        b=Q57pVHtBl5TJorVIpAgRih3C/FlIPNnxKJwbOyosqK0FP2IlcGykDHZ3GQBvwiiCQh
         /0aPspiv8I9lv0GdeJ9Hez9wS6+SkJxPZZLqWvk01udfFLQjSVUzQrmk7bQpFr6B0APi
         0dj+Xn87d+kTK6MFN9C2+HjFSjVQ575QB/oiCTn/50fhnIUTXXmL8YUHhEHK0iB0yaxr
         GouKCLuCkZVBHeriRGWovADJogBIt22RA94iwJzOrppCXtmALh2BqgT+2BmexNIxjnza
         f3AeQDXrQ++wCh/zZoEwCNVnZPG9QdFuzyVu/dFU1HbUyBPq3LmPs2W4hMjG2U4i1vBH
         gHTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=uzI99h7QcPDYph20qYWivUB67buE9c8ovzRKETDdNIU=;
        fh=+gAPrYq4KG+/tkDEDPPVlnsb5dY5pdR+BbowKTd/6ss=;
        b=glKKI6TIES6RG7ue62RWbzGw5ZrIeacG4dDyIT2Y8pfy1y7uczfC8aC4cgH2VYyJ+L
         55w/XsLZQg0XV1Nm1P3LBQxKEML0ninInAzV2oqbLxXZzERDoD31X946iGbFppqtMK92
         MItX5l3mbOFra2+vzFxAMWTFJ/sogt5RAjXFxrW3CBWdFMIPwX+Tb6ksSbGnFMSCUWGY
         v8d8eRNsDnRvaVjBUOPTlTGWvLrTbhMST6pm3TzgrcVDc/oiFLVl2JOy9t8f6q714UHE
         Zi8xYmcy5VAtHDShmG97e35L2XnGPvrZYqOOpZt+c4Ll0IXet4mwf3QeYbTyphdtLB0O
         srlQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776554659; x=1777159459; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uzI99h7QcPDYph20qYWivUB67buE9c8ovzRKETDdNIU=;
        b=nbii+bvY/g10aPkLAT+XLkxoWXsII+y64t/xdtng8j1/hpDvy3hwzaQx2dyLWTUU5n
         C19YTE/aWBQamdrmowMXu9OTksCzllWWydWXzvsrDlfQr9KTDTCb7MisMoLQ6tS/COvG
         JnKKdZfoKjUWg+e1T7FryFmQLXafLXFgTATAfHNfywJx+sQD/7pAFzQNY354gUYca8tv
         /3dnqjXwYvHwjjKYvz4Pm1X9idnykyP1jH3s3npLM9/t2T6m2VKrref0t0xTjncsx/k+
         w6aBvB5aJRv8D/LaJ31irhiOZca1uo5Vif7Tu9UnmhHQiO+tLcA+0DBv0+gNtgYS6jvC
         HOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776554659; x=1777159459;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uzI99h7QcPDYph20qYWivUB67buE9c8ovzRKETDdNIU=;
        b=i49E7IARS/RwC8GfEql+wYd6PpeIYiQAVRixqbwa/iFoHRvumyHEyRv4r0AtbgFLHw
         nxFAQaMiQ/dM4zNt9QFi7/Sn6x3EJTrvXjNVGi191F29AjPykxR3v9conF79fksxXZy5
         h+44xJ9UQRhGLmzF6d6izmXNb6wRFc5hmHC3jGFaDOdn4i0IDL81S8VXYo3neQpWfZ0E
         QNKycCqIfEhMQBcimNgKwedHN/hIhPOTxZ5nOC9HA9tBD9YujKYgVqVUflO3Beo84Mg7
         71cARgGfboZziVWPdAtegm1jy6u8qMUAouKUVtJowvlXjfnaw4gikXeuda+tIdt7fZAZ
         B5iw==
X-Gm-Message-State: AOJu0Yz2Mu/7fEXZpaTUcAJ/0zFhgbPJQbohHcuTI8AbLt7r04L9gmDr
	AEuFJ20GetDtQVIp0zcbwPSAfvdbjunxv3VkHPSnANI3QAtdMKxACLY2EE9vB1C1u3Dj34mQ7co
	nPRxnDWXGay2d22kCk5PnCEgaBOMq/WvQxQ==
X-Gm-Gg: AeBDieuSw4LB3LEEnjzka4TPY5no9Y16yzVOYUfuwZ2QBFRGk85XestCH1lYKh60/8E
	3CrWkABSdKVZcNWAs1ZEiPUCHrdtGjZXh25Hm0rpNUnUFu0GdndLgs6ckgm8WhOAMqVMzspJ8U7
	nUN/gLRwbaREVSqPHG5G4lA+yXedWMYZ6CMVFmS40wn64wRW5OSkSnYDLLeu2nAUL40eFU49aQk
	1GpUa589qyp8xzgQ7K2c2XPT01DnvvA9t43f/uSkVoffMDBdJ5cdTBO+MX2MiaEGkfm5pLvYXkU
	5Bkxip+s+ua085RzseUcAj+L
X-Received: by 2002:a05:6214:aca:b0:8a1:8f74:3eab with SMTP id
 6a1803df08f44-8b028013b63mr138878486d6.9.1776554659490; Sat, 18 Apr 2026
 16:24:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Vakii <knezopop@gmail.com>
Date: Sun, 19 Apr 2026 01:24:07 +0200
X-Gm-Features: AQROBzC3iV7NOm9qc4rZ8JbVjC0iVSngJW-6UN8EXCyJrqT59fvhQf_luk7jsTs
Message-ID: <CALvkU=r8n4ZPDfw+-Y2M6078udukf8u2xEKTag_QrAeXwjAK7Q@mail.gmail.com>
Subject: [PATCH] rtl8723bs: improve readability in cmd filter and traffic watchdog
To: linux-staging@lists.linux.dev
Content-Type: multipart/mixed; boundary="0000000000006747c9064fc45d56"

--0000000000006747c9064fc45d56
Content-Type: multipart/alternative; boundary="0000000000006747c8064fc45d54"

--0000000000006747c8064fc45d54
Content-Type: text/plain; charset="UTF-8"



--0000000000006747c8064fc45d54
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><br></div>

--0000000000006747c8064fc45d54--
--0000000000006747c9064fc45d56
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-rtl8723bs-improve-readability-in-cmd-filter-and-traf.patch"
Content-Disposition: attachment; 
	filename="0001-rtl8723bs-improve-readability-in-cmd-filter-and-traf.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mo4yrlyg0>
X-Attachment-Id: f_mo4yrlyg0

RnJvbSBhYjBkYTFjMmJhNzQ0NmJlN2Y1ZDBhMGJhODhhMmIxNTAzZjM5ZjRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBrbmV6IDwyMDYyNTM0NDUra25lem9XVEZAdXNlcnMubm9yZXBs
eS5naXRodWIuY29tPgpEYXRlOiBTdW4sIDE5IEFwciAyMDI2IDAwOjU2OjMyICswMjAwClN1Ympl
Y3Q6IFtQQVRDSF0gcnRsODcyM2JzOiBpbXByb3ZlIHJlYWRhYmlsaXR5IGluIGNtZCBmaWx0ZXIg
YW5kIHRyYWZmaWMKIHdhdGNoZG9nCgogLSBSZW5hbWUgYkFsbG93IHRvIGFsbG93X3ByZV9pbml0
X2NtZAogLSBDb252ZXJ0IHRyYWZmaWMgZmxhZ3MgdG8gYm9vbCB3aGVyZSBhcHByb3ByaWF0ZQog
LSBJbXByb3ZlIGNvbW1lbnRzIGZvciB0cmFmZmljIGRldGVjdGlvbiBsb2dpYwoKIE5vIGZ1bmN0
aW9uYWwgY2hhbmdlLgotLS0KIGRyaXZlcnMvc3RhZ2luZy9ydGw4NzIzYnMvY29yZS9ydHdfY21k
LmMgfCAyMSArKysrKysrKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRp
b25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ydGw4
NzIzYnMvY29yZS9ydHdfY21kLmMgYi9kcml2ZXJzL3N0YWdpbmcvcnRsODcyM2JzL2NvcmUvcnR3
X2NtZC5jCmluZGV4IGFiYjg0ZjhhZWNiZS4uZTBjNTc2NTJlMGY1IDEwMDY0NAotLS0gYS9kcml2
ZXJzL3N0YWdpbmcvcnRsODcyM2JzL2NvcmUvcnR3X2NtZC5jCisrKyBiL2RyaXZlcnMvc3RhZ2lu
Zy9ydGw4NzIzYnMvY29yZS9ydHdfY21kLmMKQEAgLTI5OCwxMiArMjk4LDEzIEBAIHZvaWQgcnR3
X2ZyZWVfY21kX3ByaXYoc3RydWN0CWNtZF9wcml2ICpwY21kcHJpdikKIGludCBydHdfY21kX2Zp
bHRlcihzdHJ1Y3QgY21kX3ByaXYgKnBjbWRwcml2LCBzdHJ1Y3QgY21kX29iaiAqY21kX29iaik7
CiBpbnQgcnR3X2NtZF9maWx0ZXIoc3RydWN0IGNtZF9wcml2ICpwY21kcHJpdiwgc3RydWN0IGNt
ZF9vYmogKmNtZF9vYmopCiB7Ci0JdTggYkFsbG93ID0gZmFsc2U7IC8qIHNldCB0byB0cnVlIHRv
IGFsbG93IGVucXVldWluZyBjbWQgd2hlbiBod19pbml0X2NvbXBsZXRlZCBpcyBmYWxzZSAqLwor
CS8qIHNldCB0byB0cnVlIHRvIGFsbG93IGVucXVldWluZyBjbWQgd2hlbiBod19pbml0X2NvbXBs
ZXRlZCBpcyBmYWxzZSAqLworCWJvb2wgYWxsb3dfcHJlX2luaXRfY21kID0gZmFsc2U7CiAKIAlp
ZiAoY21kX29iai0+Y21kY29kZSA9PSBHRU5fQ01EX0NPREUoX1NldENoYW5uZWxQbGFuKSkKLQkJ
YkFsbG93ID0gdHJ1ZTsKKwkJYWxsb3dfcHJlX2luaXRfY21kID0gdHJ1ZTsKIAotCWlmICgoIXBj
bWRwcml2LT5wYWRhcHRlci0+aHdfaW5pdF9jb21wbGV0ZWQgJiYgIWJBbGxvdykgfHwKKwlpZiAo
KCFwY21kcHJpdi0+cGFkYXB0ZXItPmh3X2luaXRfY29tcGxldGVkICYmICFhbGxvd19wcmVfaW5p
dF9jbWQpIHx8CiAJICAgICFhdG9taWNfcmVhZCgmcGNtZHByaXYtPmNtZHRoZF9ydW5uaW5nKSkJ
LyogY29tX3RocmVhZCBub3QgcnVubmluZyAqLwogCQlyZXR1cm4gX0ZBSUw7CiAKQEAgLTExMjcs
MTIgKzExMjgsMTYgQEAgc3RhdGljIHZvaWQgY29sbGVjdF90cmFmZmljX3N0YXRpc3RpY3Moc3Ry
dWN0IGFkYXB0ZXIgKnBhZGFwdGVyKQogCiB1OCB0cmFmZmljX3N0YXR1c193YXRjaGRvZyhzdHJ1
Y3QgYWRhcHRlciAqcGFkYXB0ZXIsIHU4IGZyb21fdGltZXIpCiB7Ci0JdTggYkVudGVyUFMgPSBm
YWxzZTsKKwlib29sIGJFbnRlclBTID0gZmFsc2U7CiAJdTE2IEJ1c3lUaHJlc2hvbGRIaWdoID0g
MjU7CiAJdTE2IEJ1c3lUaHJlc2hvbGRMb3cgPSAxMDsKIAl1MTYgQnVzeVRocmVzaG9sZCA9IEJ1
c3lUaHJlc2hvbGRIaWdoOwotCXU4IGJCdXN5VHJhZmZpYyA9IGZhbHNlLCBiVHhCdXN5VHJhZmZp
YyA9IGZhbHNlLCBiUnhCdXN5VHJhZmZpYyA9IGZhbHNlOwotCXU4IGJIaWdoZXJCdXN5VHJhZmZp
YyA9IGZhbHNlLCBiSGlnaGVyQnVzeVJ4VHJhZmZpYyA9IGZhbHNlLCBiSGlnaGVyQnVzeVR4VHJh
ZmZpYyA9IGZhbHNlOworCXU4IGJCdXN5VHJhZmZpYyA9IGZhbHNlOworCXU4IGJUeEJ1c3lUcmFm
ZmljID0gZmFsc2U7CisJdTggYlJ4QnVzeVRyYWZmaWMgPSBmYWxzZTsKKwl1OCBiSGlnaGVyQnVz
eVRyYWZmaWMgPSBmYWxzZTsKKwl1OCBiSGlnaGVyQnVzeVJ4VHJhZmZpYyA9IGZhbHNlOworCXU4
IGJIaWdoZXJCdXN5VHhUcmFmZmljID0gZmFsc2U7CiAJc3RydWN0IG1sbWVfcHJpdiAqcG1sbWVw
cml2ID0gJnBhZGFwdGVyLT5tbG1lcHJpdjsKIAogCWNvbGxlY3RfdHJhZmZpY19zdGF0aXN0aWNz
KHBhZGFwdGVyKTsKQEAgLTExNTYsNyArMTE2MSw3IEBAIHU4IHRyYWZmaWNfc3RhdHVzX3dhdGNo
ZG9nKHN0cnVjdCBhZGFwdGVyICpwYWRhcHRlciwgdTggZnJvbV90aW1lcikKIAkJCQliVHhCdXN5
VHJhZmZpYyA9IHRydWU7CiAJCX0KIAotCQkvKiAgSGlnaGVyIFR4L1J4IGRhdGEuICovCisJCS8q
ICBEZXRlY3QgaGlnaCBUeC9SeCB0cmFmZmljIGxvYWQuICovCiAJCWlmIChwbWxtZXByaXYtPkxp
bmtEZXRlY3RJbmZvLk51bVJ4T2tJblBlcmlvZCA+IDQwMDAgfHwKIAkJICAgIHBtbG1lcHJpdi0+
TGlua0RldGVjdEluZm8uTnVtVHhPa0luUGVyaW9kID4gNDAwMCkgewogCQkJYkhpZ2hlckJ1c3lU
cmFmZmljID0gdHJ1ZTsKQEAgLTExOTEsNyArMTE5Niw3IEBAIHU4IHRyYWZmaWNfc3RhdHVzX3dh
dGNoZG9nKHN0cnVjdCBhZGFwdGVyICpwYWRhcHRlciwgdTggZnJvbV90aW1lcikKIAkJCQliRW50
ZXJQUyA9IHRydWU7CiAJCX0KIAotCQkvKiAgTGVpc3VyZVBTIG9ubHkgd29yayBpbiBpbmZyYSBt
b2RlLiAqLworCQkvKiAgTGVpc3VyZVBTIGJhc2VkIG9uIHRyYWZmaWMgc3RhdGUgKGluZnJhIG1v
ZGUgb25seSkgKi8KIAkJaWYgKGJFbnRlclBTKSB7CiAJCQlpZiAoIWZyb21fdGltZXIpCiAJCQkJ
TFBTX0VudGVyKHBhZGFwdGVyLCAiVFJBRkZJQ19JRExFIik7Ci0tIAoyLjQ3LjMKCg==
--0000000000006747c9064fc45d56--
