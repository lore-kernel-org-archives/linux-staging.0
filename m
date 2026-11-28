Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795825379;
	b=xF/dUBj2ivALT8z/2H5TqjC+PYLNm45q0aFxSnjyb4hXeflNu/ifjhbwczjwEoROURo9
	 71n1lWUUYQypVvH8N5LawekI0S9q3lbd4ctjrUA0K5EGidzz+k/0VMDpMzjWDudc10V6d
	 MRtqYfQlwBa1Sa3P86v6KV+zk28jZZRhwEA24UxG5xDvyXj3GPZTMlzHsUPN3/VekHX1A
	 UhH4CxBKh4dOum+VZcSPbHkDQq0LfWEaTz7SSxFDvgizQ5zuDHzj0nXUjuBXncF/UCEYD
	 KG+FYvwOxp10AjJ0xVdYEjMG+kw+Sk7nDseI5i9u4Bp/aGzS5BELtAnk99RC87LEDAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795825379;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7anpvQjUPGvt3oBGi0uoBBrcqmL2b4GPFGKCoTBvYyI=;
	b=0LZ597RpDlEpAcOZoS58qz8iStHWF1qncvxlKfQZmtDJKjz9sEXZP/zJgEdUbaPsktfh
	 yB+TNV59mDN7RzfjnOhUjHcLO9tyHay0BcAJM3P5uLabc8fd012w5P7asgVznKtCCBj+U
	 0dmAv6sq/Je1xoo78ePgLJTzP2b4bK112Aeu0oeAKyVwU5cxx+7tGAFMuHZVBpm9MIE/6
	 WT6FgUBKbEBlgNnMOYdp3DCWBFtoY2RhikSLTS9YIaM/QPss8yG+QYdFyUyMq1DadvzJW
	 UXZkNYbnNmEb+mhnh9YjaAekgmNCuF9Z0DMK/pGRT8HXH7LbPdth3fSwSp7wG/xzndw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="YG/tCMIM";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69849606A31C;
	Sat, 28 Nov 2026 00:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YG/tCMIM
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795825379;
	b=bJqr2Yoeqnc4nbpoCh/zWLi6cHzr8Qf0RCJ35H1vP+AgZvk9oYfP785ZDXo+u8j0qGTc
	 wzYnRzbNABd7/QHJVnJTeCW/x8WOOuyvlg2iWsEDPaZJHmoY4TMVDaiBEQfbdqMfThwvQ
	 gVwjRhd3eo9gUsXtQ+YBUyOdD4eDd8OyLKxgGOt047fiCcd2eTe3JLpdCs/AfJlHDEcPt
	 5cUAtl7zcY1sRkb90wL905yTon6XmCwggVfERosjsGW6WcWj7x9gM0SHH0Sv/SII4iQzF
	 dO0nmheusaqnxBZf/s6oAXlFvKu0CvwAPLubwSdKxgB1qbJx3P4Zq/lg2mKvtXDmXtQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795825379;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7anpvQjUPGvt3oBGi0uoBBrcqmL2b4GPFGKCoTBvYyI=;
	b=ZgVklIS6ADE8b6ZG4EH4J46u+e18C/a1aK5ismlSPLV2CqnBoGoYJGj0GktgIyH4N2JQ
	 eyG173ar9/LQGhY9HAcypGLqIg2HMbT7aMJiL8bP9KT89vJ5cafaM0OWYpIE5Tx0JufTF
	 C6BIir7QXt1JhtQFw9Y16U2pVzkOIqT/B86t+ZUZrk00iS0oKBVrCa72c4JKh6V1xYFem
	 Zf7dMsJfy49DPVvOmTtG64soZtCSKXaUHC96FkDPRq4RzosLBRr7ZUMomQCSRYgu8lONG
	 uTmKjhmJJBA/IvWLdxR4/knwQ5Qt+Z5zBR90V6GtEanlHEZjG4xrcWoTlLP7IxImNmw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7B2831F000C1;
	Sat, 28 Nov 2026 00:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795825378;
	bh=7anpvQjUPGvt3oBGi0uoBBrcqmL2b4GPFGKCoTBvYyI=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=YG/tCMIMQaG2ipk2/awWVWijp2jNX53Lner5txaXWq4MKKkhhTzQCEDDN+Mit78ZG
	 WcafcgNK+Sdy1zGZxrTLgzVuVird7UdkwO26Rx53ZAaF2pwHAvQ5SMQNVebmFMwavn
	 FoPF0rpXcuaHXl+pccVrW2fsgaPerhP9JcGEgXI0GNhyg1UHlUFxLPfWgEtlp5+kE7
	 klFi1EKwXAQ0xXVAKelSPPlFAhxZc5HGLLD2wg97ax7xvAiqp4pfs8TXkNNczwW+rY
	 6wc2BCF1DR4+sUcyl0SIs2ICpC7GLdQ6JmVbIqTZvZGn1VEOFU2cE2bFhcyOi9A8Ie
	 6jEko81ruRxUg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0FFA04DEB5;
	Sat, 28 Nov 2026 00:22:58 +0000 (UTC)
From: Felix Huang via B4 Relay <devnull+akafelixab.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 19:24:15 -0500
Subject: [PATCH] staging: greybus: fw-management: align arguments with open
 parenthesis
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-greybus-align-v1-1-4c096948e389@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQoCIRCA4VdZ5pygQha9yrIHx0abCFucXArx3
 XPr+B3+v4FQYRK4TA0KbSz8zAPmMEG4+ZxI8XUYrLbOGHtSqdAHqyj/4JSVJxciotHHM8Jo1kK
 R37/fvPwtFe8UXvsEev8CEtL9hHEAAAA=
X-Change-ID: 20261127-greybus-align-ae6cfbb1058b
To: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, 
 Alex Elder <elder@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Felix Huang <akafelixab@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795825455; l=1034;
 i=akafelixab@gmail.com; s=20261128; h=from:subject:message-id;
 bh=bV3yrVUkPxaiyVgqWFbAJcZtTTIA3l0sqstU+Ydq4Ro=;
 b=G17OpiUeKCCH6aduwjBU/mi2O6l/6IIBdQHIYUZAo44nX+oZyGRpp7/Gk7l2R3PZ+KfVJvIE6
 ZDuXm2NfGvxB4D+AxZXByWu56WTml0ygmAp+0vO25oiXmkv4tfMZ+Jc
X-Developer-Key: i=akafelixab@gmail.com; a=ed25519;
 pk=Axl3BM1UWa+m0/AWcEhRIdIk/WY9FnY4wZkyQn64uVY=
X-Endpoint-Received: by B4 Relay for akafelixab@gmail.com/20261128 with
 auth_id=1670
X-Original-From: Felix Huang <akafelixab@gmail.com>
Reply-To: akafelixab@gmail.com
Content-Transfer-Encoding: 7bit

From: Felix Huang <akafelixab@gmail.com>

Align multi-line function call arguments with the opening parenthesis
to adhere to the Linux kernel coding style and fix checkpatch.pl
alignment checks.

Signed-off-by: Felix Huang <akafelixab@gmail.com>
---
 drivers/staging/greybus/fw-management.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
index 5d01da6b6..e20e9136c 100644
--- a/drivers/staging/greybus/fw-management.c
+++ b/drivers/staging/greybus/fw-management.c
@@ -434,7 +434,8 @@ static int fw_mgmt_ioctl(struct fw_mgmt *fw_mgmt, unsigned int cmd,
 			return -EFAULT;
 
 		ret = fw_mgmt_load_and_validate_operation(fw_mgmt,
-				intf_load.load_method, intf_load.firmware_tag);
+							  intf_load.load_method,
+							  intf_load.firmware_tag);
 		if (ret)
 			return ret;
 

---
base-commit: 8aa842d51d1a03532cc9be3ca4077c67fd73f268
change-id: 20261127-greybus-align-ae6cfbb1058b

Best regards,
--  
Felix Huang <akafelixab@gmail.com>


