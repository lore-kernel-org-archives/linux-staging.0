Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4875E1DF256
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 12:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772628364; cv=none; b=FlPB7lTDoxnmgBT10g0PbP0L9I8kJb2yIRvPaJmKpudsVfuHh6hmCSerAiV/yCwUr3OySlZLvKCzZxh+QyH22D5h6YW77HEk+wAoX9LJdJpv6Dw71pvXc5HdSxzX8DeB1f+evk+FgoWRbjfK3wQ3SuszA2RLS6VIcB0jo8BzDWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772628364; c=relaxed/simple;
	bh=8a88sGmUzyKhrSQSfDC1U1YEo+WDcgXYBlkjRLvhCL8=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=adVFCRa5EKUEhGoET+XaPCwZYBbpBV5MlBTCEq7yzyyXh5oZboCisXy9di+1uh2oCUmQUUm9Mf3RFv8yeUfSE36K3EKazAP8jv7J4hNt/vwRfC5DJuDoMqyHzDgxzK8BPAzJAUb1fUrm5bZN6u2gFVW7KxEkulSmWnS4wujuZkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VdvR6ldf; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VdvR6ldf"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-660ea6ceb5aso859726a12.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 04:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772628362; x=1773233162; darn=lists.linux.dev;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8a88sGmUzyKhrSQSfDC1U1YEo+WDcgXYBlkjRLvhCL8=;
        b=VdvR6ldf185kS/EHVLES6GZuDYPHvD4W/vMJS0vpxjfVKXFvFqPT74G9t02Kd+rWja
         ZkEJvkY7m/QJv2pzmQsmpv5H/s414l0zkoI8azzglg30BdfdS3W/CoJgmjkAQVaoFJgu
         OtTmMn/GC4975wXgSPgP/fV/IJq6AjD5gjY8JKUPCysom1JFMaPCkrNN5doraERZSNMY
         H5aq5eEKPzTh/Bn0BGCj9Ap3ouJZ7Vm/5cKKYMxzus5az/RTJDgHBcT9inu/mrXFtunD
         AiN92gY1pMmyDXnxo4VH8xbkAhmPiP8HnensLCB6CsNZEUQ3avGuIJS15oaAI0mPb7R5
         yE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772628362; x=1773233162;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8a88sGmUzyKhrSQSfDC1U1YEo+WDcgXYBlkjRLvhCL8=;
        b=fju1eENr9i5zS0jSsk6o8w3DU4QpQKoDtTf54hlPRDM98WVHw85AJr1rRYYuIc6zcd
         KTpIY9gENsT+JBzNrHRXgnVgh0VQZl0PiAQTnuOkPZBLQkMfjeOfJxSw3lYoq29Gc4yH
         96T0ghIquFjPR8uFsQdE0zsU8sUZhdZbP8lswrpocCYTwlrRDlFDZi1Wp4+tbzh9+sF/
         0cZv4zVlKkDjn44cLpHvnGWdMiFTXO7F6wOFwRfJPJmNbavx+XNhZXawdcsp69MPlreg
         2IixYGVgCi5SgsLy10zdzY8jEWDlZWHCGOwxnGnbuuyY/f83s3IdQ4roesexJW8RVzX2
         MxNw==
X-Forwarded-Encrypted: i=1; AJvYcCVZ1/gjAK0S8qtfULfUEE+12gHK7zokJ0ku2YHvbuWxu2ZN3/jyJwtaeR7JGbsNLbqrzQmhjywYi3+LbIbr@lists.linux.dev
X-Gm-Message-State: AOJu0YwEUUX7YYr0LaASIDL9xlpb/AT7kT6F/VpR7649TNKVgazbRCyQ
	DM9i0NMMpO0LGU4nvZFEM3Zk36FkVfTfH1MaxnlrheRtra+6q7RkVfKV
X-Gm-Gg: ATEYQzwrtuy2PWW2FCR8jo8Z/0mqHhxHjb9nAV/HU/JNfiyxZc6k1vOSAJk3HPzOSXW
	UmFOH60H8uGTZKRdevGq3Xs9SMJc/vK9/nHLXJX5FPXRoA/09UpP9/mOH0go/WC1FlkDA6gcfN+
	YJuS8kytErW/FNoOqTL5VnKCR36qehjO1LJC6Tx4S5MUg793AeQErOGFvDOgILhVoPYIHYikJwM
	oMo3L1FdRLUVOFVZrTEYH1wN/Gyn4SX72wJyc7D1Leu8vzwifJrDzNx/UisevcDh0TMhOn0H128
	9U8g9loSXZOhyDwuCR34OodsFyzMboYSeqbtpR6wNcJl/GDweqmvhALjWhAwewcHTsT7SmiWeoV
	/DFmEC1XIjqAsPLD7f6ZSQH8SUmvd5DWAhvvMHM05poNR3qqAjUvweyyUcWq8Ue/3VYeg3j/BZ4
	Tgq7DjIX520s0ExI43bep+3x61Pk8L/8MXcoVhDApWfk4udzND9IW0sMyT1rhvUUkLDaGKIMa8b
	7XSY+FCzdUudOMtlXceNLgCwWUj39ZYnatLyZ33htGhqivOhLWT532dov3EkC4pmmwnISIKR45f
	nZjGVYQ=
X-Received: by 2002:a17:906:478f:b0:b88:72da:1055 with SMTP id a640c23a62f3a-b93f02b046amr116588166b.29.1772628361420;
        Wed, 04 Mar 2026 04:46:01 -0800 (PST)
Received: from [88.202.160.248] ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b93c7eaa49dsm277291266b.18.2026.03.04.04.45.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 04:46:00 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------NSSLOPmd0X6Ab0ytHuAB18r5"
Message-ID: <fbb68131-03ab-460b-8d11-e4892d91807f@gmail.com>
Date: Wed, 4 Mar 2026 13:46:00 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2] dt-bindings: misc: xlnx,axi-fifo-mm-s: fix
 interrupt-parent property
To: Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org,
 jollys@xilinx.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <ae0a95f4-8dac-4690-8810-79ad5fee7895@gmail.com>
 <0eea78fe-59ab-4ca0-9e29-d68fa298ac09@kernel.org>
Content-Language: en-US
From: Alexandru Hossu <hossu.alexandru@gmail.com>
In-Reply-To: <0eea78fe-59ab-4ca0-9e29-d68fa298ac09@kernel.org>

This is a multi-part message in MIME format.
--------------NSSLOPmd0X6Ab0ytHuAB18r5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

v2: Remove interrupt-parent property declaration as it is a standard
property that does not need to be explicitly defined in the binding.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
--------------NSSLOPmd0X6Ab0ytHuAB18r5
Content-Type: text/plain; charset=UTF-8;
 name="0001-dt-bindings-misc-xlnx-axi-fifo-mm-s-fix-interrupt-pa.patch"
Content-Disposition: attachment;
 filename*0="0001-dt-bindings-misc-xlnx-axi-fifo-mm-s-fix-interrupt-pa.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA0MDNjNmMyOTljODJjMzlkZDA5ZWQ5ZWQ3NWQ2NzUwZDM1OGU1M2RhIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4YW5kcnUgSG9zc3UgPGhvc3N1LmFsZXhhbmRy
dUBnbWFpbC5jb20+CkRhdGU6IFdlZCwgNCBNYXIgMjAyNiAxMzo0MzowOSArMDEwMApTdWJq
ZWN0OiBbUEFUQ0ggdjJdIGR0LWJpbmRpbmdzOiBtaXNjOiB4bG54LGF4aS1maWZvLW1tLXM6
IGZpeAogaW50ZXJydXB0LXBhcmVudCBwcm9wZXJ0eQoKU2lnbmVkLW9mZi1ieTogQWxleGFu
ZHJ1IEhvc3N1IDxob3NzdS5hbGV4YW5kcnVAZ21haWwuY29tPgotLS0KIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9taXNjL3hsbngsYXhpLWZpZm8tbW0tcy55YW1sIHwg
MiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21pc2MveGxueCxheGktZmlmby1tbS1z
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWlzYy94bG54LGF4
aS1maWZvLW1tLXMueWFtbAppbmRleCA2ZDFjZDY1MWUuLmEyMWNhZTZlNiAxMDA2NDQKLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21pc2MveGxueCxheGktZmlm
by1tbS1zLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21p
c2MveGxueCxheGktZmlmby1tbS1zLnlhbWwKQEAgLTMxLDcgKzMxLDYgQEAgcHJvcGVydGll
czoKICAgICBpdGVtczoKICAgICAgIC0gY29uc3Q6IGludGVycnVwdAogCi0gIGludGVycnVw
dC1wYXJlbnQ6IHRydWUKIAogICB4bG54LHVzZS1yeC1kYXRhOgogICAgICRyZWY6IC9zY2hl
bWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgpAQCAtNTYsNyArNTUsNiBAQCBy
ZXF1aXJlZDoKICAgLSByZWcKICAgLSBpbnRlcnJ1cHRzCiAgIC0gaW50ZXJydXB0LW5hbWVz
Ci0gIC0gaW50ZXJydXB0LXBhcmVudAogICAtIHhsbngsdXNlLXJ4LWRhdGEKICAgLSB4bG54
LHVzZS10eC1kYXRhCiAKLS0gCjIuNDMuMAoK

--------------NSSLOPmd0X6Ab0ytHuAB18r5--
