Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792855945;
	b=Qf3D+2Y3HAH+4xSDBpPsVcPT+L9ubmM5/HYf0ByCauUPxHdj35GzzAcUKkUVrklfI+B4
	 l+YCFGSd0Ygi+mVPNdpJd6K0ppZAkXb/0wfgJABJyvi0SddkCozb0kFPlKgB52WsICRJo
	 QjL7mAnklG91LkITMRGqMVfgVTFOzzgcFfusCnprx5LnBcpFe5gEzxgH33gWdauZwODlS
	 oYiLhh8uv3OtX0Mp2jVkjml5mMxJuu+ID+1vSk7SgVAdOyUsRyjvV1pK4TNKh9ruBH01x
	 1ZVqUobnHn5fjVjzi8HpyFxxW2bECw99xRZ8+90Cyvdw/qOu6BukPCSQRb709qZuM9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792855945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=Pq5TTBQpf3VwcXoGs4pN0FqJDNE4MP0bsbNANOOcrSQ=;
	b=JUtqgCSEaiq/5SP11hPk8usB9CzKlfBeaPx0UiRON2V8XppnHLHPxQQ3h9Y1hUZw+iuU
	 c28HXKMFYS4QSF0QEG3ZSbakJZDAl0b34fEek8mAcT8mPOxHFaHV9Y6CqSv2fQTv3DwoV
	 d7A21cj281Vn/t+4F50gdOdHvLEAVf+U3JiJnihi6ardNyjcfDztHSI7UG8bxr8l1JACb
	 vQmFgauWwAG0KS3KvmulCxbxA9jWsGof6mQ0FYWWls4tCwaPlyAjXrLvhkstJaztBuJKM
	 6c20lYSju3nDT6CV79/tYt4A3kULGsuwWfeZVkcAWNHa7zttRDvWo33g1w++UtMnKpA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LqcKfIbf;
	arc=fail smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDCB606A31B
	for <linux-staging@lists.linux.dev>; Sat, 24 Oct 2026 15:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CDCB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LqcKfIbf
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4697404c2bso223979366b.2
        for <linux-staging@lists.linux.dev>; Sat, 24 Oct 2026 08:32:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792855943; cv=none;
        d=google.com; s=arc-20260327;
        b=WX8XKvXjk5A7a0L8Qwxp9e4ftj3SKLOlcmy0NnzG460mKljmecq2Xm6EgYAkzv/Trz
         qTzaNsBe+f7LFc9+h5R7mrkxH0uKOpzcKV587AGJlJRRDuhKNQyKK324k1sfWMnNxybx
         vwgaMWFpRSNgpg+EyXkm+YiFVJO94b/x2Sa99Jd6JVX4uyDq8LOzPlUB/smej+CxO5od
         KjBjhKwckA8RJc3C+YjdUVdpuPYSva8mGcc8EpCyOeiaEsNhGgYIFY3uOVr3a53NqZYv
         WLCkq9DNnCZeszZNVVzdYiAfavKK8xHZDqM2AgKKsNbQLuIE/5dc8FLhA4eOeGy4kIei
         Pc6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Pq5TTBQpf3VwcXoGs4pN0FqJDNE4MP0bsbNANOOcrSQ=;
        fh=75uz3KLQNrjELz2G26g2/v2DOmTy9+rmzYQYCZrQAPk=;
        b=MHCf+L07Elm4RS4VEjK2cgrQUg9ViJuDRXee0iloOL9d4Qlf2kE4rAbTfGm/lrh4y7
         bHPG9p59c0KwTU8HRE1bOdLfxnPaPTMriyiY7vN+SxsZoLljN4dTf7eTvAWPgIFFAAAP
         DQfZCWko+SETzmctPeFgQYsOMsDcUgb306AijFEMe5wCznsjnquzsU0QlBVzRxzdQsG3
         nTXfP3PTFNPFNsoW7K2bwqWl+6vwcUPx3y0qBYkodev4Ao8zipAHtl4sKJZveA9VT0oz
         OhH7opCFsf2fYTzOqhETN26BpujCCat9NUDtH8glNxC+w9TdDyj2xCU/6Xi6V6RPAwp0
         1bdw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792855943; x=1793460743; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pq5TTBQpf3VwcXoGs4pN0FqJDNE4MP0bsbNANOOcrSQ=;
        b=LqcKfIbfr2bYJGzWJ6A3QaxZes24GxQtE+8s11/J2Qq/HyeGl2Ri0pYdyRk3Nre6HR
         1L2EDYaa4d2k/GBDXluHaiX/7xqj1LVNJhF/RYD6XDCA0yq0xJxLjRn5IuIZs6KeYtyl
         b4bxXUy7apoiIO4EVd2Yv0ayND1KRQdszswYU2WI7ZZnYLZOgHZorxdy8In/Dco/8amJ
         +t7hvj+41NWwN2Mc81qS/ypAIAaORAJURatFDAVQMruHv9NipT3frDwUNY0IJkE/JIk4
         ut/JG9XQXIbDjAjT59Lx/biF2WHHC7c8oyGV3GZ75Fz4R3vXEkgyt/nm+1I03cyqw1iQ
         eRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792855943; x=1793460743;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Pq5TTBQpf3VwcXoGs4pN0FqJDNE4MP0bsbNANOOcrSQ=;
        b=Xs2aduoRhheq/Gdaehxtp4E6ExNl/GNNw34CmE+dl6LlPsyYih0+7TAwY426j1n4gy
         vs9TJqlQrGJVJPk0qLKADHywYu6NHjeF9JdVi3/7/eD7SUZlUYv1qxyZifVfAlFSE2LT
         oIAySweymQNOsvgOV5SF+YrUVxmAgBVMdgY+ZAj+g3KKP1wmB+YLY5UQVp9NkokSeLwp
         INzdEMwxeWnLsYa04GKX4EGFPdiKQgSw1CBfWtNaED9ie7MAffb4FtsApOi/Ab52JWT4
         E/fVXg95NapDVcB0UBD+0qs4voOv8f+35PlyQxkdLwHRRGN9cJp+ENGyV12cZYlM/927
         svPA==
X-Gm-Message-State: AFq9FYIOUJzoWichxkfh8mdKXM96TvO5NyPyxG9+adlbnk8o7HjvigLh
	haDqu41nx0Lp7dCZvPr1vPwd3S88F3WdXcQpxJWkT5TyKtdMKrfaVYVfG0v+uRgDF3BTrmSURKx
	zOH+nDGxxhPzLYeV2VdH2hZlhsspcfdk=
X-Gm-Gg: AYBFou3R1X5FAZbP8I/lHTgqMGhLec+jtwJTOmertM8Llgcgsyyf4wndwf/QD18i3Ti
	yqq/5lwo+LQXJEL1FNwR4yRfSTyKsMG7wtIesTYRhUNOJZrrxsKr3HgA2Xgd2Q/iJqG1Kd5fsDr
	Yx3A88s+6QRrczAyvx/kbTNiaVCXSIuJ9kFYUSwwSH7QvGkP5y0CnLc5EGiE5hfyYRgyidBTBtq
	b05ZfHcSdYXeNV0suj4Qm60w2FILIoCVPvQREKG2G1cM90mxQJG/yAu494S/5O9PkF8mCy6U0Gm
	e9GKqiy0UueYdUAUP/+2uu3CfyxxMJp0/EAZ/CntF0/Caj2tZUMIN6LHEYt+DUjuz8pdDHNH6Ip
	pk/1D47oYxgPt37Lzgoe73kddrZZ/Acv94UU5Row+1ks0wB9+efbYvZLGbYtXQ2+0YCERqN43TJ
	0K5pXvu9psiout3xM=
X-Received: by 2002:a17:907:930a:b0:c40:4965:72cb with SMTP id
 a640c23a62f3a-c46bde1c9acmr252909566b.21.1792855943476; Sat, 24 Oct 2026
 08:32:23 -0700 (PDT)
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
Date: Sat, 24 Oct 2026 16:32:11 +0100
X-Gm-Features: AclHuK9TU3AwsoiPULkfHVkczTh8p5LJGwDjkZKuc4re9S6dugKLiYK4K0vrngU
Message-ID: <CAHxSwT8=ZA2sFqXNjfX2=Bf369+gNRLfCO+VtVmmWiTzenLwWQ@mail.gmail.com>
Subject: staging: fbtft: fb_upd161704: Replace udelay() with usleep_range()
To: andy@kernel.org, gregkh@linuxfoundation.org, outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000a53d1b065e97cd84"

--000000000000a53d1b065e97cd84
Content-Type: text/plain; charset="UTF-8"

Hi Andy and Greg,

Please find attached the patch that replaces non-atomic udelay()
instances with appropriate usleep_range() bounds in
drivers/staging/fbtft/fb_upd161704.c.

Thanks,

Abubakar Musa Samaila

--000000000000a53d1b065e97cd84
Content-Type: application/octet-stream; 
	name="0001-staging-fbtft-fb_upd161704-Replace-udelay-with-uslee.patch"
Content-Disposition: attachment; 
	filename="0001-staging-fbtft-fb_upd161704-Replace-udelay-with-uslee.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mvmk3skb0>
X-Attachment-Id: f_mvmk3skb0

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
--000000000000a53d1b065e97cd84--
