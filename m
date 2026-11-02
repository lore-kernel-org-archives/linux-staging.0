Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793632815;
	b=bTUDYQ1H2cisaCyOmriEs7xdPXuHtZ7tUUBAm8B1g9RkyUYbwokImBoEXRpb+XcwpOrC
	 ClrBazNnbGgkGJlJYRWMeui2gZb3ufJRlkV0cIEsc2fuF/9QgtZAuhlhQA6qSWLXstVK4
	 xc4zymDh7kIOHT3M+iCKtPVH2Tpc9KrNpENHdv2WsLfbUufy09ZbhaKk7GqFYFrlHqH5v
	 +fGGBZk90+6eDfUYakVwUbRNlmc2zxq9tLSN4sWvMRHgQ2cynSLbEZDeKMpORp8JSL+VM
	 3mD6GtMDqy5L2fni89oKsw/sPonT6SPyqdP6Q9OmhTFZub8Su4H8uNTF57hKy2tfyHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=jCAcms03PgHfylKd55X7vaoipR+obD9f7fUeztrZpIc=;
	b=gJBTYOqY8+3VHFpzNKB9lsC1l4DCuuIZKioxPP1mSUQ/fC+oXq/S5yWgJoRkDVtWvs+X
	 cZFbNHFNXvgidmbb2iQc5s3q/1SBwUvEoj8cdRjQbbsCeCm7ph486xexXIz9tZLOMG2N+
	 Fia9jOke1rWjVgY6H0JxzbRHvFFaT6lzxtoaZUT2Jf69PFsgmgW90R7USNq/JxnRCyF6V
	 k4AEYEvqzNUgJgLDyWciW/M9k810HwPjfWrhVkEPixFpAlErKeiS870mwJfMXVBwnLUGQ
	 E9+gxGS/9HwmpUQBtEjXTbXigx+IystSGRqmvgbj5sXAEwZ2CEOn7pdfy8VA7KwOoRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bitmesra.ac.in;
	spf=pass smtp.mailfrom=bitmesra.ac.in;
	dkim=pass header.d=bitmesra.ac.in header.i=@bitmesra.ac.in header.a=rsa-sha256 header.s=google header.b=SMlNo2al;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A179760810E1
	for <linux-staging@lists.linux.dev>; Mon,  2 Nov 2026 15:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A179760810E1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitmesra.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitmesra.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=bitmesra.ac.in header.i=@bitmesra.ac.in header.a=rsa-sha256 header.s=google header.b=SMlNo2al
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a1f628b1d1so27383981fa.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Nov 2026 07:20:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793632811; cv=none;
        d=google.com; s=arc-20260327;
        b=oEmm8KyPZzPQemjUzvGqCZySjDil8l4OMATJzvdJ+FoBOo3wSQM6G9yygNdFcO2804
         Vl95zmPMudF0z/CUFJCb5alZsp0eDWalh9Eqbx3LC7p7IK4M/PulCRDI1IRgi9IORLkQ
         OzjERlbQu53r0gvtY44xh+sU6UJWMzigLWJ09ycM6CiDT2sTYyBg9cydzAZulknFmFce
         ANkIl0ds0QoI4ORlYO0LsrD33DhXc4/dKp9bZBlorTLvJ5TrOKd/XjSYt0qb5Cl6BLsz
         bFG6SUEAW17Wut2FxaFxuJoqkh0uP2CYlNM+Oh3hpglskp8sS6NYeNumfEkHM3dAcEW6
         y+5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jCAcms03PgHfylKd55X7vaoipR+obD9f7fUeztrZpIc=;
        fh=SKAFzyEvssirskLywp18W93ooOMt1D85pQy9IM+DIuc=;
        b=kqQuBosLGfg/vW2BMB6TxMBah+moUILsInSeaab/ChYdqIZp0ZIlMgennBCoPPDlIY
         Gxc63io5cthZH5oWWRL8m9xgTUCPnpv19y8+4oMngrnOadBLHn6xTsPfzTrUz9Ui6L/w
         RStV8J7Qzym71zxN7bUTMqJgXdDM2K77KY88RNBr82qcTLn7/6xgPjjZjR9mbZ5n4kze
         Q0diqsXtmuJQuZG2Fh3sKr67EnM9WiKuBbUSrf6jCPdGCn3Fsxgq0ksU+sGaIUz34uW0
         RjGtIR6pkR7Bn0ftpIhE41VaKvtgyWMsWask/XplbxCQ5IJ1KLvhV4W2WhRBTygsr4yI
         C/yQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bitmesra.ac.in; s=google; t=1793632811; x=1794237611; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jCAcms03PgHfylKd55X7vaoipR+obD9f7fUeztrZpIc=;
        b=SMlNo2alk0suYxh8aWzlK/Uj4mQH3RRp33jFOGqzZEf8CV2CvEngpHkIz1kdWCviOb
         5CVG9RwZI2sjEHGfx/HlyzXqPTxEyIuC54r3sntkEAe68PS/kFqzdmjKjA2l+/ez2vVN
         UetZIXxzTJC+FVPeeDBDRl4XFyCrU63BZepDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632811; x=1794237611;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jCAcms03PgHfylKd55X7vaoipR+obD9f7fUeztrZpIc=;
        b=tURiB4CPkwP5xLA1AyQ9MzSNWUp9nglbAQBk5vr5bbcyizwV8Y87fGfVLD0vCzeFYF
         gMHhMfclFRrBhlgXcPh8VznJoPiAKRouPA3ml9GPO8aVEeJegkBkrEL8bAG5GedymziB
         r78374Pl8w2NUjR7DAH4TDO44KtWD8L/OY41ejBMbNumSVCsd4Zvdu83quT4Vb+lOz3D
         RTD4djVNYUw70oph4Ta65ixewmOkKQua3AGDT1Sr1NH+gz/0lEFMmKbG+dDo1E4DDSVA
         ueC13ASyDeiCr1GiM96hcgh4WeaOlviz5PnT0zD0sQb1EhTJwlv8g0MOtn/xUZiWu1A5
         saww==
X-Forwarded-Encrypted: i=1; AKwUvBxHTiwvX4/pUyqIYNFq1L+LLpWYNYsUB7A9DQVoxMlB6QXMCvfJ3MHyMZ5GpSAhQlQlmRGQnrzemFs3GMaz@lists.linux.dev
X-Gm-Message-State: APuU4Z9UQJeSIavisO9YoH5ecJ45tKPCUqKahKecBE3O+tILdp2bI0CF
	VHF48vX4nBAKK7qwYLL59vFpUKxLmEAETIhaEwGCuFpiKXBb9nW/wxFtLS4h0SW0jFEYk3+FEy2
	cB8Zwo4Kni2mhEU1DCE82NKIIW8LVDlrrvufVcYFb
X-Gm-Gg: AYBFou2D4/UutnFSBbabSQ8nA2DzonJ/Yd/lKB4nKvHGaCJOQUIUW8kpCfyb89jsxYa
	QQYTYDirFQbwo4XaeFcetLBmdlaPFMFb0nUv381f7ZvLi2qbAqiM314MUMz2UczsqjXS9GwXJ9C
	G2JZC1OU0sDMa8TnXeP2ZgpLVQEglvXlB9UkR79A5Su7Z1c+URwAxnIDyHtL/or8Tc88ouEirPG
	FlEb23wiX9g7XOuBnRdmeBJrRsSLDCGk3Zg66xHHBn08TYEqgmaw0O0ipI0WVt9PbybNSIw5lCG
	BQ2QUUgRzOkd5FUEeFaJ6Ipgm8hSkQ1N+hbS0Nuf7jeegE/Zb+CJJTO4XW/QTV5Nq2Y0VZr8OLc
	xviZmQoH4YjLMNreDC83ykVqGQ/Z4s4qz4fdM
X-Received: by 2002:a2e:a555:0:b0:3a6:5ec0:7977 with SMTP id
 38308e7fff4ca-3acb7b45f8dmr26393441fa.22.1793632810735; Mon, 02 Nov 2026
 07:20:10 -0800 (PST)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAPwSj7XvbTR3qtSev-xEtZeewwvSWFXPhK5F12VGzSiQoNudNg@mail.gmail.com>
 <auihq9nm86d6D3MW@stanley.mountain>
In-Reply-To: <auihq9nm86d6D3MW@stanley.mountain>
From: Kurmapu Sai Devansh Prasad <btech10487.26@bitmesra.ac.in>
Date: Mon, 2 Nov 2026 20:49:58 +0530
X-Gm-Features: AclHuK_VfT4FJjU6g92l9xx4wu9FH1YpyYCN2gnLejd3kEhEM3Icra10HG6srbg
Message-ID: <CAPwSj7W3HxLeMLHCdjEOQ2pr39tSKD1_VyHwMpq-MshTpaiP2g@mail.gmail.com>
Subject: Re: [PATCH] staging: greybus: fix string termination in firmware sample
To: Dan Carpenter <error27@gmail.com>
Cc: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org, 
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000008ad07d065f4cae10"

--0000000000008ad07d065f4cae10
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 8:13=E2=80=AFPM Dan Carpenter <error27@gmail.com> wr=
ote:
>
> On Mon, Nov 02, 2026 at 07:44:09PM +0530, Kurmapu Sai Devansh Prasad wrot=
e:
> > >From 9114eb9d60f2c4a52f05e3a33b0d6b8ca4856cac Mon Sep 17 00:00:00 2001
> > From: Kurmapu Sai Devansh Prasad <btech10487.26@bitmesra.ac.in>
> > Date: Mon, 2 Nov 2026 19:11:09 +0530
> > Subject: [PATCH] staging: greybus: fix string termination in firmware s=
ample
> >
> > The firmware_tag string copied via strncpy() is not guaranteed to be
> > NUL-terminated if the source string is exactly the size of the destinat=
ion
> > buffer. This can lead to a buffer over-read.
> >
> >  Since alternatives like strscpy_pad cannot be used in user space
> > sample code, we can make it  safer by limiting the copy size to
> > MAX_SIZE - 1 and explicitly assigning the last byte to be a NUL
> > terminator. This ensures the string is always
> > safely terminated before being passed to the ioctl.
>
> In user space, using strncpy() is fine.
>
> >
> > Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#st=
rncpy-on-nul-terminated-strings
> >
> > This is my very first patch to the Linux kernel! I've been learning the
> > process and would deeply appreciate any feedback from the maintainers.
>
> Put this sort of unrelated conversational stuff under the --- cut off
>
> >
> > Signed-off-by: Kurmapu Sai Devansh Prasad <btech10487.26@bitmesra.ac.in=
>
> > ---
>   ^^^
> here.  So that it doesn't get saved into the kernel git log.
>
> The patch is pretty badly corrupted and doesn't apply.  Read the first
> two paragraph of Documentation/process/email-clients.rst
>
> regards,
> dan carpenter
>

--0000000000008ad07d065f4cae10
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="v2-0001-staging-greybus-fix-string-termination-in-firmwar.patch"
Content-Disposition: attachment; 
	filename="v2-0001-staging-greybus-fix-string-termination-in-firmwar.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mvzelf7f0>
X-Attachment-Id: f_mvzelf7f0

RnJvbSA4YWMxYjgxM2E1MjAzN2EzNjBkNThlOGUzNDViNjYxMTkzMjU4YjYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLdXJtYXB1IFNhaSBEZXZhbnNoIFByYXNhZCA8YnRlY2gxMDQ4
Ny4yNkBiaXRtZXNyYS5hYy5pbj4KRGF0ZTogTW9uLCAyIE5vdiAyMDI2IDE5OjExOjA5ICswNTMw
ClN1YmplY3Q6IFtQQVRDSCB2Ml0gc3RhZ2luZzogZ3JleWJ1czogZml4IHN0cmluZyB0ZXJtaW5h
dGlvbiBpbiBmaXJtd2FyZQogc2FtcGxlCgpUaGUgZmlybXdhcmVfdGFnIHN0cmluZyBjb3BpZWQg
dmlhIHN0cm5jcHkoKSBpcyBub3QgZ3VhcmFudGVlZCB0byBiZQpOVUwtdGVybWluYXRlZCBpZiB0
aGUgc291cmNlIHN0cmluZyBpcyBleGFjdGx5IHRoZSBzaXplIG9mIHRoZSBkZXN0aW5hdGlvbgpi
dWZmZXIuIFRoaXMgY2FuIGxlYWQgdG8gYSBidWZmZXIgb3Zlci1yZWFkLgoKU2luY2UgYWx0ZXJu
YXRpdmVzIGxpa2Ugc3Ryc2NweV9wYWQgY2Fubm90IGJlIHVzZWQgaW4gdXNlciBzcGFjZSBzYW1w
bGUgY29kZSwgd2UgY2FuIG1ha2UgaXQgc2FmZXIgYnkgbGltaXRpbmcKdGhlIGNvcHkgc2l6ZSB0
byBNQVhfU0laRSAtIDEgYW5kIGV4cGxpY2l0bHkgYnkgYXNzaWduaW5nIHRoZSBsYXN0IGJ5dGUg
dG8gYmUgYSBOVUwgdGVybWluYXRvci4KCkxpbms6IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9j
L2h0bWwvbGF0ZXN0L3Byb2Nlc3MvZGVwcmVjYXRlZC5odG1sI3N0cm5jcHktb24tbnVsLXRlcm1p
bmF0ZWQtc3RyaW5ncwoKU2lnbmVkLW9mZi1ieTogS3VybWFwdSBTYWkgRGV2YW5zaCBQcmFzYWQg
PGJ0ZWNoMTA0ODcuMjZAYml0bWVzcmEuYWMuaW4+Ci0tLQpIZWxsbyAgRGFuLCB0aGFua3MgZm9y
IHRoZSBhZHZpY2UuIEkndmUgYXR0YWNoZWQgdGhlIHBhdGNoIHRoaXMgdGltZSB0byBhdm9pZCB0
aGUgR21haWwgZm9ybWF0dGluZyBpc3N1ZXMuCiBJIGFsc28gcmVtb3ZlZCB0aGUgZXh0cmEgY29t
bWVudGFyeSBmcm9tIHRoZSBjb21taXQgbWVzc2FnZS4KLS0tCiAuLi4vZ3JleWJ1cy9Eb2N1bWVu
dGF0aW9uL2Zpcm13YXJlL2Zpcm13YXJlLmMgICAgICAgIHwgMTIgKysrKysrKysrLS0tCiAxIGZp
bGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL0RvY3VtZW50YXRpb24vZmlybXdhcmUvZmlybXdhcmUu
YyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL0RvY3VtZW50YXRpb24vZmlybXdhcmUvZmlybXdh
cmUuYwppbmRleCAzYjM1ZWY2ZDRhZGIuLmE2YTA5ODhhZDZmZSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvRG9jdW1lbnRhdGlvbi9maXJtd2FyZS9maXJtd2FyZS5jCisrKyBi
L2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL0RvY3VtZW50YXRpb24vZmlybXdhcmUvZmlybXdhcmUu
YwpAQCAtNjQsNyArNjQsOSBAQCBzdGF0aWMgaW50IHVwZGF0ZV9pbnRmX2Zpcm13YXJlKGludCBm
ZCkKIAlpbnRmX2xvYWQubWlub3IgPSAwOwogCiAJc3RybmNweSgoY2hhciAqKSZpbnRmX2xvYWQu
ZmlybXdhcmVfdGFnLCBmaXJtd2FyZV90YWcsCi0JCUdCX0ZJUk1XQVJFX1VfVEFHX01BWF9TSVpF
KTsKKwkJR0JfRklSTVdBUkVfVV9UQUdfTUFYX1NJWkUgLSAxKTsKKwkoKGNoYXIgKikmaW50Zl9s
b2FkLmZpcm13YXJlX3RhZylbR0JfRklSTVdBUkVfVV9UQUdfTUFYX1NJWkUgLSAxXSA9CisJCSdc
MCc7CiAKIAlyZXQgPSBpb2N0bChmZCwgRldfTUdNVF9JT0NfSU5URl9MT0FEX0FORF9WQUxJREFU
RSwgJmludGZfbG9hZCk7CiAJaWYgKHJldCA8IDApIHsKQEAgLTEwMiw3ICsxMDQsOSBAQCBzdGF0
aWMgaW50IHVwZGF0ZV9iYWNrZW5kX2Zpcm13YXJlKGludCBmZCkKIAlwcmludGYoIkdldHRpbmcg
QmFja2VuZCBGaXJtd2FyZSBWZXJzaW9uXG4iKTsKIAogCXN0cm5jcHkoKGNoYXIgKikmYmFja2Vu
ZF9md19pbmZvLmZpcm13YXJlX3RhZywgZmlybXdhcmVfdGFnLAotCQlHQl9GSVJNV0FSRV9VX1RB
R19NQVhfU0laRSk7CisJCUdCX0ZJUk1XQVJFX1VfVEFHX01BWF9TSVpFIC0gMSk7CisJKChjaGFy
ICopJmJhY2tlbmRfZndfaW5mby5maXJtd2FyZV90YWcpW0dCX0ZJUk1XQVJFX1VfVEFHX01BWF9T
SVpFIC0gMV0gPQorCQknXDAnOwogCiByZXRyeV9md192ZXJzaW9uOgogCXJldCA9IGlvY3RsKGZk
LCBGV19NR01UX0lPQ19HRVRfQkFDS0VORF9GVywgJmJhY2tlbmRfZndfaW5mbyk7CkBAIC0xMzAs
NyArMTM0LDkgQEAgc3RhdGljIGludCB1cGRhdGVfYmFja2VuZF9maXJtd2FyZShpbnQgZmQpCiAJ
cHJpbnRmKCJVcGRhdGluZyBCYWNrZW5kIEZpcm13YXJlXG4iKTsKIAogCXN0cm5jcHkoKGNoYXIg
KikmYmFja2VuZF91cGRhdGUuZmlybXdhcmVfdGFnLCBmaXJtd2FyZV90YWcsCi0JCUdCX0ZJUk1X
QVJFX1VfVEFHX01BWF9TSVpFKTsKKwkJR0JfRklSTVdBUkVfVV9UQUdfTUFYX1NJWkUgLSAxKTsK
KwkoKGNoYXIgKikmYmFja2VuZF91cGRhdGUuZmlybXdhcmVfdGFnKVtHQl9GSVJNV0FSRV9VX1RB
R19NQVhfU0laRSAtIDFdID0KKwkJJ1wwJzsKIAogcmV0cnlfZndfdXBkYXRlOgogCWJhY2tlbmRf
dXBkYXRlLnN0YXR1cyA9IDA7Ci0tIAoyLjU2LjAKCg==
--0000000000008ad07d065f4cae10--
