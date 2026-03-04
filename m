Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269C4390219
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 11:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772622538; cv=none; b=tPgXSKuYnoaGQU/j7k9t6JFeaZPOxeMTqFQ+7umxDY5Vu82LGwn5f0sLGh2RdEookMBKHUhb+g3b8s1R2nxYb3oXzzgz6ZeOh0Opm/5yVM94H/0Qo2DHt5YNpm3IuAA0JW64grP4zzPzGxjF3rvb8gqlYyrLZ6Yxso2Aeb4YUZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772622538; c=relaxed/simple;
	bh=gNCRGvvdxW5szFBp8kUiqsO53/UlHC9FSJOXzYPgUL4=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:Cc:From:Subject; b=gR7J9UvmB047O/jeXNClKhluhk6buT6DIprCiqI/Vt38gHZ8+e3ZoblQd3r9ENWVxfryAoeVWq7hnTrd3trCIUmLdFnLL7C2UINMa1e+pap4lWeWos96r8E8lv/VeQOiSw589txzdYtgEXnfQhXuLQWCKwUXB5Ak7F3UAz7O4r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTIKtBgq; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTIKtBgq"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-660a7aa6e44so2322078a12.3
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 03:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772622535; x=1773227335; darn=lists.linux.dev;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gNCRGvvdxW5szFBp8kUiqsO53/UlHC9FSJOXzYPgUL4=;
        b=cTIKtBgq2A39c0iRdULEua/0PdW9LoEVQMKLoHJHnFco3vZ5lxvBfSvqfzZKTIgyjO
         2DO4vnDrA08v3LPFIGGqx23FnfXq0dtD+bV9IsOIPf0OcFk3Z8rw/8K+lCQDwtuitSqo
         RUBvGR5RtSgHHqsCiQ/hWfKj+3ECfF1HUPI+nBqCvsMM+CVgTA0HaPpQC7CT/Gy2ISkZ
         vmzYdwA1hrG6+XUlswNnrC3I8Cv+QmOuMgqhjt29DfeRiz3CQUcW9VTs5CikPXK6RmB5
         2yJHZfcKpKYILXKeCyp0+2Uc7Jm1WNRRNDcjgvRRCKi9H06q1lcvTHhtl3jG3cs86HY/
         Azpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772622535; x=1773227335;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNCRGvvdxW5szFBp8kUiqsO53/UlHC9FSJOXzYPgUL4=;
        b=DVYbB8HURAYMH7iXrJCuvXIhLJfzo5YPSom28V5tq0awGQWk8jKPsSnF3SSqy2LXo3
         FqBHr3igJ3yYD8OlKO6LL9b1eYjLC5T86kb8jt+zz2XPIxNEi2ry0MlB3FYlTlVolqSq
         Ykrl5e3ecOzVhikrzsynBOOUL5VYWNrsYJMUwVzxAuJMS5hzD3nalDy45GsLf3Brk171
         DRsZzeryf0Iz5TnIZnFL49nkRyKBsfU99yQunWiVXg1FXnnPxi37WUduXhvrxe43xzGn
         HN8l+GzWV9YzIm57786neg6cHNv4HD+Sxl11XJDvkExBpUUK6Hqa27AQ4KJC48J7Ip+b
         vZmg==
X-Forwarded-Encrypted: i=1; AJvYcCX84oj1w3pFfHivHkXthKEpN+76SqbuK9y958A329DByob+dH5s3N9TW9bDFIWGOxH1mwbrOa1+N0aj+JY0@lists.linux.dev
X-Gm-Message-State: AOJu0YzcI4omKhA38ck+zGGkcnFHe9RH7gIh0HJrVmjv0nrCtEB9gryy
	pRIJb6nrbWm027/Q5d7UYOU9uOFDjWX+Dv2Msyp2cAxSAPAHU+9otb0K
X-Gm-Gg: ATEYQzyRgvokgFDlgveqZ+qQeS2mNKvMFwIPAJsywYp1YfXTLQbSIRODt+oDO/MyntW
	Z0veRkmHul0onzhdzJs5CFYe2j7P2xoHnBfbQsHSY+QArFQB3xH5P9ZcAmqKZ7+gu6p5fB0qmNw
	dINTLrFEZw8QCHI8TZDIoN0DZPN+7/If33SX8rS8EeKP5C2/bwHJXdIJkqBOXkidOsWqERppdgs
	u8NAHcu6LAz7ksMUXR/WH3ho6VCHtE7ZPS7Pnlrv5KSu+/O934q7daLF6uAAFNwvALBFw/Zn2hJ
	wPN7At58SJ6vIKq/+/JW1UrcPeNOWbVfyZAU/Ra+CYTsvNNxOyRbMX7GENn+1G3fZlwEIGUn+PM
	gFVLHOQeHNdworY8fu3DwIdLeNEZYxBz8MziUfIyTp8o5DNc7U29n17z/jhyT1D7+zooQD1nVoj
	6j/yN34gIPLUfThNmiyuxRdGpdGWJadb8lkUqsYo77TKAvBDkWucp1McFvEGrLQYqhU3NA2ltxX
	9/pe/Vk2sCbAVbsgURP6M52BewM4nWnv7Z+KtXKAgmd2U5G2k34LPT4v7q724dylzhP5Qmz
X-Received: by 2002:a17:907:7fa1:b0:b8f:e46f:8079 with SMTP id a640c23a62f3a-b93f11a3c47mr85878566b.22.1772622535164;
        Wed, 04 Mar 2026 03:08:55 -0800 (PST)
Received: from [88.202.160.248] ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ab13593sm725431666b.3.2026.03.04.03.08.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 03:08:53 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------BPKJY1o9QCBO2WF7INVQYKtQ"
Message-ID: <ae0a95f4-8dac-4690-8810-79ad5fee7895@gmail.com>
Date: Wed, 4 Mar 2026 12:08:53 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: robh@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org,
 jollys@xilinx.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
From: Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH] staging: axis-fifo: fix alignment and add DT binding
 documentation

This is a multi-part message in MIME format.
--------------BPKJY1o9QCBO2WF7INVQYKtQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Add YAML device tree binding documentation for the Xilinx
AXI-Stream FIFO IP core and fix code alignment issue.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
--------------BPKJY1o9QCBO2WF7INVQYKtQ
Content-Type: text/plain; charset=UTF-8;
 name="0001-staging-axis-fifo-fix-alignment-and-add-DT-binding-d.patch"
Content-Disposition: attachment;
 filename*0="0001-staging-axis-fifo-fix-alignment-and-add-DT-binding-d.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBiOTQ1MTQ3MzhhZjc4NzE3MzcxN2NiZmE4NTYzN2M1MzA4NDI4NGRhIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4YW5kcnUgSG9zc3UgPGhvc3N1LmFsZXhhbmRy
dUBnbWFpbC5jb20+CkRhdGU6IFdlZCwgNCBNYXIgMjAyNiAxMjowNjo0OSArMDEwMApTdWJq
ZWN0OiBbUEFUQ0hdIHN0YWdpbmc6IGF4aXMtZmlmbzogZml4IGFsaWdubWVudCBhbmQgYWRk
IERUIGJpbmRpbmcKIGRvY3VtZW50YXRpb24KClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBI
b3NzdSA8aG9zc3UuYWxleGFuZHJ1QGdtYWlsLmNvbT4KLS0tCiAuLi4vYmluZGluZ3MvbWlz
Yy94bG54LGF4aS1maWZvLW1tLXMueWFtbCAgICAgfCA3NyArKysrKysrKysrKysrKysrKysr
CiBkcml2ZXJzL3N0YWdpbmcvYXhpcy1maWZvL2F4aXMtZmlmby5jICAgICAgICAgfCAgNSAr
LQogMiBmaWxlcyBjaGFuZ2VkLCA4MSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiBj
cmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21p
c2MveGxueCxheGktZmlmby1tbS1zLnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbWlzYy94bG54LGF4aS1maWZvLW1tLXMueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9taXNjL3hsbngsYXhpLWZpZm8tbW0t
cy55YW1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMC4uNmQxY2Q2NTFl
Ci0tLSAvZGV2L251bGwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L21pc2MveGxueCxheGktZmlmby1tbS1zLnlhbWwKQEAgLTAsMCArMSw3NyBAQAorIyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpCisl
WUFNTCAxLjIKKy0tLQorJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9taXNj
L3hsbngsYXhpLWZpZm8tbW0tcy55YW1sIworJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUu
b3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxlOiBYaWxpbnggQVhJLVN0cmVh
bSBGSUZPCisKK2Rlc2NyaXB0aW9uOiB8CisgIFRoZSBYaWxpbnggQVhJLVN0cmVhbSBGSUZP
IElQIGNvcmUgaGFzIHJlYWQgYW5kIHdyaXRlIEFYSS1TdHJlYW0gRklGT3MsCisgIHRoZSBj
b250ZW50cyBvZiB3aGljaCBjYW4gYmUgYWNjZXNzZWQgZnJvbSB0aGUgQVhJNCBtZW1vcnkt
bWFwcGVkIGludGVyZmFjZS4KKyAgQ3VycmVudGx5IHN1cHBvcnRzIG9ubHkgc3RvcmUtZm9y
d2FyZCBtb2RlIHdpdGggYSAzMi1iaXQgQVhJNC1MaXRlIGludGVyZmFjZS4KKworbWFpbnRh
aW5lcnM6CisgIC0gSm9sbHkgU2hhaCA8am9sbHlzQHhpbGlueC5jb20+CisKK3Byb3BlcnRp
ZXM6CisgIGNvbXBhdGlibGU6CisgICAgZW51bToKKyAgICAgIC0geGxueCxheGktZmlmby1t
bS1zLTQuMQorICAgICAgLSB4bG54LGF4aS1maWZvLW1tLXMtNC4yCisgICAgICAtIHhsbngs
YXhpLWZpZm8tbW0tcy00LjMKKworICByZWc6CisgICAgbWF4SXRlbXM6IDEKKworICBpbnRl
cnJ1cHRzOgorICAgIG1heEl0ZW1zOiAxCisKKyAgaW50ZXJydXB0LW5hbWVzOgorICAgIGl0
ZW1zOgorICAgICAgLSBjb25zdDogaW50ZXJydXB0CisKKyAgaW50ZXJydXB0LXBhcmVudDog
dHJ1ZQorCisgIHhsbngsdXNlLXJ4LWRhdGE6CisgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMu
eWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCisgICAgZW51bTogWzAsIDFdCisgICAgZGVzY3Jp
cHRpb246IFNldCB0byAxIGlmIFJYIEZJRk8gaXMgZW5hYmxlZCwgMCBvdGhlcndpc2UuCisK
KyAgeGxueCx1c2UtdHgtZGF0YToKKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9k
ZWZpbml0aW9ucy91aW50MzIKKyAgICBlbnVtOiBbMCwgMV0KKyAgICBkZXNjcmlwdGlvbjog
U2V0IHRvIDEgaWYgVFggRklGTyBpcyBlbmFibGVkLCAwIG90aGVyd2lzZS4KKworICB4bG54
LHJ4LWZpZm8tZGVwdGg6CisgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5p
dGlvbnMvdWludDMyCisgICAgZGVzY3JpcHRpb246IERlcHRoIG9mIFJYIEZJRk8gaW4gd29y
ZHMuCisKKyAgeGxueCx0eC1maWZvLWRlcHRoOgorICAgICRyZWY6IC9zY2hlbWFzL3R5cGVz
LnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgorICAgIGRlc2NyaXB0aW9uOiBEZXB0aCBvZiBU
WCBGSUZPIGluIHdvcmRzLgorCityZXF1aXJlZDoKKyAgLSBjb21wYXRpYmxlCisgIC0gcmVn
CisgIC0gaW50ZXJydXB0cworICAtIGludGVycnVwdC1uYW1lcworICAtIGludGVycnVwdC1w
YXJlbnQKKyAgLSB4bG54LHVzZS1yeC1kYXRhCisgIC0geGxueCx1c2UtdHgtZGF0YQorCith
ZGRpdGlvbmFsUHJvcGVydGllczogdHJ1ZQorCitleGFtcGxlczoKKyAgLSB8CisgICAgYXhp
X2ZpZm9fbW1fc18wOiBheGlfZmlmb19tbV9zQDQzYzAwMDAwIHsKKyAgICAgIGNvbXBhdGli
bGUgPSAieGxueCxheGktZmlmby1tbS1zLTQuMSI7CisgICAgICBpbnRlcnJ1cHQtbmFtZXMg
PSAiaW50ZXJydXB0IjsKKyAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8JmludGM+OworICAg
ICAgaW50ZXJydXB0cyA9IDwwIDI5IDQ+OworICAgICAgcmVnID0gPDB4NDNjMDAwMDAgMHgx
MDAwMD47CisgICAgICB4bG54LHVzZS1yeC1kYXRhID0gPDB4MD47CisgICAgICB4bG54LHVz
ZS10eC1kYXRhID0gPDB4MT47CisgICAgICB4bG54LHJ4LWZpZm8tZGVwdGggPSA8MHgyMDA+
OworICAgICAgeGxueCx0eC1maWZvLWRlcHRoID0gPDB4ODAwMD47CisgICAgfTsKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9heGlzLWZpZm8vYXhpcy1maWZvLmMgYi9kcml2ZXJz
L3N0YWdpbmcvYXhpcy1maWZvL2F4aXMtZmlmby5jCmluZGV4IGFhOTBiMjcxOS4uNmNhMmJm
NGQ0IDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvYXhpcy1maWZvL2F4aXMtZmlmby5j
CisrKyBiL2RyaXZlcnMvc3RhZ2luZy9heGlzLWZpZm8vYXhpcy1maWZvLmMKQEAgLTI0NSw4
ICsyNDUsMTEgQEAgc3RhdGljIHNzaXplX3QgYXhpc19maWZvX3dyaXRlKHN0cnVjdCBmaWxl
ICpmLCBjb25zdCBjaGFyIF9fdXNlciAqYnVmLAogCX0gZWxzZSB7CiAJCW11dGV4X2xvY2so
JmZpZm8tPndyaXRlX2xvY2spOwogCisJCXUzMiBmcmVlX3NwYWNlOworCisJCWZyZWVfc3Bh
Y2UgPSBpb3JlYWQzMihmaWZvLT5iYXNlX2FkZHIgKyBYTExGX1RERlZfT0ZGU0VUKTsKIAkJ
cmV0ID0gd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlKGZpZm8tPndyaXRlX3F1ZXVlLAotCQkJ
aW9yZWFkMzIoZmlmby0+YmFzZV9hZGRyICsgWExMRl9UREZWX09GRlNFVCkgPj0gd29yZHNf
dG9fd3JpdGUpOworCQkJCQkJICAgICAgIGZyZWVfc3BhY2UgPj0gd29yZHNfdG9fd3JpdGUp
OwogCQlpZiAocmV0KQogCQkJZ290byBlbmRfdW5sb2NrOwogCX0KLS0gCjIuNDMuMAoK

--------------BPKJY1o9QCBO2WF7INVQYKtQ--
