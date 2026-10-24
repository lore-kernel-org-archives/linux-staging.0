Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792854412;
	b=ViMXk03bkczryRXpLkLWyfxT3d8Mc4qza15E2JE+U9eTLwq9QST81CnUVhUB1/UASQ2S
	 7Tbm8xBdPn399EJfnEr3leWEKxij6DYa6ZbDdVAbP86odpoioQBVmU8U7b+RZPavtUU4k
	 qfCkNqP3dGz9ri/lHhyJWKU6Ko5+bdpf8lUIxyffjHZOJhOhuhEyWTrtBbUgaT0x0quLA
	 X7SOzR0rKepr8WTerNbhox1ORvTW3v6oWX+n+3OMAu1Es0HpiHFi+gG1KKu6PNO+lO+yi
	 5ldIj7EG8rWSGgablzzc044rsArPakkGcpTmwPPs191DwRBC/YMHXU3txId45HDoxqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792854412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=hCCqssXOeZVkDx8ZE/ynn3/Hgi/kUYrLr11inzz+yzM=;
	b=5c1us38txYlc6hft7P/Y3OSCcTzRLugVIrktK2Mtxe90ga3gr9vgzelurSsD0t7jcClI
	 8BlGIAmaKhY1NSOSsFcC29/QHvcdEbtXUeKtIKSUMUvJAlD72v8sbcbpQeGlIflV+YJS1
	 zzDtpn47Ve4Gxx6IWjxNN9W3/49IxxLS+H0gSoGeWdAblZEsg4Npi0NWNkLZF4C6aNB2i
	 frHZ+48F0+JsOYXEjOObNE5wvYN2wBPNLh3gJOg7WHnNO6EW22KVj5b+GPeZ8lWcu9O7C
	 B3kxscjAZFLDVKVHU72FtMitDnkI+WPFEf0ZcMcOBLvbH02yqwWWM4mXeBXkDT/wTtA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kUbovRl7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BED606A31D
	for <linux-staging@lists.linux.dev>; Sat, 24 Oct 2026 15:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67BED606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kUbovRl7
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c38ac26cc5dso256636866b.2
        for <linux-staging@lists.linux.dev>; Sat, 24 Oct 2026 08:06:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792854411; cv=none;
        d=google.com; s=arc-20260327;
        b=rxFOEm7jBRshQTEdwRPynb0K6pJ0r/4oTvPeevHJwRIulCD0G320kZw6FnEwEswV1Z
         wnGCUe8/Q839ia8QAHbK2++416ZRXI6Wlb5lhvz9HRIlv3C2sSeBji/QdxRS+UVcocPj
         T8U2TdWB4EV4A1jSOSXCdELg381aqykWhZH+Xch1WLBsOmeBMNUJpKKMO+sLv9CaJKDx
         AIj+ciNlfLbE7BX2dwvjjd3qM4lgE3XYGOkKW/T1lLJsE1AshdS5FqVPR7MdVnHM80i+
         NjysOMmZ3XzZKgGuYABax0IgysPYQWW4r1fak1FK4w2neYVLJDV18MbAwnKzm1AQFNhx
         Cx6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=hCCqssXOeZVkDx8ZE/ynn3/Hgi/kUYrLr11inzz+yzM=;
        fh=zwHXlCVnqPEn2JFj/KvS9i4eDIVzYVtGS5Onu1bKlTY=;
        b=dyy6nGOb8tpUEdEgrNV27eE4URPqI/ODjMFHjxvufo3SM6lvqWjxVRfkrPreAQx2qH
         ff24gqGnwXJQv1LJOoSAWdFyMx8mSAObH9Fa4WYGrJrxVhAwlr9Mk7EioSrjvD7BgiZs
         q3mPMJ2mBG3ZH1nE8vBUAXFrvLw3u2EVYAR0G8vmI4LVXbhcnCtv9JYRocZGehbOZOGS
         IEIkJNtnPoLnlFq16vs7Cl7WkhwwN7uA3zCT4lVh5/sHEK4k3iQd3Rf+FqecaIWY4ynB
         nOvhvtZavFM7XHniN9fpMgGY2pJmTEUx+8L4Mtlpu/ZlcH+eOsoxfI5x+GPwYg8zyOd0
         eH3w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792854411; x=1793459211; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hCCqssXOeZVkDx8ZE/ynn3/Hgi/kUYrLr11inzz+yzM=;
        b=kUbovRl7s0VpvuXNHQvxH2j+SUeCI/rAL1qlx9ycoQYFwxlRIdmf4fnEZT24WihMX8
         4i0vCoU5Aieawuqdd2+zUOQjR3sWzlT43nPoBw4taibf4EUHXBRisaTsEnAU7Hv9VOpC
         n5+bjPrbYbMTxGyyM+pNU+Zg4s18f9uqSpL4yB8uIXPol+XXajNv7kMz66gQ+9q0cMFN
         5/sI5BVm5F1Ba+Nthuq1v64w7ugFvkASGuue3W7wmKx9t3GFG2foQY7QoxU0nYW0zfPK
         ZujAOwa0/9QwvNw7Lj0So72BhzP8TKdDv/XI7wwtyUkDOaHzWqs4X5IHoTtzV5MWelhH
         ho/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792854411; x=1793459211;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hCCqssXOeZVkDx8ZE/ynn3/Hgi/kUYrLr11inzz+yzM=;
        b=YkzZIcH5hzaCJs5yq2Et6u3RL1r+yoVC3sSy5a25esIQqTGG7TU8qxFqqNrSYDX2RQ
         uNgDBRgNw1PLmw7VIx+QMikzqNXoGjkkfkMM2enHwt4Jd97dVz+t8dK636XuPSc8DxHF
         yjfaS+3wp+cOKha5G4HgkGdbauS/6iMw3P2swNcYkSQ/LXna3H8eeAvkx2z5nAa2cpK/
         HYkOJN6HL0+AgL431a+3dDVvNQxAzZ/GYQa0n4No2a+C3aIzued4B99lNbLkKpUEElg3
         l4SBsyWPgFvEHaKEFkFEQBsOiIU2XX5RxCuyID4QENSkOpLSuoHDfFGrk7gJrWCyLdqu
         5B0g==
X-Gm-Message-State: AFq9FYJwNrGbbiD8Qj+1FQwm44TL3/kzZivO2qW6VBAvVPNSd8yjMIKv
	ERYShbaH9vAcbJ/JKEL7/FqVk9V478j/rjICOiWeu4cEEVT+kaMMAk0PQKJC2TxmpN6pL1RVyv0
	MCbB9NfA49TMxs10Q6qHi7u7HiejVRro=
X-Gm-Gg: AYBFou3/2whzMjrHIkXittc3nlZst5UAanNOstDrpxoabz0S55QULQeqBKLnHaA5kKV
	r6zouJ+mLTGv595zuwtRpUJdexUX11G+JDPH6LLLTNoPUZooUc+NdqY4iKQy0/UXCpRMZK+/Zxw
	J4yeDdYd2VBQsn08QpxCsP88nqxMjgtAMXmGi3SuggEualJS9sU1PFQZ1DlPFDYux0QuJg794iG
	T2hIAUr4oP2FhRU92xLUOJK2kPMaFFpy2KLPCynZTlbKihaQWu+2Urz5LS8VpJz1J4EFp6+AfLZ
	LFkUBExIFn4CLQn5DJQHIbb6Sgj39aUEiVkRmJcWLRMgySCexkitJRoHEIYKnf5CvmtkafiRCPS
	AW3eRoibJV7oWlea0zG+6RzgHrk8xhmL1CA0H/MxWGOIU9zB5NpROHK58xy2Cmwpk7/1h
X-Received: by 2002:a17:907:6d16:b0:c24:87e5:6491 with SMTP id
 a640c23a62f3a-c46bda69f8dmr291186666b.2.1792854410627; Sat, 24 Oct 2026
 08:06:50 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Abubakar Musa Samaila <abubakarmusasamaila@gmail.com>
Date: Sat, 24 Oct 2026 16:06:36 +0100
X-Gm-Features: AclHuK99BklcQsEQBiE_tBGIeGBFoFNj7HpEgy0uA-KhpZyzNFx1YZjL5cBBczA
Message-ID: <CAHxSwT_gJbatihGE4DAu=JmSnvWXpguUq4Yzg7jreTRhqzdQhA@mail.gmail.com>
Subject: staging: fbtft: fb_upd161704: Replace udelay() with usleep_range()
To: andy@kernel.org, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000047f7ec065e9772eb"

--00000000000047f7ec065e9772eb
Content-Type: text/plain; charset="UTF-8"

Hi Andy and Greg,

Please find attached the patch that replaces non-atomic udelay()
instances with appropriate usleep_range() bounds in
drivers/staging/fbtft/fb_upd161704.c.

Thanks,

Abubakar Musa Samaila

--00000000000047f7ec065e9772eb
Content-Type: application/octet-stream; 
	name="0001-staging-fbtft-fb_upd161704-Replace-udelay-with-uslee.patch"
Content-Disposition: attachment; 
	filename="0001-staging-fbtft-fb_upd161704-Replace-udelay-with-uslee.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mvmj4hza0>
X-Attachment-Id: f_mvmj4hza0

RnJvbSA3NzgwMzBhYTkyOTFlM2E3ZDQwZmZiMDNiMTllNjg3NzA0MWNkZGM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBYnViYWthciBNdXNhIFNhbWFpbGEgPGFidWJha2FybXVzYXNh
bWFpbGFAZ21haWwuY29tPgpEYXRlOiBTYXQsIDI0IE9jdCAyMDI2IDEyOjAyOjI1ICswMTAwClN1
YmplY3Q6IFtQQVRDSF0gc3RhZ2luZzogZmJ0ZnQ6IGZiX3VwZDE2MTcwNDogUmVwbGFjZSB1ZGVs
YXkoKSB3aXRoCiB1c2xlZXBfcmFuZ2UoKQoKU2lnbmVkLW9mZi1ieTogQWJ1YmFrYXIgTXVzYSBT
YW1haWxhIDxhYnViYWthcm11c2FzYW1haWxhQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3N0YWdp
bmcvZmJ0ZnQvZmJfdXBkMTYxNzA0LmMgfCAxOCArKysrKysrKystLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9zdGFnaW5nL2ZidGZ0L2ZiX3VwZDE2MTcwNC5jIGIvZHJpdmVycy9zdGFnaW5nL2ZidGZ0
L2ZiX3VwZDE2MTcwNC5jCmluZGV4IDcyODgxNDBlNy4uOTRhZTViYmYwIDEwMDY0NAotLS0gYS9k
cml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJfdXBkMTYxNzA0LmMKKysrIGIvZHJpdmVycy9zdGFnaW5n
L2ZidGZ0L2ZiX3VwZDE2MTcwNC5jCkBAIC0zMiwyNyArMzIsMjcgQEAgc3RhdGljIGludCBpbml0
X2Rpc3BsYXkoc3RydWN0IGZidGZ0X3BhciAqcGFyKQogCiAJLyogb3NjaWxsYXRvciBzdGFydCAq
LwogCXdyaXRlX3JlZyhwYXIsIDB4MDAzQSwgMHgwMDAxKTsJLypPc2NpbGxhdG9yIDA6IHN0b3As
IDE6IG9wZXJhdGlvbiAqLwotCXVkZWxheSgxMDApOworCXVzbGVlcF9yYW5nZSgxMDAsIDE1MCk7
CiAKIAkvKiB5LXNldHRpbmcgKi8KIAl3cml0ZV9yZWcocGFyLCAweDAwMjQsIDB4MDA3Qik7CS8q
IGFtcGxpdHVkZSBzZXR0aW5nICovCi0JdWRlbGF5KDEwKTsKKwl1c2xlZXBfcmFuZ2UoMTAsIDIw
KTsKIAl3cml0ZV9yZWcocGFyLCAweDAwMjUsIDB4MDAzQik7CS8qIGFtcGxpdHVkZSBzZXR0aW5n
ICovCiAJd3JpdGVfcmVnKHBhciwgMHgwMDI2LCAweDAwMzQpOwkvKiBhbXBsaXR1ZGUgc2V0dGlu
ZyAqLwotCXVkZWxheSgxMCk7CisJdXNsZWVwX3JhbmdlKDEwLCAyMCk7CiAJd3JpdGVfcmVnKHBh
ciwgMHgwMDI3LCAweDAwMDQpOwkvKiBhbXBsaXR1ZGUgc2V0dGluZyAqLwogCXdyaXRlX3JlZyhw
YXIsIDB4MDA1MiwgMHgwMDI1KTsJLyogY2lyY3VpdCBzZXR0aW5nIDEgKi8KLQl1ZGVsYXkoMTAp
OworCXVzbGVlcF9yYW5nZSgxMCwgMjApOwogCXdyaXRlX3JlZyhwYXIsIDB4MDA1MywgMHgwMDMz
KTsJLyogY2lyY3VpdCBzZXR0aW5nIDIgKi8KIAl3cml0ZV9yZWcocGFyLCAweDAwNjEsIDB4MDAx
Qyk7CS8qIGFkanVzdG1lbnQgVjEwIHBvc2l0aXZlIHBvbGFyaXR5ICovCi0JdWRlbGF5KDEwKTsK
Kwl1c2xlZXBfcmFuZ2UoMTAsIDIwKTsKIAl3cml0ZV9yZWcocGFyLCAweDAwNjIsIDB4MDAyQyk7
CS8qIGFkanVzdG1lbnQgVjkgbmVnYXRpdmUgcG9sYXJpdHkgKi8KIAl3cml0ZV9yZWcocGFyLCAw
eDAwNjMsIDB4MDAyMik7CS8qIGFkanVzdG1lbnQgVjM0IHBvc2l0aXZlIHBvbGFyaXR5ICovCi0J
dWRlbGF5KDEwKTsKKwl1c2xlZXBfcmFuZ2UoMTAsIDIwKTsKIAl3cml0ZV9yZWcocGFyLCAweDAw
NjQsIDB4MDAyNyk7CS8qIGFkanVzdG1lbnQgVjMxIG5lZ2F0aXZlIHBvbGFyaXR5ICovCi0JdWRl
bGF5KDEwKTsKKwl1c2xlZXBfcmFuZ2UoMTAsIDIwKTsKIAl3cml0ZV9yZWcocGFyLCAweDAwNjUs
IDB4MDAxNCk7CS8qIGFkanVzdG1lbnQgVjYxIG5lZ2F0aXZlIHBvbGFyaXR5ICovCi0JdWRlbGF5
KDEwKTsKKwl1c2xlZXBfcmFuZ2UoMTAsIDIwKTsKIAl3cml0ZV9yZWcocGFyLCAweDAwNjYsIDB4
MDAxMCk7CS8qIGFkanVzdG1lbnQgVjYxIG5lZ2F0aXZlIHBvbGFyaXR5ICovCiAKIAkvKiBCYXNp
Y2FsIGNsb2NrIGZvciAxIGxpbmUgKEJBU0VDT1VOVFs3OjBdKSBudW1iZXIgc3BlY2lmaWVkICov
CkBAIC02MCw3ICs2MCw3IEBAIHN0YXRpYyBpbnQgaW5pdF9kaXNwbGF5KHN0cnVjdCBmYnRmdF9w
YXIgKnBhcikKIAogCS8qIFBvd2VyIHN1cHBseSBzZXR0aW5nICovCiAJd3JpdGVfcmVnKHBhciwg
MHgwMDE5LCAweDAwMDApOwkvKiBEQy9EQyBvdXRwdXQgc2V0dGluZyAqLwotCXVkZWxheSgyMDAp
OworCXVzbGVlcF9yYW5nZSgyMDAsIDI1MCk7CiAJd3JpdGVfcmVnKHBhciwgMHgwMDFBLCAweDEw
MDApOwkvKiBEQy9EQyBmcmVxdWVuY3kgc2V0dGluZyAqLwogCXdyaXRlX3JlZyhwYXIsIDB4MDAx
QiwgMHgwMDIzKTsJLyogREMvREMgcmlzaW5nIHNldHRpbmcgKi8KIAl3cml0ZV9yZWcocGFyLCAw
eDAwMUMsIDB4MEMwMSk7CS8qIFJlZ3VsYXRvciB2b2x0YWdlIHNldHRpbmcgKi8KLS0gCjIuMzQu
MQoK
--00000000000047f7ec065e9772eb--
