Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6167818C2C
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 01:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774748140; cv=pass; b=oXvVK4F2MGPzOjWz4WwEY/bMa0o33IP8qsaZbguB9Hv+YlJVPSgtTUHmW4PqzXMfBO5KATAhxXBqsnLfPbWb5E8Ozz3cxkOkvQchv4TQLX+e82tGmnGRxnfYALIy/CyY9yHoI4v77E1OHOBUNIQ3DcbvCpYDRfAbBjvvQAjPX+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774748140; c=relaxed/simple;
	bh=xSu1sZLM6lsZJ5VMbjUzFsi3cXDEMdZ34pf45unAfEg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=tZqQkd19woRPoWiuzm11rvwNicLM51r+022lK5hZ3fhpxY7h7P9mz72g+PllqbrIjzjiOoaw+4x/YGVsYW0p0K3hUZdX1bUNfC/GdsKBJHLVZCvUK+MgPTRFPlz/XzvRyVzPNa8PeiYNuuu0XkvoHMF0pDz2HK9nGrWYiEectxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ISIwT/MQ; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ISIwT/MQ"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35c16db1b53so1789502a91.1
        for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 18:35:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774748138; cv=none;
        d=google.com; s=arc-20240605;
        b=NaQwb4TJ1b7v0YD9RfFHoPpYbrqPIqTlfS8LfFA7ALUvCIjkf+zWWHlmXxyA/vfAnA
         j0K4MRuIxZBYMd2heLguu23hik7NPTlG26O3pXOQsW+OrioMhf7r/Vz3xBpTBCllxz9r
         lMY7cat9pkRSSbrE+NqIhPZbTDE6MG4CB+LBsXJDIYfPF41fOOEwk2Z6L5z3rLsZzMOY
         ehqBBqtAP2VRb/Y6sbgOTppyIGSjgRzfgL7ftWse19CY1dE60HO3HstNE8jRyZyVIyde
         fpGoOZTd9k9YM1I0k19quGohmnUfC2wuBQVNtHNAykvz+x0t2iv1XPmnM9mIAy4Xvua2
         HHXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=qFmNYa03oExeTuf0igIV47XIxP6tDZA+yOw6PxTECss=;
        fh=/ZmTfvVqiNduWGN3Dx0rPbHyB1qXxYfO6Yjz/aP5Uh0=;
        b=G6KO1eVBUwB4j1kwRV3ZBBDAZDvkgWxJ1tSR4102Udz9hJvBnz2q98dkYFqd2o/bLR
         1Ucr2qqFJ2p6EtpUcM6GDKuEfbnv326tHhlpxJOz77HuyQIkENX3ypt1JjrXJKeSVRN2
         yRl8PrdLE962Vp6xD8cCld+kENa/44rd1WNvNb3hST0znNWHsVhA8dQzvdtgf5mBt3kf
         xQAmz+Mtsr1UKR4xo7Fo/smX78b85cdh2BSArYRCknNhYozRvqsA7kDZTzpGZ+Hx1cTa
         fKVkcirxgTP90VJHahAqTo9p7MmF1Xx9H4aKkUK+uiZJuofyNdngl4lhcG1519K10hDL
         8fIA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774748138; x=1775352938; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qFmNYa03oExeTuf0igIV47XIxP6tDZA+yOw6PxTECss=;
        b=ISIwT/MQFvE0XlVQnHntK8k/LawlSJGS5YIhrdlMKpWqzOLZdfcv8OeRW4GX7pKWNE
         JQ4GIiY6WYYozX5HCBPehVMIFLXeg/FlhJGKzuziHl9rQWxzwKkcUWtDiwHWWuEMRvYO
         18oG9P54hOo70WNNoZ49peq0e64JWaLM1sRjidWOzCl2maV7cEkgcp4J0WvIQjO9tjo0
         3109h0p968JTwZux1UDn1bBPrJT+/eXFesRaiW4wevp8+zHU+RO3D67zfteH0o5Ug9AH
         i1VL9TN9fSYCzoQyAdT9w/GBsT8IWEPwY5KK279aa81sLLE2snexadOgpxAhTGM73xEv
         f3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774748138; x=1775352938;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qFmNYa03oExeTuf0igIV47XIxP6tDZA+yOw6PxTECss=;
        b=YHhIU+E2C0J5A8j3xR7DmxKNpgNPQ4aK/bjCcbWu353Eqwc6+BNidmxrg2flAW6wY5
         HfOmg/ZL0R8XZ0L024v6n2l/RhJzL2AxW0HuR5yJfCmARM2c7mwkp3HFpsN0iElaRTR6
         R9ymKqN+7jYaiSI5tJSV0cNr4PHguL4Un3HV0r7m7ZQCUylpoeaEXcUAk4aVdPGccyaU
         Up8feMWIUJNdfxMUGqA+LpV3XhLjgi7Dclnpvax0tXA1CgADkH4V3YPJyY0nEC7D4cqT
         3ykOUL4CVucJNddZhRrQ/tPUFg0zYCtdutnyzdoJDQw9NX1ToGpRdhlDp9gQsieyPIJN
         CAjw==
X-Forwarded-Encrypted: i=1; AJvYcCUwm5d3/NR65hNV3XDt9vBfruoBX5HojaAdvc5qZzgGs3SWRw8lxlCSE8hEgVCd4nl1xre3O+AzTc3Uql/A@lists.linux.dev
X-Gm-Message-State: AOJu0YyBKJJN6Kl4hxGgW2Ua6n06UgW+KPBVqC3ObsgO4tTzD1pVHPC3
	/DOgUCxeL2eYCp8JBrye6hCd621Qy0HPQL1aIwD8IabKsmwGjwO3vqJyHAvayvoJCvglSUAtpvN
	j8dmTvVrZrPyF9Jm7V1yzwb8KOhFJAjQ=
X-Gm-Gg: ATEYQzwYJWjPZXym+le9arch+eiNv7wTsLBPG7E2lahwXNlV5+AWibuo7gxJ9O7Wt3k
	i8aIL32WtFBVNpz03/PrEQO69FAQktKqU1r9bWIAZDUVtwJI+tkJK95pvoueRyvvIhobhVQh6L2
	0XME3/IkrAwmJUuYiPI4S+hWfyUDxJKusWZQOD48KntsrBtN+P6wNdCd9xnDs15iB0WkgUSAq9c
	HhWteGG0EAJA0soxPulQx1n4GIK83bIdW903ifhhsMOY4OsKebSR2s4DoCw2iv1KY7uflbfdm+N
	o4tVCsY=
X-Received: by 2002:a17:903:98f:b0:2b0:6cb5:c6c5 with SMTP id
 d9443c01a7336-2b0cdd44b5fmr83331435ad.49.1774748138597; Sat, 28 Mar 2026
 18:35:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: loren coomer <lorencoom@gmail.com>
Date: Sat, 28 Mar 2026 18:35:26 -0700
X-Gm-Features: AQROBzCqIoZi7roP4TQZgqZBZXXbQiO4rpgkGcKQOkFO0VH1fyc9Ot4925JzDc8
Message-ID: <CALKC8YE-4J=6YfNdZq9AK-PQpjLXh3e322J0-Lg0sT4mCcc0dw@mail.gmail.com>
Subject: [PATCH] greybus/uart: fix misaligned wait_for_completion_timeout
To: linux-kernel@vger.kernel.org
Cc: dtwlin@gmail.com, johan@kernel.org, elder@kernel.org, 
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev
Content-Type: multipart/mixed; boundary="0000000000005dfc6f064e1fc0da"

--0000000000005dfc6f064e1fc0da
Content-Type: multipart/alternative; boundary="0000000000005dfc6e064e1fc0d8"

--0000000000005dfc6e064e1fc0d8
Content-Type: text/plain; charset="UTF-8"

Align the second line of wait_for_completion_timeout() with the
opening parenthesis.

Signed-off-by: Loren Coomer <lorencoom@gmail.com>

--0000000000005dfc6e064e1fc0d8
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">Align the second line of wait_for_completion_timeout() with the<br>opening parenthesis.<br><br>Signed-off-by: Loren Coomer &lt;<a href="mailto:lorencoom@gmail.com">lorencoom@gmail.com</a>&gt;</div>

--0000000000005dfc6e064e1fc0d8--
--0000000000005dfc6f064e1fc0da
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-greybus-uart-fix-misaligned-wait_for_completion_time.patch"
Content-Disposition: attachment; 
	filename="0001-greybus-uart-fix-misaligned-wait_for_completion_time.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mnb35kot0>
X-Attachment-Id: f_mnb35kot0

RnJvbSBlZjg1MzIzNWYzYTdhNmRkYWUxZGNlM2I3MmRjYTE4NDg4YjJkYjZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBsb3Jjb29tZXIgPGxvcmVuY29vbUBnbWFpbC5jb20+CkRhdGU6
IFNhdCwgMjggTWFyIDIwMjYgMTg6MjM6MzAgLTA3MDAKU3ViamVjdDogW1BBVENIXSBncmV5YnVz
L3VhcnQ6IGZpeCBtaXNhbGlnbmVkIHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dAoKYWxpZ24g
dGhlIHNlY29uZCBsaW5lIG9mIHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgpIHdpdGggdGhl
IG9wZW5pbmcgcGFyZW50aGVzaXMKClNpZ25lZC1vZmYtYnk6IExvcmVuIENvb21lciBsb3JlbmNv
b21AZ21haWwuY29tCi0tLQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdWFydC5jIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdWFydC5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXli
dXMvdWFydC5jCmluZGV4IDdkMDYwYjRjZDMzZC4uMDRmNDQyNTY1NmQxIDEwMDY0NAotLS0gYS9k
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy91YXJ0LmMKKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXli
dXMvdWFydC5jCkBAIC0zMTgsNyArMzE4LDcgQEAgc3RhdGljIGludCBnYl91YXJ0X3dhaXRfZm9y
X2FsbF9jcmVkaXRzKHN0cnVjdCBnYl90dHkgKmdiX3R0eSkKIAkJcmV0dXJuIDA7CiAKIAlyZXQg
PSB3YWl0X2Zvcl9jb21wbGV0aW9uX3RpbWVvdXQoJmdiX3R0eS0+Y3JlZGl0c19jb21wbGV0ZSwK
LQkJCW1zZWNzX3RvX2ppZmZpZXMoR0JfVUFSVF9DUkVESVRfV0FJVF9USU1FT1VUX01TRUMpKTsK
KwkJbXNlY3NfdG9famlmZmllcyhHQl9VQVJUX0NSRURJVF9XQUlUX1RJTUVPVVRfTVNFQykpOwog
CWlmICghcmV0KSB7CiAJCWRldl9lcnIoJmdiX3R0eS0+Z2JwaHlfZGV2LT5kZXYsCiAJCQkidGlt
ZSBvdXQgd2FpdGluZyBmb3IgY3JlZGl0c1xuIik7Ci0tIAoyLjUzLjAKCg==
--0000000000005dfc6f064e1fc0da--
