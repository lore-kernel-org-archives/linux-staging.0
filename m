Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A839148FE8
	for <linux-staging@lists.linux.dev>; Wed, 20 Nov 2024 16:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732121096; cv=none; b=kqCcEthmft1LO61RILMdxNwRnvLhjL0wXhtev5jk5IWw3FOR34kJLJ2r/NDu5R98kCjtdFgF7J+P/SDZK1/857JJ7P2WI6TFwUBOMwMVqJH0TxpcpgAwmYz9PIQGHAB/a+mmUNmJg4fWVFFa7/vh7hngGyIjD3plZYEObcqEu6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732121096; c=relaxed/simple;
	bh=eElI0PQS6RM/KBvZvT/6wjNMvQDv0TOKHZU5Ee9F190=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=N3IKpvYALPFcxz6CfwJwlG7FQDIPr4FPBAPri+IWJJoMcchy38TagW9aqxQNYrrgN7ToX+wqM6teG00PKypocgU+ifAvHziXpI3n6ObDZ2jO9P28P2x3bSD115Woj+KLIclzGF5G+ichFMrNu5MQmgvBgO8VAJhWrXKtXZKsi0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rasom.in; spf=pass smtp.mailfrom=rasom.in; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rasom.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasom.in
Date: Wed, 20 Nov 2024 16:44:39 +0000
To: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com, gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
From: Cheolu Choi <ray@rasom.in>
Subject: [PATCH] staging: sm750fb: Remove unnecessary parentheses
Message-ID: <Zz4R8L7493vTJmry@rasomin>
Feedback-ID: 125224831:user:proton
X-Pm-Message-ID: 9d4c393f2b28920b1b9ee299cf8b3e9568236fdc
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Adhere to Linux kernel coding style.

Reported by checkpatch:
CHECK: Unnecessary parentheses around 'clk_gpio > 31'
CHECK: Unnecessary parentheses around 'data_gpio > 31'

Signed-off-by: Cheolu Choi <ray@rasom.in>
---
 drivers/staging/sm750fb/ddk750_swi2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750=
fb/ddk750_swi2c.c
index 0ef8d4ff2ef9..50e51d730d86 100644
--- a/drivers/staging/sm750fb/ddk750_swi2c.c
+++ b/drivers/staging/sm750fb/ddk750_swi2c.c
@@ -393,7 +393,7 @@ long sm750_sw_i2c_init(unsigned char clk_gpio, unsigned=
 char data_gpio)
 =09 * Return 0 if the GPIO pins to be used is out of range. The
 =09 * range is only from [0..63]
 =09 */
-=09if ((clk_gpio > 31) || (data_gpio > 31))
+=09if (clk_gpio > 31 || data_gpio > 31)
 =09=09return -1;
=20
 =09if (sm750_get_chip_type() =3D=3D SM750LE)
--=20
2.34.1


