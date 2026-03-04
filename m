Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD84939B945
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 11:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772623602; cv=none; b=f2G0gfAQ4pKcMEvJFbqPZUxUb0+gvfuAZ6fdgiBQ++oO25ON4+7k5Lcca9ypmbPFV9rVuq+vpbgF7HbK+HLlWD8AzuNwLjN86klKSfT/z0uzd03YiKp+MJgJS4LWoplDAuZQNMLcUcpSCVCk+2hku0W8mqHqW3IfRWGmk97GN8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772623602; c=relaxed/simple;
	bh=XibWYL/kjCESiMWq9UcxEAfqwKcEcc6zzQ8hyppjr2k=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:Cc:From:Subject; b=l6EqdUtmBrMyvJ4k3AVewPAuUeVXabKnOSVmSEcd52eVocRSzcEgqMVgGqtiRJjef79+FMyrxSqlDlQ/zKfKmlOVP+VV8rp7BD8ifocj6P+W8KLjT1va5G4tJWxR0uZdYGOml52DLocQJyBbXEEGq1KWgEC2+bawz1hQt0n5oqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HeiqYbWm; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HeiqYbWm"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-660bdba9390so2040060a12.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 03:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772623600; x=1773228400; darn=lists.linux.dev;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XibWYL/kjCESiMWq9UcxEAfqwKcEcc6zzQ8hyppjr2k=;
        b=HeiqYbWmeqtUWPU3X6gIgebjnPWc1S6jOUiRKnGm5VWydHNNnuWKRZAe8wuI+RTvdc
         YsgZjlmNxoadumPIFECzzYIMfBfYR8DkAyHe6+NItaJLxfwHg+rLXlGnMSF3uzpnfbzb
         rEBRK6XEb/sv4iWKCpN0N1kwaEYH4DXt83+1cc1OO+MfS7siutqZOIYggRBbmX5rIt6d
         P5n9vVslNAng9X1mZADDNyC0PPIN7mO2Rr1R0DozCdvPE4LNNGUR5D2fsJZj8ESktJCX
         5DcW6hpC0Sl8D9kEahrEq2ohQMFxVbOwZMnum+GXmCfDsOST3zVpeW0OFlzaiEDd01iO
         +0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772623600; x=1773228400;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XibWYL/kjCESiMWq9UcxEAfqwKcEcc6zzQ8hyppjr2k=;
        b=Cbn8JfSO9Nao1FkpifZrfo+MJ9zw6ytOMpmg7kX269kfqjbM+RWKos1bQYprQ2ZDmq
         Z5d+sKhtQxVk2N1YSU+RDk7SCJsz2x5oeh156uId83t8Rur4m/2glcMA6WGxyt+an9Hd
         4OgIZYuAvfKuEA2OyWjhqGDG+wWhfzXeJ53WgbnCI2hDnDC9KQ5ggQseUnjwVWTzbAub
         hFMhhRJnpAAx7PyovN8L5vx9OKyj4snSFT9ZehSEvLiqJeDqH2rGnnROXni8T66/iUlw
         LdWXI/9duYTxdYX0/tmbu07+fAabn9i8K6NndpgafxUhj9lG4gl1qcyg+/QSg4l5Ge/x
         S10w==
X-Gm-Message-State: AOJu0YyseIiCS/iA8s+3CiXdi4EUF2WeKKRRHexNdCXX4uMUXzHqK0g0
	W3m9vE3Gc22RAso45KnaX8CyT3790pbanV3uwbQSyZcC2vNmtcRKbgh04AzUl36C5fZ6IA==
X-Gm-Gg: ATEYQzxpVBL0ngGdmHSiKdJelbasjDcEndBXAo1QsVssX8I7EWSGAMLFJc25sXCeS9n
	Va9qpPqEq1WQv+mTGdmRS8Nb+3wFcxNXHTsujHELIE7Q6eqSPHHpV+klRnNyiOr39YO21yOqsMt
	R+VU40Rm+UvIBPAtFxxkiC1yaCXo/RPD1yAdKwXnD7D5DDqSzEMNZX1StvGdBqV9iWcvYTxDN1g
	LDw5zeuibGxYha1byqMWPmX9zn3xkkDhFwDXGsVT54oCtJB+M8Ev6Y0ODptBcgQAfVWgNB+8pbu
	BKrIpELhhpQcOzIRQk4jNh8NdfGDckpnAsmywWCmhf5D5sZFXwVaVP+XkYCr3J5YvUBECYewvvW
	4aFxeocsRIzi0DjNqTasKWutl7DyAKy2anVYmvR/gu8KKThJj7xAn0KvhybH+2OPir66ludXOkz
	MPXb8VbI6HH+BKuOAS8Ot+KBRYPHnk3oket3b2SEplH2kLcBgvK48lovePgjp8HCt1R2BHwiUFD
	oE3fHIkGwx5CbeVi1MHiMoyeKYONsBHvljuT25mU0qfbGV/Z73qpMSxXNiGuXoweg7lEM/3
X-Received: by 2002:a05:6402:42c9:b0:660:475:9403 with SMTP id 4fb4d7f45d1cf-660f04d3ab3mr926397a12.29.1772623599964;
        Wed, 04 Mar 2026 03:26:39 -0800 (PST)
Received: from [88.202.160.248] ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabf6cfd9sm5438625a12.22.2026.03.04.03.26.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 03:26:38 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------5PlJgEKJdYb3RbrP7JpSp5L0"
Message-ID: <c6e77299-e978-40f1-a574-f2f1eec2eb78@gmail.com>
Date: Wed, 4 Mar 2026 12:26:38 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
From: Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace kzalloc/kmalloc+memcpy with
 kmemdup

This is a multi-part message in MIME format.
--------------5PlJgEKJdYb3RbrP7JpSp5L0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Replace kzalloc/kmalloc followed by memcpy with kmemdup to simplify
code and avoid unnecessary zero-initialization before overwriting.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
--------------5PlJgEKJdYb3RbrP7JpSp5L0
Content-Type: text/plain; charset=UTF-8;
 name="0001-staging-rtl8723bs-replace-kzalloc-kmalloc-memcpy-wit.patch"
Content-Disposition: attachment;
 filename*0="0001-staging-rtl8723bs-replace-kzalloc-kmalloc-memcpy-wit.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSAzZWQ0NGRmZjljZWU2NTU1N2RlYjMyMjE0MDJhOWY4ZjljYjk5NTdmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4YW5kcnUgSG9zc3UgPGhvc3N1LmFsZXhhbmRy
dUBnbWFpbC5jb20+CkRhdGU6IFdlZCwgNCBNYXIgMjAyNiAxMjoyNDozMyArMDEwMApTdWJq
ZWN0OiBbUEFUQ0hdIHN0YWdpbmc6IHJ0bDg3MjNiczogcmVwbGFjZSBremFsbG9jL2ttYWxs
b2MrbWVtY3B5IHdpdGgKIGttZW1kdXAKClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBIb3Nz
dSA8aG9zc3UuYWxleGFuZHJ1QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3N0YWdpbmcvcnRs
ODcyM2JzL2hhbC9zZGlvX29wcy5jICAgICAgICAgIHwgNCArLS0tCiBkcml2ZXJzL3N0YWdp
bmcvcnRsODcyM2JzL29zX2RlcC9pb2N0bF9jZmc4MDIxMS5jIHwgNCArLS0tCiAyIGZpbGVz
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3N0YWdpbmcvcnRsODcyM2JzL2hhbC9zZGlvX29wcy5jIGIvZHJpdmVycy9z
dGFnaW5nL3J0bDg3MjNicy9oYWwvc2Rpb19vcHMuYwppbmRleCBjOWNiMjBjNjEuLjUxNGM4
NTdhOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL3J0bDg3MjNicy9oYWwvc2Rpb19v
cHMuYworKysgYi9kcml2ZXJzL3N0YWdpbmcvcnRsODcyM2JzL2hhbC9zZGlvX29wcy5jCkBA
IC01ODMsMTIgKzU4MywxMCBAQCBzMzIgc2Rpb19sb2NhbF93cml0ZSgKIAkpCiAJCXJldHVy
biBzZF9jbWQ1Ml93cml0ZShpbnRmaGRsLCBhZGRyLCBjbnQsIGJ1Zik7CiAKLQl0bXBidWYg
PSBrbWFsbG9jKGNudCwgR0ZQX0FUT01JQyk7CisJdG1wYnVmID0ga21lbWR1cChidWYsIGNu
dCwgR0ZQX0FUT01JQyk7CiAJaWYgKCF0bXBidWYpCiAJCXJldHVybiAtRU5PTUVNOwogCi0J
bWVtY3B5KHRtcGJ1ZiwgYnVmLCBjbnQpOwotCiAJZXJyID0gc2Rfd3JpdGUoaW50ZmhkbCwg
YWRkciwgY250LCB0bXBidWYpOwogCiAJa2ZyZWUodG1wYnVmKTsKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvc3RhZ2luZy9ydGw4NzIzYnMvb3NfZGVwL2lvY3RsX2NmZzgwMjExLmMgYi9kcml2
ZXJzL3N0YWdpbmcvcnRsODcyM2JzL29zX2RlcC9pb2N0bF9jZmc4MDIxMS5jCmluZGV4IDdj
YjBjNmYyMi4uMjEyNTYwNmY3IDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvcnRsODcy
M2JzL29zX2RlcC9pb2N0bF9jZmc4MDIxMS5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9ydGw4
NzIzYnMvb3NfZGVwL2lvY3RsX2NmZzgwMjExLmMKQEAgLTE0MzAsMTQgKzE0MzAsMTIgQEAg
c3RhdGljIGludCBydHdfY2ZnODAyMTFfc2V0X3dwYV9pZShzdHJ1Y3QgYWRhcHRlciAqcGFk
YXB0ZXIsIHU4ICpwaWUsIHNpemVfdCBpZWwKIAkJZ290byBleGl0OwogCX0KIAotCWJ1ZiA9
IGt6YWxsb2MoaWVsZW4sIEdGUF9LRVJORUwpOworCWJ1ZiA9IGttZW1kdXAocGllLCBpZWxl
biwgR0ZQX0tFUk5FTCk7CiAJaWYgKCFidWYpIHsKIAkJcmV0ID0gIC1FTk9NRU07CiAJCWdv
dG8gZXhpdDsKIAl9CiAKLQltZW1jcHkoYnVmLCBwaWUsIGllbGVuKTsKLQogCWlmIChpZWxl
biA8IFJTTl9IRUFERVJfTEVOKSB7CiAJCXJldCAgPSAtMTsKIAkJZ290byBleGl0OwotLSAK
Mi40My4wCgo=

--------------5PlJgEKJdYb3RbrP7JpSp5L0--
