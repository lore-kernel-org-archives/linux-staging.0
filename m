Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D73D36A36A
	for <linux-staging@lists.linux.dev>; Thu, 30 Jul 2026 03:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785381266; cv=pass; b=GGEO9/YDUfBK3twopjXhvr/FhMQENXe3dn77AkgwNh1cD1nCtqhF7M35qdVrM5rvyUwAWfRn+IrvFgbTKtD/7t0E4iTDUkjVTMsewyWujHerxu0KIV8XGk66S3WsUtYsVJUys4GZF8V6dceKjV9nKfe+MQ8YQYAU75xekJomw6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785381266; c=relaxed/simple;
	bh=FnkdHShbytKEyqeUh4U+lDiT3IQUDNQw7eVmWJAhaNM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Ohd57hSqdjXvO1RAyRBEAEdMEU0F2OYCgClMQnl8FmvkZyCilpJxKwtkz/NbLoD9rKj9DJcMO31XnuGqUXcuZueTotMXuK+4uHcjBhuW8ewCUOXIpCVlsWvAckzGn87G63LQUZXMDxW3tiPz01ciMDjYvG9bkR8RdAfGfNPYUX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W4sJQMEM; arc=pass smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W4sJQMEM"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84e507b079dso1170165b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 29 Jul 2026 20:14:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785381265; cv=none;
        d=google.com; s=arc-20260327;
        b=aUKJVA5efaMh/PYvAC0a4CU4kn72D0QZXeIOkYbXX/0GI8tSM25oFwgB0A5FPp4Ris
         YPo5S/yIpbXzM1XZ9rLedy5qAttfV2mEZsY2LT1YIWzG2iJIQ9YLkvVO8b3bmCj1vULw
         bprL8GviJiP1SabnY919QaTKphBuD84AKXTy0CqdTnKfQ/yJlRFog2ctatMCByA8Fuzq
         ROXgRxq7RhoE6vFiPcOfKdzqKXZaHGJZpYNOn4PZhmqgtfcQOFWG9EFReCJ3WxUXOWld
         ygzajerWFShwetCGsW0DZQTJMBVdH1rJJfBxk1D+Fk5yeXs/k8+pQVIRrXxvcGa3SMyg
         ORug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=FnkdHShbytKEyqeUh4U+lDiT3IQUDNQw7eVmWJAhaNM=;
        fh=T0T1hnUIj1D9S2jbCpu6eG+RjVDlpH03B0kzRCJMCm0=;
        b=ZDFOPvqwaVfLE0ONbo5bDjZzxjgE44S4czv2U1PlsV+xj8XcUgbXSGin9CqKEmmiVb
         28zqa+ovI/J7HOJpn13jfP+6pl14oKuV0ZOl8XgpLkXt5ZcswGJbNdLX51XrmYlZ+Zcm
         G1OrY/KbPR9IP0UAxCGzIFeoeZIlj27sJmNH30q5y1OaAmJNhlWdBQX1qib+O6qvASKR
         i+SnSLU5exFStnnk5Mjj2ZR4er4sFZXBLDpwwWSsps+JN8ftD0gvTsKc3lDysktcyloF
         VXUlQO72yPTmqMADy/SZ2dkbYWmMgMX2gRzf4qA1RXooDiRFEK0Ajis1Hb7flkN7WHWO
         E7TQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785381265; x=1785986065; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FnkdHShbytKEyqeUh4U+lDiT3IQUDNQw7eVmWJAhaNM=;
        b=W4sJQMEM2n5+Xt2p70JeqoeYO/YjJD2xl3hSoODIp0rDTUnbBP8BMFM5QA1T2dW/0Y
         /pt6Z+5W7QbqgI8cY5nJHkikAphdSDBWHPK+FPZJ8lPhv7WJMd0aembgju1FNvN52+7V
         wAZ/RdqQ5yKrzu7+FdxZ3i0xrsIvFanrnoCAAbI5iF0UdqYv7uzlsrjbOVHAdc7yUXxg
         5iedqUgnbBzTnZvPK0C8wLte3kExI7yVhgfHp4Pp9wp4kVmkhCg10iM9nqSFq3jDBi0v
         4vCCotXxUomIp+ucBmlBAr8bigCxmJ+tCAvjwhjPHWy+PUAa2Xn5Eqju7JnUAcwxzjl1
         xCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785381265; x=1785986065;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FnkdHShbytKEyqeUh4U+lDiT3IQUDNQw7eVmWJAhaNM=;
        b=DGF0CYMQY3uvUW6aH/8ENAmP7BnlRWA1d1oenS1EnN9oSa2Qzhb33lpFKeyGZAN02A
         bhP1I+Y7BqQFONu+J9i2y9nBtyOgLpFj/j7TeU7BA6DIOk3bG3GVH7mDS0RQMlvB4xdt
         /PXwSc+RA7UQBDq1F6qqHzO6jKJUBViIApZVPi2ilVKRwsP5TF6xbHx1G1llgxOAKEIW
         dtM9IEYnhL9oRSlYzMO37X9ZOK8wFN6AHxG20cKMmT7YLxOm3gSGGhQPQ3Ind3gUXx1j
         doJaEiLzIZmOP4jcL32EgmY0F0HqORAY5tWUl3ModObkbk2+TUtPKoc22IxFlcXiFd9e
         0/kQ==
X-Gm-Message-State: AOJu0YzoAzWCCbzLc8j1HZLTnm6unjB9GwhHcRlAWXWTHO1KIS+Okyph
	N2VpsS9qbX1zLEygLo9BiJL9KG19p2eJtaEgucMjNhMnszgAH8QGg6c4LiZmqd2K8WHE8AlygeJ
	VGoD8w9cXavW4j9++Ij61SgRvqIthqhU=
X-Gm-Gg: AR+sD12BN07CnaORRyc/bfX1dC99XakmnAW7+DWVohqDblCHmaEw51aMRM1GbmG558E
	1TQYpR4rAEXW80QHJdO+mGG4/5BFNlKkSp4WvTEHMw0+eV19p/2s+NTex/dNKeH+Ok9MohGtZNd
	x3MXuAXZEbrb9IJULV7LmrPCJlR2RZidLIjwTadQs2ntVR/YKSV9KRsjQ2gRC9pC1xBONPhpCEx
	2zY2bdZVdaUy/nqZqMNnC3ZWn/9XNTCVCNNdrGn6tTciXPR9dm3jFRCQ+cesKj6/Ph2bxlDqsaS
	6BN0jtBRUuQ9AOvtq4V7DR3gEbo6v2xUf0LTeOzv6a902g==
X-Received: by 2002:aa7:88c7:0:b0:848:760e:eb76 with SMTP id
 d2e1a72fcca58-84ebc432c34mr874255b3a.61.1785381264870; Wed, 29 Jul 2026
 20:14:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Lucas Jeffrey <luquijeffrey@gmail.com>
Date: Thu, 30 Jul 2026 00:14:12 -0300
X-Gm-Features: AUfX_mzgo-n0WvRUKHYtMALllU4tDvmclTwJnj2TYqQ8OSnyTk3mkOF0zJDwevk
Message-ID: <CAObkL7P+PnkEBpav6AVEPTyjiWsoOEBobUT2hrR=fay23FyO6w@mail.gmail.com>
Subject: [RFC] staging: nvec: possible missing bounds check in nvec_power_bat
 response handling
To: Marc Dietrich <marvin24@gmx.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Marc, Greg,
While reviewing drivers/staging/nvec/nvec_power.c I noticed that the
battery response handler uses the length field from struct
bat_response without validating it against the destination buffer
size:
nvec_power.c between lines 120 and 220:

static int nvec_power_bat_notifier(struct notifier_block *nb,
unsigned long event_type, void *data)
{
struct nvec_power *power =
container_of(nb, struct nvec_power, notifier);
struct bat_response *res = data;
(...)

switch (res->sub_type) { (...)
case TYPE:
memcpy(power->bat_type, &res->plc, res->length - 2); //res->length is
never validated that is in a valid range, //according to the plc field
in the bat_response struct it should be smaller than 30 (...)

}

return NOTIFY_STOP;
}


The same patterns patterns exist for MANUFACTURER and MODEL.
My understanding is that res->length comes from the NVEC embedded
controller response. If a malformed response contains a length larger
than the destination buffer, this could result in an out-of-bounds
write.
I would like to confirm whether the NVEC protocol guarantees these
length values, or whether the driver should validate them before
copying.

Thanks, Lucas
