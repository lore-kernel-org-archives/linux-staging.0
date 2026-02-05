Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05872EAB6F
	for <linux-staging@lists.linux.dev>; Thu,  5 Feb 2026 19:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770319627; cv=none; b=ebozTXwwMNPUjpAHtpD/kLZ6djrlLByKlEyXqxTDf+twh5b5mAAnvzKoGT2KzAB085upDLmIkCu40duxY0FWKzL66ouwOMTmEdpQiXjaIR7EI74kU+nogW8VSM7t7oss9mu/qSfXQnZNQc3GkBOvqpeDjtpRNSS59uHPJbUp7GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770319627; c=relaxed/simple;
	bh=UkjXdNB8ZaRImZ9r7CJvMWoNlDFR14ODdNEHd1OFRqg=;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-ID:Date:
	 In-Reply-To:References; b=nzk3Jo2ZmRLJyyxXJUVsHu05MqJTDMLS6GA3yCvNJ/SvV3yWqLvxC7JEMFx9CtyUZq8Q+gH/bP9mxwS9LBGGVSutYvNIQrP6m9JlcPXz5uqFqj9+yxX/h0O9FieCTegzDeo1eJv9ZKgxP3jUfgPil8dEXRSRzLDIDu7AaKdwBjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c4AMMOJH; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c4AMMOJH"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59e0d5c446cso1687557e87.0
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 11:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770319625; x=1770924425; darn=lists.linux.dev;
        h=references:in-reply-to:date:message-id:subject:cc:to:from
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UkjXdNB8ZaRImZ9r7CJvMWoNlDFR14ODdNEHd1OFRqg=;
        b=c4AMMOJHfLYF9ZmQbmtuddQjUKxMOkoWaxfcQSOurTyO1q1Rdb+khkEmC0nNTGUWsc
         r4v0OafqiFhV76ExJxsXFBEXMJJppgovGavfk4F4epoQlBqBCd4tq3jog7UY15rgZVKn
         wK+jv6gyAlg5reJvC0YxuScyBYANCn0IUjj5LQZ1LtYFKNXcaoZdI+VeDpGq+zM8f8C/
         L3mlk1TNtP8KurBVkIFwQZDSlxXcon/R38pN38tmgaiDsxlBlJwatSjHEdl6XT5WOLw0
         DX7771cdbudGToGMPSZOG8VAbkZ4sbiqC1fPtHcs3I8Z+yi2uoDtft4ZD+InvzwzF4r6
         jxdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770319625; x=1770924425;
        h=references:in-reply-to:date:message-id:subject:cc:to:from
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UkjXdNB8ZaRImZ9r7CJvMWoNlDFR14ODdNEHd1OFRqg=;
        b=Cm379uS617bYVQuJOmWF6zZ9k68OEgGpf7VEqj6CgT2k+blLKyhUUYNlDJbIfNVvdI
         GuErDTB3RmerkALTrPT5+Qnb4kvWbpTA6OU46SNRKz+sPWg4YA808OS5Ip7v477uauKP
         vGbstdbeQi0u+H3GHiftI6jMHCqM8AzMzurbyiqfP1/7u30v7nS9OS2klPR//5+21L1f
         j4djS//VvjrPdnUyhce0m41qqCO5xZly/5exrdt0nj4RNmrkCy2ssG2ydxdXpVMmc9Sl
         jA+NBrhpFFXpKBriHBA4Iw8lwawv/sGRjvVfJCtDQD4e2SKRh0bdXUhxzVcQjXvOv6Q5
         ITCw==
X-Gm-Message-State: AOJu0Ywxfguu1vlLY8fEmSI0/6Lwq2hXXzN/Nw9TXbxWNheu7i/PN1v7
	eQz0mlrwluoJXbuhf++ZyhpBsR6V9xLIkWjXvbAvrSV4GI6CzF5Chbh7rHoQ1xJc
X-Gm-Gg: AZuq6aLfGlp2XmzQtlSTguZBVl43SvJt6oGA0tMWMYUF8s4m8mmAHAHxfYyP4Ovxv5F
	qNM9d4PEB9On/gRJoRboT+21VZLKDvM6c5e1N+7KqdCflATrfSmMDI6yx+/7QlRdcIDEoYsfleI
	IWGYyoisSCoEhn+xTFk5RmN9utjLn8O7UHBtgGYxSy/vRMIY5ZppnCf7LGi1ie8FvwpnklHEhH4
	wLAoU4Vcc3t7vMWN0uSsPT9ZtF68+zByRctyIdd262yqhxUrtYK22SHrH2Hz59oHdoZonRnAiWS
	Y1oWd4FR5bmyqJumvoaR7GF4nNIJixkXlRvpuGiZ4cishyu7TccaUXDZU9bfqws6I50L0gcTCwi
	f8eGQWPIMQRlgPI0ehUyqRadcZdeJYhKozXLJXvtfelwpzs80O/fqJZXy/fmSG4+eNGJ9YWVXdM
	fDm0eG1+xpyA==
X-Received: by 2002:a05:6512:1043:b0:59e:384b:94bf with SMTP id 2adb3069b0e04-59e4515a355mr12476e87.33.1770319624739;
        Thu, 05 Feb 2026 11:27:04 -0800 (PST)
Received: from [26.61.26.19] ([95.104.166.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b6408bbasm22381fa.39.2026.02.05.11.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 11:27:04 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: frankfmy <pryanishnikovartem@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev
Subject: [PATCH 3/5] staging: rtl8723bs: fix spelling errors in os_dep files
Message-ID: <1770319626.3.pryanishnikovartem@gmail.com>
Date: Thu, 05 Feb 2026 23:27:04 +0400
In-Reply-To: <1770319619.1.pryanishnikovartem@gmail.com>
References: <1770319619.1.pryanishnikovartem@gmail.com>

Rml4IHNwZWxsaW5nIGVycm9ycyBmb3VuZCBieSBjb2Rlc3BlbGwgaW4gdGhlIHJ0bDg3MjNicyBz
dGFnaW5nCmRyaXZlciBvc19kZXAgZmlsZXM6CgotIHdpZmlfcmVnZC5jOiBQQVNTSVYgLT4gUEFT
U0lWRQotIGlvY3RsX2NmZzgwMjExLmM6IGluY2x1ZWQgLT4gaW5jbHVkZWQsIHJlZ3VsYXJ5IC0+
IHJlZ3VsYXRvcnkKLSBvc19pbnRmcy5jOiB0ZXJtaW5kYXRlIC0+IHRlcm1pbmF0ZQoKU2lnbmVk
LW9mZi1ieTogZnJhbmtmbXkgPHByeWFuaXNobmlrb3ZhcnRlbUBnbWFpbC5jb20+Ci0tLQogZHJp
dmVycy9zdGFnaW5nL3J0bDg3MjNicy9vc19kZXAvaW9jdGxfY2ZnODAyMTEuYyB8IDQgKystLQog
ZHJpdmVycy9zdGFnaW5nL3J0bDg3MjNicy9vc19kZXAvb3NfaW50ZnMuYyAgICAgICB8IDIgKy0K
IGRyaXZlcnMvc3RhZ2luZy9ydGw4NzIzYnMvb3NfZGVwL3dpZmlfcmVnZC5jICAgICAgfCAyICst
CiAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvcnRsODcyM2JzL29zX2RlcC9pb2N0bF9jZmc4MDIxMS5j
IGIvZHJpdmVycy9zdGFnaW5nL3J0bDg3MjNicy9vc19kZXAvaW9jdGxfY2ZnODAyMTEuYwppbmRl
eCA2MGVkZWFlMWMuLmNmY2Y1YmFmZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL3J0bDg3
MjNicy9vc19kZXAvaW9jdGxfY2ZnODAyMTEuYworKysgYi9kcml2ZXJzL3N0YWdpbmcvcnRsODcy
M2JzL29zX2RlcC9pb2N0bF9jZmc4MDIxMS5jCkBAIC0yMjY2LDcgKzIyNjYsNyBAQCBzdGF0aWMg
aW50IHJ0d19hZGRfYmVhY29uKHN0cnVjdCBhZGFwdGVyICphZGFwdGVyLCBjb25zdCB1OCAqaGVh
ZCwgc2l6ZV90IGhlYWRfbAogCiAJbGVuID0gaGVhZF9sZW4gKyB0YWlsX2xlbiAtIDI0OwogCi0J
LyogY2hlY2sgd3BzIGllIGlmIGluY2x1ZWQgKi8KKwkvKiBjaGVjayB3cHMgaWUgaWYgaW5jbHVk
ZWQgKi8KIAlydHdfZ2V0X3dwc19pZShwYnVmICsgX0ZJWEVEX0lFX0xFTkdUSF8sIGxlbiAtIF9G
SVhFRF9JRV9MRU5HVEhfLCBOVUxMLCAmd3BzX2llbGVuKTsKIAogCS8qIHBic3NfbmV0d29yay0+
aWVzIHdpbGwgbm90IGluY2x1ZGUgcDJwX2llLCB3ZmQgaWUgKi8KQEAgLTI3MjAsNyArMjcyMCw3
IEBAIGludCBydHdfd2Rldl9hbGxvYyhzdHJ1Y3QgYWRhcHRlciAqcGFkYXB0ZXIsIHN0cnVjdCBk
ZXZpY2UgKmRldikKIAkqKChzdHJ1Y3QgYWRhcHRlciAqKil3aXBoeV9wcml2KHdpcGh5KSkgPSBw
YWRhcHRlcjsKIAlydHdfY2ZnODAyMTFfcHJlaW5pdF93aXBoeShwYWRhcHRlciwgd2lwaHkpOwog
Ci0JLyogaW5pdCByZWd1bGFyeSBkb21haW4gKi8KKwkvKiBpbml0IHJlZ3VsYXRvcnkgZG9tYWlu
ICovCiAJcnR3X3JlZ2RfaW5pdCh3aXBoeSwgcnR3X3JlZ19ub3RpZmllcik7CiAKIAlyZXQgPSB3
aXBoeV9yZWdpc3Rlcih3aXBoeSk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvcnRsODcy
M2JzL29zX2RlcC9vc19pbnRmcy5jIGIvZHJpdmVycy9zdGFnaW5nL3J0bDg3MjNicy9vc19kZXAv
b3NfaW50ZnMuYwppbmRleCA2Y2E2ZGM1NDguLmU1YTQxZjdmMCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9zdGFnaW5nL3J0bDg3MjNicy9vc19kZXAvb3NfaW50ZnMuYworKysgYi9kcml2ZXJzL3N0YWdp
bmcvcnRsODcyM2JzL29zX2RlcC9vc19pbnRmcy5jCkBAIC00ODgsNyArNDg4LDcgQEAgdm9pZCBy
dHdfc3RvcF9kcnZfdGhyZWFkcyhzdHJ1Y3QgYWRhcHRlciAqcGFkYXB0ZXIpCiB7CiAJcnR3X3N0
b3BfY21kX3RocmVhZChwYWRhcHRlcik7CiAKLQkvKiAgQmVsb3cgaXMgdG8gdGVybWluZGF0ZSB0
eF90aHJlYWQuLi4gKi8KKwkvKiAgQmVsb3cgaXMgdG8gdGVybWluYXRlIHR4X3RocmVhZC4uLiAq
LwogCWNvbXBsZXRlKCZwYWRhcHRlci0+eG1pdHByaXYueG1pdF9jb21wKTsKIAl3YWl0X2Zvcl9j
b21wbGV0aW9uKCZwYWRhcHRlci0+eG1pdHByaXYudGVybWluYXRlX3htaXR0aHJlYWRfY29tcCk7
CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ydGw4NzIzYnMvb3NfZGVwL3dpZmlfcmVn
ZC5jIGIvZHJpdmVycy9zdGFnaW5nL3J0bDg3MjNicy9vc19kZXAvd2lmaV9yZWdkLmMKaW5kZXgg
ZjljNGQ0ODdiLi5lY2U0NTU0ZDcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ydGw4NzIz
YnMvb3NfZGVwL3dpZmlfcmVnZC5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9ydGw4NzIzYnMvb3Nf
ZGVwL3dpZmlfcmVnZC5jCkBAIC0yNyw3ICsyNyw3IEBACiAgKiBieSBjYXNlIGJhc2lzIGJ5IHJl
Z3VsYXRvcnkgZG9tYWluCiAgKi8KIAotLyogMkcgY2hhbiAxMiAtIGNoYW4gMTMsIFBBU1NJViBT
Q0FOICovCisvKiAyRyBjaGFuIDEyIC0gY2hhbiAxMywgUEFTU0lWRSBTQ0FOICovCiAjZGVmaW5l
IFJUV18yR0haX0NIMTJfMTMJXAogCVJFR19SVUxFKDI0NjcgLSAxMCwgMjQ3MiArIDEwLCA0MCwg
MCwgMjAsCVwKIAlOTDgwMjExX1JSRl9QQVNTSVZFX1NDQU4pCi0tIAoyLjM0LjEK
